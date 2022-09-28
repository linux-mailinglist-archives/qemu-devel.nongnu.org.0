Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619065EE80C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:11:57 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeLU-0007Xl-Ev
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf6-0000jU-RA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf5-0006Yp-6n
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:08 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7Qgn-1pIVuS26zl-017iRL; Wed, 28
 Sep 2022 22:28:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 37/37] linux-user: Add parameters of getrandom() syscall for
 strace
Date: Wed, 28 Sep 2022 22:27:37 +0200
Message-Id: <20220928202737.793171-38-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9fzG2n3z8VWjHmFaPbAcsEwMarqXpyLARRzEYqmeB/G0n6RuI8g
 OS3NzpNaxoLwRI3U+tLSvdoW8dJ3RWdQ5Q9vtiz+RjxudT89aB+4PhLxUGZXb6cYe0OXNiM
 W5DfYoCgOw6GYrlMhr9uTIHSEN6MWfvOC3T0ObP+460bLSHHf2zZyd6Oa2vIDTnfz7oY5oD
 /os1lncObT/0ON9yLHWfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Skd0xOzgYSQ=:nDseGLcmgLRYR3fcgoP2sO
 le17Jaea7v0LUzgmsieFSZegCpw/E16DjAK5pxoQ7qiQH8pM5V2lr7G2ZSTi76RqURWzpqI9L
 fvWxBJl9PsCA1uQ0xvzvpBSxA9gzYe3lYM3+UuJXVdYCSQu1AzdRaml/yymplJq6clElhZXKE
 SjvRTiIj90CUKeFpPfl38P31NDGQ4OUax33d/O0AKCv+ABLhcE1gGyI9wqXp5rXpKVZ5pvCC6
 2zjHZ7VSd/eF7ZjVb4ZBgrOVAySyW+aofH/nUHwbfV+FslxpzxTfYyDCPbdw6nLiQs4DkQPOD
 KSp1Me8iLM5oVusPuWvmsqZS5KJKAdcPgxlNS/GxUY1fvFat2TGJC7ZZCsHjSes0H+kD/FAae
 D4LLruMCrc/RunlV4zc8y/KU8thJN401E35/671qmTRepdNzSUaQZsh5PLiczbqluKffatQj8
 qcA8FWyHacgKjE0XNwdklFbfZUQ/l8J7Bc27tDvJejCFjS5xhSLAwQvxLh/cfG8ZhvLCpB1ZW
 vB3mB960gxMV5JD3gNVbqFNoRdZ5sWJTyLMzrI4miwZwV+3w4w6oHxEAFyojb7UFRqnyW5kkW
 la2yMpab2epx/ZlMP2Iue3d1Hq5eqMCGZ7O20jztqyR6FreZH9CW6aJuoODLQsylunMzoUwfE
 29QWW65PjjXAe4VSAKQpTgScMV0ZaEY9JOs6ccwPrZs8vMUmaPE7DX5kh175UhUqTixHTR/F1
 F2wDr+8l9fS5iBGhk7N4W1yH1M5hJb34yezNJ99AgWyMwkaJLwbu2INvAIKDPGLMWyjJbq1NR
 dM9d7GE
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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


