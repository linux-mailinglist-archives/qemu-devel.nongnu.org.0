Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4636A22F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:44:11 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLO6-0003Pn-Mq
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKim-0005xt-Mi
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:28 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiQ-0004Lr-UC
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:28 -0400
Received: by mail-il1-x12b.google.com with SMTP id c15so43209051ilj.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1e34V6vsrnu+DKXQalAPcoojfgzLqn0cNN6qHP4kck=;
 b=oKQh7Lp2saTxRqCvLO/jZAzhWT1yYaVancplepCrnmKNiNtsVQza7W/h467qhLWvKy
 11x0zEj8l0vhlLSvQPNVO4Lzn1mSmgEUfIO2RP1uwxjBSkqSAe60uTbxqLnl/kCiWl8C
 z7GdgoQuUJ6znf73bYNN2WyoEYZ/40MMo5O22Kr1rjnUV8mLas8N8JTz/giQQnL35gew
 sShdmFs8+yb14PCeUBL7uC34d0+pUd2Hu8LaC5bCLfcGmshbYv2PSbaR42Lex7DlqEUd
 ew4eifPJ9nf5QQrSAO9SzKe7M1cR2+T5s8tTAZwCcWEoVB88dazvsRUSS0AvHSwmLxoS
 dDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1e34V6vsrnu+DKXQalAPcoojfgzLqn0cNN6qHP4kck=;
 b=RUqblTQAwdOEuKpSkhbQuVVxIWbRi4aj7V/a1JfNbf0MAwY7nYsk8mYH4jBHR+9NDv
 06THNR08yckQd5QZkH9Ts3QGIdSW7uhxzNTKVj88Spu++nuxORxa1YR9U9f/Wws4/KqK
 qorbvNf5fgCmMuXMo/jJ7SsKTQKVvfWgOoFKCIlx+21n7jre0Rz1jfsgybg3f/7fI86s
 YhygwzDZncAc5Fl6oM6fmmaO0xN+h/GtNmrEv4JFjWr1dVEZhqHf3kuTfn05c9vhS1Jm
 d2TmPYWZQsJT0mJrT7SYz5BQw4y6ZVQNS5zxtRF5wB8/St/tvsE+JjeqxMTueJXaMEp/
 zxZA==
X-Gm-Message-State: AOAM531bWknDprEik+/yupOtRz+AiWnPWVO52isugBO3DJSGIQ9FizTg
 CtwlIhSzcRZjPtvUqzehQc5tBKYIQRx1sLS1
X-Google-Smtp-Source: ABdhPJyUfW6dWuF82ae2bAF1pZKpwX33+xt5Ldd+wmQO55ZRO6L8Q8TlwvaCUG1VQN+OuSVPqywaOQ==
X-Received: by 2002:a05:6e02:48b:: with SMTP id
 b11mr7157096ils.245.1619280063281; 
 Sat, 24 Apr 2021 09:01:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:02 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 44/48] bsd-user: style tweak: use preferred block comments
Date: Sat, 24 Apr 2021 10:00:12 -0600
Message-Id: <20210424160016.15200-45-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
 bsd-user/syscall.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 46c0e29841..fbe3b3b2fe 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -140,8 +140,8 @@ static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
 #ifdef TARGET_SPARC
 static abi_long do_freebsd_sysarch(void *env, int op, abi_ulong parms)
 {
-    /* XXX handle
-     * TARGET_FREEBSD_SPARC_UTRAP_INSTALL,
+    /*
+     * XXX handle TARGET_FREEBSD_SPARC_UTRAP_INSTALL,
      * TARGET_FREEBSD_SPARC_SIGTRAMP_INSTALL
      */
     return -TARGET_EINVAL;
@@ -257,7 +257,8 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen,
 }
 #endif
 
-/* FIXME
+/*
+ * FIXME
  * lock_iovec()/unlock_iovec() have a return code of 0 for success where
  * other lock functions have a return code of 0 for failure.
  */
@@ -277,8 +278,10 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
         if (vec[i].iov_len != 0) {
             vec[i].iov_base = lock_user(type, base, vec[i].iov_len, copy);
-            /* Don't check lock_user return value. We must call writev even
-               if a element has invalid base address. */
+            /*
+             * Don't check lock_user return value. We must call writev even if a
+             * element has invalid base address.
+             */
         } else {
             /* zero length pointer is ignored */
             vec[i].iov_base = NULL;
@@ -310,9 +313,11 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     return 0;
 }
 
-/* do_syscall() should always have a single exit point at the end so
-   that actions, such as logging of syscall results, can be performed.
-   All errnos that do_syscall() returns must be -TARGET_<errcode>. */
+/*
+ * do_syscall() should always have a single exit point at the end so that
+ * actions, such as logging of syscall results, can be performed.  All errnos
+ * that do_syscall() returns must be -TARGET_<errcode>.
+ */
 abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6, abi_long arg7,
-- 
2.22.1


