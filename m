Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D130C3CC6C4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:26:56 +0200 (CEST)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4thv-00055v-TW
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcS-0001mT-Cx
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcQ-0000kl-2d
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so8062856wms.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MAEIGkxboaQ7/sKH4/N7ZsnrjiQlrtgLB/5WpkDnOs=;
 b=cqY1oFqGRGwvHn34Quim+J2Q1f6p6XxaH0Xh7IRjLZfYsvM1K2tWplrNPIF9aeo/oV
 Ugoy7oJJQR9LMY4brG6wrHf+S5vqJWKfbkSNF7kTKP69zhEpJ44PZAamVegGkFui+w9Z
 BcIWiwsOuHMg+4FooKKvscqk9wW5Aa4oiCzOAaB844nWnhqVzCCa+w+WVhMndMC3qycZ
 9eblLz+Of+KkTy8ULSTkor+AKr1ZDsrP3KjLHIOTfjTR8rgYgl4Kk8Kx1VHMcQ+RbZ1F
 jx5PrNSiD91DILFjl6LLjhVQ2fbx6rCTFSFnDL9l0abDIR0ZSzKGu4q8DgnVYoMRFstj
 kOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MAEIGkxboaQ7/sKH4/N7ZsnrjiQlrtgLB/5WpkDnOs=;
 b=YWiJ9Hq0DhPJ8o2ZScFkIarWIIpuznQdk+NRR52yFBot8RuVuyVNV+vp5gZqfJlD/l
 ReYiI8zRHR6eJE46gS2powpDD/K0BhKsAsRJD1UYlvchSPVe9puAuQNWtfXT7A+l1Gt1
 YcvBKgFNQ6Izbp+DKuLx7Ke8jIpGaVixSu8wYjZVhPSN1m/5V36fWW7blBtOquOBf4ei
 FpOdCiQlT2pPHuJjdHRg1q8QNQBlpVJ5fF8PMuoNZx07Sn2B9lW38N8v+RvekT9QzJru
 B3c0bk3SBx3uOBtvLV+8aMheV0xVNV/2zxKESATX6s5QNwoC2QxNLdAXS3m0ngof89j0
 +Pxg==
X-Gm-Message-State: AOAM5308hOemiWF0buKbupYr7Xa/F1Y48HE4L0iC4PJtb06Fg2Ls+794
 MyzknImanX2zl5wFFmyzLYt8UOfVLBekKQ==
X-Google-Smtp-Source: ABdhPJwVZFu7N6AxjUoRuVJARUUu0uYDAN1pCizZ7U8j3dn1TyHYr09Eoz38qU/sLFm/GYqQVQkbJQ==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr23836061wmi.159.1626564072785; 
 Sat, 17 Jul 2021 16:21:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/10] linux-user: Drop unneeded includes from qemu.h
Date: Sun, 18 Jul 2021 00:21:02 +0100
Message-Id: <20210717232103.18047-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trim down the #includes in qemu.h where we can, either by
dropping unneeded headers or by moving them to user-internals.h.

This includes deleting a couple of #includes that appear at
weird points midway through the header file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h           | 4 ----
 linux-user/user-internals.h | 2 ++
 thunk.c                     | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index fda90fc28d6..5c713fa8ab2 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -2,7 +2,6 @@
 #define QEMU_H
 
 #include "cpu.h"
-#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
 #undef DEBUG_REMAP
@@ -163,8 +162,6 @@ typedef struct TaskState {
     struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
-#include "qemu/log.h"
-
 abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
@@ -349,5 +346,4 @@ void *lock_user_string(abi_ulong guest_addr);
 #define unlock_user_struct(host_ptr, guest_addr, copy)		\
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
-#include <pthread.h>
 #endif /* QEMU_H */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 1729a8b62e1..661612a088b 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,8 @@
 
 #include "hostdep.h"
 #include "exec/user/thunk.h"
+#include "exec/exec-all.h"
+#include "qemu/log.h"
 
 extern char *exec_path;
 void init_task_state(TaskState *ts);
diff --git a/thunk.c b/thunk.c
index fc5be1a502e..dac4bf11c65 100644
--- a/thunk.c
+++ b/thunk.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 
 #include "qemu.h"
 #include "exec/user/thunk.h"
-- 
2.20.1


