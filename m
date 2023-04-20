Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D276E8E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQts-0007DA-84; Thu, 20 Apr 2023 05:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtj-0006oR-Vw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:18 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtY-0007zm-7S
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984077; i=lukasstraub2@web.de;
 bh=wrG1Hvb8UOtdOBIp/5UhtsTLxnaSXeUp/H7vp3+H4GU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=vWOvzvKNDlOIahHUqC/YqPOvYFA1kNdgjlA6w2+QMSHY0iIwvUYd8kEFf0El1Lb7G
 EX9qXTH5t9GI7Ubaez5qKNTzNbmCdINRZXwHhbcGjGQS2zZIuaJwq4BPVzi/f21mzZ
 pdTdIgucdlM6gNppyjw0idz7qB7XePt4T6gFYPFuAyQ8NzwJCpAJk4FrnhZnTc6dhc
 bRHXTVEFLS6ywS/9FUSitCVJrDoW7/Sh/XeSHBmyPaGFK8DJfITDa5vhYUeq2eHIbI
 XNyTyd9D+H65ryUtUekkicoIauc/9bWKa9wV4OUZrTgzknYezJz2E4Bzx89TTVtoQJ
 wFsa84TQ1agoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7xeZ-1qKlMk3AzT-014zvl; Thu, 20
 Apr 2023 11:47:57 +0200
Date: Thu, 20 Apr 2023 11:47:56 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 02/13] ram.c: Let the compress threads return a
 CompressResult enum
Message-ID: <41cb2e3c0065b2c99948703a5a4f4bfe600ee64b.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Z/1Tf9XhI..LO8Dbi1_WpC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:0jncPqQGgxGYRqStLYFcGBCxGTHdQ/mCg/FR9NK2xxST215GGd9
 Jshm/o6Px7sbgzX+HQSBsOBeCxkksCJRNrouQuyAdaMdBuUkKquJN2p5RB9DMooaB+Xy3Di
 VP4eOXFdL0i6dULo6KFjDzdvO3w+GVORIM+cGAQQlQTuk1wjasi0EG/JA2yR6D5h+ZPrh6e
 FNWOtoy1BDa+/4D/2NORA==
UI-OutboundReport: notjunk:1;M01:P0:YudwZjfx/+o=;2lXwudv7jaQ8XICLhRdzlc3XSOT
 slAviGjfy67AlRrvHJ/xQijGxphMG7/JFEpCwmFxyDaE11VsHz5zXNsjKwfwMG39xPcTvTw5V
 2fSh/6caUJgT3kr4DpmmyqY1MheF+Md2g1YtCPj4/cQrGPGYsjI8DrYD9SprJaEtg0LVBBE+k
 TkrIKVXw0yE5iio300o/soSS9kZr3Mt+nTieWaBPewVkCu53tdEUl8n1Q8qn0788lhAhqJZyH
 grwMNynpRa2jxM74acUnD0yBUDt4Hbj9HsNWR9bhcmiBdyM+wriyPurs5xFzNR7I1mSuZpExP
 jze17ZyFMkL1+8Q/N0qaWFczowIaMOqZNbRfNH712EyH5+jTH2ipWs07/d4ecFeHe5ZUkyxWA
 Gqp11Zo3Q7jqs4w5p5+p6RwRL0A+MVoqUVzpI1s5x684Bbqz1+N8bWsQmAhHvoyyCu2Zsz/yi
 Vs2gEknXsOuGqIJQH8e92lirbIHTtBYBd8KtfbKf1gfo3BuBtTcFhDXbP7DQeTOKrliN09gqL
 KuLw+5gc74HNpIUqvY7kI+zy9NGaKkEhYuOToxIf4VVQW2f+qR3Rah1BnYpSNWSgkiQFV6Vlx
 vF+EYXXHQUIFRDBt+B9F0KAPdkWrPEZbKdLWIzZ/IjJgmUzDLXwfPwvd9D24gUNDKh0473/ER
 CIDIOOYjoPeticcE4fqta2fF5qVhkzgIVk+optgoS/JtvjmtnHlsBhYNa9lLKweAyF/gvayT5
 mr1jzLLRTF7Ez06NGlVv1IL80m3mZWkDpRNP61Exj6jJ0byjdysdjAOdSyEEbDN9NBFSkOY/d
 mu3c8qBNaM3WB/vn+C1DNbC9hbU/7SVxv0DtD3r8qM0leIcCdU+aIogmylVX9BaVa+/SboQfb
 sDzS/IPnoNXxaXcUqkgZoPKdwzHzHX8j6afoHuLsy4e0qMWXdiV3DIQk9Avy4Xa1f+TrhMk32
 FFwvnvWEQG1SBffSHM6jjOGfsrE=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/9Z/1Tf9XhI..LO8Dbi1_WpC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 79d881f735..ade6638a96 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -493,10 +493,17 @@ MigrationOps *migration_ops;

 CompressionStats compression_counters;

+enum CompressResult {
+    RES_NONE =3D 0,
+    RES_ZEROPAGE =3D 1,
+    RES_COMPRESS =3D 2
+};
+typedef enum CompressResult CompressResult;
+
 struct CompressParam {
     bool done;
     bool quit;
-    bool zero_page;
+    CompressResult result;
     QEMUFile *file;
     QemuMutex mutex;
     QemuCond cond;
@@ -538,8 +545,9 @@ static QemuCond decomp_done_cond;

 static int ram_save_host_page_urgent(PageSearchStatus *pss);

-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *=
block,
-                                 ram_addr_t offset, uint8_t *source_buf);
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t off=
set,
+                                           uint8_t *source_buf);

 /* NOTE: page is the PFN not real ram_addr_t. */
 static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
@@ -564,7 +572,7 @@ static void *do_data_compress(void *opaque)
     CompressParam *param =3D opaque;
     RAMBlock *block;
     ram_addr_t offset;
-    bool zero_page;
+    CompressResult result;

     qemu_mutex_lock(&param->mutex);
     while (!param->quit) {
@@ -574,12 +582,12 @@ static void *do_data_compress(void *opaque)
             param->block =3D NULL;
             qemu_mutex_unlock(&param->mutex);

-            zero_page =3D do_compress_ram_page(param->file, &param->stream,
-                                             block, offset, param->originb=
uf);
+            result =3D do_compress_ram_page(param->file, &param->stream,
+                                          block, offset, param->originbuf);

             qemu_mutex_lock(&comp_done_lock);
             param->done =3D true;
-            param->zero_page =3D zero_page;
+            param->result =3D result;
             qemu_cond_signal(&comp_done_cond);
             qemu_mutex_unlock(&comp_done_lock);

@@ -1463,8 +1471,9 @@ static int ram_save_multifd_page(QEMUFile *file, RAMB=
lock *block,
     return 1;
 }

-static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *=
block,
-                                 ram_addr_t offset, uint8_t *source_buf)
+static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
+                                           RAMBlock *block, ram_addr_t off=
set,
+                                           uint8_t *source_buf)
 {
     RAMState *rs =3D ram_state;
     PageSearchStatus *pss =3D &rs->pss[RAM_CHANNEL_PRECOPY];
@@ -1472,7 +1481,7 @@ static bool do_compress_ram_page(QEMUFile *f, z_strea=
m *stream, RAMBlock *block,
     int ret;

     if (save_zero_page_to_file(pss, f, block, offset)) {
-        return true;
+        return RES_ZEROPAGE;
     }

     save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
@@ -1487,8 +1496,9 @@ static bool do_compress_ram_page(QEMUFile *f, z_strea=
m *stream, RAMBlock *block,
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
+        return RES_NONE;
     }
-    return false;
+    return RES_COMPRESS;
 }

 static void
@@ -1496,7 +1506,7 @@ update_compress_thread_counts(const CompressParam *pa=
ram, int bytes_xmit)
 {
     ram_transferred_add(bytes_xmit);

-    if (param->zero_page) {
+    if (param->result =3D=3D RES_ZEROPAGE) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
         return;
     }
--
2.40.0


--Sig_/9Z/1Tf9XhI..LO8Dbi1_WpC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCkwACgkQNasLKJxd
sljXdw//b/hH1wupaYc/vOxhGJU612vq3jPNbBtLiANCXGK0IFxgWpA1aXrzSLnD
9pfGZsN1RxS6r/tQEWYehJinsnG1/QbPjNabKFjVVGjlVICQYqcwMrvWEzNRM/Q0
qvS+BHOh3/u1PhrlkqCG9Qa9/M2oo2vWa/cX3UJvNcazZCfrDrQbSAg1cPHMyJQx
uqVEIivZ69RjxzVXJ9grF3Fmhx25LdAA5krVk5+1X2p1i+CH02Frz9gmnx5ocO/Z
5G1Wj2NYNoatEwF3qmpTTNTzsDFhayj68jFlrmHEisKJ9lH5xhZ72RE2DL0ORCzy
C3QgU88kEVfAw4aX9RrLXDcHsPqEzLDS4qE6sDdfTt9Fq3RaGOC6sXPXX2LkR4aJ
lFApO0qmNFbwvk942o84c19sQrQLdsB8Y/I7N2OP9PiDv2yRa/B5sApJlx3vOqk+
XiM+sXI62fKbvQLtI2zi+Xc3YjdlLYdF+zFujAJhqtObaC46r92xUaOxNqKeBXsu
DgkxaL/eqFdZu8AOjjGZh05aQs1FXvITMudtx2ndiG5QjUvy+B60Fux1HjqTkZ5T
wcZvLR0p9x4vvsp7eqdjUh2uWGYRz40SqKpfZQLDYowevMB6UxcVqNxSqJkCrDGh
hGq8glCu8mmTqOuYxmBtwxV5nwitZDRfnTsspRPwqIZoYSBRFc4=
=9Ain
-----END PGP SIGNATURE-----

--Sig_/9Z/1Tf9XhI..LO8Dbi1_WpC--

