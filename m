Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EA5657A2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:46:04 +0200 (CEST)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MOq-0001bY-2I
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lt3-0006EP-Fu
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:13:13 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lt1-0001aj-HG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:13:13 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c86fe1dddso34225667b3.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSSXv2GOnwa3fwGxpHk6zrjPE8keTcYvcStfpJXPqE4=;
 b=LLPeKOvQQuJ5Yb704tOZJ9+n5Q1bNnmqGOUVx64Paep5ZC1hqWAj/iAhitI7lrnlBj
 N9lKPgHE4hKZl3fOH/pvy/tEeSdtR3TgAZTfxUtPeW4jEwRDINGovmiWEC5h3KtxPxGQ
 snROSSQ2HYu7StpmYOc+UVbs08ZuF/c/l/7wieUvEGo0i7jNIbkVB6tXXyHXZJLYN1J8
 k5xVbraUovaA1uP36WgUbIDQ3fv5TNsEEEBAf+rc3D3bvD/0OP2tVE+VoHwiJGHiTyOs
 1j0u0+6H+MjO2rHvfBbUA03gF46BdmolPwR5M34hPckapdnEKRjX/3SRqEsIPMSCTxaX
 4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSSXv2GOnwa3fwGxpHk6zrjPE8keTcYvcStfpJXPqE4=;
 b=6mE3XfvVOxBDMZVZE/9GzXw3gFVYEg2DvBVNVxswSLfU3HiwSZip0lbfeeT9rtNjNW
 dXX/SkxegwGxhFFSuyYVdyqQJ4bbrxQexiKZckzW24NFih/O4Z49FjGEz3BOjwQQtNYf
 EOcO/kBBVUWmcMn+6VrkFrRBcrYlY1aDtFz1eq/afbmjobHvJPhWiy7b/pIttb9bV/oK
 w+nm6Ba7e3HfHM4RYkt5AzJiT1xUPc6vDzj+alNiPH8qkpzUJLPAHMZwJIk+/qrfMEGh
 8WAlCEuw2AY/wnhoAu+4PNX/1ChJMFQ/ZcIkUrBzpYrgDiEBJNxhSpsJVYWPM+l+Q57o
 g6/Q==
X-Gm-Message-State: AJIora/uegLPaUlTlOxuPCBDXkg/l6tRprj/6ASIIshsKZpq9vNNPXlb
 9J2kTv6Is1XSMLkZAM2FJ4sHndcXot7jwBjeaNTdqw==
X-Google-Smtp-Source: AGRyM1u7qL9maZAxVe+jK0WN/UGV/qk8Y/hif+PBjgSs4YUrFsYdtNUFsCmKpod+NSoeID9zt22ll6uPgcl5NgoJUU4=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34074213ywd.347.1656940390402; Mon, 04
 Jul 2022 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:12:59 +0100
Message-ID: <CAFEAcA9SV8B5at9G2wLScgANQanQnBR=QtRGTcVviOTcBRA7JA@mail.gmail.com>
Subject: Re: [PATCH 02/40] pl050: rename pl050_keyboard_init() to
 pl050_kbd_init()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is for consistency with all of the other devices that use the PS2 keyboard
> device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index c7980b6ed7..8e32b8ed46 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
>                            qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
>  }
>
> -static void pl050_keyboard_init(Object *obj)
> +static void pl050_kbd_init(Object *obj)
>  {
>      PL050State *s = PL050(obj);
>
> @@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
>  static const TypeInfo pl050_kbd_info = {
>      .name          = "pl050_keyboard",
>      .parent        = TYPE_PL050,
> -    .instance_init = pl050_keyboard_init,
> +    .instance_init = pl050_kbd_init,
>  };

It's a static function so the name doesn't matter much, but
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

