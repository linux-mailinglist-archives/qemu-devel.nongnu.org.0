Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B040C6B1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:51:00 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVJT-0008Ox-7M
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVHe-0006U7-06
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:49:06 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQVHc-00036d-AC
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:49:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id u15so4017910wru.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i0+0xOhX9dhCno/WLsEJZHNV498b4wM1+4uRynqwmas=;
 b=nwwMXZr9T4dXiwW+WeLvzb+RAZJ1sFz/B9+aAymusqH6SvTWHQvk/6m2D7ye1ZXp2D
 2i50kRowydApMc5NwQUadxirhGMMrH7lSr0tTid21StyDV19adutZUcX7i75TOrlJeL2
 xpaFEDoGrdTegxzgD38sZSUujAkO+Lpbm4phVbZv7evgLeCinQYRlc7uLIX3fQ6I9cec
 fN13Nev3/4bV6eQt0f9UHCAk6wkSLZgiw5Rh9I2nPSLAcEH3xFkJxqcqcu4+uBIGZdY4
 ODd7X37YuPQdhPVeUiaWKexqAEX1Av4pE7PAadcKgb9g+opE7x2xiFdiNB716zibGEjh
 gh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i0+0xOhX9dhCno/WLsEJZHNV498b4wM1+4uRynqwmas=;
 b=SimdiTsWAagjk1xmR3+sun62amrX9uIyyX65eprI0OqM9Xo/vMa8QqpLcKiQ7dgmLD
 flVqVTzRK+NTfBiAfL3zHkVV2uxmNsZEmbY2n2yc7K60HR6VJwJIOhuN32QtYIjKyFaB
 pbHHuUjD8Ni7BnQII+2ALR5T7xRwihpkY8DkKsPw3Vn0PVL4IV1ur/bogxZSXrO8ezyU
 0odt/VVozgNb8HZAMIVAu+Hy7kTYBex0RunK79kpv43En5iNUG7AsC4+O0WY5WO1Crdy
 uCEMYP3NynQf2fU1A0M01pOe+89aWoREpskZ/CuDcZN7piw6GvOXx10oadz+yxk7I5Ke
 9LuQ==
X-Gm-Message-State: AOAM533U1vJ6eeSYRZbeZNnUuHb2a811AFI2CW1JSHsoSdoyQ1Om2VNh
 9JyG7pyz3GKBelhdCNmX/TDiG446wEMHX1fav5SZLg==
X-Google-Smtp-Source: ABdhPJxrdTV9h683PXPy5b6/+wHrEi0wPVCJoqv6S/VYengt9vVIVjNCnmq7f8nUvx7YJyYdWvIbwF+nXnbzmcjsTLY=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr9622wrr.376.1631713742652;
 Wed, 15 Sep 2021 06:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210901121620.1320-1-programmingkidx@gmail.com>
 <9c8e7273-6b28-8598-f679-92c467fff06a@vivier.eu>
In-Reply-To: <9c8e7273-6b28-8598-f679-92c467fff06a@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 14:48:11 +0100
Message-ID: <CAFEAcA9HCF1FwqsDwwOqYCajAfWQxJBut7aRVoEaNEYDZbo29g@mail.gmail.com>
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 John Arbuckle <programmingkidx@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 14:31, Laurent Vivier <laurent@vivier.eu> wrote:
>
> CC Mark
> CC qemu-devel
>
> Le 01/09/2021 =C3=A0 14:16, John Arbuckle a =C3=A9crit :
> > Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios =
folder. This makes all video resolution choices disappear from a PowerPC Ma=
c OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-=
bios folder giving users back their video resolution choices.
> >
> > Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> > ---
> >  configure | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 9a79a004d7..281577e46f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5056,7 +5056,9 @@ for bios_file in \
> >      $source_path/pc-bios/openbios-* \
> >      $source_path/pc-bios/u-boot.* \
> >      $source_path/pc-bios/edk2-*.fd.bz2 \
> > -    $source_path/pc-bios/palcode-*
> > +    $source_path/pc-bios/palcode-* \
> > +    $source_path/pc-bios/qemu_vga.ndrv
> > +
> >  do
> >      LINKS=3D"$LINKS pc-bios/$(basename $bios_file)"

The code change here is right, but Mark suggested a
commit message rewording:

https://patchew.org/QEMU/20210831165020.84855-1-programmingkidx@gmail.com/

With Mark's rewording, you can have a
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

