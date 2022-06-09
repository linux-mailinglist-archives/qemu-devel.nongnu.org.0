Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254A544DF7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:44:52 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzISx-0005wQ-DW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGEs-0002Tk-EN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:22:11 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzGEq-0003pJ-HB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:22:09 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id s39so13664128ybi.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sn5gRsmHvbLD9QTGSt9nQdjQR/B45Zfvt7DYoR5SJs=;
 b=RsEU4bIGS2+98XqdbgTYLwgYyamyqjMz+OH/0XspiHGlFEwo+InynZnwMGhveq/ASK
 MF0/MbpheGYwFiINtQfm9XZlHwQe8PaEqOrIe91Lpi0wIBPynC3ci9CQixVZurRR83xK
 BxT+GfbqrW0JrZHc5ABBAwAtG3GO3x7YxnuhkFPazgXcbexIkLk7ov2/eZ6wMkW17MC1
 y0x6bwW915+zju254dOszYVjoh2tUx3E7KXtFe9H0lq420lOJ8u4yR9S/Gt0Xm9Jk2Qw
 GwpGBMewd8flY6DFO4moDmS8xIU8dyv0flsxyJ+peCo36kSTRezojroIUT81oqfvpsjL
 8mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sn5gRsmHvbLD9QTGSt9nQdjQR/B45Zfvt7DYoR5SJs=;
 b=ZNYdomglbC3K9xv2FixAtMwpE8EiJE+3bNWKGO4ImBW+XlBLIlPaSdkHB7aAV4jzxz
 V5SaWl113d5bnlTPQQrKNt6NiNeLrDIvJGKPA9MXZ9PCHxbTfPB7CzT/d/+ZQgBZUqkP
 HKhLxv7tdjZjkVloJvU4v0Kb9sUcP7Rx6zZvcbAJxMWrMXlxmwu8C9DueWmaKq9LiDG0
 ZzmEtpTswBF0i8FAjJg+DFnweYAOCnut5RDjfNukpnIBfY+k3MDfpMpVMzuyxVrfFDB1
 3uxSw2/gyzecqDfXVp3vPYhW8LVzYuLevzUSoEv1Rg3rj2MeqFf0ZXk2eDE6HaUlxQpR
 Ku7w==
X-Gm-Message-State: AOAM533iPYgJU/WZMZzzjh7RZCm+2hRdZyFzx2402a6XdDRq2j0SnZ0s
 MFikf2wTv9d1NVCSTb5uV8neovmul9WG2WKSk7+Fyg==
X-Google-Smtp-Source: ABdhPJxSqKc7fKJckycjjCYU9xI5ww7E5IlP1Te3Q//3wChDWYtupQ4VPvDTRqIqV9tK0OaZLWWRDY0fLg5B6TsGmgU=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr39013087ybr.193.1654773724148; 
 Thu, 09 Jun 2022 04:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-47-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-47-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:21:53 +0100
Message-ID: <CAFEAcA83dJAtnRskscBAk7qCXtA-xOS7LQR_uimaWgSbHuHivQ@mail.gmail.com>
Subject: Re: [PATCH 46/50] lasips2: switch over from update_irq() function to
 PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
> Add a qdev gpio input in lasips2_init() by taking the existing lasips2_port_set_irq()
> function, updating it accordingly and then renaming to lasips2_set_irq(). Use these
> new qdev gpio inputs to wire up the PS2 keyboard and mouse devices.
>
> At the same time set update_irq() and update_arg to NULL in ps2_kbd_init() and
> ps2_mouse_init() to ensure that any accidental attempt to use the legacy update_irq()
> function will cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 644cf70955..12ff95a05f 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -117,6 +117,9 @@ static const char *lasips2_write_reg_name(uint64_t addr)
>      }
>  }
>
> +#define LASIPS2_KBD_INPUT_IRQ      0
> +#define LASIPS2_MOUSE_INPUT_IRQ    1
> +
>  static void lasips2_update_irq(LASIPS2State *s)
>  {
>      trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
> @@ -237,9 +240,10 @@ static const MemoryRegionOps lasips2_reg_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -static void lasips2_port_set_irq(void *opaque, int level)
> +static void lasips2_set_irq(void *opaque, int n, int level)
>  {
> -    LASIPS2Port *port = opaque;
> +    LASIPS2State *s = LASIPS2(opaque);
> +    LASIPS2Port *port = (n ? &s->mouse : &s->kbd);
>
>      port->irq = level;
>      lasips2_update_irq(port->parent);
> @@ -263,8 +267,12 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
>
>      vmstate_register(NULL, s->base, &vmstate_lasips2, s);
>
> -    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
> -    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
> +    s->kbd.dev = ps2_kbd_init(NULL, NULL);
> +    qdev_connect_gpio_out(DEVICE(s->kbd.dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in(dev, LASIPS2_KBD_INPUT_IRQ));
> +    s->mouse.dev = ps2_mouse_init(NULL, NULL);
> +    qdev_connect_gpio_out(DEVICE(s->mouse.dev), PS2_DEVICE_IRQ,
> +                          qdev_get_gpio_in(dev, LASIPS2_MOUSE_INPUT_IRQ));
>  }
>
>  static void lasips2_init(Object *obj)
> @@ -285,6 +293,7 @@ static void lasips2_init(Object *obj)
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
>
>      qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
> +    qdev_init_gpio_in(DEVICE(obj), lasips2_set_irq, 2);
>  }

These definitely should be named GPIO inputs, as with the pl050.

Aside, if you felt like adding "QEMU interface" comments to these
devices that summarize what the various sysbus IRQs, MMIOs,
qdev GPIOs, etc do, that would be nice, and then gives you a
place to document that these GPIO lines are part of the internal
implementation rather than externally-facing. include/hw/intc/ppc-uic.h
is one example but you can find lots by grepping for "QEMU interface"
in include/hw/.

thanks
-- PMM

