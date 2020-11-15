Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE552B32F1
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 09:30:51 +0100 (CET)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keDQv-0003kX-F5
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 03:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keDPS-0002yS-0B; Sun, 15 Nov 2020 03:29:18 -0500
Received: from mout.web.de ([212.227.15.4]:49329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keDPQ-0001Ko-11; Sun, 15 Nov 2020 03:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605428947;
 bh=dCfbyKlA/XQICjPT/dI5O9eYswXZ/+HqYNWvaQjkHDE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hKptWbGUB6TI85bzHM49xAwUxOcKkqB5bXLZRQkamFcsp+7PceFy7r0ySFAJR+4Yf
 pfhSb1f6/grznD3HdcO9CjsRZ2wF2nC/wvnqZYeo0R+ozL8grl7PpeyKziY26HTvWs
 tBEWrrJer/tHPbeWZIu+gSv5c1lNwDG90/C2Calc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MAvFE-1kWTeJ02XU-009zSH; Sun, 15
 Nov 2020 09:29:07 +0100
Date: Sun, 15 Nov 2020 09:28:55 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v10 1/8] Introduce yank feature
Message-ID: <20201115092855.7bd59f97@luklap>
In-Reply-To: <87y2jkp8tk.fsf@dusky.pond.sub.org>
References: <cover.1604075469.git.lukasstraub2@web.de>
 <20201030174108.1c88195b@luklap>
 <87y2jkp8tk.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MlyWWb7zWeQb7Nbp9PGHVem";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:KJySkjW4fg3RRBGv8mhcAkL2fy+Ix1g8764+I7plN0+wFmkDrhj
 WowvU0xAI4cGlAXriQT4eOYp+hULnF3ENC+TCVOO/C6NQ2h0fTgJxwLsMrkNXn6riMXx7SV
 MYazN97183Uv+qDGM7QEVbusczFxJshecbwsYj7F2ND63pLEPtPWHkDFLz2a8FE4PWFz7GD
 YWyRZCG7R3lVdj34aVIQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lyViRjBzNKA=:Xe7PglaPjfg5Jwph8mowVT
 X5srzJLAmBd7unNVmNoRTbmgDewuxK1Tn60jbeU/P+pKirgeQik9nDD/oMCw67VAuAKi+aEWR
 kodtdiRKMl8NynhAJBWt0JKJRtID+0LbF6tRWepC2LlYLTOPWWZd3vzH27Z4szuVRgbpQO6ZY
 Sxfp50OJpQ4vtj13DPLhAP5m7Gq3eUal+UbNhcokkChpQR76WvYkvquanAoDNYaAEys8ZcuFj
 leXmF7/GchACYMNiOADBuzdDBG4Zdl3CPNBglms0wt3ll7VJOpW5Fk5UqiXMcnpR243nQ2NG1
 vsgwGFHktq/La5BXQfwF0hcTozxcJ2E+Am2Sh4U4y5TbHM5Cit+BaWhhyHabNBQcsVfHYMu1g
 T0jAucpX//Gro5tby15UVnL8dSFjv0KGMzlHBRG5Iy7GTBxeqoBERIhO5rb/1QucD2G5cdZM2
 i2jGWLnffqGBZFiXxRoR/G2rw8yP2087HI37z4wu79pgyQ+fO3fk3N0CUfEO4/fBoucW0vTGo
 wkGgswEbhBQBi+n/1cv70BbTSeasYRgDjsOwLIAyIw6/PipNHjqawSVzN3oWf+m4xAQEzHnoh
 Dfyc4LJ1MoMTNhVxOegjqeGMZHBI8qoTZJYMME6fcc3sQZHuZSRgXb73sWAhL7TLqP8dQNMoL
 /9re2yVYv/LgBnZuWIn8ypg0o6X7Bm+DXpSTcyq/oR69iaXEkbv1jowGkpmaSOsd8HWBGeLJb
 js8I0UZKa31djwFh8T8lticVaJRz7pxx06hj8031sef2KCFoMb2Dk5aA36h59w/IzO6z7wONT
 OhOKGIeXManPb9p8InBGlBD5Fr8XJYsJPjpbmzRKYafkLIoBgUI+92W7CdilBwKqNceITTLuV
 A+TpRq0swN89ZERy7s0Q==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 03:29:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/MlyWWb7zWeQb7Nbp9PGHVem
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 02 Nov 2020 07:32:55 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Lukas Straub <lukasstraub2@web.de> writes:
>=20
> > The yank feature allows to recover from hanging qemu by "yanking"
> > at various parts. Other qemu systems can register themselves and
> > multiple yank functions. Then all yank functions for selected
> > instances can be called by the 'yank' out-of-band qmp command.
> > Available instances can be queried by a 'query-yank' oob command.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com> =20
> [...]
> >  qapi_storage_daemon_modules =3D [
> > diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> > index 0b444b76d2..79c1705ed7 100644
> > --- a/qapi/qapi-schema.json
> > +++ b/qapi/qapi-schema.json
> > @@ -91,3 +91,4 @@
> >  { 'include': 'audio.json' }
> >  { 'include': 'acpi.json' }
> >  { 'include': 'pci.json' }
> > +{ 'include': 'yank.json' } =20
>=20
> This adds the documentation at the very end of the reference manual.  Is
> this where you want it to go?  Check generated
> docs/interop/qemu-qmp-ref.html.

I've moved it above misc for the next version.

> > diff --git a/qapi/yank.json b/qapi/yank.json
> > new file mode 100644
> > index 0000000000..1964a2202e
> > --- /dev/null
> > +++ b/qapi/yank.json
> > @@ -0,0 +1,115 @@
> > +# -*- Mode: Python -*-
> > +# vim: filetype=3Dpython
> > +#
> > + =20
>=20
> Please add a suitable heading here.  Headings look like this:
>=20
>    ##
>    # Text of heading goes here
>    ##

Changed for the next version.

> Without it, the yank stuff gets squashed into the previous section
> (happens to be PCI).
>=20
> If you want to add an introduction or overview, it goes right below the
> heading.  I'm not asking you to do that, I'm only telling you what's
> possible.
>=20
> [...]
>=20
> Solid work, pleasant to review, thanks!
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20

Thanks!

--=20


--Sig_/MlyWWb7zWeQb7Nbp9PGHVem
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+w5scACgkQNasLKJxd
slhVwg/+KsWGr+CDeyG6HePSlvfQYsg+63TIC2Fug4KaD4EpUyi+oz3T4+EpFso8
sRKzZil91+alXKpqXjiLJz4Su0g+l0BPUe/X1W1knObd+mKKQlQ5RulDZYF5qYvB
sJavFVCCDZhZ8OJ7IfPyGJam6SUX/R31wDoTtLtXA7JXFpuUizBp0FrDDCPfVVnf
ZfFgiwefURxrQTZCKGjI9N2fsrmD3oY0sOQHQZwTJruKQAtvAhl6IWq9iHrUKPRV
dOP90kZrNGVrDGVGSKEin05gU2bDO4AFue5wp1lPbwOkVgAn9jrXzHR/OVEM3MMr
PZOl1Y9cIuOs8hq5cnFz3n24Cv6xeW1MNLZbAma2QvL+yA7mdDmm3kr0GO1Qo1zz
E6w2In1x72tnKtIRinHrHQHcRoBTSrgFLnqJCfI+swF0rxBYB9ObAKcz4+6DLey3
XvHuGhwIEEueX0SYh268dPGRPhIWhnk7sizuQ/ajrwMWETboeauky+LuDjhD+Gde
5QGgT9kJBvj3I3RkOfW1Qtjbq8ouHFTRrj0K2vXBskuM29IXZGWsABZ4n5jOQwcE
A2yCCStmUEIEA/g9IzL0Jz8/GQkylOtzNO0o+udh8hLlo/qJ1iTXGP+CI7irmIIu
K8ffUm+QKAS8EWLp+udLl3RR+er+3yW+Q7/zB5mZo9werpv3e0Q=
=04+q
-----END PGP SIGNATURE-----

--Sig_/MlyWWb7zWeQb7Nbp9PGHVem--

