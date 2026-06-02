# Known Issues

This page tracks recurring issues that affect AMD LLM workflows.

| Issue Title | Affected Hardware | Affected Stack | Symptoms | Workaround | Status | Source |
| --- | --- | --- | --- | --- | --- | --- |
| Wrong ROCm install path for platform family | Radeon, Ryzen APU, Instinct | ROCm-based stacks | Installation appears to complete, but the expected device is not usable | Re-check whether you followed the correct guide for Radeon, Ryzen, or generic ROCm | Officially documented | https://rocm.docs.amd.com/projects/install-on-linux/en/latest/ |
| GPU visible to host but not to app user | Radeon and Ryzen platforms | ROCm-based stacks | User-space tools fail or apps cannot access the GPU | Verify group membership and device permissions | Officially documented | https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/ |
| General hardware mention without per-SKU validation | Ryzen AI / Ryzen AI Max, Radeon | Local inference workflows | A vendor article mentions a hardware family, but exact validated SKU list is unclear | Treat as `Needs verification` until a per-SKU source or report is added | Needs verification | https://www.amd.com/en/developer/resources/technical-articles/2026/day-0-support-for-gemma-4-on-amd-processors-and-gpus.html |
