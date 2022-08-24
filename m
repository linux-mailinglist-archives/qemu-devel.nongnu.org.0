Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C259FE6E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:36:06 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsQG-0005KN-LR
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjm0616@gmail.com>)
 id 1oQpoK-0004Zf-1r; Wed, 24 Aug 2022 08:48:44 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjm0616@gmail.com>)
 id 1oQpoI-0002f4-9w; Wed, 24 Aug 2022 08:48:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c2so15591745plo.3;
 Wed, 24 Aug 2022 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cgl+VQ9YlMizuM+yGKqALI233IBvK5ikfdNhgructpQ=;
 b=MLFcN+5d8h2aDViMf2I6Mes1ZDawmh1ziOOyphUWO3QfK2esOS1LvOwGXRkXc9Iwie
 mJNecgCThE1El6GKeI4f9rlderqoS/rwkP2wOeGS5wbQn6LM6dA6sMj/+dCazv6nLa0m
 Byr5vCEAPTYoGJUUav/nZnIWPydxv3gQ/i1s/owJ5zXNNmf8fel/5EcK3psOD/TeGONa
 GgcdsrsU3qQtiHMVycEWTSzUdSbX6/B5FK+MZtEbYhC8m+EnkpWM9w7kA4IzCv9xR6T5
 mvzK++Q+eO0ffhZ8ZeBeOo4+D7a8uqqL9khHcAKlPgjUu4DdpGE+TaHSupTjY7VlvaPT
 MBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cgl+VQ9YlMizuM+yGKqALI233IBvK5ikfdNhgructpQ=;
 b=bVAErBerfvI5/G4C1kCZhf0wYjOd0YDoQpgm61lJfoOpxkOm+Is1sHs7orl/OoQaF2
 rnHEo9L5ZEq69sW9N55SidUph5hLwUUL/dvHQrZBv5vnCadeDILURr53d9XSRL2k4T7r
 0WAe5FYBf/q3DhG13TzxtL7OA0UxRnmj3SA2f0CvSOj9H2t3tDqcC8+zjPcMnHUERpiT
 ZXfIgOzhHJUvcDIFERHPuwNQJ+xL13cFYiZ8YJ/MvN/PWCyWUaMC7I6Cb9ZjZJvCed5W
 n4FFvfUsPJ6vVnGCTPVWDTKdlOlgEeskgojoRHRt7T1Xd95Z8+vDJK8mDJkGWAeK4f7H
 tffQ==
X-Gm-Message-State: ACgBeo1Kc9AVU1uxdStOTabhWBR6ikHGSG0NE3DL4IPbRMmFfTdDpBRt
 w2RexS4ld+IUzqeLSNctPlQQ5hwVtQj43FKY
X-Google-Smtp-Source: AA6agR441b1z/tTifzGyLnSwrT/8jmt2jk8AV636NDvGbhSSuAcNP0l5eSaLpNgvo4bvpwBDV1h2QQ==
X-Received: by 2002:a17:903:2585:b0:172:9ac6:30f3 with SMTP id
 jb5-20020a170903258500b001729ac630f3mr28863757plb.0.1661345319663; 
 Wed, 24 Aug 2022 05:48:39 -0700 (PDT)
Received: from pjm0616-laptop.. ([59.10.96.165])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a17090aaa8a00b001fb277223bdsm1318157pjq.2.2022.08.24.05.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 05:48:39 -0700 (PDT)
From: Jungmin Park <pjm0616@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jungmin Park <pjm0616@gmail.com>
Subject: [PATCH] crypto/luks: Support creating LUKS image on Darwin
Date: Wed, 24 Aug 2022 21:37:06 +0900
Message-Id: <20220824123705.2084720-1-pjm0616@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pjm0616@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 24 Aug 2022 11:29:31 -0400
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

When the user creates a LUKS-encrypted qcow2 image using the qemu-img
program, the passphrase is hashed using PBKDF2 with a dynamic
number of iterations. The number of iterations is determined by
measuring thread cpu time usage, such that it takes approximately
2 seconds to compute the hash.

Because Darwin doesn't implement getrusage(RUSAGE_THREAD), we get an
error message:
> qemu-img: test.qcow2: Unable to calculate thread CPU usage on this platform
for this command:
> qemu-img create --object secret,id=key,data=1234 -f qcow2 -o 'encrypt.format=luks,encrypt.key-secret=key' test.qcow2 100M

This patch implements qcrypto_pbkdf2_get_thread_cpu() for Darwin so that
the above command works.

Signed-off-by: Jungmin Park <pjm0616@gmail.com>
---
 crypto/pbkdf.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/crypto/pbkdf.c b/crypto/pbkdf.c
index 3775ddc6c5..8d198c152c 100644
--- a/crypto/pbkdf.c
+++ b/crypto/pbkdf.c
@@ -24,6 +24,11 @@
 #ifndef _WIN32
 #include <sys/resource.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <mach/mach_init.h>
+#include <mach/thread_act.h>
+#include <mach/mach_port.h>
+#endif
 
 
 static int qcrypto_pbkdf2_get_thread_cpu(unsigned long long *val_ms,
@@ -45,6 +50,24 @@ static int qcrypto_pbkdf2_get_thread_cpu(unsigned long long *val_ms,
     /* QuadPart is units of 100ns and we want ms as unit */
     *val_ms = thread_time.QuadPart / 10000ll;
     return 0;
+#elif defined(CONFIG_DARWIN)
+    mach_port_t thread;
+    kern_return_t kr;
+    mach_msg_type_number_t count;
+    thread_basic_info_data_t info;
+
+    thread = mach_thread_self();
+    count = THREAD_BASIC_INFO_COUNT;
+    kr = thread_info(thread, THREAD_BASIC_INFO, (thread_info_t)&info, &count);
+    mach_port_deallocate(mach_task_self(), thread);
+    if (kr != KERN_SUCCESS || (info.flags & TH_FLAGS_IDLE) != 0) {
+        error_setg_errno(errp, errno, "Unable to get thread CPU usage");
+        return -1;
+    }
+
+    *val_ms = ((info.user_time.seconds * 1000ll) +
+               (info.user_time.microseconds / 1000));
+    return 0;
 #elif defined(RUSAGE_THREAD)
     struct rusage ru;
     if (getrusage(RUSAGE_THREAD, &ru) < 0) {
-- 
2.34.1


