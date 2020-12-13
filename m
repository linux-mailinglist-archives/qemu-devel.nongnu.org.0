Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEB2D8CE8
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:56:29 +0100 (CET)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPzI-0002nc-Pe
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrq-0005d3-Ug; Sun, 13 Dec 2020 06:48:47 -0500
Received: from mout.web.de ([212.227.17.12]:33115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPro-0002Py-8i; Sun, 13 Dec 2020 06:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860118;
 bh=ow6CqJwt6pzmZ/mOKyfaSBI+t9Ysq8dUW+Iznaaw7vY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ttq+gmpGf2IJWZPeOdw79VBqgw+3my3uaj//ZYrG/ZSj3G6CFXhck4m0nfZD3b2VZ
 bcgpI/50ANYZMUIj95GdD5VMrrVahstJJhyggBkKgoxjbOgb1gkar6MkC+N8RLAu1j
 tI5V5OkeQ/cgTP39ZYmjAtQFIraefN+L6n+fxRRM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MREzO-1kREAs2gNg-00NFxW; Sun, 13
 Dec 2020 12:48:38 +0100
Date: Sun, 13 Dec 2020 12:48:37 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 6/7] io: Document qmp oob suitability of
 qio_channel_shutdown and io_shutdown
Message-ID: <d4bdcec9063d5de6d2c7255b0fb655bfab00cb31.1607858747.git.lukasstraub2@web.de>
In-Reply-To: <cover.1607858747.git.lukasstraub2@web.de>
References: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y3lGdAfFuOPMepDIAEWOs=6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:XBCsRBmv/QvQPbtQ5FH+99xa+rJUpH24txh2B0s1pvjW8cN3o3F
 iSZ7Iw6IhGeIO/iDshNpIRCOBOPvPJmLjAl79BA4XIIqWTAPmWiWqVeeQ2xn+UG5wd5OTxq
 sDUf0/KDe0ZNdRRe/jRAYRlUC3F6N+QbF/pcG0O2xCtsPOmbj+hvQDVaC9WTc6Y8pi/PmHm
 u+xUD9Lbf5KvrFCVwYtLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:z+D/+oNA0Ts=:jaL9UcM3bQZHhbgrbDJ6P9
 h7cq8azMt5qmOCdDgqWu3LiGJFIVDFeU3oVP84LMKfqG+ADwQSxQjhG+RJeHQVMrMvDsEf0Dw
 oWlSW9j3MjaP8OZG9t6d8Dp5focSflKWwQ+4CiEWEzl3qE3f2kV6SpAkQPKuH4YnqtsdtcDVd
 qj66+iTPYKKJr2zXNrhh1RnqRszWns2n9XTSewJ+9WK0QW24j7wCVP7CnmUh36B4pFgkMQ7rg
 mf3dEG9CI4yNGykjoEitxJEeHU2Rg5+KQKaNICfHcY8FsEAeN/bK6clo7X0Aaeu6xWi+LlRQ6
 4FrX/rB/biPxyemf1GfBiz+ITSzj3HlhkvjswtsPY3AI9QsIgdzP8aKIlZYofzUXkWoyylVIP
 daBv1Z764ArMD4GEOjHpGWMACkh7U8v6SCfG+QOyg7fg2uD2pwQbIoei2VX0QQDLCRCNB9WR6
 3YvPm/GVn6vqDIBMPk5SoGVKlJ8L3Q72L3ZiKVj8BHUpaYHI7c+uBeYPjUHQtGI8W5F0GBZMq
 qqESofeYP2HHtSN3XFVLbarQkN44EdBbE25GaV25MKk2R3bPaLNBBBgpbaMyvlbZhsZwDGQMP
 WWQhSdPjpLv8Wmjtp6YVcXF2hY8WpwFhrVPBx0jeC8TcxGO37h5CFoLSJiNd0rxNPjdWBjZcj
 BwtUMB9bm5/hVblTd1BbD7BRQv2DfTDi0Yz3mlkstJbK1HvyBcxoY6yGrYiWItF6u2zhpylE1
 NdKDeECWrrt4S0Q2pQMNrx2bNlU3rb9IDfQqUEKB4gmeA+Yxiq9oju8z6jhpmd+8CEsgmUStT
 R7Vmk/J5pm7GWM8AUVKNYcgVWjJZWpHMtnokKJcd4SMluhFFhPgB7PYrjxAWmnkUmh1Jcj0LQ
 SwvBWk9GfZaYecoXmU0AGBhHpaFQK7vY7GWiirGgg=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Y3lGdAfFuOPMepDIAEWOs=6
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


--Sig_/Y3lGdAfFuOPMepDIAEWOs=6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/5UACgkQNasLKJxd
sljC+RAAqo8A9WOh2NEHK0d0TLmTQnHNSzyTu9kioLseT/9vt7EphVKqfONG+Nlu
J53x9BvcTb60PqhWB9TWnvGt8MNmyz4Zs0x7tD1aE8Bz+A/htdPDnHaxCpkrauUR
tDj5XSkzcb0XAOJPv6E7on1QDMVBtCRHFsgpwzht/4WVOlr+9EgwtAfV3eYoJsQ+
SWRFv82U4rrM5/3ElFGgJfP3WW20SWXUXsixt3XgYZ10iiGAyEukoEnhGLp9oGhE
04PvU60385siY/CzREiYSuQSVBxpuF/HY8JE86UrY9oDAmrAiS2HWjq0ymkKcTPr
NAP0Tyyc+gew5rRM8oKOyWDshjT7dqldea2Qo7kD9AP1ZreBhWwqqDGvR3wJWp+c
/2CD6frMUvvS0VMVgeUTqUfMl/S/ZH6ZwSI0P4sy7m/ggKI0ghOobB3n6SyqhjS0
Yr7+b/ZKPV4ee1U0NTz3M2xid989/+PFkBlhAuqw2f9AAageTcx9Y2SjJbbbiKAB
STKIn85J34ZFitP6b6QnMSJQZio457oVYlT3p2+DMzQtdV7mLi/t5nX8OytUA3Gz
qajUDNl93azY6KC8XqsZlgb5AmMNC5VNFnqeBc6wicx8bE0lrBIOJ8/Pdo7KVzvR
Fg+Zkhgi3d3h2Lw/JzL6LwnXNss4t3JQHiMjnqSoNSNyzgtSzow=
=Qd6+
-----END PGP SIGNATURE-----

--Sig_/Y3lGdAfFuOPMepDIAEWOs=6--

