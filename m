Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CB372337
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:49:53 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhNw-0000An-Ok
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrG-0006ng-3w
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrB-0000ID-DV
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080161; x=1651616161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXqWpLcc7+g4pGC4+WkIHTkL2rsoYwibHzP3HV8BwNI=;
 b=PmMxyIcts5FUlCGR3luS0M225ofFJLsDjYzAZBLa5HTBadmlqt7SZk5g
 ewp1ouJYw9LxntjxFkcsHtklBG0LMn4RCnVtloSrl1asy5nyAde2nKj3F
 TJQ/efeVDhd8xJAM+5RxmYePohKN0FR04/KvnlrQQLOq1P3LaH2utst8g
 Fj0AoAmevSEXCufM+F8kLNKUsyi+uLPBn5s4il1lPqzj0hqvCEKoXx/Fe
 6ywuBsyC4CxB7Q72TIi8K9+Ec2Uj6agc9fl6k4wP4b8TwgVllO46qIQW6
 WyvMgVGmt6Haejn/Ht8WcF7v/2zekIAgRi1nhFD17mH8N8WhwLapVTVX2 Q==;
IronPort-SDR: jWS0xlC19R4oa4bACbqlK/zubcedTyH40E3MOR1wsPub3J26q9yecik6+YOH5z1Urb6Z8pQCur
 gTQ6mmkW/UjLH/p6hIEDijbEN+RWTAD+x2a/jzux6+4H7mZKIlsA/N8nMRGOW3A9SgCuOCAL0V
 xYRTKoVPlqZmHE69+o6eS3/i9RvNSHws2oCJbNY/5ULcP+L2PwfdkKWAvuS7INzx1676fwiSyy
 oxRIs2IFWmVj+YDcMT9AzWrHdp7UtRF2qWDQgJEXpxn4P5WJijxYQZEAdApb8WzQNh5t22X2Ac
 XDY=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114694"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:25 +0800
IronPort-SDR: jKCqtsH4pVwRExoe5t7L33Bc4wNCDwOU5kqGCBIkFL8kBJkX/tIMwgZO786Msy6pcTZy1H743h
 5u0d8IjAfbCDypTj8x3e6ZDaNiNtF5HIZIWZeH3cLf3bRz8zglu/QjVOl+sNaxjfzqvmFTvfez
 4k9aW2tlhrptwHO4dKwVzWs9G0seY2CXoljKGb9nZe+bBOKDlNNdrgQLTJmx4vlhpYz1bxs+1v
 pOdRnc92toE2GXuCUqALtQf9h/YdQmaId9RNm13bZN4YIzWgBXGx363KsrYDqyCl+ApDSubCUs
 mOAJmu5z80edeZx+J2XA8b8X
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:36 -0700
IronPort-SDR: YGR8ZbEHMoOdNNK2zjJtAWKW3Z36mVWa2kzQHTNU2I16Up3cq1YlFnKAvmx3qm9Sgi/owxBGwf
 PJqsmr8pdNsHRnGeEGIFOPCAd88mvzK20QgOy06BQsXhMGaDvTl9wEGqyLMbeE4zcernd6HT7u
 XSyk/VAOg9TEJacWXdvd8wQ2VrZHpVDIgWKzRLopF89thuOCk8sLaPAPFWtzexxSsV+GfJ2o2Y
 KOUzLqkfEVprmRrDyr7Rj3mRH96XN4q+NAqAhq8OcBKHRDqycacOegTSLtVpJc+33FY9JBpHxA
 4Jw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 32/42] target/riscv: fix a typo with interrupt names
Date: Tue,  4 May 2021 08:13:17 +1000
Message-Id: <20210503221327.3068768-33-alistair.francis@wdc.com>
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


