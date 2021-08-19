Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5803F17B6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 13:08:05 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfu0-0008WQ-Nd
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 07:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfsc-0007jO-5z
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfsZ-00062F-2Q
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 07:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629371193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S29pzL701bY49IwgBvwgzuSzrWYMSXRHVhlTyJ9MnK4=;
 b=KUS8YP75rDQgzlrVGubnUw/Butf2cE5B/OHu7bTIfKLbtOwanD4jTjx/9KcKjyVnHTEf+K
 0HC8pRdXJk6B8F2UNH/pM4vHiW0jNLrL/f4AGKCbA/3nTcVKbHCtdnGPCWA+YBFUgj2nWF
 Vx9XcNwQGdvbaHV63P8iyX/m4Eikag0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-3AQV7e4COsynYiQH4w572g-1; Thu, 19 Aug 2021 07:06:32 -0400
X-MC-Unique: 3AQV7e4COsynYiQH4w572g-1
Received: by mail-wm1-f72.google.com with SMTP id
 11-20020a05600c024bb02902e679d663d1so1255840wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 04:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S29pzL701bY49IwgBvwgzuSzrWYMSXRHVhlTyJ9MnK4=;
 b=B912jyz4dGbNLorDm6Dvx347TW0R+Y0+fNNZKWy7Ot06PUcx9NB3lBULqTvLILa5UK
 cBNTUffIVcjkBf0DgRMGHhl/eGPF9pWo3Ta+M20ioaOznBMB2PlSb13zZVYIVvXHGGJS
 qSM7HOWqp9CiqLTvAPlSOljYk2v2vpD1ue9CbAmV63SFlRCUp20dd3Y189Mk4e9JlmPx
 ZmyQ84yjlaqc3Uhh6ATH46POL5t54mQHkao+nF9NocblzdRmXQuxvN7x7EPgD3p8MkZW
 2MtGyvysgLSWKJ10pXpH3gOBzAkVze6P1OuUhelN1uOxQsanSxY7b4u8rl+/FqCiTHyv
 ggzw==
X-Gm-Message-State: AOAM5327E94tkIgmvQNBPjaj0xg3Tr2VTtzFu9MQr/u2H5Yq3OyIZ95D
 cqaEqgUvJUV3Y0JIYlfEkx5bvkSBOn4xbM9GI8tsB/8pI+/kq/0zQkfTjJd+TRagJb9FP3EcXvD
 +YmaBsY8ZRXmrlW4=
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr3120756wrt.68.1629371190986; 
 Thu, 19 Aug 2021 04:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEhevc0ZizfK6LcUwrQMCDfgg7CoIrx7fDpHNPHfyd1AbbvGAepnhd7WFKmzsE6fYNsfppjw==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr3120714wrt.68.1629371190686; 
 Thu, 19 Aug 2021 04:06:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d8sm2715783wrv.20.2021.08.19.04.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 04:06:30 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20210812071409.492299-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <26cc841b-792a-305a-2708-b1ed11de8151@redhat.com>
Date: Thu, 19 Aug 2021 13:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812071409.492299-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 9:14 AM, Ani Sinha wrote:
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

I suppose if you replace all 'return' by 'g_assert_not_reached()'
both issues reproducers crash?

Your patch is not incorrect, and indeed fixes the issues, but
I feel we are going backward now allowing call which should
never be there in the first place.

But x86 is a Frankenstein, you simply add more band aid patches
to hide its uglyness.

Up to the maintainer I guess.

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
> 


