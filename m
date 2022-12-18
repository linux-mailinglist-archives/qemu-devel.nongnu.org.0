Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A0265050D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:13:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71u5-00088Y-6K; Sun, 18 Dec 2022 17:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71u1-00085A-6x; Sun, 18 Dec 2022 17:13:01 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71tz-0004mj-Gn; Sun, 18 Dec 2022 17:13:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id m18so17624820eji.5;
 Sun, 18 Dec 2022 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCQzFaovzNNP2qLepa01OuCTmhCdk8bQPYYhxVLygK0=;
 b=YJBmG4BX770jW91gxoXp4KjflhCm1UMgK/vUpx5RonB4tYuaqOG8JjKqkEg3jcRUXV
 PqMyGLqnw5UO7oew9AcUyhAro1Jfgd5WF6EMuSfbygfEZDHxDkGHDhQYtMAoGmJ+x4z+
 8V4FLQvuX24gCSS5mMfd5mUPMQMBv8lg0G/oxZWcrJbE9Fs9IBdfeQSQGfExkXObOBa6
 r/zRoVfgukW0tlY3wUAAF4514QTp+D5UcXe9v7zHiL8Cyb/j8meHd6H6wSUtWgwownDK
 d59RsRITUslE8O8osIuc0YNO4/bLibFrHjYOcvxFWliKb3kR83qkx1tWJTNicy8xAGcA
 0H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCQzFaovzNNP2qLepa01OuCTmhCdk8bQPYYhxVLygK0=;
 b=dq9NjqUCw4teRfIJH+QXLou7zGWhEDQTFzs/dL2oLDkPh04ecvOqIVyt1RR7DbZxoI
 6lqIZ6rvT01sF+yFswrjoZ7bZRGVGRCEosKWkhUuv0opYW6hL/a7thvRTAvVR/QKMGxz
 GVY3AjdvBQC08Bdwl+Gmkq3uOeJYbyR+Lw1peg5c3XgA055R9yMSiHEoX5L800OliUeR
 9zedpb/RNqgz40SUk2mEFmTiVP8z2QbStAnUdFjjDU6cPp2+pvA9vjngPfiIM+1N/W8X
 oIDhcAQqjea5++I0iEhXcvzi0m6MxWWut809HC61tECdojGwXqySxkNPO3F46RonnsZQ
 OUog==
X-Gm-Message-State: ANoB5pn1Wa21dwFp16BFHzLQDiLEaLMMqwR/CbeBRh3qWtG+p5nKbYFW
 kx8310ODu1kEGAU7q424KwlwvASzPFtO0g4XlkI=
X-Google-Smtp-Source: AA0mqf6xWd8ryyhxJAZ7FXdbKAjnjcLu3numr5toaRTQtVl0AB1lBTkHVqitjtQf1JCX4n/CxlpjZS9ZKBFb9RU79xE=
X-Received: by 2002:a17:907:c281:b0:7c1:8a0b:f915 with SMTP id
 tk1-20020a170907c28100b007c18a0bf915mr1807307ejc.42.1671401577485; Sun, 18
 Dec 2022 14:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
 <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
In-Reply-To: <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:12:46 +0100
Message-ID: <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x635.google.com
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

On Sun, Dec 18, 2022 at 11:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 22:19, Strahinja Jankovic wrote:
> > This patch adds minimal support for AXP-209 PMU.
> > Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> > the chip ID register, reset values for two more registers used by A10
> > U-Boot SPL are covered.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > ---
> >   hw/arm/Kconfig              |   1 +
> >   hw/misc/Kconfig             |   4 +
> >   hw/misc/allwinner-axp-209.c | 238 +++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build         |   1 +
> >   hw/misc/trace-events        |   5 +
> >   5 files changed, 249 insertions(+)
> >   create mode 100644 hw/misc/allwinner-axp-209.c
>
>
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index 052fb54310..3855d937fd 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
> >   config ALLWINNER_A10_DRAMC
> >       bool
> >
> > +config ALLWINNER_AXP_209
>
> This controller is not specific to AllWinner. It can be plugged on any
> i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!

Do you mean only in Kconfig, or everywhere (file name, function names,
etc.)? Thanks.

Best regards,
Strahinja


>
> > +    bool
> > +    depends on I2C
> > +
> >   source macio/Kconfig
> > diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
> > new file mode 100644
> > index 0000000000..cf79175034
> > --- /dev/null
> > +++ b/hw/misc/allwinner-axp-209.c
> > @@ -0,0 +1,238 @@
> > +/*
> > + * AXP-209 Emulation
> > + *
> > + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.c=
om>

