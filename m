Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D068AB10
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5s-0005At-LT; Sat, 04 Feb 2023 11:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5l-00054q-6h
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:42 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5h-0006u9-TX
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:39 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWBGG-1p8W8u2nRy-00XY5X; Sat, 04
 Feb 2023 17:08:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/22] linux-user/strace: Constify struct flags
Date: Sat,  4 Feb 2023 17:08:09 +0100
Message-Id: <20230204160830.193093-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ww6E4GBQVIgoAwjoBcEGp8wxBInQNIbPz0KfCNPVFzuEExhcso9
 muF7eOly0bBuTo5C8NX/tLG0xufWG2p7YfSvIW0nRsA0usbodWvcFggd7P9dW8WjFkxtfbK
 a2WgxE0wxQ84upSWKKm3MXbFgXY19QgED2Z+ZMNy+hpEkuABbkPhyaK7rNdRFbg/IV9SJnd
 ud/G8kLTjGn+Hc/o9jx3g==
UI-OutboundReport: notjunk:1;M01:P0:Kqdqdyhosj8=;vSrnSoHtRzrSP9f8oJSQhc2xSb4
 cVOvCex2tGjmfc30PHoNlzjjEW7ijdgIMLQ5SJ37QYCs05BVGbLq8TOSL0FOqLlFh906MHg6p
 EyN1I4kvAJU0cZZj/YM59jh1VZAIkhpYwtaaWtu7OT5c1W8H+O+5N3dsJxKhFsfB4IyPadXAO
 gQnTh5JzeLLzsJIy8aso5rQnwNbCga0gINVvYSQunfD3xnZprzyel0mkoBlHcahVJqdKw2byF
 vGVJe4WmZNMWiWmokvigQORm4OmwYHN2eOlRP3Xi+i7GIfq1BJbbKwIu4tb2K2epcQMzgBlxS
 nmMmJhb/a14Y8/Wr6wEAkce/4nOXjZOzWqSBXIBLUgMn66WGqVw1kw/0WIrY00DgMx2xGdWYF
 ZbfQsMcjg9McsSw7/3MOuGTNZVACMGL/D7js8c4EVoEx1yufjnpSHveaoyEOwd1cXhIN89CxB
 1GguS5cGuWRhJEDnFHWgKODP97dbNK5cW2BHmwKnrUibbgvBBwv/ZITmFJcycqD/I0St7HQIU
 FhXBpYrYD7kMvXBYbPQyVFcZwOahMXO0MNHZuaDGPb+kvkzzpWJuQF3NyjOvzl7eZaXwKpMJC
 XYs6Xa0TTrTnVuCgj6jPacE6YIorLfLMFVGZxyGbIbkzzWUKQc7mTdHsyOUpEVoY732nGMxkc
 rFBH1Q1Gq9Tx1o9jusp0M3f2XL/+A2ysw7i38A0emw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

print_flags() takes a const pointer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104173632.1052-2-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd71..25c47f03160d 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -945,7 +945,7 @@ print_syscall_ret_ioctl(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
-UNUSED static struct flags access_flags[] = {
+UNUSED static const struct flags access_flags[] = {
     FLAG_GENERIC(F_OK),
     FLAG_GENERIC(R_OK),
     FLAG_GENERIC(W_OK),
@@ -953,7 +953,7 @@ UNUSED static struct flags access_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags at_file_flags[] = {
+UNUSED static const struct flags at_file_flags[] = {
 #ifdef AT_EACCESS
     FLAG_GENERIC(AT_EACCESS),
 #endif
@@ -963,14 +963,14 @@ UNUSED static struct flags at_file_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags unlinkat_flags[] = {
+UNUSED static const struct flags unlinkat_flags[] = {
 #ifdef AT_REMOVEDIR
     FLAG_GENERIC(AT_REMOVEDIR),
 #endif
     FLAG_END,
 };
 
-UNUSED static struct flags mode_flags[] = {
+UNUSED static const struct flags mode_flags[] = {
     FLAG_GENERIC(S_IFSOCK),
     FLAG_GENERIC(S_IFLNK),
     FLAG_GENERIC(S_IFREG),
@@ -981,14 +981,14 @@ UNUSED static struct flags mode_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags open_access_flags[] = {
+UNUSED static const struct flags open_access_flags[] = {
     FLAG_TARGET(O_RDONLY),
     FLAG_TARGET(O_WRONLY),
     FLAG_TARGET(O_RDWR),
     FLAG_END,
 };
 
-UNUSED static struct flags open_flags[] = {
+UNUSED static const struct flags open_flags[] = {
     FLAG_TARGET(O_APPEND),
     FLAG_TARGET(O_CREAT),
     FLAG_TARGET(O_DIRECTORY),
@@ -1019,7 +1019,7 @@ UNUSED static struct flags open_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mount_flags[] = {
+UNUSED static const struct flags mount_flags[] = {
 #ifdef MS_BIND
     FLAG_GENERIC(MS_BIND),
 #endif
@@ -1044,7 +1044,7 @@ UNUSED static struct flags mount_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags umount2_flags[] = {
+UNUSED static const struct flags umount2_flags[] = {
 #ifdef MNT_FORCE
     FLAG_GENERIC(MNT_FORCE),
 #endif
@@ -1057,7 +1057,7 @@ UNUSED static struct flags umount2_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_prot_flags[] = {
+UNUSED static const struct flags mmap_prot_flags[] = {
     FLAG_GENERIC(PROT_NONE),
     FLAG_GENERIC(PROT_EXEC),
     FLAG_GENERIC(PROT_READ),
@@ -1068,7 +1068,7 @@ UNUSED static struct flags mmap_prot_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mmap_flags[] = {
+UNUSED static const struct flags mmap_flags[] = {
     FLAG_TARGET(MAP_SHARED),
     FLAG_TARGET(MAP_PRIVATE),
     FLAG_TARGET(MAP_ANONYMOUS),
@@ -1092,7 +1092,7 @@ UNUSED static struct flags mmap_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags clone_flags[] = {
+UNUSED static const struct flags clone_flags[] = {
     FLAG_GENERIC(CLONE_VM),
     FLAG_GENERIC(CLONE_FS),
     FLAG_GENERIC(CLONE_FILES),
@@ -1136,7 +1136,7 @@ UNUSED static struct flags clone_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags msg_flags[] = {
+UNUSED static const struct flags msg_flags[] = {
     /* send */
     FLAG_GENERIC(MSG_CONFIRM),
     FLAG_GENERIC(MSG_DONTROUTE),
@@ -1156,7 +1156,7 @@ UNUSED static struct flags msg_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags statx_flags[] = {
+UNUSED static const struct flags statx_flags[] = {
 #ifdef AT_EMPTY_PATH
     FLAG_GENERIC(AT_EMPTY_PATH),
 #endif
@@ -1178,7 +1178,7 @@ UNUSED static struct flags statx_flags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags statx_mask[] = {
+UNUSED static const struct flags statx_mask[] = {
 /* This must come first, because it includes everything.  */
 #ifdef STATX_ALL
     FLAG_GENERIC(STATX_ALL),
@@ -1226,7 +1226,7 @@ UNUSED static struct flags statx_mask[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags falloc_flags[] = {
+UNUSED static const struct flags falloc_flags[] = {
     FLAG_GENERIC(FALLOC_FL_KEEP_SIZE),
     FLAG_GENERIC(FALLOC_FL_PUNCH_HOLE),
 #ifdef FALLOC_FL_NO_HIDE_STALE
@@ -1246,7 +1246,7 @@ UNUSED static struct flags falloc_flags[] = {
 #endif
 };
 
-UNUSED static struct flags termios_iflags[] = {
+UNUSED static const struct flags termios_iflags[] = {
     FLAG_TARGET(IGNBRK),
     FLAG_TARGET(BRKINT),
     FLAG_TARGET(IGNPAR),
@@ -1265,7 +1265,7 @@ UNUSED static struct flags termios_iflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags termios_oflags[] = {
+UNUSED static const struct flags termios_oflags[] = {
     FLAG_TARGET(OPOST),
     FLAG_TARGET(OLCUC),
     FLAG_TARGET(ONLCR),
@@ -1349,7 +1349,7 @@ UNUSED static struct enums termios_cflags_CSIZE[] = {
     ENUM_END,
 };
 
-UNUSED static struct flags termios_cflags[] = {
+UNUSED static const struct flags termios_cflags[] = {
     FLAG_TARGET(CSTOPB),
     FLAG_TARGET(CREAD),
     FLAG_TARGET(PARENB),
@@ -1360,7 +1360,7 @@ UNUSED static struct flags termios_cflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags termios_lflags[] = {
+UNUSED static const struct flags termios_lflags[] = {
     FLAG_TARGET(ISIG),
     FLAG_TARGET(ICANON),
     FLAG_TARGET(XCASE),
@@ -1380,7 +1380,7 @@ UNUSED static struct flags termios_lflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mlockall_flags[] = {
+UNUSED static const struct flags mlockall_flags[] = {
     FLAG_TARGET(MCL_CURRENT),
     FLAG_TARGET(MCL_FUTURE),
 #ifdef MCL_ONFAULT
-- 
2.39.1


