Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70E484D12
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:25:02 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xrB-0001NO-C4
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:25:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xlI-00036C-3Z
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:18:56 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40865
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xlG-0002J5-Ea
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:18:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so2126976pjo.5
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 20:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imvmSNJ9r6pgem+qIvV+5r2btJZpPJwaeiDcuwjFcSE=;
 b=HkLn8rlmm5oE9tpMTVgjZmMnt/L41iJZ+ozbkbeKIhFtMMEQgH5F/mk8rgwqWXHUbH
 /V6pVHKeJcsUeoQ+ug92j5PZZw/xy6Zeg4qZgbIh4ocSDaI7B7mnxsARwB0AIEMx9Ca2
 1n6i4Rw6G4ZvxVrxjqgKoQscqrSCjIyrW+BXCXTTngLWJByvW9ovW2p+BqeOB0ucZnz3
 6/5pHiNvE5bM1EE2fMQw0SDGUe7Mwcc7tpBRz46+fLpb3XOJxj9h4A/m66IKl5OscO4b
 aiLlw0xV65cUZmd+lZRBsKcGQc+xZmjyzFmHi8ITpR+d15pAuxNHHpd932OhpJVf3Et0
 qXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imvmSNJ9r6pgem+qIvV+5r2btJZpPJwaeiDcuwjFcSE=;
 b=Vabl0nOzmITeFDgjdkungq88XSzKn3PPZ+mTx8TjgKb8pjFcoA/vgFduVf9woGbiMI
 tyt6Oh7WkJezbuS8Zjxgjww4GtpkSAsLtNcsALkI5rF4RdL9wGUbRXKXtjZAb0PwMYpm
 VEpe96RO49U8JFXMnS4WLTMuZQVd1ToCDmvnKacVJ1k2j9Op9KM5PkSYam34HJ4lZVDN
 z9jE4o6LEVw42sRdnt2XFsvrLfGM9u1M2/GP4IYYPkl0gd80ra6K5iZ+UI89yb6YmOad
 cL+4Bc730nZFWRo82PDDqOLUBApisc9jpntSlYGPIYUCJy/CgDyEKLgqOGOor7L3qPJa
 /e8g==
X-Gm-Message-State: AOAM530/0N1nA4UM+CF/kEJG0BzLsq66pVOPEtFy2D1MsYdXpa+zeUpr
 q4c9MnJsJS9gB7ihF8c+ECvT773zZdPSwg==
X-Google-Smtp-Source: ABdhPJyKKDir3ZdYfhYCgsFIUk8eLEMAGPXm2mOcMDBITUg06ru7cbnCqDh2CBt8VThjYaIoNOGzVw==
X-Received: by 2002:a17:902:f681:b0:148:e8be:3e1 with SMTP id
 l1-20020a170902f68100b00148e8be03e1mr52773500plg.158.1641356332934; 
 Tue, 04 Jan 2022 20:18:52 -0800 (PST)
Received: from localhost ([2601:646:100:6be:50e6:7c07:b67:f135])
 by smtp.gmail.com with UTF8SMTPSA id y6sm46021463pfi.154.2022.01.04.20.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 20:18:52 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] linux-user: call set/getscheduler set/getparam directly
Date: Tue,  4 Jan 2022 20:18:19 -0800
Message-Id: <20220105041819.24160-3-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220105041819.24160-1-tonistiigi@gmail.com>
References: <20220105041819.24160-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=tonistiigi@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There seems to be difference in syscall and libc definition of these
methods and therefore musl does not implement them (1e21e78bf7). Call
syscall directly to ensure the behavior of the libc of user application,
not the libc that was used to build QEMU.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 34 ++++++++++++++++++++++++----------
 linux-user/syscall_defs.h |  4 ++++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1b8415c8a3..30962155a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -359,6 +359,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
 #define __NR_sys_sched_setattr __NR_sched_setattr
 _syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr,
           unsigned int, flags);
+#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
+_syscall1(int, sys_sched_getscheduler, pid_t, pid);
+#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
+_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
+          const struct sched_param *, param);
+#define __NR_sys_sched_getparam __NR_sched_getparam
+_syscall2(int, sys_sched_getparam, pid_t, pid,
+          struct sched_param *, param);
+#define __NR_sys_sched_setparam __NR_sched_setparam
+_syscall2(int, sys_sched_setparam, pid_t, pid,
+          const struct sched_param *, param);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10587,30 +10598,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setparam:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg2, 0);
-            return get_errno(sched_setparam(arg1, &schp));
+            return get_errno(sys_sched_setparam(arg1, &schp));
         }
     case TARGET_NR_sched_getparam:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            ret = get_errno(sched_getparam(arg1, &schp));
+            ret = get_errno(sys_sched_getparam(arg1, &schp));
             if (!is_error(ret)) {
-                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
+                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0)) {
                     return -TARGET_EFAULT;
+                }
                 target_schp->sched_priority = tswap32(schp.sched_priority);
                 unlock_user_struct(target_schp, arg2, 1);
             }
@@ -10618,19 +10631,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setscheduler:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
             if (arg3 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg3, 0);
-            return get_errno(sched_setscheduler(arg1, arg2, &schp));
+            return get_errno(sys_sched_setscheduler(arg1, arg2, &schp));
         }
     case TARGET_NR_sched_getscheduler:
-        return get_errno(sched_getscheduler(arg1));
+        return get_errno(sys_sched_getscheduler(arg1));
     case TARGET_NR_sched_getattr:
         {
             struct target_sched_attr *target_scha;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 310d6ce8ad..28b9fe9a47 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2928,4 +2928,8 @@ struct target_sched_attr {
     abi_uint sched_util_max;
 };
 
+struct target_sched_param {
+    abi_int sched_priority;
+};
+
 #endif
-- 
2.32.0 (Apple Git-132)


