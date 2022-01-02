Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781B482D45
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 01:01:20 +0100 (CET)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Ams-0001VD-V0
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 19:01:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1n4Al8-0000ga-KK
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 18:59:31 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:46542
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1n4Al5-0001EP-CL
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 18:59:29 -0500
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Mon, 03 Jan 2022 00:59:13 +0100
Message-ID: <2397367.XAFRqVoOGU@noumea>
Organization: Gentoo Linux
In-Reply-To: <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
 <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3406340.dWV9SEqChM";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Matthias Schiffer <mschiffer@universe-factory.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart3406340.dWV9SEqChM
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, Matthias Schiffer <mschiffer@universe-factory.net>
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Mon, 03 Jan 2022 00:59:13 +0100
Message-ID: <2397367.XAFRqVoOGU@noumea>
Organization: Gentoo Linux
In-Reply-To: <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net> <a1c8bf1f-0e0d-3ef9-3a62-98c03d54cf21@universe-factory.net>

Am Sonntag, 19. Dezember 2021, 00:32:09 CET schrieb Matthias Schiffer:
> On 23/10/2021 21:59, Matthias Schiffer wrote:
> > When converting a siginfo_t from waitid(), the interpretation of si_sta=
tus
> > depends on the value of si_code: For CLD_EXITED, it is an exit code and
> > should be copied verbatim. For other codes, it is a signal number
> > (possibly with additional high bits from ptrace) that should be mapped.
> >=20
> > This code was previously changed in commit 1c3dfb506ea3
> > ("linux-user/signal: Decode waitid si_code"), but the fix was
> > incomplete.
>=20
> ping
>=20

Sorry I can't say anything about this.=20

The hangs that I experience seem to be unrelated to the patch (no improveme=
nt, but also no worsening).

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer=20
(council, qa, toolchain, base-system, perl, libreoffice)

--nextPart3406340.dWV9SEqChM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6W4INB9YeKX6Qpi1TEn3nlTQogYFAmHSPFEACgkQTEn3nlTQ
ogawlA//UxIWznZs/iO/9Or0X/iz0PlOJMcAwJaqtVgsbx5ZArOCJyE/4eWb3uxz
cqoNZtT2FGobD75IUGk2le3eS+pI9LWm9VKZnNMup8qQS1+jC4+6CtmumyMEpI+K
w9U0ZBLTkpiYIX36n+z80Do73uUczaSKC113mt1EPorvGZxHH1iCsTj1RRiNJi7i
X6go2rNEg0Iv/lKDQXnJJyxaMkes0/jQxY51CdIMc7hvxYawTq8RFsHccFiUucoM
QbQiVqsoVtI7hGT9Cf2LKxz39xaqyczvnEOZLusSZ++dhnaOcyzbFP5u2qi2LWaL
lc9pf9v1BOzyM1nMe+IRjJebjkaNjXWUDhBY/wsqczjHZ8zCTCROeixjHueyUvAk
bMwet/+CVZCUCsLIYPSRR03z4WutfzOcOG489z9AvyB413Rx3CGZS2daxDdrkv3S
ezWbwUI4b75eCeusrcIV+zhKsPcq31i2wpBYUFexc597oqibEx6ABVqzbM+Ih/hB
5li66DWPu5Ms+XscVIm2tcrSQo6oAX9vb4b7pkc5+MA6Nm8z/BzsFs2rFE7hX9Eu
hRpC0utU1Sm5qmfPvcht3Rsj+goMM4gYhTS0Ql6+0miVZ1vXEzv0RGDRKYwfgz1O
TceP9Oe6GUPzbpCe24eq7ZHAOVHupGXv5CLYR7WWxQbhPfGPICk=
=Zw9h
-----END PGP SIGNATURE-----

--nextPart3406340.dWV9SEqChM--




