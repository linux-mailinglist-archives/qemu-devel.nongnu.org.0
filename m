Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71A36A236
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:50:37 +0200 (CEST)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLUK-0000ep-Je
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKip-00064s-FM
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:31 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiS-0004Lv-VT
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:31 -0400
Received: by mail-il1-x132.google.com with SMTP id b17so43160962ilh.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0Kb819q+mXdmsjSgnvN1FJvqrihYP2dk/lhl4G+fRg=;
 b=u+4OawJl5IOpTzkcZhkrDxcNTjjbqzx2VUNqpl7l5pcIRTt567yJV3LfG4E5KMPocS
 xESBOukOcYKr5/tJ0CxAziSKIWUbq/Mau8UGFnEwWGT05G/mKM4YDsrHS0flW+6TYJI4
 2sgNtuTuVV4F6122e9A9o7P2/mj/037qACktoTwymXjeHS1ilEB35NG0jv4+U6f3h6AE
 ECyVtHlqgoNhKKbZyJuI3xRr2TLkorje6zFmuESuyLxYUki2Ehl/psN+0+iEeioWctq/
 hJH7Q+2jlAIBdfxVadLJvcUh0MCCS7Y0nfPeJhXvLi2EPnEPqhFR+TtQ2w1p5THdlEjs
 OpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W0Kb819q+mXdmsjSgnvN1FJvqrihYP2dk/lhl4G+fRg=;
 b=siM9DB7C681o4Gd9fg0iWg6ZxPzNWV7txZ9Oe+C9PsM6PYVmITF7JN15UJlGEGmQ7k
 SizN2pUZ/2jGYNoJ/yPgBwCaWK8EMpkpj8lq8oFJNBj1YL84cyZbshrPz+RBOyNVvmGa
 Dyl5AXdMLy+Jqb7aWQfNaNOkqrN1Na9KFsSox5tzxlwyhHI5ar9ClyTgnH3MGD2KjdtA
 hAP93dBCn8X7T5I6u4qeugtjYL32oxVgdCNUwqmb9F13SX0jiUegt3L4oClo4ve+whs5
 Da2lKLXJrrQvcvgf93lMzrf9llEFRxe1kdn+WtC2M5ZTYTwh2WhK+OELvMnKKbzSNuPn
 ALWw==
X-Gm-Message-State: AOAM531KPZ1i86p1fUkOYpMunIGhMxoL23yXzeeqcd0NKNI9FOsMIQjs
 v2rJEHMfTJisD/hc5rrAzbuCcw3wsH6B1Pt0
X-Google-Smtp-Source: ABdhPJy7RESc5b9iknABa+tddrzkwS+gJQH2rnYGC+3ze7X+N+c59qlqzpnGU4Xq5zkmZ9gNOUrLzA==
X-Received: by 2002:a92:3644:: with SMTP id d4mr7387092ilf.53.1619280064126;
 Sat, 24 Apr 2021 09:01:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:03 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/48] bsd-user: style tweak: Use preferred {} in if/else
 statements.
Date: Sat, 24 Apr 2021 10:00:13 -0600
Message-Id: <20210424160016.15200-46-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 120 +++++++++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 42 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index fbe3b3b2fe..36ffa6a880 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -33,11 +33,12 @@ static abi_ulong target_original_brk;
 
 static inline abi_long get_errno(abi_long ret)
 {
-    if (ret == -1)
+    if (ret == -1) {
         /* XXX need to translate host -> target errnos here */
         return -(errno);
-    else
+    } else {
         return ret;
+    }
 }
 
 #define target_to_host_bitmask(x, tbl) (x)
@@ -59,10 +60,12 @@ static abi_long do_obreak(abi_ulong new_brk)
     abi_long mapped_addr;
     int new_alloc_size;
 
-    if (!new_brk)
+    if (!new_brk) {
         return 0;
-    if (new_brk < target_original_brk)
+    }
+    if (new_brk < target_original_brk) {
         return -TARGET_EINVAL;
+    }
 
     brk_page = HOST_PAGE_ALIGN(target_brk);
 
@@ -79,10 +82,11 @@ static abi_long do_obreak(abi_ulong new_brk)
                                         MAP_ANON | MAP_FIXED | MAP_PRIVATE,
                                         -1, 0));
 
-    if (!is_error(mapped_addr))
+    if (!is_error(mapped_addr)) {
         target_brk = new_brk;
-    else
+    } else {
         return mapped_addr;
+    }
 
     return 0;
 }
@@ -98,35 +102,39 @@ static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
 #ifdef TARGET_ABI32
     case TARGET_FREEBSD_I386_SET_GSBASE:
     case TARGET_FREEBSD_I386_SET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_SET_GSBASE)
+        if (op == TARGET_FREEBSD_I386_SET_GSBASE) {
 #else
     case TARGET_FREEBSD_AMD64_SET_GSBASE:
     case TARGET_FREEBSD_AMD64_SET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE)
+        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE) {
 #endif
             idx = R_GS;
-        else
+        } else {
             idx = R_FS;
-        if (get_user(val, parms, abi_ulong))
+        }
+        if (get_user(val, parms, abi_ulong)) {
             return -TARGET_EFAULT;
+        }
         cpu_x86_load_seg(env, idx, 0);
         env->segs[idx].base = val;
         break;
 #ifdef TARGET_ABI32
     case TARGET_FREEBSD_I386_GET_GSBASE:
     case TARGET_FREEBSD_I386_GET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_GET_GSBASE)
+        if (op == TARGET_FREEBSD_I386_GET_GSBASE) {
 #else
     case TARGET_FREEBSD_AMD64_GET_GSBASE:
     case TARGET_FREEBSD_AMD64_GET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE)
+        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE) {
 #endif
             idx = R_GS;
-        else
+        } else {
             idx = R_FS;
+        }
         val = env->segs[idx].base;
-        if (put_user(val, parms, abi_ulong))
+        if (put_user(val, parms, abi_ulong)) {
             return -TARGET_EFAULT;
+        }
         break;
     /* XXX handle the others... */
     default:
@@ -168,14 +176,17 @@ oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
 
     j = sizeof(buf);
     i = sysctl(qoid, len + 2, buf, &j, 0, 0);
-    if (i)
+    if (i) {
         return i;
+    }
 
-    if (kind)
+    if (kind) {
         *kind = *(uint32_t *)buf;
+    }
 
-    if (fmt)
+    if (fmt) {
         strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
+    }
     return (0);
 }
 
@@ -231,27 +242,34 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen,
     int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
     uint32_t kind = 0;
 
-    if (oldlenp)
+    if (oldlenp) {
         get_user_ual(oldlen, oldlenp);
-    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1)))
+    }
+    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1))) {
         return -TARGET_EFAULT;
-    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1)))
+    }
+    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1))) {
         return -TARGET_EFAULT;
-    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0)))
+    }
+    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0))) {
         return -TARGET_EFAULT;
+    }
     holdlen = oldlen;
-    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
+    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++) {
         *q++ = tswap32(*p);
+    }
     oidfmt(snamep, namelen, NULL, &kind);
     /* XXX swap hnewp */
     ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
-    if (!ret)
+    if (!ret) {
         sysctl_oldcvt(holdp, holdlen, kind);
+    }
     put_user_ual(holdlen, oldlenp);
     unlock_user(hnamep, namep, 0);
     unlock_user(holdp, oldp, holdlen);
-    if (hnewp)
+    if (hnewp) {
         unlock_user(hnewp, newp, 0);
+    }
     g_free(snamep);
     return ret;
 }
@@ -271,8 +289,9 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
 
     target_vec = lock_user(VERIFY_READ, target_addr,
                            count * sizeof(struct target_iovec), 1);
-    if (!target_vec)
+    if (!target_vec) {
         return -TARGET_EFAULT;
+    }
     for (i = 0; i < count; i++) {
         base = tswapl(target_vec[i].iov_base);
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
@@ -300,8 +319,9 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
 
     target_vec = lock_user(VERIFY_READ, target_addr,
                            count * sizeof(struct target_iovec), 1);
-    if (!target_vec)
+    if (!target_vec) {
         return -TARGET_EFAULT;
+    }
     for (i = 0; i < count; i++) {
         if (target_vec[i].iov_base) {
             base = tswapl(target_vec[i].iov_base);
@@ -332,8 +352,9 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if (do_strace)
+    if (do_strace) {
         print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch (num) {
     case TARGET_FREEBSD_NR_exit:
@@ -347,14 +368,16 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_FREEBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
+        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
             goto efault;
+        }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_FREEBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
+        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
             goto efault;
+        }
         ret = get_errno(write(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         break;
@@ -364,15 +387,17 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
             struct iovec *vec;
 
             vec = alloca(count * sizeof(struct iovec));
-            if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
+            if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0) {
                 goto efault;
+            }
             ret = get_errno(writev(arg1, vec, count));
             unlock_iovec(vec, arg2, count, 0);
         }
         break;
     case TARGET_FREEBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
+        if (!(p = lock_user_string(arg1))) {
             goto efault;
+        }
         ret = get_errno(open(path(p),
                              target_to_host_bitmask(arg2, fcntl_flags_tbl),
                              arg3));
@@ -413,8 +438,9 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef DEBUG
     gemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+    if (do_strace) {
         print_freebsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
@@ -437,8 +463,9 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if (do_strace)
+    if (do_strace) {
         print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch (num) {
     case TARGET_NETBSD_NR_exit:
@@ -452,20 +479,23 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_NETBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
+        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
             goto efault;
+        }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_NETBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
+        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
             goto efault;
+        }
         ret = get_errno(write(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         break;
     case TARGET_NETBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
+        if (!(p = lock_user_string(arg1))) {
             goto efault;
+        }
         ret = get_errno(open(path(p),
                              target_to_host_bitmask(arg2, fcntl_flags_tbl),
                              arg3));
@@ -494,8 +524,9 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef DEBUG
     gemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+    if (do_strace) {
         print_netbsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
@@ -518,8 +549,9 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if (do_strace)
+    if (do_strace) {
         print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
 
     switch (num) {
     case TARGET_OPENBSD_NR_exit:
@@ -533,20 +565,23 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = 0; /* avoid warning */
         break;
     case TARGET_OPENBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
+        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0))) {
             goto efault;
+        }
         ret = get_errno(read(arg1, p, arg3));
         unlock_user(p, arg2, ret);
         break;
     case TARGET_OPENBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
+        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1))) {
             goto efault;
+        }
         ret = get_errno(write(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         break;
     case TARGET_OPENBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
+        if (!(p = lock_user_string(arg1))) {
             goto efault;
+        }
         ret = get_errno(open(path(p),
                              target_to_host_bitmask(arg2,
                                                     fcntl_flags_tbl),
@@ -576,8 +611,9 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef DEBUG
     gemu_log(" = %ld\n", ret);
 #endif
-    if (do_strace)
+    if (do_strace) {
         print_openbsd_syscall_ret(num, ret);
+    }
 
     record_syscall_return(cpu, num, ret);
     return ret;
-- 
2.22.1


