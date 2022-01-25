# Precompute flags for the B matrix
@enum PrecomputeFlags begin
  LUT = 1
  FULL = 2
  TENSOR = 3
end


# Timing functions that allow for timing parts of an NFFT

mutable struct TimingStats
  pre::Float64
  conv::Float64
  fft::Float64
  apod::Float64
  conv_adjoint::Float64
  fft_adjoint::Float64
  apod_adjoint::Float64
end

TimingStats() = TimingStats(0.0,0.0,0.0,0.0,0.0,0.0,0.0)

function Base.println(t::TimingStats)
  print("Timing: ")
  @printf "pre = %.4f s apod = %.4f / %.4f s fft = %.4f / %.4f s conv = %.4f / %.4f s\n" t.pre t.apod t.apod_adjoint t.fft t.fft_adjoint t.conv t.conv_adjoint

  total = t.apod + t.fft + t.conv 
  totalAdj = t.apod_adjoint + t.fft_adjoint + t.conv_adjoint
  @printf "                       apod = %.4f / %.4f %% fft = %.4f / %.4f %% conv = %.4f / %.4f %%\n" 100*t.apod/total 100*t.apod_adjoint/totalAdj 100*t.fft/total 100*t.fft_adjoint/totalAdj 100*t.conv/total 100*t.conv_adjoint/totalAdj
  
end