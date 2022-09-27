Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD05EC223
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:13:25 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9Sl-0003Y7-WC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R5-0002nX-CY
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R3-0004wc-0y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:34 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d82so9340206pfd.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Xbly5vz1qBo8k8w0L8MD2gVaN8gjFWYNLEXBptBTNhI=;
 b=jKjJ/RrFL1NVdKxXfJGGhE18ZjkURJH9m+nRENCzAo9ZXDrbfWOyW1aI6gzhTSL/JO
 aPmIKbuLHj9baWKsgEfNQBWT9mnIeizOmGaH2ZZTWv7dn12zu/niM+PFGUPxvSwr/KZ4
 omIJCECuRKjTa8Xwps9P1jYmp4k2SSHnvjJgarHIRBxiJBjJh/Ir5Qcgk4cV0OqC26S/
 gP1JMUrWHNF5PqU70H8tuUOR1TXQSf+AeSFS47tB++JJFTR0idZybmr89BBhO4b09utP
 CgnILMF9iQhufDan3dxpEMMlE0G0xHRoM1WvUyWi7rILRKiLb0B56nSIG6nkZlwaMO35
 DK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Xbly5vz1qBo8k8w0L8MD2gVaN8gjFWYNLEXBptBTNhI=;
 b=werJuibQ+l656XMWE5z3Zmw1gMwmOOfibSvlDrWf7FQQUdQ58FnbihF8w2P/vyxeD+
 wm+Vm1BPYICrCFIYd+mkuzOtnQA3+ncC0HSiwZmYHfbVvcBon8a6gfsnR6ViQ9wlTJyo
 TxEZmQgIk7sF+Xv+gkXkMmaFPflRmYUJUTIvvI2renDHemVCkk5U8/ydV6CsE4WnoE+h
 zDzVtJk5w8QhKSMyJDKprJlJCC+CxXitg1MUCZ0V2+sz58vIz1WGo6+saXCUKI1S4uTS
 Jhb31Qx0Boypmn3KG4mIEjgCpjYbZBlx9/sPpN6dZvnXtuexZLMQLDfLBYJSS0eygj8J
 lp3g==
X-Gm-Message-State: ACrzQf1V2NRXO+IeT22//vZ0q83bJbaULWWJqW85N+twBVJbmk6z/o0K
 LQhMaoRynZ728k3bynv2k99ojFj+yeI=
X-Google-Smtp-Source: AMsMyM5mkc57t6bfYzUwVnXsdR82295TNCYDc6622bMq9vpSsusldQe3BAA6WOLYGpwFqhaf3sjNEw==
X-Received: by 2002:a05:6a02:43:b0:43c:dbdc:192d with SMTP id
 az3-20020a056a02004300b0043cdbdc192dmr5022284pgb.449.1664276851735; 
 Tue, 27 Sep 2022 04:07:31 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 18/54] tests/qtest: vhost-user-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:56 +0800
Message-Id: <20220927110632.1973965-19-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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

Changes in v4:
- Update error reporting

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/vhost-user-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index d7d6cfc9bd..84498941a6 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -482,8 +482,8 @@ static TestServer *test_server_new(const gchar *name,
         struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
-    char template[] = "/tmp/vhost-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
+    GError *err = NULL;
 
     server->context = g_main_context_new();
     server->loop = g_main_loop_new(server->context, FALSE);
@@ -491,9 +491,11 @@ static TestServer *test_server_new(const gchar *name,
     /* run the main loop thread so the chardev may operate */
     server->thread = g_thread_new(NULL, thread_function, server->loop);
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       err->message);
+        g_error_free(err);
     }
     g_assert(tmpfs);
 
-- 
2.34.1


