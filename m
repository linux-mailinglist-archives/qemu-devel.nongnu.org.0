Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48C6E4D0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 13:12:55 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoQop-0002ca-0X
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 07:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <den@openvz.org>) id 1hoQoc-0002Dh-DZ
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 07:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <den@openvz.org>) id 1hoQoa-0005wt-Ih
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 07:12:42 -0400
Received: from relay.sw.ru ([185.231.240.75]:60560)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <den@openvz.org>) id 1hoQoa-0005uQ-Bb
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 07:12:40 -0400
Received: from [172.16.24.44] (helo=iris.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <den@openvz.org>)
 id 1hoQoT-0004q7-6F; Fri, 19 Jul 2019 14:12:33 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 14:12:22 +0300
Message-Id: <20190719111222.14943-1-den@openvz.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/1] i386: indicate that 'pconfig' feature was
 removed intentionally
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
Cc: "Denis V. Lunev" <den@openvz.org>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pconfig feature was added in 5131dc433df and removed in 712f807e196.
This patch mark this feature as known to QEMU and removed by
intentinally. This follows the convention of 9ccb9784b57 and f1a23522b03
dealing with 'osxsave' and 'ospke'.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
CC: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 88ba4dad47..b801f56354 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1083,7 +1083,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, NULL, NULL,
             NULL, NULL, "md-clear", NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL /* pconfig */, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
-- 
2.17.1


