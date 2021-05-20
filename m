Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DCD38B574
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:49:22 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmnR-0003Qm-7v
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhc-0003cm-3d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhY-0001AH-5F
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so5741058wmg.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKAsfqZlgQlw53LEWwrI3OJPttiUgB7fACa4Oi4oEMo=;
 b=bqHD+lij5L2oDyyUpb6mch2z5/zFUVEMoGbvGk5czA5kkmS/e6k6lTgKY8wzdNR2oP
 8Rxmf432QDipJy551BXPnaT4dDlDZbDPxhD/4FrQez0U7ogpDhvuZEwo80nlWIdl0whd
 JlfNfJGD8JWIjEhIqw6KeTNxMCnukTEg2ngZGska+Xf8zDwO75d8IKFsy4ngu1Nh3UZB
 JL/4USirrCjQyQbIVikhsZK3QK3QWJbmEzEYOcGqhlZVSkZCsVS43Gp3RWCDsY8EhqEe
 dW97XCOHi0pMEWuYdIi3DuseBrX095djRbdomabem2BcT9akK5FUHG9yC4fwvejPe1Tu
 rAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKAsfqZlgQlw53LEWwrI3OJPttiUgB7fACa4Oi4oEMo=;
 b=fNG+hCD3Vwky9VHJaSEi1qlO5BGyihzG3iG3w9kT4sbAuoFwp3UXTHBx/8apgKuhVB
 t1AvVxR4MvAgYOaMYHVT0EuEv5bfSAQYHaA/nDObJ+GOS/+YItDAiQmnk3CVLMoqDYOK
 yau/qvbhcC31Q9XGY3tWiYQ3qHeF/Ik5xYzALmRGCY8dZZcjUiz85nCj0pg72jJ9aQ2r
 IzYI6FVo7h6f9zWaYSWAM1ibACPI+V745lKkp7I0FmFvIZ62reUX3rj1hFiCuy6uwF13
 GejYS+FK2i1Z8ydyyalqJ7C68DTcQCGhnefkqBrw6UkcEw6FillfyvYwHJA0tdy701H6
 XBWg==
X-Gm-Message-State: AOAM532CVK+O014uFacTtxP3sGkv3TN+q4CiBQ5859358pLJhSS2gcR9
 XtX79XxE6Tz9hPWgj9XE8z+pPw==
X-Google-Smtp-Source: ABdhPJz4hgMH4uYsRgwm0vfBzEibfU0UHBee84GMp5006dOc2Y2ZFR12rVKp9rdgmCjkOkg/Qf0PgA==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr5262138wmi.118.1621532594868; 
 Thu, 20 May 2021 10:43:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w20sm3540607wmc.44.2021.05.20.10.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D5B11FF93;
 Thu, 20 May 2021 18:43:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/8] gdbstub: tidy away reverse debugging check into
 function
Date: Thu, 20 May 2021 18:43:02 +0100
Message-Id: <20210520174303.12310-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In theory we don't need an actual record/replay to enact reverse
debugging on a purely deterministic system (i.e one with no external
inputs running under icount). Tidy away the logic into a little
function.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

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


