Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A22EFB77
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:56:44 +0100 (CET)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0gV-0002GN-VG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cb-00073K-GD
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cZ-0008Kz-S5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t16so10434400wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgAij1gXMiHcT+yoonkBqiCmQUdZDDELVCGJ0vlVeHQ=;
 b=XVBF2P4/Fc31VwDOo/a/ljatF4Et8swbW7CGgb3CKD3oS47KKMu6GP8iE9NtObHTTg
 DexjL2CfR1iO46VEXBHrUfADYe1HNj2thlyaDyJcWzN9IlNp8l/W3+48LX8cA1+9wGft
 6LCCa66TM0fatq6uVSyOkEuq4Voo0nv7qYjXeo6QRirGvgfKIQMdyxNNJH81eSIIpyW4
 4ogvHEcOgHQcFrbUH7JA6NuLH4yPXZv7pZhSkR/FWDVpWpAAaiaxPX+V9PatnFY/x1NZ
 57FcPyFB1Zv2BDSeLXwnY76hjMdk44N7NjWXbYOhaOKm0qGUjjwm8+SUToFrXDVuEtN+
 djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgAij1gXMiHcT+yoonkBqiCmQUdZDDELVCGJ0vlVeHQ=;
 b=trJKcE9Zt7PUrhKMCHxu7y/Y8zEnulJmkiwnRtgleLiOZ/E6cAH/dcggKGf1/Q6Uxm
 KsaEM0xzgyIVT8iBOGVjWk3oIf5sPhQz2ilEe2e7x+nFsWxpG8COZ4ItO7pPluWj6MlC
 S2IkIWD6m+1qPC36/UzYyBYEBkqyj43o/WTf5mMvwhieE2AmqKUD5XUHxMX9Y2K4nSxT
 pQgDdkvUqS3aZktTWj0+za1H86eq3gUqoGLT19W4HcRKwVxWDQMKaKEhx8Fv0Nxid2ZV
 IPHhD56+LDRO3Y0dnpVsjpyZAGzNZ/Gr/36PgdQmFNzqECivP63lVfb4kI18q1YGbT6t
 9BIg==
X-Gm-Message-State: AOAM531sKPEB/0enVrTa5acNpZvbJ1o0gWXH5ChpWgLn1FykmgzpGEVQ
 a1VvXLy3DbBJWdsIb0f87W8iJg==
X-Google-Smtp-Source: ABdhPJyVYOjyxWonWiEOKXLmQVgVSp22lIvCvKqnP27gPE2rNFiSbyLOt+6z2EbAKl+RpklSVdIgUg==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr5564921wrt.267.1610146358607; 
 Fri, 08 Jan 2021 14:52:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u205sm14291687wme.42.2021.01.08.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:52:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E34331FFA6;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 19/20] semihosting: Implement SYS_TMPNAM
Date: Fri,  8 Jan 2021 22:42:55 +0000
Message-Id: <20210108224256.2321-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210107170717.2098982-9-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 3d6604dcdd..a631904fb0 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
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


