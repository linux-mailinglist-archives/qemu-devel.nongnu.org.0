Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F06D3991
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wX-0006ne-HU; Sun, 02 Apr 2023 13:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wO-0006ly-88
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:33 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wM-00043Q-NH
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458186; i=lukasstraub2@web.de;
 bh=IAGnIZLHOuSuLfG9XAUm8ETSUqR6wgi7NR8ianLxB3E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sFCgUJUD6A2p9anqdX0kj3wT583jXfvg7oHJ3PZjdO3OfJwy7FVN6Cbyntz2NFtkA
 E6mQ5Q9vD+w69T8GwHTTUwqUV3o1wypacid/6mHsuCKUlm/l01XUpyCSLvmetpnSxt
 tQv3jqEu0uWgMsRsYWXpeRAt09PPnocOMr3XIrbuw5xhG8FLIbNfgip0+sI/IdV6/P
 VVWf2W+0eZ1VLfHE0oCu8MQObcxzq/MbvL8o8b7RQ8v+uY6TVkJRlmnADHLioAxBZF
 LTw7PTlRR6NkAB6LTrY+fbppCzAeFz1k1Z0M5NG3wtolb1cgSLXU7xHWb4/dDy0BiY
 7rc1hc1XjE/NA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWi5i-1pu1MA1kW8-00XV2w; Sun, 02
 Apr 2023 19:56:26 +0200
Date: Sun, 2 Apr 2023 17:56:25 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 07/14] ram.c: Introduce whitespace (squash with next patch)
Message-ID: <1a748d9034abc42ce5fbb501e7317fa55da36744.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ICxuj.30cB1dN9j0dFXzJdQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:m6qFgWIXVpx/1o10in5lom77EJhSn8w3WYCQ+eod545xJx5r+9H
 O9oCjZvA4B6A9lVVBo8wy6AW55OTnWfaf868fXbdxiL8QJ6G0JzINgYh0FzwZbZeG+NVe3t
 e4r8O0fGJGwlzdfIFRIKePUp0ECWUNR7wF6SOIT77PIjDRmLBjwKZbehdmSdV8HShuHHbEz
 yaZ9ZtENFMwTnpgUjXI4Q==
UI-OutboundReport: notjunk:1;M01:P0:zxyCdYtlu9g=;XGKuNIgsU9KgTs1dVR45fN+C9Ap
 qBpf0tZQ7RgObBkSwjueiXMyP0HpF8jF6Y25q+euoUSuniqqbskSUGyW2hChFpQvBMw6iOLkn
 C8ccClcR6fC/bK6w2X9PGhPwA1Htux6OU5HFpcuQ4PBNfNa2MZ60et/GrRd3Klsapi+TSV/NR
 6yvmfvpV8j6y8h4BeOnSs6ycIP0ek8nqoIVpaFhJ8s8pMmMl6XTjkM4IKIEYR95adLaIbPw8y
 ozxpOgAv4dlp1P9g3rZ2I8fJCX1gcfbAnhNIwqP+dUpF0RoirPJuX+ZwGWjefesfEIphBrVvo
 TAkDmjm8XDBoSBUPNVlDF7iLELzvBRB4Cbh8dag37gFKOANUwucVRdaVBqvpd4GMBz/nS5JWi
 ZMTlvqH/ABzNflW3OGMRJizfnlMTjrT3xIYzEc1mPhwogCOJmW5gvw8CsO5uTY5aI04tXC0BS
 DV4mj2VqFdOyw7pKivkHVXqah9T8G8OSS67zEVtidxmqvjKIn0tXXpztBHk2I1056tRGpa06e
 tqxGob9P07NIm87LhJsWmlbnNFFIMUqs3CLVkSY3RWkItyeNdC4a2xHh94W94P3a7WEk5Hnlk
 U+qzUmXU7+sDyD5ogysMQm3VDK8pmTz7Obneo+queMuzlMpyz4SBfX9GEr735PxVY/Bswnx1R
 xvcoYMWXSf3bBk/WMaEHRiZuCyNRwziqdeT3N6CGjpmAdZ2WPHjcMb5/lXutasdlIjiIdZVbX
 N1KGYjuB064tMk3C/42VBOfV8m0m261LAqubLr/woP2V2DEaRMFAnvXQCyWWXVOiy/wie5igt
 TWA+2DWBKjp7yjXI870/AuMKcI0AGWPId9u8oxN8KNyydUlrNQbsTeqEWy/cUvx6OeTl3DIUI
 pmVJmGb8ITeIMHCKbgm/6S5QCQ2h8n5VEr6Etsqomb2t1Gg6V+ZmoNN+NGUwtQLOAJyb3cuba
 UTkgDGsnqHh5Wo7tAxzdBBa/p5s=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/ICxuj.30cB1dN9j0dFXzJdQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Introduce whitespace to make it easier to reroll the series.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 20428ccf42..475c04a18b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -602,6 +602,12 @@ static void *do_data_compress(void *opaque)
     return NULL;
 }

+
+
+/* split */
+
+
+
 static void compress_threads_save_cleanup(void)
 {
     int i, thread_count;
@@ -641,6 +647,12 @@ static void compress_threads_save_cleanup(void)
     comp_param =3D NULL;
 }

+
+
+/* split */
+
+
+
 static int compress_threads_save_setup(void)
 {
     int i, thread_count;
--
2.30.2


--Sig_/ICxuj.30cB1dN9j0dFXzJdQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwckACgkQNasLKJxd
sli8uw//cnDZNDXg0Ip6CM+qDGOv0x7RWtbrSoGhQjEoMrTm1rZhj6k2OmbBpEZG
CzONgFwW4zMn3Vpa1of5LUKXBA5XLOCx/u3CwvOAP6huo/vRE+LX9fMagNTZdSXM
tpt81v+NX6JnelhzxMH/Gb8QUD1tBkccP7UpStgr/PQgX6Q9Z+ty8SzfF2YA/q/x
jreXUUq9lRn/QRrCGILw1o2Y0OroYoXcYRM4XAv+m5pFJdvTh0UTV3Nc/96GeHOq
vr6SDkHji2/qzYJatD6qDx/58+931DCZQWclJ+f1eyUMEepP17IxohPTme+VYGHO
tvIC4wg5stXRHUwR6BFQJ+f86J0LVwO1F4kJ/cQoAlPIERdD/yzgBpRyz8BV8eZZ
4fu27dCuTtge9R6Hy2ES5VwyQLaIdk6ru/h6M4QBhgG2Z0xZzZI1ZNBG7O64x6Ew
ATjAdUHQa1OknWHE0kJZSjWI1SDlevLrAqxQyhV++sXkVb1DERhvKAGLb40AhnXE
aDjrI05/e+AVV7zDTowIXQbJPu+fn7Ve+G2y2tRLr7Bzmub8XqnvqmgWkObebt3W
VhS26CjLtqQj87jJwrFliIDvNNS+nPmfBcxoyFLgOAFepgq7pcSb+4JRyUP4vldb
baLnSJlwd4vz2gnbkLOqVG3cCDliXqI7VgV9nmDNiwQc4VKUh1M=
=LbQ0
-----END PGP SIGNATURE-----

--Sig_/ICxuj.30cB1dN9j0dFXzJdQ--

