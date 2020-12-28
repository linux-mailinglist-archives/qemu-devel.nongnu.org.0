Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D42E424F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:21:23 +0100 (CET)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuKn-0006Si-P7
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8x-0004R3-EE; Mon, 28 Dec 2020 10:09:10 -0500
Received: from mout.web.de ([212.227.15.4]:46475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8v-0001FY-TC; Mon, 28 Dec 2020 10:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168140;
 bh=GOnxK4+9O/IKhTXEnVxyvzhcPj1ugtekiJoF+Pgp/68=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=du2ftOJuD/TvwcY1fH61MFybey3WoQ0SylrHkYPg6nfKA7ZSbBqMXiArmHdMebhIY
 aeiJEw6Vxms4TV3zWtoImboWVJGO+TLZqqRVmYKO0r7IMgWoeyHN0z+ncSqtK2Mp3B
 D/UrlkA9f0OosAIfdVAg9Pm+lXmfFsLY7iX2ZyeU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lp712-1kQ32W2aGq-00etH4; Mon, 28
 Dec 2020 16:09:00 +0100
Date: Mon, 28 Dec 2020 16:08:59 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 6/7] io: Document qmp oob suitability of
 qio_channel_shutdown and io_shutdown
Message-ID: <32b8c27e256da043f0f00db05bd7ab8fbc506070.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609167865.git.lukasstraub2@web.de>
References: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m73hAM._ZY9MlX_OGEchYj8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:mQoab/4qD3ykZo1kxRKyh+Y48J3xPN0YqyjclstXx11F1w+YoMT
 abrhGXVQHhwOF8IFS0DNdSu0/pd5A3gb6kzxMPNfrcBM1legsTHjsW1qz6NparHPJJ4LDbs
 Wo/ol+02ZgtARsdScV5xsbhnEFfMA5YkqXaCnLoi8FqBHP9nlMCniAOAwMcm5JviNP1p3As
 e2rSePsj4k0nL/c/mzXiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S7fynHVW3ZA=:XkomK38hVc7jmvCGCayE80
 CzHx+aSU/fd2mpAJOsjex4BQtPVg6x3rVvhoh5sbQK1Z3jysZonOZ60Fa4yllknz62f0kQDCZ
 F31uaGo21tnIvsIdlKXzszQ1nwFB99VFJ3Cjg9kFj4PSENG4Y0G1LGsvUJbR5mZLC7iL4MPb7
 T2/kqdPUoM6U2OUEsxY4GCmHQy2PCbrSmQYnmg/aRHbNYdqRJx+gsBFSyiT7nVCRsR2WXQkGS
 Wz8dtXzf9MzSmQdK2iPhUpaAXb7nSy9QqdjORqzD4lA1ZS9fI/0ZVlBzYVFV96kAXA1gT6KuZ
 FfVxWutS+Hx1Ex0N66+KSVGkwysZmq8e07vv/YvFf7KxkRMBA09Y0LcbDKHGHT5r0kP08n7Ja
 qMssnDJtokDVekNl8UUDuxc23gILGzTDLHLeBM5eb5eFNqKmewUu/TMEs2JedQSAD24m2q4pw
 0IkyNGI7nijr/xJlv9iewP7KjwDlvcE0FX+DeTfJuCaLAO0r/bTiP4To/i55MoBhACiIF0GaM
 Qeyjk2Ct8hCgfgE5bZACP74aAk7gQGbrVM0tLYafrUxl2l8UbivLNToCrHb4gWA9+3drpEhJo
 zKVRQU/Ij/afXkiA5zvkYjIfL/PBh/9/3XHU7g0e5/KUatlW5G5d+dlNSaJNx2EJXX/AQfrBs
 FByR1VidLxK/juRIDmNG9Irys+RADPrf0/Wx5jVcRrXMmcsMmPn1LuSWf7DbOYXCgdQwEyDu6
 PUGgi0tKlLUV87+9DOQl3MmjcqmKiu0yTCct927/PtF3RigjUCRoQuIjkcSWpn5ydy2Q1WeZa
 CiKnYdYQzL8RuC30B/G9UADQ4t2D2Wr38KjrD2d9d2EAkr46tLXmldJV0/TNpsUQ+VHwRT5Xm
 KEqxAnRu2YTrLwU0mGjigdH0jYiJuFRPqJ0+xYAE0=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. 
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/m73hAM._ZY9MlX_OGEchYj8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Migration and yank code assume that qio_channel_shutdown is thread
-safe and can be called from qmp oob handler. Document this after
checking the code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 include/io/channel.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 4d6fe45f63..ab9ea77959 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -92,7 +92,8 @@ struct QIOChannel {
  * provide additional optional features.
  *
  * Consult the corresponding public API docs for a description
- * of the semantics of each callback
+ * of the semantics of each callback. io_shutdown in particular
+ * must be thread-safe, terminate quickly and must not block.
  */
 struct QIOChannelClass {
     ObjectClass parent;
@@ -510,6 +511,8 @@ int qio_channel_close(QIOChannel *ioc,
  * QIO_CHANNEL_FEATURE_SHUTDOWN prior to calling
  * this method.
  *
+ * This function is thread-safe, terminates quickly and does not block.
+ *
  * Returns: 0 on success, -1 on error
  */
 int qio_channel_shutdown(QIOChannel *ioc,
--
2.29.2


--Sig_/m73hAM._ZY9MlX_OGEchYj8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9QsACgkQNasLKJxd
slgnTw/9H4kMFGx6W7Up+bi46Ny+OEGwkTq4msLHscETvqYNfNG8yu9/7WW20Nwr
5/Lw0qy2FR3YlHNobGBQNUjo0zXmCnIWbAwZdojT6coqb4IvcRP5fnuJOupt7EO5
t0ghIcRh4SflEE2dEC7Ia/tIuoDmwnHx/Q/zllIMe9L0v/ABiQKyi2UeZN8UfxUu
x5p01oVswbvP4KDd4YWg5Z/ZfF8UxxoD11ksVsYXy9LSoXlTbKlMsNMjqlxil0QW
aTnV3O6OQKDDh2n/YE1OtaOzAQ71kikhYF4XNkM0vR4XncSk0Z+hn70Sow7r4b1I
m7GFwCZlUt14lu1GTaZOIcdKMGvbP49BL9tDAgR/C8mhLCIICqWqdz/JlYI4OtYl
/gZPvQBHbGp/rXUMls/WSmIK55LoJFOtY3Uy+c2X0M3m6ew5fH7BFWxkvcxstPPs
ib0Xr3zsm3iN+cHX1hczx3HSMpwJzx43eQ7wx37NZRDe55Oo8hNiAP/zdU8yMUBR
jkf42y5ltft6QPcX7oif29xatuz1SST4m7Aili+NuCgNBwR3RVNAPwe8hKY3C29n
hRap3vlVwcPgbO5tf+G1nzPF2a95uX0lHUesXs96AQAOEDFNVcPippgjK3u0uTBM
1ivbIMWVThF6ThGgS/K0Eq1pdjNN/gO0H3/SDCTaY4HZlTB1w/A=
=JGpk
-----END PGP SIGNATURE-----

--Sig_/m73hAM._ZY9MlX_OGEchYj8--

