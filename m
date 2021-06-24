Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB83B2E92
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:06:41 +0200 (CEST)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO80-0003uh-SR
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3w-0003YP-4f
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3t-0003oZ-Ip
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536145; x=1656072145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ITFr8OeVAPrRxzJtiBdw3XbLzbr/OQpRi3PhUKINCQY=;
 b=fZLIsI9NEGTDNfBHdXNDa3ekvevG37yiS0TazZMZ9p3fMWSINZJDOvz/
 7kkrczHnFVhUKXjnymtVFBMF6RPHRRtTYTIdsGyFXfHWITEb5MV/9/cgL
 MyBlbWiZBnZG0Anx1CY4Euq//OrQGjVRhzJsTUW0sRb2kvdThOdAY6Pxp
 JHEUl61SlyJ3+HAr544KkWf1+5xXi7vXWuCLU84arCnD+4cEZOK+egNSm
 mnqrZhp/K1/ARcsTshbVL7TSdxnBGWJgwQfrLgwWrV6NCe6fRLJG1iDZY
 PkuuN6kUx/YU/SHFAbvlKPKeNSmnf81dlKvotn2TTqcTUE0JRSAeLMTpk w==;
IronPort-SDR: H2CYvhD/q6780uLun62Kh+Bl5biaLmxdrq/9KfTOEMILSBj4MBBTLj3Jt6vbKtASiZ1R96SwGo
 yZyR7Dd1s6/D1ZDHPmHJ3EV1d1QOp6YbKYuI4CBqTl/gFLSsgDW33ycX0xD9En+THls6vXUMXC
 vainkrP9jsubscbRlnol13CQ41D0c6GvBSd+R37CHIYX5blkY703ZH+B0iBK4aIyB3Mq98+Qi5
 ywgryEvKR6Y52L0E1KwD1h/x8P3jzzXCUrTMpe07DwSog0Q93aQyDfjn0vNfnXSVlSnfY1a24V
 nos=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360799"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: bDkw4B/eTM68nR1ORJKqnby0ACLHx9gR/45tqW0ufi5XsnpQX60z7T3XP+xRf2HSS9br8YfhUe
 628NFF6bE+W0xvaMB34Y/0fSs2IFFJT/LHFujj0TUM0uzWqTgI0BX+HZMJ9jsiqiUVL/1S+Yer
 a4MVfCCO3hKMjziZCPENHDSrm/8DYOMSElrETlux84E0pZ9wnhvEmEr4LJJxA+pv80mV0xKty0
 W2NUvvlX6oLteucT/Tjg3/rm2yhKbo7yjkyKDmqDILjZ26uUUpaxraOarN7P5Zkj1gFmvtknsJ
 UAV5ncj8k+Crf/JaadJ+tGtL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:30 -0700
IronPort-SDR: 2D0Bdf+WD0fnIVqiudrwadVCyiGXtJl7ihAiq1wGXC2rhTSPga3h1Gl+61fTdkumxthYknb4uJ
 2fzZECaPt8Oh8YaQR7fRsQhCxjSxUnacjNgtT2DgfoGwBo7kS9AF2oJ9577jXEBLbWKe2PcFGw
 VLb/YjnKEY4pqZqmdgbjCCPGR+rX+3baoNGz9hpO/DceZAHhqbCSJTKFN5xkemcr4uB7jwLBIc
 fdJeLRBX/VQaGYFFvgEcg/ggfzBw0IldryHbbihRBLMYfRpOPONQIGvZm/YGiDO0lRDs1e8Vxh
 xd4=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/7] target/riscv: Use target_ulong for the DisasContext misa
Date: Thu, 24 Jun 2021 05:02:05 -0700
Message-Id: <20210624120211.85499-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The is_32bit() check in translate.c expects a 64-bit guest to have a
64-bit misa value otherwise the macro check won't work. This patches
fixes that and fixes a Coverity issue at the same time.

Fixes: CID 1453107
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c6e8739614..62a7d7e4c7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -47,7 +47,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     uint32_t opcode;
     uint32_t mstatus_fs;
-    uint32_t misa;
+    target_ulong misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
-- 
2.31.1


