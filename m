Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646EC541482
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:18:45 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyff2-0001Sp-Cy
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb4-00063c-SF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:38 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb3-0004N8-1r
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:38 -0400
Received: by mail-il1-x129.google.com with SMTP id p1so15065114ilj.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VcXAAhXPRGN/o3HNZi64xOmTmhdRIXzGdmeZM9kuwk=;
 b=SCAmuQu6CHhpeQmEENfapPCOyjA1qLXyDcY23LjJAN2y/3FcOgXuUUOZBknEPHt/bf
 5/9/KqJlvWWoEwm5MDtESy/X5hbc0COB5cKr/+599Og+WvESnK0FeeWWmM37JasswcmC
 bl5Bm7puVn9Q0glXhTfLJR8OHe1VbPGF8iwigBQPoj61y31WXTQyJ9GOwBJdOOEgPlH8
 f0AWDvaL1QO2vQMxdDl4lV5Wunlnht5Tk4VVQsPiqa+4402pb2Rb6QPJljA8OAoFF2lK
 o29i1nqjAD51QOEBnG7QAUw0GyevvJ0BnSx6egliz27v3bdInEp9p30sMM2qvyL7aDWW
 MKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VcXAAhXPRGN/o3HNZi64xOmTmhdRIXzGdmeZM9kuwk=;
 b=CtI+E8rS2s24b9y++LuAgUKx5psV9tUz9GwsiDi2IRsslDX3o1ZJOIk6eF0ad1JTAW
 kfwRh1Mvw6GxfZYOQTHUAymYu36e1tJ2cv2ARV9biRoJqr29OycF/V+FXvFfgTY0qFmm
 9toE0Na6HCrw+XV/gdsYAKWtiFs/o5qEXHJipA7XrUrNk3O2Q7eso7i49ReAIX3ILHLp
 umhs3Un7fMJ/t3FiXPW/oAcvaWv4GwsGq+N1ot9pTlzNr+MlNrrHcPhl+q3hTokNIdGx
 8S51UXFtKi4b7CTWw62XtQGMRPlKuMuo55ydvIflrgSonOx2z52C+ShTSzKnAe1ZT9Rz
 EYdw==
X-Gm-Message-State: AOAM533gUACtBpvKi/syVtPaLGXvbXIBchG5sKmCAv4Q+nvD9xfWZyC0
 YQ5wcxHSIYoVb9ESjk6krX58hSKAR+wGTw==
X-Google-Smtp-Source: ABdhPJw0Z7HlktlqX4qb9W28xW199wGG3Jk/yTL4Eu3e7mPkGgVMHmu2ogSPHdqXGP/pQaMT/rC6Qg==
X-Received: by 2002:a05:6e02:8ae:b0:2c7:90a5:90b8 with SMTP id
 a14-20020a056e0208ae00b002c790a590b8mr18452104ilt.19.1654632875546; 
 Tue, 07 Jun 2022 13:14:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 3/6] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Date: Tue,  7 Jun 2022 14:14:37 -0600
Message-Id: <20220607201440.41464-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add in the tracing and this system call not implemented boilerplate. Do
this by moving the guts of do_freebsd_syscall to freebsd_syscall. Put
the tracing in the wrapper function. Since freebsd_syscall is a
singleton static function, it will almost certainly be inlined. Fix
comments that referred to do_syscall since that was renamed some tie
ago.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 50 ++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 510307f29d9..334c573739b 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -201,16 +201,58 @@ void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
 }
 
 /*
- * do_syscall() should always have a single exit point at the end so that
- * actions, such as logging of syscall results, can be performed.  All errnos
- * that do_syscall() returns must be -TARGET_<errcode>.
+ * All errnos that freebsd_syscall() returns must be -TARGET_<errcode>.
+ */
+static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
+                                abi_long arg2, abi_long arg3, abi_long arg4,
+                                abi_long arg5, abi_long arg6, abi_long arg7,
+                                abi_long arg8)
+{
+    abi_long ret;
+
+    switch (num) {
+    default:
+        gemu_log("qemu: unsupported syscall: %d\n", num);
+        ret = -TARGET_ENOSYS;
+        break;
+    }
+
+    return ret;
+}
+
+/*
+ * do_freebsd_syscall() should always have a single exit point at the end so
+ * that actions, such as logging of syscall results, can be performed. This
+ * as a wrapper around freebsd_syscall() so that actually happens. Since
+ * that is a singleton, modern compilers will inline it anyway...
  */
 abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6, abi_long arg7,
                             abi_long arg8)
 {
-    return 0;
+    CPUState *cpu = env_cpu(cpu_env);
+    int ret;
+
+#ifdef DEBUG
+    gemu_log("freebsd syscall %d\n", num);
+#endif
+    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+    if (do_strace) {
+        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
+
+    ret = freebsd_syscall(cpu_env, num, arg1, arg2, arg3, arg4, arg5, arg6,
+                          arg7, arg8);
+#ifdef DEBUG
+    gemu_log(" = %ld\n", ret);
+#endif
+    if (do_strace) {
+        print_freebsd_syscall_ret(num, ret);
+    }
+    trace_guest_user_syscall_ret(cpu, num, ret);
+
+    return ret;
 }
 
 void syscall_init(void)
-- 
2.33.1


