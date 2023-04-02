Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CA86D398E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wJ-0006kh-Py; Sun, 02 Apr 2023 13:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w8-0006jO-J0
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:20 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1w2-00040y-OX
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458164; i=lukasstraub2@web.de;
 bh=ZCK/7ZYmCiEjL9Cwf/dMpYNe7dkpCS2X0vJu+4hpjQU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UHDAEzl8RmVuCHHcUOQbGQj9RIMWREvH07e5GJg9Qg65T+ljNF2GJ6qH9/u+nUOsi
 /WB1xPm2SkCEAd37sdZKNX7LdLFX1m9aJrlB2IWDLJmyNG5Mx+EL3IvMTSLs4uESnp
 dqvqYxMa3pbcq7PohvaABQk5OzcTAGCuAY9pvFDAK9SXlYiKLJdNHw9W06nz0p5gEe
 eZI/xkMV5yM6A4EXhSgdrY6mmvBdpH2BMujbThaOJYr0YakgsRFK9M1rKQ8wPwY0m6
 lFgxqMtPdKRXY1m6sxs9WD3lId4WQXbQ1LuzJt4mZ5fZnOYPJxJQSg/mEy4EILug09
 A2xvCzQRbR13w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M9qhD-1poH7h23PB-005hJe; Sun, 02
 Apr 2023 19:56:04 +0200
Date: Sun, 2 Apr 2023 17:56:03 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 01/14] ram.c: Let the compress threads return a
 CompressResult enum
Message-ID: <18ad4a56517e3d63411e7cb8df6b47fe0162c406.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AY9O2Yo_kjUNX1skT9HgwIN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:mfpCIEednmULyaZH8OtD7/hcp09240tYwpdhOEI8oIWbnAVja/L
 FxQIZdldxdxG8Ewpa+/5awLsTl0tem6QgXSY7nSGqFtYb/3GzyZuIr41xjsTQl8xJVzKl3k
 RyMBKsqOJ2iGzKiSpjQ86kOyQPdHNaxoeRySujdkhENXUNVm0KS83xoInCqnG2pCZ3X5/EJ
 uKemm+fIeWDHVzNWRj1zg==
UI-OutboundReport: notjunk:1;M01:P0:6xegMPjaibY=;FDKNT39eI3r37TeC5Yhu3R355S7
 YHb0alnh3uymM5B235rt/Mu/0Xsl1P4elh1FPrhPHbwPwOF32xDDlDJgH0gxDY0YG4DAxDe3w
 iYlrmmAHuQ1HEAry6W8VkZ3k9ay617317PVhz5qOJEY633ePnH+WTSmWLX4YVxHio4dUfqdQq
 D8kZCk0V1egZFhZaim84VnnYItIas//8dclpnPQ+5GazSB93kFnc1FXETPzJEZyf1xsAaeY55
 M0Zy/IiPhEW2Qi5aSBbuG0GFcqI7XdKiP4T0zoOkNipKnoDoDFRIROmqgh7OTL89lJYhUXIUJ
 ZI8HRjTyy8FaU5yteWSY3jOAY1llzd5kGoRvAvjfikQphSaRkyN1C0izxqMi8z2A9SimOdTQS
 M29g1ltyVCWzNa51fqud/f1sCLRYACZ83dzCzf7rqwRJ3T3kBKy/trRzF7XfuocqdzMluS/zA
 fj7ipNpKwSycr5oqtolLfaL1EZmsYCPEmdu4spoSM295kAl8jCqS0r3RDG7Yps7GjQdvqpvmP
 mv2VPaXxEq5/TUvZVJaEM0xnF4jn5EWIJKnAA4K7xhhKrCutryFcu07PdXIuLxOhyXwIzjRvC
 KH7erqwOUVu/4Z8LmAtK4LyCKj+LTggUz/kPGU7yM+eWHF/WF7/ZikkJANtLcHl8GV1zcutku
 5iaIlo656ha9bS8Mk+cNx7l0A8t9tUZMG1d8Nz8Rrk34pdaVRJIfDVIxfU4VhPo4W/NsbZPrm
 mWV2tkh8DpIJPz7KpLENBqJIyBZnzdNmfSUBE544+s1J/7nt0tEYO2JVtiICX7pBNeODVcO8T
 sANAe7fnz2fJ2QVkgGEGbLm985Fk1lffhMXN/6ZLjpY/4k83FPxM9eSvmhG3U9KJWSvBgLtrn
 6Qa0MiMmYZb6q3J9Ag0RgL3PYuezy9sjslLSFEdSibiVjigXNzULth3D02lvOc+53yjXGE7Tx
 vsnTjkoX1n4eFu8K4JgHJXW2XBw=
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

--Sig_/AY9O2Yo_kjUNX1skT9HgwIN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This will be used in the next commits to move save_page_header()
out of compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9d1817ab7b..ca561e62bd 100644
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
2.30.2


--Sig_/AY9O2Yo_kjUNX1skT9HgwIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwbMACgkQNasLKJxd
sljtvxAAgDWC8BsE/M4tXb7fEdpFI1nfT5IgM9OFDdVQJumn9enkg+ynARIEd6hx
WC9KziD30mkba1NglXVkZBYsjuhqDUbgPzIIEEQEFUMchyUpAT/LF/FHpxubgJJe
PFiADWqO19c8GFGsNqKlIBzSzhVmorn2wIyi/r8MuNtLj9S5WwEOJMRHinOwxcuA
kS1x89FnpEISQYuKvUooC+i3bvFoHwPDJLJ5jr2gaOLhqSrJtIOEQHRc6BsoPve+
wgsWoq8PIFo+HXav7pfc1ftmUlxO2zWep5EbQdeVnButeGCZBI3pWZZLggQTmN28
h5fno42umVU08B31PvewNyoAjbFd8yqYAAdstyX/jPXzzFpaUVj8YC8DdUWH77/R
NFOl1JecVbPLKRVS0OvbHmQiZ7oC6O5FsiKbVcUhV5CLNtoWuuozuGdcj8UHQrac
d9qTV5eRIeRDdw3uPg4AE0dDZ2dTOkoSfKCksDMklWkls/SlLERXTf9kTR4dKUec
UYprh0guRobsvQBJdBDJj0yrmp4YA1K7lSW52c0wnIRf6DQq24bBrUwjtf2MCiPn
AlBb3r+F9VVSCJEzi/c5e6i/Z1XbKmX+8Lgguafy3QNZuCNdRlddytiGMbRX8MLu
6lw4l8ZpcW0hCiQTPK/XigQ8Syq0yJ/LU4j2wdmAm7+wUvjuGo0=
=EC2J
-----END PGP SIGNATURE-----

--Sig_/AY9O2Yo_kjUNX1skT9HgwIN--

