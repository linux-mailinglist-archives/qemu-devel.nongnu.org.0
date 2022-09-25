Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF35E9305
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:18:39 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQak-0006Q9-8a
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrV-0002wE-47
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:57 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrG-0006LF-6P
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id go6so3958617pjb.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9yPbmRSXJkOB6gGFBYdiy2ri+l1NC0dZ3NCtbtHGDjE=;
 b=Q14cdA6JVK65YzY2nHlWeyow4HhcIUl2rkPWddktvRreNFKNRGjQn3CgihNOhlsG3H
 QeiE34WkSTefp3M7yJsNw6C7A7KbWbNW8dzjmYdVLZ057EAmSTKQCmHCIjr1DzsuucZ4
 tg0Aztoz2pUh9kD/LNn1VsA1FQnezr/zcNudAhyFy52EqcFANE2c2BKkwsUu7P35eXGk
 YtNQaYt5hJpR3jaSfAtlIEplUrtff5IWM86kbRvKmLFUi8epAARnYvuPG3LnhYx8f/U7
 wXm2cXsJEqjn6v7LNdXPP1wn8pWSUFC8lFZyXNkn1ewN9y0bBrkYnJ8Xi+FZKdkhyCni
 hFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9yPbmRSXJkOB6gGFBYdiy2ri+l1NC0dZ3NCtbtHGDjE=;
 b=hDijYrjNiXppCqNApmL68kiyoXA9pOiVhR8xjhiKDbV56uiC9JxrX1jmKDEESfuPQ2
 c76R2fiAHAQEYtEz2GVRoERiImbiGB/sbhL7kwsH9/7ZcSOc96AhPVQoP6tdwXDpgT9j
 cTjTbElgHSwXae6l5+FzmoNi0xAuto0OO0lNrVqT6yiLHe5KlOCrIoJN8ypyhEOi4Hqr
 ZL8nxGe1qQriEODg3hfiqJ7HaQJnOWhyCWZrIsBxhcAbajcbBFfQvFnMaN944EQkDgeU
 yVCjhXxrsbDVBM0IqB68H2AAZJfqtLaPYWMXQB7ezJgn3ZrCenHAnhoaKXHBxe2tya7y
 QseQ==
X-Gm-Message-State: ACrzQf32X8Ak3J355Z0dimIEfbOXt0/G1FvEmYXl4jehS3TT3oeneZmR
 M5RAHSsGRiAdV5ZpsmAeWA2JBVb929o=
X-Google-Smtp-Source: AMsMyM5k+nKdnvmABKAKtIbmNFM3c+wYNTGGpv04YZrIMsIiHREjKSu0sYAEj1T6srGWF/JvjU18AA==
X-Received: by 2002:a17:90a:d982:b0:203:814d:dde6 with SMTP id
 d2-20020a17090ad98200b00203814ddde6mr31117124pjv.66.1664105489649; 
 Sun, 25 Sep 2022 04:31:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 18/54] tests/qtest: vhost-user-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:56 +0800
Message-Id: <20220925113032.1949844-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/vhost-user-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index d7d6cfc9bd..448fda3e7f 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,
         struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
-    char template[] = "/tmp/vhost-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
     server->context = g_main_context_new();
     server->loop = g_main_loop_new(server->context, FALSE);
@@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name,
     /* run the main loop thread so the chardev may operate */
     server->thread = g_thread_new(NULL, thread_function, server->loop);
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", NULL);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       strerror(errno));
     }
     g_assert(tmpfs);
 
-- 
2.34.1


