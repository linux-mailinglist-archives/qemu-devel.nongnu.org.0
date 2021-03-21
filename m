Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97B3435CA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:37:17 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7dE-0004ex-U7
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y9-00084w-3B
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:01 -0400
Received: from mout.web.de ([212.227.17.11]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Y7-0000Is-6N
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369515;
 bh=U/L3Q2NvRQad/NYnXasRUe7+xtntL2sQsIlsQlfr38A=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kKpaFXVAci4MZu9ItDtR1CJwXE2JT+rzSfWL1XG76AS0rAXlz1Vndq4FE1Zo38k8R
 aSgMvAmJCoQFKcZ9/HtFAuJkjOtn3htCcehJ+cW//r9NKDcapjv0vykMqP8YD9lfK5
 3PpEk/pdiTdFeJA4GifwxAfDGTxJuZPFFU2//nao=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M09hY-1lgcMw3dgS-00uL6H; Mon, 22
 Mar 2021 00:31:54 +0100
Date: Mon, 22 Mar 2021 00:31:53 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 3/5] chardev/char.c: Move object_property_try_add_child out
 of chardev_new
Message-ID: <4d61f31f4c2ba1e768d91b2d8f946ea49b3a36fe.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616368879.git.lukasstraub2@web.de>
References: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_JVFYvpv4SSo7.qmy/1ZEKG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:W77HgDixPhRrWxlghc1U5hPGmtWVGbMZ+2tQIL1UuyHrmG1A74A
 Aa/p5V9FzR+9MCCT+JXz6bxp2YH4gtiCYE+IecoWqJ2XMSsMYjPXjx3LeVPpScyzJzwy7Dw
 /6PPRffMxvaaR6dcluZM/usl0HJwDO9VbbL3m8N5cH0n1FxYixUr0NK0upzSXLJNd4g0edB
 gn4+pg8BF80iAbwNto0SA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vp3fwZzT1Ko=:Dy/cj/a/NC96eNZl7MwWLP
 cGoaesrDyCsJ1W/oFP9mLg4JMcIzorHvYwUTg7mu8UYun9aMmHYxvbAcEO213WYScc14M5Mel
 V6gcEQbt0vCZ26mV0lHmRgW8lcqSLg/goyw09Xvr1QgXefmTkW5P+I/yCTLoBHMGgpH3WjLHW
 5eRs8itD2dht5X8gN+cChDqZGLH3OoFvRQ9aMM9WcyranMNn687G4R8CEboUIKNHc4EAP+OQ6
 ajHekWtmHzBCO38Hiimn68pIRIcLGOOQfvrNwZeTU+0QPzBR/vJXif64XuyYxT2PftSVGvzRG
 7iqcq3zbLzkimdhNhZpEaXFQsf1VQtflKBWdOXxC/BUFt6oXR0/RJCVjrqdb5b7RCr9Nl7mXE
 hFCUN5akUKuqHzdCfJmD0jvq8bZd5N3bX8cY9UG6Ha9zNHYkeSqig6mrZuaDbqxYTK16r+AgP
 T6QzkivSWxGEnILByMY007H+4ewo2hfzzSdqsqdKhUiTNrq6Ac0JtEFDcV+PTC79K944o2cVR
 lMqvnJqc0/PpyXxcTlJiZ7OxSz5u+sAWTFtb9KPQca2hABx0DGDL1I6fjOdiOYtFgJUZ0vLCJ
 eJtXaTlLNQD50tTY3+0XcrogCUXU2OWjP5Bxj+wWtNvwRhzRLNAzUBqFho8CcDHqIrc2TU75v
 Pic21/RGtJk0Q3WKLKmWcMSPUGHyiZFSc7hVY4ZGPHUDfHjuhU1ggorXGPh7BpxWxfQYZZhUB
 vBty2bGp2I4eXELJZ/AjyKg2S0lO+xwwoT6/SvkpArozx3fSGaG24XBRx6BdNbFC2hcz28sGk
 ZgmI5yDMoNhR1yD8sMCqW1r8F4n0VSvFJAXyq+0RMQpU2vQKs5bruYQq3uxM08BawtO2zn6Zf
 AdEMS5N9kz18VdyXMLghHSVBaH75WybrjUGjHbclazdai5kxbQieXNN9aJ9aSyCJ0QECUHVSI
 gRdW0Gz/3Kg+V7v/6fmfZSrHRR5zP/fjE9aiLy1hBF+gxbRWxMxVedL+iYryr92QKD2OIiZm7
 bJ6z4xfPgEglLstF3pItoFUCfTpjDjBuUNUReMH1aZaJNbk/KckFegzQtH/07yml/u/TBlDLI
 sEyb2ZswR5vZEtrvsnfQzk2hu8O+uEFL6z1cTcoYhagoCBIlPAD1ilnMHvPDwklkYr1GilOtH
 WWtdOuexhhawmpq0wkk0yTuez2i0ldEpB9E6InWdi9KimiFe/kZmnT96Yldcamj6d3Zz6UTqE
 pSrLH7lA/j3fmzc7s5GPJiSRwCT/zF91i5td9Qw==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/_JVFYvpv4SSo7.qmy/1ZEKG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Move object_property_try_add_child out of chardev_new into it's
callers. This is a preparation for the next patches to fix yank
with the chardev-change case.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 chardev/char.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 97cafd6849..1584865027 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -972,7 +972,9 @@ static Chardev *chardev_new(const char *id, const char =
*typename,

     qemu_char_open(chr, backend, &be_opened, &local_err);
     if (local_err) {
-        goto end;
+        error_propagate(errp, local_err);
+        object_unref(obj);
+        return NULL;
     }

     if (!chr->filename) {
@@ -982,22 +984,6 @@ static Chardev *chardev_new(const char *id, const char=
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

@@ -1006,6 +992,7 @@ Chardev *qemu_chardev_new(const char *id, const char *=
typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
+    Chardev *chr;
     g_autofree char *genid =3D NULL;

     if (!id) {
@@ -1013,7 +1000,19 @@ Chardev *qemu_chardev_new(const char *id, const char=
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
@@ -1034,6 +1033,13 @@ ChardevReturn *qmp_chardev_add(const char *id, Chard=
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


--Sig_/_JVFYvpv4SSo7.qmy/1ZEKG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX12kACgkQNasLKJxd
slh55xAAgwkKdyX3fCHQY6ZE4iGZPQRasaU4lvvMb3gqMhL+QQYpo9eTTR5qnxQM
4fJmEgEWndFGiP6zWpYY5ZPT71/3HfQqPPQtwy01dK7sXl0/KK9J/sgQJydB3InU
TXV8V9MWpmnaow2B4Jgkcb8Ve0j7TgbbsF7bYXmwxZr6+R5+sSC2Hv5/f9qyJ04l
Xrl571J65Bk0+q6ofReJo4G4/+nITHVwj8DV2HNCG1U5KWdCplZhViT0bC9mM1A4
vJXJlmXTDTR3lgaYn47QgTS05f/mFA0248FjAAH6AXa+pangU6SUy74gB6C3ymZm
UGsp2b9+utGnDO8eX0nZ0A9611ClRXrvjNR4oSHuaqZQ1aSiwdkwzGKBcNvz+HOC
1+PbiU6HjXayr8kFguUOFRaw3N7nhSC+cn/CMyPpAgX+WVtPI9NPoS5CPUxuIobJ
xi4O3IyUbiicnus0U/t4I6Le1O0MIZH6ujLD1yZZlj2jXKTJhUQ7gQ/9GdeGpNl/
8h+qfHA3oc5X4iWoOpBHyWjEbIcqVnoTRbz254XnhYHXgXnUr0rqGphanJrd8tQg
wY0127LDFjGVNtbMPotbeKSG7SUf26cRVX91wONbE3bzN22sD0morsUzNd+GpVXa
uJedw+UkUxKB+9Rs+yEvldTDT0jMSq+PnExTB8i4yjElNYEZWU4=
=NBd+
-----END PGP SIGNATURE-----

--Sig_/_JVFYvpv4SSo7.qmy/1ZEKG--

