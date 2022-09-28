Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE55ED8AE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:16:39 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTBG-0000xV-Fs
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008At-Nb
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE6-0008BG-N4
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:32 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MqJZl-1p0Su34AuR-00nOlN; Wed, 28
 Sep 2022 10:15:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/38] linux-user: Add proper strace format strings for
 getdents()/getdents64()
Date: Wed, 28 Sep 2022 10:14:58 +0200
Message-Id: <20220928081517.734954-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sXmInNDon6rnMD6euxiqvLJ6kYD94o+sswb+DUaGQTDIb1MMEOt
 JhsdfVPX6+Jrz073mdr0C4FaZiC8YLjKL5fU3c96ZELkCzlBZvWdjkXD7XfgE4P6qWreDx9
 sScQdX+TKVgxheLO6XnXNX2edH78pNYlp++Ouep8SqXYlljROsgGhbIbCnTgT5uTjNEYVJl
 1T+537/DUWiTZx5wgFfnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jXBCI8GC7Zc=:NwfyhB7p9GQjxxBmsSFwDI
 VkeF1w4yLdZnDRK3+nuJN6zlBJCFWX2FPkyRuEE0gxJtoLCzqM9dotWZwixT9KYnOe8j/fQB4
 cCZX5y6G13TOR9e84sseeRTtx8BXJGrFhoD0e15M7reN1HWgbT/ecBfhF765tLZVQxT4ZQ6eZ
 3CoM1v+yfdAq+a3SHLs45O2X3L4cba69OaFcVHGk4hyeOz4can+bot8HfYJyh3mV1n7QUaKn/
 6T59JLKGXjygiAn7qeA7/87scyFhDbOOH5NvZHA4GtD2ycCeMaMzzmtkairke6xG+vGeSq6vI
 mO3FJ3Kt3MmccfJiydr2hr4G5vH4uWJKyBDgK9cnZ8mdMqV9XXE8pkLJ/pbyrmKymYQons2ZL
 FmZirYImWRfjVJ5Fx/pM9sarsJlwVjhBVXNOCT/xtE2XBniLjlCiJQYfRrbC+5regSLvZsZsS
 n17Cl5sTU6QvrFGioEwceWqh6/BWGABxltM3uV/iE6sTY8PV0Anbpj+mR0t4jvcFIEPXybxTg
 JNRYb6ZDY7YzvLMpgwX7OegTfiQFZa9jkuXBSCtLseDBlqo9mpx0PnyPCKlnP+ry/3jlvGTr8
 Bat6k1t/jGLaXLr3edKF2bPPWoRhhZroYHrS/exk6gal1s9i7kTk0VDsO9YfXB6uMXUWwDVrJ
 mji30eSyGqgnXvOeH/OmVaDU6YxQ80sK36YvTw5y739bI1Nh6XqfBoApijQs0w08YOag5pktw
 Bpo3tF5iRcXqAdBorObDBhqTb1tUYqNcTXRwaCbLgDY6sfrzVHJv8mlFJMdOCuNPgc3FDOVin
 sFawEXN
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


