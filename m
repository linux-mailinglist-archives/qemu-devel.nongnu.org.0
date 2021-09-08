Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876B403D24
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:58:34 +0200 (CEST)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzy5-0003mN-Fq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkI-0006Ki-9n
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkF-0002PU-US
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id t18so4069528wrb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1oNCjobEi0C1NOmEUdtk3NeeqN+PrcM/TzNlsf9yOM=;
 b=EpnSwzeU2QScpGed7PJkZJSrgXYrYZZQPTAepza6bJt6/1RpHyN6RmBQmZYdIrxAl4
 L0WCwPNYigbQh5WTaBBXuGGaMPca4MKS118RlSmHiaUUpNVIcO0ERD6qbZf041+gT4AS
 hhVzz+BHe9yJJE8WhTtglvoC6dK4KBHr5biWrG2dzZugPPdOgj02wusR/Kgq/ji8Nhnu
 ZLHlkcZPSE+qYjFrF2f4GCgvglqCigM9ICv9grWB2b5+o/1411Q5zQJFmUEy3RolYua5
 Trk5fZOA9EIqRmxqWcMqLc5k4iRV1v37YbV4pGrBClSg3K83HNvtvS9izwhppAiC60Ml
 EkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1oNCjobEi0C1NOmEUdtk3NeeqN+PrcM/TzNlsf9yOM=;
 b=saqNEbShoXnMISayP1qmp3He3Qfosnw4ovquOrVqgnSdBrNm1TEqpvXXblsRu9vgbK
 Pd8bUhikPN6EftpqLCiSEtPA1XIENERMS3q3amiz7dHR+jHWoejT2/EJmKQNiUbwJnh7
 cI0TNIR7f8vHRlnqw3IRAakEBPaZ4RuoU9Eo8O28PrViNck2QzEc30pH0tf8r0PH8CdG
 iq758CQaoTE7aIxiqwhkiGctuPtlm7EwOGBpDz7dQMTQUm45F4ZlJBDNjnfcT+THVKMN
 v2CN5mHZHQyoWXvWaux+MACD6U6Gjsgxt7uOcu8Pzqf4qXOMuFTTwJkti38bJDzPOIB3
 Cwiw==
X-Gm-Message-State: AOAM531guIZA07mEzIV2Sup8rvH6NZPFZsq7PY9+/WHhDg0Pn42Wuidp
 2HXm/s0zj8O32wncthqLDW5KV+HmKPoSOQ==
X-Google-Smtp-Source: ABdhPJy1rUf/LpYbpwYdIjSu3Z3SZYzIH7/OyFUVc6Exh2dKQUKWtULh4tpuSKG0RBLxsTUHRu/ptg==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr4876372wrf.125.1631115854608; 
 Wed, 08 Sep 2021 08:44:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] linux-user: Drop unneeded includes from qemu.h
Date: Wed,  8 Sep 2021 16:44:05 +0100
Message-Id: <20210908154405.15417-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trim down the #includes in qemu.h where we can, either by
dropping unneeded headers or by moving them to user-internals.h.

This includes deleting a couple of #includes that appear at
weird points midway through the header file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


