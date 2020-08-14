Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D6244A38
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 15:16:24 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6ZZI-0004sq-0j
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 09:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1k6ZXk-0003Zp-19
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 09:14:48 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:44812)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1k6ZXi-0007w5-8C
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 09:14:47 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 3C2E923F16;
 Fri, 14 Aug 2020 22:14:44 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id C90A21C0BE6;
 Fri, 14 Aug 2020 22:14:43 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] include/elf.h: Add EM_RX.
Date: Fri, 14 Aug 2020 22:14:38 +0900
Message-Id: <20200814131438.28406-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.15;
 envelope-from=ysato@users.sourceforge.jp; helo=mail03.asahi-net.or.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 09:14:44
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RX's ELF machine not defined elf.h.
Added it.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/elf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 5b06b55f28..b14ecade48 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -172,6 +172,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_UNICORE32    110     /* UniCore32 */
 
+#define EM_RX           173     /* Renesas RX family */
+
 #define EM_RISCV        243     /* RISC-V */
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
-- 
2.20.1


