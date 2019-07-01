Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D13FF9C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 20:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLXI8-0002eO-3t
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 14:15:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hLXGM-0001oc-RP
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hLXGK-0007LT-GE
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:13:54 -0400
Received: from smtpbgeu2.qq.com ([18.194.254.142]:38649)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hLXGJ-0007K9-3f
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 14:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556648025;
	bh=CQirBRpOqVgUGWxDqn/rT1V4oQiTaduNM5WoiWaimwM=;
	h=From:To:Subject:Date:Message-Id;
	b=Gru+gr7BWW7JRQGqIfkOu2PsoeO4gQWdaPRLT4KB8Vpo1HHwrkBg7aDB3Sex9kCEY
	g3A2zWby8iYP5yyK2sYGDxCbgPlecjAaaC9Z9l+5xkTY/OF+miEnc6k2/k9UqazDVQ
	LhGlez3Kebd/d7qGP0BOHJg9hwsKJ4rmf/DloVVg=
X-QQ-mid: esmtp5t1556648024tb6k12gfz
Received: from localhost (unknown [183.63.119.27])
	by esmtp4.qq.com (ESMTP) with 
	id ; Wed, 01 May 2019 02:13:43 +0800 (CST)
X-QQ-SSF: B100000000000030F7F00F00000000O
X-QQ-FEAT: 4BYgmPH5RlGcu2N1hoA3KgOnr5CIotVbVs/BfRNnV2ZmDk1rDaN0n61zv3BAR
	X4xhR7hnig3yEnw1QPRWUj8q+kd/5w36EDqoUI2DBb9+RKPuL6PjP7gZYDH0nM+xKb2Akjq
	ZGLEX7xc+mFEvbNBN4dEarVh2rLmxD2vB7NhuB1F2nrs9za9Q99hp2g7eqa100Lp2ccdpFP
	FkEYzghXLq5+Kkf2mgQpZNFk7tbMFrMrUMFnM2/0O8gslGe5/9DqWokQpjXs7AvyZE2heKS
	1fVsuJsbScVF6g6JIoamBsTceyCM6UMh2hpg==
X-QQ-GoodBg: 0
From: Cao Jiaxi <driver1998@foxmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 02:13:43 +0800
Message-Id: <20190430181343.1362-1-driver1998@foxmail.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 18.194.254.142
Subject: [Qemu-devel] [PATCH v2 4/4] include/qemu/osdep.h: Move the
 __USE_MINGW_ANSI_STDIO define up to avoid confliction.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cao Jiaxi <driver1998@foxmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
---
 include/qemu/osdep.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 303d315c5d..af2b91f0b8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -85,17 +85,17 @@ extern int daemon(int, int);
 #endif
 #endif
 
+/* enable C99/POSIX format strings (needs mingw32-runtime 3.15 or later) */
+#ifdef __MINGW32__
+#define __USE_MINGW_ANSI_STDIO 1
+#endif
+
 #include <stdarg.h>
 #include <stddef.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <sys/types.h>
 #include <stdlib.h>
-
-/* enable C99/POSIX format strings (needs mingw32-runtime 3.15 or later) */
-#ifdef __MINGW32__
-#define __USE_MINGW_ANSI_STDIO 1
-#endif
 #include <stdio.h>
 
 #include <string.h>
-- 
2.17.1




