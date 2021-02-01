Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9F30B0EC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:57:28 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fKB-0008Nk-6u
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fI8-00077F-Dv; Mon, 01 Feb 2021 14:55:20 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:40265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fI6-0004ja-Cd; Mon, 01 Feb 2021 14:55:20 -0500
Received: by mail-io1-xd35.google.com with SMTP id n2so18744562iom.7;
 Mon, 01 Feb 2021 11:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFgdCd4i3qm6ycc3lZFNiqhev/tXTwMUNIvl1DVBxow=;
 b=qGKOHJKkQYTJ13t1MEQLQTki0FMwz5IrUzkcu8XiKptS7oci7Tr5rntwWPbsW/FSI6
 5jGXVAwwDyQLV6woUn89R6/yKbwDEH8jTIsgPFycKdppiSNjYvuI1RqJe620G1By0usI
 Xi3WTuSW2XZKRz/8twZq+cFFEHt5h6Mb+oFhvYqOTL7fUTxRjEg8nfluTw819QT7ROca
 xbL12X5yrw8Nybp00OqDMaAUHG+h0bsl2y4JhenVtaejcXCBE9ziCQyPGlMxl9UPOVYl
 3/CL1lLa6z/WgZPpscIfZb/CvoMa5nI1ZJczsQhrp/2Yvdw32qUC/g0hR4za4b0m2Lj2
 k4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFgdCd4i3qm6ycc3lZFNiqhev/tXTwMUNIvl1DVBxow=;
 b=fRGi4HlR/vud6ax+v4pf7L9UIreI8PreJAcvuHpESbrQuMBMJGARZ7dRnuizVh16Dk
 TeGgiV9XZ3E3YikUNZTy1RMxiYx2SLF76YNa6TzK3rnAcvjF1kJDHK55jf2LJsU7pWaM
 k7JXKeRc4LKjcx+z+n3PWVGhet8EmqN0/Nqs4ZjB9tPyF3Q7WQFJ0ngd9h0HOiwC52tF
 vWJjsDHzhALN7QmF1MTZDJzymF4RKud7ydb8aR6QhyppH2rS1Uw0AJIpKzkIBWeJqMxA
 6OgnhwaeK/Cbrus0+NrH4N9/VZOJ8SYHWFxBhrb0xzStAVUpR5butzo50DxiMhlTD3yO
 +8AQ==
X-Gm-Message-State: AOAM530sLCvVCZIoxXPKtR4E1DmEOJZ7a4go2fy+3TAEXlz3A5cs0KND
 45VGFC65c25NjtKqZ+o5ddZ1D6IEQgrw+0olnYg=
X-Google-Smtp-Source: ABdhPJxXqnX9j+W9QDwsK/e38Ggv8yiyTUAGb1loils5z7d3/VzsmFM3av120A75uvplB0NQReDcVJwUF78wDJsohhU=
X-Received: by 2002:a02:634b:: with SMTP id j72mr16886851jac.106.1612209316634; 
 Mon, 01 Feb 2021 11:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
 <20210131184449.382425-2-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:54:49 -0800
Message-ID: <CAKmqyKNLSKQ6X5BjjPp1+6KsCRqnu4cVaT5hQEsftoZCF6sZkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] hw/arm/stm32f405_soc: Add missing dependency on
 OR_IRQ
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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

On Sun, Jan 31, 2021 at 10:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
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

