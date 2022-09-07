Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA15AFFB4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:56:11 +0200 (CEST)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqqw-0001QB-58
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4Q-0004pg-75
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:06 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4A-0004UV-LM
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537945; x=1694073945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mngEkgL/b5xuxkz3uvEhfV3quU40VlHdiVXInT9owhA=;
 b=bkJ+8qYvUgYjxDrldA5ekF0QcbihXefjJqX6oX7BqMGJlhtUpJWPJWau
 yxc9DQV9XgOdgkGifL/NK6CQE7/ga/OUdWBz2/bG4MemQQwhuNCYc68Lu
 t1oW0GS90xjJUjIjJHXgxfthxnLvbOoLfOQlp4txoU1Ysv79qrmWSgLQY
 9vdAu8YmhDwg3CjZA/Cpxs4vLn4FAHEOVX0Q3nV8ijBQqiW97rmJrEwWV
 JD/mwUaMIgptmVx5YKb9IQBb0kJ6Ui+XsP1MqU8Ty04ZiAqIE3LmptxTU
 iXdSa2EqHiZFWrmkl1tQXiPndym+GleLDFHqCHVXZiLx4bwidBRybNjHG Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715042"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:58 +0800
IronPort-SDR: 7cRokY/yuAP1rD1xkbeoaHtVqQd85EZZ69/YDLLEf+WWvWIH7ilw05Ec2BgnLO93EnkQ4Lq7oa
 3vVVJJF1+YfpVsZeeE4tJ5k0hTNYm04wvhxFMq8zKSqpUz/81TSueogwFynG8z8JLKlBUet4K5
 mHoWa9oR4HOz3BqaofZ0DMxvXO38oRDpXkN6LJ3E+eLs7b0YFVdr2NJZpL845fJR+pQFKRJzym
 QOR0gnfZv7pCZE4L6Fzh8UQ5Fe+2qAW46gSrRHCZdlTs33fBqykV/Ex+CrIw/6jFkknDZcn0SL
 kHKQohenbNvfCuKPiF1Q1Frj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:56 -0700
IronPort-SDR: Sz78yx/KbGhQksda1nSDkrk0WBKsubrcthkHRcUfazY0TQZR6/UY19c/ZNd1ExNd709GinM4fi
 e73UhwJm3+f62uNBU/IIDCcdZH3AEgVXarcICdwtlSIXdrnrBRr7eoRnFdbYFL8+J70iZgx/T7
 u4QafiGEaUu8sAZGmRjPcLa5voijDHDW00KkUeC0E1co/C6vr4blWvP+r5mPzRwae8vtsoioTI
 +Eslt3BFO3bSqHh13MIhzC50fEhTeaFFQXQSUfXPO1w40wOhebfIgQCoDOZIYraihSspd7GxvZ
 neU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:58 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, eopXD <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/44] target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable
 optional mask agnostic behavior
Date: Wed,  7 Sep 2022 10:03:33 +0200
Message-Id: <20220907080353.111926-25-alistair.francis@wdc.com>
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

From: eopXD <eop.chen@sifive.com>

According to v-spec, mask agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of mask policies, QEMU should be able to simulate the mask
agnostic behavior as "set mask elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between mask policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This commit adds option 'rvv_ma_all_1s' is added to enable the
behavior, it is default as disabled.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165570784143.17634.35095816584573691-10@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 117d308ae5..966e5f2dd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1061,6 +1061,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
 
     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
+    DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.37.2


