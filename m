Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1065E91E1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:29:37 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNxA-0005T5-2o
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNqu-0008F8-7L; Sun, 25 Sep 2022 05:23:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNqs-0004vU-ED; Sun, 25 Sep 2022 05:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t472SNhxv6uKViDBMDvDTyED/2bBz4I0uGCqMVl8xlg=; b=pdw9k5+EYJTIBqTGlb9znbbyNW
 SMNT2PRFZe01T+M0ZudWeowZFKWt7mCADirKwc4/qrcd194+x+RS2Lc/C1fP6ndcb+5lMRr3TiRt+
 AoC9WJq5x8K/ElGsq5l/Sos9z8k2Z9DdqO6Gb0jWPIhLtynaGt1gKxh7z+NPfbON0ZMpuu8NTWi5K
 cT+Y2bv1drppEuKk8NmHv9ytt+Bd6fgQEG8htd/xd9l+07ldk+VmZBLfqTMMgHSFCjos8m84Madvp
 Qa/oqlg3PPaeW2GczQYIeY4t1wfxnryzSGeGe/QguW5vceY9lflOZVqqt5h/62HjAxpLeNJ9U6OoV
 6j/dpB7w0npSRl6M0Nx8h1HqN4erh1u+OLdfB7gA6VQz55EdTzDCi+F9Ns0lAJ5pC23T8Db968UvC
 Gq+TPbw2k56K558qAOpv6mnaypkOKGbbRicO4dkAhs6uU251DwCDiSJP3BlsfUXCMaIjAomXHwPSn
 Pp46f1LhkqkWCZz+FYmYtgvML1HSLp1XOxkDSaWpjM9fnLBFpDtat4VFfuFsX97IeeXJhMu1/KSa+
 vgEgpyZkqMIRvhpSylin07+LmgdJalH9gPEhpJuPC+jXiT/nCRgqYd/3tq84oa8wKq+cZ3svo0bPf
 u4yCUmRihjHxpjv8rFjjEpgi/1nRnQwvGTXNEeGlA=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNp8-0006wd-81; Sun, 25 Sep 2022 10:21:22 +0100
Message-ID: <08563903-eaf6-4ea2-9543-10c1fdca541c@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f8554a36947fc60caf104deffc6cfa5c4f244ae5.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f8554a36947fc60caf104deffc6cfa5c4f244ae5.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/10] hw/ppc/mac.h: Move PROM and KERNEL defines to board
 code
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

> The PROM_FILENAME and KERNEL_* defines are used by mac_oldworld and
> mac_newworld but they don't have to be identical so these could be
> moved to the individual boards. The NVRAM_SIZE define is not used so
> it can be dropped. This further reduces the mac.h header.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac.h          | 6 ------
>   hw/ppc/mac_newworld.c | 4 ++++
>   hw/ppc/mac_oldworld.c | 7 ++++++-
>   3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index fe77a6c6db..3c0c3cc43d 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -29,12 +29,6 @@
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   
> -#define NVRAM_SIZE        0x2000
> -#define PROM_FILENAME    "openbios-ppc"
> -
> -#define KERNEL_LOAD_ADDR 0x01000000
> -#define KERNEL_GAP       0x00100000
> -
>   /* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 14cc8cd6ea..1cb10726d3 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -83,9 +83,13 @@
>   
>   #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
>   
> +#define PROM_FILENAME "openbios-ppc"
>   #define PROM_BASE 0xfff00000
>   #define PROM_SIZE (1 * MiB)
>   
> +#define KERNEL_LOAD_ADDR 0x01000000
> +#define KERNEL_GAP       0x00100000
> +
>   #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
>   typedef struct Core99MachineState Core99MachineState;
>   DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index a4094226bc..e196090f49 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -57,10 +57,15 @@
>   
>   #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
>   
> -#define GRACKLE_BASE 0xfec00000
> +#define PROM_FILENAME "openbios-ppc"
>   #define PROM_BASE 0xffc00000
>   #define PROM_SIZE (4 * MiB)
>   
> +#define KERNEL_LOAD_ADDR 0x01000000
> +#define KERNEL_GAP       0x00100000
> +
> +#define GRACKLE_BASE 0xfec00000
> +
>   static void fw_cfg_boot_set(void *opaque, const char *boot_device,
>                               Error **errp)
>   {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

