Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED282674526
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcgg-000314-OX; Thu, 19 Jan 2023 16:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIcgY-00030H-1X
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:43:03 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pIcgT-0002o2-T9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:43:01 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7BA52746E06;
 Thu, 19 Jan 2023 22:40:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 600FB74645F; Thu, 19 Jan 2023 22:40:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/2] log: remove unneeded new line
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Message-Id: <20230119214033.600FB74645F@zero.eik.bme.hu>
Date: Thu, 19 Jan 2023 22:40:33 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The help text of the -d plugin option has a new line at the end which
is not needed as one is added automatically. Fixing it removes the
unexpected empty line in -d help output.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 util/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/log.c b/util/log.c
index a3c097f320..3fe74481da 100644
--- a/util/log.c
+++ b/util/log.c
@@ -489,7 +489,7 @@ const QEMULogItem qemu_log_items[] = {
       "do not chain compiled TBs so that \"exec\" and \"cpu\" show\n"
       "complete traces" },
 #ifdef CONFIG_PLUGIN
-    { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins\n"},
+    { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins"},
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
-- 
2.30.6


