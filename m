Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC13386EE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:21:49 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZB4G-0006BY-34
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41335)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuP-0000ha-S9
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuO-0002q3-04
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:37 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:41520)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuN-0002ZQ-KT
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:35 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id E630E41781;
 Fri,  7 Jun 2019 18:11:28 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 9BEE5240086;
 Fri,  7 Jun 2019 18:11:28 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 18:11:04 +0900
Message-Id: <20190607091116.49044-13-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607091116.49044-1-ysato@users.sourceforge.jp>
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v17 12/24] target/rx: Add RX to SysEmuTarget
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fixes check-qtest-rx: tests/qmp-cmd-test

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 qapi/common.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/common.json b/qapi/common.json
index 99d313ef3b..d0fc931159 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -183,6 +183,7 @@
 #        is true even for "qemu-system-x86_64".
 #
 # ppcemb: dropped in 3.1
+# rx: added in 4.1
 #
 # Since: 3.0
 ##
@@ -190,6 +191,6 @@
   'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
-             'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
+             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
              'x86_64', 'xtensa', 'xtensaeb' ] }
-- 
2.11.0


