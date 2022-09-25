Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08635E91C9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:17:53 +0200 (CEST)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNlo-00039L-IX
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNhS-0000YP-EG; Sun, 25 Sep 2022 05:13:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNhQ-0003kx-TI; Sun, 25 Sep 2022 05:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xm3d2Hpb2MyMk28c0iF1wopnnLxsPvUP2E8Ew7hlE5k=; b=OOwZTHyK+z27HHohCXnUu9tVG8
 rCjnInPGoPmgbmkZuX25F2eQpiob7TYXyUEAynNKIB+juDsnIunf5b/hxfLWqwA/MBeKdMpi7fE5p
 0GthbgP4LJKANIbgh/W3bNvaYerBh7wBDEGLHe/wKSysVjo+xEGKkXJ5XsFm4cUhIM3pYWlk4nllT
 PpN/BpVgpYns1gTc67Km/DXbbXqGJPD6Br9skgXMAcipkCWm+5Rsgn/Hh+X7FbK+CWFO7BmNW8a04
 1e/IKSMCQH/e0Vgp5XYyb7beAMznZvS1eHUpZRWsqQlLUe1A+Jb1nbtmZJc41rqQgL1fZTRBBlXvG
 aLU8ApLlrB16aU/Bjo2o8shtRBtZTllg53riYG3Kj2KqnfBUgGA/v2rp4l0S4L/0lQPsGoJ9lh+W0
 mOmvgjGNMky24hyheNu3Jqa6Kd/9/l9zQ1ncOw9tmDi/Il6Wga53u/0yVQD2nI9UCjQc/fHBwg402
 AWhq+7WQpP1iAWGzOCn9ycn2AAv0QDln/JE0dkjJNncIa+eEZvSQLazIg2Urarev6OHZjGl132rmK
 RbIWsv+UPfy8vwFZUClPcMwLF3yAYtK9B9EkydrCqCYryTLjlN8NDVHO+u2v+YqIHPUMZ/+G+5yXJ
 KbZ3rTEhEWf1ERaBt56UL3gE8uGvCTY/GvvIpUpoo=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNfh-0006uR-4M; Sun, 25 Sep 2022 10:11:37 +0100
Message-ID: <c31b0600-6171-1a1b-3610-18bc7443a8ce@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <0b4208c52d7b5987da19d045c1ceea453c37dd0a.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <0b4208c52d7b5987da19d045c1ceea453c37dd0a.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 06/10] hw/ppc/mac.h: Move newworld specific atuff out from
 shared header
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

> Move the parts specific to and only used by mac99 out from the shared
> mac.h into mac_newworld.c where they better belong.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac.h          | 24 ------------------------
>   hw/ppc/mac_newworld.c | 19 +++++++++++++++++++
>   hw/ppc/mac_oldworld.c |  1 +
>   3 files changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index a1fa8f8e41..e97087c7e7 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -26,15 +26,8 @@
>   #ifndef PPC_MAC_H
>   #define PPC_MAC_H
>   
> -#include "qemu/units.h"
>   #include "exec/memory.h"
> -#include "hw/boards.h"
>   #include "hw/sysbus.h"
> -#include "hw/input/adb.h"
> -#include "hw/misc/mos6522.h"
> -#include "hw/pci/pci_host.h"
> -#include "hw/pci-host/uninorth.h"
> -#include "qom/object.h"
>   
>   #define NVRAM_SIZE        0x2000
>   #define PROM_FILENAME    "openbios-ppc"
> @@ -65,23 +58,6 @@
>   #define NEWWORLD_EXTING_GPIO1  0x2f
>   #define NEWWORLD_EXTING_GPIO9  0x37
>   
> -/* Core99 machine */
> -#define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
> -typedef struct Core99MachineState Core99MachineState;
> -DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
> -                         TYPE_CORE99_MACHINE)
> -
> -#define CORE99_VIA_CONFIG_CUDA     0x0
> -#define CORE99_VIA_CONFIG_PMU      0x1
> -#define CORE99_VIA_CONFIG_PMU_ADB  0x2
> -
> -struct Core99MachineState {
> -    /*< private >*/
> -    MachineState parent;
> -
> -    uint8_t via_config;
> -};
> -
>   /* Grackle PCI */
>   #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>   
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index ae90e5c353..14cc8cd6ea 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -48,10 +48,13 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/datadir.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "hw/ppc/ppc.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/ppc/mac.h"
> +#include "hw/boards.h"
> +#include "hw/pci-host/uninorth.h"
>   #include "hw/input/adb.h"
>   #include "hw/ppc/mac_dbdma.h"
>   #include "hw/pci/pci.h"
> @@ -83,6 +86,22 @@
>   #define PROM_BASE 0xfff00000
>   #define PROM_SIZE (1 * MiB)
>   
> +#define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
> +typedef struct Core99MachineState Core99MachineState;
> +DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
> +                         TYPE_CORE99_MACHINE)
> +
> +#define CORE99_VIA_CONFIG_CUDA     0x0
> +#define CORE99_VIA_CONFIG_PMU      0x1
> +#define CORE99_VIA_CONFIG_PMU_ADB  0x2
> +
> +struct Core99MachineState {
> +    /*< private >*/
> +    MachineState parent;
> +
> +    uint8_t via_config;
> +};
> +
>   static void fw_cfg_boot_set(void *opaque, const char *boot_device,
>                               Error **errp)
>   {
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index a497507f1d..f323a49d7a 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -31,6 +31,7 @@
>   #include "hw/ppc/ppc.h"
>   #include "hw/qdev-properties.h"
>   #include "mac.h"
> +#include "hw/boards.h"
>   #include "hw/input/adb.h"
>   #include "sysemu/sysemu.h"
>   #include "net/net.h"

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

