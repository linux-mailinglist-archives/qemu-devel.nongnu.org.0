Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC63BAA89
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 00:34:54 +0200 (CEST)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzoDs-0005pB-Pm
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 18:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzoD7-00059W-SI
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 18:34:05 -0400
Received: from mout.web.de ([212.227.17.12]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzoD5-0000YC-WB
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 18:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625351642;
 bh=7uJgzDnDjED1ENJhjwEa6hfn0ISsQ/T2VU7zVJmY4pI=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Pr3LKhzosOtDPuFmiVO8IJxLc/nkk+AIverAV8Rq8CIc5x6XxBE9VCRXZMZXGh1HZ
 LajTGnqkXklEfTrX4VtQ2Q2JJK9Z6CbnNsWm7+04hiegwoUZsRHfC2jVUkVKuhC11q
 7VSatKJrFZn4K+NKP94wZ8Ja6qjfm4yiAMPYnYT8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.254]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MaJng-1lkLis0Rmy-00Jqbo for
 <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 00:34:02 +0200
Date: Sun, 4 Jul 2021 00:33:51 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel@nongnu.org
Subject: Test
Message-ID: <20210704003351.0ce8d746@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6tExjObw+UOC_Zm76CfueYe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:h+U3uyl0LDCLhr9Y7TG8d4IvrR7f5VmKGeYf7XkhpS4vV5pZNog
 By/syp5YbsWI7CCcNnXWqM7/BnB/+hJ4yNVCb9T0eTdbKKe9T5jNvNmdX3fikoplFJecdhs
 Lb2fXtuKqEi+VVMpZscfXSRqh23Bz4a2QJrUpYvQe3ORKJBu8r8NhlhGvWpYhqZPPX0Tjsd
 D9wQEsk8dUOrhGBPXaAuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EN1TWJpJfH4=:03yFql1f/H81sDZjnINBqZ
 7fQ6BGQzCEeR9LL94IJXsfIYHQHmtcLmXAgvqECs7EIRbb7M7NlHx9x/LpIs7PKYPpqW48C9f
 MZmL2qfJq9oVvlwNQGKsKVIbluM45OP/00zNQaAwALNxBc0ThUIq8qcAFvVSqnp8+7WURJmWN
 53mgGm06LXzKxP25mhbGVbAwO7htCtUoo/Eg9V1YOSeoLI/FWT9F3uV7GCFpHfN0d5P2AKl00
 k54SaZVpU0s63hp7TOX1DagPBvuD4xv08ATm35sI21VrysPcqNiRm/BiFvILgehIwuWA+XcYK
 YsjdsB81vgXqvjxUuE7tdweQvDxHeFN77kcQbN+4MrZsyOGYFAzfSNo/fz7aXbvevhnD9Jpy2
 k79na6+jpsfAGHWWEBGuL8YhFwdjqhNQCbYzrx8MEpS7g/+jtlMN8SyyFgLN8c0gOl3VzHOkA
 cMmg2PYUHvZvA2pPUI6XC65+5/egFR1C+I7XwwqKwd9raQ73+W5c/lwN1COSDMTaNy8uVK7Ve
 n+889eNlgVUPhd4sN1qGJeuPtGRHnlLxednPqJA9u1x2jSFNXRp2g57ugZu1eSiFI8lMbgSJZ
 gbqyZrnFP4rsRAEJzwxBswau2SwpvDLl2sT7o1IuNurSqWUAaWX0Ig1kPPsui+d5S0POyeTHl
 Q1p0ny7DWcymRAsxw+9GTLtJvjomJXwUUuqB+vAKJqgXTqiYXD8LDRGtvNvdJ3K84n+S9tf7v
 wHud4tyXOE9Y3heF4VUfn132qDFeYPY9T5uoGOsmVNxlixbrK1Q+0onK1Nl87y6KJ2VIqf8zq
 8siA78Gkkd/iNOtWkFezdge/0TXMQiGrIBDGdmS5Mwm5c4Akyc3u4VraqqSo9I7BaFAIyCKfB
 II7mdIOyGnQOSu+zxA6RI5qWaTVVS9NI8tBFFXnzHZ/0uJv72mBsBkH+sACjEIqvHQwZOgImX
 0q5F9yE43wF9UUvnxMsyafNzVA/IgyrFC5lZ1maYhdSrIv5SUlEZmMk+KtqpWAyHMTEtkak+1
 4iFHoZ1ClxJcE/FZyci4O+g2BxMoU4KCTY4ZYlMNASlcZdoc5ohDdcrWHSFSroyVwfsfhMWuF
 hvjhuj8PirNVRQuZOeC698Mc3rxmaWDLdN2
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/6tExjObw+UOC_Zm76CfueYe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This is a test. The mailing list seems to reject my patches....

--=20


--Sig_/6tExjObw+UOC_Zm76CfueYe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDg5c8ACgkQNasLKJxd
sliO3g/9EAyVuad5chq/djv5hMWOzlQJkSS6SprYegqgLVEI0ylCSrs3VSfXAgBI
z3B+Ktujaj00ednbeb+L+eZEbasJhzAQOtX7um9LJdAx2nL1h6N69u7B+Mhs+WXh
EXiFuHfoUiUfg5nWQmTHM4tNDj2mX0yD8rdaMA+tdWy32+RnsWXkHVK9WRnLFa86
wa94X1i/vThJ1HWpw2BAiBnbJC+iSmwvgFyTu61qYrAKMUEJpWJaS99H4OJY5oyT
MkL9mWtaqGhthsxyYWfwRybM4sFX2pb+BUK03WuIp7hO+5CuYS03qzIVWZ9O4cF/
5B8cDaEUOo6Uju660VJfOIIL6NwM/PVmT8VX0UMPIKFJF2/Nw2ACzMBd+7r1k0rc
6TPxXJCTEWgYjdWJuCk+vGP5AKoJ96Apkb9VxJCEmXoC4oW0OyrL2H065u4/o8Xx
ZmsiwH4FNM7LVcUsX+nbiKc+NPNKs87Dqelg18TyBSuFfxG8WZCwF1Mae9jMyQDt
R1n5DqgqCAxDte2fsJQ0YKEkeaCPt5JI5cPPsdb99LMbZICbe5PkDsUzoyqarF5z
0vRuOq+Sc5jzRRm6PoswDAo0g/pb1+iadjucc6xDfLF/jNoGzawO0DqMXSB94I/4
oSWRZu0mwrlf1QezBa46zcotaqjIxJ2MoUUfddIJnwPI+6ESA60=
=d08v
-----END PGP SIGNATURE-----

--Sig_/6tExjObw+UOC_Zm76CfueYe--

