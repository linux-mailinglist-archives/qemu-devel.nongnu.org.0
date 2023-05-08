Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963956FA39E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 11:48:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxTV-00067y-6z; Mon, 08 May 2023 05:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvxTP-00067h-34
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:48:04 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvxTN-0000DQ-6J
 for qemu-devel@nongnu.org; Mon, 08 May 2023 05:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683539275; i=lukasstraub2@web.de;
 bh=fZXxndMq+O4Vr//1qAAvAzm4UVxFv5P4/5di7F/rz5g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=U0sfo0bQar5SP4XUHCGxpC/QO9l2af5PNADqyeAiBNzcL5b4cw9r6V49qTDjlsD6+
 LDuYUYOuS5lft3G/rzIDhuJOKtcrNcuGBW/gnh31dzPQwVsTxYjUOyEM2Yc7h46w5z
 cQpj1G82JtZmFkCRU/RjjHQlUM/5mcRh+38VKDikMlc4oz0PMiMCwE7kovDY2WlGrS
 iTlALO/AVhCHXS8gZZp4dIaSU7Nhzy4/o8H2qAS/tuV0h0IZONTnCgrw6pQSbWLHbD
 XDEaos8LfdIY5/oF6ETfSGA1Lrc/+70qjIhL8QUyE/TyabI7B4WufoU3rzqyJZ9WlC
 KzNZiEB0dMcrg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from mobian ([141.58.63.52]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJFhX-1pcvPk2a7P-00KjDJ; Mon, 08
 May 2023 11:47:55 +0200
Date: Mon, 8 May 2023 11:47:52 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
Message-ID: <20230508114752.401779f3@mobian>
In-Reply-To: <87mt2fnswc.fsf@secure.mitica>
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <20230508010342.4162c526@gecko.fritz.box>
 <87mt2fnswc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nh/VODRShuIit2raiixk1j=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:obmpaLWdORH+XagEs1Qk844k/cNwRjmsRGGmf4saitW4Fm+IxAV
 SFxc8IPilVEx9VqL8i0clzjv3stxATmqAXIIu8toAqEEfzyotXcupOszlMai9P3s77u7d4E
 aHDQviEJWl1iHeGrYAREeIEBYT3O4m97jHFH3hAVZ3bopM00exTiRNEAGTY/cg+ecZzMViL
 vqWiLu1P03RjQoamBh0Iw==
UI-OutboundReport: notjunk:1;M01:P0:xYrt9eHV0Ts=;OZqvxSjPJxEzwXm/rjOCt5lReBF
 y5JKUrpcOpCQeFAxCCbQB+uZF6L+mXaDQCamQL/x/l389HPxuycjlOi9de3SltJ1jGprz1X6j
 O8WEWl8Zl+5jHAaGp3YTZPRQLGmYBPJ8RCtEbwyiTFCXN5hivlkleMlQEBQbn3P5nIrimLvgw
 f0dFGI+4JMuarabQx6dHyrkcx5IvMmXfkMaaY8fvT2KRrzFEOoSqVLgvf5HFXkbqQIBuFR+Ee
 L/OXBfVkZao/nBogo3arBx6eBMBE3l5TmyrXmBCsGS++AWVHr6Axdsio+iTvPlNPwe+mBZqko
 Nw0Hi7LDZe6wphoRpEw6Kl+wYKainI/yRnjtPaXDAkvLfIzkUYwGph8Tj8iJIclt4zu/bzuVO
 HXSDU8xDUOSvQb8XY0l5Fr+YIvQGcJahxi+u4pI6JGRHZQhpMk2QzTQQFB5JkkfioSHsenfWJ
 T7YjEyF6rwMwj+nJ9uqhGqtdiXrYCWPnCkiNxFCgF80e0u5ryT1WilnTAL/4PRRXdotIGe3wz
 7O6vlQ1QXKa7vzHkzYtHQRSy9F9IzYYs+tRswxww64epYp45CwrpCjC77PsJ7tHu9LQnRTQmJ
 xXxS/uC/MLxuyJOZQpJV+Piuc/wez37+58kKKH8wYVbQg+CVSkBzI1pFWXrOsZz0Dd5TS5TUi
 CZFJS72JIaviItiR9ilxv5NG7UzIP3dTeL7pPmq+TjxDJsFvQlMBOjPWhS1RTKcea4o6GZOhw
 QFHX3o3f3fwvCue9wxktYeCw8Joj/ksTK10/jsWb/kSHomQDW/nxw71eqCsiQXDqtpuO8KvFA
 Ja/PMbbunT4kNGDxjshg6EumjhCuKPxZsC+yZwr7oCnDZ+bysoRYRnuNPe+umIXm54ZPVo7qS
 ZRLGpz+JFVPlKg5QjWU6OUVhFHKSgM75deL6bKwSOYQhCwQV4N5PktbqHk2YoxmdpQQ/ptfB5
 UcVe4Q==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/nh/VODRShuIit2raiixk1j=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 08 May 2023 10:12:35 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Lukas Straub <lukasstraub2@web.de> wrote:
> > On Tue, 02 May 2023 12:39:12 +0200
> > Juan Quintela <quintela@redhat.com> wrote:
> >
> >> [...]
> >>=20
> >> my patches are only code movement and cleanups, so Lukas any clue?
> >>=20
> >> Lukas, I am going to drop the compress code for now and pass the other
> >> patches.  In the meanwhile, I am going to try to setup some machine
> >> where I can run the upstream tests and see if I can reproduce there.
> >> BTW, I would be happy if you double check that I did the rebase
> >> correctly, they didn't apply correctly, but as said, the tests have be=
en
> >> running for two/three days on all my daily testing, so I thought that I
> >> did the things correctly.
>=20
> Hi
>=20
> > Hi,
> > I rebased the series here and got exactly the same files as in this
> > pull request. And I can't reproduce these failures either.
>=20
> Nice
>=20
> > Maybe you can run the CI just on the newly added compress tests and see
> > if it already blows up without the refactoring?
>=20
> It does, I don't have to check O:-)
>=20
> The initial reason that I did the compression code on top of multifd was
> that I was not able to get the old compression code to run "reliabely"
> on my testing.
>=20
> > Anyway, this series is not so important anymore...
>=20
> What about:
> - I add the series as they are, because the code is better than what we
>   have before (and being in a different file makes it easier to
>   deprecate, not compile, ...)
> - I just disable the tests until we find something that works.
>=20
> Richard, Lukas?

That is fine with me.

>=20
> Later, Juan.
>=20
> >> Richard, once that we are here, one of the problem that we are having =
is
> >> that the test is exiting with an abort, so we have no clue what is
> >> happening.  Is there a way to get a backtrace, or at least the number
> >>=20
> >> Later, Juan.
> >>=20
>=20


--Sig_/nh/VODRShuIit2raiixk1j=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYxUgACgkQNasLKJxd
slhfDA//dy6hq6ZqCMRTJRZeYcLJtaUyFLY92/g8OgtxV7ajURFGMMSNBsnf0HV3
TmPQoz3W8mihxa+9PBU64b0HNmWxIoYJXSh70QSQybyN1pogkR2ZIMuB+t8nRIDl
GYfT/ahvP1Niu5OQziWSJDDYYEDej402ejGxe6rJi2HA7iPiMV0UBifiIOmq6Ay4
8hm5U+wt3NrnDsCxPXZPwFlVbxGeErWp33IG3blVOeYDz5SOdCtlMZH15yP9UcTf
sSo+oogXf7piT5UA6iEDqh1a5vFa6gsrgQzkDYiKO8frjF6dNE/93DTHujB8pmzw
9blNbPmvGXZsmiWWMjP5jAa9aoEmesDTLR94sqxfYNUAYWvx61oAf7jVMGR3RsbN
7hLxPwtRvoIPW0l1Ul7YP3iQmGi+6FvcnVw6l9LCIHQkW9QRgj9y2gdxLqz5yVuF
zB+aqBi5jmjeFvxadhqoqCm+TcoNEIQZNnlPFksAwYXitR1grD3v9VZADBnzQn9E
Z1Ml+gENefyOZQEQA5rykmLRNRb++x2dWDbYXzCFhNC/IKvRUdNHIoSWJpv0Sn2G
Oo7cSbZG8kj0V6ZmVdUlaFv32tCo5N1U8kuPJp+OTn5Z4REA0/x50+gyZkZxOlIw
G4yrghL9yhyg0VrK3KgZNidhrxryRQwFR8BT5kGUGycgymwutDs=
=XD0j
-----END PGP SIGNATURE-----

--Sig_/nh/VODRShuIit2raiixk1j=--

