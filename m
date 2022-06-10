Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD36545B64
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:59:31 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWk6-0005qF-9G
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWG4-0003ms-Kz
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWG1-000170-Cs
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835304; x=1686371304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pr6hAx/AyA4tNc/jCu4l3I5cXGZwBRX0r0Dtn/dw+Bk=;
 b=q1MYCbmsXmDGOvEIKe/Otz0yuJ8M82g8okFhyJtLwaQxtt9zDbeXXP0a
 jcDY6CnC6YSyfnTMKIENLozwimwM00gfI9Kna7Bw1QEOBhFGUk4j++2d3
 Wf1pSW2IjP8Gxl4MjxCGsBn8SOb+J7ExSUJSo3K/GhFHv3pLZRAyWgMFm
 YmmTXOJTLmqCSWxks0gLscKi7qLzOtAxYK8JLr9aYDJOl5ouOYheiLZMl
 6R/c9bH8VLiZ7UY1aQVDtM1jX7GVgmCaGa54zwWruebsg/m2yIdHefpCk
 ngqvstD1/myuv1vQ9WWseVV9/2IzR9YJ1t9Is7VnxGm1cjUXL9vXR+liI A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="202767237"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:28:22 +0800
IronPort-SDR: N86mUmS4Zn+VyknyW9EJDJiKvk9spBQSxR3woZrgmWkIhDoYbhN+yGNWa0rNWC+GRRzPbL6seG
 Lf7rZrXSl88KewmB/r6JMjlPBjIflfRTYMOQIvRLxGFZtSWdkQvkKDePCxeG6w2QJ2ZV3c7YcP
 UTB9zcC7mQIMxjUw4kL2zqplMEQSxCka0AWvNNhJdohnK24uahTKExj3xl5OeXyOfG5qLDJCPP
 a2+8ME/L45y7JTBdgLdOefFpWKLOCLhMIF/Gh9aqnRPkdyzT37XyR6+mg5otFeJLAJYzU3Y7Qb
 qUJOhk55VIJW+Db+nsQVMPi9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:51:31 -0700
IronPort-SDR: m9Dk8UsXJpuf0oP4Oqn+ukNBEQezdUjGpQkWqUGlxvlbwACDzH6jD5aZNSK4eLiNWjP/QKBi7I
 BMID0OPzt2yeRbVkqfkDHBNAze9B+IcMmA27fYpBVasgIR6ZQgljwe1XR62EM/phdMNyIHM96b
 TjLKkonoTZfyaj2wM8Y5s14yXZsvCh8nxFu+DUGlOh4ZiJITokmV+Q06ixkOe5BBmTzcygLb/4
 wCK24Hbw/wfXABTvj+NK9yOxUWtxsLSHhfgq5XeZgNLcWrzBmKL1BMT3R09RdSt41N16pV+lNY
 iJI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:28:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Hq2GwSz1SHwl
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835302; x=1657427303; bh=pr6hAx/AyA4tNc/jCu
 4l3I5cXGZwBRX0r0Dtn/dw+Bk=; b=ophG6vNj8u3ARo29i6lcAe/qVwuAOngcpW
 ZVltO85BEg74nFKG7vfdjXOl4v9jCB4JT77Y2I4NWRKDQ/ktJnQxEp86+tT3r1x5
 BvQ28/TMCDODWf9uWgvAD8SDMyWzYCIC6nKrCMR4D/cbAXPlbRq/tFDjm3iiBrka
 m4TjAgpjWCRXTKQAC1Ep9ASzy1bFO16uXtUAoewVZYVLY7l/bYIwGyskwHSkwjWw
 x1kaY+3YrajqYSEl/uacgPePkVxJYfGmDNJhGdDq/O6qFmQslewuR4yOBUn5k5W8
 8voJ1PU/hpTyios3HY4AikwjG2zsDnR2xzk4VUtDyTQjT4EBuAKQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PHIQPUTxhPeD for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:22 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Hk4pNvz1SVp6;
 Thu,  9 Jun 2022 21:28:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <yueh.ting.chen@gmail.com>,
 eop Chen <eop.chen@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/25] target/riscv: rvv: Add tail agnostic for vector integer
 comparison instructions
Date: Fri, 10 Jun 2022 14:26:46 +1000
Message-Id: <20220610042655.2021686-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: eopXD <yueh.ting.chen@gmail.com>

Compares write mask registers, and so always operate under a tail-
agnostic policy.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-9@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 056c2a1c7e..a64506bf02 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1371,6 +1371,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1382,6 +1384,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, v=
oid *vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* mask destination register are always tail-agnostic */  \
+    /* set tail elements to 1s */                             \
+    if (vta_all_1s) {                                         \
+        for (; i < total_elems; i++) {                        \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1420,6 +1429,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
+    uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
+    uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
@@ -1431,6 +1442,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong=
 s1, void *vs2,   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
     env->vstart =3D 0;                                                \
+    /* mask destination register are always tail-agnostic */        \
+    /* set tail elements to 1s */                                   \
+    if (vta_all_1s) {                                               \
+        for (; i < total_elems; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
+    }                                                               \
 }
=20
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
--=20
2.36.1


