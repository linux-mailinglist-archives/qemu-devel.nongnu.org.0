Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A712ABEE8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 15:41:10 +0100 (CET)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc8M1-0002FD-JV
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 09:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc83r-0000de-K9
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:22:23 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc83j-0006f9-LU
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:22:23 -0500
Received: by mail-ej1-x62a.google.com with SMTP id o9so12523978ejg.1
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ifc7tPDGaZEFSSRnHYJFa5ZhQiHy+6mT1hkV3fNAT8E=;
 b=GVhIvtDD7OX3O+d4oxGRrJQHtRqCwaNAHyN4nwEuySNrNUJAK7dj0NGx6A3mSshz/3
 +vMJ5fsbjNiJXV5NRsi3uDYd2044N93gwEy2E03ETtKAIz3NpeiA+PkgX/X7Nk4aJDCt
 0Xp9Gh7c9xbhM2tWG5CUXpxNMd5zKSi31q3CP+fogvmoy2lNgs2Os32nJxvTT6MrSWaH
 TMX2DPnO65AsCoKaVABsnn+/aU47HtO/AEwOGgRg2QhCZ0QCjiC17ZN3bmHD0dpMBb1u
 dGNRqUoNgLwtf/XHF9XiLICX69MqBLSXYaClVrfSNxS0H6I4My9WZfqjuVEdHsCcnmIT
 QZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ifc7tPDGaZEFSSRnHYJFa5ZhQiHy+6mT1hkV3fNAT8E=;
 b=Xb30dQLqcRUPVKL2gJ3MTdS1PHfuJNmdwt4ZC+A+xoaqltPIkXwvHDkmNhkrB4ir5e
 y3gXHXvjv5LbwE0H7B9qk+kbbmbxakXYBPfxCebqnBrMtsOGcoxlhMD1RvtaW8l9aU6p
 OW396Ee4iHdW2EBTA93/YYI1l8CjJ0rpXVCVoU8bEjNKPXxz0P4yEd4yX1uQS3dvJM+o
 cTvK2N0QzsbT+fPqC+ZuWv8x9opGlza/89OIfIsFDZA9KnfXjefnYskusCkFgxz3PjMR
 X0I+PNzLr1E4EQ2qQV60pPxBCwbhmCAIBRibYIz6x3uNPBTpZFDNk/4F+NDGbeojUpFz
 whKQ==
X-Gm-Message-State: AOAM531wizIBsxGERxInXO7vVnsr8tCBMBRQ2GsslULNd8EC5GdKYguW
 VnzoWOVN2y6unEHCcjyrrq00wxYrgHYBmz5S0FjVJA==
X-Google-Smtp-Source: ABdhPJzgu7TyUX3vq2ilL/zlFVHoevlvTSbXZb/Nmg7oKfSNAykI56gUfnNoKHehPof+uA5+XD9G8BH5N+fcDTQuTDs=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr15941391ejr.56.1604931732610; 
 Mon, 09 Nov 2020 06:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20201107193403.436146-1-f4bug@amsat.org>
 <20201107193403.436146-4-f4bug@amsat.org>
In-Reply-To: <20201107193403.436146-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 14:22:01 +0000
Message-ID: <CAFEAcA-DAN7_wXDLxCfzwWDMysYzQyT5WUjOQrWHZ87t9Q4QbA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 3/5] hw/arm/nseries: Remove invalid/unnecessary
 n8x0_uart_setup()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jan Kiszka <jan.kiszka@web.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 7 Nov 2020 at 19:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> omap2420_mpu_init() introduced in commit 827df9f3c5f ("Add basic
> OMAP2 chip support") takes care of creating the 3 UARTs.
>
> Then commit 58a26b477e9 ("Emulate a serial bluetooth HCI with H4+
> extensions and attach to n8x0's UART") added n8x0_uart_setup()
> which create the UART and connects it to an IRQ output,
> overwritting the existing peripheral and its IRQ connection.
> This is incorrect.
>
> Fortunately we don't need to fix this, because commit 6da68df7f9b
> ("hw/arm/nseries: Replace the bluetooth chardev with a "null"
> chardev") removed the use of this peripheral. We can simply
> remove the code.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 76fd7fe9854..6215c18d627 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -789,16 +789,6 @@ static void n8x0_cbus_setup(struct n800_s *s)
>      cbus_attach(cbus, s->tahvo =3D tahvo_init(tahvo_irq, 1));
>  }
>
> -static void n8x0_uart_setup(struct n800_s *s)
> -{
> -    Chardev *radio =3D qemu_chr_new("bt-dummy-uart", "null", NULL);
> -    /*
> -     * Note: We used to connect N8X0_BT_RESET_GPIO and N8X0_BT_WKUP_GPIO
> -     * here, but this code has been removed with the bluetooth backend.
> -     */
> -    omap_uart_attach(s->mpu->uart[BT_UART], radio);
> -}

This deletes the only use of omap_uart_attach(), so as a
follow-up patch you could remove that function entirely.

thanks
-- PMM

