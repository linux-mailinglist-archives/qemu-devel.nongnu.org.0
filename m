Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74343722EE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:24:30 +0200 (CEST)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgzN-0004zM-75
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpE-0004Wm-1s
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgp6-0008VN-Go
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080032; x=1651616032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4yEU+4TjBk6Oe2/N0wvc5JGnBHXRW0rnny396yYmb0=;
 b=Bj2+0KgJHK2PiH5AfAdaLG5m3ftFcBsOAWHj7pi4bw0wYxS+Qj7tQi3m
 ROz7MouNR0SswfjMhd/LUtLZ93/CfRbsT4CFgAmWJ+4ah2erjyKIf4Vgl
 Yw7GM+KQ/p/zH1hXOTgu6ALaN04yCyUr+jmBjOHXJZHp7EORGMXEGpkTN
 3O4hu6H5TClrSyw0Lg+y8LbXDGur7vjT9vigw8+fkdylI60PWnMFN5PXD
 V5cNbj6AXf5SRyDpqdiwZ5r+xJvVIrcp9E2xCvq3z8LNPueXgtwTcB6JT
 IqLM/6MFCPFeNk9Qj84I4wCrffya6CYQqc9mMsb4rjFpfdX8LOJJUSdaV w==;
IronPort-SDR: TS+wAi3yjdCp/hiNDKBUJrQZbdUoUkJjEjYJldRgcVLFNgG0auJxrXdEEkuV+xfW4zMn6sSD1W
 WSk0z+Cuzd481wLWiJ716Mx8Vag+s2YCRMpyWozhiq+06A0bQQf6gYgNhdskGaoKW0qNCGlYQ1
 ZXT6r5WGs9AbHj5U1ns5cMfeJC71IPlQt0eqCklq0pnW3Ryhj6YaTD7F7SQMHNTf96t1Vk5IqW
 3k6mkXgmi9xTO3S3gWP84Sd9oz8Xd8K982sg7X/Yp5lBOQKy7v7bZQfZ4JgEccJuHL4UW7H6we
 8zg=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114594"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:50 +0800
IronPort-SDR: epvFJpRm4SSIKR2IkZfdzz7MwCkI10IW38OUOShkEDGNx3wUJ0p3S0brhV+Pa2vLo0Kv1bJWz6
 55AGhBFmeq5cTaLed5mHzfT0AA+szFNxTuqQtgFKBtzTP5IweZCDRPRGuQ1MdQqXGAZ/NkqOV+
 2sN3/BdJbyLfD3ju9q/A27xSFgeSHVuuOkQFnp3J5LPXBDfLQVDNatLIBczts5RhxbFh9v8N2U
 Xb8K2zINZrizJBnjw1+LYFAIwdFLb9TftOrcDDmQ7QGp1HAgp+lIc/aLxQwX5XNfVL4+GwXQNx
 KZjM+CpzaFq44IH0GTTagS8J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:01 -0700
IronPort-SDR: vi0/ThWEUi7PeNH3O0L+tMlDads4jPGwy/U2Q9MRRhw/b4cT2p2cTHWcIBclJtUBe4JgDqb13a
 ijAuHYj9A65zBsFcwoC4EaNsak+vL1Wx7r292sHUF2BSDQyP3tkOWmJ0n/u/bRGH7B7pYeiZFq
 JQ/RKra6Vjdn0Hw3Ty9EYgwKOkVQoxfauoMf8HSo0jcYNDakSRV4hi9adb4MjtTwhZdJk80A4D
 nR5mszZyy7Y/NCWBbyTKbrF7cuqL3Vf6eqtkQNQ7Xv21jUfqM6ltHIUJIuP453dDFi7pYSyvHt
 qQk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:47 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 03/42] target/riscv: Align the data type of reset vector address
Date: Tue,  4 May 2021 08:12:48 +1000
Message-Id: <20210503221327.3068768-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: Dylan Jhong <dylan@andestech.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dylan Jhong <dylan@andestech.com>

Use target_ulong to instead of uint64_t on reset vector address
to adapt on both 32/64 machine.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210329034801.22667-1-dylan@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86e7dbeb20..047d6344fe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
-static void set_resetvec(CPURISCVState *env, int resetvec)
+static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
     env->resetvec = resetvec;
-- 
2.31.1


