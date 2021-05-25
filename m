Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143E38FFF7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:29:15 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVFK-0002pP-IH
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVB0-0002V8-QP
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAx-00030E-G0
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id u133so16523420wmg.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4q5N6WoamWwCZ9NCTtf7vTo0CQZJFAXL5GXjETh6BsU=;
 b=nmQfk1HsyGK4u9cOWfOtYKcT27GxUorCyvFmQyV7CHvhdCzZNOGtyHqX0RyF3M8ymx
 0WnK2j0mDFQ1k3+6ZOATkeu1TvJ8bNGE7nj2yRi2/ijpT5tRKWwALrhGGj4lopCXCSRD
 PryVfVZp4LAnR2ZEkAvQimZGYbctfoofUupBkN3EKd8BXpV+Kgc3B6Sp7t7VJjJFKqpi
 jayAhc2V5nC7c8lMQaWxLBSN6Y0ALQbIF0JxFdKLQ0IT/FHS8N6SnGGZrBV+uXc1oVq1
 7wn9yhgkrJpHL6fuusBl/oVtkxHobSJz4w86ZtC/2ds0LV297RiOswW4vXs3FU84fAnN
 +9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4q5N6WoamWwCZ9NCTtf7vTo0CQZJFAXL5GXjETh6BsU=;
 b=jfKkqQyRnTb0/Xe+fU6XSRzdOfr4bT8lV30h4bEbEhF43enK99NT3YR6i6vjvnB9b8
 Pk6YZaZZvJ5DP4WRJoxk5Os7vNuHNlrpTlZ9IOfQ5k6+lchM0rPZiza9yYMCtmAjQUBY
 KFfp+TCa/PNtjY0321t2UCIQ0Is578DfAwQdSxIvU511mBWRIItrKp5dk+CG0fRCuNc+
 UPuIW0kkVQGqxnGMCo1Fx/hVNQfe98VuLFWHDHLGTRXxgdmZwBnsxr8PfOdErIVDJUaM
 Q+O3VAiwwJZWyLVxYrUVcRaLKXslQakIREdgO234zUo9629+52N58eIzOnegDePdlclk
 89VQ==
X-Gm-Message-State: AOAM530wAYyOR9ue3x8HPPdDsIWZw7D94nP4ZhJYEndx3E2B5R/x9n3O
 +r4/ELoAkigOHPCgvN9MnIlbSQ==
X-Google-Smtp-Source: ABdhPJx+mBgDPqg34T4ldfNUOZcnTxdK0I2DBzjsdYV8e726pEG8DS81mm+VVTq444MyIO5MSQHU7g==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr22571908wmq.173.1621941881994; 
 Tue, 25 May 2021 04:24:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i12sm15176387wrn.94.2021.05.25.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F8AA1FF92;
 Tue, 25 May 2021 12:24:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/7] gdbstub: tidy away reverse debugging check into function
Date: Tue, 25 May 2021 12:24:30 +0100
Message-Id: <20210525112431.22005-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In theory we don't need an actual record/replay to enact reverse
debugging on a purely deterministic system (i.e one with no external
inputs running under icount). Tidy away the logic into a little
function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210520174303.12310-8-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index 84ce770a04..52bde5bdc9 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -465,6 +465,15 @@ int use_gdb_syscalls(void)
     return gdb_syscall_mode == GDB_SYS_ENABLED;
 }
 
+static bool stub_can_reverse(void)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    return replay_mode == REPLAY_MODE_PLAY;
+#endif
+}
+
 /* Resume execution.  */
 static inline void gdb_continue(void)
 {
@@ -1880,7 +1889,7 @@ static void handle_step(GArray *params, void *user_ctx)
 
 static void handle_backward(GArray *params, void *user_ctx)
 {
-    if (replay_mode != REPLAY_MODE_PLAY) {
+    if (!stub_can_reverse()) {
         put_packet("E22");
     }
     if (params->len == 1) {
@@ -2153,7 +2162,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
-    if (replay_mode == REPLAY_MODE_PLAY) {
+    if (stub_can_reverse()) {
         g_string_append(gdbserver_state.str_buf,
             ";ReverseStep+;ReverseContinue+");
     }
-- 
2.20.1


