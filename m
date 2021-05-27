Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65861392ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 11:29:05 +0200 (CEST)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmCK2-00023r-Pi
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 05:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCJF-0001BK-Rb
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:28:09 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCJE-0002ji-54
 for qemu-devel@nongnu.org; Thu, 27 May 2021 05:28:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t3so50746edc.7
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=107pA0QjTIX+m6t0IRQ+DHQqazt1HtFlkQYv1e+lqZE=;
 b=AQCdy68UecWyE5JdxgBqiCgWuLrj07kGsiYkHkLbt0ivMCF12ifJcOMJPSeEHtKvii
 uGvittTDL9KMhOq3k4aEpN+p+3iXgfcnQ3Y1/gimwM7AXvUYiWGHYa8URP1L+mCL1BxB
 U+0/VfJPcxI2ZUPG+xq/eO6/CL5jP/E+faKdpVW9NIq6GSy17l5MNbxa0eKO/Y8afPRv
 rJ8MrAPvmfqxsiJS1ewuvvv8kP0Mji7IVCYl0uMhp4qw4w7zqnCYchtZDJFe1YdCKNLm
 uwu6/m9CS5Afm0TfAdXMck5JWZ5o2U5coGaBloDKPU8rFvuSdved23Q158r9U/Gc/NuF
 hkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=107pA0QjTIX+m6t0IRQ+DHQqazt1HtFlkQYv1e+lqZE=;
 b=G5yR6W7GI/OFpM/i8z143YbJZYzuTIPb5n5Pvf+R+F+gaZKIa+8ckhaHNsH6qHuWdT
 3GQm1wnFbx/KhwTX+LwQxzu2zqBU4/dtz44ydipKeTFIt0ObHKWNrfRDEFMNHrVvAW/M
 ecmhnU++PAx8OJfgyZFmYdkg9K4VWOc+OespzJ8I4zeM21TUyxidCN3bfTEfksIlLoWK
 0j8HSPOpGyh/7Rklsz1ZV8pCBQv05cjqa5vqwceR6K/Xkw218bkQzryqK9jJ/mP5fF2H
 nxwd4Lf7KNoQdezIk7tq1lLCXaISiecFZPklx4uMMWM7y/LLAZD3TWkspe7nH6FnjGtB
 zZDw==
X-Gm-Message-State: AOAM531hvjALpud1sN0Y3p5bQIQpxTLVCl36vaXsn8lZUzoVRNujUkO8
 OBM9tfZqlWXIaujxmRQpwpGYIhUiwOefms82RYPA/Q==
X-Google-Smtp-Source: ABdhPJz/9Tch3EgXqeNAqq9ehQvQesR//4EPvfKmuOEJ4tMJsz3dtT3IEoyr+4sEV18KS8/xuCxF8MpUEL6W+SuqnpU=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3124478edz.146.1622107685890; 
 Thu, 27 May 2021 02:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210519200942.2223292-1-f4bug@amsat.org>
 <20210519200942.2223292-2-f4bug@amsat.org>
In-Reply-To: <20210519200942.2223292-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:27:39 +0100
Message-ID: <CAFEAcA-G2Gtd+mCAUXGtL0OJXUwTt=zFAWe0WPvkhSeiAuLnUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/usb/Kconfig: Introduce USB_CHIPIDEA symbol
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Currently the TYPE_CHIPIDEA model is only built when the IMX
> machines are built. Since it is not specific to IMX, add its
> symbol to allow other machines to use it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig     | 4 ++++
>  hw/usb/Kconfig     | 3 +++
>  hw/usb/meson.build | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..585de92f00a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -385,6 +385,7 @@ config FSL_IMX25
>      select IMX_I2C
>      select WDT_IMX2
>      select DS1338
> +    select USB_CHIPIDEA
>
>  config FSL_IMX31
>      bool
> @@ -403,6 +404,7 @@ config FSL_IMX6
>      select IMX_USBPHY
>      select WDT_IMX2
>      select SDHCI
> +    select USB_CHIPIDEA
>
>  config ASPEED_SOC
>      bool
> @@ -447,6 +449,7 @@ config FSL_IMX7
>      select PCI_EXPRESS_DESIGNWARE
>      select SDHCI
>      select UNIMP
> +    select USB_CHIPIDEA
>
>  config ARM_SMMUV3
>      bool
> @@ -460,6 +463,7 @@ config FSL_IMX6UL
>      select WDT_IMX2
>      select SDHCI
>      select UNIMP
> +    select USB_CHIPIDEA
>
>  config MICROBIT
>      bool

Missing "select USB_CHIPIDEA" in "config FSL_IMX31" ?

(Side note: is it worth moving the FSL_* config sections so
they're all next to each other? We seem to have allowed them
to become separated by some other unrelated sections...)

thanks
-- PMM

