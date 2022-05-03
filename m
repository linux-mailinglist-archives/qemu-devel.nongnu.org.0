Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC767518EA1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:21:14 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz1F-0000KH-Mz
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWS-0002Gb-0f
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-0003Wq-Au
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so3204444pjv.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GwwZTrlMnRc3NXYIV+jBGueka7cjStXbOSEZpF7o1wU=;
 b=Dmjuq5/oO6z3ecBQT44kCnnE2X1s6LdYGs1nQhOmfFSTgVRfT5m4NxWnmBJomF6CWt
 eCDYfLFwqNlmDzgtzjUoKGsINHCltu97LXyFWNDc81j5Qo5FoWKWxveE6+q+iYvtNURx
 aRz6M+RHvm1f0UczvHri/aHXF458nmhPChiSe+ebT/hVYnGgT0aBhBoMi+Vqr9Hxr1CE
 2fvhRzgBDw3nXF+P5u5+SqEMS8gx+dNRZeMwEHUcXHrShEoi2zK7fnpq/2QOYs69eJ7a
 35/SCoj9qpo/JMX5EEtZPOcDtKc5Zy/6ErHnXqjQdVtEEtqsnzE7eGdiq623Onsryquj
 zjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwwZTrlMnRc3NXYIV+jBGueka7cjStXbOSEZpF7o1wU=;
 b=eb2XKFx23WJ3O0GUy7VnbWTg+xDxMSpEtx2CBOLR09x9gNRZZECbnrSkZtw3F+qXo5
 FaMnewWn+OW7giX4+SSm/jE2OHx5CTMMXSK/7EokbxYGV2XfG8keJsLOasEg4pAFk8Df
 8bsLoYU7AxvH3u40MAhlzQbC7hMN5XAZFEdpPHPDP1rwFS4NJhfrsHCqTiV4cPxRnXlz
 +hcamrhYj6dKq3MAOUBDA6WYcfK1CysJDaxThtFtdUdZwHZu/dWBOku6owtwDUDUNWjn
 2QVJcmRM6hajHhGVx8/6lZ8gVRztyG2AEi9FcHkhFy7EOnTZDZ8SaR3p7idipKqQo8Tl
 os0w==
X-Gm-Message-State: AOAM533sdrQoxndKo4NakAgh1SbDuYl1yv5eIIQkyhZ8YyTN7MNNuCFK
 tdFoa6J8tpbuAbzDC3vr9Lz0WRiaIxhYLw==
X-Google-Smtp-Source: ABdhPJwl19KftUJM4vgwnZYIxxC0IWLY9P98IXHVgXsytHINcj/3d5o7rSpZMl+725O069L8lRjxvw==
X-Received: by 2002:a17:902:7795:b0:157:c50:53a6 with SMTP id
 o21-20020a170902779500b001570c5053a6mr18022936pll.40.1651607355638; 
 Tue, 03 May 2022 12:49:15 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/74] semihosting: Split out semihost_sys_rename
Date: Tue,  3 May 2022 12:47:59 -0700
Message-Id: <20220503194843.1379101-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Split out the non-ARM specific portions of SYS_RENAME to a
reusable function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  4 +++
 semihosting/arm-compat-semi.c  | 21 +------------
 semihosting/syscalls.c         | 57 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 748a4b5e47..21430aa0ef 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -52,4 +52,8 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len);
 
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9c98af19ca..f554f4761f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -481,26 +481,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "rename,%s,%s",
-                           arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
-        } else {
-            char *s2;
-
-            s = lock_user_string(arg0);
-            if (!s) {
-                goto do_fault;
-            }
-            s2 = lock_user_string(arg2);
-            if (!s2) {
-                unlock_user(s, arg0, 0);
-                goto do_fault;
-            }
-            ret = rename(s, s2);
-            unlock_user(s2, arg2, 0);
-            unlock_user(s, arg0, 0);
-            common_semi_cb(cs, ret, ret ? errno : 0);
-        }
+        semihost_sys_rename(cs, common_semi_cb, arg0, arg1 + 1, arg2, arg3 + 1);
         break;
 
     case TARGET_SYS_CLOCK:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 3464896281..96d823e8b3 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -175,6 +175,26 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "unlink,%s", fname, len);
 }
 
+static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong oname, target_ulong oname_len,
+                       target_ulong nname, target_ulong nname_len)
+{
+    int olen, nlen;
+
+    olen = validate_strlen(cs, oname, oname_len);
+    if (olen < 0) {
+        complete(cs, -1, -olen);
+        return;
+    }
+    nlen = validate_strlen(cs, nname, nname_len);
+    if (nlen < 0) {
+        complete(cs, -1, -nlen);
+        return;
+    }
+
+    gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -337,6 +357,32 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(p, fname, 0);
 }
 
+static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong oname, target_ulong oname_len,
+                        target_ulong nname, target_ulong nname_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *ostr, *nstr;
+    int ret;
+
+    ret = validate_lock_user_string(&ostr, cs, oname, oname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+    ret = validate_lock_user_string(&nstr, cs, nname, nname_len);
+    if (ret < 0) {
+        unlock_user(ostr, oname, 0);
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = rename(ostr, nstr);
+    complete(cs, ret, ret ? errno_for_gdb() : 0);
+    unlock_user(ostr, oname, 0);
+    unlock_user(nstr, nname, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -592,3 +638,14 @@ void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         host_remove(cs, complete, fname, fname_len);
     }
 }
+
+void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong oname, target_ulong oname_len,
+                         target_ulong nname, target_ulong nname_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_rename(cs, complete, oname, oname_len, nname, nname_len);
+    } else {
+        host_rename(cs, complete, oname, oname_len, nname, nname_len);
+    }
+}
-- 
2.34.1


