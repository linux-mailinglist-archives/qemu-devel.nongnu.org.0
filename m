Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C961A39EAC4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:35:34 +0200 (CEST)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPiP-0000Yw-Rb
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdj-0000q4-6T
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:43 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdf-0004Fk-En
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112238; x=1654648238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tf0qoN4IBD/MJWkG7Hnjqfy7y72JbTSWqEdhJdUQLmA=;
 b=l5xvs9AhXThH62BPslR5YDWoaHghI35E2NVEg4WdpQXHO41ME8eYwjpG
 pincjgsvzFFiorF2X6fh7aPrwcMtzPjwZc2CA1Gro66ZLgwRMayeg/gK1
 wZ0phv1xewMYumZzfyM7b3elSCMjZPTVPH+psKBaTa5OkCkW3CZxKF6bH
 fqC7OZkaLoChoCI53F+o3qd6VCLg8a1zpEyE+M/Pac1hnht4GJs+23OlV
 a/SXMAC7cez5kjqvpwZsK91ri6eA4ALzY6/aWYm1BehpaRqVgfh7WH6pg
 kVk895bYb+SOq0nFgcfOTXCaJaCwo4n5TAJvXj49MDFh0pl9C4IkOjRvv g==;
IronPort-SDR: sCMAOMtgVhlJ3wpZfTs8I5u1ZG6UoG2hXqmHEUkUMnYWHsKldEZ4B04K2bksj64+/kKaMN5SvC
 JwnjckZEXP7TfEZmK8Qpd4B8srUezrSqdIWL8h+ELA2iDKga2/avuu2rv8y4su20MCEWeEQFsA
 ZVWbqxMmAUMnj8KVylkHBGRnhY2R/uWKaaQQfwXG0leMTg+ZfHuF4geLmmHcSumQAe2qpeIAVp
 i22NPo6Rw7SGngiZ/RkGSspZZWthg9jyXnFsLfFfOU8JjBZLtWCin/pGSrHUQnjEVpqI0iHqia
 KfA=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087361"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:37 +0800
IronPort-SDR: 3sFpP+xXyq1R7jCXkO0X+UzT8AjrTl8uKt01xdsDFr/vLAuiys/l52zyrSwDOf/k4+boxn7aiJ
 Nhgap3nnkdJ1cuYSQGDEMg6jxJcTmKZIKNEvjf4ukFLw3OzQCAQmauk8037JshDxHVyQLJC5cX
 KPqAGNKL86bJ+zx4DNR9Yyf/rbctjtyoEMtifwhbLiOiaTfUxsd30WddW5D5GyaRLAPacSU3/+
 6+nC7Wia3gtjj8zCBMWdxc/R93fCpatgXYpYpl266GL016dHiknyhvDYCDTyGlV/J1MbElDQaB
 U98Vz45LErhG4P67m8ShZExB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:44 -0700
IronPort-SDR: ffjIgPf4edexP7kjLFcQQztj0aTKIFfOFswqRXKoe6W3WzQPqZJWi+bnLXkMSc6FQDkcD2l12i
 ufPtYslJDhwNL68CpO4iupUsdJTTf8fV9yIdelf81o9kc52VrZR+5PQZVd0lH9VfsL6zjkxKVp
 XbAvjVoVLmyz/nr/bVaN22C3Y4Nb2daHeCV3pJb5UGhNvmVBpuDobv3h3twH47UMvglvJz7AvP
 RPi8XxsmHpx81lE6IQT/dwjS2Eq98dUNiIQ0lrPkWb7xTNbVJxZNcBKDjvExtX8S/HW9S6zLRK
 3AQ=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 09/32] target/riscv: fix wfi exception behavior
Date: Tue,  8 Jun 2021 10:29:24 +1000
Message-Id: <20210608002947.1649775-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jose Martins <josemartins90@gmail.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jose Martins <josemartins90@gmail.com>

The wfi exception trigger behavior should take into account user mode,
hstatus.vtw, and the fact the an wfi might raise different types of
exceptions depending on various factors:

If supervisor mode is not present:

- an illegal instruction exception should be generated if user mode
executes and wfi instruction and mstatus.tw = 1.

If supervisor mode is present:

- when a wfi instruction is executed, an illegal exception should be triggered
if either the current mode is user or the mode is supervisor and mstatus.tw is
set.

Plus, if the hypervisor extensions are enabled:

- a virtual instruction exception should be raised when a wfi is executed from
virtual-user or virtual-supervisor and hstatus.vtw is set.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210420213656.85148-1-josemartins90@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h  |  1 +
 target/riscv/op_helper.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 52640e6856..7330ff5a19 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -390,6 +390,7 @@
 #define HSTATUS_HU           0x00000200
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
+#define HSTATUS_VTW          0x00200000
 #define HSTATUS_VTSR         0x00400000
 #define HSTATUS_VSXL         0x300000000
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 170b494227..3c48e739ac 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -177,10 +177,15 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
+    bool rvs = riscv_has_ext(env, RVS);
+    bool prv_u = env->priv == PRV_U;
+    bool prv_s = env->priv == PRV_S;
 
-    if ((env->priv == PRV_S &&
-        get_field(env->mstatus, MSTATUS_TW)) ||
-        riscv_cpu_virt_enabled(env)) {
+    if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_TW)) ||
+        (rvs && prv_u && !riscv_cpu_virt_enabled(env))) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    } else if (riscv_cpu_virt_enabled(env) && (prv_u ||
+        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
         riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
     } else {
         cs->halted = 1;
-- 
2.31.1


