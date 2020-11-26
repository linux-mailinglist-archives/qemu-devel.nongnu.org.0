Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108472C4DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 04:50:22 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki8IW-0005mR-Ld
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 22:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npcomp@npcomp.net>) id 1ki8GM-0005EC-1F
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:48:06 -0500
Received: from [209.195.0.149] (port=40024 helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npcomp@npcomp.net>) id 1ki8GG-00024v-L8
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 22:48:05 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id E2148FD2D4; Thu, 26 Nov 2020 03:38:11 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1606361891;
 bh=szxWMFf5a9sbBdqWFSCe8RqKy7C4zLy47NinAubUMck=;
 h=From:To:Subject:Date;
 b=nJLPEq2eQ93E3MysJpBqieVEd877eXxaYSPHMeRQ+wavKiAsR99hIjz/Gl09oNnpM
 plB3fku4pHgiL857hjOzX1N9mSvMnvK59VtQo1q3kXSRbRm/wVLNNHnmmFvQvxltGG
 hAk1hHGI7DDltQ+4E+OcDcsXNAGxxR1KAjAqtLh8=
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add an announcement about the 2020 QEMU advent calendar and a
 call for images to include.
Date: Thu, 26 Nov 2020 03:37:54 +0000
Message-Id: <20201126033754.19123-1-eldon-qemu@eldondev.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149; envelope-from=npcomp@npcomp.net;
 helo=npcomp.net
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eldon Stegall <eldon@eldondev.com>
---
 _posts/2020-11-26-qemu-advent-announce.md | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 _posts/2020-11-26-qemu-advent-announce.md

diff --git a/_posts/2020-11-26-qemu-advent-announce.md b/_posts/2020-11-26-qemu-advent-announce.md
new file mode 100644
index 0000000..06c0e45
--- /dev/null
+++ b/_posts/2020-11-26-qemu-advent-announce.md
@@ -0,0 +1,39 @@
+---
+layout: post
+title:  "QEMU Advent Calendar 2020 Announcement and Call for Images"
+date:   2020-11-22 18:00:00 -0500
+categories: [contributing, community]
+---
+QEMU Advent Calendar 2020 is around the corner and we are looking for                                                                                                                                                                                                     volunteers to contribute disk images that showcase something cool, bring
+back retro computing memories, or simply entertain with a puzzle or game.
+
+QEMU Advent Calendar publishes a QEMU disk image each day from
+December 1-24. Each image is a surprise designed to delight an audience
+consisting of the QEMU community and beyond. You can see previous
+years at [https://www.qemu-advent-calendar.org/](https://www.qemu-advent-calendar.org/)
+
+You can help us make this year's calendar awesome by:
+ * [Sending disk images](mailto:eldon-qemu@eldondev.com?Subject=QEMU 2020 advent disk image)
+ * Sending ideas for disk images
+
+Here are the requirements for disk images:
+ * Content must be freely redistributable (i.e. no proprietary
+   license that prevents distribution). For GPL based software,
+   you need to provide the source code, too.
+ * Provide a name and a short description of the disk image
+   (e.g. with hints on what to try)
+ * Provide a ./run shell script that prints out the name and
+   description/hints and launches QEMU
+ * Provide a 320x240 screenshot/image/logo for the website
+ * Size should be ideally under 100 MB per disk image
+   (but if some few images are bigger, that should be OK, too)
+
+Check out [this disk
+image](https://www.qemu-advent-calendar.org/2018/download/day24.tar.xz) as an
+example of how to distribute an image. Links to files over 25MB are appreciated
+in lieu of email attachments.
+
+PS: QEMU Advent Calendar is a secular calendar (not
+religious). The idea is to create a fun experience for the QEMU
+community which can be shared with everyone. You don't need
+to celebrate Christmas or another religious festival to participate!
-- 
2.29.2


