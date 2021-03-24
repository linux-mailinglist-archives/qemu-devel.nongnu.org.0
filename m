Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD7D3477EC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 13:11:35 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP2MH-0001zI-Sz
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 08:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lP2KO-0001Np-MW
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:09:37 -0400
Received: from mout.web.de ([212.227.15.14]:44355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lP2KM-0000TK-Fo
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 08:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616587768;
 bh=XvszuPyTABFQGVt9JQbwuasP798OdCborsLx3mC6YiM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=eSL9Axy97+opgo+3JDdLcNh0pZOZFM/9n80qGzO8sDwCHChVdJFPp0bnjdrCQed6F
 98rTm1TPXTCc8e04uxrvAm02s5Tg/K99aBBlFUX8GEsaraRGFJzOBO8OiBGzB1uCP0
 mn6wSuDMfX3IWG18tEZVoUL9+tnTcSTOjqyIKaB4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.218]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lpw63-1luGTP27Il-00fffp; Wed, 24
 Mar 2021 13:09:28 +0100
Date: Wed, 24 Mar 2021 13:09:11 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 0/2] yank: Always link full yank code
Message-ID: <20210324130912.0490afb8@gecko.fritz.box>
In-Reply-To: <YFskLauf5ZZ4RJwi@redhat.com>
References: <cover.1616521341.git.lukasstraub2@web.de>
 <YFo82zpHQf+zQ8+Q@redhat.com>
 <20210324122242.6843f29e@gecko.fritz.box>
 <YFskLauf5ZZ4RJwi@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jLVyqHBNEVRNXMPuh6b854H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:uEJLe2J5GT6ymDr4qgftf7sQ+AMELIIQQxt1V7BwmHyreOkXSys
 uPgkacePeSjm6ga84WCrmzblyjZriOZiIVag9kejha2RASol88RhaH765hFqxa5lpb+OQBJ
 haHXHWoG5e5C0nxe9rFAHHLE3DZzssVVoHbAJJeo8prCEFZaMMBWLscuEoKYxARapr3F/lv
 Fccni8r1jcG491/sQJwzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dNe+GD72CPA=:sqjwuLLdE3Fr76HY/T5W8u
 LgzcffSFtxlBlVqyvRhjCJmIg7NCMrZC65FJboq9pMcFD+56mU1doQ19iUy1mQ1Ese40L6784
 730zKNd/6k7utL7/woKT27xMBI3Nxxk/2g238Kiq0oTp7DeLxZoMVPtEz6dLE61UfgrUmjxcu
 F9lKNxYY/9NegkxPWuTImYjcCNea7mk+CiBtQt0SeRbLwvL2jnGuiAH7e/YDbpcZxelR9drt2
 +64ErXcr77vkW7sEmVvIuRjC6k91FKHwPBXi1v87vsk8Y+E9i56KY0mwpvOt4wzElJzZGb7Bq
 0a20+K04f/Gv0gpsMfgoZHQIVASANkNboHvMU2SM3xLQDwZb/NZRpTjFjcANZrVboZJG7x8Er
 grlkBFYrNqQJhEjk5U9dz2uVcW2ei83DXk3+s+qjrIr4uWxP8apxRYrCB1A4tySOoEBpDPt50
 FqDdnM/KG9xMMO64H/dTGQu99F490sDIa3ueCDBiVF2utKOX7/XS0RAPb6cEQbf0L0NyhI6E3
 MeOO4x45h2L86hAwwhH6pRnnjxFKOBfipNNHBKX2zf95wVewR1O7Izmazr1X+e9iBl5yaLi9j
 mHCFmxn6vcTkUW1zLb9qFhWWtC7t9gM5uZYX3/M7ZHwfgxl+zzdp4v3g9vi7bvEmqGHkV+MXq
 3Kd2Zjivlxsh6ubkATpL3GOrcfu6/SGy02jMCk0sNgzVjcWfDwZs/QBXU/gxu9Cso4GldAr0Q
 4hkLFFUmlA6PWpm4SHEkSkzDP1+7ll+vA6v531imUmWigmN+WZlfWhQFZ0BYcJJQD1PTOv6wY
 jYoOUu0Xrnzsiv5tq5e6ARiziYuOTuxsYT2a1zn69G2AZLoAFs9nc9GtVNuGFO3l0Gs0t+hWX
 ritgJW98quf2gjT2ggmw==
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

--Sig_/jLVyqHBNEVRNXMPuh6b854H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Mar 2021 11:36:13 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Mar 24, 2021 at 12:22:42PM +0100, Lukas Straub wrote:
> > On Tue, 23 Mar 2021 19:09:15 +0000
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >  =20
> > > On Tue, Mar 23, 2021 at 06:52:19PM +0100, Lukas Straub wrote: =20
> > > > Hello Everyone,
> > > > These patches remove yank's dependency on qiochannel and always lin=
k it in.
> > > > Please Review.   =20
> > >=20
> > > It would be useful if the cover letter or commit messages explained
> > > to potential reviewers why this is being changed... The first patch
> > > feels like a regression to me, without seeing an explanation why
> > > it is desirable. =20
> >=20
> > Yes, sorry. There are two reasons for this patchset:
> > -To exercise the full yank code (with checks for registering and unregi=
stering
> >  of yank functions and instances) in existing tests and in the new yank=
 test
> >  (https://lore.kernel.org/qemu-devel/cover.1616521487.git.lukasstraub2@=
web.de/)
> > -To replace "[PATCH] yank: Avoid linking into executables that don't wa=
nt it"
> >  (https://lore.kernel.org/qemu-devel/20210316135907.3646901-1-armbru@re=
dhat.com/)
> >  Now we always link in yank, but without pulling in other dependencies.=
 =20
>=20
> Conceptually, the real world usage of yank is in combination with parts
> of QEMU doing I/O, and so they will always have the "io" subsystem
> available. Thus it feels wrong to be refactoring this to avoid an
> "io" dependancy.  I think this probably suggests that the yank code
> shouldn't be in libqemuutil.la, but instead part of the "io" subsystem
> to make the association/dependency explicit

Yes, makes sense. On the other hand I think that the yank functions should =
be
separate from the yank core anyway.

Regards,
Lukas Straub

>=20
> Regards,
> Daniel



--=20


--Sig_/jLVyqHBNEVRNXMPuh6b854H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBbK+gACgkQNasLKJxd
sljp9Q/9HQkaA3aN4ZgxVMFE11Cb33QjAJbZ2jxfk7Z2Z7RSc8A0vyEq5HNexUtj
wgk47Gl7Rk0M5vyMCXNhKgkGC7yDwRhvqk9L+5py2rTMCL9AHUXr3v2NQRbZwlBZ
HB8QTqArBaRBwMBBI/ZW8syFcQgjwKqSDL1WiRvfPgP77Eia/xtQhfAiPwfSDcuy
AIR95E5dCA6dWjv09JYpIROqTG3pzyJdRPwESDMKgtHEVLrxHHaUk3XzvO1doNVs
j7fLaLKshniTKqC78FJtlRvcinHJzxteg3WAF+85Z3nyTr1gpi3lk+T4CYtQv936
0PCjIaO4D4ML3k4ROG2Fp5Pdx0QN4kwINbzwrHfUm/xPjlf2Q8I0AppJ6DLbfX7q
J7V7TOxgGoxvYVZtN9obZuoZaPo15IP/36EF8l6r05J5PNloYXBtA/VYPG1pjlrA
Qh8OTxst+y0lcxJsZuoKS7wLiURGtnkIZTo/kWFDAMSMF8mHJe9iMev1gE3tUz5G
GycCoj9lngyFV964kYCNW8FM3D8Ee/GLY9cyRqlkYlJBKLj7vjtUiBmwVqrpcAaN
aTOvFNA7k+1a+mqj1iHgGEeAH/naRxNA6gjE2oIuD9bXZ1L8sHtfUB47uJXpBuhO
GPAzBdqHwbrxhWjHKkC13Qh+JoTZKNGsb774EH2WrY0BP0W4Lg0=
=hQAL
-----END PGP SIGNATURE-----

--Sig_/jLVyqHBNEVRNXMPuh6b854H--

