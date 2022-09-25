Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7915E91E7
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:35:42 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocO33-00016U-AS
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNrw-000141-HZ; Sun, 25 Sep 2022 05:24:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNro-000500-Ny; Sun, 25 Sep 2022 05:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uQrV+sO8knFumJt5Wo7Dy9MJX7amRTs41Tum/mfn55U=; b=q9RoG9w0yiHH5YdP2Jc8xT4ruE
 UVgztP7ihMxWWrtlu0qRjNDyfrQSxHNEsYTcY7V4WH/tkuoyljAVtZ2G+S6Dgh7MWQb1f8DBLBZLX
 8gCXnBDR1mog1mFMGpm+WBwXTkmFPPtmPImQWZRve5Zu4U+IdFtaowpIjfNhz2TG3nfD4G9aqzJhf
 LpVxHPnHlan0ZFW3VlOdGgokHOTxKOMduDEEejejvUTEjOaHLuls16KKzjejRP5rzgIW7kF5Gesmp
 DBx9ccqdbHiU1Xy0YjM5KkoLz08FbJ8hGQsGDXCA1lD4LFJLSmpxVLOG98mOY46ciwrwQQcLZitvd
 lnCA+JX8HntxuyHkfDf6IpdOrYOLgVwt3mN7aSzs9VgCcGkq6vtoV7I+SnsffNvIuvKllDQnGC+Cx
 uZAxsPRC0mC0LN5/lfLDq89I0GXxdOzSn4YirSzO+aJtE2x6uhL6ntVjKlxHc0alzyKwYYLK9yA3v
 0JmYqljaT16XouVkqxNizJsvu5RvmQSIiftQ2cmhDUNFSUqu4vD1tJk9YFeEJ+bxlJfwka6+hTpHm
 UK/gZXzEmmTb8Dgb3stZYxCgNrbY+PdlZa+YFB1juDhUwYLJ5pRRPC94FwUW5tHvo7GZzrSFXP4GO
 0VZD9Dd/MxwADjdA+tw2Ca1cbmL/4XlRmGAuKbjyc=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNq4-0006wv-NE; Sun, 25 Sep 2022 10:22:20 +0100
Message-ID: <17c6f053-a1f4-088e-8618-908ee683bdd0@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <03ca6bfb81e45d8aada8495fb17afd55da9756b5.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <03ca6bfb81e45d8aada8495fb17afd55da9756b5.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 10/10] hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

> All that is left in mac.h now belongs to the nvram emulation so rename
> it accordingly and only include it where it is really used.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   MAINTAINERS                                  |  1 +
>   hw/ide/macio.c                               |  1 -
>   hw/intc/heathrow_pic.c                       |  1 -
>   hw/intc/openpic.c                            |  1 -
>   hw/misc/macio/cuda.c                         |  1 -
>   hw/misc/macio/gpio.c                         |  1 -
>   hw/misc/macio/macio.c                        |  1 -
>   hw/misc/macio/pmu.c                          |  1 -
>   hw/nvram/mac_nvram.c                         |  2 +-
>   hw/pci-host/grackle.c                        |  1 -
>   hw/pci-host/uninorth.c                       |  1 -
>   hw/ppc/mac_newworld.c                        |  2 +-
>   hw/ppc/mac_oldworld.c                        |  1 -
>   include/hw/misc/macio/macio.h                |  2 +-
>   hw/ppc/mac.h => include/hw/nvram/mac_nvram.h | 12 ++++++------
>   15 files changed, 10 insertions(+), 19 deletions(-)
>   rename hw/ppc/mac.h => include/hw/nvram/mac_nvram.h (88%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1729c0901c..6d34e81246 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1328,6 +1328,7 @@ F: hw/nvram/mac_nvram.c
>   F: hw/input/adb*
>   F: include/hw/misc/macio/
>   F: include/hw/misc/mos6522.h
> +F: include/hw/nvram/mac_nvram.h
>   F: include/hw/ppc/mac_dbdma.h
>   F: include/hw/pci-host/uninorth.h
>   F: include/hw/input/adb*
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index 1c15c37ec5..e604466acb 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -24,7 +24,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/ppc/mac_dbdma.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> diff --git a/hw/intc/heathrow_pic.c b/hw/intc/heathrow_pic.c
> index cb97c315da..13048a2735 100644
> --- a/hw/intc/heathrow_pic.c
> +++ b/hw/intc/heathrow_pic.c
> @@ -24,7 +24,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/ppc/mac.h"
>   #include "migration/vmstate.h"
>   #include "qemu/module.h"
>   #include "hw/intc/heathrow_pic.h"
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index b0787e8ee7..c757adbe53 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -32,7 +32,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/irq.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/pci/pci.h"
>   #include "hw/ppc/openpic.h"
>   #include "hw/ppc/ppc_e500.h"
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index 1498113cfc..0d4c13319a 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -25,7 +25,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/irq.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "hw/input/adb.h"
> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
> index b1bcf830c3..c8ac5633b2 100644
> --- a/hw/misc/macio/gpio.c
> +++ b/hw/misc/macio/gpio.c
> @@ -24,7 +24,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "hw/misc/macio/macio.h"
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index eca5983a4d..782207647c 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -26,7 +26,6 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/misc/macio/cuda.h"
>   #include "hw/pci/pci.h"
>   #include "hw/ppc/mac_dbdma.h"
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 336502a84b..70562ed8d0 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -29,7 +29,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "hw/input/adb.h"
> diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
> index 11f2d31cdb..3d9ddda217 100644
> --- a/hw/nvram/mac_nvram.c
> +++ b/hw/nvram/mac_nvram.c
> @@ -25,7 +25,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/nvram/chrp_nvram.h"
> -#include "hw/ppc/mac.h"
> +#include "hw/nvram/mac_nvram.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "qemu/cutils.h"
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index 5282123004..d9c11d22e0 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -25,7 +25,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/pci/pci_host.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci/pci.h"
>   #include "hw/irq.h"
> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> index d25b62d6a5..aebd44d265 100644
> --- a/hw/pci-host/uninorth.c
> +++ b/hw/pci-host/uninorth.c
> @@ -24,7 +24,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/irq.h"
> -#include "hw/ppc/mac.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/module.h"
>   #include "hw/pci/pci.h"
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 1cb10726d3..9cec30bbd3 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -52,7 +52,7 @@
>   #include "qapi/error.h"
>   #include "hw/ppc/ppc.h"
>   #include "hw/qdev-properties.h"
> -#include "hw/ppc/mac.h"
> +#include "hw/nvram/mac_nvram.h"
>   #include "hw/boards.h"
>   #include "hw/pci-host/uninorth.h"
>   #include "hw/input/adb.h"
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index e196090f49..27d7c19f00 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -30,7 +30,6 @@
>   #include "qapi/error.h"
>   #include "hw/ppc/ppc.h"
>   #include "hw/qdev-properties.h"
> -#include "mac.h"
>   #include "hw/boards.h"
>   #include "hw/input/adb.h"
>   #include "sysemu/sysemu.h"
> diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
> index 6c05f3bfd2..aebe990270 100644
> --- a/include/hw/misc/macio/macio.h
> +++ b/include/hw/misc/macio/macio.h
> @@ -33,7 +33,7 @@
>   #include "hw/misc/macio/cuda.h"
>   #include "hw/misc/macio/gpio.h"
>   #include "hw/misc/macio/pmu.h"
> -#include "hw/ppc/mac.h"
> +#include "hw/nvram/mac_nvram.h"
>   #include "hw/ppc/mac_dbdma.h"
>   #include "hw/ppc/openpic.h"
>   #include "qom/object.h"
> diff --git a/hw/ppc/mac.h b/include/hw/nvram/mac_nvram.h
> similarity index 88%
> rename from hw/ppc/mac.h
> rename to include/hw/nvram/mac_nvram.h
> index 3c0c3cc43d..805554b2c6 100644
> --- a/hw/ppc/mac.h
> +++ b/include/hw/nvram/mac_nvram.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU PowerMac emulation shared definitions and prototypes
> + * PowerMac NVRAM emulation
>    *
>    * Copyright (c) 2004-2007 Fabrice Bellard
>    * Copyright (c) 2007 Jocelyn Mayer
> @@ -23,13 +23,12 @@
>    * THE SOFTWARE.
>    */
>   
> -#ifndef PPC_MAC_H
> -#define PPC_MAC_H
> +#ifndef MAC_NVRAM_H
> +#define MAC_NVRAM_H
>   
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   
> -/* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
>   
> @@ -45,5 +44,6 @@ struct MacIONVRAMState {
>       uint8_t *data;
>   };
>   
> -void pmac_format_nvram_partition (MacIONVRAMState *nvr, int len);
> -#endif /* PPC_MAC_H */
> +void pmac_format_nvram_partition(MacIONVRAMState *nvr, int len);
> +
> +#endif /* MAC_NVRAM_H */

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

