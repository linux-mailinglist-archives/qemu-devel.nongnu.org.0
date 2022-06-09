Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642C544DE0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:39:55 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIOA-0006oK-A8
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG20-0001xN-49
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:08:52 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:47025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG1y-00013t-0A
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:08:51 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3137c877092so37046467b3.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGIib3qTHZCuc50MfO31ZS2l4HpnSKXdLfuKVMP4604=;
 b=yjzdD1sp7YFzYLthUryG7w0VwwNVxLuwR29g1/X3sWRL6yBX3Vxh18zurjAjSvpM7j
 jKwBfvL6LJj9QzP5XV1R59odUZKMnkJjTgDBMJBvHSubWCSm8WiK0p1fHVQMfrsINb7g
 gnybt0d9Q81IJr5zXZF4z/6DLTqco9aQ+Fs2F2xpo6umkFIBvdQVEZ7wdQHJ7oFafhIN
 PHXZSXGSvw9XVMtVqsNvh8L9bwVknr+Ksj8iHluzuDl5qlF9WL5AGENv/EVkZOmQj6oc
 XWA1H3gNCIzMaxkV/THjQCGGwx2PPbkWpDjK7YhaOzRRk6WFHR0uDlNh91iYJoO4Z+L3
 dxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGIib3qTHZCuc50MfO31ZS2l4HpnSKXdLfuKVMP4604=;
 b=QtdkPIXY/JIYMP+hcVGNkAJN0vE1eq0h4L8cqHOkyVfa1eklfvDUJiyjDUiLKGzfso
 ng8UsdGCUbv0qDKHzfB68qaCQNtd0QzUtW8m9JR2L9K+BvrLF1N1vU+ltHfNZWVN+tUY
 74AEt1/ZwcKRofXx4wjnx1YXs1MakdXRfvoCPVDZoZRAzHhxwnYwD7+3ArHcYSezsMfm
 SPEWxFXWEJ9THDQDFRtkiQeN//UdYqvPFmBfWN3qWlLwTfTyWJml1HWFKiUEqWK53Cpm
 yqcqgN/HZcoEMbcM1W7OHl9m3lT2yXWBc9XQ2xRmo8xgwh3qUtdx8dtRoijeIbTC53LI
 ZCCg==
X-Gm-Message-State: AOAM532+82GNcPY8KAUgRgM4TaolEcJLJz9Q13p/Hq1dhlz+uOiy56Sx
 X4R6dJSqo0Vsv/Lx0W9wIlYPMjEjMGyK9iW7ltOY8A==
X-Google-Smtp-Source: ABdhPJxgH2GMztVCUoCW+levSBbdsHrP6DDWcLDO77Z3JNjwzqyM9DOYhp3r+3W3pj8oB5xNCZQKG3TWG5uSQRhtnnc=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr41123543ywc.329.1654772928975; Thu, 09
 Jun 2022 04:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:08:38 +0100
Message-ID: <CAFEAcA94H+X34LD8+gm+i4uxNgLvazADbd2Dwym6phsR8ERVXA@mail.gmail.com>
Subject: Re: [PATCH 36/50] pl050: switch over from update_irq() function to
 PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Add a new pl050_init() function which initialises a qdev input gpio for handling
> incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
> set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
> to ensure that any accidental attempt to use the legacy update_irq() function will
> cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index 66f8c20d9f..fe6a281307 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -32,6 +32,8 @@ struct PL050State {
>      bool is_mouse;
>  };
>
> +#define PL050_INPUT_IRQ

> +
>  static const VMStateDescription vmstate_pl050 = {
>      .name = "pl050",
>      .version_id = 2,
> @@ -65,7 +67,7 @@ static void pl050_update_irq(PL050State *s)
>      qemu_set_irq(s->irq, level);
>  }
>
> -static void pl050_set_irq(void *opaque, int level)
> +static void pl050_set_irq(void *opaque, int n, int level)
>  {
>      PL050State *s = (PL050State *)opaque;
>
> @@ -164,10 +166,12 @@ static void pl050_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->irq);
>      if (s->is_mouse) {
> -        s->dev = ps2_mouse_init(pl050_set_irq, s);
> +        s->dev = ps2_mouse_init(NULL, NULL);
>      } else {
> -        s->dev = ps2_kbd_init(pl050_set_irq, s);
> +        s->dev = ps2_kbd_init(NULL, NULL);
>      }
> +    qdev_connect_gpio_out(DEVICE(s->dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in(dev, PL050_INPUT_IRQ));
>  }
>
>  static void pl050_keyboard_init(Object *obj)
> @@ -196,6 +200,11 @@ static const TypeInfo pl050_mouse_info = {
>      .instance_init = pl050_mouse_init,
>  };
>
> +static void pl050_init(Object *obj)
> +{
> +    qdev_init_gpio_in(DEVICE(obj), pl050_set_irq, 1);
> +}

Better to use a named GPIO input here I think, especially
since it's kind of an internal implementation detail of the device.

thanks
-- PMM

