Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61018344A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:17:25 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCPaL-0007K7-Dk
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jCPYY-00060V-El
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jCPYX-0001CH-7P
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:15:30 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59079)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jCPYW-0001Bk-Ts
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:15:29 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MYNW8-1ipoFC2IDK-00VLwv; Thu, 12 Mar 2020 16:15:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] q800: fix coverity warning CID 1412799
Date: Thu, 12 Mar 2020 16:15:21 +0100
Message-Id: <20200312151521.38902-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312151521.38902-1-laurent@vivier.eu>
References: <20200312151521.38902-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mSr5JU9J6VKs/z+NMujp3fMgv+EbGAWQJaUpGfqo1HvGn0+nnte
 iX1YFi4RPVdPSDh1TXqFfRCOkGVIkg+hrFEOqXKq+imaQtmxqtqI3hYk1zCGLnkZLHViIGK
 uxAGTB/vhquPM3AB4uXoP30V7VkRJ1KY/ZlYw0imm35Ie+BMeGJBWIKPEJmyOpOIfFqTw8O
 +/mcdRp135P8eSzygP9Ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IAuGcTvc3OI=:CwTtoWlH2yorsui2pLS3ej
 UHBUg+chuX18bLLFkXGWn5vGJoLOYOuyzKOUFMvZItJKQ57zZ2bjarYl24a0wtUSuG1OGYlON
 DqHioeUJoVsEEeda1qIGdmA7Dl6O3yAKlJXCbGcA6KO6R0zfbCdyplEbJiAyFv1HNORUuQBpe
 K0ubQoCZ7FVIlGKWja3O06Wk35woaBsC/KwN6f90a4sQjaJVnUDvUAQ8LK/H7M8bwKbuOMW+H
 pPgWI8y7XfGz9M04WisVgY2zHNdWpVs3RTMFlxM4qQhw0hmdc2RIYXH2aveN/84uOnswhNH9b
 CtbOrhQsn2K9tLspUogeLVjfhH+4errIhgtm2qhY+RA/ur8bILL4GE8ogZljudqDAaFj0EXxl
 g0xgC4CemHzeUiK2hYOo31nzHnjz2+r6+i5FeNjlve7s52eOcyi7yW31mpyPmPXJubsp9MUob
 0AMQPUQDRl7gJK0PUCkntG8XnMimUsNLa585OTWYFHcWFsFEOuh2dXRqtLGg+M4IfJ15Q6Pj8
 /aBNsPNX3qO40lLv3cuFTAbZU6pGBxOC65z6sesyJ4Ji8Sfbjm2pQOzwUgMJMnS2VCzyAXr7Q
 /yD00nxNkr/C89QL1j0bB91vKo1eQx54U/L5RbRPoJVAZpIdu+kSVpXa8N5+uu/WKqbQyzvjK
 hWHUj0Opg/PZJByWB/ZUcXC+dT/v9+9FfJlCtbCYvrTdQqJY+Cee6+wD24aj2xYX7waVMkboW
 xYHy4ghGKmblKGe5DCM5uMn85icbqxNVFwfDcEOgQGpjdS5/TJmZcmqbbrClvh8p8Zn/PK3px
 Hu3mT12CPsvNsE3OCGlRwst9iYVHZY8o5I0OudyY93Ykkl+/LJzQ9kK4iRkH8Vjg7AMAjTs
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check the return value of blk_write() and log an error if any

Fixes: Coverity CID 1412799 (Error handling issues)
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200210132252.381343-1-laurent@vivier.eu>
---
 hw/misc/mac_via.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b7d0012794..81343301b1 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -30,6 +30,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
 #include "trace.h"
+#include "qemu/log.h"
 
 /*
  * VIAs: There are two in every machine,
@@ -381,8 +382,10 @@ static void via2_irq_request(void *opaque, int irq, int level)
 static void pram_update(MacVIAState *m)
 {
     if (m->blk) {
-        blk_pwrite(m->blk, 0, m->mos6522_via1.PRAM,
-                   sizeof(m->mos6522_via1.PRAM), 0);
+        if (blk_pwrite(m->blk, 0, m->mos6522_via1.PRAM,
+                       sizeof(m->mos6522_via1.PRAM), 0) < 0) {
+            qemu_log("pram_update: cannot write to file\n");
+        }
     }
 }
 
-- 
2.24.1


