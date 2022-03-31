Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689304EE3FD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:24:34 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3DV-0005FT-IT
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:24:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38U-0005t8-GM; Thu, 31 Mar 2022 18:19:23 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38P-0001AB-Dc; Thu, 31 Mar 2022 18:19:20 -0400
Received: from quad ([82.142.13.234]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MRmsG-1nSvaI1xhS-00TGSC; Fri, 01
 Apr 2022 00:19:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Date: Fri,  1 Apr 2022 00:18:54 +0200
Message-Id: <20220331221857.433867-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
References: <20220331221857.433867-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8fuJ3eovMUKBZbH8q8Hh/zCPlrIBJZqsdjtCbmNSYDYepZYoNbd
 5O4SwyX+RihZ1DxFvaURCON3rkZ+CzV7NJauvNfw6ou0ATX0USJOpHHiK6g6Weg0kx+pI+T
 dzqv+7xPeAllQcHmZNtMpMWaCog5nvZYMxSjkZxc3ZaoB5u/dxsFIILTZ3A0oalk29sxxgt
 CFihZY908q8laHTAXuVGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BgPu3x2e+YY=:BFLHYGehS+UzoUoi5nYjVm
 FQn3evyMHW7Ca9JKSQLebgbMCEUtLn+ChczUoQ6wADLLwDnFIr1RHFatAL1dzBBCVdjnAR9+1
 iGMsZabMIeAM8F1x73kd4RA2ekw6DDp+F6IGtw1B+B4/aFqwsFVo5UtITssmXAD6mL4nYnKql
 s5TtNAOLUzjQBIYOxI+615ndIAd4ajR83wUygQ9k4NxUDn8Z++Ih7N8gxdSpGm2fY6sG90nDm
 zLS+h50yRYOIHT0Cillq3Arha1cnOpuN8rq4eBXWSQHnC0r90YIRAMC3ksCCUef1971FWosy2
 v9qS0tRqVvh9vhTG8UJvjJXntu82HcTr//4gCN4y0+IQVXQzNmcvDWYH8PaDGkhp+BCuOIfok
 T5+yJwhjdQUPNs1EeeYqv0y/iBsi7v5l+OtOf0I5+8xCYWKKJa43GXUv4gEbyBXXMBJa90+ZX
 v2t8yhdBdHFkr2qmXDkd85O3Ag6zeOlhU47f9ThnukbkaQfuagDJGqSu5UIanzyMpKGA4kZ85
 m6mQL3mttweycRtNWrE9HAzGHd1F6t0wh9puAn/oehi5R9pjGq9KzDF1xfiZFZ7xBoQYyyLve
 u4KgK+cYzwrZLS2JV1jTJu+wCCpWKWCW28kvtR/nvxg9Njx1lMHbsre+homJp49xZv3/xolSw
 f1GH1GcdmHg4+H11MoLXPKytjTQqZfOHpgMuh25VWuPtC9zRKaHXqvdv+SeUIb35WwQc=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Seen while compiling on Alpine:

 In file included from ../linux-user/strace.c:17:
 In file included from ../linux-user/qemu.h:11:
 In file included from ../linux-user/syscall_defs.h:1247:
 ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
  [-Wmacro-redefined]
 # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
          ^
 /usr/include/sys/ioctl.h:50:9: note: previous definition is here
 #define TIOCSER_TEMT 1
         ^
 1 warning generated.

Add the TARGET_ prefix here, too, like we do it on the other architectures.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220330134302.979686-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sh4/termbits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sh4/termbits.h b/linux-user/sh4/termbits.h
index f91b5c51cf83..eeabd2d7a9ce 100644
--- a/linux-user/sh4/termbits.h
+++ b/linux-user/sh4/termbits.h
@@ -273,7 +273,7 @@ ebugging only */
 #define TARGET_TIOCSERGETLSR   TARGET_IOR('T', 89, unsigned int) /* 0x5459 */ /* Get line sta
 tus register */
   /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
-# define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
+# define TARGET_TIOCSER_TEMT   0x01   /* Transmitter physically empty */
 #define TARGET_TIOCSERGETMULTI TARGET_IOR('T', 90, int) /* 0x545A
 */ /* Get multiport config  */
 #define TARGET_TIOCSERSETMULTI TARGET_IOW('T', 91, int) /* 0x545B
-- 
2.35.1


