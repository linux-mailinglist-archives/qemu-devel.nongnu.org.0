Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502FF17F54D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 11:45:42 +0100 (CET)
Received: from localhost ([::1]:57239 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBcOK-0000vS-Qb
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 06:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBcEV-0004tN-U8
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 06:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBcET-00014J-Ec
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 06:35:31 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34505)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBcET-00012A-27; Tue, 10 Mar 2020 06:35:29 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N0WsG-1jWb2e2dcK-00wXfl; Tue, 10 Mar 2020 11:34:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/21] linux-user: update syscall.tbl from linux
 0bf999f9c5e7
Date: Tue, 10 Mar 2020 11:34:01 +0100
Message-Id: <20200310103403.3284090-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310103403.3284090-1-laurent@vivier.eu>
References: <20200310103403.3284090-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4xq9cSwhhUMX5IR7qKnU2cV977mzOM15HeYgI9mWDbZ5JTn66hI
 QvjzUA8biCeG2hhhFB79I9ell5J1uNlN60yxfU5bS9Ouh+1SV4UJLHt0Ye8lS5C/AdAeMWT
 YojVj401LBWU9eNInKUc+Vy2Nwhf6cXgVwEx/7bz/Pe2VSr+H/+MvDRk/tp131c2UE8aHsm
 CrXHudO+SNLuBihbTAwQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m2L7Aii+N3Y=:hxJYn6pHwD+QJstfiKzAtm
 ZhbbElZnvlwHD63e5ZJApEUNf0YLj/3E+5HULkaDMV2lpWi/NAqiiwCWNb4ZvSjP2z0z5Vs6W
 BdK5H9f+WnjwZC6pTwt1726vea9xmuuxUwXVjLCqid1DNqliYckVOieVdRo0+h2gcJiAfbmqT
 XaqLQWpQteAndGPl4JRw3mqSMByU4rSKGPsVJWuAPANLPZs0A0QmhetyJawAa7+Hu8VmHdSD7
 rb/q4oNqtoJoQ1Mn9pF3bclme0Zu/B+8E3y1liSCsSKfj1BoRieLYsm3D6Avx9YTFhHf1Yv4f
 5kY8Qq+NSvH5orj6lxadHT/DBA32wcQCHvSG3Rty8nHoXCM7eZuuFyx2Fy7Z8SIFPWFbdvAbR
 ZVD42Yf8GzQq5lFioO2Noj0yx2qGjusGxfr0csXlUJDz4C5k1KBbKhaSn3dfCr2wc5Y8kCrCm
 tENU+MXiw53eSUn+MaaE/ozo7D8hoEy9onAuaZZqA3kae29V3oLLzXrcd6+R5eWlhCP4EkP81
 occ4eY1dAvGm08T0ahDuzph4YDn/gtfHx08WokHkE2itZvUWVNezCs7Xr51kShnM5cAuh/5aO
 XsUM1eHGzbvSKkXOnFgNhQC9SjPu54GFAbsCxlz3iS/y1R5l+Kk9A+l4z7Eqaxz7QFTsDitYg
 5mr3xvZGL0+ZfYx/legTU/LcEEiS9bvUmdj+Gj7j9OUmcbmug+n879pwsDa/EvxLsievcOkSN
 +HZ9+Vu3lBc/OT303gXUIElLjNApvhYxwv3bk9ze3LS6X230PKdP5pGgsnWsvmcVieppd4n/K
 ibevmmZZCrcMgCF0oK33f0+1+ztGMLfXyllfoX6+mipWWJIbZNmSlpUj/5hlWCnCUC7h/BV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
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
Cc: Cornelia Huck <cohuck@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run scripts/update-syscalltbl.sh with linux commit 0bf999f9c5e7

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 linux-user/arm/syscall.tbl        | 2 ++
 linux-user/hppa/syscall.tbl       | 2 ++
 linux-user/i386/syscall_32.tbl    | 2 ++
 linux-user/m68k/syscall.tbl       | 4 +++-
 linux-user/microblaze/syscall.tbl | 2 ++
 linux-user/mips/syscall_o32.tbl   | 2 ++
 linux-user/mips64/syscall_n32.tbl | 2 ++
 linux-user/mips64/syscall_n64.tbl | 2 ++
 linux-user/ppc/syscall.tbl        | 2 ++
 linux-user/s390x/syscall.tbl      | 2 ++
 linux-user/sh4/syscall.tbl        | 2 ++
 linux-user/sparc/syscall.tbl      | 2 ++
 linux-user/sparc64/syscall.tbl    | 2 ++
 linux-user/x86_64/syscall_64.tbl  | 2 ++
 linux-user/xtensa/syscall.tbl     | 2 ++
 15 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/linux-user/arm/syscall.tbl b/linux-user/arm/syscall.tbl
index 6da7dc4d79cc..4d1cf74a2caa 100644
--- a/linux-user/arm/syscall.tbl
+++ b/linux-user/arm/syscall.tbl
@@ -449,3 +449,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 435	common	clone3				sys_clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/hppa/syscall.tbl b/linux-user/hppa/syscall.tbl
index 285ff516150c..52a15f5cd130 100644
--- a/linux-user/hppa/syscall.tbl
+++ b/linux-user/hppa/syscall.tbl
@@ -433,3 +433,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 435	common	clone3				sys_clone3_wrapper
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/i386/syscall_32.tbl b/linux-user/i386/syscall_32.tbl
index 15908eb9b17e..c17cb77eb150 100644
--- a/linux-user/i386/syscall_32.tbl
+++ b/linux-user/i386/syscall_32.tbl
@@ -440,3 +440,5 @@
 433	i386	fspick			sys_fspick			__ia32_sys_fspick
 434	i386	pidfd_open		sys_pidfd_open			__ia32_sys_pidfd_open
 435	i386	clone3			sys_clone3			__ia32_sys_clone3
+437	i386	openat2			sys_openat2			__ia32_sys_openat2
+438	i386	pidfd_getfd		sys_pidfd_getfd			__ia32_sys_pidfd_getfd
diff --git a/linux-user/m68k/syscall.tbl b/linux-user/m68k/syscall.tbl
index a88a285a0e5f..f4f49fcb76d0 100644
--- a/linux-user/m68k/syscall.tbl
+++ b/linux-user/m68k/syscall.tbl
@@ -434,4 +434,6 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	common	clone3				__sys_clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/microblaze/syscall.tbl b/linux-user/microblaze/syscall.tbl
index 09b0cd7dab0a..4c67b11f9c9e 100644
--- a/linux-user/microblaze/syscall.tbl
+++ b/linux-user/microblaze/syscall.tbl
@@ -441,3 +441,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 435	common	clone3				sys_clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/mips/syscall_o32.tbl b/linux-user/mips/syscall_o32.tbl
index 353539ea4140..ac586774c980 100644
--- a/linux-user/mips/syscall_o32.tbl
+++ b/linux-user/mips/syscall_o32.tbl
@@ -423,3 +423,5 @@
 433	o32	fspick				sys_fspick
 434	o32	pidfd_open			sys_pidfd_open
 435	o32	clone3				__sys_clone3
+437	o32	openat2				sys_openat2
+438	o32	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/mips64/syscall_n32.tbl b/linux-user/mips64/syscall_n32.tbl
index e7c5ab38e403..1f9e8ad636cc 100644
--- a/linux-user/mips64/syscall_n32.tbl
+++ b/linux-user/mips64/syscall_n32.tbl
@@ -374,3 +374,5 @@
 433	n32	fspick				sys_fspick
 434	n32	pidfd_open			sys_pidfd_open
 435	n32	clone3				__sys_clone3
+437	n32	openat2				sys_openat2
+438	n32	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/mips64/syscall_n64.tbl b/linux-user/mips64/syscall_n64.tbl
index 13cd66581f3b..c0b9d802dbf6 100644
--- a/linux-user/mips64/syscall_n64.tbl
+++ b/linux-user/mips64/syscall_n64.tbl
@@ -350,3 +350,5 @@
 433	n64	fspick				sys_fspick
 434	n64	pidfd_open			sys_pidfd_open
 435	n64	clone3				__sys_clone3
+437	n64	openat2				sys_openat2
+438	n64	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/ppc/syscall.tbl b/linux-user/ppc/syscall.tbl
index 43f736ed47f2..35b61bfc1b1a 100644
--- a/linux-user/ppc/syscall.tbl
+++ b/linux-user/ppc/syscall.tbl
@@ -517,3 +517,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 435	nospu	clone3				ppc_clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/s390x/syscall.tbl b/linux-user/s390x/syscall.tbl
index 3054e9c035a3..bd7bd3581a0f 100644
--- a/linux-user/s390x/syscall.tbl
+++ b/linux-user/s390x/syscall.tbl
@@ -438,3 +438,5 @@
 433  common	fspick			sys_fspick			sys_fspick
 434  common	pidfd_open		sys_pidfd_open			sys_pidfd_open
 435  common	clone3			sys_clone3			sys_clone3
+437  common	openat2			sys_openat2			sys_openat2
+438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/sh4/syscall.tbl b/linux-user/sh4/syscall.tbl
index b5ed26c4c005..c7a30fcd135f 100644
--- a/linux-user/sh4/syscall.tbl
+++ b/linux-user/sh4/syscall.tbl
@@ -438,3 +438,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 # 435 reserved for clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/sparc/syscall.tbl b/linux-user/sparc/syscall.tbl
index 8c8cc7537fb2..f13615ecdecc 100644
--- a/linux-user/sparc/syscall.tbl
+++ b/linux-user/sparc/syscall.tbl
@@ -481,3 +481,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 # 435 reserved for clone3
+437	common	openat2			sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/sparc64/syscall.tbl b/linux-user/sparc64/syscall.tbl
index 8c8cc7537fb2..f13615ecdecc 100644
--- a/linux-user/sparc64/syscall.tbl
+++ b/linux-user/sparc64/syscall.tbl
@@ -481,3 +481,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 # 435 reserved for clone3
+437	common	openat2			sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
diff --git a/linux-user/x86_64/syscall_64.tbl b/linux-user/x86_64/syscall_64.tbl
index c29976eca4a8..44d510bc9b78 100644
--- a/linux-user/x86_64/syscall_64.tbl
+++ b/linux-user/x86_64/syscall_64.tbl
@@ -357,6 +357,8 @@
 433	common	fspick			__x64_sys_fspick
 434	common	pidfd_open		__x64_sys_pidfd_open
 435	common	clone3			__x64_sys_clone3/ptregs
+437	common	openat2			__x64_sys_openat2
+438	common	pidfd_getfd		__x64_sys_pidfd_getfd
 
 #
 # x32-specific system call numbers start at 512 to avoid cache impact
diff --git a/linux-user/xtensa/syscall.tbl b/linux-user/xtensa/syscall.tbl
index 25f4de729a6d..85a9ab1bc04d 100644
--- a/linux-user/xtensa/syscall.tbl
+++ b/linux-user/xtensa/syscall.tbl
@@ -406,3 +406,5 @@
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
 435	common	clone3				sys_clone3
+437	common	openat2				sys_openat2
+438	common	pidfd_getfd			sys_pidfd_getfd
-- 
2.24.1


