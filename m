Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D1374C11
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:43:51 +0200 (CEST)
Received: from localhost ([::1]:50192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRBG-0000z6-36
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtB-00015B-6C
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQt9-00010n-2v
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257107; x=1651793107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfXgYxiYX5i1x54fnTk0QzFVD6VSA4CU3S+I1f1IWWg=;
 b=duyOoUQNUQAfhe01K/8OkMwNNPeauNc8D+woGRYXQd9LgUrisrrm0Tvf
 qTuEv17JkSZxJou7OoLO4oBV5kn9L4u2DazlGeZh9Zgr6kvu1AUxqWxFO
 BpIKCPpEinO3IaE1QbkjTkR7lHw3i0gaaUcodG0aAQ1vgARbCnrLYLcTp
 POYnG0Sl9bF8W1+z7L/qqHwRVHWRafwHyjjJ/Q9V+639cC6xBOMAQKeY2
 Su8rMVIdLlTfHyqHFn3rpjunsLnLixuQUCO6uZm4YtXNJ3um9UgFt0IPx
 u/R/RTEk4/7C18tMwDxob64D45LLs3PZzn2UmYvTHsitgT5PLKXg8PfBG Q==;
IronPort-SDR: Ts7W5IRW2rTGCe7fLlqGdVe+GNipfP719xY+Ob9Ho5ID4guYdVN0INVHDxl/q2Cz3e4iIFvLG4
 fiFF6kEWXNqSB8jkbzoaMCkjNagNMn2BLuUlVBmIg2+DXvD9aayIQOtab4fzyKvjLeiWW9T09G
 mKhcvwVxH1XTh6056iLQGG9S9hF9h6nuj4HpPeyseNYOkeLc/IGd4IjBssfosczapq4/an31VH
 XCjXhf9SmJpKx49hy0Gmbrg1kjqem43ahBoGkX4rXRSyvoPo7Dv5uwyVGQBjq0dc+zuwj4nSyy
 YYI=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585982"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:55 +0800
IronPort-SDR: LcRiQY0YoHClsARtVKdzsJvQ/t3OWNUlUfwTviQWLkAccc6cp2lcWBkkK6pWPxMEDwTuPu5r/+
 BJLe1de3981FvbZlINllTKbGL3pQSxhht1OoouDsjbRjhD9mmYRWG79u0MyYHIxlVQFYFk69iG
 QwQnzQ/E+S0fhuHZrzNh+saykwfvtgRGr/7fRwlOLmqENzWXfOjZXpZMH6vD4m07JRvkrL0Vwy
 POSjCDhl7gGpQ0B6Zu1DKqol7pvFWacsaGGpzBAPp1eoCwWV99scZsVgkCcWO7oc3WNWM5ti3/
 TzJhjl0zMxFhqRdQa4GUUt2s
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:36 -0700
IronPort-SDR: kx0m6hjVDrzQH7FzLfJKfAOZuYhmm8YvVW9THIksD7dv/uXR/X/TIptzLA6sp+emfcgPutrKdf
 tbwdPX7wU1l/9Vql4Prxr662IsKiX811UxDGT5bo0aHbPpa9f9Bd24aCRsdwDv6Is9Q7wfbGBd
 xDQkA+kDuh/Y/KYIZfZYHIxAlkocbW+66OVq/K8ThjJROKwp4p2nSu94GFrk3eCOUYkGgkspJh
 iOsd2j1fs/W9jdCkJlQhxGteluSLupmk3RUmUw/afJxbhLjl+cy5hl5jm6wxH1oMbubrzsgWGX
 yo0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 29/42] target/riscv: fix exception index on instruction
 access fault
Date: Thu,  6 May 2021 09:22:59 +1000
Message-Id: <20210505232312.4175486-30-alistair.francis@wdc.com>
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


