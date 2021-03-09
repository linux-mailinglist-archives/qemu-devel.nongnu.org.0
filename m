Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADEF332B16
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:55:37 +0100 (CET)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJehs-0005rf-Fv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeU2-0006Ky-FB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:41:18 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeTy-0004Tt-4H
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:41:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0FB7E746334;
 Tue,  9 Mar 2021 16:41:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DB4CC74632F; Tue,  9 Mar 2021 16:41:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D992C7462E1;
 Tue,  9 Mar 2021 16:41:11 +0100 (CET)
Date: Tue, 9 Mar 2021 16:41:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 4/6] hw/mips/gt64xxx: Rename trace events related
 to interrupt registers
In-Reply-To: <20210309142630.728014-5-f4bug@amsat.org>
Message-ID: <c68de91-dc5e-2d9a-31c4-8011e5f154c@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-245842815-1615304471=:73634"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-245842815-1615304471=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> We want to trace all register accesses. First rename the current
> gt64120_read / gt64120_write events with '_intreg' suffix, as they
> are restricted to interrupt registers.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/mips/gt64xxx_pci.c | 16 ++++++++--------
> hw/mips/trace-events  |  4 ++--
> 2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 8ff31380d74..9a12d00d1e1 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -642,19 +642,19 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>         /* not really implemented */
>         s->regs[saddr] = ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
>         s->regs[saddr] |= !!(s->regs[saddr] & 0xfffffffe);
> -        trace_gt64120_write("INTRCAUSE", size, val);
> +        trace_gt64120_write_intreg("INTRCAUSE", size, val);
>         break;
>     case GT_INTRMASK:
>         s->regs[saddr] = val & 0x3c3ffffe;
> -        trace_gt64120_write("INTRMASK", size, val);
> +        trace_gt64120_write_intreg("INTRMASK", size, val);
>         break;
>     case GT_PCI0_ICMASK:
>         s->regs[saddr] = val & 0x03fffffe;
> -        trace_gt64120_write("ICMASK", size, val);
> +        trace_gt64120_write_intreg("ICMASK", size, val);
>         break;
>     case GT_PCI0_SERR0MASK:
>         s->regs[saddr] = val & 0x0000003f;
> -        trace_gt64120_write("SERR0MASK", size, val);
> +        trace_gt64120_write_intreg("SERR0MASK", size, val);
>         break;
>
>     /* Reserved when only PCI_0 is configured. */
> @@ -929,19 +929,19 @@ static uint64_t gt64120_readl(void *opaque,
>     /* Interrupts */
>     case GT_INTRCAUSE:
>         val = s->regs[saddr];
> -        trace_gt64120_read("INTRCAUSE", size, val);
> +        trace_gt64120_read_intreg("INTRCAUSE", size, val);
>         break;
>     case GT_INTRMASK:
>         val = s->regs[saddr];
> -        trace_gt64120_read("INTRMASK", size, val);
> +        trace_gt64120_read_intreg("INTRMASK", size, val);
>         break;
>     case GT_PCI0_ICMASK:
>         val = s->regs[saddr];
> -        trace_gt64120_read("ICMASK", size, val);
> +        trace_gt64120_read_intreg("ICMASK", size, val);
>         break;
>     case GT_PCI0_SERR0MASK:
>         val = s->regs[saddr];
> -        trace_gt64120_read("SERR0MASK", size, val);
> +        trace_gt64120_read_intreg("SERR0MASK", size, val);
>         break;
>
>     /* Reserved when only PCI_0 is configured. */
> diff --git a/hw/mips/trace-events b/hw/mips/trace-events
> index 915139d9811..b7e934c3933 100644
> --- a/hw/mips/trace-events
> +++ b/hw/mips/trace-events
> @@ -1,4 +1,4 @@
> # gt64xxx_pci.c
> -gt64120_read(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
> -gt64120_write(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
> +gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
> +gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
> gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
>
--3866299591-245842815-1615304471=:73634--

