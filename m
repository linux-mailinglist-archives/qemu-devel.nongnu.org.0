Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA22F511F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:29:35 +0100 (CET)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjxe-0003Uv-Ru
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kzjv2-0001PX-85
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:26:52 -0500
Received: from mout.web.de ([212.227.17.12]:60529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kzjv0-0006cY-3i
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610558805;
 bh=umMtOF7hV0qRNTFJKp9/gfaUewUWnAnC/8L/pxAvOsI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LDgjsFftqoJDmN9NDIrcKb/FyXGs5RGnkhjeTqTlNG67MvcQ1kbEAG/cZitpO+RCy
 4RsuxgvX/0zlRi0Y3zDp8VOqO7Fzjo4moclq1SdfuoBFuUcQahWexbZJAXLttZp6uF
 xxeSX91FlxUTmrDFlI+WNycN9VwzsO0MNcPxQc5w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.58]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lrb3x-1jwj8q00ar-013Q0W; Wed, 13
 Jan 2021 18:26:45 +0100
Date: Wed, 13 Jan 2021 18:26:35 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
Message-ID: <20210113182635.1346cd69@gecko.fritz.box>
In-Reply-To: <87v9c0vm5t.fsf@dusky.pond.sub.org>
References: <20210113093101.550964-1-armbru@redhat.com>
 <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
 <87v9c0vm5t.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wtsGdKxP+r_jkoc.W4ZBJwh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:SSb7yUF8bl8Zn38QpttO7WZCgw9lFjBnz6dHceSLY04Ocf6mElH
 r5iL13fEsxE2uNTnBPWHEcNODx0AJTkwVW1IRWTUSdySuJG8WAIwZItPV9+68fJ71NWS90K
 STAvF7dnOBFsdL/kPHuCZiFT//mtGDEpLUCodOhaSeLEof8D07Re7DoPQhlBZEB0VZxePAE
 RE4LUOc8nn86RGKfgbRPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ehfdz0z2+2Y=:AGh4UNQs2YC2MbDdMCFhcp
 xVBv2Y3045qJtz0jDORaz9F5MahJR+zOxof8Zy9nXam7uf/AEMKZfFcs5Vb6hSaQHbz4kkPq6
 jpglWUPupUtN6Z8HncH5g6EQVE9a6Vp7qAL8zogLGt9gYfmq/+6Hc0YUxDhMXEEo+tiUFaWxM
 PSHYpRU54gNxa04juoXC8Jy3Mc2a5VHRU4TrzvQx+UejpSzgpJqNLpGom3CyT8JcusNvkvhAI
 AiCbJFmgCOBXeybvUWvuUq96Ud7FMH/xxUCiuEe8nwwa6QfqMYZ0kOHgP+qWMrqYy6K98IXms
 Fqzt6CM7vP1f4OWwodzGGCzBXuRGLoltgqtgkJDwWTS8cVWN3X1fitssBQtCYfgmMH2l2Jyjc
 Mw7YSx3Xa+JjCMonu/3NsM4gsEDPl6XNGMmTYFekbHsG+10dSvZtIpKuQpapGuQog1Txq9tUf
 L8NbDq54yX31eTnEEM8yiYueLdeSeszGRPvdT4tj2E/q1tVANroKw4956/+j9gezaYszCyH2j
 zJ0KPRxMqCvQWPecTn0B5PveprwLyclbx1sdwck9baitRHZQdE4r+3e6bUKVv0+Hc3KOjfm0w
 1XYHHz4JGRmpi9guqsp5mdqo3WmMqh3dQV6RuxlJHWRBRPynZKDnYBsRfTxUhlIdzv2RGZchI
 2F22oDlMx73Ywdz98qOus6A4tjT73n0CaY8M+ChUvMrhmnr8nhl852F0gZTJJMjHSeKWgVtHo
 dLeSt2BWugRrGeE7dx34myjPucaEWR/wsGiM0Zlk6T/rALUjffqZ07yswtBX9dy22HHL8uMSv
 y3woEG5vJDb8NL676nZjd+PK7H+7hSk00OGzQZQzTUBDJCyZmzP6mmrYIIshG9ZiDRRv/DsEK
 7wAtu9uPIdjeeyWx7BIw==
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/wtsGdKxP+r_jkoc.W4ZBJwh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 17:25:50 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
> > On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wro=
te: =20
> >>
> >> This pull request is on behalf of Lukas.  Hope that's okay.
> >>
> >> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d=
99bc0:
> >>
> >>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-=
20210112-1' into staging (2021-01-12 21:23:25 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
> >>
> >> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc9=
3:
> >>
> >>   tests/test-char.c: Wait for the chardev to connect in char_socket_cl=
ient_dupid_test (2021-01-13 10:21:17 +0100)
> >>
> >> ----------------------------------------------------------------
> >> Yank patches patches for 2021-01-13
> >>
> >> ----------------------------------------------------------------
> >> Lukas Straub (7):
> >>       Introduce yank feature
> >>       block/nbd.c: Add yank feature
> >>       chardev/char-socket.c: Add yank feature
> >>       migration: Add yank feature
> >>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
> >>       io: Document qmp oob suitability of qio_channel_shutdown and io_=
shutdown
> >>       tests/test-char.c: Wait for the chardev to connect in char_socke=
t_client_dupid_test =20
> >
> >
> > Applied, thanks.
> >
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> > for any user-visible changes. =20
>=20
> Lukas, could you take care of that?
>=20

Yes.

Regards,
Lukas Straub

--=20


--Sig_/wtsGdKxP+r_jkoc.W4ZBJwh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl//LUsACgkQNasLKJxd
slgFEA//axpFTpP/p7wX+It1H0P1d4NtoU7Sgrg+K0s77styiwP2pwBCAXyRV4sy
B4sRo5nHvpuH8GsQS3WLKLuSAfl54szbXDHfZFby20YUYOJM5J+7VkK7iRE8zT/T
+wShqCmyxMjMFNJaZMLuJ6H4wxVWvVhQiISh/xjmu8sk8Qv3+K8Xq7Eb2yovAh81
HG7Pl8IO6qGyI3APsOL1Hs39AmaDYVmPVL14YHxTMr0bSoeRCP5RABUwkvxXpY/J
mtT218mjchAUPG85btCebZPhCC1aoZoHijY5zuw0hLjVSGwW05a/gwO34lJTTuVd
EX5BwH2Aw8+pbmG5JPkbdSGACEAxc+QnH7N9JWpY9tUVFhYCoubClveuACw5Y7L8
mL3qDKKYB2XACEZal8ZhBZZhIbvZ9qJDdGgpU5qyMWwXOPrWa4Ug5euGiSdsq3Nd
EJB18VHkF8fZKcgimAN/li9wt8sjD5WLkqC3o5goPLeLqoikgp0pP+J+zc4MBQWv
3StMTQV8ZWAoWjcvE3PsG1BCh04yv8/WvGI/hbj0liCIMPtuLZ9DV4Ivx0de2yJj
gQEHaVBUoL8cHMITDoZhdE+3zMvTbR3MDJAQLczd4r70l8Siv1bB/n4l5jHic7HJ
a6lnCH9jKCIc/zjmE5Wfb1pdCqrUmIPKPnDET3jN72kE4FZCi1A=
=QlZA
-----END PGP SIGNATURE-----

--Sig_/wtsGdKxP+r_jkoc.W4ZBJwh--

