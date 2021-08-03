Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591913DE573
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:36:55 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmAg-0004DZ-C1
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt6-0005d3-Ee
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt4-0005Gr-O5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so2066087pja.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f2K4PGLb2oKqgETEBS112ablWl1xVg86v5mEsLdMH5A=;
 b=OBGtybu8aGZjTL3n4c3bKdVk0ngbdLW8XlevCWdZQsZHMbDF4S/HXJDkJQLP56kjQb
 2DB+9wUn6XhsK41To6YVPe7y1PdFeTGGS7U+YX9Buw5+1vtnsFj9UpBwaCLT5YymuOiq
 QWuLiSfHABAgPf78J5yPhKbeEa+Qc/c2ahMLhQa+3Qhur6yzsH8kSEY6IyTOAAmQqTyN
 5i22vfD+3a8ymz1CvZA37MTwrutThAWU6NsTWk2JyCcx7657JL7jH5dQugBI08YFTaxB
 AyXRkN7lpF9LnYbA9BuK6iPABY6tCrTrWTXifNK6wPmTn8wcIy6P9LuBAUxFeWa/8pjy
 jpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2K4PGLb2oKqgETEBS112ablWl1xVg86v5mEsLdMH5A=;
 b=DNdRPSltRO4HKuyuSu5kra2b0NchnXmdsLBi6SMkgz0Uwy2Nb4F9CwdxnFqzjTX/Ap
 gqR1CRZzHNgO4jkjEv6zJQ3VUULGf6htjlyNTgxUTr/hApzu9Kfr5NPXb2Z4rogBy8qx
 yw9/5RvmupSFPthey9MrsDJWDb5xDwAwqJ68bfURDbrQagIg5S9oUl5EASqkoZnIa6gL
 YUWGMdJHo+TeoWWMAWZtruAd0x9Xzp5mVBQIko5gV3NElOgPumNssRAJufi0XlJ7wNHK
 PSbL+DvMpJnO7KVALYWbuV65+Owfd28DD3vOOgGx4inm1VcISLvQzDjfnkpYgk0CN2H4
 fkTw==
X-Gm-Message-State: AOAM533yCuaOT/6Zml8wOU/gC+UL4KqJmlMbCL/GzeLrnLpo+TOiAX4+
 egmxOgo9o3Ka9NH1Rm7MI/SP3jNoo3I15A==
X-Google-Smtp-Source: ABdhPJyO6lqU/vxpq2HEoOVR5NTYmIOA+fJW5YKhqbnpXa2OvDmEG/7HhU0p/c4Q2TMYG15xgfHSJA==
X-Received: by 2002:a17:902:bf01:b029:12c:a5f6:dfe1 with SMTP id
 bi1-20020a170902bf01b029012ca5f6dfe1mr11137440plb.34.1627964321588; 
 Mon, 02 Aug 2021 21:18:41 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/55] linux-user: Disable more prctl subcodes
Date: Mon,  2 Aug 2021 18:14:34 -1000
Message-Id: <20210803041443.55452-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Create a list of subcodes that we want to pass on, a list of
subcodes that should not be passed on because they would affect
the running qemu itself, and a list that probably could be
implemented but require extra work. Do not pass on unknown subcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 56 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6e630745fa..e303a9da7f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6325,6 +6325,13 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_MTE_TAG_SHIFT       3
 # define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
 #endif
+#ifndef PR_SET_IO_FLUSHER
+# define PR_SET_IO_FLUSHER 57
+# define PR_GET_IO_FLUSHER 58
+#endif
+#ifndef PR_SET_SYSCALL_USER_DISPATCH
+# define PR_SET_SYSCALL_USER_DISPATCH 59
+#endif
 
 static abi_long do_prctl_get_fp_mode(CPUArchState *env)
 {
@@ -6632,13 +6639,54 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             return -TARGET_EINVAL;
         }
         return do_prctl_get_tagged_addr_ctrl(env);
+
+    case PR_GET_DUMPABLE:
+    case PR_SET_DUMPABLE:
+    case PR_GET_KEEPCAPS:
+    case PR_SET_KEEPCAPS:
+    case PR_GET_TIMING:
+    case PR_SET_TIMING:
+    case PR_GET_TIMERSLACK:
+    case PR_SET_TIMERSLACK:
+    case PR_MCE_KILL:
+    case PR_MCE_KILL_GET:
+    case PR_GET_NO_NEW_PRIVS:
+    case PR_SET_NO_NEW_PRIVS:
+    case PR_GET_IO_FLUSHER:
+    case PR_SET_IO_FLUSHER:
+        /* Some prctl options have no pointer arguments and we can pass on. */
+        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+
+    case PR_GET_CHILD_SUBREAPER:
+    case PR_SET_CHILD_SUBREAPER:
+    case PR_GET_SPECULATION_CTRL:
+    case PR_SET_SPECULATION_CTRL:
+    case PR_GET_TID_ADDRESS:
+        /* TODO */
+        return -TARGET_EINVAL;
+
+    case PR_GET_FPEXC:
+    case PR_SET_FPEXC:
+        /* Was used for SPE on PowerPC. */
+        return -TARGET_EINVAL;
+
+    case PR_GET_ENDIAN:
+    case PR_SET_ENDIAN:
+    case PR_GET_FPEMU:
+    case PR_SET_FPEMU:
+    case PR_SET_MM:
     case PR_GET_SECCOMP:
     case PR_SET_SECCOMP:
-        /* Disable seccomp to prevent the target disabling syscalls we need. */
-        return -TARGET_EINVAL;
+    case PR_SET_SYSCALL_USER_DISPATCH:
+    case PR_GET_THP_DISABLE:
+    case PR_SET_THP_DISABLE:
+    case PR_GET_TSC:
+    case PR_SET_TSC:
+    case PR_GET_UNALIGN:
+    case PR_SET_UNALIGN:
     default:
-        /* Most prctl options have no pointer arguments */
-        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
+        /* Disable to prevent the target disabling stuff we need. */
+        return -TARGET_EINVAL;
     }
 }
 
-- 
2.25.1


