Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4D6F9D19
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 02:53:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvp7O-00071R-Vc; Sun, 07 May 2023 20:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7N-000717-60
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:45 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pvp7K-0004Xg-EA
 for qemu-devel@nongnu.org; Sun, 07 May 2023 20:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683507155; i=lukasstraub2@web.de;
 bh=8wn4GkQ7/OJiG7CL3mo7ScQO5fAcXwo9fps/8sZHERQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TxB00nqzyrApdF5k8UAbrFGi7Q6KWeJBJYLgbTjdZlXz4qXU+Zh7C/L0xKb8kMwNI
 sJC1jxbKWAZfH6ekUDneNF3aWuHfV0V0btLyJDdWKenvlPYeFBE81GioKwSvCnaGxL
 hEs8csQt8IEjGymOxGMfoboW+/N7CzJxX9qo4YZbqQ7998zFSNVvaOn6Rb3ZKdoO/R
 3WjAXDZdkDCjd51kIl5mrdMRP1Zm7epgL2tu8UEEMNgxQXxwTWU/QPwhXK7X3S7Ok7
 DivY1o4p3xFHtn+V6dsTpeXBpxHkQtaAm/KfrQvu7txc4YmdFdLilzuEM8mEfxpYX+
 etIVVdZ44+Fgw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.115]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MY5fd-1phmkJ3uub-00YTAp; Mon, 08
 May 2023 02:52:34 +0200
Date: Mon, 8 May 2023 02:52:33 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 1/5] ram: Add public helper to set colo bitmap
Message-ID: <ac133fe789e95e23c3faddd2347035fee1dc67d8.1683506133.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683506133.git.lukasstraub2@web.de>
References: <cover.1683506133.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I3MFa6umhU/ggOdWlvjgxSS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:chPg89AQaGkjW/sC7RNkKim5n5sZ1UilWxzt/qQLMeThAYRym4d
 g9hpCpeeOjpjPr1wjBTi9DWesw5f2vU7GeqqDjEdV2OJmEh+FmscoZ7YzTjN2c5BfyS+TfA
 YZsPcmw2r8C0LEIMlU94xqJNskBhEwiL/0qOnoyXAEGSFmmWq+Sftm/fVNXRagc86BuiL1T
 Dg2WtBty94zhoEpkrfH4g==
UI-OutboundReport: notjunk:1;M01:P0:4+kJoJfF8w8=;LZ25wXWBlFC6bIsdwtD6KGHf6/W
 dQoKoyzCaodSXvVRok5GUSOJOFZpdrJz+oKeJW7DvbuhChdKh+NUbqmsTcxB/pT36wlGrFa2w
 QW4qeMNTSrgFnWSZwARLEEy9waZzN4eOineLch4bJ5xhpXE7mnMw1dP5K3XIUAsgYzM69hS41
 Fe7dcTXNaCFsVirr2r9tc9x0Js6jImMKzs+7dE2+vzckEc04yBzlBrB8Sq/cyNT/TIHiC9TCp
 sAHCuhuGa1oLMS4DDoBsF0rFi1HwQ91VWj5PvKjx6PTphBoLIKi6eLzvfWn449SV+j4Fi1MSv
 LjNZFBIwu6c99pEGms5f7brDOfQzrai8QWhLoO5s4x0iAkhzzX9uW0iGaw+RVFpXqdgWWlUGn
 m8+o6SYkMtQZjNHUTke5ZYn9QnnrSODpy4o1D2ac2HrWtZc3X43gHabwFopqrsgeAYsqbcImP
 /bmDkJRWh7tdcHDpbtP5Qbqf1xX7NxKOlVuSrZyvoSVqyNVgrTBdV1QKiAVqJchkaogryioL6
 tYxYsNvfhWo6wtzjpqbzVASvu3vBT9I6bhmpFgWIs6Kdz3T+SOq5f7T9e63l26yekPs/nD80+
 6shkFc0sM+D/rHQ65acyNQZOGjBGb5u8C39oMP707YtPrTeiILImTsUgG16+zYvM1mL19AmSF
 kvuryqII+39U9IC+v8kFiLtBWRpzFjizsxJA/4rLb/7nyYtw9YWURIhvDlXdlC//kJiuyoxjr
 NQNn8CUtn827kJjpiJVjUbFVTIWg+Gwke4eVs7KP20Mz7cWiPjGw6BEw3bLMyYC+tGulAB0V5
 Fid9YFESRioCe3gVxlYvdXogvqOt8t+GSn5CBALZrsVOdRkZJTMBZIBGbQH8kNj7E3vkkuJwa
 mcsDQWOjG2Hsggd7ltzYbkPEXQ28eDw4q8YH4zjDHJNaPkRNvMpYASMvjtGTkfR0HwTsuE0dP
 p8nesA==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/I3MFa6umhU/ggOdWlvjgxSS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The overhead of the mutex in non-multifd mode is negligible,
because in that case its just the single thread taking the mutex.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 17 ++++++++++++++---
 migration/ram.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5e7bf20ca5..2d3fd2112a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3633,6 +3633,18 @@ static ram_addr_t host_page_offset_from_ram_block_of=
fset(RAMBlock *block,
     return ((uintptr_t)block->host + offset) & (block->page_size - 1);
 }
=20
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_n=
um)
+{
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
+    for (int i =3D 0; i < normal_num; i++) {
+        ram_addr_t offset =3D normal[i];
+        ram_state->migration_dirty_pages +=3D !test_and_set_bit(
+                                                offset >> TARGET_PAGE_BITS,
+                                                block->bmap);
+    }
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
+}
+
 static inline void *colo_cache_from_block_offset(RAMBlock *block,
                              ram_addr_t offset, bool record_bitmap)
 {
@@ -3650,9 +3662,8 @@ static inline void *colo_cache_from_block_offset(RAMB=
lock *block,
     * It help us to decide which pages in ram cache should be flushed
     * into VM's RAM later.
     */
-    if (record_bitmap &&
-        !test_and_set_bit(offset >> TARGET_PAGE_BITS, block->bmap)) {
-        ram_state->migration_dirty_pages++;
+    if (record_bitmap) {
+        colo_record_bitmap(block, &offset, 1);
     }
     return block->colo_cache + offset;
 }
diff --git a/migration/ram.h b/migration/ram.h
index 6fffbeb5f1..887d1fbae6 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,6 +82,7 @@ int colo_init_ram_cache(void);
 void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
+void colo_record_bitmap(RAMBlock *block, ram_addr_t *normal, uint normal_n=
um);
=20
 /* Background snapshot */
 bool ram_write_tracking_available(void);
--=20
2.39.2


--Sig_/I3MFa6umhU/ggOdWlvjgxSS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRYR9EACgkQNasLKJxd
slgizxAAnPToGeBo8BuYUwmb6px8xRhcqxYavf5CaHIvTS7yk7gDBxa579QG4rb6
Syyoo1n0jIwHXyOoy+8xLZw/FcU5vI4aS74OmNnqqiDX6EVe5LCRRUx8iNoziMIq
ULjGSsk3I5Wb+X5vwi2O/sXQVwcsqsGSxGPm23qjB+gsYZoE6ZvLfMh6IG4bFNuO
XmCB/XEKP4fhxW7RiAbTDhHACriZyiyPOPRAKgHIdniUZeLz34VXL2QTIpiqvM0U
KZmplGCGJEctVNysqIMWlqTEyoXKT+K1ZFm0/HCr8qB9ApGi67YY9vE3HB4P96US
vRdz84JvcHSiau2ySSWY94U7B+O84GWxH0uOmNK05wSlCVyAf2KI4P8yFfQBSEkv
wPgV0QaojkY5kDH1H/UNHn4EypcYnWDtjXGxiImS+Ky6YviuShxCC8pARyVPQELx
y8ZC+0Mv4sZXAdC4sIPN38W2y0FtiOiZakbw/bKkAGMbUHZAg+MlJ6H3vTidv60d
IRkyHyYzWZgNiF1FzrsF4KzS+a5guxqkaPn4ssc3OsD+VAi3jW1VHvllovKfMzMs
kkMDjCgntxsBUQqKhYy85Ar+LRz0ofIW8DfPbINAFyWvR11ljc6Vu6KNvbtU3n+N
QuOm1UotS8DT0RhibWWTXeUuQa8/aMIcYmlRLX4DmHdUjgsTWBo=
=639H
-----END PGP SIGNATURE-----

--Sig_/I3MFa6umhU/ggOdWlvjgxSS--

