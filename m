Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D343F0301
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 13:48:02 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGK36-00015y-NX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 07:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGK1R-0000Mm-7L
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:46:17 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGK1O-0006Lc-UT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:46:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id nt11so2453083pjb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=L4QemT9AB7VNAoGKLifpw0O7j6lM86PHv11SHgl9CCE=;
 b=vJ7pgtmu3NHEvrEMMGBfhT3V4A7k1U3jOxgMx3kHm/kMlmSh5lNzkQyfBQdNQRicnc
 BXC3wm/dRragYHCqRx5G5OoTDjyUUud2bJDaH3D5GMwn7w0WaqOyfiuiwLFLSfRRFO0a
 HbtDqZyFLr0t4cBp+Udglr9h914q1mGpv6NsSBSVMaca+xjcroPEZkitkCfYfi1wk/wD
 lDy+shtIYL3u+m6SqIVLeOVqipNjSrFB9mRMCryxpN5OxLK00p7OylKYyY/sLtYcWwlK
 ORzyfqmEQq9nz6ufjn/chTNY5Y1wQ12l6w9ufTs8ewC2ZVmaczEVy/28Tw0yNiXF3J/l
 M/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=L4QemT9AB7VNAoGKLifpw0O7j6lM86PHv11SHgl9CCE=;
 b=nWO+k3gLXxcmcuwrjqv4bJGNY+YaRfW+UZVwHZ9cKHL+jl7magCcsMXUKNpKY+q6BV
 Xa84HhyOf+Y3Dm/cUF4CkLWglUVyk+QXwlVDxrtsOdIi3NrruCGmWRYF8jmvQnP5v11J
 OeY3IJEXlbDwAhBc3jfztDwl5zRVCVIMlNrFuI1VZeZOn/rgwIsziXvXUWTjOz9LHgVG
 6KRySfJgBUhCcqkPu3M5dBvD/qfdAGgH7HrTuVUdwnMj0pl5ayk8mAqqzEsEXIiFd6ff
 7zMzr+O67V7ukniSTwZ6t5RnWUWUXIAOimK7q6DBmRPEFBvSSE/uC+igSj+eav4vPNs0
 1AIA==
X-Gm-Message-State: AOAM530yeRUxDvTNug5qZ9CCB+ags9GSr4dciK8RbDz41Me/DHctK7+6
 PXWSG0Skmtny3zcVehKX+rwU2A==
X-Google-Smtp-Source: ABdhPJxW8ggJe4MNp9jhYIk5Wa0sy326ZrPm+x/mwFAQx0Zv+/b0tnMs40rga4IYGnQuCaBq07O9PA==
X-Received: by 2002:a17:90a:d245:: with SMTP id
 o5mr8984069pjw.57.1629287171145; 
 Wed, 18 Aug 2021 04:46:11 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.159.175])
 by smtp.googlemail.com with ESMTPSA id i1sm5166156pjs.31.2021.08.18.04.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:46:10 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 18 Aug 2021 17:16:04 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
In-Reply-To: <20210812071409.492299-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2108181716001.48434@anisinha-lenovo>
References: <20210812071409.492299-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ...

On Thu, 12 Aug 2021, Ani Sinha wrote:

> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> This brings in support for whole lot of subsystems that some targets like
> mips does not need. They are added just to satisfy symbol dependencies. This
> is ugly and should be avoided. Targets should be able to pull in just what they
> need and no more. For example, mips only needs support for PIIX4 and does not
> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> etc. This change is an effort to clean this up.
> In this change, new config variables are added for various acpi hotplug
> subsystems. Targets like mips can only enable PIIX4 support and not the rest
> of all the other modules which were being previously pulled in as a part of
> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> are not required by mips (for example, symbols specific to pci hotplug etc)
> are available to satisfy the dependencies.
>
> Currently, this change only addresses issues with mips malta targets. In future
> we might be able to clean up other targets which are similarly pulling in lot
> of unnecessary hotplug modules by enabling ACPI_X86.
>
> This change should also address issues such as the following:
> https://gitlab.com/qemu-project/qemu/-/issues/221
> https://gitlab.com/qemu-project/qemu/-/issues/193
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  configs/devices/mips-softmmu/common.mak |  5 +--
>  hw/acpi/Kconfig                         | 10 +++++
>  hw/acpi/acpi-cpu-hotplug-stub.c         | 50 +++++++++++++++++++++++++
>  hw/acpi/acpi-mem-hotplug-stub.c         | 35 +++++++++++++++++
>  hw/acpi/acpi-nvdimm-stub.c              |  8 ++++
>  hw/acpi/acpi-pci-hotplug-stub.c         | 47 +++++++++++++++++++++++
>  hw/acpi/meson.build                     | 14 +++++--
>  7 files changed, 161 insertions(+), 8 deletions(-)
>  create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
>  create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
>  create mode 100644 hw/acpi/acpi-nvdimm-stub.c
>  create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c
>
> diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
> index ea78fe7275..752b62b1e6 100644
> --- a/configs/devices/mips-softmmu/common.mak
> +++ b/configs/devices/mips-softmmu/common.mak
> @@ -18,10 +18,7 @@ CONFIG_PCSPK=y
>  CONFIG_PCKBD=y
>  CONFIG_FDC=y
>  CONFIG_ACPI=y
> -CONFIG_ACPI_X86=y
> -CONFIG_ACPI_MEMORY_HOTPLUG=y
> -CONFIG_ACPI_NVDIMM=y
> -CONFIG_ACPI_CPU_HOTPLUG=y
> +CONFIG_ACPI_PIIX4=y
>  CONFIG_APM=y
>  CONFIG_I8257=y
>  CONFIG_PIIX4=y
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index cfc4ede8d9..3b5e118c54 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -8,6 +8,8 @@ config ACPI_X86
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
>      select ACPI_HMAT
> +    select ACPI_PIIX4
> +    select ACPI_PCIHP
>
>  config ACPI_X86_ICH
>      bool
> @@ -24,6 +26,14 @@ config ACPI_NVDIMM
>      bool
>      depends on ACPI
>
> +config ACPI_PIIX4
> +    bool
> +    depends on ACPI
> +
> +config ACPI_PCIHP
> +    bool
> +    depends on ACPI
> +
>  config ACPI_HMAT
>      bool
>      depends on ACPI
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> new file mode 100644
> index 0000000000..3fc4b14c26
> --- /dev/null
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -0,0 +1,50 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/cpu_hotplug.h"
> +#include "migration/vmstate.h"
> +
> +
> +/* Following stubs are all related to ACPI cpu hotplug */
> +const VMStateDescription vmstate_cpu_hotplug;
> +
> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
> +                                CPUHotplugState *cpuhp_state,
> +                                uint16_t io_port)
> +{
> +    return;
> +}
> +
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> +                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
> +{
> +    return;
> +}
> +
> +void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
> +{
> +    return;
> +}
> +
> +void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
> +                      CPUHotplugState *cpu_st, DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
> +                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
> +                        DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_cpu_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                CPUHotplugState *cpu_st,
> +                                DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> diff --git a/hw/acpi/acpi-mem-hotplug-stub.c b/hw/acpi/acpi-mem-hotplug-stub.c
> new file mode 100644
> index 0000000000..73a076a265
> --- /dev/null
> +++ b/hw/acpi/acpi-mem-hotplug-stub.c
> @@ -0,0 +1,35 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/memory_hotplug.h"
> +#include "migration/vmstate.h"
> +
> +const VMStateDescription vmstate_memory_hotplug;
> +
> +void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
> +                              MemHotplugState *state, hwaddr io_base)
> +{
> +    return;
> +}
> +
> +void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list)
> +{
> +    return;
> +}
> +
> +void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
> +                         DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_memory_unplug_cb(MemHotplugState *mem_st,
> +                           DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_memory_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                   MemHotplugState *mem_st,
> +                                   DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> diff --git a/hw/acpi/acpi-nvdimm-stub.c b/hw/acpi/acpi-nvdimm-stub.c
> new file mode 100644
> index 0000000000..8baff9be6f
> --- /dev/null
> +++ b/hw/acpi/acpi-nvdimm-stub.c
> @@ -0,0 +1,8 @@
> +#include "qemu/osdep.h"
> +#include "hw/mem/nvdimm.h"
> +#include "hw/hotplug.h"
> +
> +void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev)
> +{
> +    return;
> +}
> diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> new file mode 100644
> index 0000000000..734e4c5986
> --- /dev/null
> +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> @@ -0,0 +1,47 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/pcihp.h"
> +#include "migration/vmstate.h"
> +
> +const VMStateDescription vmstate_acpi_pcihp_pci_status;
> +
> +void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> +                     MemoryRegion *address_space_io, bool bridges_enabled,
> +                     uint16_t io_base)
> +{
> +    return;
> +}
> +
> +void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> +                               DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                   DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> +                                 DeviceState *dev, Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                         AcpiPciHpState *s, DeviceState *dev,
> +                                         Error **errp)
> +{
> +    return;
> +}
> +
> +void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> +{
> +    return;
> +}
> +
> +bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> +{
> +    return false;
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 29f804d13e..7d8c0eb43e 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -6,16 +6,20 @@ acpi_ss.add(files(
>    'core.c',
>    'utils.c',
>  ))
> -acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
> -acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c', 'cpu_hotplug.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_false: files('acpi-cpu-hotplug-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_true: files('memory_hotplug.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_false: files('acpi-mem-hotplug-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_false: files('acpi-nvdimm-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
> -acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> @@ -23,4 +27,6 @@ acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
>  softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
>  softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
> -                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
> +                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
> +                                                  'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
> +                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c'))
> --
> 2.25.1
>
>

