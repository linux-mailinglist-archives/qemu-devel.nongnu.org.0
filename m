Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A547A4CC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:00:08 +0100 (CET)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBiR-0003ks-CR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoE-0004TQ-6t
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:05 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo8-0008MN-8h
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976517; x=1671512517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHdFinUR27MQBQOzOw44Il7tp9jqmK0h54ogqW3ZMe4=;
 b=gWKkL8+Dx4Cz8mAKs7ggW95hZjZxIByhLiHVKAYStmW2uwcjBuFkmpsx
 jdIa8cjCU5P8i/8wXUz6kGbPGX21rkwZfvhJdmkV5CyRRakh4hqL4VZHl
 Bxyj43meJJHjqgRd5h+mhziYbL55HJAUN2ux53JOKsQ54e4WmzYLuhD4O
 Va7+j309mCImDnmopV0v3szzl7WG+o5FQ6G20otRgEy15kzspDY3FcCa8
 i1xEsakAsKkxa5pOmYZ4xre7bBm1r67pGR01FXgq0XabQrKnx6149odib
 6BvQchw0qCCtNF3Vhuur5P6AlF1u2twzxmWqEi5JV1gz5NL6lgcGNF0e0 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680190"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:13 +0800
IronPort-SDR: TZrI9HTk9p7OOttog9qVuvZRSNI3AoKEqVraaX71OoQnlTg4d8dK6Bd3ektM8NrHmT3QYHHrhu
 JLpr/KVxkzkS5YQFyC+aXlfmoMZnpSCHd7EtDtHadO0gqLqvdqY/jFUU+QwSpLCcHQe3mxQxyC
 8jfWD7mNIspdmU39vcE9wAObCtKMMhWfwzxkETfEtjDdc+Rdb+JEURn5HvfVbFwvFDfCpX6xmw
 CjMxnIO9G5Xa75qdGzdbC6OKy4XdHhcbT5BcJaDznMxypI5BOP4vK3urpHjt1vOBlOPKQDuGBI
 YT+BfeSYMeTeKbRJuuDkiFV8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:02 -0800
IronPort-SDR: 5NTgk+QsCe0JT+BDmyG+co9PwzF+duCpsjHuUpLDPEtYEGimz60rNoCqwYn3eOYCELMyalIJ+g
 CzNP1WpBlwMzgVzcYyYtu4Ega6OeOVAgAlXSslnD7Vrx7L5M7yB30aZs4g2day3CZnJmaqbmtg
 Jj5esTp5+eSG9siVOcFXwb0zre0UBtkg0dEu61ZPg7VOSA639fuI+EHwjcPJk6y/b42R2OnfP4
 djv6wPdRu4xxXLVpDfbB6nfXM8/Sfd7HSdmgT0UCg0uWad4a4zfCLLwSUNC/EjjjGeFBT/U3Eb
 fx4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS944gS5z1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976472; x=1642568473; bh=WHdFinUR27MQBQOzOw
 44Il7tp9jqmK0h54ogqW3ZMe4=; b=P7sf/rUx6i8gpXMrCCSPwr0cD/Svb7U4Bl
 gXHhAxqWY/HyrZcSZjk6CBg34N4FX03Gbs1AAPGfStBsbViSaF2jHvRYfEUqiobh
 eaqZ5Ao93I/Qecwaoimw5tujKGquPUqhiuwFKC/VzvFwtN+IAc6pET/wv8t6VGGL
 STd6iHG+h27d+vwZTe/GCp9MbeiKfIpx7qoPyy+sq6eFhcdN22OLWgIUwDsfqZGx
 A+fnzY3NMXYQvZx2n+gSo/9VYlcBTvvLXpTO0EmX5wmpxccnlu4Og/VvsaUM+Hit
 TA9UPVhBjfSpAVOuMb83lJJasBMA1Sl6TkKu8SnCsEowV8+XqzDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qdGnZWcjsppo for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS911FwJz1RtVG;
 Sun, 19 Dec 2021 21:01:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 58/88] target/riscv: rvv-1.0: slide instructions
Date: Mon, 20 Dec 2021 14:56:35 +1000
Message-Id: <20211220045705.62174-59-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-51-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf474..d79f59e443 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,       =
  \
                   CPURISCVState *env, uint32_t desc)                    =
  \
 {                                                                       =
  \
-    uint32_t vlmax =3D env_archcpu(env)->cfg.vlen;                      =
    \
+    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));       =
    \
     uint32_t vm =3D vext_vm(desc);                                      =
    \
     uint32_t vl =3D env->vl;                                            =
    \
-    target_ulong offset =3D s1, i;                                      =
    \
+    target_ulong i_max, i;                                              =
  \
                                                                         =
  \
-    for (i =3D 0; i < vl; ++i) {                                        =
    \
-        target_ulong j =3D i + offset;                                  =
    \
-        if (!vm && !vext_elem_mask(v0, i)) {                            =
  \
-            continue;                                                   =
  \
+    i_max =3D MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                     =
    \
+    for (i =3D 0; i < i_max; ++i) {                                     =
    \
+        if (vm || vext_elem_mask(v0, i)) {                              =
  \
+            *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));      =
    \
+        }                                                               =
  \
+    }                                                                   =
  \
+                                                                        =
  \
+    for (i =3D i_max; i < vl; ++i) {                                    =
    \
+        if (vm || vext_elem_mask(v0, i)) {                              =
  \
+            *((ETYPE *)vd + H(i)) =3D 0;                                =
    \
         }                                                               =
  \
-        *((ETYPE *)vd + H(i)) =3D j >=3D vlmax ? 0 : *((ETYPE *)vs2 + H(=
j));  \
     }                                                                   =
  \
 }
=20
--=20
2.31.1


