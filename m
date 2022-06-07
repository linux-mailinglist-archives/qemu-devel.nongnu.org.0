Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C209541461
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:18:12 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfeV-0001Gl-0d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb3-000629-KK
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:37 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb1-0004Mf-69
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:37 -0400
Received: by mail-il1-x12f.google.com with SMTP id h7so7488882ila.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8kQ9fst/2AyCf9uYc1Ho1DFIpPsnSwh6RIMuhRg9SA=;
 b=MteJizlRJT+Z1gwJyqTAo/WoAYDmlqrZx7gPHYxNHOdn69VZYRTN8L+GYDdQA3XLbu
 RzCx4Mi999Z40KlwFvE9vb2FDmkelfRg+t8CsPRASMJ8sAs2GXxnsXryVGjSJhAa0tpR
 fkutCZHipJrysqauCwtGXepkv/GYQm7ia//4bPy5xME4XRWlC3jmW2fZF8N9HVwvmYdd
 GCulivYhnhx8oCFaPFnthhfVovCazyqjFBMyTbrWBSfeSbnoTA1M4UvoRzMGwUAZpAa1
 sXQqnS5JmkwKVluLN25xdICNRZxZ+Cd1ogbqAgt5fmtogFhaiClXZmRS6aRDCqg3Wood
 TpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8kQ9fst/2AyCf9uYc1Ho1DFIpPsnSwh6RIMuhRg9SA=;
 b=rh168xGl1ILAtL+RUZkAw1+XDSz2ubk0VgllzqJRVxlK/bb6Qz8zfP5pGuzsU7XJTZ
 m7PUept3v+e5XcR96uU9hc3jCQh+XtAUfD/C7oAaeS5hq2eS6olYpTb5DtWaU2AX+DZb
 wq67SFrserJNhtHJtOAf79Ih11P+r4iHqpqGndgjakWVE75K7JHXcxWstXKOe1oPdlxL
 nxR3VzNdd/AV7Pr4wMvRxHZQ/ICYgnWBnMeg6sn9t3xa4K5WqcEho8T4TjscnH9iIOTa
 w7mZfrmP6qqgFt7YMeDMuCrvUVXGYlvEeqpRaVeQnhDMixobYWIMrPxZtB8dXSUAAlg1
 wzlQ==
X-Gm-Message-State: AOAM532rCrudTSftEjBdVkWAznNgpGhSbu4Y+BlpkkJ57Ugy6NQO+0ID
 0fu2zit9TK0Jf33E+g7NS42HokjFxnJi/w==
X-Google-Smtp-Source: ABdhPJwpYrtnngSlIUk1CsY7bLUjNfZhYI+eH2ULwP2BS7H4OsakUOAFbKr77Ae7urxGipd4ahAgRw==
X-Received: by 2002:a05:6e02:1e0b:b0:2d1:b5e8:38a0 with SMTP id
 g11-20020a056e021e0b00b002d1b5e838a0mr17848148ila.296.1654632873605; 
 Tue, 07 Jun 2022 13:14:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 1/6] bsd-user/freebsd/os-syscall.c: lock_iovec
Date: Tue,  7 Jun 2022 14:14:35 -0600
Message-Id: <20220607201440.41464-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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

lock_iovec will lock an I/O vec and the memory to which it refers and
create a iovec in the host space that refers to it, with full error
unwinding. Add helper_iovec_unlock to unlock the partially locked iovec
in case there's an error. The code will be used in iovec_unlock when
that is committed.

Note: memory handling likely could be rewritten to use q_autofree. That
will be explored in the future since what we have now works well enough.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 113 ++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d272478e7b0..c41ef0eda40 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -73,6 +73,119 @@ bool is_error(abi_long ret)
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
+/*
+ * Unlocks a iovec. Unlike unlock_iovec, it assumes the tvec array itself is
+ * already locked from target_addr. It will be unlocked as well as all the iovec
+ * elements.
+ */
+static void helper_unlock_iovec(struct target_iovec *target_vec,
+                                abi_ulong target_addr, struct iovec *vec,
+                                int count, int copy)
+{
+    for (int i = 0; i < count; i++) {
+        abi_ulong base = tswapal(target_vec[i].iov_base);
+        abi_long len = tswapal(target_vec[i].iov_len);
+        if (len < 0) {
+            /*
+             * Can't really happen: we'll fail to lock if any elements have a
+             * length < 0. Better to fail-safe though.
+             */
+            break;
+        }
+        if (vec[i].iov_base) {
+            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
+        }
+    }
+    unlock_user(target_vec, target_addr, 0);
+}
+
+struct iovec *lock_iovec(int type, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+    struct iovec *vec;
+    abi_ulong total_len, max_len;
+    int i;
+    int err = 0;
+    bool bad_address = false;
+
+    if (count == 0) {
+        errno = 0;
+        return NULL;
+    }
+    if (count < 0 || count > IOV_MAX) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    vec = g_try_new(struct iovec, count);
+    if (vec == NULL) {
+        errno = ENOMEM;
+        return NULL;
+    }
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec == NULL) {
+        err = EFAULT;
+        goto fail2;
+    }
+
+    /*
+     * ??? If host page size > target page size, this will result in a value
+     * larger than what we can actually support.
+     * ??? Should we just assert something for new 16k page size on aarch64?
+     */
+    max_len = 0x7fffffff & TARGET_PAGE_MASK;
+    total_len = 0;
+
+    for (i = 0; i < count; i++) {
+        abi_ulong base = tswapal(target_vec[i].iov_base);
+        abi_long len = tswapal(target_vec[i].iov_len);
+
+        if (len < 0) {
+            err = EINVAL;
+            goto fail;
+        } else if (len == 0 || bad_address) {
+            /* Zero length pointer is ignored. */
+            len = 0;
+            vec[i].iov_base = 0;
+        } else {
+            vec[i].iov_base = lock_user(type, base, len, copy);
+            /*
+             * If the first buffer pointer is bad, this is a fault.  But
+             * subsequent bad buffers will result in a partial write; this is
+             * realized by filling the vector with null pointers and zero
+             * lengths.
+             */
+            if (!vec[i].iov_base) {
+                if (i == 0) {
+                    err = EFAULT;
+                    goto fail;
+                } else {
+                    bad_address = true;
+                    len = 0;
+                }
+            }
+            if (len > max_len - total_len) {
+                len = max_len - total_len;
+            }
+        }
+        vec[i].iov_len = len;
+        total_len += len;
+    }
+
+    unlock_user(target_vec, target_addr, 0);
+    return vec;
+
+fail:
+    helper_unlock_iovec(target_vec, target_addr, vec, i, copy);
+fail2:
+    g_free(vec);
+    errno = err;
+    return NULL;
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1


