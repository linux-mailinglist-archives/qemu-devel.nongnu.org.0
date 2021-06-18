Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897C63AC092
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 03:34:12 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu3Od-0001hR-Jc
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 21:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Nd-0000iN-As; Thu, 17 Jun 2021 21:33:09 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Na-00044A-Fp; Thu, 17 Jun 2021 21:33:09 -0400
Received: by mail-io1-xd36.google.com with SMTP id f10so1392478iok.6;
 Thu, 17 Jun 2021 18:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdPcNhtAUavYp7VAA7LbLvuIHP++3IPugdSDG6OIUuc=;
 b=CzIFgTcWGTLsFHE6Xm3/j9Av4V3xUHdEyHdz2zQk06lqnwZaJWFMU3A8qJ088lRsdA
 HbQpeG716eN6uP1XBbqw2Kl343l8nqhQI4Kay4W1vbaO1ckbQ1nifXMGavD503FMq6Hf
 Quo0/RRZtV+FB3ag1AmrgH2ugNOKZpgCBbw/6exxtHswTLj3knXudyS8sTpR3hU/E9yP
 s81Gre4Guwep7rhVstY4Bt/Cyrt9nXZQxVqTYNep2p49f7ZXMysPFrH1+DK/ujzMBg/x
 sClpnj455o++wAxHe+JoC3OQg+3LfaYkdXU8Q3dtLoAS+X9k9ZLwYgn0EHeAFHIAnL5P
 Mmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdPcNhtAUavYp7VAA7LbLvuIHP++3IPugdSDG6OIUuc=;
 b=WKuhD7S7uV3Rk1CgaK5fA5Gc/Hnby9TiZbE+6/Gcp5mBddH+y5tEpDQKBtbUl7/f+p
 oFF4r8jo5MrlPmHH184u1FviTKUDPNDfuGimSYvUAIvP26PaFqbo7gLX8Bndcs9cdS1O
 wn46KqaVYXC1axzEdKv9+6do9AfX0ztb4e815CQ+L5yUjePAmWruhdqeI37iTq5apF/T
 LCKXSZXPhGngeDkCtPyYiZKhtFS5uWzVfkDJUJFMjyWlZjss/bmlo7aqYxFThOnhyBsq
 8i8GvbAlbsvg9SujI2SAQafLzkPKbOFujWyNzSSzBvtbYf7KtKpiAz1c6fSeDsAByCa8
 PMoA==
X-Gm-Message-State: AOAM5310BLEgXelVm/hpkKYp62aH1Sc5xNPGNpTtFmOzrkSy4kUm5WLa
 j8boVZKaMkBSraK+vbjbx9JgiGFuGYJAq7LRf4s=
X-Google-Smtp-Source: ABdhPJywYtqkeqnjrWRXYA1FF+E5UEytmmlgoteBJTF54R2y1HM2VnKZh6clVjHxf9eyj7ryuT/fk1cGam2HSKEDJOM=
X-Received: by 2002:a02:8784:: with SMTP id t4mr969497jai.26.1623979985009;
 Thu, 17 Jun 2021 18:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210617165647.2575955-1-erdnaxe@crans.org>
 <20210617165647.2575955-5-erdnaxe@crans.org>
In-Reply-To: <20210617165647.2575955-5-erdnaxe@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 11:32:38 +1000
Message-ID: <CAKmqyKMUNEahkv_x9GFaq5sb-K43vXiweWBqHNf6yVR6Buh-tg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] tests/boot-serial-test: Add STM32VLDISCOVERY board
 testcase
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 2:56 AM Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> New mini-kernel test for STM32VLDISCOVERY USART1.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/qtest/boot-serial-test.c | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index d40adddafa..96849cec91 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -94,6 +94,41 @@ static const uint8_t kernel_nrf51[] = {
>      0x1c, 0x25, 0x00, 0x40                  /* 0x4000251c = UART TXD */
>  };
>
> +static const uint8_t kernel_stm32vldiscovery[] = {
> +    0x00, 0x00, 0x00, 0x00,                 /* Stack top address */
> +    0x1d, 0x00, 0x00, 0x00,                 /* Reset handler address */
> +    0x00, 0x00, 0x00, 0x00,                 /* NMI */
> +    0x00, 0x00, 0x00, 0x00,                 /* Hard fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Memory management fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Bus fault */
> +    0x00, 0x00, 0x00, 0x00,                 /* Usage fault */
> +    0x0b, 0x4b,                             /* ldr  r3, [pc, #44] Get RCC */
> +    0x44, 0xf2, 0x04, 0x02,                 /* movw r2, #16388 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x0a, 0x4b,                             /* ldr  r3, [pc, #40] Get GPIOA */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x22, 0xf0, 0xf0, 0x02,                 /* bic  r2, r2, #240 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x1a, 0x68,                             /* ldr  r2, [r3] */
> +    0x42, 0xf0, 0xb0, 0x02,                 /* orr  r2, r2, #176 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x07, 0x4b,                             /* ldr  r3, [pc, #26] Get BAUD */
> +    0x45, 0x22,                             /* movs r2, #69 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x06, 0x4b,                             /* ldr  r3, [pc, #24] Get ENABLE */
> +    0x42, 0xf2, 0x08, 0x02,                 /* movw r2, #8200 */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0x05, 0x4b,                             /* ldr  r3, [pc, #20] Get TXD */
> +    0x54, 0x22,                             /* movs r2, 'T' */
> +    0x1a, 0x60,                             /* str  r2, [r3] */
> +    0xfe, 0xe7,                             /* b    . */
> +    0x18, 0x10, 0x02, 0x40,                 /* 0x40021018 = RCC */
> +    0x04, 0x08, 0x01, 0x40,                 /* 0x40010804 = GPIOA */
> +    0x08, 0x38, 0x01, 0x40,                 /* 0x40013808 = USART1 BAUD */
> +    0x0c, 0x38, 0x01, 0x40,                 /* 0x4001380c = USART1 ENABLE */
> +    0x04, 0x38, 0x01, 0x40                  /* 0x40013804 = USART1 TXD */
> +};
> +
>  typedef struct testdef {
>      const char *arch;       /* Target architecture */
>      const char *machine;    /* Name of the machine */
> @@ -144,6 +179,8 @@ static testdef_t tests[] = {
>      { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
>        kernel_aarch64 },
>      { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
> +    { "arm", "stm32vldiscovery", "", "T",
> +      sizeof(kernel_stm32vldiscovery), kernel_stm32vldiscovery },
>
>      { NULL }
>  };
> --
> 2.25.1
>

