Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164FB5EE6B2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:40:51 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddrO-0000Td-55
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0000a6-67
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddes-0006TQ-HN
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:05 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MVMqF-1omBxv2uIx-00SLHh; Wed, 28
 Sep 2022 22:27:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/37] linux-user: Add proper strace format strings for
 getdents()/getdents64()
Date: Wed, 28 Sep 2022 22:27:19 +0200
Message-Id: <20220928202737.793171-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GpWvH71Ha/BJ7QQ7uKIqke2HySaH4TAbweugJIVzvZyFI8KXAVL
 8naTb6lvOry51pk5q37AWmizGTaO2r7uRutiVZ+o+XuGmofaya1ROX+8OPaCa5SKzQUSGVu
 VG2YnPwf5LvU92FYqY4BYxEpl/q5IijAGSoQBLhkfyVsyjOSISb+EgGlrkh36uak9415DxR
 s8bFzgK5z7m7N2IGF/XUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zC4kfa0MKzY=:3OoKZ2PJ1AnaCBoh/4VEi8
 lz+riJkmj2KVKi1IcQfIEJDkxCVvh9rttys7/RStGCQWgJ3IRcz88ed5QodIUExyFyKyU7Fh+
 H6Ho0BKOOCLnN/beicLUZKD8b4JuPZ+KzyqWkNQzKT69xx/6dr9WUdHoccuhL/HGwPLpUt/9r
 yb5IlPr2xUOY1Uplg4np+s2YrCoHvtSDnDvxVx+eeS6EmB8GMBZ61YUnpANj9/DAcXKpMiUNs
 9xjYWAn05dkm7PygOaNH+DeMfOxIx8LkfBKI4MS9W7KeSCuPWe85bSyMyJH5jNmuQaCAjBH9w
 ggGQz3NnRd3rgqUWpfiijJR2bxOCzdgDfW8qzh8DHb3dtqdzMSVNEapkSPFEjwVtJ15k86GNh
 QLy91muqG9qoKD6uViLiiHT8oTMxnoG2+5gUE06py4hzuq540ufXC7+W3mCmknSjRUhGvj4Vi
 MSwPVXN/aqCZLftXFzJV4Twpm5IeuBhwUz3RkBcgF8tBQmpJB1YTj5KfA3bDX8mJhFw0kcX1b
 4QndahgSJrr2UoDEe6oN099eODEZXuFuNEf1suWvfnPhH0raUcuXgXxVjawLYDbDs+EZf++H5
 HJh3topzcFtGYAX7B0DYJnboP9dOG0zjtXQ24y6C9CTOTBtiiE0rCu0TuIdeic5okZ4hdzYKj
 Dri2oLhhRM29xE/xQQ9sD5reVrLxmVcxFuar5UtROZ6rJ4HIWvasTFMCG84j7AFTCOqYRt+8t
 iK17Gvvj0HyNBsBWjBM6fFSZCUCSK6OFOGfJ+lKtDMHjn6YFLoFb73YxMJNUHjRjaGonj58hr
 P9QaNBD
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-3-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index c6f748505a9e..f8a771b4f256 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -279,10 +279,10 @@
 { TARGET_NR_getcwd, "getcwd" , "%s(%p,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdents
-{ TARGET_NR_getdents, "getdents" , NULL, NULL, NULL },
+{ TARGET_NR_getdents, "getdents" , "%s(%d,%p,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdents64
-{ TARGET_NR_getdents64, "getdents64" , NULL, NULL, NULL },
+{ TARGET_NR_getdents64, "getdents64" , "%s(%d,%p,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdomainname
 { TARGET_NR_getdomainname, "getdomainname" , NULL, NULL, NULL },
-- 
2.37.3


