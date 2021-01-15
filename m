Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C42F7D01
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:46:28 +0100 (CET)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PQp-0006lG-2l
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P0A-0005GV-0K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P04-0002Lk-AA
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id c5so9249525wrp.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muCsYbQEcoe3YnIMkqZAOUWb9L93swjFn/KxNUvS9X4=;
 b=cm8QpXwUSuihR+6C1Lt4bH5gTT4ymKGuR4utKpSgrPJWxHtmewtUJWMvcprAHu19ab
 mGdKHYYvCPfTIngViG77DmRbcRl26YTCLots5v6pn8tefs/WtXhK5a6rVuET2e98PGi7
 uEuBYDho8BCt6P5hvwO+vmH17MFU1ljKwT2wXUr3QKgRkMbItJEZHqv24ibmfWjHQG7L
 cGyv5eBkZVggVXANqQRJCphn64u+x4iipyYnvwllUahpM5IvL8U0MM3kERKOdPgH3Mw2
 VY5NUtqRjwVYrpU384pq68yEJ8PuQFht0mkhXHCNFvkNGyvsMHrN5J+sGijIk7cPrtXH
 F+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muCsYbQEcoe3YnIMkqZAOUWb9L93swjFn/KxNUvS9X4=;
 b=pmht1oxKpbGyy+OtDnRFPAn+ux6lxAKdmLw9xQWsOp8jxVj6GjpLOyJm/VcyR/4fAF
 fPHeruJcJJjAMofESHq47Sj783XpL75hWZ+lL7GeBptRW6MgRwTwQKvoe4orbacQqimg
 JPOYjHlmtBgnZSFac70NH/sMW5a3yTPB8nv+46SJn/ZiC7h4D5vLYQiBg1MDDaQf0pGw
 lS3O18Eo2Hlka5uKLEsvA+FXf8FACjnQUmxwdFVj67quDeNq4ZXRn7uxg69Hl7hjMdsT
 XuFS/98gz6suTbSmQuvtfVQ5Y4+Br30RnOJbeBG5lTGTkiBja+xo7kVArtTSlY5kA2Qu
 L/Kg==
X-Gm-Message-State: AOAM532KnEs2yKf1kO0W+y+hvKdmpdfl9+l6f0z+pTwzyaKBFFutKQiX
 aYua8YsC/bX02vu9Ua7O4BloFw==
X-Google-Smtp-Source: ABdhPJyHjpuTKy76nkzOIbX0Te+u5GfHqo09lcEv0oCH+iR8eFTB+0ufieB4HymCnlEapiKTMiukvw==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr13211102wrv.37.1610716724818; 
 Fri, 15 Jan 2021 05:18:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c190sm12346612wme.19.2021.01.15.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61B3C1FFB4;
 Fri, 15 Jan 2021 13:08:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 29/30] semihosting: Implement SYS_TMPNAM
Date: Fri, 15 Jan 2021 13:08:27 +0000
Message-Id: <20210115130828.23968-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210107170717.2098982-9-keithp@keithp.com>
Message-Id: <20210108224256.2321-20-alex.bennee@linaro.org>

diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 3d6604dcdd..a631904fb0 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -835,6 +835,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -998,8 +999,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.20.1


