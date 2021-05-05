Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829FE374C1E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:52:58 +0200 (CEST)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRK5-0003Ic-JY
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtO-0001Bj-Ad
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:23 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtL-00010n-SF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257119; x=1651793119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXqWpLcc7+g4pGC4+WkIHTkL2rsoYwibHzP3HV8BwNI=;
 b=D9hL5RHGNb2t8M1CWWZZaUPdo28pxpw6U2AqE7Y0C3duXFTOKU2LlCoc
 0D7RncKzfYwK3f/s2HPySxDFWc0svbiwdiox5yzrTLLt3K4trWntfqOG/
 iXGQM6Y5lMyfFCt70M5XHWlxMT6cAdLTEQ/nloGvcXKOEDdgDNm8pykUx
 vyLLwkIZBbhUfo0cQu4qGfddkOVSXSIbecjEYABy4eln+C05D5qXVPBd7
 Jk6D0c0h1E7Tvo8qpetInpZbW4VLI8w2RECUJ9E4BxyBzATmz+NC8HlKA
 F+h4WTnOWDQQD7DkhRqaO3M+0WnB09QZEnUzER8Gk6wtJdqLRyUP+RB3v Q==;
IronPort-SDR: jjgE9lXsluDjXbdD2AnpVLy5DKeEtu1TCqVQikq/nD/mGbmXdCHOSIFtpsxrsGVNXhjPN2xn6C
 8bhbpOlT7Iqqh3V0U6dkG2B7JX26jmX4irLbdhq2EHVzmpe5qpPTgiyiZFCOl54Lp+Wx6KAjNU
 ib9h5lPCQvBWLnbUAl7TISC9DJiwJI05clov8IKT9dACSngIKKG7QKvqTBp3Z+LMnfFtTnQi0P
 zXPx4i8h1zNiU+qvcBZogSWzVqD4x10yotEXM8/zuRY180FAxea/ETTc/VJoJVVoNkxkqGZ8Zq
 iBk=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586002"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:05 +0800
IronPort-SDR: IMvZ0Ko+yRr0Aq9pzyiB3boms8yarNIbhGmKnL+WGbAxnD2IF/1gfoF7xKZcR7Sq18Qj465ykk
 ZNe/dsWF8l8xL7UV5ryxA3WWOXOuZmZUEpB3WodxKRr4dvD9S6egntRAglcJ+WQ5/dKFhVHWKt
 +ju3dnffhyPWTktg3JIUqt/zjz65TD+XpBnNLAphyyHI3eiG/Jtubv/Zwpg8Fw8wll/Uketjmh
 vzoHfE/O9I2xcr3EeHB9nm4zO8xPYQJkTSXz3A6rfZCwtYTmLiu0ZBNNUqq1lfvxGefGsQ/ybj
 Sy771tPbLuI03gUKhDz+cZNF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:45 -0700
IronPort-SDR: kmmSgbzbjzHgYU9qo2nm6PW94s5ay2rFDL6Bw2xEh4CneoOELi9/jIrbjZnTb9BkOqgHCQhiAS
 fnJPACqvw0r9aDiWzjXe3BWpJlbAOMPeLJtAe9oTyiGRwqcR6G8R2b6/HM99FF7kXAOngUnW35
 3QRdSKLpyOtmVIqsbkqxO3e30MP1eXm7p4jQMX+K4jT40Vs33f0BdhUc4Y33FZlxGpqIjK2qoC
 xZ7fS4u6/ghump2R3sF0/woL6dMHIM+ML0RFYoijqTPpwQxPHp+5j3j97RwyAC4QgNN6erfP2O
 ncc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 32/42] target/riscv: fix a typo with interrupt names
Date: Thu,  6 May 2021 09:23:02 +1000
Message-Id: <20210505232312.4175486-33-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emmanuel Blot <emmanuel.blot@sifive.com>

Interrupt names have been swapped in 205377f8 and do not follow
IRQ_*_EXT definition order.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210421133236.11323-1-emmanuel.blot@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4bf6a00636..04ac03f8c9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,8 +88,8 @@ const char * const riscv_intr_names[] = {
     "vs_timer",
     "m_timer",
     "u_external",
+    "s_external",
     "vs_external",
-    "h_external",
     "m_external",
     "reserved",
     "reserved",
-- 
2.31.1


