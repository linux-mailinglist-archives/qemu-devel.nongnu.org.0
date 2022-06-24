Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D4559836
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 12:52:13 +0200 (CEST)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4gv5-0007qi-A9
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 06:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gsS-0006bW-7z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:49:28 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gsQ-00064j-Ep
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 06:49:27 -0400
Received: by mail-yb1-xb32.google.com with SMTP id x38so3815765ybd.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tTgxQSojsqqrecCrzUc0iEgcyiEfOCu5J3t+FfJocXE=;
 b=AxSGl1jhhnE+CUotMbw1YWPaRtN1y08fwVy5YuZs4B6B9ekEHJ4husIFzjM8Xcxba7
 wvIz79fGifofTQyiIDQILEkXjCFdFN32MkGvQYXmS2izGb75HTMwnHHTIn/aBG8rNXwi
 e+PO4eO7sADQgwtTO22aaG8DlT+tnGG3uRJ91434DgDdYLEUgg+P4ULSJJbfqTz6F/7d
 XuUXgw2yIH/EhjoPUAqgfN7oO1aAk1/4itwyQyaBoe8cogESYOUvrwN2o2FSJ02BsA+G
 Uf3mTQCw7BQdomDmDlzPhUCmBismVhKUkoL3dQyiEyOpq8acqTb+ynfJaJF19LowvKWx
 /c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tTgxQSojsqqrecCrzUc0iEgcyiEfOCu5J3t+FfJocXE=;
 b=zsPUq3DSGZuH9E7i7FA9wYJOa09L3nv7o2I8s8zWZNmoawk7RjojQ9Mvr/QyiZITOg
 rnyZJZkMk5+rGXxYUxGR8YqHLkUIylUSEC7bcFZM1gByFH6l4nh6ORJEj1D9by+cOPux
 /hj1GEDMedoh7s4xqeSmV7Mb2+W/EHIRWCWjsVfTPK9P7cmMWPWden9V9bLcrpaYgKNs
 yEIwco6mtWaiYL1GnBl01dAhMoWyvzuytLi/ljudlxEUx8gpX/hVio7IqHBKpswepwbY
 0iJa1tTmVF0+Btq1LoSHSLY7EoO6NAG8q6I73BwHUWPschbfAkUPa6AjhiolJbY/woTE
 S25A==
X-Gm-Message-State: AJIora+739lEJ2XPyplpl3OSoRWK/wWHXEJ81av2xakOpC0y6q5qNeau
 wUr/BMnrO1AeE4GB6sotoWVJXmoLHRx6hOsPn2GThg==
X-Google-Smtp-Source: AGRyM1sUYkiGBpPdotZZsIU3TJPBkL2b1bO6wO7dkIBG9Xxvx5QFf+s/z8JmKjt1EmutWdqd7ugUvWhsQ7wI2g2TOVc=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr11404152ybk.479.1656067765358; Fri, 24
 Jun 2022 03:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:48:47 +0100
Message-ID: <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, 
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Code based on i386/pc enablement.
> The memory layout places space for 16 host bridge register regions after
> the GIC_REDIST2 in the extended memmap.
> The CFMWs are placed above the extended memmap.
>
> Only create the CEDT table if cxl=on set for the machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This seems to be missing code to advertise the new devices in the
device tree.

Somebody else had better review the ACPI changes :-)

>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> @@ -178,6 +181,7 @@ static const MemMapEntry base_memmap[] = {
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */
>      [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
> +    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */

Does this reshuffle the memory layout so that all the stuff after it
moves up ? If so, that's an incompatible change and would need
versioning somehow.

More generally, should this new addition to the machine be
versioned? What did we do for the pc machine types?

>      [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>      /* Second PCIe window */
>      [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
> @@ -1525,6 +1529,16 @@ static void create_pcie(VirtMachineState *vms)
>      }
>  }
>
> +static void create_cxl_host_reg_region(VirtMachineState *vms)
> +{
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *mr = &vms->cxl_devices_state.host_mr;
> +
> +    memory_region_init(mr, OBJECT(vms), "cxl_host_reg",
> +                       vms->memmap[VIRT_CXL_HOST].size);
> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_CXL_HOST].base, mr);
> +}

> @@ -1779,6 +1799,20 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>          memory_region_init(&ms->device_memory->mr, OBJECT(vms),
>                             "device-memory", device_memory_size);
>      }
> +
> +    if (vms->cxl_devices_state.fixed_windows) {
> +        GList *it;
> +
> +        base = ROUND_UP(base, 256 * MiB);
> +        for (it = vms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +
> +            fw->base = base;
> +            memory_region_init_io(&fw->mr, OBJECT(vms), &cfmws_ops, fw,
> +                                  "cxl-fixed-memory-region", fw->size);

Why is board model code having to init memory regions for this
device? Shouldn't the device be creating the memory regions itself
and then exposing them for the board code to map them ?

> +            base += fw->size;
> +        }
> +    }
>  }
>
>  /*
> @@ -2215,6 +2249,14 @@ static void machvirt_init(MachineState *machine)
>          memory_region_add_subregion(sysmem, machine->device_memory->base,
>                                      &machine->device_memory->mr);
>      }
> +    if (vms->cxl_devices_state.fixed_windows) {
> +        GList *it;
> +        for (it = vms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +
> +            memory_region_add_subregion(sysmem, fw->base, &fw->mr);
> +        }
> +    }
>
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>
> @@ -2241,6 +2283,7 @@ static void machvirt_init(MachineState *machine)
>      create_rtc(vms);
>
>      create_pcie(vms);
> +    create_cxl_host_reg_region(vms);
>
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> @@ -3070,6 +3113,7 @@ static void virt_instance_init(Object *obj)
>
>      vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    cxl_machine_init(obj, &vms->cxl_devices_state);
>  }
>
>  static const TypeInfo virt_machine_info = {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 15feabac63..403c9107e5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "hw/boards.h"
>  #include "hw/arm/boot.h"
>  #include "hw/block/flash.h"
> +#include "hw/cxl/cxl.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
> @@ -92,6 +93,7 @@ enum {
>  /* indices of IO regions located after the RAM */
>  enum {
>      VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
> +    VIRT_CXL_HOST,
>      VIRT_HIGH_PCIE_ECAM,
>      VIRT_HIGH_PCIE_MMIO,
>  };
> @@ -176,6 +178,7 @@ struct VirtMachineState {
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;
> +    CXLState cxl_devices_state;
>  };

I just looked at the CXLState struct. Why isn't this a device object ?

thanks
-- PMM

