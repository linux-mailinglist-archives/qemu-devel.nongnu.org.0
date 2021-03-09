Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6292B332B14
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:55:31 +0100 (CET)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJehm-0005VG-DK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeSM-0003s2-Rz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:39:36 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:51808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeSL-0003ca-0H
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:39:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BD81F7456B7;
 Tue,  9 Mar 2021 16:39:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 945967456B4; Tue,  9 Mar 2021 16:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9275C7456B8;
 Tue,  9 Mar 2021 16:39:31 +0100 (CET)
Date: Tue, 9 Mar 2021 16:39:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 3/6] hw/mips/gt64xxx: Fix typos in qemu_log_mask()
 formats
In-Reply-To: <20210309142630.728014-4-f4bug@amsat.org>
Message-ID: <5fcd9a2a-70f0-e148-e8d4-75bd3b4f752b@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-430192870-1615304371=:73634"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-430192870-1615304371=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:

> Fix the following typos:
> - GT_PCI1_CFGDATA is not a timer register but a PCI one,
> - zero-padding flag is out of the format
>
> Fixes: 641ca2bfcd5 ("hw/mips/gt64xxx_pci: Use qemu_log_mask() instead of debug printf()")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/mips/gt64xxx_pci.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 99b1690af19..8ff31380d74 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -463,7 +463,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Read-only registers, do nothing */
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "gt64120: Read-only register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -473,7 +473,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Read-only registers, do nothing */
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "gt64120: Read-only register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -515,7 +515,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Not implemented */
>         qemu_log_mask(LOG_UNIMP,
>                       "gt64120: Unimplemented device register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -528,7 +528,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Read-only registers, do nothing */
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "gt64120: Read-only register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -565,7 +565,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Not implemented */
>         qemu_log_mask(LOG_UNIMP,
>                       "gt64120: Unimplemented DMA register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -578,7 +578,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* Not implemented */
>         qemu_log_mask(LOG_UNIMP,
>                       "gt64120: Unimplemented timer register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>
> @@ -621,8 +621,8 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>     case GT_PCI1_CFGDATA:
>         /* not implemented */
>         qemu_log_mask(LOG_UNIMP,
> -                      "gt64120: Unimplemented timer register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "gt64120: Unimplemented PCI register write "
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>     case GT_PCI0_CFGADDR:
> @@ -682,7 +682,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>     default:
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "gt64120: Illegal register write "
> -                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>     }
> @@ -958,7 +958,7 @@ static uint64_t gt64120_readl(void *opaque,
>         val = s->regs[saddr];
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "gt64120: Illegal register read "
> -                      "reg:0x03%x size:%u value:0x%0*x\n",
> +                      "reg:0x%03x size:%u value:0x%0*x\n",
>                       saddr << 2, size, size << 1, val);
>         break;
>     }
>
--3866299591-430192870-1615304371=:73634--

