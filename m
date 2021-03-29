Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFB34D7A6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:58:54 +0200 (CEST)
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQx6C-0005V4-W1
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3X-00046H-I2
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:11 -0400
Received: from mout.web.de ([212.227.15.3]:48629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3E-0001VK-Nj
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617044146;
 bh=ybGPFs+IiyELjdB4kjrWpvCjsGqjwjL1p7axE6FExWY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GGjcspO6JD7IMeKczTzaPbv49OHpLSPWRNrnWDw89LvhABCUjtv2lX7X3SiReLXH7
 nRYB5x0h07kPKoSKWHUs86rGWBXoqrIbQX0TdUPvdrk8vBRjOSMuZaJOBSgckjcgd5
 5RZpgqJ4wDzeGZWaWKfhOKkFiK8RL5lMR1YUT9UM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ma2V5-1lCSTN2FPL-00LmWt; Mon, 29
 Mar 2021 20:55:46 +0200
Date: Mon, 29 Mar 2021 20:55:45 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 1/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <b2a5092ec681737bc3a21ea16f3c00848b277521.1617043998.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617043998.git.lukasstraub2@web.de>
References: <cover.1617043998.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X6hc9O33sewwDKnbSKkcg5m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vBs8PP7HOu9ImlnfYPNihLvhy4uOF1clVod6D0GbowAPxMgjUdl
 D7wERzjfLXpq2aPaDA/TWXSi0pmXxCExBBIXLlPbDU8yGKLUJI9JnliOuVhmeY0796MQM9I
 IKSPxxXZawpYMQhkH5pqruVMPmgw5h3noLvlngk3IetC1E5jT7wSRHxY5q6tazfDjcY+oDL
 TRT8yPOgxCIDW687S554g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ht+0dloK1+4=:o2KtQtcmGIqhwfiSodS+eU
 kFdPXmabeEscxOjSpbYEgZDuaEA/gnIk1YIkiJgaSYTSqBxiANUwDeyVrmvV55BQMSq7geTDe
 FNhO2DBFG7QdlVrkgx3p2dzQFT2sACKsh8X/T09wQ7g2tH+uP5v/G49gsyC27LCOuym9L3bUt
 hur8v8nI3AGzv+h7I6m8Qo2v4WfIeiiuPZMLgKnrF6qJSbXgg308yX9B0qF7cjKvGnAKbuCWP
 0GP3/ThnKtCmQNS7EURRlcJM9AqGI51K6X8dMHfcAwHdNaEdJlrtwL9xUn6BTibEhRTaGVG5U
 25c8I0SH3+zjtk8QtUMSYZlWFNHIl31Jx9OlIHSWS8bvPU6sRMDZgxFl8TO0b2ap5uOvVnSI/
 byskbYunyDuq71wQ5OK9OIEk6aFil7D+zviFaonCgIInlSgzIngB7Plm9ej1CPq//XwH4Yzui
 3x0ZLrtfHD4yK2DkH6jYJASZ3Xk+GlMRcYRhLPbwt7koYDiVbyj0Lhl2RALk9UEQEHwgUqWJT
 oQKjkS2gx+broKUtXEdefy5nPj0R2alW7k8q3g3A/71Za1ckGVxYOHONJEFDaZoumLaDP/W/I
 0hWadM9s5MYEpIhgxsLwoLG8ywVoSb0Ub6d5R9LBP8DjgdcOgzz2UpRnpvKoHmekRO79KvZMs
 WKA+pLaHmpcX7e0epDMdotry366upISuO9RZ4nixt2yPl2xWds9aoNAhkUWq9t7qw8FDNQz88
 0a1ba1BWu90tFj3AU7wStYAkEReA2GildT4LjWY/yhtu78RJLuvLDISWlYqUrveSqgC4wFj4W
 w9Nxkh7nCghv2c5vwcWF+Qn/5Q5dHnOdQ529Iy6MlGKtD0qK2c5CnW2Bh9inIE6Ur3ik1dNp1
 oWFDZ8ZM0xo96ThJZbfZagyrEzRum7dnrlIMuABV05nex4snrHc0LZm3LYjfpkMBkBETHzprp
 nIeRjPQLeSX+TkhHWUq5gpM6uos9Hn0zUK8fAzSlUDeMbGK1CHAFaOUA0GxH27J7jTMgjF5Sy
 tCws4+sPgMoAM10TJt2xhpIWcu9/087Cxj9jg0hG14Rt59LxnYJa1l2B89r84Dr362xym6YOk
 khUdzS24YSldqMFXTWFSeNDdTTnZPdWLyQ/4E9PBR4JWgVcSZhx73+q2pPm6Y/F+AVuotsphb
 mLmCh5U7pemPYCXXrwV15yYndfGSmWZ74gB9vvrOp1y1qVoQ8CEEl6N7Wa1GR14XWtfEg=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/X6hc9O33sewwDKnbSKkcg5m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Move object_property_try_add_child out of chardev_new into it's
callers. This is a preparation for the next patches to fix yank
with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 140d6d9d36..48f321b3e1 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -975,7 +975,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     qemu_char_open(chr, backend, &be_opened, &local_err);
     if (local_err) {
-        goto end;
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
     }

     if (!chr->filename) {
@@ -985,22 +987,6 @@ static Chardev *chardev_new(const char *id, const char=
 *typename,
         qemu_chr_be_event(chr, CHR_EVENT_OPENED);
     }

-    if (id) {
-        object_property_try_add_child(get_chardevs_root(), id, obj,
-                                      &local_err);
-        if (local_err) {
-            goto end;
-        }
-        object_unref(obj);
-    }
-
-end:
-    if (local_err) {
-        error_propagate(errp, local_err);
-        object_unref(obj);
-        return NULL;
-    }
-
     return chr;
 }

@@ -1009,6 +995,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
+    Chardev *chr;
     g_autofree char *genid =3D NULL;

     if (!id) {
@@ -1016,7 +1003,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
 *typename,
         id =3D genid;
     }

-    return chardev_new(id, typename, backend, gcontext, errp);
+    chr =3D chardev_new(id, typename, backend, gcontext, errp);
+    if (!chr) {
+        return NULL;
+    }
+
+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
+    return chr;
 }

 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
@@ -1037,6 +1036,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
evBackend *backend,
         return NULL;
     }

+    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr=
),
+                                       errp)) {
+        object_unref(OBJECT(chr));
+        return NULL;
+    }
+    object_unref(OBJECT(chr));
+
     ret =3D g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
         ret->pty =3D g_strdup(chr->filename + 4);
--
2.30.2


--Sig_/X6hc9O33sewwDKnbSKkcg5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIrEACgkQNasLKJxd
slhUlA//QTZ9RlMuvkos/cINlgkEEEQi0yOixPThgNweTB7VeC3FH23pEaqHGZsT
nLi4ax1zBURow+r804fBT0v4wF8bG5+16cr9VlVBBwx91tLIIKN5aLMewB/gG5M2
0/EohSVfgwGMTqsk3XmcvRadIDLeIJGC9L7v7pQoJg/yaQ2P7TBWbrR1UdMz1/JD
JCdb86hEulHEnHu9W244v0T/yc2PcwOqBWGlzeykPIVFQIiYLsT7XVKrevJF75ll
wqZh1TRucfYcu6NDEBVoRM0PBcTvWl2lzuMcfn1vM1iU/IAY6qCp8bNtFT9Lcxg2
ck8DgiRFLyl4+JvQei0XhWKsoze11aP0hOvbpzQoF3iLlgAFfVqnVgBuGboAYoml
ELhE2WqgQx7VwXapBWH+z5Hoq2qlBXn0kRHrMXA+WBa0DViT234ehrAuQOOnWg54
UzWPPBIDxw7QFDdyk7/aldqUdyPGhi9bP1it4kg4diDDT3prdmEP9omRUqjEwUL6
chUO450Cy2+JUEiDgSh5aYQChaPZyCnFWl8P2wBlIONRVhV8AkHWDhVYcZArBUz/
JIEIdBiSSv3rDkHuB13p+2lboDWoL0Z+BUSukjtLOKF4bN/Wb+vtGlMW5cZ1fI3x
LbOnHgmI5hBXCBC5yWT/qoW9PU8ryIpn30zByJCKLO1HyhxlFWQ=
=f4uh
-----END PGP SIGNATURE-----

--Sig_/X6hc9O33sewwDKnbSKkcg5m--

