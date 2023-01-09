Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A31662733
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErZv-0005sI-8D; Mon, 09 Jan 2023 07:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pErZq-0005oC-Vs; Mon, 09 Jan 2023 07:48:35 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pErZp-0005tY-6c; Mon, 09 Jan 2023 07:48:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C7CB4745720;
 Mon,  9 Jan 2023 13:46:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 913C8745706; Mon,  9 Jan 2023 13:46:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8FA317456E3;
 Mon,  9 Jan 2023 13:46:11 +0100 (CET)
Date: Mon, 9 Jan 2023 13:46:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 4/5] hw/sh4/r2d: Use the IEC binary prefix definitions
In-Reply-To: <20230109120154.2868-5-philmd@linaro.org>
Message-ID: <31e6a45c-3fec-f6ae-875f-b1a8ac8749e0@eik.bme.hu>
References: <20230109120154.2868-1-philmd@linaro.org>
 <20230109120154.2868-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1211703913-1673268371=:7264"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1211703913-1673268371=:7264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/sh4/r2d.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 39fc4f19d9..b3667e9b12 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -47,10 +47,10 @@
> #define FLASH_BASE 0x00000000
> #define FLASH_SIZE (16 * MiB)
>
> -#define SDRAM_BASE 0x0c000000 /* Physical location of SDRAM: Area 3 */
> -#define SDRAM_SIZE 0x04000000
> +#define SDRAM_BASE          (192 * MiB) /* Physical location of SDRAM: Area 3 */
> +#define SDRAM_SIZE          (64 * MiB)

I don't think changing these help as the docs probably have memory map 
with the hex numbers rather than sizes so it's easier to match as it is 
now.

> -#define SM501_VRAM_SIZE 0x800000
> +#define SM501_VRAM_SIZE     (8 * MiB)

This one is OK but since it's only used once in

qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);

you might as well just inline it there and remove the define which is then 
pretty clear and easier to see without needing to look up the define far 
away from its usage.

Regards,
BALATON Zoltan

> #define BOOT_PARAMS_OFFSET 0x0010000
> /* CONFIG_BOOT_LINK_OFFSET of Linux kernel */
>
--3866299591-1211703913-1673268371=:7264--

