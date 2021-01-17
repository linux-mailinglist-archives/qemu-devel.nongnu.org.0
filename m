Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D42F95AC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:57:53 +0100 (CET)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G3U-000224-JQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzy-0005hk-2D
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:15 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzw-0005Ux-9A
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920452; x=1642456452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OyqeSrK4z3EFuRbBI4aHmMrvzd1dz/TK7VvfkMHCx74=;
 b=Vm4wz+0cTkCNzT27QGytQiUx9ZtY0Lt9jkmeEvuV3mglri+JNfwSW1PF
 +pNBi1J/wr/ke5NTRnuulBAPj944Bz6D6W6S79/hH3Jye1eAjs1kviRxg
 FRLyUvWAHMenVPYIVxGM3D7THmsG842LIe/RjjFdRfW8+LJJuCGr37FNk
 MkdYOhpymxXVXiG2O4q3TKwLuUZWSTdBMvSqfPNQMPkjIf2yeBLhvMvKu
 b1/MmTusR5LyLJxglwoRQ8y/lu1DOVRDlUvqO65rlaEmU7LDYugWY3E/u
 uGq4rKiaPEA/DgI/f4x5RpQ9X+5QCAQpqP3F3YXLLTbR9EKMmPG3McBxb w==;
IronPort-SDR: oaDauIXVWrxrfA8M4VtiG/V932QsrSWVNdl1PAdwQMTClCvQZKJjoKlCKvONCBGs8DQBdtIEop
 +EimJKcUIPcIpylMuuALfHBi6grLr0+w6RCKUJlKbRd0IWLnUgYpsV/dGqg5o6IkXYkXfjNQYf
 +WDc21HzEd09s5kaXZOyuOgjOkQZ1eWc+xTcXgMjMdi/TD2S4oeVSK8jtJMfHSJrHi4wXIfDFE
 yXzPOSb2oRlQ7CptBLUPSCqtXJKv/vUum4rn8YIu9y8ePPJDDKZTM/qliCfeWS5RStuFPMf/nP
 aWY=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645966"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:06 +0800
IronPort-SDR: b0EytWAACbQJ1125opEEjxHbdXznI+YviRsUjjPzufMDD3IOSMK5dufz7HZT7cEg4D+0HGGBm0
 rrt9dGYrLEvcb1KTb4rX/z244iy+UR7ot6/B2Ty+gAOU3fA/9lKJmoApo5dFziVMYJrdVPMGn3
 EH1uPDG0HNzTtsUsGM/N6mry6wfnZnSytwAFHukDeQ0SebvAwbJU00DeISfbxKqyAK5ZfKNR59
 tRlxfM3gh6vschzUcWfO7MkuBJBK6jgNJhP6+Lm5v8IjaCmvPULsnFNmjYHZaDjoDzKLBovU6A
 RiVh4m89yRJ9C2o2VM/4KrYZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:45 -0800
IronPort-SDR: 3uOnDKeC9eNnzcgt5wLWts8Y1fxsmGnzvCab8ddZJM4qd2KtktcpKkMw3qD2JNRKw0dL7mt64v
 +b4+L17I53YVsoTe4CreqjqGRy8JQJNl1tYEf2F5j7ioMADWTLhvGIGfwpiwnqx4XFeVcNUDDR
 jLXow+OVpfaoYEK6UVIrm3SERBKMlNb92luItsR8oSUVoyWw74a8pmFUYa5bNvbdy5qB2/UdYd
 Qzh5Se7VsThbAvNqgckbD4xOGOjTK20crR8avwenQLWGOIN/wmmRzUFTenJ4a8GEk/0YBZOrLr
 9xA=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 05/12] target/riscv/pmp: Raise exception if no PMP entry is
 configured
Date: Sun, 17 Jan 2021 13:53:56 -0800
Message-Id: <20210117215403.2277103-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201223192553.332508-1-atish.patra@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.h       | 1 +
 target/riscv/op_helper.c | 5 +++++
 target/riscv/pmp.c       | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 6c6b4c9bef..c8d5ef4a69 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
+uint32_t pmp_get_num_rules(CPURISCVState *env);
 
 #endif
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d55def76cf..1eddcb94de 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -150,6 +150,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
 
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
+
+    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
     target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
     mstatus = set_field(mstatus, MSTATUS_MIE,
                         get_field(mstatus, MSTATUS_MPIE));
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 2eda8e1e2f..80d0334e1b 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
 /*
  * Count the number of active rules.
  */
-static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
+uint32_t pmp_get_num_rules(CPURISCVState *env)
 {
      return env->pmp_state.num_rules;
 }
@@ -237,7 +237,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        return true;
+        return (env->priv == PRV_M) ? true : false;
     }
 
     if (size == 0) {
-- 
2.29.2


