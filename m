Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4302C36AAE7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:00:09 +0200 (CEST)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larTk-00065v-9T
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNm-0007yV-3U
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNb-0007aB-TX
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso4405011pjn.3
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kHj7Bgo8QZgP8XeIjGIpJnnzw5GIweukUt15ok1mmwM=;
 b=IDQBJBhPPNQaWdsJZOqETgyn+/TJd0xlnM1toSU0t+tk+Woy/caWrJGHEQtTGhImWm
 7i0hkkw8Vlt1GWxkwhESPiLKN9SgUr5hSbo+NT5Gcq8ZNR+ypHYGI5Zs1EQ7bUFIlvsF
 0u7pnkPIrs3bcrIbb29CXCwJgZW4u1PZM3Gw8dbtQkosDqC2gtJHH+1DAQAzWxvbvLut
 8Vqnbya4e4KxOWoZGyZ3l9KJG+uzhZ+eK0o43ZBWXu42gG4IhyXTWp/p7Uij15L5ivZ9
 qMlcgsTW0vJLJ/82ReOF8ILePrzbH9aon0jh6FDXQU79Xem3Or7jIm8MwWhJGyFw+kJ0
 ulIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHj7Bgo8QZgP8XeIjGIpJnnzw5GIweukUt15ok1mmwM=;
 b=AAutP6o4ug6Lg9KWGhhRUty/+0fPCg/FyVFIqXyO01WGFdgX+f16DP7I8+wvMwC1ck
 zfkhKR8dHq2JvKn8ZLeX7BDy1rCzyTZrXfQxd+afryh+uFdyBTEMm4g9fXBfwAWdib15
 iMjUcHzWvuTQV2I8YHEpiiOXfZ2Mhw90Zp3iT0hHleLIs8hp3YGgWWBY6WdK1WqUxJXV
 QV4fCBMG4aUTIHDQ0ZvhXc0+xTYS+epvHEk/FzolGtDk4HUPri+thn5st40WTTwnN5qN
 ICHH7Xvm2QPLIFF8VtndYTUIbVnxSV+9TP0DULNCu8YWBRVVXkw9MoMgdO7H0w6UO7Jm
 N7uQ==
X-Gm-Message-State: AOAM531OngH//daIx1uxW6YTcCxrM5nLabJI0yn4GpHSLWkrxzn0CaDk
 Ri4dC9f5qEhtaxnPMhXGchxHnHC9STpO9A==
X-Google-Smtp-Source: ABdhPJw0Br2FHFAam3lxO7VTIuw6RZO5RWYVudLgBSW3kUQrUkW4YnMLSG1D4IrKqX8zfHOSID6+Zg==
X-Received: by 2002:a17:902:f547:b029:eb:5270:8774 with SMTP id
 h7-20020a170902f547b02900eb52708774mr16008898plf.5.1619405626725; 
 Sun, 25 Apr 2021 19:53:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/25] linux-user/sparc: Split out save_reg_win
Date: Sun, 25 Apr 2021 19:53:25 -0700
Message-Id: <20210426025334.1168495-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0d9305818f..69fee5a76a 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -150,6 +150,18 @@ static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     }
 }
 
+static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_L0], &win->locals[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_I0], &win->ins[i]);
+    }
+}
+
 #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
 
 void setup_frame(int sig, struct target_sigaction *ka,
@@ -183,12 +195,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i + 1], &sf->extramask[i]);
     }
 
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_L0], &sf->ss.win.locals[i]);
-    }
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
-    }
+    save_reg_win(&sf->ss.win, env);
 
     /* 3. signal handler back-trampoline and parameters */
     env->regwptr[WREG_SP] = sf_addr;
-- 
2.25.1


