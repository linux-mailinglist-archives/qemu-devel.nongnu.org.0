Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C987363592C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 11:08:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxmff-0001kh-BK; Wed, 23 Nov 2022 05:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxmfL-0001kR-RU
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:07:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxmfJ-00005M-3P
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:07:38 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso923161wms.4
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2N+3TxG7BGI316pY7xRIRVeHCikKBaRpMyz1J//BwAk=;
 b=LYV93/Fo7Ro2Y0DTGGxk0Ieiao+M5Ceepm1SSV2A6xKuyYiOMBYX1PKnV4gC/LfIT8
 T9tbhmwG+dXFnW5v/gUUBdilu+PX69MFGBG4XgZpto4tHSoayifHEMxZ2RsEoaI6323x
 MaZTqD5wkYvfYRPRKdramOKTA1AHu8+jthtHaJL8Qlq3wyxdH7FCNoPfRzlrsRV4yujX
 WOpK6D046cwqlXaezoBXfYczl+ypt/maKZhBIQj3mWyjlkoRTKzuYWNBoH0codHkekGO
 iRO9BhXpFStDxjne8Y3eaPCorhxJPaRwTwWFGVcR3MEZerPna8GmbKQ+YF2CavkkEv3R
 L8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2N+3TxG7BGI316pY7xRIRVeHCikKBaRpMyz1J//BwAk=;
 b=NmvfEpGgw+jzxb3xY3AlOfrjE3UOPRaun5n6/wTzY0DgOAEp8BPwxjXhpWn00tuq+S
 /TmMlZYOb995AMG2lutVVB1GvDY0gjjzkTQe1Dy5uU5UD16LTMKO/qL4mevF+/x+Ap6I
 vECgYwU7xPd5defxWRAjKsg4+mGGNENdcEfP/RlsDCDpiPNk+7H7e/tbxByekZsgS5ok
 h6kiaehKiKCeu084iY9PzxWOejaFfy5ZKTvSRc6QDiNYC8YxM2iF5YMUnYh9ZDWLa0yU
 XvVgoK6xN44R1CBbZjSPPe248WyBp5VE0GXLWkuXciOEKQHoCCW+FMuMkkNXb4/RFUgr
 Z0DA==
X-Gm-Message-State: ANoB5pmGPI9cIB9Z+/UuP+smCT70OdPSUBHmAaBPbxNQN1lofEO4NOOO
 fQq+xIVxl+ebshLQSfFfXyRrpg==
X-Google-Smtp-Source: AA0mqf4wi8EXujl+1QhJIwsoVZZG6w34ML4rr0S6KeWZYY82bGIc52Pe12nkp0GDir7Rs6m6YB64bg==
X-Received: by 2002:a1c:e917:0:b0:3cf:681a:43e1 with SMTP id
 q23-20020a1ce917000000b003cf681a43e1mr6206537wmc.126.1669198055030; 
 Wed, 23 Nov 2022 02:07:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u12-20020adfdb8c000000b002367ad808a9sm15998194wri.30.2022.11.23.02.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:07:34 -0800 (PST)
Message-ID: <b62401b2-3a12-e89d-6953-b40dd170b4ba@linaro.org>
Date: Wed, 23 Nov 2022 11:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2] hw/loongarch: Add cfi01 pflash device
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221123012301.1258800-1-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221123012301.1258800-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/11/22 02:23, Xiaojuan Yang wrote:
> Add cfi01 pflash device for LoongArch virt machine
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |  1 +
>   hw/loongarch/acpi-build.c   | 18 +++++++++
>   hw/loongarch/virt.c         | 80 ++++++++++++++++++++++++++++++++++++-
>   include/hw/loongarch/virt.h |  5 +++
>   4 files changed, 103 insertions(+), 1 deletion(-)

>   static void fdt_add_rtc_node(LoongArchMachineState *lams)
>   {
> @@ -593,9 +661,17 @@ static void loongarch_firmware_init(LoongArchMachineState *lams)
>   {
>       char *filename = MACHINE(lams)->firmware;
>       char *bios_name = NULL;
> -    int bios_size;
> +    int bios_size, i;
>   
>       lams->bios_loaded = false;
> +    /* Map legacy -drive if=pflash to machine properties */
> +    for (i = 0; i < ARRAY_SIZE(lams->flash); i++) {
> +        pflash_cfi01_legacy_drive(lams->flash[i],
> +                                  drive_get(IF_PFLASH, 0, i));

My understanding is we shouldn't use pflash_cfi01_legacy_drive()
anymore, besides I don't think you requires it (for the machine
property).

(Cc'ing Markus for commit 2d731dbd5e).

This is unfortunate we let the sbsa-ref and riscv-virt machines
use it.

> +    }
> +
> +    virt_flash_map(lams, get_system_memory());
> +
>       if (filename) {
>           bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
>           if (!bios_name) {
> @@ -779,6 +855,7 @@ static void loongarch_init(MachineState *machine)
>               loongarch_direct_kernel_boot(lams);
>           }
>       }
> +    fdt_add_flash_node(lams);
>       /* register reset function */
>       for (i = 0; i < machine->smp.cpus; i++) {
>           lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
> @@ -838,6 +915,7 @@ static void loongarch_machine_initfn(Object *obj)
>       lams->acpi = ON_OFF_AUTO_AUTO;
>       lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>       lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    virt_flash_create(lams);
>   }
>   
>   static bool memhp_type_supported(DeviceState *dev)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 45c383f5a7..94afc92850 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -12,6 +12,7 @@
>   #include "hw/boards.h"
>   #include "qemu/queue.h"
>   #include "hw/intc/loongarch_ipi.h"
> +#include "hw/block/flash.h"
>   
>   #define LOONGARCH_MAX_VCPUS     4
>   
> @@ -20,6 +21,9 @@
>   #define VIRT_FWCFG_BASE         0x1e020000UL
>   #define VIRT_BIOS_BASE          0x1c000000UL
>   #define VIRT_BIOS_SIZE          (4 * MiB)
> +#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
> +#define VIRT_FLASH0_BASE        (VIRT_BIOS_BASE + VIRT_BIOS_SIZE)

Do you really want the flash base addr to depend of the ROM size?
It could be safer/simpler to start with a fixed address, leaving
room for a bigger ROM if you think you might have to use one.

> +#define VIRT_FLASH0_SIZE        (4 * MiB)

The '0' index in the name is not really useful / needed.

Note, if you provide addr/size to build_flash_aml(), these
definitions can be restricted to hw/loongarch/virt.c.

>   #define VIRT_LOWMEM_BASE        0
>   #define VIRT_LOWMEM_SIZE        0x10000000
> @@ -48,6 +52,7 @@ struct LoongArchMachineState {
>       int          fdt_size;
>       DeviceState *platform_bus_dev;
>       PCIBus       *pci_bus;
> +    PFlashCFI01  *flash[1];

The array is not really needed.

>   };
>   
>   #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")


