Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF335A491
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:22:50 +0200 (CEST)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuqG-0001tf-Vb
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUuoy-0000tZ-Hn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:21:28 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lUuov-0001se-Lo
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:21:28 -0400
Received: by mail-qk1-x72f.google.com with SMTP id 7so6556478qka.7
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hzmajchtVFCmXOpBshjeixJ9hUel8QSTHSuBEmd6hzs=;
 b=pgBzsnENr97CpLiUAqLGPjUeSiXvYjpvpGbcod/jhz1hAQes9LPonXrsC84J1FfL1m
 gnPl7gffEPugFxDsFOrmKgbWwpnqd0CuGEIR3huWKY2MH01Q4FbOj14xVWvv/ahyHicl
 WqGQhL+BVRQd/dwDlW3STr0fZwOYq5GOdOmAk+GXpP4X9Q1vLV7YUwHmVn3MfE5j8y+K
 JSQv5EkzHXdvk/dP7x+D3mtUPx1c7sjBVwJSlLP46Y7AF7nKMMWTlc34mdXw1W0sANPi
 XxQ9M3hTWDx6jMmzB0FNK9XCmycr6O8VTR86no1YJgmlpi1rqU4K0hvLZsnRCiSecfsr
 mKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzmajchtVFCmXOpBshjeixJ9hUel8QSTHSuBEmd6hzs=;
 b=BqtHRTJdDNAQsTvxl8V4SnHxQI3By7hbXXYvagHQ0lA2AgD1B+AR+zRrwIsamR7FmP
 Uf69lf+SdolnqT0ZsAwvXxOs7EedvOK8GXk8e1NsQBsm5/Ti4+q7zxm43rNlgKlBT6lV
 dUcNYdHrerQbGW/0cEumqIMdlKtmoqpK23XRfOqSjmQyhK/lX6nVbzGOwkcMIyNiF9ez
 UKItEcicJf2En8DXdci5w8BfWZNZ7StbOnUDLbfYWkQx0Om7Jv/ZI7YBt1NOlIjFcHi3
 ErU3EU/0AwW36nTahlxYcNfPl7zi3bdF3wNZV7wVNTGg0TXATzDsw+Xkdh7pmE0TIlUR
 E16Q==
X-Gm-Message-State: AOAM531fQni6RCUAajFZTUSjoG33PcvNH+VNIsjDgHwGL9yvElNjr1Ku
 oZyDg1Xz28LLMQp2Q6SdxLNYxqPF8lUPqdiV7QJDwA==
X-Google-Smtp-Source: ABdhPJy11DFWRXOoLhsclYvRe9ps8yP+2lKydAHPxC5nxdHZW75VN5wNUk6BdKf5S5Q67DuI9Ozl6K2U1LHiOZ2P2HI=
X-Received: by 2002:a37:8c1:: with SMTP id 184mr15374733qki.472.1617988883301; 
 Fri, 09 Apr 2021 10:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
 <20210409162545.3705962-5-venture@google.com>
 <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
In-Reply-To: <01f6f4c7-9f08-45f5-3e0c-b692c77dc4a5@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Apr 2021 10:21:12 -0700
Message-ID: <CAO=notxOYxSyVDA9J-uOBio7d0PByvGLgn40GHbU-yQRpic1Jw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/i2c: add pca954x i2c-mux switch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=venture@google.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 9:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi Patrick,
>
> On 4/9/21 6:25 PM, Patrick Venture wrote:
> > The pca954x is an i2c mux, and this adds support for two variants of
> > this device: the pca9546 and pca9548.
> >
> > This device is very common on BMCs to route a different channel to each
> > PCIe i2c bus downstream from the BMC.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > ---
> >  MAINTAINERS                      |   6 +
> >  hw/i2c/Kconfig                   |   4 +
> >  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build               |   1 +
> >  hw/i2c/trace-events              |   5 +
> >  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
> >  6 files changed, 325 insertions(+)
> >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
>
> > diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> > index 09642a6dcb..8d120a25d5 100644
> > --- a/hw/i2c/Kconfig
> > +++ b/hw/i2c/Kconfig
> > @@ -28,3 +28,7 @@ config IMX_I2C
> >  config MPC_I2C
> >      bool
> >      select I2C
> > +
> > +config PCA954X
> > +    bool
> > +    select I2C
>
> Do you have a circular dependency when also using:
>
>        depends on I2C
>
> ?

I'm somewhat new to qemu -- I don't know what you mean, since I2C
doesn't depend on pca954x, I don't imagine there could be a circular
dependency.

>
> > +static void pca954x_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Pca954xState *s =3D PCA954X(dev);
> > +    Pca954xClass *c =3D PCA954X_GET_CLASS(s);
> > +    int i;
> > +
> > +    /* SMBus modules. Cannot fail. */
> > +    for (i =3D 0; i < c->nchans; i++) {
> > +        Object *obj =3D OBJECT(&s->channel[i]);
> > +        sysbus_realize(SYS_BUS_DEVICE(obj), &error_abort);
>
> No need to cast to Object:
>
>            sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);
>

Ack, will fix in v3.

> > +    }
> > +}

