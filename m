Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAA2DDE85
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:20:45 +0100 (CET)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq988-00065i-OP
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qD-0005xY-Q4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:13 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8qB-0002GJ-Rt
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271664; x=1639807664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JqethK/wgaIv1vHrVHKWjttgWoEh/oPr6sRUwqqQKQk=;
 b=QBwZBm8Kq/fBapiDHpMpH5wxrz0PlZ01v6obdLUKlgbFjEDVh+Ng9WK4
 zC+BqwBypFbNxvczBBLxIuUnIQII0GEba05HG6BX5KCqYpsa2xQ0W/zYl
 fix3ugOV34aC0PP95lK9PJe3aQp1sd8opFOSgGe23t6Wv+5tgzqyFilWJ
 Dua7LPkF3oFvyNfYDGd6unrdiNFQoDlzzgrz5pKn/QeO860A5Wgnq2smE
 TYWu+woWezQLz8wAde21PrDJ9tZbiHfkMK7liTYK6dacD8AiJ3AlLaZCo
 XedNBr3vXj0kr5SXWAKZ63HxF9u9+JnXfEA2ExU1IhuYjVovofpUTigbJ g==;
IronPort-SDR: h8F/55RCU/8K/bzRbuazw1CwEA/QTTCESukYEvVjvf0r4npsTKDQrgzo5tLr3OgCPnGSif8IZo
 NrlmH21Ai9iemODaFIjKTWhA8jhGm83HRm18RMYAsePzgAIX9yymAXPeRS5+B1R6R1ZM06OZeI
 JGfWV+v3yeDj3H+yYdas1Rx01GOAD4qelw3ZNzpm5V8STc+JjL/WvbHsT6PNVsAFAYSOQjhzUB
 E6GZxvNnUwNIYQGkGX8lUJtV2HwqV9OrasIG/QI2nQh5j8ucODNwxRjdFL3O6K9I1UNic5cn31
 9yo=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237065"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:32 +0800
IronPort-SDR: 6HYeZBg68tOdXjR+UJb/kDxEVqaNv4IsznWjWCnN2SwNTyNi4Ia7waCyTin3l6fJ1D6Wd4LQL0
 upqoiPlss7eX43iLdAwsHTcCkk7gFSh25MR7j/h8LQSgFXiYF8Z1Am3cpBLuabywXGrcWiAWPs
 Mv8biFiOYtQcY57EeqJG8USRnBXeipy32c6bRl0yHLBa4qNp1ZOpyRGyFAQ8VSoOqQq23P4vqu
 IWZGBu2zQmO46RzMAoxGV2hW9j6SgT8dis1c6Rch8mlc650t6A8aa8isMnHJqO22lg4czkTNX5
 v6W9dA6kjDQC8n6zPPEOYmyR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:40 -0800
IronPort-SDR: /AtSA3Q0sP74md/6teEerrTRtpoJCVyH8Bfy8o7cehrPMSqHIjCRkLyfFgKVkQdBi24LevokXH
 pLBAQ17bCOmG1coTN/OlLVvi9WiuOpUrao6uNmoxEGRy3EXM1W2PZY3EBBG0QdOnljzOrD3tnG
 SK2NW+Tb3tp6Wu1BB3uiExobErM9L4flDXGHDqE/lzMfcz5E3WrJ5OWIMedQrPbzcadl2LZx/K
 6QtzqauoHlSfJ8yFwro7sWevhAScuTuRa3qZiWp8xUUMWBPpQX7u3y45efd3XeV3FUWv6+f/Ir
 lp8=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:24 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 16/23] target/riscv: Add a riscv_cpu_is_32bit() helper function
Date: Thu, 17 Dec 2020 22:01:07 -0800
Message-Id: <20201218060114.3591217-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: ebd37b237a8cbe457335b948bd57f487b6b31869.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9c064f3094..6339e84819 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -384,6 +384,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
 
+bool riscv_cpu_is_32bit(CPURISCVState *env);
+
 /*
  * A simplification for VLMAX
  * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b..32a6916b8a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,6 +108,15 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
     }
 }
 
+bool riscv_cpu_is_32bit(CPURISCVState *env)
+{
+    if (env->misa & RV64) {
+        return false;
+    }
+
+    return true;
+}
+
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
-- 
2.29.2


