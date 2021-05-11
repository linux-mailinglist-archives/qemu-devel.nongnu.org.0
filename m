Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8137A4EC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:49:17 +0200 (CEST)
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPwy-0000LR-M4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWs-00028c-Dn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:18 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWl-0006X1-Lw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728529; x=1652264529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzI8U0Vh2iFMSVxjJhHwv+fox5ZJja+nCtlrHq7wrso=;
 b=kexH6Th3DSsJbGStBiirdBLteZDDBmIAAqsmBsIZcXNebkkYfg/wHQFt
 cfP/4QRDtF47ITvciJ8kqflcQC+AwYHjitQ2gRLzBCjSWIMZW4od++pDk
 mfPZyBAe1AeG/TnpZDjtnFxP/HhYuewnjyGHAXD9WqwDMrJnNgrV+fC8z
 jOD7DT36GOL4r/UcAQBPf0fHp1s7/cE0otUdN8YBPtuwCXAj6oQY59LP2
 CnJuwVwAo/gTB8e1qQQTbjVKDwdvTDZ2lKBW+iNQapNo9IcsXx31MoFjD
 w/EBes8KBl91lXsSbwvc3QcdE6XEvDBim4tJ1m/fAzolRHmnzes+NEF2u Q==;
IronPort-SDR: 6GIBU/gItMgzDDq+JHaM4D97uQ2sy+SsX3F3eqL3LBwx03+FLL3EGqmVnBcynIUOLGfwQoFiI/
 p8G3tolMs41ENviRHtldRCH5ov/II88QZcxMGJBc0PClzfcYBBVnurX805SPHHiFdKxUSZoqsG
 7YOz2QLDUjyH9loxOELCxC9L7hnpWona/Zwq/BZlA4Mdyz4XXY6CotFYwJVOEuzCOJTcDsd8vG
 p5Q3987RLmGTOBGFou88VxWnZZ6gurhB13CSMMKGEvYRq+52UOlX0yUphgSC8ZYwPgUaH41hLw
 mzM=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735451"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:28 +0800
IronPort-SDR: jMAWb8rnr5RV2+PfMY4p853Ss47Qm0Feh5gDBXTflCk6/4VBW6fR/KyxD79SaoDHKqv156OUUK
 8OHOlRlXGFtWkHVGd8FD+P5Aessrrjx81usYHpRtY83Hl+vY8FfPRXFtxMvdD69XB2cgSQH3ZB
 s2IZTim+uy4OCI0VJAxgxjg3gdu04Vye4vck4i49NtkkFFRlHFyLHr9KjlJ2/kaP5VaOa/OOBn
 Zt7+N3MV9k8qo1XcXcCGkhkKIWj9exFk4GMeH6RrHkzQalcQOtS/xnJtSSFd7rT5u1Uk9bCrKh
 NHxEBKH796UUuHuLnzSWjLTY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:27 -0700
IronPort-SDR: fDhiO2DbrHPbSVQ0c3HBZ/JieYu0XzUHQl+XCmve8ZFhsw65G0M3d8G2eJN6Rtm1iCENfa5V5T
 1eSGhnS6BKF2ZynkkUAJYIszs7kDpLA+QXt1hZFezk92DIkAmTNDKWef3uExXHAJsDC6c4V1cd
 fVegSkcVkw2kbFfWqVRpgc/8Yc2fZQBHtxx8RQkgu/e3O4UYgYWvNyrWUz1MhB9SCkuJubrf/Y
 d77Rz6wOWJbJi2AMNlwcd5RHxyUUoxKPWV76q7JC/lf5XywpY36/tDDQf7Jjip+MWgX/m/AEpa
 l/s=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 26/42] target/riscv/pmp: Remove outdated comment
Date: Tue, 11 May 2021 20:19:35 +1000
Message-Id: <20210511101951.165287-27-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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


