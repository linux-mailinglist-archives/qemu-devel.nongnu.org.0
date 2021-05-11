Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013DF37A56F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:08:39 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQFh-0003yp-SF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXD-0002gw-G8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPX2-0006TG-5h
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728546; x=1652264546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfXgYxiYX5i1x54fnTk0QzFVD6VSA4CU3S+I1f1IWWg=;
 b=cCK6MSIs1Dm2fbs3tVS6tEGWRj6J7NLQEndb9ZsbUxl/WYFs3W09cLFW
 2zsS3+nnotrMsXmTBRmfSVA1UZtQHEnnbiOyJwtRvMrXRFWoy58n4yByP
 deB1ysYtzDovBMeMN78MYGGl5aDh7fkm2zvhU8I+UNXJJm7z8/OEchClL
 edCP+IKNmxd5UKiFMm3ayvY22lCdxITlCvM6xQnLM5DwdMvqJXzPLCrlX
 p+hHyPxyhNpoBXty+w/0oM/yibieVW4+QpUX54IynOFgwQdBafyy6fNIb
 8/K4gMJcrdtAAN8C6/1JY/y40PI01fC3k/MFsfpvHge5ihzNrWkuoT8Vg w==;
IronPort-SDR: CpqrA0gWL6sx7/TW36kPTFZAxwtkdF7xYsW3X7vuKGhPe2ACETOsnj7yaB5OJEpibFtEmARjtV
 1w2wLeZNR4gIVSbb+sJckR5L2FluBy87QnWbRCbdYK7bSRRiFQXeLMVMuP47uZmdYJnNRoKo9k
 1thwIn2BoNiRMuEy8MAcRMXTdEnH8lmkk20dQXwA/HgHWUlIIyDuC+u4m3eW5fajbRBfGHRyQu
 3cGvbK37v4QRviyX5P5pBqn3hB7BwNatAmjgJDxFt9KFzpZJXO9gdt1EJgwOWQ4DbFBk8wHpbV
 R+w=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735470"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:37 +0800
IronPort-SDR: y/pRBR1xwoipKG2Zf0s/unhxdT+wlb6dMH+G3F5v98Jyk/UJjI2BTVpHJPKqGZjWp0qbg6mYBu
 kfJ8+/CExPumdL10ccCxoX3pkcv0R78ZG6ppAhMlRjOWr8rLfmqelPIGtZ6jIGPOnT280F9rwq
 lgL5x+q207xJ6aOR2US0trXn+FP74kSUka4vkwbTRAA7sg0OEL3Ijc4bQ4b3eNVihPbdmEvyDJ
 6QLyu7AMtJjMvUWWB+1BnIV74CbI7od8f/+KyK2lUapWCmP7ttDti6H+mZqwv2LFh9b773u+bR
 cIKvPkR4AG7S27cpLVV5v/Qm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:37 -0700
IronPort-SDR: 4fw3k+Lirku+C/1xsyfww02JxzE71pIgTm+Y1ayxcNcfwl1VFtbyti4n1McbmZzqEa2gn8/ln5
 XZpo2n1zHjNHyQzkRBDN0DQtDkech8W3942NGaqouusGTysm2qgBsYFb2VaS3O1Hj516U3Wsm3
 4PB2058pVTDiH0bAFiUgantN2UrSqW68DQlVR19keZlBCfoGGczcAb8riX19K6j5264+c06LyD
 wKiLAE0ZPmDi6JZh83nxTgRXpm91L5tvfzCHtzuXDk/63rcxIgAliOHzt0KDG4HD7DNUMQaWJq
 Zjg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 29/42] target/riscv: fix exception index on instruction
 access fault
Date: Tue, 11 May 2021 20:19:38 +1000
Message-Id: <20210511101951.165287-30-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emmanuel Blot <emmanuel.blot@sifive.com>

When no MMU is used and the guest code attempts to fetch an instruction
from an invalid memory location, the exception index defaults to a data
load access fault, rather an instruction access fault.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 659ca8a173..1018c0036d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -694,8 +694,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else {
+    } else if (access_type == MMU_DATA_LOAD) {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
     }
 
     env->badaddr = addr;
-- 
2.31.1


