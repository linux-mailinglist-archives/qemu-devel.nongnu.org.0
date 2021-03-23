Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2348346828
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:54:11 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmAM-0008LI-Pv
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHr-0001ge-Vg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:51 -0400
Received: from mout.web.de ([212.227.15.14]:36559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHq-0004Fw-3O
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616522265;
 bh=TFTB0ZU+53dFErY8QuGfDPnX+OOHpgoWFc6pwJE3cqk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IzKxI8K3YcJQd2C5J3mJT+qwOS5ggdrW7WPLB1eoEDokUvHh+qAInNjtkL3K8qvQq
 sDDcOLLqajwVFXz47VrAembu38xIZGXw9ux54PUzWfrx8yFrZ00rBr41IwgKk+p14N
 E3IPZe7RiLNbCVBH2+xrzxv7y7738NbMEBEC/9EA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MC6ZE-1lXWjB1wLg-008s1Y; Tue, 23
 Mar 2021 18:57:45 +0100
Date: Tue, 23 Mar 2021 18:57:44 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/4] chardev/char.c: Move object_property_try_add_child
 out of chardev_new
Message-ID: <833b5a98554d9f68bfc00ac8486ee901a76292d7.1616521487.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521487.git.lukasstraub2@web.de>
References: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hzpNMQeSQZkaKd1FlJ+oH37";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ljuo794wTOHmEsc3Pg6VgZ/szniweOM6E39P7/flW9KIHDfHZws
 AouelmRE5ZokZLtFNJh1dkFjg+JK5Ivu8dclH2T4VBITsOVDstpe2ge72X24mYdyPh0lmur
 ohE8G2NttlbqeqnLjUTG6JWbw9bGneQC9u5t5V8FUXsflrwpwvgCYMpAeNfpail6MnCFL8M
 uMnAgWpFZi/SUM1HKcP0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gqLpDHtJFMA=:H35xP4ESNcrchiz0OpXYJC
 rXrKCiSxSgW+XWDKS79odxhXuqZcXr9JQ6k4sz2+rOL9uo6W7vKYEkjyka5JhNxxyyV7OVMpj
 whhOEtcs44SG3T4sElCL+pD06k3QJxrFBHeCy6TABheRslZeK16/TGQOlg3/3YbteV8vSphc5
 ly/kMRyaAb5BQ1csf3bDjXswAHu2Dptqo3mJ4td4Agg+kLNLAB/iGCCu453syMot3ocHVJxaa
 mZz9pUdOGZ8HWLSPaIuS4dqhMJbrVA+dxRZZTiK8V4QxkgASSGI2oxpiq6hrWEbuyK6KePvtT
 qu4z2Tfe3BLe07y0b/k9/IHzV+TWhJaR8kTo0GJjsG/ePENIstEk90VQgCXYmY6VvodEUDJ7W
 2QFvKJWPHSTraae3UxZ6GiAck0s6CadKhLBxDHw4gKeSPGEAciH1rsX0j0Dd8bvJKhKC3Cymd
 FflidkjHdd1fF9QsFfmQDdk4hwTGEIch2vI2xeF4wU1znSorIHytowzbTQc/HD7gU9XQSIeVc
 conCZPXI56FJ4Y2s8AVpwMOjWyaguO2poh968z4qihRz0rZZtr3N6y+jW8mhZiFKc49tZd3G2
 cWCcZ1v/YvPaUvlOV/OIq2ujLCaq/cJp6+hPi4SWrvsxRIGjlEFTTVZ1IdTy+HrF5dHnkOQP6
 wqij1wv3bQnk6VplTXuICVGlDPtfnJV+cyeE+hR54V5Tcd+qJIeF+2QyNWKRLYjBNL/Kt8qyp
 W7d+CmqxvhSRM8wog/nXHF3Kr/DYNzI8VMXxEix7r9FoU4qLX/e62IWG0UUpZ0Zm3HaBTzeJt
 rqX71SxCG0o0J4luMj5K8OzmLUdb8Ne1gqCK4UUzXdSfloZp3Yrwt2rPq8QGjnGm1c1ED1cfB
 nsAaHPQknY/2S9zJA2yQ==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/hzpNMQeSQZkaKd1FlJ+oH37
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


--Sig_/hzpNMQeSQZkaKd1FlJ+oH37
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaLBgACgkQNasLKJxd
sljl0Q//RBKx6prBxSef6aLQLUxtIhFuYTvoEzXf6aUdBMWecOekiuzM2QC8Ud7+
MKMvZdo/OaQt81k3vvGMks9o4XvOJgRJZawMRjDP2Y3gYhQNU8n/ZMMM+YlZWH/s
iYJJk+tXjrntFkcuoNOnrDcNtY/5mJVLkTfcMGcFOkQPzxmQ7zWVDsX+WucsWEw5
JAtNUnVvQ2OIsQoIpe/nX3mfwStEkIR2/+ROt/8yjqimBc8J9hWUPF5kOui0AumT
6t9+NrKivZkp6w4h7+J8RfRFecORAoeyJE4GWNtzUHBVHIhbrvPCh0J/GBPwuF24
kM5JlwyHWV4k6cPox4SMqbfjGT2A4//zihCsLoiFRcAdijcOUyLpIjykL4Tx/+Xk
RhiDvB/9Yrv4DMnEdfDrj2nzWbsucS88ScjxHZtzFZfeLhXM4VZNgFt2Dnvlw5QV
o1if9SBLD8qyOO+SMXgCF8PbJGANtDLUWp+TFzMSihQTBo9KChDjYvO+QFUDKq8i
T0OUl82ohUVezal2MI17K0XDBSqJHUFBqa0YO89rWqDQZ7qIK89KPxsZZvswLUD6
JSJL0GeyGatB7ntEUarKcBkcDmmzhzfGvSHPykI4NgOfSJzNliTRQWP2gnv6nVTd
pG5/D+KcQ51mvbnKOKUxr2y1arzoR2dQniNL7GHmPwA1/nSdAzU=
=PQ6/
-----END PGP SIGNATURE-----

--Sig_/hzpNMQeSQZkaKd1FlJ+oH37--

