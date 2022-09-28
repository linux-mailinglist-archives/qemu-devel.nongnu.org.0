Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CA5EE6D5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:52:23 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode2Y-0003w3-Pm
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odden-00082q-9j
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0006OQ-E2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M2OAi-1ofH0v2CKM-003spi; Wed, 28
 Sep 2022 22:27:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/37] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 default
Date: Wed, 28 Sep 2022 22:27:01 +0200
Message-Id: <20220928202737.793171-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4yYHylcm/hicGnxdeGg3X1NBLIwRJnafR/8TYsdjipk3PW4p74y
 K1Ev2g8obI5aThYrDw+gy8Bt4T16Wt4IOQJNeYp2OMFhEbcwk4lRXlvIV9vUWiI3Bj3kglF
 EdKZSWX8t71huKExPXmALoriXV6NboxExxMOmFwXVw80IAFLndkkBT0NhaYjq1v6paisYhm
 RrwQy960c5DmR63sH08Kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:09QB06vxIDE=:rTvy2gbN3gqgC/Zoqguf9i
 TFrgG5Ay2S7yRd82nucCGA/BaKA9e0IURLcfzntZEznAsBCEyqBcJjndxwYtuLHksYwAMAv/X
 dXDKNczDoCN2eyhs5/rK7jAdPktz8m+ZOG9H3XxU4BzkDM8O7z5FiVG6HNlO2GLJywItBMMuL
 5p0XewEgvo5RqRopxK7An4HjvwqwmnpRe/VyETdGVX2FTugiVtGuIZjRe1jheF3ugdn8buWyy
 YoM0wS+t8H09t6SIPRVi6cbPrmxpxNTbEwSqI9pfpvJotEDC8RMn4lu/nbZxSvJdnNnog23Ql
 fpOmeeVro3xdehQK2Knay6OqosVAwuiMulqj8aTV14I+68+8JNTvk6Zaon2KylHBLDIaSGYz8
 yvpxViEuqWKY3d+tcvl36JT7BBtNopTsfcETMHLJfPOSDwWuWgcLtMkEgtPmwRiV09YnRPq+l
 sSbUXCrwpkbg3ulFZV2V3Q0Vp/vyURtzBR3jTQFmmXf9Bkn7BhGldL9Fl7rBo59uI+gxp8n3C
 8/GOfGDFvDebOEclhUkoJ+5yOpieWujb0cFIsYdbpNqqmLH/bcX+JRVVf2vtpQsjmtRd2DyQ/
 F0D6Pb7BSlX+AfNty5UIijbRYsJRk6OMAdB/hHsDXEJgCVahhiAHQacMNYO81MtqPO+NpXLAx
 eMAB7r1Ehi/ksGckpOOBG93PpGzIHp+M5qY2T6vdd6YTCssG2b0KuMi6vtAVt3f5gnXHVNcdb
 VAXoDQwNqVqHKigklys70vcC0u25Ck2oWFxYUMQIZIK0TZoSRT56EaKwmijbfR4Kg7+y0TDQd
 wPEAWtv
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
possible. Historically this hasn't been an issue since it was rare for
OS distros to build with a higher mandatory CPU baseline.

With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
baseline:

  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level

It is likely that other distros may take similar steps in the not too
distant future. For example, it has been suggested for Fedora on a
number of occasions.

This new baseline is not compatible with the qemu64 CPU model though.
While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
usage of QEMU doesn't always allow for this. For example, the args
are typically controlled via binfmt rules that the user has no ability
to change. This impacts users who are trying to use podman on aarch64
platforms, to run containers with x86_64 content. There's no arg to
podman that can be used to change the qemu-x86_64 args, and a non-root
user of podman can not change binfmt rules without elevating privileges:

  https://github.com/containers/podman/issues/15456#issuecomment-1228210973

Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
compatibility with binaries it is likely to encounter in the wild,
and not likely to have a significant downside for existing usage.

Most other architectures already use an 'any' CPU model, which is
often mapped to 'max' (or similar) already, rather than the oldest
possible CPU model.

For the sake of consistency the 'i386' architecture is also changed
from using 'qemu32' to 'max'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220923110413.70593-1-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/target_elf.h   | 2 +-
 linux-user/x86_64/target_elf.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
index 1c6142e7da0d..238a9aba738a 100644
--- a/linux-user/i386/target_elf.h
+++ b/linux-user/i386/target_elf.h
@@ -9,6 +9,6 @@
 #define I386_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "qemu32";
+    return "max";
 }
 #endif
diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
index 7b76a90de880..3f628f8d6619 100644
--- a/linux-user/x86_64/target_elf.h
+++ b/linux-user/x86_64/target_elf.h
@@ -9,6 +9,6 @@
 #define X86_64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "qemu64";
+    return "max";
 }
 #endif
-- 
2.37.3


