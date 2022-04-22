Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5B50ACF3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:50:18 +0200 (CEST)
Received: from localhost ([::1]:47750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhV3-0001Ku-JG
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIp-0006m3-6n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:39 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIn-0005IK-G2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587857; x=1682123857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrQXpr5Vxfb8nWiDsJDGy1Vhs7NRhjml2Jwy5spgypw=;
 b=R0pNBc3k3Z3wBCCsKv706idfaCwI5vhxlpEV8EnMzvNOBRcrPhj9wA8p
 TUhRGtcO4bfS8zqYonff69BSsFwl5E2zdgxkHGRISCCm8Yx57QZ343fPJ
 DL+cDtSlb1CeYRAAyy5pATruHtjJQyt9mFbEYdFYNRqGsXNpkVse1was8
 gvv5YqK1Vkq0op8X1qC+YIJBBCt8doEN6Eq9PXptBRXCEJd3xLRoA2X0E
 TG2oNJt2QB90Xh81BAtjhnW1H4w8QPP4AQPIsVIFtfO+Lwkn7bNQBKWC5
 kGIJYv7fqq35D6G034azVISP0fIeqaSkg4poU0Ud9Am0l4t0MERq84loy g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715745"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:35 +0800
IronPort-SDR: ygrFc2x2sgOjzYOlSt1on4/S6slL9QGS95eGzIB47Tb1JKvV3k753Rm2QZaiYnBCKVPv5hTAuf
 yklihrMlNGCDoHxO10opC2CSutMA8U1VqjNUs3LftrgF97MbIFSENQ7Ty5rtRLNTidhyjcKS/6
 b24PkPRe9SY8fdDS2W9hq5wff0n0iNKjUnaEHVcXLpSGmWyDddYRpzE6hztQiHfmUGg1NE8v6U
 SIc1mxRExRFv5ezVwmEkFpg+s6zILeFCAzZXP+hvKIEwfjQUwTsxBpAkG/kbMTmssPI5n1quNd
 Iy5ytdSHxMW8aexN483d8YHQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:52 -0700
IronPort-SDR: TYo1pMA2HJbtIkBBZXBFGlvA1CjL+OyThSi1bX+PPXwsWSZa9tIN/eM8v1ALk+2uB9JbQsTARg
 TpurQTa1WmpEzIJTThFykBLutqL1vxoFFcHvo3qoX/c/UvG6IJ6RWbwJVdBegWYWq/V5y/B9RT
 ZKnShJyYn6WHDBI7lfs13TvYMk4jCWpfX40zRgAfTaDJZRf3sSFitduBvs+MeSflLa1X16MyWR
 TTZB1KzIMJaPULh+uABwujCORHN6x0ujsl6JHtvK/JW62EpCDSZqXDJhYg7QegoUuJ85Ebbw0Z
 /oY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwV736KVz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587855; x=1653179856; bh=FrQXpr5Vxfb8nWiDsJ
 DGy1Vhs7NRhjml2Jwy5spgypw=; b=T2cAUd3df0jROgjpS96xz9ILDQ35ieK4rR
 jwSUqJ5DlNXEIMxcrvES5OLhAexO3EHtsbnEePBxjyT0n0c1PppWPxQGfUh7/ZOK
 l37wvvX5c3/+nSMhWMgCn+1xnwOLNAorJwioCFMP7JTGgS0wLXjOFy9KPmAGb3sp
 bdRJRGFxW9YX8CZQOmhsJNmUBncIK9QYZpem3FQMe8KsH8uy0tp0mkp6YucDnWvr
 B+VIsJE+b2zHqqGGyZKm5wF3brAwFnRmexlqR19s7vxX7Dcv7bs5R44e7IZrF0KW
 IR8V0ZJCsAdZlPmB44dhTjrRmM7Cn/XJWg6WS8WAwK+oJw4Lhc5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QyypMSmgXwax for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwV45Np4z1Rvlx;
 Thu, 21 Apr 2022 17:37:32 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 08/31] target/riscv: Enable privileged spec version 1.12
Date: Fri, 22 Apr 2022 10:36:33 +1000
Message-Id: <20220422003656.1648121-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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

From: Atish Patra <atishp@rivosinc.com>

Virt machine uses privileged specification version 1.12 now.
All other machine continue to use the default one defined for that
machine unless changed to 1.12 by the user explicitly.

This commit enforces the privilege version for csrs introduced in
v1.12 or after.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-7-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 8 +++++---
 target/riscv/csr.c | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..c3fd018ecb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -150,7 +150,7 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
=20
 #if defined(TARGET_RISCV64)
@@ -503,7 +503,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     }
=20
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version =3D PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version =3D PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version =3D PRIV_VERSION_1_10_0;
@@ -518,7 +520,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
=20
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 84a398b205..8b6a1b90f1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2975,6 +2975,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
     int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
+    int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
=20
@@ -3007,6 +3008,10 @@ static inline RISCVException riscv_csrrw_check(CPU=
RISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     return csr_ops[csrno].predicate(env, csrno);
 }
=20
--=20
2.35.1


