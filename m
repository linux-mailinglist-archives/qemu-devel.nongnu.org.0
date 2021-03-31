Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99C35082C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 22:27:55 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRhRS-0006bL-4m
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 16:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRhQ3-0005TY-LJ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:26:27 -0400
Received: from mout.web.de ([212.227.15.3]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRhQ0-0002K5-6Y
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 16:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617222379;
 bh=uL+zDXkj3mekURXa6r3ACe7QZFGsagGlHPaWfwiBYM8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=E172qdgBezz/4S0qkrATus5LADh+fG2s8EUZ7LCi7uSU3ZPTwlHXUDL/mR2xm6BMW
 D8Gh24H1u9xWGO8QQLGoRdxXyWmSzmXkogn06YoByHY8MLTfJ8kfU0TPxgPXCVVXrQ
 yQ2sG/qnw6Hf+vJvkjWFD7Hm1uDfq3R8oULNoGgM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.31]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MfHhK-1lH9Y92J0U-00OnOm; Wed, 31
 Mar 2021 22:26:19 +0200
Date: Wed, 31 Mar 2021 22:26:10 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Eric Blake <eblake@redhat.com>
Subject: Re: Bug: object-add qmp command that used to work fails now
Message-ID: <20210331222610.22392dcf@gecko.fritz.box>
In-Reply-To: <3929e394-ef6b-273b-4a07-53295d18fc25@redhat.com>
References: <20210331215844.43914a75@gecko.fritz.box>
 <3929e394-ef6b-273b-4a07-53295d18fc25@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aCXBf4.xO7cHbHTilCGKN8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:1OZs2pG13jvWrl0NFlXGXoKBSuclgwfSptYmPpSb58eygTdVz6Q
 SH4955uy8pvK5CIUlah9cosSw/ADV/i/L2N9fL9Pf+H7crje16wNmET80XDILXUWiI9xoTj
 Nl2Hem6NHTirupHmjPDZHn3WPK1aKDxsBhaU+Qh7gfiEcmk4VEFcs9KR63fTSDb7GaVBv67
 4Op7+dadoMOaWDh0IVYDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zckqnz/9u6Y=:l3S9EZng2Wxt60l9u7c232
 d50pcBTNPlb7KN2hNMJygGq6aqzRNQ6pKzBAuwzNyYIb6i5iKJ4uM0f1fzBQkTm5WvwZ/cKqR
 n9T5Z8YK1ZoMZN/nuOv3p2Ulh/qVXp5NmUChugz+Wcuxt1DkjjTlals6cyEQcB1pMGC9ZAieE
 /t+y3I3ZOSSwMVPYYB7ou7RDgRzhl8GCIJWpCNj1ISZ8SCr+Azhf0q1NCV9mKhd11LCUL53ZV
 ujEP3AY12OPYGxStU8Yj4bjS+gSMzVEmZ4XTy8X48fMBV8fD8H4+QUIMxePLxRTYGSV2u86RI
 eRwa3eElY7obJFdE6uP7NyNbKfesD5SZ1qS/UW7fIReOnRLez6fRnoD/hmXr9/dG/YYjOFbQu
 YqG8Wy704tlYonIGjVm4gmvyNbrKbRj6uD3ApZE1bdxVoIDD+A5AGo0HCLGWw5JYJTloag0FS
 3TBzGZKOUOVbJnC9ioXB1AQ0iTcJIE0RoXKKabkVNuXBpU5CQI1c8OBF0m5aWHWgdgl+44Xpf
 pzAQ9KY3zpqA40yq8IGzVUfoQ3BDEL1WQ3WJNzLhpnyH5uq8MaKww6zBoyRJMT2oCzlJ7vcu+
 AuZZ7qHgBiraI1WKKjyzw609wiUwhmYsGJyRPrmTfy47gZJA+bs9Dm7zU2eUXQRvNwBueoNbE
 7qE2vXARd+j4ORvnJvVgc0n7eModv/1B2AdM4vmdKPCE9UST4vwZrk0E6mX4+hqFm8n1Syjup
 CkYSNANoqHjS/QOo0pjSmvs2B9vI632zMb4SY7lOa/s1dyfc+vd5WDcLT6WrisNQLsPh8pTcs
 meDSa0yvNdh4YQ2c/gYXjAxGDGZqE1opxjO6HEzxA3JlTpWIcSsxj016X2kbhHtTelzLbs0ny
 Q9qALMiDaSNrTC6iKxK5ov+TARLaREyFHJF/mVtN9lcxVghoOQTf5/XNvIX1u9myYcxSq93kG
 OgBKFNUHFRNqwDZuGVlOIJjTeiu2d6QACYpcgHUuG1BGqwHZ3nAsRiTmiiaPUE/ny2LlpHq95
 DO7ALyklYnTHzRo7u0vJv5l4QE8XahUECaV9tSXzl4AmNwC1Ce70H2i7zQA8shcfjD9w85ZMS
 XTl8/aOJwh0R2oSoyKHlfE2Kob9ru9NPJfV4ioDGM5KMH0A0FwZUwPZtl9B3wIE5tqBVDH9lY
 et1b1Shu4cLirhTvvXCU5V7nPrBtoh153CZbh1n5r6jWEwMxP+jQ3HNh1nt/IfN9hFKPI=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/aCXBf4.xO7cHbHTilCGKN8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Mar 2021 15:16:18 -0500
Eric Blake <eblake@redhat.com> wrote:

> On 3/31/21 3:00 PM, Lukas Straub wrote:
> > Hi,
> > This qmp command that used to work:
> > {"execute": "object-add", "arguments": {"qom-type": "filter-mirror", "i=
d": "m0", "props": {"netdev": "hn0", "queue": "tx", "outdev": "mirror0", "v=
net_hdr_support": false}}}
> > now fails with the following error:
> > {"error": {"class": "GenericError", "desc": "Parameter 'netdev' is miss=
ing"}}
> >=20
> > I haven't looked closely into it, but I think
> > 9151e59a8b6e854eb733553c6772351049ca6ab6 "qapi/qom: QAPIfy object-add"
> > is the culprint. =20
>=20
> Try getting rid of the nesting caused by props:
>=20
> {"execute": "object-add", "arguments": {"qom-type": "filter-mirror",
> "id": "m0", "netdev": "hn0", "queue": "tx", "outdev": "mirror0",
> "vnet_hdr_support": false}}

Okay, that works.

> Per docs/system/removed-features.rst, the change was intentional:
>=20
> > ``object-add`` option ``props`` (removed in 6.0)
> > ''''''''''''''''''''''''''''''''''''''''''''''''
> >=20
> > Specify the properties for the object as top-level arguments instead. =
=20
>=20
> although it is unfortunate that you didn't notice the change during the
> deprecation cycle.
>

Yeah, no big deal. I wasn't sure if this is intentional as the change isn't
documented on https://wiki.qemu.org/ChangeLog/6.0=20

Regards,
Lukas Straub

--=20


--Sig_/aCXBf4.xO7cHbHTilCGKN8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBk2uIACgkQNasLKJxd
sljUUg/+NaXI50yBEZxRi554njhAGvIVxhl1dV8FFwmzuhXu0U7sqQSocT/hTfNk
Bflcc+0VH/y9Wv9/LmoirFljFz+TvZCK879uiVwCmzmcIbeLuRwmqO6VN+DmoQgC
dboB3E6SkhK7/IqtAz9ebS6o2IhrP0cU2dvzD8o2SMfskO/KbS0c8o2T42OiJljH
urFQKjaN/5d/FVViDyguVrg9AzZiGKraqDewixILLfzL+JOHuHapYI+UjDRvyAby
5R77ru1MFBk4/XEBybxMlRdNmaqfCXl2mmq1mmoEgYr//piW4kDJJ+zgYd8sN8Hn
NLwk6iP/+ouMg/OG51qE1niH5j9FPwJa5KPubaPtrpehzXx0I8WYBPg/XCYcik+B
p4GLM1XuShZ78fbmq5AImL1oo0IvCkbd9P7QeGAP+uqlnXVW/BIZs5Xnt/fPrjDj
CdX6aOIWA1tK4sRrdQRGAd8+x8yuwXhbsnRdU5WZHPYz228X1TQA2FBzBG8AvMYw
QqVdYphXE5MZo5GMzgj9wruf9j7BKyZFX6ZZbNZO0vNIVu/UhlnXezU2Y99koepi
+IueQa1mu/5ZErcqDb65C4zUxqybBcJODf0Oa3+UIvvDCPeBFlY77lWgxFskQ9We
CZl8B8saVNGX4wIXVePeLIMGU20X5SqDNgqIQbm7ftbL2nRO4A8=
=zwPG
-----END PGP SIGNATURE-----

--Sig_/aCXBf4.xO7cHbHTilCGKN8d--

