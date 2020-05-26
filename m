Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E11BF14E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 09:25:09 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU3ZE-0006qd-6P
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 03:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3XY-0004cB-WB
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:23:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3W7-0006YY-PO
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:23:24 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W7-0006Wy-2I; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439117|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.371727-0.00209313-0.62618;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07381; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Subject: [RFC PATCH 7/8] riscv: Add RV64M instructions description
Date: Thu, 30 Apr 2020 15:21:38 +0800
Message-Id: <20200430072139.4602-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com, palmer@dabbelt.com,
 alistair23@gmail.com, alex.bennee@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 riscv64.risu | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/riscv64.risu b/riscv64.risu
index 98141ab..f006dc8 100644
--- a/riscv64.risu
+++ b/riscv64.risu
@@ -139,3 +139,46 @@ SRLW RISCV 0000000 rs2:5 rs1:5 101 rd:5 0011011 \
 
 SRAW RISCV 0100000 rs2:5 rs1:5 101 rd:5 0011011 \
 !constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
+
+@RV64M
+
+MUL RISCV 0000001 rs2:5 rs1:5 000 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+MULH RISCV 0000001 rs2:5 rs1:5 001 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+MULHSU RISCV 0000001 rs2:5 rs1:5 010 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+MULHU RISCV 0000001 rs2:5 rs1:5 011 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+DIV RISCV 0000001 rs2:5 rs1:5 100 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+DIVU RISCV 0000001 rs2:5 rs1:5 101 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+REM RISCV 0000001 rs2:5 rs1:5 110 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+REMU RISCV 0000001 rs2:5 rs1:5 111 rd:5 0110011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+MULW RISCV 0000001 rs2:5 rs1:5 000 rd:5 0111011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+DIVW RISCV 0000001 rs2:5 rs1:5 100 rd:5 0111011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+DIVUW RISCV 0000001 rs2:5 rs1:5 101 rd:5 0111011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+REMW RISCV 0000001 rs2:5 rs1:5 110 rd:5 0111011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+REMUW RISCV 0000001 rs2:5 rs1:5 111 rd:5 0111011 \
+!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 && $rs2 != 2 }
+
+
-- 
2.23.0


