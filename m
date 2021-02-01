Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051CD30AADE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:18:41 +0100 (CET)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ayO-0008FT-19
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6awg-00077g-4w; Mon, 01 Feb 2021 10:16:54 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6awa-0001dF-Su; Mon, 01 Feb 2021 10:16:53 -0500
Received: by mail-io1-xd31.google.com with SMTP id u20so3606557iot.9;
 Mon, 01 Feb 2021 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Alq5OZIl9+U/IHBWXNwlGw8gVM/UVyqiUZrelU07SI8=;
 b=tjCHp5CJgJs+qaWIUR6Yy/iipMxmAAnsAlXcnvDUSd124Hq5O0D23xiyIWS3tFdhow
 EsEZvtl4M4p0rFgIHWOyZDdwS2oqVTjHiPQj/f3djxjwts4qRAB49N6c+DUq4y39CVLa
 5ha7J0xyTV/w0hyfVuaRCzZtzCKQvs+BUTcPnkb8HuRGcNn27ugCL16OiHYRvDUpfMGG
 D4koz2Nc01Ir9s+/0g67VgnZg80vqwIzQ0uHJOLV+Rz2yybM77pb9s3qmJlUzhHHgq7S
 /uYZ3gkexCFkovIUqscSRVQFXNxlJxMjVFClG1BSS/mo+qnCv/egRChhVJJPenUTTNOd
 JwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Alq5OZIl9+U/IHBWXNwlGw8gVM/UVyqiUZrelU07SI8=;
 b=aWyZDWQB/A4+KbbKm12G4f/+Gadr+Ot8HNOXrvv8fX9bONiWX087zRB2Wt/a6yPBJG
 DcMRfMYDQLGEfaZpT46Lq6pWVcl1hTdtLs2uDL/drKcZFKc4fQ17jblKYfo1dMvlOlHq
 7DchC9u3/PA9Ecd0+tHodxXD/t+rWHC1ij5EDwUntOPTKPK9PsCYa748/i+mZZpp5wvy
 XSZWez5rTNr6dizlteZZF99MRbbIhh4jPrIMpw1sMCP8we8L63DGrweamTAJth0sulUV
 EBXaFSWVdlRCknIIvrCvn1XVi/ICpIEGXH6sHAzBf0wyiY7z78lY2Ljiglc7C8k9WPAq
 /bKA==
X-Gm-Message-State: AOAM531KtuydPnCvO5HRI6g0vl28slksZ2KeaaJJAsWLqyGTwn24PMsz
 J/Otsb9DeBb1MyFPbTzhpA2bGJgtpYxwUMk5eOI=
X-Google-Smtp-Source: ABdhPJyr20fLldf41OBBeAwHwgNhQN48SXmO0mKrn4JOWNxmxKlxS+pvoYlNyIwZ4f/Oc4s9wz7FDBEqlcVN7qTVc1M=
X-Received: by 2002:a02:cbad:: with SMTP id v13mr14624551jap.26.1612192606136; 
 Mon, 01 Feb 2021 07:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-2-f4bug@amsat.org>
In-Reply-To: <20210131105918.228787-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 07:16:19 -0800
Message-ID: <CAKmqyKPPSJtTfAPKEaXt5MVrbf5r2ZyidHhzDynmS5+e14LpJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/arm/stm32f405_soc: Add missing dependency on
 OR_IRQ
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 31, 2021 at 3:00 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The STM32F405 SoC uses an OR gate on its ADC IRQs.
>
> Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: alistair@alistair23.me
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 13cc42dcc84..a320a124855 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -336,6 +336,7 @@ config STM32F205_SOC
>  config STM32F405_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F4XX_SYSCFG
>      select STM32F4XX_EXTI
>
> --
> 2.26.2
>
>

