Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D436D3995
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wk-0006um-Uh; Sun, 02 Apr 2023 13:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wj-0006sP-C2
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:53 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wh-0004CX-2E
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458207; i=lukasstraub2@web.de;
 bh=ltaKt3HMk8MWhVsUmGjKWgv3LRNgQ6mpm6WvnlbaEBE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=M1giuJx8NXv66wGa7qiTnW8t2oy09ufM47rXKi1bSEhlwaV8096dqJ9biWjgmF6De
 HlhUYTNBiRphs8fqRrnm5lbUShgPfCc9M0SGER2d+wXtVUoSZrDA3yVZQV8BBuxNkA
 77VR5STa/aYyZD2FzvxvmsvfN3BxzoZ53wBnxrzWGSojwqcMJGlKFFevMTjIdgXHtk
 LJva0irTup+i3IPcw4rBUgA6wOd9A8sVOmsegnoYg1o0CQH6ql+G7DhV7i5JpEaVfo
 SI6DQm8g+J0kVCr9/GgIkY86RsLUIRaZjRdplmS02szV17/xdAnnwlwj/shcMfWAuR
 ZGcDLkD7uIzKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gXQ-1qVp9B0CBO-014ux9; Sun, 02
 Apr 2023 19:56:47 +0200
Date: Sun, 2 Apr 2023 17:56:45 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 13/14] ram-compress.c: Make target independent
Message-ID: <8c89bab01953f658b44cd67df2c75657ccbff5a4.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O2ZEDs6LxeKw3j/hS7_9bF2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/FV1zBwsSN1PKTB1oPZr8oaSCLEGQAbEVkSUGBRnnaRcpFokhDU
 6F93avRnaeYngXGHUnwUk7yGm9nMcfz+1m8pahJT5R3hxA5tnNxz/PwxWyHKPNFF+BR6FIL
 RWmvkQOyTy0s7+qsc2Hdrr3qFcPwaROZ78AayClRQsdzc7tXK9gdt1XCdWJpasoOlO3gt0d
 zgNpLZ8E1NmDSUYrD4EDA==
UI-OutboundReport: notjunk:1;M01:P0:J1gdBN05i2o=;ENH7+LB7bYGXS8xXlF7E4AAzEpd
 DuoJ4A1XHV0TFRk6HCMtixo7U+Ih8e3vDMtmUdSzdKSQ4f7mx72eaUD+hv7h5I47jy25RNeOc
 zB0kr9BsgRQNeky/2JP6lSMAZTYJBFnKZMxLtfaQrzWKNrv5U9Zw7bZGERclSQwGe23qvMv15
 7ShP6Mc3SGdoFIJUTqkS2adAjlzyLs6wd9IMA9VrlsuTM1X0LfxYTgc5JXji7Cb5FBiE6LJbe
 OHoHMZs5uWRodifT34KmNg/JRNUaP1OoGM8BqDxzytI5UmZgGcraNX/K6jcpgEEflVKFbQB7s
 Gf57O14Tzr1nOjsO0qxuGG9n6CBmx2QcvF9SU9s8Lj6FgOCtc1s3jQZP9MZrw7DUOHGliydpn
 W9Dkp3sEmn8cieA1PvuifUWex+cJqtkBIAmn+cgYGrzkf/BLE54LEvwA48+QRIa3Y1hOqc+gR
 w08GJ6n6cIYnxVJPLFmxCTtPsBuJFfRFj089Y9xIdZhc0FECRIUG30HhKjdCjUeN/t/rlTLLn
 KxP0StJMah1HSivpXLgYvlW0745h9J9oPn00qpBOGYCWzqZOhBk4Hd+lvVxvMw1ErpEdjd15U
 y74K48eASQN5j4I6uCX3fqE59tVZt20OME9i4uNKw8w4/8otVYJthx28a+p99aY+bStOMn2Yn
 MMpSFjRfoO/sr+KEZcPh2xhygMctYpo7iicm/RAvuA+X4Epr7JCKBEryI+kzEfuzQv+V0JSx+
 1q7t0AIbOHO+FwbXyAwSMayAPlE38q+nWyrBtJxwoHq0J6YoET8z/a2yg92odAUR5KZv/thZM
 k2GdTS+v/+s4lrk1wJCZwSpoSIwEGGrI9Iom5t5+ioyUiFQcDlkGkIUkzOJ9hFYf04RsWJGeu
 D8S0/dEAnsFvTmxynayRawkqTjFih97veR4s5xcLsfLStfOwCdiem/tF0VsJLTcdUfTbrdk4L
 DIGEEuPi3g4+F0Hy5ka+GvtK6oM=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/O2ZEDs6LxeKw3j/hS7_9bF2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Make ram-compress.c target independent.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build    |  2 +-
 migration/ram-compress.c | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/migration/meson.build b/migration/meson.build
index 262e3c9754..16f642031c 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -22,6 +22,7 @@ softmmu_ss.add(files(
   'migration.c',
   'multifd.c',
   'multifd-zlib.c',
+  'ram-compress.c',
   'postcopy-ram.c',
   'savevm.c',
   'socket.c',
@@ -38,5 +39,4 @@ softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c=
'))
 specific_ss.add(when: 'CONFIG_SOFTMMU',
                 if_true: files('dirtyrate.c',
                                'ram.c',
-                               'ram-compress.c',
                                'target.c'))
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index b75a9d2b9a..a75c6e0573 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -34,7 +34,8 @@
 #include "qemu/error-report.h"
 #include "migration.h"
 #include "io/channel-null.h"
-#include "exec/ram_addr.h"
+#include "exec/target_page.h"
+#include "exec/ramblock.h"

 CompressionStats compression_counters;

@@ -155,7 +156,7 @@ int compress_threads_save_setup(void)
     qemu_cond_init(&comp_done_cond);
     qemu_mutex_init(&comp_done_lock);
     for (i =3D 0; i < thread_count; i++) {
-        comp_param[i].originbuf =3D g_try_malloc(TARGET_PAGE_SIZE);
+        comp_param[i].originbuf =3D g_try_malloc(qemu_target_page_size());
         if (!comp_param[i].originbuf) {
             goto exit;
         }
@@ -195,7 +196,7 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,

     assert(qemu_file_buffer_empty(f));

-    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
+    if (buffer_is_zero(p, qemu_target_page_size())) {
         return RES_ZEROPAGE;
     }

@@ -204,8 +205,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
      * so that we can catch up the error during compression and
      * decompression
      */
-    memcpy(source_buf, p, TARGET_PAGE_SIZE);
-    ret =3D qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_S=
IZE);
+    memcpy(source_buf, p, qemu_target_page_size());
+    ret =3D qemu_put_compression_data(f, stream, source_buf, qemu_target_p=
age_size());
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
@@ -335,7 +336,7 @@ static void *do_data_decompress(void *opaque)
             param->des =3D 0;
             qemu_mutex_unlock(&param->mutex);

-            pagesize =3D TARGET_PAGE_SIZE;
+            pagesize =3D qemu_target_page_size();

             ret =3D qemu_uncompress_data(&param->stream, des, pagesize,
                                        param->compbuf, len);
@@ -438,7 +439,8 @@ int compress_threads_load_setup(QEMUFile *f)
             goto exit;
         }

-        decomp_param[i].compbuf =3D g_malloc0(compressBound(TARGET_PAGE_SI=
ZE));
+        size_t compbuf_size =3D compressBound(qemu_target_page_size());
+        decomp_param[i].compbuf =3D g_malloc0(compbuf_size);
         qemu_mutex_init(&decomp_param[i].mutex);
         qemu_cond_init(&decomp_param[i].cond);
         decomp_param[i].done =3D true;
--
2.30.2


--Sig_/O2ZEDs6LxeKw3j/hS7_9bF2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwd0ACgkQNasLKJxd
slh6pQ/9FSMeCVoIpLzZLalUxBsIoU3pvxvn3+EdLVKmzYhkmbW83rEvyNSdy626
mQCxuLNJ/zJ68AvdUPw1BvbWmcb5JZ5SupJrTNzViHXVb0l8lczrH+20N2vC4aRr
kdaPm8Oe+EAlH2gW8ajpfnO3gHyDXmo1dUJ7+cdRh+IFmE5iWfeHu2Y7BMnFgeNW
N7+1Rl5glJZL36M64LUOpxkskRc02qWmnCOaIRaDFHghDVNR0atpV9B7bYl60cQR
afrktHhyMA+D34XJ3TGNPesHvgwo9txeu6iA0nUjFdps0Mz7nbuF/r51EnhPxguk
1xGN+pZuX2NchgRh4rFFdoIC/ypnWaFDjUkZm3lLQyQubN4qHfRVos24Htdg7YYM
qtg6gOdvuyggFH7YCDH9j78cQ6vwjOUdFqKQJ3GTiOTCPPU+A2FzclLXF6Gb+L2B
PWlFbJnhV/ywcQEQVm4NDMFZQyhR0J+7zYgAo6IQ5BjeMRa4vP0fHDGYj1l5Q34j
QtmYe9dH2yhR41Y06W0hTbk5u2frq1EYE0t65imN1AN/Q2+QNZJDs078gTT3KZUN
R7nahm7K3vwmNjooXZ2KkSxELyEeQxyqyP8Ppn8IDDMxqZ6Sq71YeMlhTphesOj2
+kxYhkpzVz5NdlwIFtWEtMbGla8DPNKg1iy7ml6yxF1qAaWouVI=
=t8nq
-----END PGP SIGNATURE-----

--Sig_/O2ZEDs6LxeKw3j/hS7_9bF2--

