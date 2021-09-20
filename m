Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B47412890
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:56:58 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRHV-0006O9-Gh
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6n-0003qU-6B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6k-0002Jt-Ja
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id i23so33596435wrb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=XXWbgm00iFE49HHklH+65W3NSXsyBxKCO3toTe5wWWbF1ObCV3po2sc6QJtfvpfaZJ
 YFudGo+SmPJ32wTb9I0PUmtCAAiAsHBnnocCS5r0cfSgsiuN+f0Zvg9mIi1SSxAzxtTz
 W01WC+Vft/+sc1foBHNJGyd++ccpSPiEmmeU2jVBmH71XV1mh3G8iwTPKHO7P9j2um/s
 QY0hve//5/T3lRTwSxX6/jLV/uLh8YSJLIjxMLHY5yOoBQQhi96Ap864Pigc6k3g3ZXD
 od8bRC69lezBl1sf2vruoja1hUzQ6p9kbZ5pP85uFwzjxjp2haqtEGFS5JD5wK+VEvz+
 gwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=LWpBlKPMVj40z/PdtXhEYATGNLNrjvRCLSzLSJasgjXyCtx/m3gner9haTL7Ycx4jU
 wNldu2WD0OapO86e3K+JaUQqZjuftv0+Oizsgwgd11zDxFeXwf4R9DxjGs/+rI5JVmy0
 5hbFHNKgKRCKgR+MdsXjWp5k7anJeLhdWJEv79OdibBYpneRMfbHRNz5Yi4Ii/BqST/i
 CVIG5J/oY974+gBkJ0usLpRS1UisVB0Vxw8g1FXdOk6Ak+4vWJHA5rDdjRXc83d4+SI0
 YJ0+zyOYk7IdxwzutHZpBx3HgCigulCgrX430B/z2GzfdI+lytwd1VwzbFk1MpHWORcW
 SiBA==
X-Gm-Message-State: AOAM532uYgp+ZSRb8l3Z0/cDMF+pMWbajXNQt7e3nR6wQwCElsDZoQZ4
 efDCL7f6FzlsNsBxxcaHbTdtXE2NqvI=
X-Google-Smtp-Source: ABdhPJx3sEOoaRnZAjzz4menBb98jEQ1nRLMMAiug+EK3o7sOUwTfrs1mliJifjmc65H7zAEGO/G3Q==
X-Received: by 2002:a05:600c:4e93:: with SMTP id
 f19mr1102543wmq.185.1632174348453; 
 Mon, 20 Sep 2021 14:45:48 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 b187sm684413wmd.33.2021.09.20.14.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/31] target/hexagon: Remove unused has_work() handler
Date: Mon, 20 Sep 2021 23:44:29 +0200
Message-Id: <20210920214447.2998623-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


