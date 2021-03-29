Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EB34D516
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:28:09 +0200 (CEST)
Received: from localhost ([::1]:39922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQukL-0002sf-0p
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuig-0001lR-Fj
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:26:26 -0400
Received: from mout.web.de ([212.227.17.12]:55111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuie-0002QA-KC
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035180;
 bh=6FbHjKdtcWebeS4SPteSnEA0awPT+Mchl7agO23VWnY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hMQOxkcTZaw8zFXLn39Cs+ACdKkhQMJHQLkiTxF/BfVrQkrx5vB52eBz1rlOgItMp
 6s8FbmOYaqLgGxnY/qTJa45izsMcjJHfDJodnRaZi/cp85zKZZ5dtVcmcXnHNfCST6
 Ujz+MhuyA6T7WdO/e6/XIsE9goPubALId2Nuqjy0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYtx4-1l4nMK1cSO-00VDKw; Mon, 29
 Mar 2021 18:26:20 +0200
Date: Mon, 29 Mar 2021 18:26:02 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
Message-ID: <20210329182602.2701ba01@gecko.fritz.box>
In-Reply-To: <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M3jRrO3P8zm_i_VaSWfsmON";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:fdzqusVWJESaumtwUZEU3uEUtuhgPIYpusgAI3NwGCw9UITCnFT
 4ppFXEozq08kgjuqvjqsT0U/69d8C0+dB33jcGnxybyXV4SB/qzjSIpohtPSvK+NcX8b4vF
 AswZb5LLpNLEWoqqnSB/RvIQeBiWXuEhqGcmQGxPEi8eLzy5sgZHgEeIwkxiIhTAcEfipdd
 y5wyrIoH2q6P7Tdaf5HjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1H/A6FIR4/w=:cMAiLvO4AXcGDFxnmt7fD+
 OdtUE6JF7YpGZ93LI04ODmgd2NYeAg0QIpC2L1/wFghT1cv8RKywb9PRfbp/nXFQOiAxeMf+3
 7q3GSndXe0OMnSXhehTPsNqjWu+eCl8NbBtjgr00YbpPvoFT6eE/FTS0ZBULQUh/RTQo8Gxh5
 W8ilC/PfoI65KGce1OepT5Ne4WRub2XeY60yyRVeixwG75nVFAyCtYhKeqdesJwV1AClsOq65
 KmepTeXtbznLwPh8hMLCfXZvcuGm+HzrIbe/Jn/EowfE3Oh/XO1NCuYUTtXkWqSBqT2Lnl9o2
 VvuLaiOT+asZm+GF5oQHWpEvJDrZMNAxhONR8p4w8Uahg56t9Br4/RpQP6zqY/CJzxJjZVYBN
 uZDM/rXkgsDVMaVY0Kqs5pTnV6s7vklar0Ihm2am1fn1OaHSXfz26hTsHClp3/Sapjc/uYchN
 lmBjtqwP2QQUiTVndrKNzRIcgQcI67g91V8TOwFnqeFBYWl3C8JqobZ7y/fsIPdB5fkHKR5Ts
 9H7cijNQUuW0Wr4owK7Dgdk5lTfxUqR0zz1XhuXJKEqNrNtsDpfNIYG3Qk68NjAr8oX3AeTmb
 hvCJtSPOmRCdsKXTFmYyP/cbh71KccihilOdhEXBuPAYdaJph84vT1DkjK9QI7cja7hVDgOoX
 5DnM+PN235TAOKV+S74aOZFaJDWXgvdSda289R0VXnvOAZW2/0PTnsyhi4baVmWki6f9l3blb
 OOMZl77PCuN5zvodcjkKwis0KfHjvPu9s4qF88aFUjcXw448bzbEauK1KSS7BY2ltiSnXiruh
 nkEsH6AAUbytix+ipIKyrTeUqKdM3qfLHqlSErGWUQh7lGalDmC8eA5LZDFctHeO3WlBvxYfZ
 0yoDyXEOJM2SoAm5kGpzZ4NUoNEKpVlXo3ZVDT/eFcO4XQdBJyE4zWeGnS0pJnx5qokBUpeFL
 AlW/3glppyory+T9PsbKEg4FUvdLkKXj9jslZd3lCbzvppNPj2kQGqDxVfd0DPOd66MzjWRo2
 IBbXbSBLHJt4UmXX02GM6CneAqAQRkJwa27P7OM+N/uqA+vw/wsL/1iNZeljfOmRG6EDnORgu
 2uJXScvUqaMxGu3Z59r2OgNISLsxteiF1lF5gaErPUZBatZ/6sA4q6U0snulnNv3TxSTSg7fg
 K3fredshkw3L49X8btU8lWPY3Z6BEY1m5JAcfO6nT/hLo0K295BD988OIF26aMH2Dx8ao=
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

--Sig_/M3jRrO3P8zm_i_VaSWfsmON
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 18:16:59 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
>=20
> On Mon, Mar 29, 2021 at 5:54 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > [...]
> >
> > I dunno if we can get the error message neater (I know sphinx-build,
> > especially older versions, is a bit unhelpful about what it lets us
> > report.)
> >
> > The test-yank stuff also failed on OSX:
> >
> > Unexpected error in inet_connect_addr() at ../../util/qemu-sockets.c:38=
0:
> > Failed to connect to '127.0.0.1:63820': Operation timed out
> > ERROR test-yank - too few tests run (expected 6, got 1)
> >
> > =20
> Lukas, can you have a look too?

I guess OSX is waiting for a accept() from the other side (I have no OSX he=
re
to test though). I'll fix it.

Regards,
Lukas Straub

--=20


--Sig_/M3jRrO3P8zm_i_VaSWfsmON
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBh/5oACgkQNasLKJxd
slj9dA//YwawAHa+2a9mqWeJtsgNruFHqasAcZJ0E3YVR4V9MhmKWMEF6IfhHUkE
/wwiyJdL0QfR69Met8Bb66vkDbYjtkhF0xoYQ0oQSKe5u6Yam04EwSSeVLFLBva/
NavmhPaprzXcTQRzK6AHIFteX2EIxhW9+TZqVz0sTFdbpN1aY8azQ4lKvQq7eCBQ
kK4TuqSUwqiPjrivOlcnRq7DZPmLIlScwNHIPVIm2Vcl+d9JP0J4m/oju9gCFbYf
V3upmlN6QzX7FSRBXvZ77Ll31/k2JpbgPEBoU2hyZ5nsARMifP7hHo1KhcX1h3R5
x3u0pmGrBYojQ/eN4G3ooW2Rljk7KLPzkvcT8MZbtMG9gqFGm3Tc9T60sOKcBU7F
lhZucOpZy3M7KZRT/jJcZyxspy3+Y5UJ1hHd1omf4f9/ep+Sz5cZ9Eov4gahKszs
zvo9hlXVVaXf48td4AvFJpaBRXzC2XNKNUMFcAUXcOuiTdqCWS86j21lJljMJcnT
/ilu4cvWqP2ecNs8a60MjCGwgNDKRIN2o74aZadZiceZoIEe+ocWg0mBACT/EYVF
A9jlrzs789KdbkyFT06Z0dkpOVp62KLED+esCtG6wnWcQi0ojd7gc5IDUfdAG+l9
j3k4S331VixPf+tHxucvRvL7REt0f3iO30WKNTJuddGgppfvBVA=
=9m0b
-----END PGP SIGNATURE-----

--Sig_/M3jRrO3P8zm_i_VaSWfsmON--

