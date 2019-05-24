Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB992972A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 13:28:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU8Mv-0006nO-38
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 07:28:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hU8Ke-0005Fr-CM
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hU8Kd-00011c-2X
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:25:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42597)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hU8Kc-000118-PZ
	for qemu-devel@nongnu.org; Fri, 24 May 2019 07:25:51 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mq2vU-1gprp41N9m-00nDc5; Fri, 24 May 2019 13:25:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:25:14 +0200
Message-Id: <20190524112520.17684-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524112520.17684-1-laurent@vivier.eu>
References: <20190524112520.17684-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lsbnsglWsnMP83Af3VQjKNBIC2E4zUcnBXX3GszR69zo3K7mg+5
	KhKCBN0faP4MkHDj/60JRVr0KxYjdHRgPiflaRSyHyWNk8mX24C9ziGqcIN4lS0VE4/QKQK
	093ksR6O/8zNYL6Pj50VHuKYuUM/XUbnSSW6/3syondW3+n3sBJLagkq0+qF4Y9qGas2o2i
	sHSv5TnOZVmA8T2aFYk8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ETalZQH+KBM=:+SpNcOP4TGmonnzeMuripL
	2XV5X2TjciPg7IOpXfPmmE1YS3ynnQ+yMt3gvcgG6QjybRyS70tww7xmYxd6U3l+C5sv01Egr
	KjD1mKOkNiPGu0Mqru8xqh0IYNiD+qPHP/DKyux+sPLyJVodqMiIThANFGV1PQeh+xo1Khswq
	p2zEUzz4NDhRV1G8S+PLuY3nXWR8xFGCtQCTV4Hc+YEQMVBOEfFigCsURD/dg697yETw1yV5I
	gCN08lo8JS7Ricd8WAzyXW4p8c41uTvLsoLKx6YcX6XvV2Do9e84g8Iwp+SevAXp7JQ4OWyrh
	XucXDeb+OiNjpNk+JTmSuP4qNSAcgSCyGAzEHoi3mGvJ6CTvAFW62QvFerkiLwD1ikW/JekAP
	8MgvlzgJ/PH9GfY7P4M57CNgskO1aFfJ8KbACXHAUIYo7W9Ui6jQohB0MaJgAW/be2PJX5nAv
	D5stWjFJ1ihDEHzI74eXNM1RA3u6FB7/EupjO8Ziu850rhW2vk6D5BUEs2KIK6KeoCtY1RAfq
	tQVg25SKpHY7BzETqel/K8Ecu0z9OMdtq02eemJ5US8RHMuMm0qsQ3Vc4nh1WezlYTYpLRINm
	0A0nVWf6rMkcUHOH5zOXxWzW2XCM15AbD5VoSEetcbEqehHSjsL+1u9i2tM9jGEEcebou7SqA
	Jh/ZaTsAO3BzsN55ghZkqBn/duKmpciSnPNejKmnx6XialAuYtZixEoThr4V4vEvCyHj1P2cF
	piw+9kVvivf9IsTwlLYQhPPe4uRx0U6y7f3rPQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-devel] [PULL v2 3/9] linux-user: Fix support for SIOCATMARK
 and SIOCGPGRP ioctls for xtensa
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fix support for the SIOCATMARK and SIOCGPGRP ioctls for xtensa by
correcting corresponding macro definition.

Values for TARGET_SIOCATMARK and TARGET_SIOCGPGRP are determined by
Linux kernel. Following relevant lines (obtained by grep) are from
the kernel source tree:

arch/ia64/include/uapi/asm/sockios.h:#define SIOCATMARK    0x8905
arch/mips/include/uapi/asm/sockios.h:#define SIOCATMARK    _IOR('s', 7, int)
arch/parisc/include/uapi/asm/sockios.h:#define SIOCATMARK  0x8905
arch/sh/include/uapi/asm/sockios.h:#define SIOCATMARK      _IOR('s', 7, int)
arch/xtensa/include/uapi/asm/sockios.h:#define SIOCATMARK  _IOR('s', 7, int)
arch/alpha/include/uapi/asm/sockios.h:#define SIOCATMARK   _IOR('s', 7, int)
arch/sparc/include/uapi/asm/sockios.h:#define SIOCATMARK   0x8905
include/uapi/asm-generic/sockios.h:#define SIOCATMARK	   0x8905

arch/ia64/include/uapi/asm/sockios.h:#define SIOCGPGRP     0x8904
arch/mips/include/uapi/asm/sockios.h:#define SIOCGPGRP     _IOR('s', 9, pid_t)
arch/parisc/include/uapi/asm/sockios.h:#define SIOCGPGRP   0x8904
arch/sh/include/uapi/asm/sockios.h:#define SIOCGPGRP       _IOR('s', 9, pid_t)
arch/xtensa/include/uapi/asm/sockios.h:#define SIOCGPGRP   _IOR('s', 9, pid_t)
arch/alpha/include/uapi/asm/sockios.h:#define SIOCGPGRP    _IOR('s', 9, pid_t)
arch/sparc/include/uapi/asm/sockios.h:#define SIOCGPGRP    0x8904
include/uapi/asm-generic/sockios.h:#define SIOCGPGRP       0x8904

It is visible from above that xtensa should have the same definitions
as alpha, mips and sh4 already do. This patch brings QEMU to the accurate
state wrt these two ioctls.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <1558282527-22183-2-git-send-email-aleksandar.markovic@rt-rk.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 1f5b2d18dbea..5b530e04b8fd 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -737,7 +737,8 @@ struct target_pollfd {
 #define TARGET_KDSETLED        0x4B32	/* set led state [lights, not flags] */
 #define TARGET_KDSIGACCEPT     0x4B4E
 
-#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4)
+#if defined(TARGET_ALPHA) || defined(TARGET_MIPS) || defined(TARGET_SH4) ||    \
+       defined(TARGET_XTENSA)
 #define TARGET_SIOCATMARK      TARGET_IOR('s', 7, int)
 #define TARGET_SIOCGPGRP       TARGET_IOR('s', 9, pid_t)
 #else
-- 
2.20.1


