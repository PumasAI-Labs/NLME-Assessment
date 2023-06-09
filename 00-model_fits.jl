using CSV
using DataFramesMeta
using Pumas
using PharmaDatasets

# Read in data
# IV infusion given over 2 hours with demographic information (age, weight, sex, crcl)
pkdata = dataset("nlme_sample")

pop = read_pumas(
  pkdata;
  id=:ID,
  time=:TIME,
  amt=:AMT,
  observations=[:DV],
  cmt=:CMT,
  evid=:EVID,
  rate=:RATE
)

# 1-compartment model
model_1cmt = @model begin
  @metadata begin
    desc = "1-compartment model"
    timeu = u"hr"
  end

  @param begin
    "Clearance (L/hr)"
    tvcl ∈ RealDomain(; lower=0)
    "Volume Central Compartment (L)"
    tvvc ∈ RealDomain(; lower=0)
    """
    - ΩCL
    - ΩVc
    """
    Ω ∈ PDiagDomain(2)
    "Additive RUV"
    σ_add ∈ RealDomain(; lower=0)
    "Proportional RUV"
    σ_prop ∈ RealDomain(; lower=0)
  end

  @random begin
    η ~ MvNormal(Ω)
  end

  @pre begin
    CL = tvcl * exp(η[1])
    Vc = tvvc * exp(η[2])
  end

  @dynamics Central1

  @derived begin
    CONC := @. Central / Vc
    """
    Drug Concentration (ng/mL)
    """
    DV ~ @. Normal(CONC, sqrt(CONC^2 * σ_prop^2 + σ_add^2))
  end
end

params_1cmt = (;
  tvvc=5,
  tvcl=0.2,
  Ω=Diagonal([0.01, 0.01]),
  σ_add=0.1,
  σ_prop=0.1
)

fit_1cmt = fit(model_1cmt, pop, params_1cmt, FOCE())

# 2-compartment model
model_2cmt = @model begin
  @metadata begin
    desc = "2-compartment model"
    timeu = u"hr"
  end

  @param begin
    "Clearance (L/hr)"
    tvcl ∈ RealDomain(; lower=0)
    "Volume Central Compartment (L)"
    tvvc ∈ RealDomain(; lower=0)
    "Intercompartmental Clearance (L/hr)"
    tvq ∈ RealDomain(; lower=0)
    "Volume Peripheral Compartment (L)"
    tvvp ∈ RealDomain(; lower=0)
    """
    - ΩCL
    - ΩVc
    """
    Ω ∈ PDiagDomain(2)
    "Additive RUV"
    σ_add ∈ RealDomain(; lower=0)
    "Proportional RUV"
    σ_prop ∈ RealDomain(; lower=0)
  end

  @random begin
    η ~ MvNormal(Ω)
  end

  @pre begin
    CL = tvcl * exp(η[1])
    Vc = tvvc * exp(η[2])
    Q = tvq
    Vp = tvvp
  end

  @dynamics Central1Periph1

  @derived begin
    CONC := @. Central / Vc
    DV ~ @. Normal(CONC, sqrt(CONC^2 * σ_prop^2 + σ_add^2))
  end
end

params_2cmt = (;
  tvvc=5,
  tvcl=0.02,
  tvq=0.01,
  tvvp=10,
  Ω=Diagonal([0.01, 0.01]),
  σ_add=0.1,
  σ_prop=0.1
)

fit_2cmt = fit(model_2cmt, pop, params_2cmt, FOCE())
