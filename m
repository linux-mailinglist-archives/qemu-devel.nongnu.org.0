Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F864128F8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:39:05 +0200 (CEST)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRwG-0005xw-UB
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR7x-0006Mm-TD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:06 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:39015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR7w-0003M5-1O
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:05 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MEmpp-1mdlvx1tUZ-00GK6v; Mon, 20 Sep 2021 23:47:02 +0200
Subject: Re: [PATCH v4 11/20] nubus-device: add romfile property for loading
 declaration ROMs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-12-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7d33a23f-308d-1b16-1ef0-0eabd3b8acaf@vivier.eu>
Date: Mon, 20 Sep 2021 23:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K5YP88WMmpGhNRfupGRT5FTUNtV7S1Dc+xlQTMW4xdLbEt/7Tju
 q7EWv3yyhhEUNZxXfJuCJTJ6iiZJDQeIgxh5yyRTQT8KlceHWziJEe+glXSLG7BJoXNQtQg
 6R6DbRlMIas8GJCIu4Fb9BW2eDyOlsCQ9ea8TvygxvmlU9hHRsna6uQhGCM7NtbWdqNKmcp
 6VGp/Pb+BJtt6fmICrxTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JnP+Szcofyc=:GKnQQGV7M762vw/lBv6Njp
 ji0Vvs5SDA4f2/fPBWQgFVIln+6gxpp8ZJ90cdCUiW14PvVTy99OkedSMb1xQpPQg8BW2vx4B
 624VMgirkW43/rF1PC3qw89PsEqUHUZtsixsGh7HbEVFat+k8n8rFJkpHSSjkG7JimBGfqgzh
 pPF6ULvPK3tOVG49WqxqRZPPMfrQ1/QDOoQkGw+JRDDEsA44E0tRYGcKCGzbbw1Kj6R3Orfof
 9nyBPz4Gze2TYddVqOmGWP2JRQG9md689xazIe9q4lfQroi7DlCfpQeHjh8e6udt2LtfxbPUR
 E7+zzFLveX3rQhgfmriqbSIKX4p1LrIDlt4vrZI0lIFitXYmtpv5u3BJHWxyWJS5SteDfv51x
 /YA8AqStpFrSTJCPVKmJSb0GYtZWwsovGyr8rQgBoI/mvkgnCTZXEJl1YYJjGXB98gZRh4r3e
 ELhRlbLjCcM6zABkeealcbhTXYzqZBZTXbTh36gIwl1WcAgNO4Q4HVs+lAc2dlvrFHZpST3uu
 RyhZ/3DtMGIeZfmc99Vmi+QtPITwnxVNSX1DmZT7GnvWqKcsGd1r82vjAaD+eESysdFKl61y8
 tVQv9ykwu7zITJRArc3OTyl8rdT46QYyhaF8PN0/W97BqQul1Dbu86HjkyvBYh02uYSAbZlDd
 /uP9cY4F0rSbEYsfcBS3IzgQmllphfxEaMetnOKx1cjQ2x+413/t3XNNmQcq+6AsEVd/rDbpm
 AuNHJLr6CatcAns42xQX/faa5HSoD87Ng0CsLQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> The declaration ROM is located at the top-most address of the standard slot
> space.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 44 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/nubus/nubus.h |  6 ++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 9c1992ceb0..3da0db4d54 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -9,16 +9,21 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/datadir.h"
> +#include "hw/loader.h"
>  #include "hw/nubus/nubus.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  
>  
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
>      NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
>      NubusDevice *nd = NUBUS_DEVICE(dev);
> -    char *name;
> +    char *name, *path;
>      hwaddr slot_offset;
> +    int64_t size;
> +    int ret;
>  
>      /* Super */
>      slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> @@ -38,10 +43,47 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&nubus->slot_io, slot_offset,
>                                  &nd->slot_mem);
>      g_free(name);
> +
> +    /* Declaration ROM */
> +    if (nd->romfile != NULL) {
> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
> +        if (path == NULL) {
> +            path = g_strdup(nd->romfile);
> +        }
> +
> +        size = get_image_size(path);
> +        if (size < 0) {
> +            error_setg(errp, "failed to find romfile \"%s\"", nd->romfile);
> +            g_free(path);
> +            return;
> +        } else if (size == 0) {
> +            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
> +            g_free(path);
> +            return;
> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
> +            error_setg(errp, "romfile \"%s\" too large (maximum size 128K)",
> +                       nd->romfile);
> +            g_free(path);
> +            return;
> +        }
> +
> +        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
> +        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
> +                               &error_abort);
> +        ret = load_image_mr(path, &nd->decl_rom);
> +        g_free(path);
> +        if (ret < 0) {
> +            error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
> +            return;
> +        }
> +        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
> +                                    &nd->decl_rom);
> +    }
>  }
>  
>  static Property nubus_device_properties[] = {
>      DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
> +    DEFINE_PROP_STRING("romfile", NubusDevice, romfile),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 87a97516c7..0c9f50c32e 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -12,6 +12,7 @@
>  #include "hw/qdev-properties.h"
>  #include "exec/address-spaces.h"
>  #include "qom/object.h"
> +#include "qemu/units.h"
>  
>  #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
>  #define NUBUS_SUPER_SLOT_NB   0x9
> @@ -39,12 +40,17 @@ struct NubusBus {
>      uint32_t slot_available_mask;
>  };
>  
> +#define NUBUS_DECL_ROM_MAX_SIZE    (128 * KiB)
> +
>  struct NubusDevice {
>      DeviceState qdev;
>  
>      int32_t slot;
>      MemoryRegion super_slot_mem;
>      MemoryRegion slot_mem;
> +
> +    char *romfile;
> +    MemoryRegion decl_rom;
>  };
>  
>  #endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

