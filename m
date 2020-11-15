Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576B2B34A8
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:41:00 +0100 (CET)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGOx-00027L-H7
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKd-0005IP-7B; Sun, 15 Nov 2020 06:36:32 -0500
Received: from mout.web.de ([212.227.15.14]:57959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKZ-0008KB-C3; Sun, 15 Nov 2020 06:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440181;
 bh=Tgofz4TqQkbVOqI6lXeE1WM4V8ken3CEM4N4qkKocwc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=eHd10ePVu7sVpvcWm71rMgc8xXXTm7VAR+g9mvhjZ+hy+NJ1diExXpy8H2GQJXL5A
 qvi/vlwMcIiAYtXYE21Ul6v+OswT49scMenCHl6+drNCNPeWPbz2OUU/Z2yn9vcVbT
 VYR2nuaS+z2dAwTlT1zavqwYAG6gZU7Ywcj5whlQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOAmi-1kawwD1Zlk-005biZ; Sun, 15
 Nov 2020 12:36:21 +0100
Date: Sun, 15 Nov 2020 12:36:20 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 6/7] io: Document qmp oob suitability of
 qio_channel_shutdown and io_shutdown
Message-ID: <cdd379b5e99722153c450475cb39001bf7f7a520.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p7IR+zRG8c0v8ah8ko8OIdR";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:4WA08NBdqkAsO9E/3zg0TxOLscciiFJKvLnGw9ZdPa9t154hdWd
 3VFaoODXvStoeeyXfaZJXgaAYsI8zWl+X3B5DGSnVbNkaAUqdCU7EUpHB3uutO6wz4T5XVN
 c/GTxZZDr0L0hs4niJrBkhfv3OiAB3DvCqt+CtjOP8ek14qu/5KJcNJC6aiGzh3iT4+9vAr
 Y/jPIs0KJu3Wn4WJE+K+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1einL2Cuem8=:TdVj3uetgao/9HQHdBp6zg
 ESpwNPe7HfQ+8HrK3Pm7xySZtJ5F89ulI+H2AiyvLnr4s9j5blhYn2b0Iju3tC2XZ97Pe+8xL
 EUBYkcmyRaV/62vy3QcYgcK8vurLbJCVrwKrTAzzYleWUTpKa7CXUwnQgll1me6hH50AbMBo2
 04s0zNXrCe6jG/BVCmbI/Bk4IzAKq/xabN6cfK0X3UrdUcIZoHu/B1ZW5gqVvR19haKmyoXt2
 /ln2Ugy4rW6OXvSmu+C7IHyRx3HEFO22xbu3CIr5S1W20I7srSkLqeNdeCtW6hrCMX9mEwDup
 I7WvEzRCagRVOCNAoY9UbfTzrKoKmDAIYCzvrvuIK1+bsg8FeytSHjL5YT5DjfAdWwEHyh/Cg
 bg6/2nDk5T54CSB3qa+PIqk4GlVrBxM1/CHta+2Ju3lxzaitFFnbQsXqC83GebybfqyABB+/n
 29MKj19i5TxHg6dpVHEbUquMU+DVgDHB1ZIQqnxOdHT0pb+KUJAXHwssLGDTi0HtSPoP4TmZb
 lDHPvQ5RwoQiB/5dwU20NYeRGHMAvPk/m+FmDaLFbibrel1vyV9b2QDrfBHWgGt5CGX11bg9A
 vHuSf2hA1XgJe/h02SMxkKTQ59tuWWwugmOTK7MgIQ/IFIgKGXhiqYigxK3l81Nh+cHG2wwnF
 kYyFtGZ+iZZaWZE9Ar5CIqYHUKTBv3xiU3wPOwFuUTlYkgZWTh8C6xJtUNgqAUEDGCY92RP8o
 FedAg97D1MYEXmdoXdGeqsLdfU9YpXMHrRLvXcgISjaYeqZUxpC5XiJNQaghKlFxxGdQ61d9X
 F5OT34pLplvGwaenJxoiGEDZ7TeDA6SCNvTen/6Zi4GvmTlC60xQEBg0521FpK8FWCTdABqfx
 A1OkqDIVstZz0RZbx1BA==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:36:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/p7IR+zRG8c0v8ah8ko8OIdR
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
2.20.1


--Sig_/p7IR+zRG8c0v8ah8ko8OIdR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xErQACgkQNasLKJxd
slisPg//UzdNkPvdTJi5VXHohfoMmQkhAjn29JD1SpwM9tuug53jbBKdYzuHag6n
F9rADR+Ea+oVWTaQJv8CfiB1wIwwVszyKIoIihFF9AGMfKP6prohk0PHlosvq0iu
dv1fCEv3eFMKkgiHUJ3Pk/zKUftJEsAwpnsL81+/mmQ7NYkqDTZ66z95ROtiwuFY
vETs6mxZSaxw7S6yhpaidShJJyO5O/VrEiLc0a6vfawmdTBzoJoscLMYlSBxSvYf
sEmda6gVN9ZEyZn7O8EX4D89hoe++5xRCbGQ99heLEf+VnkYS3UorSx5zLlwIh1K
NzYkObOLCSH19rWtqBvNpFS+bVkkEsa2fKY+JBQCwyf4tKa+JginDbrk9wHe8Ci9
IjbwYzyEP9ssreT17LkG5k6FeLWNb8pORhYHgbCVN952PQNess/Sg0iSAg8BAYZ5
s1IgqOVWD+bIskXxUg7EwEpciZvuwy5dmub94mFNU2xGf27UI2eQRqZfuhHHGbC9
7Jb9zuLDiZNggIHLc1YQ94CVDVcRGZvKygKfzKiqxGIP6/tSFpIfQuXZSvkiOnIv
+PEQ5EZxv0ubxKckwA4TR5PTPsf2GqJP34HwIxlz4N9dqhNkOHp/B9HGVV3zFqXq
agL3QbIgm6FprOx9f3fXvU4dhoRnh8W4o5j8j3gopgr1RAVvmyE=
=PzI1
-----END PGP SIGNATURE-----

--Sig_/p7IR+zRG8c0v8ah8ko8OIdR--

