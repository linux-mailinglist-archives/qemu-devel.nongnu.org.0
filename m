Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B615235E45B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:52:05 +0200 (CEST)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMGi-0001mY-Cw
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMFr-00018a-FQ; Tue, 13 Apr 2021 12:51:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMFp-0001lU-5d; Tue, 13 Apr 2021 12:51:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c15so8186463wro.13;
 Tue, 13 Apr 2021 09:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X1KoVOUFjj5zWiGmyGAf/TgE5Zh0B7D5j66Xntbdx4M=;
 b=kiSvwnjgzApXhS40fuNPki0baOe5cYPO9qISDMVzKrMvoPCvHSbWpekWWb4B5mJrhr
 8nPLFOkTiR7TGVHaqxXdRMtg5kGm6j+v9kRkcr83a7o7Fk0slv5ScKp2LJ9hZyU3tquE
 OIT/D81nbtwZG5xVGRh400W4nm7NSRDYfAzDkyZHo/LjLU1EUY7RMeb1I+0LNv4HZ+XF
 0L98kxJC8kl9m6YWf6LwN4u+F0Ou/DS+ECfP2X8NPGZv+K8WtUW1H1sW4oygLlsGFico
 ffANHQj+CI6EVLmbAdg6ql56kCaSL9IYJfsHaOF0eI9IMU5dngbqynwyqKdL3tdEJ80u
 PeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1KoVOUFjj5zWiGmyGAf/TgE5Zh0B7D5j66Xntbdx4M=;
 b=sbGPMDZ3EeOfUU9yQQsgVrB/6+6wTteE+wTeW/3n/IwjseBoH4DTBq75wFIfOulrW5
 qlExASMRmqPTU66+lJAcO265l2ILBh7D0YNYAUbX3KvGonp3xq8lvgZ++jw5OFf93dsN
 6C10d9ckwfKv6CDU4tWR9LdfB2XM9tv46wqb0GkxXp49Piu2YcEuiwA9kuurRd1KWaTg
 1aQQiui84Wz5kN5qu7NgrRwFVFgvB0aJTtp82gSAhNuBvfA0aYxeH8fU5RuuYoYY+c8+
 D23wxai/AmzAfw0WwZFJd39GlWvgTEAfgJxmXi7IzdE5DJ8k4Qiddm+GOKbX3b0m6QLD
 O6RQ==
X-Gm-Message-State: AOAM533NKLDJyb7NmevNVeles0CJsMPHTQ2jsa/fG3wL8ygKp9mw0ZMC
 8wTchzrcG36q5ebKMokBsPI=
X-Google-Smtp-Source: ABdhPJzMGqm9GVNPc3TylICxhAkVvPZIk83jwEt2Yzk80xiiobt5GtVJPaCnEDWN70yPHuvVyXJzcQ==
X-Received: by 2002:adf:ba54:: with SMTP id t20mr9583417wrg.353.1618332667167; 
 Tue, 13 Apr 2021 09:51:07 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b12sm1643996wmj.1.2021.04.13.09.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:51:06 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/arm/mps2-tz: Implement AN524 memory remapping via
 machine property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210412134317.12501-1-peter.maydell@linaro.org>
 <20210412134317.12501-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d2029650-d5ab-f412-2cca-086b3666d26e@amsat.org>
Date: Tue, 13 Apr 2021 18:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412134317.12501-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/21 3:43 PM, Peter Maydell wrote:
> The AN524 FPGA image supports two memory maps, which differ
> in where the QSPI and BRAM are. In the default map, the BRAM
> is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
> map, they are the other way around.
> 
> In hardware, the initial mapping can be selected by the user
> by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
> in the board configuration file. The guest can also dynamically
> change the mapping via the SCC CFG_REG0 register.
> 
> Implement this functionality for QEMU, using a machine property
> "remap" with valid values "BRAM" and "QSPI" to allow the user to set
> the initial mapping, in the same way they can on the FPGA, and
> wiring up the bit from the SCC register to also switch the mapping.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/mps2.rst |  10 ++++
>  hw/arm/mps2-tz.c         | 106 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 115 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
> index f83b1517871..8a75beb3a08 100644
> --- a/docs/system/arm/mps2.rst
> +++ b/docs/system/arm/mps2.rst
> @@ -45,3 +45,13 @@ Differences between QEMU and real hardware:
>    flash, but only as simple ROM, so attempting to rewrite the flash
>    from the guest will fail
>  - QEMU does not model the USB controller in MPS3 boards
> +
> +Machine-specific options
> +""""""""""""""""""""""""
> +
> +The following machine-specific options are supported:
> +
> +remap
> +  Supported for ``mps3-an524`` only.
> +  Set ``BRAM``/``QSPI`` to select the initial memory mapping. The
> +  default is ``BRAM``.
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 25016e464d9..e9806779326 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -55,6 +55,7 @@
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/reset.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/char/cmsdk-apb-uart.h"
>  #include "hw/timer/cmsdk-apb-timer.h"
> @@ -72,6 +73,7 @@
>  #include "hw/core/split-irq.h"
>  #include "hw/qdev-clock.h"
>  #include "qom/object.h"
> +#include "hw/irq.h"
>  
>  #define MPS2TZ_NUMIRQ_MAX 96
>  #define MPS2TZ_RAM_MAX 5
> @@ -153,6 +155,9 @@ struct MPS2TZMachineState {
>      SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
>      Clock *sysclk;
>      Clock *s32kclk;
> +
> +    int remap;

Maybe bool, ...

> +    qemu_irq remap_irq;
>  };
>  
>  #define TYPE_MPS2TZ_MACHINE "mps2tz"
> @@ -228,6 +233,10 @@ static const RAMInfo an505_raminfo[] = { {
>      },
>  };
>  
> +/*
> + * Note that the addresses and MPC numbering here should match up
> + * with those used in remap_memory(), which can swap the BRAM and QSPI.
> + */
>  static const RAMInfo an524_raminfo[] = { {
>          .name = "bram",
>          .base = 0x00000000,
> @@ -457,6 +466,7 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
>  
>      object_initialize_child(OBJECT(mms), "scc", scc, TYPE_MPS2_SCC);
>      sccdev = DEVICE(scc);
> +    qdev_prop_set_uint32(sccdev, "scc-cfg0", mms->remap);

... and here:

       qdev_prop_set_uint32(sccdev, "scc-cfg0", mms->remap ? 1 : 0);

as remap is a bit and scc-cfg0 could have other bits set in the future.

>      qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
>      qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
>      qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
> @@ -573,6 +583,50 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
>  }
>  
> +static hwaddr boot_mem_base(MPS2TZMachineState *mms)
> +{
> +    /*
> +     * Return the canonical address of the block which will be mapped
> +     * at address 0x0 (i.e. where the vector table is).
> +     * This is usually 0, but if the AN524 alternate memory map is
> +     * enabled it will be the base address of the QSPI block.
> +     */
> +    return mms->remap ? 0x28000000 : 0;
> +}
> +
> +static void remap_memory(MPS2TZMachineState *mms, int map)
> +{
> +    /*
> +     * Remap the memory for the AN524. 'map' is the value of
> +     * SCC CFG_REG0 bit 0, i.e. 0 for the default map and 1
> +     * for the "option 1" mapping where QSPI is at address 0.
> +     *
> +     * Effectively we need to swap around the "upstream" ends of
> +     * MPC 0 and MPC 1.
> +     */
> +    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
> +    int i;
> +
> +    if (mmc->fpga_type != FPGA_AN524) {
> +        return;
> +    }
> +

This is done in the machine_reset() handler and during QDev realization,
so probably not important, but since it is reachable by an IRQ handler,
maybe it is better (thinking about code copy/pasting) to wrap this with:

       memory_region_transaction_begin();

> +    for (i = 0; i < 2; i++) {
> +        TZMPC *mpc = &mms->mpc[i];
> +        MemoryRegion *upstream = sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 1);
> +        hwaddr addr = (i ^ map) ? 0x28000000 : 0;
> +
> +        memory_region_set_address(upstream, addr);
> +    }

       memory_region_transaction_commit();

> +}
> +
> +static void remap_irq_fn(void *opaque, int n, int level)
> +{
> +    MPS2TZMachineState *mms = opaque;
> +
> +    remap_memory(mms, level);
> +}

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

