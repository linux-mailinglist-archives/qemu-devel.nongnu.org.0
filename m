Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78E5A169
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 18:52:49 +0200 (CEST)
Received: from localhost ([::1]:34330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgu7D-00036W-P5
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hgtrD-0000j2-JK
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hgtrC-00057r-Da
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 12:36:15 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:41684)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hgtrC-000575-3a; Fri, 28 Jun 2019 12:36:14 -0400
Received: by mail-lj1-x244.google.com with SMTP id 205so6601910ljj.8;
 Fri, 28 Jun 2019 09:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f25JLAKyHtV8jvniNcYaG9xMTHVkgpR7QSjcLNQUGAY=;
 b=HBbMZcueLdSy1TXqeTlgcbpJyTIWKSSl5GKsEfpRQNYu+YDEuc4t2DfISs+AdGZArz
 Bpm2expJJXQ8g9PQc1/dA3XmP1Mftehzg6a+1wXpm4MA59QN2tMbtakKLClPFvoMz5KE
 Nwk0RgsxCzyEDYM2pi0WrORqHjr+Pc3kr/X8SeCJtoapM5W59UBLm7l57TEXW2uNN2/Q
 C9HJggInYNk2wTE5/gMSw3Sl2H/HRcU/lGFV4oQ4OfnisZthXVEk6sTr8IC5AifCIV+V
 /3upjDHE5zexxnMY08ExOGDKtdQ2bUB5yE9y0kbX1Un2tItfVr297EO4kcNztLVueSzy
 FiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f25JLAKyHtV8jvniNcYaG9xMTHVkgpR7QSjcLNQUGAY=;
 b=IIKk0RdySlaf4hjPDZ6tok+XwBtKFxgoLpIvPBWQY46i1k3ZvWqK+afdd/6VYIPF3Y
 er/nLft1huQAAQMUjMmsO5DBY9ozZYmdiP3nAClUIGZyw/iUTY7AoJNe6CO23a/syhh2
 IXgMPCaytVjQxJCVfDtUZ6mk8gC4/CwM0SPyk+ZZfZ1E6RG4axMZ1C693Nh+qQcpw4kZ
 x4nRyEQewSeMw4BWqKW5EJwjE9wjwaKAwu+qQqzyPaqraK9yBqJI1e2+CC1UTt+W8/hK
 FfoKe6qfTQmh5+RvQZusZSo5lkqflZoWqKJP1X+cbClIT2qjyc85LUWHuObL1ejXfQTQ
 XjvA==
X-Gm-Message-State: APjAAAUE9W19ulzUtUCpcpnAeY6+OwzrkrgzTsfyLQWzdY7jjXzMVgT5
 QS5SH7Xdj6lnJ4kYge6IoRrU8qKYz7cQUVmdt4I=
X-Google-Smtp-Source: APXvYqw5UgCvDdjO02HUj2hztKRPgSxiDfc2+rQe+ueVuY9iv1PYGQjVqViaYsbnlzxPWK8Pb1snnb3P6UcWKrHt5RM=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr6784697lja.85.1561739772947;
 Fri, 28 Jun 2019 09:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com>
 <20190627202719.17739-16-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-16-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:33:09 -0700
Message-ID: <CAKmqyKMJQMGb_tLShvzWSx-KoaBA7Rq9xXJu9HQ=DsmMt_+62g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v5 15/28] hw/block/pflash_cfi02: Document
 the current CFI values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 27, 2019 at 1:53 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 1a794fa83c..f1bac480f5 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -550,6 +550,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->wcycle =3D 0;
>      pfl->cmd =3D 0;
>      pfl->status =3D 0;
> +
>      /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
> @@ -575,7 +576,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->cfi_table[0x1D] =3D 0x00;
>      /* Vpp max (no Vpp pin) */
>      pfl->cfi_table[0x1E] =3D 0x00;
> -    /* Reserved */
> +    /* Timeout per single byte/word write (128 ms) */
>      pfl->cfi_table[0x1F] =3D 0x07;
>      /* Timeout for min size buffer write (NA) */
>      pfl->cfi_table[0x20] =3D 0x00;
> @@ -614,17 +615,25 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>      pfl->cfi_table[0x32] =3D 'R';
>      pfl->cfi_table[0x33] =3D 'I';
>
> +    /* Extended version 1.0 */
>      pfl->cfi_table[0x34] =3D '1';
>      pfl->cfi_table[0x35] =3D '0';
>
> +    /* Address sensitive unlock required. */
>      pfl->cfi_table[0x36] =3D 0x00;
> +    /* Erase suspend not supported. */
>      pfl->cfi_table[0x37] =3D 0x00;
> +    /* Sector protect not supported. */
>      pfl->cfi_table[0x38] =3D 0x00;
> +    /* Temporary sector unprotect not supported. */
>      pfl->cfi_table[0x39] =3D 0x00;
>
> +    /* Sector protect/unprotect scheme. */
>      pfl->cfi_table[0x3a] =3D 0x00;
>
> +    /* Simultaneous operation not supported. */
>      pfl->cfi_table[0x3b] =3D 0x00;
> +    /* Burst mode not supported. */
>      pfl->cfi_table[0x3c] =3D 0x00;
>  }
>
> --
> 2.20.1
>
>

