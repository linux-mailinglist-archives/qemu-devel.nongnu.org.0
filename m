Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF89D2B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIYPC-0006Dw-Ki
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 09:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <77389867@qq.com>) id 1iIXOQ-0002mZ-NT
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <77389867@qq.com>) id 1iIXOI-0004eW-Re
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:17:59 -0400
Received: from smtpbg520.qq.com ([203.205.250.49]:44116 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <77389867@qq.com>) id 1iIXOG-0004bv-Jw
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1570709866; bh=UmFuA8CwFtIXYdMSOvix4lQQaA4EJj4v/H8X4PdRHrY=;
 h=From:To:Subject:Date:Message-Id;
 b=cfAwwyPZ5xyD5OfDGBk21RmTE8m5QmR9MOshE7nZdrtsn9+B1RC4sv6etbcpa1+CZ
 KZwaZVjY28gGwc4OiZ56tzfRjJwKCcIyPDw7U/9uorBHviD3q3f7WJd93lLoo6bjW1
 E4LLn3q9dqJqeR+MzkZd6dGrdFeehYtNqaANH8pc=
X-QQ-mid: esmtp6t1570709864t2dqpp8gv
Received: from localhost.localdomain (unknown [106.11.34.9])
 by esmtp4.qq.com (ESMTP) with 
 id ; Thu, 10 Oct 2019 20:17:04 +0800 (CST)
X-QQ-SSF: C1000000000000B0S9101400000000Z
X-QQ-FEAT: 8J5uQ3aAL2Gs+OgdMksO5mxvlczfyYDbA9zP9XXv3e9lmy8ZuJ1RiY+Fg0EbR
 PG1jEJ8zeYpsmWtPCPgUdkn0MHJl7FGWV6L0XX5Mr1DZOCnAyDyRsBDrSHHJBIp43RUyoWH
 BTBKWSOCtnh7d1gLvr88k4laJIGlJOXjBLJrje4fTgzu1o4VEt0OpAGZKizaqSD1XO19XWB
 OYg0Et1ZfB7tzhw5eizcRYuM9C6ELRIuDUOoap5XqyK/dAsleKaYKpBg0qyxG9zcA22Yu6I
 XFHaO/cFYjyupbtnDWuhFEg8sJNQeaCc3tjmXJ4IuxM5eE
X-QQ-GoodBg: 0
From: Tianjia Zhang <77389867@qq.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: fix counting typo error
Date: Thu, 10 Oct 2019 20:17:02 +0800
Message-Id: <20191010121702.90142-1-77389867@qq.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgweb:bgweb5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 203.205.250.49
X-Mailman-Approved-At: Thu, 10 Oct 2019 09:17:54 -0400
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
Cc: Tianjia Zhang <77389867@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of global variables, local variables should be incrementing,
This is a typo fix.

Signed-off-by: Tianjia Zhang <77389867@qq.com>
---
 tests/test-rcu-list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-rcu-list.c b/tests/test-rcu-list.c
index 6f076473e0..c0fc47ded4 100644
--- a/tests/test-rcu-list.c
+++ b/tests/test-rcu-list.c
@@ -219,7 +219,7 @@ static void *rcu_q_updater(void *arg)
             j++;
             if (target_el == j) {
                 struct list_element *new_el = g_new(struct list_element, 1);
-                n_nodes += n_nodes_local;
+                n_nodes_local++;
                 TEST_LIST_INSERT_AFTER_RCU(el, new_el, entry);
                 break;
             }
-- 
2.17.1


