Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D797E68AB15
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5w-0005JE-J2; Sat, 04 Feb 2023 11:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5p-0005CX-Au
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-0006wP-E8
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mofst-1orXSQ1bbt-00p4yK; Sat, 04
 Feb 2023 17:08:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/22] Revert "linux-user: add more compat ioctl definitions"
Date: Sat,  4 Feb 2023 17:08:18 +0100
Message-Id: <20230204160830.193093-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:svgt2oceWJbPahMz+LMGOdoqgEG/gcRO6U3u+w/SqpsOerQmeTn
 DcUJhJRLMWFnQ6XhRTRqa5Ussd2YSrbYoIRE1raUuRLY8pUY3/pHSs7Kuo38uc8da20EEH8
 yKPygljyLtgEGJoHvrYy9VJkuKKOFXmBeZTd1a4Rzovhthdqaf+JxZhUBscK+5hHQo0IkG0
 JK35swQXz0efdXPiR8DqQ==
UI-OutboundReport: notjunk:1;M01:P0:v3Fttt1pRRM=;05ToAbD8fdcYep8uwvmH6va0RXT
 jUyPfi0+Mv1R74scRxNV95rf7aWs4HS+fuY65RRhfv4M43O9RE396l9KsYLSHJzpGdToArU75
 52a5MRi2XvJcwjVG8PKhqscpmU9GFc4TcPPBs/raxsB00wL0OF0gEe/OTcX4H3bQmkQw+elRV
 hxb22MLd97z6ToBcpR0RQwC7acagwTXzyIjgT2d7QT8xOZ9sbQC/SfOdB+GLzyeYkIprVKG9K
 5gGXtmJXKIB+b41m2wGLRiSvW9XJVRGnmahULnnR4+gnrg7hmiookgPPY3bEQxC8PNAd7YhJc
 9kBijvQPdLIcREIfsTpiD52LWcqQF82QV1g1Ag0vMUOjJgsFl058sysbYY1XT6mGfG3/5u+v2
 cljGji/A3F2lf390Un7tAcovjk4dHiEkDvTWhJY10LieEJfzvrIO5ebD4begfPTun0gL7XkkI
 PLHFylG4SsMsfbIAVNExLtE6Y38b11B0pMmqUATjSOsV7dC6aL/85rvSV1kNhFvGOk1l2ceg8
 OVfAfVturN9n58QMoIp62YH0zf7JNZTx8Aag/aj2wWoUCZBv/pqOFxtPBHCRZtBkmSBxFCIr0
 8Fg4m/7GQydbk5oYGShNOaWnJtodCo1sYoKjYdKPdS/aOlqRZJ8L0GttaqYZoFrOC9u2aTt0E
 uJC07osBoAhwgnOmqgpNVoFGldEO1+EBnAE67bW8PQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.

glibc has fixed (in 2.36.9000-40-g774058d729) the problem
that caused a clash when both sys/mount.h annd linux/mount.h
are included, and backported this to the 2.36 stable release
too:

  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E

It is saner for QEMU to remove the workaround it applied for
glibc 2.36 and expect distros to ship the 2.36 maint release
with the fix. This avoids needing to add a further workaround
to QEMU to deal with the fact that linux/brtfs.h now also pulls
in linux/mount.h via linux/fs.h since Linux 6.1

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230110174901.2580297-2-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dbf51e500b4f..b88f8ee96f0f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -111,31 +111,6 @@
 #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
 #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
 #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-
-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
-#define BLKDISCARD _IO(0x12,119)
-#define BLKIOMIN _IO(0x12,120)
-#define BLKIOOPT _IO(0x12,121)
-#define BLKALIGNOFF _IO(0x12,122)
-#define BLKPBSZGET _IO(0x12,123)
-#define BLKDISCARDZEROES _IO(0x12,124)
-#define BLKSECDISCARD _IO(0x12,125)
-#define BLKROTATIONAL _IO(0x12,126)
-#define BLKZEROOUT _IO(0x12,127)
-
-#define FIBMAP     _IO(0x00,1)
-#define FIGETBSZ   _IO(0x00,2)
-
-struct file_clone_range {
-        __s64 src_fd;
-        __u64 src_offset;
-        __u64 src_length;
-        __u64 dest_offset;
-};
-
-#define FICLONE         _IOW(0x94, 9, int)
-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
-
 #else
 #include <linux/fs.h>
 #endif
-- 
2.39.1


