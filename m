Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1775547526
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 16:01:18 +0200 (CEST)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01fv-0005xL-U6
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 10:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01aA-0006wm-M1
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a9-0003gS-4E
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:18 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 184so1635349pga.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHJEYVxUrkFuENo0R0EF9MoWMsEaIiFo82F16iYg1f0=;
 b=xN+JfCnVgcJ8WoAuiEnBv9Qx/FVUeFMz+ZdJQQXHiiS+rJgo5+UZpqI8qx1SXFrZNM
 kiStN2IPu+cR2mWZgsstuTNzpughOBPW9pRonZrj3c45vpZCtLYyuOQS8rgxRdSR3yBr
 PtibErKBQHtFSYbSW02Yuw+rZTcwiOQKwWdA43iAEJP35Wn57F9bisYkrB7O0AJbDXXT
 fjJQhFNue91i2r4JgIgRVHCH3BzkLR0i6r7UiYL/Rx9SSvd+JuhV0jcLSA2kGLLc0dcE
 /is0uAibVG4KGOsmHGzziB4eurOAtdsupK51kfDoVoVxC4UDdmdQg3Zrw0wEsQcEoZfn
 IrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHJEYVxUrkFuENo0R0EF9MoWMsEaIiFo82F16iYg1f0=;
 b=RkctlHm0CFd+sBlaSPqYHSFSAJBIYjziYw/vYoHD4RQRCih16ZgBqeKZ//mcqVUbAd
 1iMvwaFIGnmqOBliuskBh2m77VluD9MGLr5614zhdm/OYFNv7ELbDivPQ8mcnYjlrsCh
 aW6zN7tvP5FJOkVIIG1noJmzwtBhzXP1qO7DoaXpfFj7IswT1C8mmYZ6YVXFfzcVKJNB
 x2PR21foQEflTalwJTA5NoX2OZRLj2yMiaV1DKJg1mPQgvzpdHGLc6sxJvSDrqbS6rFH
 qVRUiWgx7lEzrAJzNYYfmiH1YUpDpcZOylQ1wGXriSlvf6NoVnfNDpoNGjqwYwX+easO
 zdiw==
X-Gm-Message-State: AOAM530f+wGDRf7q78qYSJZG//9mIWUwkWBFARAy95PA18fruOhlbXZR
 V0B2M6LUXdne/P4dJ03Lz7LHwy9YvuAbCA==
X-Google-Smtp-Source: ABdhPJyV5UffgGEcpn6Q/Y+QUhmjhv6Eq854q+wRT9W8aGXw/3yrdSGPBM/Crs68TM29CTzyYWtUfg==
X-Received: by 2002:a05:6e02:78a:b0:2d3:af3f:a9e2 with SMTP id
 q10-20020a056e02078a00b002d3af3fa9e2mr28223957ils.96.1654955704707; 
 Sat, 11 Jun 2022 06:55:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/6] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Date: Sat, 11 Jun 2022 07:55:11 -0600
Message-Id: <20220611135514.92882-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
References: <20220611135514.92882-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=imp@bsdimp.com; helo=mail-pg1-x52c.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 44 +++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 52093d479d8..1c4c9983f1a 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -190,16 +190,52 @@ void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
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
+        qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
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
+    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+    if (do_strace) {
+        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
+
+    ret = freebsd_syscall(cpu_env, num, arg1, arg2, arg3, arg4, arg5, arg6,
+                          arg7, arg8);
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


