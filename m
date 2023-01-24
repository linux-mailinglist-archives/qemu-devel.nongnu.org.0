Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E767A493
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQUh-0008Lh-U1; Tue, 24 Jan 2023 16:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pKQUd-0008LN-0a
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:06:12 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pKQUX-0004ez-M2
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:06:10 -0500
Received: by mail-pf1-x435.google.com with SMTP id c26so12098552pfp.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=to:references:message-id:cc:date:in-reply-to:from:subject
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OwQ+hG5QpadEp+GH/miBxUvJK/KWnQ5tk6SPD7U4jpA=;
 b=RJNS8G/UqB4b7ziB/8fAQQHK+QR5ciNmbk474FBSSeLi9Xwkrk5132eSmdMqXeUx7o
 nVQSXOw26ZUjb0VDsBUruPHhS55eF+LurADPvZhnllGDKr+ErryyyeVt9QJY61oV+0hs
 /IRTNCS1o+YSSx1lucD2KhE2VJwwtW6VbgM5FX/B2Zl8KccDt5kzB3jUHC8bCaPY7hPa
 y1cHr/100pgy6PpXa7qZJoBrKY7WZs2WXrbeo5vVEretZ+4AU5msuvkD7el4iHeNLUlx
 uyf3IYByn/RxrNJXGak+5M5Ni7OeccmZyXGhUDAyhtZMAoTVwbfYGSu+/YFFeHzY+KUl
 +Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:cc:date:in-reply-to:from:subject
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwQ+hG5QpadEp+GH/miBxUvJK/KWnQ5tk6SPD7U4jpA=;
 b=icRaYxBMUC9vcbVD3U7wALZEAaC3PUxz5YpXbfpmIAIXeWHXlO3mVzYATqqlHFDhgY
 AHQvppkxfhe93VVaSUhb/lmpEzHCP0ZJjUfjff9FR37gCQ7styR3RsA1yz94lXext13F
 8pU0rDB3Wr4Q+y0ma1GchW/hcOpg58eJTKvSiRYE3KXpxMNqpjzoXa6mxpznh3R4S3wy
 wOzhN4COVVMYdw4w9+cXz2NlQhSVMlYu83UQS4XPV7U3x6UduHSm9nzE3EYa9ogOjHW2
 aGpcsJqLOfDwQPR7c0wpunjpNyGMAeyMvjYClFDItcWFBtiig/0VXxTeE9+shYr8AqHr
 HwKg==
X-Gm-Message-State: AFqh2koAF6SYuFDPHmvN29BOpfhQRo1ahh8Luh/crFL0fK+69Ym1arpM
 MpmKlORn5/SVjkmkdi7DG+mh0A==
X-Google-Smtp-Source: AMrXdXsXal5h6Io8p/kqowu6L82XDpQFm4VD3UJWzj0ASHiBH7V9Bfac9Ilbv3oVll6i4eG1M/EeRg==
X-Received: by 2002:a62:de44:0:b0:58d:a565:e2ea with SMTP id
 h65-20020a62de44000000b0058da565e2eamr31375649pfg.14.1674594363312; 
 Tue, 24 Jan 2023 13:06:03 -0800 (PST)
Received: from smtpclient.apple ([2603:300b:6:5100:74dc:6b49:c998:af16])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa788c7000000b00589c467ed88sm2047029pff.69.2023.01.24.13.06.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:06:02 -0800 (PST)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_D86D4FBE-91C2-4F11-8080-65E245D62F8A";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
From: Warner Losh <wlosh@bsdimp.com>
In-Reply-To: <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
Date: Tue, 24 Jan 2023 14:05:59 -0700
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <DFBECD58-A4F5-44A3-8819-6C4FBCB3DF43@bsdimp.com>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=wlosh@bsdimp.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


--Apple-Mail=_D86D4FBE-91C2-4F11-8080-65E245D62F8A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 4, 2023, at 2:59 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>=20
> Setting emulated machine type with a property called "via" is
> confusing users so deprecate the "via" option in favour of newly added
> explicit machine types. The default via=3Dcuda option is not a valid
> config (no real Mac has this combination of hardware) so no machine
> type could be defined for that therefore it is kept for backwards
> compatibility with older QEMU versions for now but other options
> resembling real machines are deprecated.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> hw/ppc/mac_newworld.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index f07c37328b..adf185bd3a 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState =
*machine)
>         if (PPC_INPUT(env) =3D=3D PPC_FLAGS_INPUT_970) {
>             warn_report("mac99 with G5 CPU is deprecated, "
>                         "use powermac7_3 instead");
> +        } else {
> +            if (core99_machine->via_config =3D=3D =
CORE99_VIA_CONFIG_PMU) {
> +                warn_report("mac99,via=3Dpmu is deprecated, "
> +                            "use powermac3_1 instead");

so use =E2=80=98-m mac99,via=3Dpowermac3_1=E2=80=99 or =E2=80=98-m =
powermac3_1=E2=80=99 or =E2=80=98-m mac99,powerpmac3_1=E2=80=99

I have no clue which one I=E2=80=99m supposed to use. It would be better =
to tell the user
which of these three possibilities they should really use. =46rom the =
other patches
in the series, I=E2=80=99m guessing it=E2=80=99s the middle one, but =
even after looking at the code, I=E2=80=99m
unsure.

> +            }
> +            if (core99_machine->via_config =3D=3D =
CORE99_VIA_CONFIG_PMU_ADB) {
> +                warn_report("mac99,via=3Dpmu-adb is deprecated, "
> +                            "use powerbook3_2 instead");

Same basic comment here.

I=E2=80=99m thinking adding '-m=E2=80=99 or =E2=80=98machine type=E2=80=99=
 before powerbook=E2=80=A6 in both of these would
resolve it..

Warner

> +            }
>         }
>     }
>     /* allocate RAM */
> --
> 2.30.6
>=20
>=20


--Apple-Mail=_D86D4FBE-91C2-4F11-8080-65E245D62F8A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmPQSDcACgkQbBzRKH2w
EQAQSRAAq50JJMJjkLfxOW+Jo/kZ9ZlauvOmsRcR7A2dIBKeerk8yOZn7xw7TdHs
fwQ21AmBpgVXiCEvU2SWzwLX5EEfqGtGkJoHqP+QO4F9L5P7xNiYYyvnbwMZxBcn
w8AYoV0yQoLUkv40fyQYI+Z4b1Dbu4GN3q/UdfOWpKvmaYs12YJxFg1vFx7nyw4H
JuwVUwCw5//C1MW9Du6rlrXY4j/0JugWbUOR3y14qL5INYcBJ/aySXk7f3XpxDEr
H7WlwvRMrIMrgzqpWAgPIN+daMhA8sm6SLrFr+IAXw8C8km1Shhiye+QKzZURYhs
efKPbmFtp88QZyY1aPx06OiJhNCJu8BSGoDI2T5nlS4lvRJXJwQnFJ+hA1irRgD3
VjQ+vbGudE+TxRWCm7GRLHihv/H+6IAruDkrDfqr6juu6ifLCAk99E1advCVwW80
QqHRfCSpmqwvDFnRo1bn+6/yhg7sNl8aCV044jsllnS+o/cNEGmylG6bozU0oi1J
bx9zoTEKYDMxiqssWAQrWb19RBt0nJgLCwcp/X2bJ5SCXCBWDRZ3SsowZSC+1iCM
6jj0GHeK6pIkeYq3IplMDxZO5N82c+gPEhYqJUVvgJgzpH4p60MEtHmuZvv1C4Lq
9ZFHIKpx4qaD2MuuTPyh9BzcfOe68oD8IsEnbLr7yWvnAHNBg38=
=RsoN
-----END PGP SIGNATURE-----

--Apple-Mail=_D86D4FBE-91C2-4F11-8080-65E245D62F8A--

