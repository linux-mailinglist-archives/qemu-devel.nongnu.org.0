Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD15ED9D6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:09:30 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odU0O-0003WG-Bb
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEP-0008Fb-FR
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008IY-DS
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M7am5-1oaSco0K7R-0085op; Wed, 28
 Sep 2022 10:15:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 38/38] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Wed, 28 Sep 2022 10:15:17 +0200
Message-Id: <20220928081517.734954-39-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qxYfW9M/8vxAvVkZCNCgOwGj0iqEj08TMs3TTy1j59G6MDjbKKX
 +kvl1ZPstLA8CTe8LFhYI0oBSORVAmNTuOTZuL8UMLAGoQIJ+Q0q0DZJqC6ygc56dS0lDEA
 GrT3qXrMROrKFE2Jp+uApsdC+P79r+T0kJIaKj8D69MSWoRXpUhuHCsZRg8oH0taZWaJLNG
 q9UwHVMKNY/qXNwna10Kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ZeePMzc74Y=:b8n9UFZrzlOizOt59zUrY3
 CLROptPw3E8bilshS4rkI0El+yLDrq4dlCLjkaQ9j6wPnJZZsRAb1z00835osB5QMCsM6g9eV
 GA+5jXNCuNVtAUV+bxPp7u8p1oUB0Tl9mD4OfIgLWEl1AAyiu8sRPHpaoCak5NwPiFp72IkE+
 6TNJXzaSugw+OsEl2RQ815A6xG8l3Zu36gdilLb59T7weoVAPTFEBd1bzyjLaZ9rGehMVWMga
 nU7FSF8oPq2MZKRie718iwPOLRXRh3vZhJdlIES/aNrJxwEqg8CdS9n7uILigZcIp2YjZORO8
 SRT6VylwjRpmXZeY6mr2+HX097y7ccOJgavzgNW6VQbahmXZJ/poGUqngyxRvN5DYqlb+mON5
 Jdv4/rG5MZQ551CJMILL57+KStl5wy9thb9QK0lW/vCxYLdJgTRdE+uHd5obF1C7kZubaukrT
 fBmN9z2sUSvHhWwITRqxlWkXxdBni7mYvQRNt5eWXlWWtdVhxCC4k7C521omGMf6WZqnR6sER
 n/X+kyXUe6M7QrQYza2Mbj4+GYtfPff9530mnm7v1Ls0gFvyMIeen0q0EaD8JFB4+BzZ3Y7ww
 Fz8OvYkvttPhNc93X4IYV7jzS3elgCb4Niwfhmi5zzh4ofDDroXQ38qAFqqKQ4MIderLWzUFk
 nnLJy9439kYy+mXFx6gLK3iXpVtbalkj+5JIi9eXOiMEZTAnZtyIC/xD0CBM5ADl1sd/viUrH
 zXPxx2PA2cn5O29cPEiGnUCP6wPQ0XpCxBQsp67c1UjPljdw565C+u5MwYc8FOQyssTlLNW9l
 RGEdCc+
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220927093538.8954-2-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index f8a771b4f256..a87415bf3d50 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -352,7 +352,7 @@
 { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrandom
-{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
+{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
 { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
-- 
2.37.3


