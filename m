Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26A3C71E4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:09:27 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J6E-0005q5-Qo
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifo-0000Oo-0S
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:08 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifl-00068J-Qv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:07 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MbjBo-1lRDIb0Qbm-00dH4Z; Tue, 13
 Jul 2021 15:41:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
Date: Tue, 13 Jul 2021 15:41:42 +0200
Message-Id: <20210713134152.288423-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:isS95RAXg48ZRUeQDv5n4W5eRPRdJsQXJRhMg1Xk4Q7yM7YPWnV
 F+3wCiVO0pUCAWOPt2bKt2S0CTOLCgx9zkXXM2NtSv+NlDZfjOp04a2JLmYkl0k6JAz32aV
 XLVZ5reVf/jArCEfCtzELC+J/+ZdljKqq9gbGwzGGcqkMbq9whBohqYpSuCTqn6uxzr+xej
 kbbsaosyrCeouYDHWq0Cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OmYBNZTHEDE=:88wGgim1srk48nIK+jGPhj
 KwiyGifvYXOkoXxYIbM9+GgN5sW018lld6sHA4HgCEcarhOztNCK/k45e+t+aTA6P/pgf3qFE
 0tyiPYJOTHk5Ydv51m2c7KP4qut2XPtp8pW0Lao2XNcpWoOdmDaeHnJH4Vtt4OK41Zv6ueSYq
 kBiKO2DHVMqCIOmIDWjJaN4gqyRHdi2ymin+H9is0AdsLPO0DmPLRW+49JpeQQUHetWMLBx7J
 HWtnnNO0P8n8wlo1IuylZDd7hkXr54Q1C52Tw15Eb7iF4Z9oe24mf08Gl0aoaxjhNZNpfwh8f
 1G5V3gXQAu8FjlqvdzCqtfOFcjchJhY+OpmHB64kSGZPmk/G30VvyGsoqxscNZUvzyfEp7+CT
 DM9SzOYbSG83mV5JoEDc5i2WGK5c/+agb01mz+ov4GpsFTQoHVvrjUogrz53HWcyoNl3lSjWF
 FOviyODg9nx6SQNq9nYqsnlGArsJjBVLiMflbMuia3PX40zCxOc9cBRnxitoxP0Lu3+QC4tn+
 FdDS4/73dhcV/hXrZCA+ok9Zxy1qmvYJz2V4EpAi1QPHBsj7/0ulRuKO+oUA9zba9zcSga/9S
 O3XrZaTBnLnBgEY2g7KVVAus6baIRElYyzt4elJ2tdN4TZuWjcrbJ/SkYpyJbnVWQp7CdshCP
 cekX3CAEPvsxKGrp+4PadODHUO+2mAiYjLgL89U4Qa7EVz8T2HGZiWW/b+mAFmqQqtaz18gnL
 8FsyLadizFIwoa+L2/pmKwWQ5NnbEhFt7C3ea68I9otE5Y4T0V7Tz5mY1TAZklMff/qKn19Mp
 z4IwYyF79KHFZK4lbMPKxm3emFA4f4O7VVLCnh//W6W7yikB05DjKy98TnrtiGzFCKuCMpM
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to have one generic target_errno.h (API to access target
errno), and will add target errno definitions in target_errno_defs.h.
The sparc target already have its errnos in an header, simply rename
it.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210708170550.1846343-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/{target_errno.h => target_errno_defs.h} | 4 ++--
 linux-user/sparc/target_syscall.h                        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (99%)

diff --git a/linux-user/sparc/target_errno.h b/linux-user/sparc/target_errno_defs.h
similarity index 99%
rename from linux-user/sparc/target_errno.h
rename to linux-user/sparc/target_errno_defs.h
index 9b846899cd4f..e00081098674 100644
--- a/linux-user/sparc/target_errno.h
+++ b/linux-user/sparc/target_errno_defs.h
@@ -1,5 +1,5 @@
-#ifndef SPARC_TARGET_ERRNO_H
-#define SPARC_TARGET_ERRNO_H
+#ifndef SPARC_TARGET_ERRNO_DEFS_H
+#define SPARC_TARGET_ERRNO_DEFS_H
 
 /* Target errno definitions taken from asm-sparc/errno.h */
 #undef TARGET_EWOULDBLOCK
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index 15d531f38978..dad501d008cd 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -1,7 +1,7 @@
 #ifndef SPARC_TARGET_SYSCALL_H
 #define SPARC_TARGET_SYSCALL_H
 
-#include "target_errno.h"
+#include "target_errno_defs.h"
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
-- 
2.31.1


