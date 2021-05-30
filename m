Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CB39515B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 16:54:41 +0200 (CEST)
Received: from localhost ([::1]:56310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnMpr-0001fx-SW
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 10:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnMp3-0000wZ-Lg
 for qemu-devel@nongnu.org; Sun, 30 May 2021 10:53:49 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnMp1-0000RL-Ru
 for qemu-devel@nongnu.org; Sun, 30 May 2021 10:53:49 -0400
Received: by mail-ej1-x632.google.com with SMTP id qq22so4380457ejb.9
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7q/3BEsknokajuOcZiljekZpeLW+A1eF+ACJkfb9MlQ=;
 b=Ri7Cl4romDV6EkdaWlRo5PMNt7Ar6KcxdsPfAT/XR5fylhYX7XTfc7f58y2FxP9IwJ
 ACfS46BaorePknrCr/5dRShCTuMl0jUL9YcRTFVnGUarQBlkQil1HcVuHKtQWiHNxk6j
 HYgMTbOpertt1mS1qZ1GDCcJEKBL1t20bC+5WLNbLZ3sfkbeN0HAFfJcBpm3hC5QAm/P
 J0EJCs8671tiQeKP+azV0G3JM/DVvpLgOITeRHl/z3LiGg/BetgAL65vOqKS5PcbIl5v
 8SMN5BtPFijTfdqaEg8j8ELHREEbourzeRwU9mMExGSroyVNXntGdEZXQJLhU8H+43Wc
 y1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7q/3BEsknokajuOcZiljekZpeLW+A1eF+ACJkfb9MlQ=;
 b=YjCBdCeY4QemQ8Zux0Jf28EKCFZnaQRM4n5PRxe33n0qKWbpz2DNhFbnUVn+zk2AwX
 UnO+xwu9naXzu71c16lITXRchs0GurtNCPjIb1vEm8659+59p8sNSzKBNtRCqYbubg9B
 9Xb7e+19JJnLhr4S65i5vu4sMblJGwXeUXa8gscDFhFCug8I4dZXUM6FBs3dWpWWeRRp
 cwNb0kdyHeHYMWIsfKCiVueCj1JTIM4tHgRHorYi4t9ml/uPgD7QrOY7jTGYxslX3RnW
 lZTfD5epN1r5yTsKUJdqcXnfw5Oeb4tBzagge73a1nmRJpyGDWKaYfJPV81XUYkZubpP
 WYeQ==
X-Gm-Message-State: AOAM531qGtL5Sj47+0xKnD7ihP2R0OKDcKrNdmONfVh15PNoQH3lvqLA
 afQrVSQTF+BKXUajdmoXjlCMt60GMmTR2r1qGhyo7Q==
X-Google-Smtp-Source: ABdhPJwhX6U2CGJh8FJvUhSUb1tCdLTEOLoBhhhNGsZDw1TTH+h9Y1uYjAuK318Ryt57IJ/o+nmSx2KUTPb+tMrijTY=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr18551022ejb.56.1622386425131; 
 Sun, 30 May 2021 07:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210530104922.466175-1-lukas.juenger@greensocs.com>
 <20210530104922.466175-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210530104922.466175-3-lukas.juenger@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 15:53:16 +0100
Message-ID: <CAFEAcA9Vy7B8SNo4MLB1CKxeuYNjS=GG5XdCqM4S-NFfikvbvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 May 2021 at 11:55, Lukas J=C3=BCnger <lukas.juenger@greensocs.co=
m> wrote:
>
> QOMify sifive_uart model
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  include/hw/char/sifive_uart.h |  6 +--
>  hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>  2 files changed, 65 insertions(+), 13 deletions(-)


> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D sifive_uart_realize;
> +    device_class_set_props(dc, sifive_uart_properties);
> +}
> +
> +static const TypeInfo sifive_uart_info =3D {
> +    .name          =3D TYPE_SIFIVE_UART,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(SiFiveUARTState),
> +    .instance_init =3D sifive_uart_init,
> +    .class_init    =3D sifive_uart_class_init,
> +};
> +
> +static void sifive_uart_register_types(void)
> +{
> +    type_register_static(&sifive_uart_info);
> +}
> +
> +type_init(sifive_uart_register_types)

All new QOM devices must implement migration. This is
a baseline requirement so that we always ratchet upwards.
It holds even if not all other devices in the machine
model support migration -- that way we can gradually move
towards actually supporting migration.

You're also missing an implementation of the reset method.

thanks
-- PMM

