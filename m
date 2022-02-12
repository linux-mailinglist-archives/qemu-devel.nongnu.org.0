Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5924B31F1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:27:07 +0100 (CET)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgFm-0001Ty-HA
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrz-0007TQ-4o
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrx-0000Ke-6y
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624149; x=1676160149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ussBVH1+4h81kyuO/1QLKONncT5n9KCiu13m38fRO1M=;
 b=ow/d/RsJ409I5CJycRqzQajxj97BaYIPAdi+/Odsbb0TUlQcQ0nKu2V4
 er/fa093DnxqukVC0VvCbNv2Gk+fHYSUVRbHIkK3OEhBolPT3o/h1ahF7
 z5zvWfAvDZ8mI3J89OnabVnWkJrF9AAVO+Cw+pFVoXyffj/ll8vhXaFGe
 tbD5gmEx6DVZIBrdJ4yEfXCNFWmNbuoyrqgZr5FGXnivOpavlQowV6w7/
 4FFRBKpT/BhH5MgtP1NfNd1RWgbJlSyGBKAKP/vjEKyB6yHYxozKt4nOu
 CzaFgPw2LOmczrLcnPAJ0W6IV6DiFU+1cpdfrMFR0r3ZBfnRVYRJaOWI7 w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835834"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:28 +0800
IronPort-SDR: vm1gPeR7DYYheKVW5dkRZXCGHQ+YpkLMWOx4/nyoCe3go0pWWyWuFv/DbvcYwrn0nnlmbDdJrk
 bIUIpEffWU0vLCtjs7BkO4DtcUaBi+jHx1JZA9kpF18tH9mYDoozmHkkKGFnXv8j3hTrzNB0+G
 uHNaLCIiDpwQ8RU2k/YFxjYMA6nvO48CAtTouxYTBvH+q/gmMxCh69ruhnXrCJEFMMHo1tQAs0
 UQoHfR1pjeDD3tNmVUwVU63Mp2oxR7NPi0B+JKGiBsScpOsJhKCVvSxCc9zcZTSZ4EieSZ2m9j
 rBzX1MhmBBlQlqO9Xm3ZCTDF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:22 -0800
IronPort-SDR: GoFGCFnl2vY4AwvdZF8v3MKLTdo91pTtPx8FyL33bWaYxCYKNkPifnHLqONt+At9HYxil/KWkg
 +iEeJqpxdFsTNUfQwDl9JClBNzEt3ZzoXj3Y1DUhZE7J9VmQQy0o9u5nAckP3mlc9iYgfRlMLD
 +6S0SOWEq+opmJqwQuAo0latyIxaVxPnerg8e0IQDJhu77kTQ1/gvRd7VzeS4k2nZREetmt6P4
 FQhMgPnN//4TrK4RMNkeoomHl749WlbIz3pw1lBZ7OyTab6yywqFF/tpzexIpNK8GO/KNDLsfJ
 yHc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzS2rp1z1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624147; x=1647216148; bh=ussBVH1+4h81kyuO/1
 QLKONncT5n9KCiu13m38fRO1M=; b=RkotOEPjyA4Oijk8EvPFfGur+LKpp8HP2j
 JRlOTp9NCFCSHihUM9w9CJ30ttwAGEudAQcIPEde+Bfinfm8fKx5g+thfQ+vkPaP
 kh1i3A6syiIjnOaZJj/s8s6TEWQeA+AZKak7DNrRlqkDMM8oddAsb0plCUuQt3z2
 g1Q2wCOhilrTPHxn9oqhTBzcm7T3BfyhRAi11GfujrwON7ksOdLCmZcoOPnh0M6x
 6I1rWA4A2NlF9trIQJizPVtosQZ9w4I1A0fLlq0ydf2uPqFRzQhGfY6Ag1/0EaEq
 FIS2ji4x5P6G1RJCSjknWrIzW8aufntsP+niwgi7/+zMS4VuQ1Ew==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6jTghDKd6r79 for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:27 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzN33myz1SHwl;
 Fri, 11 Feb 2022 16:02:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 19/40] target/riscv: Allow AIA device emulation to set ireg rmw
 callback
Date: Sat, 12 Feb 2022 10:00:10 +1000
Message-Id: <20220212000031.3946524-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-9-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8838c61ae4..6b6df57c42 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -256,6 +256,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
=20
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask=
);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
=20
@@ -433,6 +449,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_=
t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask=
),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e45ca08ea9..37c58a891b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -396,6 +396,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uin=
t64_t (*fn)(uint32_t),
     env->rdtime_fn_arg =3D arg;
 }
=20
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask=
),
+                                   void *rmw_fn_arg)
+{
+    if (priv <=3D PRV_M) {
+        env->aia_ireg_rmw_fn[priv] =3D rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] =3D rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
--=20
2.34.1


