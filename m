Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A46FB6A7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6GD-0007Dm-N2; Mon, 08 May 2023 15:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6GA-0007DP-Sx
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:10:58 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6G9-0003wa-9e
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573053; i=lukasstraub2@web.de;
 bh=cMt5vCpBN0KI8tnXhcVX0yiidCI3Z21rKwnl39vBX5Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GkQgUkAvffQ7bxKLlkVxZF3QBT/RGaL3L9SU8kNSWEwNw1BOHZB+JTqcb34XJyksd
 5iWiGE6/f/yZdEYhvdcYmb4W3cmgl1xBjUViIiCIn8dYs0PVvl8AO7IsjigfVgoIeD
 44+fTST/ch7qBRUbfQlxAZolJR05ftEK6Kr+d54vytRdgG0OrPPkumi5jrvlr94hUZ
 tf6xig5G/wqPaR8VCCpW7FNlHQCnKKCMNq+nUQLPJKPu6Cpr8geLEYxsP0v3XGhQcm
 VkO+0Ogng2G36MPgnS3cVBMEGcPJbeFGZOTPfibPlOeHM8/EYoihmn6XF3f2b42bPR
 obxzFbKH/uEDQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MmQYX-1qdzeG1VPV-00i9XW; Mon, 08
 May 2023 21:10:53 +0200
Date: Mon, 8 May 2023 21:10:52 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 1/6] ram: Add public helper to set colo bitmap
Message-ID: <22d83cb428f37929563155531bfb69fd8953cc61.1683572883.git.lukasstraub2@web.de>
In-Reply-To: <cover.1683572883.git.lukasstraub2@web.de>
References: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4mtroUHt4rRU9=7jUnQwy8r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:f8gZ6rAjohk1tekSySYhZYJEOk1esAs1lE+fHTyjAwHTB23PUZ6
 beDmN45RSfzoOnjfbZ0bzmChkvaVcUs/0w0O+ciz2+ZnPzlY3LisFCyxZDNVF7w8/d0yJqG
 ptXt8pXfhFLpDw1YTWlh8YhuUYHobu68nZQP01yRbjmCjJfW7CdtiuvonbFlDF0XJOSi9QW
 WrtuTkTZ8nr3aYb7NXX7g==
UI-OutboundReport: notjunk:1;M01:P0:tjVevSqgFc4=;/20tj7JIfVqY7VRglN5qVovrMJJ
 Xl7xz9OF9cQ3wkSkTl84oOwOx1m3hFEvV0L7OU/VyZt9OxLQZCSUFgGI+8FIyS73gBhkFZbgK
 J/rhZ8yV+4xqcJ2zX8Y7/Jtp9yQGUd54HoInQmPnlVKSUvanJQI6DAjjMkHVidJdCZS5q9ic7
 h7/HdzTW7Tu1RIS20sZw1OMnCrWn16WcR/Goutf8G0R6Xc1OM4j5Tv5b3ZcMDFhAMrTcymmDV
 FLs2j9tYDsu2+JG2FfylBZ5NIP6MDsLnod9Z3gZA7xQEUvDJvtfMyG6A6zYJzhil2WcjzwU+B
 X8Kw8f4x8emZZ0JSxAPOWxg1sXGSOdh9iesojJFpvA5lGIFlA5Za3bCvRzvyXlimp6TPpIsND
 QgNZ9mTDxYYZ4k8ZwNlBIHZDI80lzBe0MgWWfREfJ8OYBn7TklI1IW8bCmRPu9NjgT4/Lum3z
 Mwtk13YVx4NwZh+CQG5EH1eHx/GN4JRdQOEd0gYWZ2CdK+WfBFAneKdNoOiJaTdaHijWuiaij
 B0oKe/Ml240xOpx05RBI0v4ecukgsWflwqPt6FaPCM4Gi7VoL10RoV3IDce+FdOaELfbLwpmh
 Oc09yGlTYdrgfSUcnamqv9QPjGCTyI+azLw5MYy1Jv/NwpiY+a22P2LvVl+vxgSli5YBb/Nze
 n6rCCAN3THxQdBZaORcc8vPCqeJGxondyxaC0YGAqp0BwPzoN58rz7DRTybIcxSJjbfl6CkSD
 qTsyeDaoxVSlGezWd7wtw72UE/bIkkOl8zLOZUxEpnOKGWidG+JruKSjW1YPo+HJyzr1ryciM
 JvTx93stT9JWqjylbiLMzjPUh9qG2ecp60uwBK6HS3/EstMxEuUS3o1WsaIGpbMBHKqVm90nr
 w/7fmiQL0IrVJu5FHEJ6S5z/1pquze3BkitIIvzmgXUTdiLJKDUWViwyE83aYC5xQrTFQQuFE
 QS3y/Pkf7we9I84jeHvAx4jpG48=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/4mtroUHt4rRU9=7jUnQwy8r
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


--Sig_/4mtroUHt4rRU9=7jUnQwy8r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSTwACgkQNasLKJxd
slhe0A//QB9PypC8Gn4YVbzpNf2OClRb2TMAkZopKV7OaDNt9ZGAl0mw8EV+bv1G
GQkEnKLUz1fum16cZAvp0TZk10G2/sxSoDIAyi2gajBeSN4IMfSqBpYvDltCBWgR
6yiYdD2508yR1V60bDdq8qvSXWPuiw5xK6y7oaK1Pvp756mkDQh+czF7YimDmg0b
dkuZ3HKiQ/F5n3EnX+i9cR1cxFaKlugeU1lF17IvId+wfJtBoTO6Z3wQ1Nn05SQ+
6lIQ79bWeb2/Tw/ZhET75w2z/wf0tLvDHk2Usek2+3dO4CDmeq92Bk553i70+LKM
2gckkXia/Q6Yb7b6TYcsOq7RD9itgqFOTeREt93TTWrqVBt1Zs3aokdwl4C52Kii
T9nCDLVXH0keFIzdtQ5hT3aJPLVSqWYjhpMfaaGyDy1hfBoFfGd+HmRqag4kZkCc
mr8K7oHCvodN2M2I0dq8Bj9hJJ2kIEShwuBGgJ2TgNRa/mLEUFS64vWdQzzTDLH/
HmGYRzM9CLC1E84bR8DiWIq6XiXN6bhx84h1b59Bu/6dAXKgQPQfl5ElqKaWUCRM
Ae7va4pUx0Ulkmo1AMZYbNqQaeiV2NgiMji8ddWH8QGHQFaXvHivSyDy52uZRxYv
NGfKnqPsqNMQB6mBGrxzcWpSN5gvxtB6Zw4N3lffJBuElb5ANSs=
=BZg/
-----END PGP SIGNATURE-----

--Sig_/4mtroUHt4rRU9=7jUnQwy8r--

