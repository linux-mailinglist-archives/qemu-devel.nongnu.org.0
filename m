Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24D6E8E8F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQuD-00006B-Fs; Thu, 20 Apr 2023 05:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQuB-0008Kb-V4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:43 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQu9-000880-56
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984116; i=lukasstraub2@web.de;
 bh=9f3AZYiitU7Qh41SKHS0+4Flkwj5FIcZQc8op6FZ0Bo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MkUcgHjLUHIdxYqLLF1v2hHyXl4ikvGp5cPy+yUYvkFzUfE9BVVDfmLJjqP4IdCOW
 hQwrcJNAC9M/jxdivyz8YIzR2VmbBPnuJt3OZvEwZJlZMLv0BynyniitunapTSDE1w
 wTDOup1bL1wfi+He1P645smvnKfZRNwu8IqYAuFjqGGRq+Spzp6KxpkVXwnwNAWce1
 GGajf/I656wyUIcOUpnt7DvxKlfeOPYyqtqbuanSCcEXO2d3KCp+6FnIdbifpyrg66
 ELiAIGzgewF4HqTYff3duxiQGNX3oRMrRx78I2ZhtlwxeNoJQlHaIp3CJCp9QyEKyw
 uwWs2uBg/40hA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2gkl-1pt0Cx19rT-004Dmk; Thu, 20
 Apr 2023 11:48:36 +0200
Date: Thu, 20 Apr 2023 11:48:35 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 13/13] ram-compress.c: Make target independent
Message-ID: <aeb66513f419d1be4601393a20f73801ccfbe80d.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4OnApqrtn.GN3J2BgK0vZ9z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:/gQU3KFnA6P2Llk+Y4Mea+re6rhK2VrtDaMbKS6AQU4mhieBcvy
 AUhokhnPHKL90mBBnn8FSkctajds4N4/pnF3g2KNfY2A/Re7BQ2/EWjmDzTcM9KDegG+tr0
 B93saWI8rOKwjoUWB1LmNgxd53gnOKQXhw/OIYMP9uP5Ioo3AXufi0189WzRNxPDtqXbFuP
 2U70QBN2wMCMOn1jqOBTQ==
UI-OutboundReport: notjunk:1;M01:P0:UCcDTG+bZwA=;ndWUvhLrg8MJnzom/y4S5AWKgXM
 VqOJ7OLF6QskxF4XYHNS4wI5aGc3GzhstEkdqLvY6pNs59nVpNYK9SK00Eiu5godtBVzwpFpU
 rNVgXbuSw+vBKwpN1KtwCpCOm+SDjsxaWnpKRo8NE3frRES1tntUKPUZi3miHOBsh0mljIyKh
 HAho3d5oHk6fZgUdh/4yyVwC65HxbflnrqYcAOFsbH+3QXzigdn39gLCzmjPFynyGSjsFV62T
 gIXOyd+R11tusmwM7MJcuSAZQ+xTHTqAZBgMXiem+3tViaT4U2eH/Tis4XqjwmdTMhLBI6cX8
 i5CQHUt17R2ZLAvRESCubM81EGKlTM+povIgyzYTB/YZV87CUYVvTXNKXe++v4aLDBxgqovZ3
 D9zls6lStn7wbVnw235EMHws71BbH4JIyxerZqNg+cRpIDz+reF8X9J+HqYM7QXhm/94DRowM
 ZsEV7OAh37Zp5RF/ZHkjD7nmYFYlKMwY0fjAheZbXiVeMmJnCGYZPHakKackhrWlq/YjFOELK
 EDiYCiDNaCNEcPzuevgt775yMSF38GHkY2euZ+i9BGfI3YGv6PvwOv/opzwpRl17qRl18AtR/
 v59BgYvHqejOGaCzlQ/e2OCtXm+SXuzaQXhmTVOM81vZkjSyuJlYqLfPz4WaGQVtyQwOVtwZT
 Ig4YCbPyG/OHUu09CnKBJdCzh35ooh7YJFD5AxWuVrENN4lDVyJ1bzDIoIVQxvnFj4ec9QQ5+
 r7yScD09LkFqvT2RhsR44+1ahjJrE6fh8GYxb401zdt6f6i27qn2NsLatBDD1vAwmwsxk+h3c
 NfSMGE1hU7vSeS+54L1pMuLvEKs+QzAXB9fETa1RcQo0Jow+mSRsu1jG8vLzh01x0qi6K4Xtn
 58mxvsaqLf9fDGoqy7lFSPlvgDin7tETH17Qn+uIihys3NWYS+64f9ag52lUwynmBzF9EkFf/
 H/3E9f05CjCL8NFqetE0sNVboS0=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/4OnApqrtn.GN3J2BgK0vZ9z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Make ram-compress.c target independent.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/meson.build    |  2 +-
 migration/ram-compress.c | 17 ++++++++++-------
 2 files changed, 11 insertions(+), 8 deletions(-)

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
index b75a9d2b9a..9f03c3cc66 100644
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
@@ -191,11 +192,12 @@ static CompressResult do_compress_ram_page(QEMUFile *=
f, z_stream *stream,
                                            uint8_t *source_buf)
 {
     uint8_t *p =3D block->host + offset;
+    size_t page_size =3D qemu_target_page_size();
     int ret;

     assert(qemu_file_buffer_empty(f));

-    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
+    if (buffer_is_zero(p, page_size)) {
         return RES_ZEROPAGE;
     }

@@ -204,8 +206,8 @@ static CompressResult do_compress_ram_page(QEMUFile *f,=
 z_stream *stream,
      * so that we can catch up the error during compression and
      * decompression
      */
-    memcpy(source_buf, p, TARGET_PAGE_SIZE);
-    ret =3D qemu_put_compression_data(f, stream, source_buf, TARGET_PAGE_S=
IZE);
+    memcpy(source_buf, p, page_size);
+    ret =3D qemu_put_compression_data(f, stream, source_buf, page_size);
     if (ret < 0) {
         qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         error_report("compressed data failed!");
@@ -335,7 +337,7 @@ static void *do_data_decompress(void *opaque)
             param->des =3D 0;
             qemu_mutex_unlock(&param->mutex);

-            pagesize =3D TARGET_PAGE_SIZE;
+            pagesize =3D qemu_target_page_size();

             ret =3D qemu_uncompress_data(&param->stream, des, pagesize,
                                        param->compbuf, len);
@@ -438,7 +440,8 @@ int compress_threads_load_setup(QEMUFile *f)
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
2.40.0

--Sig_/4OnApqrtn.GN3J2BgK0vZ9z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCnMACgkQNasLKJxd
slgWphAAp5Ndy2bRvUh9EXdZSkljtWBlE7zAvciJY7+NmSLQ4Yn06ZoKBInCJcTf
ufEdiHQAKqUmG3Z0yjgQBPX9mUgugcBSYUeXjkz3hkDMEVuGIyz0da7ltTXxv9AD
25vXEHjvnWFUbWbD26o2/BKDLBjKEzqgE+qcx1dXQHBDr6k1drHZyxPAMPlQa1yw
QxX+Q27kHim+STANO9M8r0LOTHrqlzbjJl4oYvHioD6Z5Z56uDWwpLAEUgxTvEhG
e6NtzglQ7yfnh4gH6xk6FCGu8orwKQk66wj48J2FhFoWrGI4CRGoTFuwfbwF+vUX
CYA8kSJ8Tbrp+iO5jIvTvarLkyn49iQ1xaLlQ0asbutk5K/2NS2+fXYGw5r5ZXni
vNCPgKyQ5MNTaY7bTttjyCIXv3Bm8mswb0Lf2UH8yh81OecS+SIJ3PPECx5gir8f
uOYrUg0cVdXPIoZ95xjTVKfjEQWJC4qEnyAry5hzkYdsAJSYJG3bCG/0gpIrgPXG
ufxjys6dvP6zf64gDU33s/NWn1RjyTaJxCHXNk94sMkfOMSmMuT4RjV9LRNjPJgc
IVRDRhT+OujPQk7C1MVgwBM0m+s50b1VfURa+TJ/CoWI+VCzMYIo0AQNFsh6VtDB
sN4Cwi9XVEYWXYhUeXQMr7H4sgUfzThNwsyC5FY0gUZVSYxOQ5o=
=0x5l
-----END PGP SIGNATURE-----

--Sig_/4OnApqrtn.GN3J2BgK0vZ9z--

