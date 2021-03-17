Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE04D33FA21
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 21:52:17 +0100 (CET)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMd9M-0004RN-8e
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 16:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMd7r-0003YY-VX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:50:44 -0400
Received: from mout.web.de ([212.227.17.12]:37287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMd7f-0002P5-K9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 16:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616014220;
 bh=c4cXoZLn2EYt5L6maYOGwWaizHzIw9ii7tAgZ9PlleI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EOEeP1hZ1qcrIh72Q9RiD1hIPWWKNb84LF6rezS9gsnZCENiZu6S1aG4a5uFQE6oA
 NrlAf4C1WRwu37Sv4rNH/zeV/GrkR/nK7iJEc9AZ7aqU49dAIzu6BQEevp7RaKQ2hX
 0Z3oAbW5R0HVbloL0DmYqYdD2z4UtQx00SgaGdkE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.38]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MpTxm-1m3duy1uOK-00qAJN; Wed, 17
 Mar 2021 21:50:20 +0100
Date: Wed, 17 Mar 2021 21:50:02 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] yank: Avoid linking into executables that don't want it
Message-ID: <20210317215002.283b9179@gecko.fritz.box>
In-Reply-To: <20210316135907.3646901-1-armbru@redhat.com>
References: <20210316135907.3646901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ydsQuDWPn_X9c1Dufl78Yrc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:C+xv9PS+yf/diyz0o6HOFsBziR9NLCnncoeu78jAB0jEcSdiR09
 3WwqUHVwKDECrxeZ3sDeb8kZ1oHFUIF/GEh9y5CPU0sRYdFNXTMALT8w5bZc5PTfZXOZyU1
 hs67lfkEjCdvcqMxC+/WczrVo8TYqWfAbD/hclwxm9aO7omiiP25/pn6A8WgvnEnRgQNlga
 9MDqDRCPCcfPxwdjgkFyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jRVDkcaFvEs=:pdq8eQDz2FI/1lHxzGynEQ
 fDx5VqZrpSQ5qdy+ZmUSsSBPiCM7j/cIIMHK3w/CwnvVjkWfUapu2EEfef61sjgmJpv1spleP
 DBQm7KQoZhgD1rzH/F+E8soEFUIUAkETe8a85HVjLmRfNahz4Ew5lVfbLTCPfPpHCTRPCuV7o
 oSCDPVlU476j8UT6kfGzsDrGovhP8SdxC48HQqCuqUacu4ly07a9IWdQVhCy2/ZaqUQ+v2XOZ
 HleLKrPgiTdrMD/YfTbI7bDgMJUp/dQ6ZKmwdGIZviIi0vLaU4t1fslZe//VbE2/SgL1Eq+Fh
 jAgx/H90tyFnf3S7Gfw6pRRhGb9Sq8Iu5zTUz1JlsiJL5rtdsQ3IQBVrNCIswCeBAsn2pMnjZ
 dvqq7oT0zmoYprpBihBz/uDR67tjMSrM4PB3rXC4+0V57CMDvJop5vwOGuiwW0UlNcDjCB5fb
 9j9iiQ4D6aoqvj3453Vmc9fQVG3EMshC8DgIfxQwK47NobJSKnMYcrsAdyb9NGW8Ho4FGKNNp
 eHWpD/u+tXFIlY8/O9f6cVXgv3EQN1zKKqu2vHKeu5APEUBVv5YOU6nI3pKlkAalH2vmUCtmS
 hMPF051FP5tU7IKpCNQIXlIoWKbxHUNPTt/oKEPefffRztEQrGrPZs670LcaXwuMhQD/8I0rz
 MgysdAePaK53QotswsGd6UOqYMt6LywoGt2/jN3jh+esAVKBAbl9MqdLchx6BTOgklBk7YPKV
 nsZq2c6YAe7oOdXSExJN4jKOjMBGgljB/lX8sFWC0QvVGKc75ZQRy00ZyMpxX8MKFScTlfsTT
 hELAWBNu0MNKMetIxt+wIyrfI5/uX+HWtoWhENRPBKiEsnAmlawjZsh0LuOCN0hqkJbcOboq1
 FP8ZoI1HDGkCjDNJ2iJg==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ydsQuDWPn_X9c1Dufl78Yrc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Mar 2021 14:59:07 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> util/yank.c and stubs/yank.c are both in libqemuutil.a, even though
> their external symbols conflict.  The linker happens to pick the
> former.  This links a bunch of unneeded code into the executables that
> actually want the latter: qemu-io, qemu-img, qemu-nbd, and several
> tests.  Amazingly, none of them fails to link.
>=20
> To fix this, the non-stub yank.c from sourceset util_ss to sourceset
> qmp_ss.  This requires moving it from util/ to monitor/.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  {util =3D> monitor}/yank.c | 0
>  MAINTAINERS              | 2 +-
>  monitor/meson.build      | 1 +
>  util/meson.build         | 1 -
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename {util =3D> monitor}/yank.c (100%)
>=20
> diff --git a/util/yank.c b/monitor/yank.c
> similarity index 100%
> rename from util/yank.c
> rename to monitor/yank.c
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ca3c9f851..d3174c0bb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2799,7 +2799,7 @@ F: tests/unit/test-uuid.c
>  Yank feature
>  M: Lukas Straub <lukasstraub2@web.de>
>  S: Odd fixes
> -F: util/yank.c
> +F: monitor/yank.c
>  F: stubs/yank.c
>  F: include/qemu/yank.h
>  F: qapi/yank.json
> diff --git a/monitor/meson.build b/monitor/meson.build
> index 6d00985ace..1ce5909c88 100644
> --- a/monitor/meson.build
> +++ b/monitor/meson.build
> @@ -1,4 +1,5 @@
>  qmp_ss.add(files('monitor.c', 'qmp.c', 'qmp-cmds-control.c'))
> +qmp_ss.add(files('yank.c'))
> =20
>  softmmu_ss.add(files(
>    'hmp-cmds.c',
> diff --git a/util/meson.build b/util/meson.build
> index 984fba965f..fa0298adab 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -51,7 +51,6 @@ endif
>  if have_system
>    util_ss.add(files('crc-ccitt.c'))
>    util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> -  util_ss.add(files('yank.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
> =20

Looks good to me, applied and fixed commit message.

Regards,
Lukas Straub

--=20


--Sig_/ydsQuDWPn_X9c1Dufl78Yrc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBSa3oACgkQNasLKJxd
sli/TRAAjrGSTjy57ABRcTW+KXHss8lt2GnwAT1rPAx/hQs0KgyLGIpfxlloUHex
3z4Uaoja+sJNP33DRaLpCodzsv9jcPAkaizqEoLUdEZWRYHgLFyWvJy41NImXjrO
f4/6eNUm8ky+rvZdRQWub7no++VeAcBqHn2x804ctxf+tXGk49j7ZZc4/Toq7oIg
sQLrHnyVNAVkih9jlQvneDhTNJA64XWTn/fJvbT/DHLzTiIafMaB2ShNnRx7fzjU
ADZkIySO7dV0RglzCQeKwdx4luECe4dq/xk8SnZxUAY8FsBU7YYdKlTjjK49dBuy
IxYkAeU1EyUdnjsAfnvwA4qmMUEi491NAhQxypq8dVEaE8Xd1TStbgUjnbML/xDp
i+Y+XiMWvpwK2xfz7INb+GRtZkSIr+t/ndrAA54Tct20yM9LyrO7+CHf+FeScf+C
omLIvkYCi34QfRkJYgtlmtz7zBjeikFdsJK7otodR3V9QPRGEqTO1y3/7UnYpXuG
K93rswmEMUDP6vCbGCc2mfVF2uQUkI6XY2oDV3ShOM3bf800hfzqdi4yV6La8PT8
/O0VHcgirLehZ74UwRWmba9rV5JKek49y8feZsZw9ZVn4gODibUmfBfoUdP3xG6V
wM2anVSIidrax2R7mXByfnSviYKUQVgGciJUy5QWQkwqSjjDx/I=
=gliE
-----END PGP SIGNATURE-----

--Sig_/ydsQuDWPn_X9c1Dufl78Yrc--

