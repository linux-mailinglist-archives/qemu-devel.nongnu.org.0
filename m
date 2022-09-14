Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746325B821A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:39:17 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMzL-0005uk-U6
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1oYMut-00023D-50
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:34:42 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:50874)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>) id 1oYMup-0005sv-BJ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:34:38 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.89])
 by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb632183fcce2-4723d;
 Wed, 14 Sep 2022 15:34:20 +0800 (CST)
X-RM-TRANSID: 2eeb632183fcce2-4723d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.100])
 by rmsmtp-syy-appsvrnew05-12026 (RichMail) with SMTP id 2efa632183f68e7-7371b; 
 Wed, 14 Sep 2022 15:34:20 +0800 (CST)
X-RM-TRANSID: 2efa632183f68e7-7371b
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org,
	jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [PATCH] bochs-display: Modify mismatched return value
Date: Wed, 14 Sep 2022 15:34:13 +0800
Message-Id: <20220914073413.5059-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=221.176.66.81;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta3.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify the return value of unsigned int to 0.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 hw/display/bochs-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8ed734b195..3bd22b4ea7 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -83,7 +83,7 @@ static uint64_t bochs_display_vbe_read(void *ptr, hwaddr addr,
     }
 
     if (index >= ARRAY_SIZE(s->vbe_regs)) {
-        return -1;
+        return 0;
     }
     return s->vbe_regs[index];
 }
-- 
2.18.4




