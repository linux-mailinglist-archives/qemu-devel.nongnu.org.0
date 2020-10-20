Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D0288333
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 09:06:47 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQmUI-0005aE-KZ
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 03:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kQmAc-00067B-Ko; Fri, 09 Oct 2020 02:46:27 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38664 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kQmAS-0001KJ-IJ; Fri, 09 Oct 2020 02:46:26 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 75E7FDC111935BA085E0;
 Fri,  9 Oct 2020 14:46:11 +0800 (CST)
Received: from localhost (10.174.186.238) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 14:46:01 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH V2 11/14] avr/: fix some comment spelling errors
Date: Fri, 9 Oct 2020 14:44:46 +0800
Message-ID: <20201009064449.2336-12-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201009064449.2336-1-zhaolichang@huawei.com>
References: <20201009064449.2336-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.238]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:46:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: David
 Edmondson <david.edmondson@oracle.com>, zhaolichang <zhaolichang@huawei.com>,
 qemu-devel@nongnu.org, Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu/target/avr.
I used spellcheck to check the spelling errors and found some errors in the folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
---
 target/avr/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index d96d14372b..9f325bc1d8 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -97,7 +97,7 @@ int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
 
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
-    return addr; /* I assume 1:1 address correspondance */
+    return addr; /* I assume 1:1 address correspondence */
 }
 
 bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -298,7 +298,7 @@ void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
 }
 
 /*
- *  this function implements LD instruction when there is a posibility to read
+ *  this function implements LD instruction when there is a possibility to read
  *  from a CPU register
  */
 target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
@@ -322,7 +322,7 @@ target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
 }
 
 /*
- *  this function implements ST instruction when there is a posibility to write
+ *  this function implements ST instruction when there is a possibility to write
  *  into a CPU register
  */
 void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
-- 
2.26.2.windows.1


