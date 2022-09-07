Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972C5AFFCF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:03:12 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqxj-0007eE-FM
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4k-0004tA-9r
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4i-0004pz-DT
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537978; x=1694073978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSr+YHyIVKvP8jHZ/SjKwAKVaWBq3kM8FAL+odTZYwA=;
 b=pZseEzzB7f2vI6xaPzHC7ELKhrFkif+Psr1Hb5IfDYTC3+gejNz/Imsf
 l6IFuOuL5iSJ8/OGSWHtvw2NLWeRapD8/UK3pn/azTlQmVOOR0XLb7BPP
 YVyeo/alxY6MJilEvufkikZJZGpELG7D5krksLJm+ZmzgvTeyh/hqw/Ow
 fFHRDGIvd4iCWwxYav51Ak366W7XRc4r+83wEjmWAhQGRZO3RthJrPiy2
 afuCXLTCQVriO3taSkhCULxdJRSixSfPpsVSv4FxTKLZGS9aqk3NXOsZK
 BGBa7rz8xS8Gr5nObtntb7FGe2YDssqeYI1H/ycwvLXiz8hH/5aVmmgeL w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715082"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:09 +0800
IronPort-SDR: T5RhsIo+XWBPXW9cH3mVzerV5DzVjwKHrKX8qzPDg8cLuI4rlwQMiGf2/EPsOcN0RJd8FbsKi7
 GVa0Y49aUlRIsHk0/YmnF3wRPQydwb18i3f7zpZuyMTERDm8tOL//ky+VQjWDjukovNqRA7fbh
 yhZ7NMasyjth6NYE986532ceDSv6Qks24R32W23BPsiNPOkDN36T0SiZOZbu6d2skGNrv56pTA
 vir/MCXTeYgsHoTNdiReS88+Nk7/TW8QnwiP0iqt0jkt5x80PPwq7mQNbIRftOzKuRtBQDEOdU
 R7pnSzcDwUGZCXUUlWcwjody
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:07 -0700
IronPort-SDR: 66iCdUAaJ6EQ+xKy8/DegVMg/Rqq8dwyS1varCAxiS9WXzv7OkEJ3KNsqvtLGKnErgg0SU5j+K
 G+mbwAjfDZ8oLz8de35NJNKq7YZtNl1NNU5XAp3Ferw4tvihA8HYKmpzAwwDq3TOyk0xy8RBjL
 afgYFVIZOtgSuDL7UDrzNBowHVqf7bdSljIubHFyp3Ic6p9UiysW+3k+nyH7+Y0HmCImcFMmJl
 WqItsK+AzsgSgF0jfTAC5qgs+VNpbiklqWtSwyXN5zu4f8cUJdHZpBwsY386GS8n5/QXfB4V2m
 e1A=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:09 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/44] target/riscv: Remove additional priv version check for
 mcountinhibit
Date: Wed,  7 Sep 2022 10:03:39 +0200
Message-Id: <20220907080353.111926-31-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Atish Patra <atishp@rivosinc.com>

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220816232321.558250-7-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d81f466c80..4a7078f7d1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1494,10 +1494,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1508,10 +1504,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.37.2


