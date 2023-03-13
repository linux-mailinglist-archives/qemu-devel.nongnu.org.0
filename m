Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493066B7BAE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjuK-0003IV-5m; Mon, 13 Mar 2023 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pbjta-0003CW-Fj; Mon, 13 Mar 2023 11:15:40 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pbjtX-0000sQ-Rf; Mon, 13 Mar 2023 11:15:29 -0400
Received: by mail-ed1-x530.google.com with SMTP id j11so50114037edq.4;
 Mon, 13 Mar 2023 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678720515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a8AiZjlSnYImiU6voMEmmw3aJiJ1GxkAA5gesDrv5S8=;
 b=AWfedV6LO+ytF2dWn8jobzlgDKTMuLK1ZmIHWBvQTqTFACCELjQrJ3C4dB6N+tjrPc
 t++LG2eSMFGqf4QBLWJZr7FHDysqP6OL7+9pRGcjItXq9/wWv4FdjV7+i1LsBAF5/9gH
 WSwbnSQRB9kBHgVei7WDA2FltzdqGJkqLA7gexYlkD8BGnKBzxKFBnHfEjfFBvyBbPK/
 VSjwRU0p2Kf1MlAvH49hKrUpLSYP1qMHg21WoU6B1lL8yRgG4MN7U5qHtqCixretbUjN
 8DN/61vgNd+IZLeYVN7I2n32dqq2R80/F5MmT2sv+mWqhKkP+kHYGBavdUiah31zC/CF
 /bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678720515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a8AiZjlSnYImiU6voMEmmw3aJiJ1GxkAA5gesDrv5S8=;
 b=YKsM2JsEeWakyXsYy28tEiqzDl+0a0BwOvnWeHQxaTyjW3tez4jz5Ic8Vibc5Vu0SC
 RWz5VOnMC+8RFz1QF79uzs4tzd9w75l4svVPljLemURA+2RwvPUQa1nnqMQ/0IM6A2QZ
 uv4AdUr+bXiN+ue9iRJkMFUauWtX96Fj1i8a3OZksJvPq2RlLna2ftq8RVDvDrUiGiZv
 Auc3YOiEMUSsq70pAQYzvbdtzqlIV9PDtWLePuzYvPC50v0yKXJJhfI8rma/fAoIYtsh
 IuqvUXUKG5QmPuRkh8BaI7zKkkZbpB0a4aO6amf78hErXw0moq1XkOfEP8cxjlJiwa1y
 WMVg==
X-Gm-Message-State: AO0yUKUexQaFJp/JoExtcfRoUk26pya42nlkg/fpi+UYiGwyFBu5zs2M
 mafDUwDphPHx4c7GIEhz7S/UJ1KbI2fr0PLny2E=
X-Google-Smtp-Source: AK7set9n3KXPI95+I7isL6TO5xaALg6sidQm2AFmyS5fbsEUsCsT9vYXpQJgLE0x+ETKI2I5jF0JuLe3obW97yHYwq4=
X-Received: by 2002:a50:9f44:0:b0:4fb:3549:a708 with SMTP id
 b62-20020a509f44000000b004fb3549a708mr3056321edf.6.1678720515070; Mon, 13 Mar
 2023 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
 <a63469d1-e163-43b2-c39c-c3b7c0a6eacc@linaro.org>
In-Reply-To: <a63469d1-e163-43b2-c39c-c3b7c0a6eacc@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 13 Mar 2023 16:15:03 +0100
Message-ID: <CABtshVR-wrjJQ1kMNRVGjJuJdg1341carpbdiM91tiwfZE_Qxg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Mon, Mar 13, 2023 at 8:53=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi,
>
> On 11/3/23 15:41, Strahinja Jankovic wrote:
> > This patch adds WDT to Allwinner-H3 and Orangepi-PC.
> > WDT is added as an overlay to the Timer module memory area.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > ---
> >   docs/system/arm/orangepi.rst  | 1 +
> >   hw/arm/Kconfig                | 1 +
> >   hw/arm/allwinner-h3.c         | 8 ++++++++
> >   include/hw/arm/allwinner-h3.h | 5 ++++-
> >   4 files changed, 14 insertions(+), 1 deletion(-)
>
>
> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> > index 69d0ad6f50..f05afddf7e 100644
> > --- a/hw/arm/allwinner-h3.c
> > +++ b/hw/arm/allwinner-h3.c
> > @@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
> >       [AW_H3_DEV_OHCI3]      =3D 0x01c1d400,
> >       [AW_H3_DEV_CCU]        =3D 0x01c20000,
> >       [AW_H3_DEV_PIT]        =3D 0x01c20c00,
> > +    [AW_H3_DEV_WDT]        =3D 0x01c20ca0,
> >       [AW_H3_DEV_UART0]      =3D 0x01c28000,
> >       [AW_H3_DEV_UART1]      =3D 0x01c28400,
> >       [AW_H3_DEV_UART2]      =3D 0x01c28800,
> > @@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
> >       object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6=
I);
> >       object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6=
I);
> >       object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6=
I);
> > +
> > +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
> >   }
> >
> >   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> > @@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev,=
 Error **errp)
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
> >                          qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SP=
I_R_TWI));
> >
> > +    /* WDT */
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
> > +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
> > +                            s->memmap[AW_H3_DEV_WDT], 1);
>
> Why do you need to overlap?
>

The WDT is part of the Timer component and it lies in the part of
memory already initialized by the AW_H3_DEV_PIT.
I saw the overlay approach used for RTC in Allwinner A10 (same issue,
in A10 both RTC and WDT are part of Timer), so I just reused it.

If there is a better way to handle it, I can update the implementation.

Best regards,
Strahinja

