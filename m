Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D671FADD2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:22:50 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8jx-0006ea-Ep
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8j9-000651-Dg
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:21:59 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8j7-0008RZ-SP
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 06:21:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id a137so18765273oii.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rZ5RV2Xt87KOcGezzlr4cpIJUUSEU7Ipl8/CDMy2YiA=;
 b=TqW9lnpO574Cv9nM+1LIVqDa5nDL1bFgW4jIY9urwBVWJwiUQiuJdcI5HqnDGdza2h
 Gm0Z50adhRrbXUWWEurvKeo8v1EPADA7tM30N92RNHZU8TJVZiK5h4/Z28zllrNlY4au
 LnmzROH93gnFXc9sap+BkXhBun3u8FSIC61e3DSbAAXH1KagBNhI8VweOeMuXYBwJuMf
 jPnX5NeBbIWZ+M7aH38S6iI67bmH0Ygp52cCKfn2uHZ06wQPLX0Qe3l3RhwaO1FxHmbl
 WQOIuj+Yas057iDGCMPpexLsMqF4YyA+N/xZyrVq7XlvuIi95knB1DM53jPd/yCpWwS3
 zqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rZ5RV2Xt87KOcGezzlr4cpIJUUSEU7Ipl8/CDMy2YiA=;
 b=ioZQqrW4f1B/mWS8fe1qasczgpU5MsLJhz5ZnsJ8dPI2q8KhjkJLzgmqll55s7GjqF
 hvGPI2qar4HCJ/Xu4UgVomSuZyWTjtsOunE3jDrp0+GlrXtKjeTXloZB9StlP42zhvXx
 UFdKF8CnE1SwYzqgG6pU81JNIUNV4sJ4qqP2ddZPHQ34UTEEQR0HMZNtHt9WU9oKPEO1
 0vjgi/f+RWXpI0Aj11PEgj390kmRs3qB1/6QGigzQECZi6GFQis/JxxTnpCNmNWwYO4L
 0H+anrFtVuLYOdeoMpzVlIR8PfLgpIWFr0eQmL6/ppVZdcuy7knVxi3Fh/JfT+buspZx
 txxQ==
X-Gm-Message-State: AOAM533p3PSSqpP6tgeK15j3kgF7cyYRa7Vo1UKZ1YlsPLtfNOa2KLm9
 MELoUURzzNPP45Y9iON/K8FkZMM6xzSH2R4D+LUW3A==
X-Google-Smtp-Source: ABdhPJwMM+uWJJibNEf4GBk+O+NC7ZSrDZFJ415QPwgOAJh3TYWdSoWDdSlhoZHGhliI6pHte7tsi9jmJBP/t9NiZDY=
X-Received: by 2002:aca:5152:: with SMTP id f79mr2648504oib.146.1592302916649; 
 Tue, 16 Jun 2020 03:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-6-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:21:45 +0100
Message-ID: <CAFEAcA9oruR9iXVwPxDMxdGe+Nv8zS9DZ=g3ta96_sSz3-rumg@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/arm/mps2: Add I2C busses on FPGA APB
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> There are 4 different I2C peripherals on the FPGA APB.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/mps2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 4a49bfa9b9..6224d7a63c 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -321,6 +321,7 @@ static void mps2_common_init(MachineState *machine)
>          create_unimplemented_device("cmsdk-ahb-gpio", gpiobase[i], 0x100=
0);
>      }
>
> +    /* FPGA APB */
>      sysbus_init_child_obj(OBJECT(mms), "scc", &mms->scc,
>                            sizeof(mms->scc), TYPE_MPS2_SCC);
>      sccdev =3D DEVICE(&mms->scc);
> @@ -330,6 +331,12 @@ static void mps2_common_init(MachineState *machine)
>      object_property_set_bool(OBJECT(&mms->scc), true, "realized",
>                               &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
> +    for (i =3D 0; i < 4; i++) {
> +        static const hwaddr i2cbase[] =3D {0x40022000, 0x40023000,
> +                                         0x40029000, 0x4002a000};
> +
> +        sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
> +    }

Is this device really the same as the I2C controller h/w
on the versatile board ?

thanks
-- PMM

