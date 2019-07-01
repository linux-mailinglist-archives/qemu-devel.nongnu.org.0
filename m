Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10242DA40
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 02:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKuVO-0007jL-Ux
	for lists+qemu-devel@lfdr.de; Sun, 28 Apr 2019 20:50:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hKuIb-0007js-1v
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:37:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hKuEu-0003Di-QN
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:33:49 -0400
Received: from smtpbgeu2.qq.com ([18.194.254.142]:58104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hKuEu-0003Co-HZ
	for qemu-devel@nongnu.org; Sun, 28 Apr 2019 20:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556498021;
	bh=OQUpm2nii0l0T7ZEKjxuy7zi4jinxy/6ImWCIvZNhCk=;
	h=From:To:Subject:Date:Message-Id;
	b=G4Bra5hPvQagCaAqKfjYvKCZICN1tqByoUKirWHqNWgdOJYhq0PnTiTLVBxmZc1xU
	5zkMv94XKLKQfmrGFaZowyGI9K83kFi3X2RSbngK+yEhLGvOjyu5X4PAq28EhPpMcK
	zA7gWyN78E7155higXW6SCSzeMn8OdtTsG1yhCFg=
X-QQ-mid: esmtp6t1556498020t34rq6i76
Received: from localhost (unknown [183.63.119.27])
	by esmtp4.qq.com (ESMTP) with 
	id ; Mon, 29 Apr 2019 08:33:40 +0800 (CST)
X-QQ-SSF: B100000000000030F7F00F00000000O
X-QQ-FEAT: 7DSX613YSL5DqXSjOqoxYZ1SQOvSPGNf5qMZ+hWJ/Ke2KpWrdWBm722tMJbrO
	eS3QzTgT4A8fqPBBRp6JryMAB+66ziGLjii2cCdVO/Bi7eBrzCHjkWi3pO+Oycq69xESEEH
	Vz2N6L/LhzHKmvLxbG/wxlhjlLDH6CBRzBJbyi5ZxDkWpMYkKEo0nvl+Ey9DXiWglQbZ/Jz
	PKHarQLKJjDKAcyHO5OkUUnjXs6r2/S7d9M7PqzHTRpRM/3AQlFuQKfYOwmt8ZhSl9NgZb8
	bUm1Y6GxB/aavMAva2cAKqHxrj/tzd17Q+gw==
X-QQ-GoodBg: 0
From: driver1998 <driver1998@foxmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 00:33:39 +0000
Message-Id: <20190429003339.22956-1-driver1998@foxmail.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 18.194.254.142
X-Mailman-Approved-At: Sun, 28 Apr 2019 20:49:02 -0400
Subject: [Qemu-devel] [PATCH 4/4] include/qemu/osdep.h: Move the
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
Cc: driver1998 <driver1998@foxmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: driver1998 <driver1998@foxmail.com>
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




