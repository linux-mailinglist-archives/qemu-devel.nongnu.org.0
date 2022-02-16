Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C254B8CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:44:26 +0100 (CET)
Received: from localhost ([::1]:36886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMTh-0007vX-BX
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1nKMRn-0006nw-CK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:42:27 -0500
Received: from mx.dal1.terarocket.io ([108.61.222.170]:51290)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>) id 1nKMRl-00018x-88
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:42:27 -0500
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 7FFE45E76E; Wed, 16 Feb 2022 15:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 7FFE45E76E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645026143;
 bh=LrH3Q9jGT0+LIHPaGgkTJLd//znYL3xIlocOJWqYPVw=;
 h=From:To:Cc:Subject:Date:From;
 b=Tn2AOb/KDHKXfWrICTUu8Y9TYWeiELb4LFt8k3Tz02L6I3U1zOLfhwWNWZKkNLGyY
 HrP+NXu5yOPPd53Y4GjnvSUz/Ax1lZP1JeZUZPeyaeLcrxVZkMsObS96bQrOezbEMg
 N0WXcUts2ikezAWYABA8w2P/Wf/NXUwZ/KvTqwcM=
Received: from eris.discord.local (cpe-70-112-18-26.austin.res.rr.com
 [70.112.18.26])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id 61BFC5E4C8;
 Wed, 16 Feb 2022 15:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 61BFC5E4C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645026142;
 bh=LrH3Q9jGT0+LIHPaGgkTJLd//znYL3xIlocOJWqYPVw=;
 h=From:To:Cc:Subject:Date:From;
 b=irZD0wUH+irbO7IuFcTkpuey22U8oOCJMKURlY9h1B4eAPzKHf9itDolzJpi69Pj+
 DTot1vfeZGxH5zjVn/Fmy2L61Ql3ILxlvwU+fXcwWHyDc9UELR3XhAx8aeRXaWua9N
 E0zZ6dOjXPWmAoYiIqwjHsoEhkKCtXsjWq6CvgrA=
From: Alexander von Gluck IV <kallisti5@unixzen.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
Date: Wed, 16 Feb 2022 09:42:08 -0600
Message-Id: <20220216154208.2985103-1-kallisti5@unixzen.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=108.61.222.170;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Alexander von Gluck IV <kallisti5@unixzen.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 tests/vm/haiku.x86_64 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 2eb736dae1..936f7d2ae2 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -2,7 +2,7 @@
 #
 # Haiku VM image
 #
-# Copyright 2020 Haiku, Inc.
+# Copyright 2020-2022 Haiku, Inc.
 #
 # Authors:
 #  Alexander von Gluck IV <kallisti5@unixzen.com>
@@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
     name = "haiku"
     arch = "x86_64"
 
-    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
-    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
+    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
+    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
 
     poweroff = "shutdown"
 
@@ -99,7 +99,7 @@ class HaikuVM(basevm.BaseVM):
 
         self.print_step("Extracting disk image")
 
-        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
+        subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"],
                               stdout=open(img, 'wb'))
 
         self.print_step("Preparing disk image")
-- 
2.35.1


