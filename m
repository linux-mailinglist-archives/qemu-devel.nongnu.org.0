Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787EE6E8E93
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQtv-0007Rv-R7; Thu, 20 Apr 2023 05:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQts-0007I9-RI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:24 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtn-00084P-Pf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984095; i=lukasstraub2@web.de;
 bh=FpIxYaKLOgIitA+qBmFyXqZmZVeuU6FI1vEEvwT3GlU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TL7AXGJpKrJ5R2VllQozULxNiZZ3rzYgk4EA6XQHSKcWd0UglzrUiUxIasZqqiZ51
 OAgKzFY3/8mvwBKf7I5TwAv7Wa0CBhzInLJ88Fbw6BpOT85JUDscCXEXTlNJ5UdzOv
 n9Pa6Lsi+cECrLtX9/qCKjW4CANtsMtAZl5UZErH5re+vevZMEvlY5w3Ez5kcNhde/
 LtFKFjJD26+pxEMDW4i8kvkxRuQiLZWMpUoNwSsmQK5hqUFiVE67zuRC5dut/qCxm6
 C78M+RBs6anEmbwSnZEhkZhneiuFCrUmJauBUG+jLzVQIZtBHYAtQo8fSpTvuWUrQe
 l9yWjx9rWJJAQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6HKG-1pw2b90En2-0070vH; Thu, 20
 Apr 2023 11:48:15 +0200
Date: Thu, 20 Apr 2023 11:48:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 07/13] ram.c: Remove last ram.c dependency from the core
 compress code
Message-ID: <5951bf117606dde2183abead9ce34944734042dd.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oEiVX2y3PYT8AUY4zKBlCk7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:IDfVGZf31l/HbmuGxozOTCdz4Dhqsb/BlP7/bthMcNamgWxbYS6
 D9VJPDeN2+p7x92siiZUXCCUNr0M+/sGZLWez9yzIQcQmx7WFv5Dh/gfxiTyg7f3D6ZPxi5
 a0bUqsnlS0wZTqk2DueP7artW3zS21AbjVY62p54BtOu2ZcTcQgK574CSMhaeiKl6PqWEFZ
 JLcNc6wXcuI+PYLJ0ATBw==
UI-OutboundReport: notjunk:1;M01:P0:YKOva09f4v8=;rEEFE0UdM/S34FztTcdGE21eS7Z
 0lXRXRfu7vGgHxS5W10MLFGScBzwqPxtvYvgzhijTShD1L5dBDuSLKbgeUtKLgq99IQ/+tDwZ
 VryOoWLdWrycaBys81eCZcL+Snrfmwx8UKBuoihK2JOl4JHbTah2j1CKJcsivpoHZxPhKITEx
 /WZdGqCvYl/7uqnK8noHoVXFKZt+pj34GPf/J2Bt0DWdeMil2LVH5VfoUh+GUPCijK5XjfNIC
 HjpIbTUetDn18suRd7XVThmazMAPAyanihi7UlK90qLa2yi89wa+cRelmV8c9LnT+tq0F9K0Z
 6u3NHS6yL0xffbXAyzAFe5VSHYoLfzo1SCs3i3KFuqTIflgd5ECN/S5H00sQxNHWftIpWmYb+
 iNWLTfbhDsFg+bsk782f7L1uCnI60vWJa7sF2Tj9BGHbrL9k7wHCZJBg2VqR4GGLWP6yCcyRI
 XHxZHV8FsWwulI6nttmtOL9QWqS6AgtAsgMy7DYz5S9cH9QJsxB+WWe7edw5wUbZ/YMGhgoN+
 PnAXaEGzkE3mskK21d9UoEeixKYcZUmV8BAKcn4hGs4HpQA+lokz6ToqQTNZzhVZQrCINcWgd
 /0Cg4nfXZ2R5Gk5yjV8kmuFDk+r7W6xyP3kix63gZqv+8vYFyKhoh9sRjFZ9Mi3ydZ/8x3H6I
 VllcFWmIiESWJDgdHBGgjhBl1ZP5oVccD9gNQMyeLfWgLs7PPVCvroCxN9vjHXUzBsECgvCpy
 cU9r9CGNqo2nR9LrrKBs7pCV7hKpeyghWPOyN3A7Veee4Lynb3WWH0+QIqSSOtjxy8nB1rBCM
 uWx+G0NZawC6hCFNu56BzNk872KikidrzfNgbjs9rLD+9pbvIcp8uZdt2j5nZE9bGsQcWAmIA
 0KKpsu1sNVLmj7aCk40mqmjIFm/rTDU76TZtmn1ib3u+uJrDBL0yeAlhGqjkLAhIHrXcyyXWk
 TWs+uIeFv5rEcdwIQaKfTH/98dU=
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

--Sig_/oEiVX2y3PYT8AUY4zKBlCk7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Make compression interfaces take send_queued_data() as an argument.
Remove save_page_use_compression() from flush_compressed_data().

This removes the last ram.c dependency from the core compress code.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3894d0ae79..bd3773d4c4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1556,13 +1556,10 @@ static int send_queued_data(CompressParam *param)
     return len;
 }

-static void flush_compressed_data(RAMState *rs)
+static void flush_compressed_data(int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count;

-    if (!save_page_use_compression(rs)) {
-        return;
-    }
     thread_count =3D migrate_compress_threads();

     qemu_mutex_lock(&comp_done_lock);
@@ -1584,6 +1581,15 @@ static void flush_compressed_data(RAMState *rs)
     }
 }

+static void ram_flush_compressed_data(RAMState *rs)
+{
+    if (!save_page_use_compression(rs)) {
+        return;
+    }
+
+    flush_compressed_data(send_queued_data);
+}
+
 static inline void set_compress_params(CompressParam *param, RAMBlock *blo=
ck,
                                        ram_addr_t offset)
 {
@@ -1592,7 +1598,8 @@ static inline void set_compress_params(CompressParam =
*param, RAMBlock *block,
     param->trigger =3D true;
 }

-static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set)
+static int compress_page_with_multi_thread(RAMBlock *block, ram_addr_t off=
set,
+                                int (send_queued_data(CompressParam *)))
 {
     int idx, thread_count, pages =3D -1;
     bool wait =3D migrate_compress_wait_thread();
@@ -1673,7 +1680,7 @@ static int find_dirty_block(RAMState *rs, PageSearchS=
tatus *pss)
              * Also If xbzrle is on, stop using the data compression at th=
is
              * point. In theory, xbzrle can do better than compression.
              */
-            flush_compressed_data(rs);
+            ram_flush_compressed_data(rs);

             /* Hit the end of the list */
             pss->block =3D QLIST_FIRST_RCU(&ram_list.blocks);
@@ -2363,11 +2370,11 @@ static bool save_compress_page(RAMState *rs, PageSe=
archStatus *pss,
      * much CPU resource.
      */
     if (block !=3D pss->last_sent_block) {
-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         return false;
     }

-    if (compress_page_with_multi_thread(block, offset) > 0) {
+    if (compress_page_with_multi_thread(block, offset, send_queued_data) >=
 0) {
         return true;
     }

@@ -3419,7 +3426,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
              * page is sent in one chunk.
              */
             if (migrate_postcopy_ram()) {
-                flush_compressed_data(rs);
+                ram_flush_compressed_data(rs);
             }

             /*
@@ -3512,7 +3519,7 @@ static int ram_save_complete(QEMUFile *f, void *opaqu=
e)
         }
         qemu_mutex_unlock(&rs->bitmap_mutex);

-        flush_compressed_data(rs);
+        ram_flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }

--
2.40.0


--Sig_/oEiVX2y3PYT8AUY4zKBlCk7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCl0ACgkQNasLKJxd
slgvig//UsAYZIHxCfpj0fbSA5mfLOf6Ztq/iCUqltdWWs2M55yY8fywNGa9uMgy
1tpenMHoOFTJ9cggFo0Ocry9sISwTb13f7mbtA+P4KCq/FyaO2k6EscF+uwWfiCr
4emlK0EElCFXriFNnbSnw6VFhaGL1MZVeCxoVyEMlc1DofJSKdoLWZXIW49jDMsR
qGuhD/TRpcEZSUNg3vp6lRz6bmKXO1yZ6GrOjj++R4jsD562MTBI8XKCB9ehfdB+
/80+7t6cvikopxHuDkAveEERK9/4WYo7aWuOFikB+oDbVSto58WQvXoX2/ok+OaA
f7/dDe+X4fftZ3kg7CUEcV2uEFlJ6CuM2DzAtWVkEQQ5Q2e3y1L1XubkodUfhuVz
WrdL83r97pa4gy5dzNnUUmjgJUPmucm+wP9+jVfQirSR50ckEnLIFSoMXmMIYEL5
H2yb8jsppL75kFRO5N95NKVcY1un+DZVTb0NeYxYbOfu9fy1NM3jFtbtZMfbzh5F
Vxlwn/S9+adcp+NjtJlYxFhDvbV7xW6/vlsaDQA4/n6vsFLclXUVO7lM6mQrh/4a
jwv9gsC1ysZMzZi6qXofPorTq2aW1niX+mk6PCELpjKy+CTKGAbLSYV68JqiI+wH
38Qf+LMHiR3oXj24kMZCcxxc1SVi9TgE2XguQTZCR1iIQvt4rC4=
=dqZ3
-----END PGP SIGNATURE-----

--Sig_/oEiVX2y3PYT8AUY4zKBlCk7--

