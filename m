Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5B2E4147
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:05:38 +0100 (CET)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu5Z-0008Sb-9I
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttzC-00034W-BM; Mon, 28 Dec 2020 09:59:03 -0500
Received: from mout.web.de ([212.227.15.14]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttzA-0006b5-N3; Mon, 28 Dec 2020 09:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167535;
 bh=QI3mrNzj10vI74Bk2dsysQrsN0HaknZHWM9x8Uj2gFQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SU+sOdTQ+YOmRiMuVdSjXnLpc186keWvf3HsjDTxMB6HF6XWaREUI4Ple45u6apja
 c/tBOlDv0zoXU9SwQyjnWcqDA2GusGuwUw0ZfSbp4Cm54D00HfBgW4mG2Qi0Gl3Eb/
 NgCrBNwxW4TN73GoQ8cTc1FudlwR0wcRfBohnll8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJFhX-1kaJjI0e2l-00KXg3; Mon, 28
 Dec 2020 15:58:55 +0100
Date: Mon, 28 Dec 2020 15:58:53 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 6/7] io: Document qmp oob suitability of
 qio_channel_shutdown and io_shutdown
Message-ID: <4bb8a3f8653353f03cbc796b96871ca3c1925a8d.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TfPekmIxY3g.3UgTV.YJgxz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BkGuW1TGI1SKPefLGGhR51hSelAGPd72ry/Iq/SD+JnPoyRKeAo
 WR6S6/ZMl8inQ859TiD1lRU1et/7/KSUPCrpNQZH7Hatk35aVEhSRBtEC7E00yY2PbeZqvg
 jk8PoievXn0qcQu7+lNbv/r08mrJac+Ug7+5ror0zb6bXL66HpLK9EtcNe2Kt0oTlxJy1Hj
 8WSntlyjukZ8GD64jqQUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7FUe3J/NMhI=:aPpOCjoU5QNM3H7vlJz5fh
 JAFkEU5KRn2wzmI3wn+zsgX0ZETvHmpIEHm3MOaTz3Z0d4Hc4hq2yDtprMR3rtvZui00Gbg3w
 iAwr78yMhLq51hTIVxhghF2WePGQxwCwH9PBT7xTFaVWpg5+mOsu+NsIQdPCeV2Gv8g0dT9XL
 u6MWA+KwzmNjK4jYHB8zmoc/iAg7XIJX8ztrgGPSRs5t+ig/z8JznmbK1vIB56MnmFXkrqcDe
 K9VvEoJsRM5LXh8kF+8qEqpYLk8UkQHFnJbDI0zpbCSnj9OB4j2+bClC6x2WzFlSXQB/jdnGo
 uIiKw+e4SWo1DH1FOcW/V7Jogcj0bxrzOPYHtLv38lMEmYS7tfM+lOVkwLm6Acjmb3sfxhqyU
 qjcoulbVUWtrze/Z4is6tq0g7GxvLatzCZC35eewuaNlMNgWdsRqQCwnw6oYjIZoayIXr3T20
 eL7ViYIJcX7TCJlZVrdsF3RKCBSLYTeoA2vy7j3bf2yJgGx+NZ53H2I/FlIgsPEdMiW/JYUiq
 4erKdpmNtTcfdk1baQMuApsQg8YKX0Rbpu9CaHjAv6NKq9/Nm80sJ7KKpAjzzbLhLPNd2A0tp
 eBD0cFIf1+ckV5H42g2tHlcihU1OgNgIXAec609aGG95bYBu7HJOxpXfUNeC9JFETmuP6+BTh
 k6e6AL6NrQIebQok6N+/F5+MrDHEggt6Kcz1RLBjB2vmLCoEEKQwldpjtdl4Zr5L+w1ODjH+v
 NTAZwpQquypHIPYnCZ45Mwv/SieK+JPRfgR7Ah4ZaIgYK47jK2TdB2PX+3xS0ETDCbrCfZxdU
 QsMJuJsBANmgzjrJW7aJznh5TMRWi5JOqg+9/uK/lDnAYgBDqYdkOyHA31FUYYfWBLgPnRheH
 PLqfgdN2jIrY5lnn3tS4XMGMezmWbt8KTF3zR6K0k=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--Sig_/TfPekmIxY3g.3UgTV.YJgxz
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


--Sig_/TfPekmIxY3g.3UgTV.YJgxz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8q0ACgkQNasLKJxd
slgcjA/9FZ9QtcrreXZj2Jy/65hiYC2bbeg9ZnTLu1TfKS3JdnTiudVQf1S0sdAg
JheAevF+0lUdzDMeM3yLkxC+s73X+c6ZSHl39o3SW7XVoHCcHzcFLhgwslm2wkKF
/TPt2/fOqD8FDjxZLdwBc0AWbq7g7v+cuRHQ4PtXChBnisMIkrsjtYfcwSzRrefZ
T6+TQwJhf6+Yc4tXJsauPdVrElTXjm8TUOPQm1RyMHgMhayKOA696900JCZy4oOX
vU1NvyNf9ZFelI12yAw4Nf3N7KieyRkwgW1mpgTIxmQfEoWBX1hjbdOipE0Wgxpf
zkv1Y6XiDe3Hb78sRnngew/yf8N6ydKMAinh/eWr2jxr2ETf3qEc37s2ON55hJvA
dwJWeXNCM7W25PlwJD3QdtTxu4T5b3oHtza7V7gg8Hw6gs1mmjT5cjS3j+7fuFcT
6Su/sxMw4SHfQa+aRkQAIURIQQ9EtmIoBDzO/yJLMTusLOoKzwi3TrqgyWsh2foX
uy68rmOAJDvh3QZeukA6yL5qhXVA7BMAW9wwWjKf18zOCE6Q2qj+pZ1Jf6lIu7VZ
Czqs/ysUo5OYvWzfzX7QXaYxLydEdZsMEadN44TwXGBDPpfReMvlVpziqfS0fhuu
XUJfz+DNxmxMUQzKWazjYNrqOdSJdTtSca3b2STWbEvzPJZ8hNQ=
=uORr
-----END PGP SIGNATURE-----

--Sig_/TfPekmIxY3g.3UgTV.YJgxz--

