Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060409B73D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:44:50 +0200 (CEST)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1FUO-0002lq-NQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1FPy-0007zX-Ad
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1FPw-0002Vx-PW
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:40:14 -0400
Received: from nsstlmta35p.bpe.bigpond.com ([203.38.21.35]:42607)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1i1FPw-0002NQ-54
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 15:40:12 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep35p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823194007.PTP29150.nsstlfep35p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 05:40:07 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedgudefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeophgsohhniihinhhisehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeorhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeorhhthhesthifihguughlvgdrnhgvtheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D2D11750F5B9ADB; Sat, 24 Aug 2019 05:40:07 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 05:42:46 +1000
Message-Id: <938f9e43e999a4596eabf744cb4439c51ba84628.1566588034.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566588033.git.tony.nguyen@bt.com>
References: <cover.1566588033.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.35
Subject: [Qemu-devel]  [PATCH 7/9] exec: Delete device_endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

device_endian has been made redundant by MemOp.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 01a29ba571..7eeb78c48b 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -18,14 +18,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);
 
 #include "exec/memop.h"
 
-enum device_endian {
-#ifdef NEED_CPU_H
-    DEVICE_NATIVE_ENDIAN = MO_TE,
-#endif
-    DEVICE_BIG_ENDIAN = MO_BE,
-    DEVICE_LITTLE_ENDIAN = MO_LE,
-};
-
 #if defined(HOST_WORDS_BIGENDIAN)
 #define DEVICE_HOST_ENDIAN MO_BE
 #else
-- 
2.23.0


