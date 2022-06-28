Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC455BF35
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:44:31 +0200 (CEST)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65te-0003Ey-HS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fo-0003Kv-1R
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:12 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fl-0008NA-VI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so3965904pjs.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DuF5Y9ugc2vh1YcdXplN2TQNBs2y+b/t7ZKHYCfY2p4=;
 b=ixA+V6iDPANT2bm5QfVw2aDvOn7ebl2sJInzmb1uUbOO+8hzf0YRyU/rHgWURKAbKr
 z2IbeaBy0exuZ9pwbUXZkW9QH3xsVoIWoDFCSCn4R/XwQpbkNLxlekIMRTdAp5BB9ggs
 S7Vzm4IC+F3TJgcsAKpQib3XuLDiC6CMQ9NuuVJGJ9JfbkvX47PvJRXd+Y7uXhVI+LW7
 8bCunHGkUYo50lEuNjgLy31x5rK2N2llH6r519FkGFqkt6+2jnkBtDDNPNcaDgEvnz78
 EeBfiBeMHoyRiWoYi4y3nP4r7yO3zQvMA2CbDdichY23Yss5Pt1qLKcOYS8XxrgzyoUx
 gnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DuF5Y9ugc2vh1YcdXplN2TQNBs2y+b/t7ZKHYCfY2p4=;
 b=nRaLXNHa2nqOLsiAtOvLJJ/ES82OtLwrReIhaccojoY20aZ4t1tiseitSbcmQiOaA2
 lfVqVuwrr3jdSXqZ8fKQ1XyNd0qD804ormnSU5i9bZlXm0p/5w7OUibqauE36IbuAur4
 UnAenEi4CiFUbV4xKEyCIwp2mM8FNYJ7oDtirqirRRLRtyqXCWdLV0AmCIG3V/dBaJ5g
 LHGo9x3537FaUBxjYG9UXIahDCunXqpVzGLfohDI5cdJiMQM9jyUhf2eO1Z1WsuTRux8
 M7ttBqngRZ1iay0uEIPGguuLS8Ur5cL9KVmeuRkY7Ttu6Bz/O+Zzzb0FfmnQFolQVYrk
 OejQ==
X-Gm-Message-State: AJIora8wHee2RwMQerkpyKIcm/BeNqXc0Q5789sHjpHWYPpqcYT/w/k0
 coV3m7hXCMGuL8gmD5R37Nggz621EKVZbQ==
X-Google-Smtp-Source: AGRyM1t08/1xnPx8s54jk57ZHM54Pa+AYUeCX0IJ8K39YIdMmq6nNUGY5kN8RuK+TIDjbEryKqdOTA==
X-Received: by 2002:a17:90a:31c1:b0:1ec:729f:36b7 with SMTP id
 j1-20020a17090a31c100b001ec729f36b7mr24534959pjf.123.1656392108549; 
 Mon, 27 Jun 2022 21:55:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 25/60] semihosting: Use env more often in do_common_semihosting
Date: Tue, 28 Jun 2022 10:23:28 +0530
Message-Id: <20220628045403.508716-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We've already loaded cs->env_ptr into a local variable; use it.
Since env is unconditionally used, we don't need a dummy use.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5e442e549d..adb4e5b581 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -553,7 +553,6 @@ void do_common_semihosting(CPUState *cs)
     GuestFD *gf;
     int64_t elapsed;
 
-    (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
     args = common_semi_arg(cs, 1);
 
@@ -636,12 +635,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(cs->env_ptr, args);
+        qemu_semihosting_console_outc(env, args);
         common_semi_set_ret(cs, 0xdeadbeef);
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
+        ret = qemu_semihosting_console_outs(env, args);
         common_semi_set_ret(cs, ret);
         break;
 
@@ -672,7 +671,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(env);
         common_semi_set_ret(cs, ret);
         break;
 
-- 
2.34.1


