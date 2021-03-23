Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7106345537
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:02:36 +0100 (CET)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWNP-0004IA-PI
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKY-0002Iq-J2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKW-0006vy-Px
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464776; x=1648000776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3ja62j7MMfTX7V+NcJceB2jsnYTLHyZQabnKhkSZ8U=;
 b=jr9m8qbn5SDggjRo3WRlRRjPpg9rfRrWZu+71PaWoTdoPkpBDnzCp/Oq
 amhbZUab0JzP/xG+/X2LBLmL+Xcky5jdeqaKQ0QsabJ9fH4dQpCu3ByQ9
 ZNkzF5CWjXHGp/1H/adyv4/3A3Je6szB1joXAkmZKZr/Wqy0X0O5iIP7r
 goXyoPTKk/c2Pn0IRR1pW1WoEY1tT6L9vvvUpl2NkCIxtNGMo78pTj9nF
 YXwTOa2Y/yJ/kbekp2Nck2EiwCLnwUgH3y3+EK9DKKwv45kcQYIT2Jg/r
 zpzCVPpgpsCczbGfiEKdGMqspiPp1yQ/XRLaKZlFwvfEl/4E0rd631Ljk g==;
IronPort-SDR: 5SrcbcyGahmRebwPv2CZmm5M4mVfcm6So/7Rcg3LYbO81AXv0NP3MzPPxLUjeDWNZvtnTz4ETS
 0fLASRoeIdr8RqQEZ7rVRJ3ZD+5L71PxSm6PoGHbQR5Yy0ziTBlv3GUA1aM2ffJRzRttuv5IT0
 62yFrUSJE8X/uC4TmLHGrJV/1xH5rxZTa3wAf8+Kk6rJYNs51HX5cNRjvmAFh1UwHJPzw6Bbpt
 tHOkHgTAVM3C3Yj1gIX2aHhWnKE9fCafuvS8UjIa5FtqKxOy9xPH0RHtPqMVZJVpxjRuquCPAZ
 /YQ=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707634"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:32 +0800
IronPort-SDR: RrZoqLS5dfi4g3b/paoQpoqGffwPbQsiMAUd8iUT8vPEdHige6XBYRxV4R8b5iY5Ml8XWMRnoz
 IhniQpwKF2RrE9PEI1rMWgyYMwDmV4o/Iy3hA0nOWU5VxqjnTiFZWvllm2xK3CXgurE6nCQOxA
 2czqfGq5Cth9dw8R8IcysyCoEdScb/UYPmnQlyGyu5Fq9Ozea2/cpn4hUgKixu1ILGj45ZJgO6
 C0EldywmVrh3SSZ1FDaWyel/juz8goIj0y/oc0XWflUvy5jWudXSzLkbLSOn0RVBztG3d1Q6Zn
 oBD/jfIpfxj9TXzcKq6exllU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:40 -0700
IronPort-SDR: vzejUOa1veslcPTweEUDARUnJOVlGLdPLlYxVElZxjpIEg9Fn1UzfLFrg0IO9N9qMgF3SRWPkU
 XgD0/BW8C+CsUTPgPfv++iuHL7/9svIbIcwFNj3znpit9FtRM0Jr/ZeP6O196vY60Tx4bnvnkJ
 d8ARtCtqJBSfBaE8MRLy+C9fiau0ur/gQsz6nBZS6l90oKHHcEqvLVO5ArUaEjLhdy2+I2VNz5
 CG1zXFPm7yS7VyTbaptM3TnWVxQLgG/L239GLuE7B2a2Ic145HTHI92kiVaQmLXd0cCIqx44iN
 cSI=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 05/16] target/riscv: flush TLB pages if PMP permission has been
 changed
Date: Mon, 22 Mar 2021 21:57:45 -0400
Message-Id: <20210323015756.3168650-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Jim Shu <cwshu@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jim Shu <cwshu@andestech.com>

If PMP permission of any address has been changed by updating PMP entry,
flush all TLB pages to prevent from getting old permission.

Signed-off-by: Jim Shu <cwshu@andestech.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1613916082-19528-4-git-send-email-cwshu@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ebd874cde3..cff020122a 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "trace.h"
+#include "exec/exec-all.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
     uint8_t val);
@@ -347,6 +348,9 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
         cfg_val = (val >> 8 * i)  & 0xff;
         pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
+
+    /* If PMP permission of any addr has been changed, flush TLB pages. */
+    tlb_flush(env_cpu(env));
 }
 
 
-- 
2.30.1


