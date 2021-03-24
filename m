Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8634770A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:24:40 +0100 (CET)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1cs-0005sG-Te
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lP1bR-0005Rm-7s
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:23:09 -0400
Received: from mout.web.de ([212.227.15.14]:57411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lP1bP-0006Da-9B
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616584982;
 bh=V/hnTz6t6RnwOdKBfARSui1uazjcd6bSccoJwTy7QBY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=qqQGO6Hr4/+dHXB37RfScMJR2W4biC1juyLl5iW1twK0G2X5lSW7YRD7gzRqCzSl4
 qDzEnEr9ypjs+V+sQRbHYoADLzkGqLudEWSDaz/U5H2vFFDnViJvlVj4H5MVB8fX/7
 30t/NM3il5yLbFmpLrmtJQlxTvNgW6An2Ek08q+M=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.218]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lvk9E-1lk7tR43Ku-017VBi; Wed, 24
 Mar 2021 12:23:02 +0100
Date: Wed, 24 Mar 2021 12:22:42 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 0/2] yank: Always link full yank code
Message-ID: <20210324122242.6843f29e@gecko.fritz.box>
In-Reply-To: <YFo82zpHQf+zQ8+Q@redhat.com>
References: <cover.1616521341.git.lukasstraub2@web.de>
 <YFo82zpHQf+zQ8+Q@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Rv_pQWV9=XaxZadgEkue2N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:q4K11bfL8IhL1ZMpHrVpchQGdvCrvigiKZ7HH3eAIWtua5ZVlmi
 vwiycTn8japVscoI/t4JkdZHC4+tlhmPVy+51cWCxV6WpAVEFEpNNinJNSEWvsTUH0WIcsz
 FyICgW3x+WW2MqIFplwzKsNK5QqUwW2YVp6erWwGv3+/VfnCFX3vKRnQsasI8+vdoEeAWRL
 MzunoM+YqxPTfzIt2WxUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZV2ijNAqu4=:LQJth/Pn/KAh2C5g53JitA
 xUZL4S31Lw1Aau1WD87YjSEkrzAAeh7ErgXm9zpoyD0027oLUOotYCq738BdRhEAcsDA+kzHl
 iE71OZhSOiEd0tFIkoZQVTnft3nyKuvh5SWtkPPN2z6cuijrL5k0A9N9CLPQ8D/5HGpJt9MkF
 +O6UxU9APPsuqJ+zHygXO4EiK0e10t6BLfGRInMPW2jdxCK5GpTzfj86nzjG98PjhZBGutA2R
 NcT+ukjgre8dI+jMTeEiKs8Uf3iJUzvCEgbv4jZqcRhGWGPwDFP3KJT68+fLqpCCUVZTHCZJG
 Gre+7GAiipMDevQl40jhTcUrWpqxa03Rz9tlLacMRFcGHF+/SGx79p5b+LH+FF5SMgfJN0NAo
 4WK925JI8g2UP2ekVpgdbM8w+gZbPDOJXdxIykFwZKGO6lLcb0gTeM2bnzqo/kzdVDDQuPi0t
 NXhDa/Kna6fwANIgspRfwPNjFDAVqn4IbU0V+6r4yjSNZdzjpqIRMLMVsx0/XWIOP8PxY5BmW
 p2W3ogONz/6bFEJmqsSZYWZgEKCHEza/HTX3b3CSjmSO4is3ZhM8eQgE4r1sELwZTIpdgJeNf
 XA27+gUsk2T3teUN7OltYBoDQq8MsJcX7DyTJyV8ziOf2m+/ZtFphBVCQH8CtmFDRmTiGaULX
 ZxWx/E1f4MubopM/dQumoplvz36jkODQp/Hr/ITmMB40ij6zKv617LQEYU3BXf7AtHFgWeYjn
 K8hsWlKB9W9C44vmW5SRPt0NWhtykL3gIdTbi566kx7ECUmAxqD+7mFaLDSQdMbugD0iJGOTb
 u2GlTTrQQMfGCIvZQ588nSAGCQl0RIFXdrMLleK4gH8wSgsgo/Efh5FPQiFk9hu8dLSkXHf3z
 nDtLeGnd9oXKwH4vKiIw==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/3Rv_pQWV9=XaxZadgEkue2N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Mar 2021 19:09:15 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 23, 2021 at 06:52:19PM +0100, Lukas Straub wrote:
> > Hello Everyone,
> > These patches remove yank's dependency on qiochannel and always link it=
 in.
> > Please Review. =20
>=20
> It would be useful if the cover letter or commit messages explained
> to potential reviewers why this is being changed... The first patch
> feels like a regression to me, without seeing an explanation why
> it is desirable.

Yes, sorry. There are two reasons for this patchset:
-To exercise the full yank code (with checks for registering and unregister=
ing
 of yank functions and instances) in existing tests and in the new yank test
 (https://lore.kernel.org/qemu-devel/cover.1616521487.git.lukasstraub2@web.=
de/)
-To replace "[PATCH] yank: Avoid linking into executables that don't want i=
t"
 (https://lore.kernel.org/qemu-devel/20210316135907.3646901-1-armbru@redhat=
.com/)
 Now we always link in yank, but without pulling in other dependencies.

Regards,
Lukas Straub

>=20
> Regards,
> Daniel



--=20


--Sig_/3Rv_pQWV9=XaxZadgEkue2N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBbIQIACgkQNasLKJxd
sljbUBAAiHtY8nhNmPL8BB2dJ8QMKXxYZ8UQied3uTqIgKkYR/kqrZAi2OrPP2/8
Nq0vmZiG0PLLVr0Gq2Pr8JU3OIEuhXx9Y7gWToe6f28II4FY1+dqet72pj5XOKbg
8UqbUpf/o7sElX+Ch1AkSqrHX/fpa7mP9vTXBg4p+jAh29Sv9FijNbnAgjp9elhz
Ql6rk7DIJpAewSEaUVhTGrI4uVc8jY0aFItzb+/V30FHAEqjQ9cnvYcKV6aQcTFI
kqgRn2m+pLq9SLalIhKInJVtStZkQfD0txQODEUrKi3+ianPC1qwB5S0n/bJsiwS
mi9UKxjOlIq8ANEigbTs9zThkYFB76bZo7OpdaYDaoZPVjEePHFZUNSeBFxp5iEV
wutRYMTeVLESMWDDCAgyJSeBEH7gc5kZZI2HC77TYdwPsa0qD9TnjKdEE49aQifQ
UxeDmJA2SRf6pBRQcSrGJE9x2bOovQ/FQYa7iiHNT08+l6uezY3QxIQ2W+EYtujG
doGKncfU756llXOSamJFqRnCTQh35lJJFZ/iGlK56T6p9aA+KclJf13xbORWc5Om
ipuWoIkyyw/jic25hci0k1fHWWK3uFIsuPjCATBYZyztNQbTWzPjgCqt8xzZTr+x
p75EWRxDvILUYGZlDK0a2HOC9qJrbDffTFu6UXPL/y6TMGQLz+U=
=lvv2
-----END PGP SIGNATURE-----

--Sig_/3Rv_pQWV9=XaxZadgEkue2N--

