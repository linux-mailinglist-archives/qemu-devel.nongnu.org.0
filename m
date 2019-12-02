Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC6710F212
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 22:20:17 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibt79-0005xM-1C
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 16:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <erosca@de.adit-jv.com>) id 1ibt4t-0004ya-JA
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:17:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <erosca@de.adit-jv.com>) id 1ibt4p-00075C-06
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:17:54 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:60596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <erosca@de.adit-jv.com>)
 id 1ibt4o-00071F-Nr
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 16:17:50 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id EA9133C0579;
 Mon,  2 Dec 2019 22:17:46 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ASiIrofYquI; Mon,  2 Dec 2019 22:17:40 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 540063C003B;
 Mon,  2 Dec 2019 22:17:40 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 2 Dec 2019 22:17:39 +0100
Date: Mon, 2 Dec 2019 22:17:37 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/7] gpiolib: Add GPIOCHIP_NAME definition
Message-ID: <20191202211737.GA27915@vmlxhi-102.adit-jv.com>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191127084253.16356-2-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 93.241.18.167
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Phil Reid <preid@electromag.com.au>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Harish Jenny K N <harish_kandiga@mentor.com>,
 linux-gpio@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>, Eugeniu Rosca <erosca@de.adit-jv.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Geert,

On Wed, Nov 27, 2019 at 09:42:47AM +0100, Geert Uytterhoeven wrote:
> The string literal "gpiochip" is used in several places.
> Add a definition for it, and use it everywhere, to make sure everything
> stays in sync.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  drivers/gpio/gpiolib-sysfs.c | 7 +++----
>  drivers/gpio/gpiolib.c       | 4 ++--
>  drivers/gpio/gpiolib.h       | 2 ++
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index ca9bc1e4803c2979..a4a759920faa48ab 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -16,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/cdev.h>
>  
> +#define GPIOCHIP_NAME	"gpiochip"

[.02$/nit] I wonder if GPIOCHIP_NAME is actually an essential
part of kernel-user contract [1-2], in which case it could
probably be moved to include/uapi/linux/gpio.h ?

Regardless:
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

[1] linux (v5.4) git grep '"gpiochip' -- tools/
tools/gpio/lsgpio.c:                    if (check_prefix(ent->d_name, "gpiochip")) {
tools/testing/selftests/gpio/gpio-mockup-chardev.c:             if (check_prefix(ent->d_name, "gpiochip")) {

[2] libgpiod (v1.4-76-g00418dfdfc8b) git grep '"gpiochip'
lib/iter.c:	return !strncmp(dir->d_name, "gpiochip", 8);
tests/mockup/gpio-mockup.c:	rv = sscanf(sysname, "gpiochip%u", &chip->num);
tools/gpioget.c:		die("gpiochip must be specified");
tools/gpiomon.c:		die("gpiochip must be specified");
tools/gpioset.c:		die("gpiochip must be specified");

-- 
Best Regards,
Eugeniu

