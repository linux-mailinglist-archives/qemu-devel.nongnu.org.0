Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346DA505D9D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 19:44:15 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngVQ6-0007BE-AL
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 13:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLk-0004wr-1h
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:44 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:41359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1ngVLi-0006cK-IF
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 13:39:43 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1ngVLg-000364-0T; Mon, 18 Apr 2022 18:39:40 +0100
From: Paul Brook <paul@nowt.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] Enable all x86-64 cpu features in user mode
Date: Mon, 18 Apr 2022 18:39:03 +0100
Message-Id: <20220418173904.3746036-4-paul@nowt.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have any migration concerns for usermode emulation, so we may
as well enable all available CPU features by default.

Signed-off-by: Paul Brook <paul@nowt.org>
---
 linux-user/x86_64/target_elf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
index 7b76a90de8..3f628f8d66 100644
--- a/linux-user/x86_64/target_elf.h
+++ b/linux-user/x86_64/target_elf.h
@@ -9,6 +9,6 @@
 #define X86_64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "qemu64";
+    return "max";
 }
 #endif
-- 
2.35.2


