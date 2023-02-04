Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8968AB20
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5x-0005L6-6Q; Sat, 04 Feb 2023 11:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5p-0005CZ-Jz
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-0006wg-OJ
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiIlc-1oiySv3Z0Y-00fV8N; Sat, 04
 Feb 2023 17:08:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/22] Revert "linux-user: fix compat with glibc >= 2.36
 sys/mount.h"
Date: Sat,  4 Feb 2023 17:08:19 +0100
Message-Id: <20230204160830.193093-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jLDCtuDVWRqeSCeV8SbZ7vV4N7WbyyQL5KhzkTrO80M+yTxEe0Z
 5VMfH4BcP0r4f+jNN8N7/AAqnv1frvDO7n0Ulsf8ijQsRdGigEtA1aWEyYhlju+Au144ip+
 1FzeFSRkSZw7j2vatpURWbMkcXpD8jVLZ5cIPPpoT7r/4Desrkv7LsrXf99tzsFpHilmPuk
 4gA5/NGxKyQSRFtg8wUxg==
UI-OutboundReport: notjunk:1;M01:P0:oMB9u0CgNqs=;EnNLq5PfsrVH2dItMqTh1ytfGf8
 y7BEN6Il2IVGAihtFGn/c7Dga/Y3CWSKWs7KsHcaYn3zPAaRa28uYhFOssw8MY1xpEldzEdpK
 9mCEc8zfL6nyzguv+gAgoXnzi5IsG2Wd0s2cFJDLIruc1ebs26WoHdncpdmsOrNSVTL4O6xQA
 ruBtzapg5SEZeg3lbuzUbOC81mXdnv4TiY2VwyNuHV9yGWhBwMhInGdaqP5xS0+RADOpp50/J
 XDZOOOjKArL/DjDzbqFalwhIhdY/WStJLEJJK0yocfv1SFBZB45Nk8cBNWrlTJTMDkp11uhNn
 eV3OM9TXCuP2/xvr+HgscWR6d4muAPDNMhbsDxj8gH8appybcInGZxcSGTtXS/5NeDcGitSyE
 aX2u58hhPI5Hz2MistphlPSgtqQxfDyEuRGrHQAuBi8DxVkmkQ/1WSzsjU6O+OwqWRpWZcOH9
 7EvUL8qYQvQxXngGHkkCsreg9RGKVmHvcJBRbOaur7Ev+eF9klTlg+BTya+mepiXaq+XrF+HW
 XqdrXbBzsn7ZrUfH7YCRjFL+RsKepHR0lPJAL+4Y1ENvQ9xAPMOKWjoWz4Wn3Zqs6RuyyesgL
 dVhB2TdcW99B0uJ0uZ6/bUn5HGTYd/b5QF5FPXiCqB8c4BGsOyzl2GthqfMXGRLdpmfk3dsqm
 hoDcGg5IcCmDMOcYKSTe85TQcL2qtPtX7/XGDUqN5w==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.

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
Message-Id: <20230110174901.2580297-3-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 18 ------------------
 meson.build          |  2 --
 2 files changed, 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b88f8ee96f0f..210db5f0be94 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -95,25 +95,7 @@
 #include <linux/soundcard.h>
 #include <linux/kd.h>
 #include <linux/mtio.h>
-
-#ifdef HAVE_SYS_MOUNT_FSCONFIG
-/*
- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
- * which in turn prevents use of linux/fs.h. So we have to
- * define the constants ourselves for now.
- */
-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-#else
 #include <linux/fs.h>
-#endif
 #include <linux/fd.h>
 #if defined(CONFIG_FIEMAP)
 #include <linux/fiemap.h>
diff --git a/meson.build b/meson.build
index 6d3b66562975..cccd19f864e3 100644
--- a/meson.build
+++ b/meson.build
@@ -2046,8 +2046,6 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.39.1


