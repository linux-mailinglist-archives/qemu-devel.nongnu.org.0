Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60437231F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:41:26 +0200 (CEST)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhFl-0007KY-77
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqm-00060b-L7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqj-0000Fd-TG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080133; x=1651616133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzI8U0Vh2iFMSVxjJhHwv+fox5ZJja+nCtlrHq7wrso=;
 b=rgkW7tyuaMnSL7Da5EZgxZhpb2tBVSv8HGNdm6VISS+Mt9jHdlb77PNh
 OUn11w1DLACEg4JyeGpv1UoRYFbxD4+i4tNZPJh9nMPkXe/rPTzAFj3hE
 5cRhzxTzn8y7LrmwdfgZr4RfF5xGyXfvnkVaDDLUh84Eyy9V3M79yzQM7
 6Mkt6MFNfi0O5dfEKoZALDi9IBS5qHNyJSZc965fGXPbWn+kkhy47p1Vl
 RVtfyUOPgnDG4ScH5n8/5MGgLT4UDa1/eOt0IYivZeYAKVNYLSJ61l7Z3
 lbP+AM6pA+ohxQYUzISS6d/glj4L1AMpQ/Vofqd2emli+rxmLFAaX/ssO w==;
IronPort-SDR: 4eHC8AMnbfLktzBsdzdcnrj0VGh9WucDSNXZs8BWuljTajkQ2fe89Ajc+ysh8cBrGu2hQZc+ea
 VjwwGJEfrku5rSGFjxfzPHIk7c7k80RmmcRUJ6YtcZkvnUD7To3rnL88sbtZ5VmaHrEr6sJ3Gw
 A4TjuIC5nibG/j+3Cwhr1NHGz/tIU1SO3z3tOT1O8+J47avaEujsYao5DZ43sowVTzsC9z/BoS
 kpPIT5UEdVO8G8uoQ06IQzLJUHTGhAC6H3tXBYsX4MZcQCON/zuiqtzECz5vdXOQ+aVW3bYyXF
 vP8=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114685"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:07 +0800
IronPort-SDR: q1PyHuIiYevkfjogs7Ud7WSaPSjY59Ic1kMkO52D/Z3Ad/Cl82AZVXTxkykppEjEUwL91ZjIIf
 2u+zNijz9Mlu8g8dCNXlXY3PiB/nN5VyGlL78Kfu8FuP0O4rovpGSgpmqGn7orWGXb943O+25O
 aHtWPDGRYeQHbdgromELRPANpwSxqh4zlxPAGsSymUDh6B8mpt9mBldYPHH6nq5MLZsfZ6RzUL
 pipiU7XeSPYrrTKeZjFqqCvtlZZHZY7+Ot/HstqrZMIP3PJN65nFCsxEAD6rY6YNaU7a5Copss
 FkHK9KpgHwUo4pG69EGWFCNG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:18 -0700
IronPort-SDR: AvQxDfzPXgt9yNVjEicNI3A2GrHXkHZXGbPO94mUlYEYiRzOQc5jVi4FrxGklE9tnt/KDpNMys
 LqKHpVX/GDLfa5q2MTLOJYr9qTrtehFhX1Fo+VGvtJuqEhNAmTQmHYWpXdwfG7rnNfYy5SsCGD
 k/LlhBs2o2vGgxt0uhpuREowM8C2gSpyRWUUiBEdJCX0hRlHBLi0FaM1q12cRxO3i7ytzFBYU1
 a1eUTeaGEpqlbOoV6+Q0rAp+tCbLzjjHARcMrU38sRi+nq/ThWv2DGzOY6417F7/NMKFAKT6Mr
 QRY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 26/42] target/riscv/pmp: Remove outdated comment
Date: Tue,  4 May 2021 08:13:11 +1000
Message-Id: <20210503221327.3068768-27-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 10387eec21d2f17c499a78fdba85280cab4dd27f.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/pmp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e1f5776316..78203291de 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -19,10 +19,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * PMP (Physical Memory Protection) is as-of-yet unused and needs testing.
- */
-
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-- 
2.31.1


