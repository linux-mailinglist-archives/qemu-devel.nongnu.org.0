Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C23722F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:24:34 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgzR-0005FL-Qp
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpb-0004m6-0X
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpX-0000ID-AO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080059; x=1651616059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxuh/HYpFG5/VX0DQF6fAKC2S1UYsYT0FobkIKhBegY=;
 b=N2DWpgCeHS+fcemQIymrULC8qSh/Vi7uf439WFWn39QclOCixtdGPa3D
 TsI8NG8K9UKg5y4hVfkrlPJfC5PXhh+/5YOvvFaj4HSgsf6eFTfNZmZOr
 nsF9NcLzim8zbrAtkZ3+H04WMTA0No1bL9Ohn+QbCisAQlaq4uvOh+Vt2
 JR+zDPFx7HXbs1/OOWqlPACAOP14fG736+jLyOFYFzbvdCYL1GIB/qoWT
 1Wn9pC1jRbVk4FIhzDLHbKyKHixHeWdrGR1R67jbfJakQh8WQsAGjAAXn
 rs2BshuSrAo0Y+J0eXIuVWpy+NvJYYSp5ZeERaic3wMuE7c1DSREhCeNt g==;
IronPort-SDR: fAn0CF7Vz/+rGs0Fk7mEmzEgU4Ox4yTrq8dh7+NVdCchoqj8llKHGV5q53FavB5iV6JedOmQ+F
 mrPTCcSx9cpZh3w9f1k09MuQwR6m541Z3D98ygEbQ3E7z2hx7aDMSU0wZVS8LiRLWcpwKk0PcW
 we1cQQbkh076JtZFZk0aHBgjkNH7UUPjIOtvUmnl4gn9c/AebmT0EhyNhN0dla7MMoEPmifPn7
 /rO+PkQpponw3ehaC/O68CcIQKDbFQZ++4WldUESsHwMpZK4LvYtHKPqNDUOC8FO9Lzj8kFLP9
 ht8=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114629"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:16 +0800
IronPort-SDR: 55sIhcaEgQOgC3dYsuLHQRWg+9Qv1sgOF24tfd+jjc5iJFVj+OoJoXzdI7Bpzro9z7+gjNgkJd
 HBppLD0An/vcg5e3SsOrTb4fRZHzgPUV/whdwuSVh5wxPftv/t53IqJPdjNICawgb35NzTIS5J
 ORgpkLh7SYnwBINceI5gcwHNFy/qINSwX1N7YERfJ3OnoZSjN3FDewGQIzG7/szi10XYhLq7s6
 hmsP0E0lZBrG4KH/vMaUPWugs5GQCT5T9zGJ+VhDMvwg7+Fvfui/srSsQU0zER8icFR5EvRVXX
 7oVM4QpvHHJOcE5Tfgx85HD+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:27 -0700
IronPort-SDR: 35d1IpJM2fJidJrpQ4HfVOX/dOaKVS1Wqz+aRhvKhwbxmcLRXXXk6M78ATtw+E3pRxmA6a0bm/
 ItKz8i52EruWZFtkxY++Xx2UZnhaWmKJxI1Ii+94GNUNE4In88w3yj7gq8VQora2oI7XEoPIqi
 OnTa24LXn8fikK7sfiMn5+6oEDs8GQ2Z05yQJPePPz5JPj3kn3L2qhIkp9qxV035zN6YO0hcal
 Twwg428od6jv7qcMWFMwSlnIiiSNg0M1c+dkSB/bTliD78GlGYLhL/yjJEK9v79NutxVllDi0L
 4aU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 11/42] target/riscv: Fix 32-bit HS mode access permissions
Date: Tue,  4 May 2021 08:12:56 +1000
Message-Id: <20210503221327.3068768-12-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/csr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1938bdca7d..6a39c4aa96 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,11 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return RISCV_EXCP_NONE;
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
     }
 
     return hmode(env, csrno);
-- 
2.31.1


