Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5318714B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:37:34 +0100 (CET)
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtgD-0001pL-Ci
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jDsPi-0007vX-38
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jDsPh-0000WL-15
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:25 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47925)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jDsPg-0000J9-NR
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 12:16:24 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mx0VH-1jWo4d3F2x-00yQw0; Mon, 16 Mar 2020 17:16:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/38] linux-user: fix socket() strace
Date: Mon, 16 Mar 2020 17:15:20 +0100
Message-Id: <20200316161550.336150-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316161550.336150-1-laurent@vivier.eu>
References: <20200316161550.336150-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CcLLFZn+6qWFb1wdw2Mc0IEE/pznpVamu1eWxk3IXZAzJRXu0Ah
 p/Bo7mbeAqSc9vmjYbIWgToP8vuycif3Bu5i9AKbqhSl8MOtnv52wsXqwXY1m1U+R6RhHW6
 AzJlv/ir0bumPkLcUqMY+HugTL259TR2O7P+31qZbXy/l+ETPaUlN91A/H1RuyIYcLqEx/4
 DSlhVgRiJsJMF6Hzv4sZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8lcNgTAJCc=:mKSYv+EZeXOV6NeY31kSSt
 P/CPKy5oL7X6rvYn1g60OyLEH5Uq6dQuUQsz4QQKdOUAgoBWuWxrQzxOwVR66x8jT0QIeUlVc
 njZ5q6K1paU575cJZHZqlrhdPtnL0HBMRAnh61jhcgCEY28Y1DOCnJM+CcOMnjskNArZvvlwg
 9B94wDlwhT4OpyrGsmRdZ52a3Vp3xrvUl5ow+k3GygaTQVg4EYkeH9xJdDhf2yBzO2QFM6Xul
 egxUvt/gj88k+dB20hvlW/KrwYu0Mlh9Sdg4I+cXPZw/A/REHoQEnRfbos03Zg6QhV2+14cF2
 oOjanpEaIwdZqK+glz4wJ1lPoVc7Pj6Y+MPUWeVshBzJW5mqjjv7weDTHqZm3SfeJdwrHrtNR
 b0B/arCeskt9NCGujONUvBQfT6Qj59WBTEK61IyW4CNSc5g98meU+AbFw2CoDvEpVdYBkRm5j
 gtK4aVJrcCGx0O2lIggmCbdo6+jueXzWN0o9mMuuUgqMlSYgVcrLd7MOs5h2+HgMHHGfQOtSs
 ujUhOhj2HJV/VN6C7dBEHnD20dAWPasmW4lc70WDJwdZns5ZuHCqpjcJbaF3qrnXsB/6P6Ahn
 qwy+vsnD5zL2vn3LsJ7Beq3LlDLYIZArlheiDlO0oZsDJmrMLcqKqTq3RO1Bo8YmgMcQXKY4H
 rpv0zwp7A7AOk5lDzQk8I4PUNLSRsGpFYe5ES2qiQAJbvLDXnozcwx0Ozl0jQp94xJxK2rGe9
 f6xzw4GNcFvUS5NDmntslbLCIi4rCPiRHq0SyrwzPh0oc+mjw/zE5/2aozPgnX/9HOLU2fH28
 VgMGREexSiJe1OFYscP2oGW3lfunfn184QRzm1FWWoiz50CupsMPaFfZ8N5aQUgPIwYZba/
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

print_socket_type() doesn't manage flags and the correct type cannot
be displayed

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200312165530.53450-1-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 4f7130b2ff63..69232f7e27b8 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -444,7 +444,7 @@ print_socket_domain(int domain)
 static void
 print_socket_type(int type)
 {
-    switch (type) {
+    switch (type & TARGET_SOCK_TYPE_MASK) {
     case TARGET_SOCK_DGRAM:
         qemu_log("SOCK_DGRAM");
         break;
@@ -464,6 +464,12 @@ print_socket_type(int type)
         qemu_log("SOCK_PACKET");
         break;
     }
+    if (type & TARGET_SOCK_CLOEXEC) {
+        qemu_log("|SOCK_CLOEXEC");
+    }
+    if (type & TARGET_SOCK_NONBLOCK) {
+        qemu_log("|SOCK_NONBLOCK");
+    }
 }
 
 static void
-- 
2.24.1


