Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4A4B8356
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:50:19 +0100 (CET)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKG0w-0006gO-AD
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:50:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDr2-0007Lr-Fr
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:56 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDr0-0006tE-HH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993114; x=1676529114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5M2juYO1XBdVp0HXJg8qxnDJ7Bn+5MPFeReNPxd/vPE=;
 b=KofN1ql4oHP2PTXHFwRqYTuj7MygFo45prMFL5dzHONLQWYBVO8daLKk
 07/k0KJ8lWa9S9BOj8NnkqbyNWWJXD5IQTv37r0AbwqmpBBVcB2gznGX0
 t0a8n8wIPCyHskM46fxIPxdYv58+OWr8Vw66XJdCFjQ7HJiEXqEi9j41M
 4J8k9adyd29GZ+4S1zyLNYeTaaFTdK8TGn1KZO7TV0eTiWeRMaP7MrWr4
 lQTAN52VTX5rtNqg2Wa36W6uSVu7TnwwNkkQMsuffTunrLW+LhDVNwiDJ
 D0aX79iyZ5VIRyo79BMaRTBD19kbOi4HdMaoxUZIFQig8sHgnsI9Gi2y4 w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974664"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:53 +0800
IronPort-SDR: AdnJWqE5C3DYZpAlScivfr4Ovv40CUbu8RmoB7BiLJDmmpmbs1+ShcK080SSH2uSnKT8m1fxig
 E2MIbqz3rU5tXcsdzdZCdAWFVwvH6jywjD4qgWPDJ2qbMVZoUQs1an2E15ZNg3+384ArFIEvoq
 KCWKPRakEM+jlgRiecCwpDSqdV1X+VbwZ6KQof7gRd/tjSXQG2TrdsCM1zfwzT3wRsagmACoVx
 F3LHuJ9MXp4Fkag8EJjtfJ0gj/E3F5tvS4JdDuo16v6c8/tFnohK8lAWTXO0zy/tyYpsYwdGG3
 zq06Ubcsu9aqu0Dp8C7XLO4J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:33 -0800
IronPort-SDR: tDd1Ju/lStGje5OUHRw3rUIDVn2J2jFM1AvI/KvrRiIykcZ/XHMnxLJLzgtOpfN2LALtyG9r+c
 VNBlEMvNTh3gA1Vz51URMKkx41UejiF72Ih9AB7tuSpk08E7NkvDkYs/sJyFzelLF1NZa7fo0O
 rpyVjMCza+ATnaTpWH3ZxgOwnWOLluDu24DU8713jFk9589sQZNSu9MO1Yre36B9oqJIHik3oK
 Ky2FS0gY1apPs+IFIU6FDznagmYFEbP/sLXgPVOJ40Qb1gCIODd+mmKqMnqSvYvm5KRn0sRui0
 uPQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Qw6C30z1SHwl
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993112; x=1647585113; bh=5M2juYO1XBdVp0HXJg
 8qxnDJ7Bn+5MPFeReNPxd/vPE=; b=W5svLGuvSihQqRu3sAn2hNlqTvrZFrMFcm
 kcUxl7oXxA78Lc2YiYUBREbPU5M6kV4mIeT9BfxFqR21fR2x1FAhkCsoCrVMN2W/
 m+Tzg83hYQ/pGJ/8GI0MzYoMQBmfxDCC//oobiFP0VY2w3RcphURYNjHQ2Y78owz
 H4F4U9iZO0RPA6RV4uijgHyrRtBjl1w4S0eEekx5wjA63Wljul3Q9JXIde+k0UHu
 VdYmSq94uZUTisxmUTXQOxiJudoMep1TrVf3O1IFdDwDGsrfBoSdHKUCpTBsWRBY
 91274Xz/Ol1S8XJnUCUNtilmk5BjU+rUUkU2GIlUKVFctK54jZ2w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RSicG0VIN_Hy for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Qr3V7Bz1Rwrw;
 Tue, 15 Feb 2022 22:31:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 32/35] target/riscv: add support for svnapot extension
Date: Wed, 16 Feb 2022 16:29:09 +1000
Message-Id: <20220216062912.319738-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

- add PTE_N bit
- add PTE_N bit check for inner PTE
- update address translation to support 64KiB continuous region (napot_bi=
ts =3D 4)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu_helper.c | 18 +++++++++++++++---
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b3489cbc10..37ed4da72c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -561,6 +561,7 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_N               0x8000000000000000ULL /* NAPOT translation *=
/
=20
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9dce57a380..fda99c2a81 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -774,6 +774,8 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
+    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 25ebc76725..437c9488a6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -753,6 +753,8 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
     bool use_background =3D false;
     hwaddr ppn;
     RISCVCPU *cpu =3D env_archcpu(env);
+    int napot_bits =3D 0;
+    target_ulong napot_mask;
=20
     /*
      * Check if we should use the background registers for the two
@@ -937,7 +939,7 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U)) {
+            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
                 return TRANSLATE_FAIL;
             }
             base =3D ppn << PGSHIFT;
@@ -1013,8 +1015,18 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB'=
s
                benefit. */
             target_ulong vpn =3D addr >> PGSHIFT;
-            *physical =3D ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSH=
IFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+
+            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
+                napot_bits =3D ctzl(ppn) + 1;
+                if ((i !=3D (levels - 1)) || (napot_bits !=3D 4)) {
+                    return TRANSLATE_FAIL;
+                }
+            }
+
+            napot_mask =3D (1 << napot_bits) - 1;
+            *physical =3D (((ppn & ~napot_mask) | (vpn & napot_mask) |
+                          (vpn & (((target_ulong)1 << ptshift) - 1))
+                         ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
=20
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
--=20
2.34.1


