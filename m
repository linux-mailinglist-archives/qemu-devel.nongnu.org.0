Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57670544E16
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:53:23 +0200 (CEST)
Received: from localhost ([::1]:33380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIbC-0006ww-96
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG7S-0006gR-Vf
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:14:31 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG7R-0002Ys-Cs
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:14:30 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3137c877092so37196017b3.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wbbhcz3Uo0bsjp0Ed3YVyYPm3yMkjIjwGUurybx4Lpk=;
 b=ks4h5BtzKJbhJNEs3n9ssvIuMOZ09P30Vhbv3j7l8g9wuk5OGxu1PTcTZC0Q3pgloh
 9R4dWlwMiB8tl6b1ktCF8MfuAmrW8sjUNFjHY6F012nUIexmMP+N6j56LmhLxt34vbNo
 lcBisijqFB7j/alek+wqYBftgfmMMPK0zOIGWIXyNlqWEbX7zyY4bUskCs6/Fw21/hcA
 Kp5gBMBpZl3u12KoPAHaE8th2iH1c81NhslE5nbkKZozTaFD1ZwEAO0uN3LAt7aJ7Aco
 z9z9YovZrGaF0OxEWEPmXc936rWkp5MPKBa9OTNkkQWDxRuZJKhhtPfSDlVP/hHA9pl2
 yOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wbbhcz3Uo0bsjp0Ed3YVyYPm3yMkjIjwGUurybx4Lpk=;
 b=D4iE9AjjjpWC2ytijBDNFDYbXG2XwFYhTUC5m80B9IcnP4zp/P4QqvkaNbptgexbag
 UcK4ZyjzemB1djGzimRMOz2KvSlnrWg7/YJfM+yV/9l0z16Is3B1unL7x8AOmnBHjY5E
 LxIgEV3npDarp/xX9A0Mg1rF8Wbc2binjzrIDI4EG0Pv3Paogzy21smhXLZfmgs7fjWS
 tZjhs3V8QkBHEkKiVvKgVh25lursLyj6lytwhoHuhn30ea2gm3W2IhDSs3J/NlZ3yKfT
 YrNfWDVinGFVwcpRo1IXSLongOTLsIL9gCatKWfZahwlbKFqjIN3sj6R+FuWM5kfNkFB
 fCVA==
X-Gm-Message-State: AOAM5318gaeBdeU3sInwakmoGQYema5enYF9/qGO3+1IcetkmbNYeJNQ
 GEDmHxHfF/TzNeQvjUqc5CNil8aXcUUEraveqJfGXg==
X-Google-Smtp-Source: ABdhPJxdXGo3JghdXDl+WmhWdTt7+98dJOR3oV4zYIjnCI68uiI/CsTUhmaLEQusjOrzhsvEN5XPfZXRDXeO9t1T2ks=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr41886972ywb.10.1654773268587; Thu, 09
 Jun 2022 04:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:14:18 +0100
Message-ID: <CAFEAcA9stboAQQqbucusU943QadekF5=w4coDqbr32TpsBrF5g@mail.gmail.com>
Subject: Re: [PATCH 44/50] lasips2: implement lasips2_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
> Move ps2_kbd_init() and ps2_mouse_init() from lasips2_initfn() to lasips2_realize.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index a7c7192c07..6849b71e5c 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -256,13 +256,17 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>      s = LASIPS2(dev);
>
>      s->irq = irq;
> +    return s;
> +}
> +
> +static void lasips2_realize(DeviceState *dev, Error **errp)
> +{
> +    LASIPS2State *s = LASIPS2(dev);
>
> -    vmstate_register(NULL, base, &vmstate_lasips2, s);
> +    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
>
>      s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
>      s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
> -
> -    return s;
>  }
>
>  static void lasips2_init(Object *obj)
> @@ -292,6 +296,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->realize = lasips2_realize;
>      device_class_set_props(dc, lasips2_properties);
>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }

This is a valid refactoring, so in that sense
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but I'd prefer it if we just broke migration compat for this machine
and converted it to use dc->vmsd rather than vmstate_register().

thanks
-- PMM

