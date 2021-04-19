Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B454F36468F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:59:17 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVMq-0008BV-NH
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIV-0003B9-Cu
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIT-0006w7-Rm
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso7029356wmq.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RbxDIMfGuk4jyYqFSJ3FeoHclrUhVHd7ZrGgUd6bcYQ=;
 b=g1+DkCbmXu//AkXBCmYTkjWYOO4LUh5AF2gnTYT1QBmuGNDOz8xQieQhdlU0rbbYO8
 L7pCVt33dklKjIYpOUiBYMMw+hir0yukXt2vo8mJkVXgIzeJNtlWqLpWXKnw1w1arSID
 xY7SYa7l6wRTj1QWWjBjWpr6ve/Pv01G0Szdumj7U1cHCdaz1EWWCcMJ3dJE1K5oQt3z
 aN2DWzZjtfD1QHr6xuUUZ07wAyhjfSSVwBFKJrw5FntgDp/0GWA2/zCQw5G0+++Z7fAu
 W2EeitlKpqABbKETDPmeMo1JJlnZciy0M5yDWaNGGsfHTxYBas0lGYIl9/lJ/DG9PNUZ
 Ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RbxDIMfGuk4jyYqFSJ3FeoHclrUhVHd7ZrGgUd6bcYQ=;
 b=CxQlybPavQw6NWdoT8u7LG9J5mo4FMrc3SM8PsnldMS0PdWE7BGqVKc4HnqbP0r4nN
 zlNymrTSCSLH3KMGMJnFQdRBuw65261FtQqvCauQMjy+GTwNajCaeHp0yjuB6QDUWUcS
 a34Dk1RjNzm6uGW8N77ONlkPOwpXXLoTunrsmvIS7eiSVAaSATGItZdhQ3ZwkTdTfKGs
 2tS+2B3e2uIOKNCKvdE0qIyYoCa3Pud9MF3m2fElpr3Szq+B30mJecQ3rCtX11iwnszM
 V+K1ZSpVzx3hdt705LuahOqvLVJROj6ihwhkTLMsYH0daKOMVmhYvRDAHqB7lwMathHQ
 WIUw==
X-Gm-Message-State: AOAM531TnadIO5zETouzY28lfJQjJ2RTUN2QUpwnCUo5HPJTn1+KbhZP
 BUVtJe2rkTwdjCwU483XA2XZNA==
X-Google-Smtp-Source: ABdhPJwJWYo6noWwwBfYU4ZbO3yxXM4GkTYgjuJquKWnaecpO/QWpb4slVxiM7j09V442Z+m3G7lOQ==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr9942266wmq.80.1618844084435; 
 Mon, 19 Apr 2021 07:54:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm3780411wrg.80.2021.04.19.07.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13BF81FF91;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/25] tests/docker: add "fetch" sub-command
Date: Mon, 19 Apr 2021 15:54:15 +0100
Message-Id: <20210419145435.14083-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply wraps up fetching a build from the registry and tagging it
as the local build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 7a14058801..4d9bb7c7ed 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -515,6 +515,23 @@ def run(self, args, argv):
 
         return 0
 
+class FetchCommand(SubCommand):
+    """ Fetch a docker image from the registry. Args: <tag> <registry>"""
+    name = "fetch"
+
+    def args(self, parser):
+        parser.add_argument("tag",
+                            help="Local tag for image")
+        parser.add_argument("registry",
+                            help="Docker registry")
+
+    def run(self, args, argv):
+        dkr = Docker()
+        dkr.command(cmd="pull", quiet=args.quiet,
+                    argv=["%s/%s" % (args.registry, args.tag)])
+        dkr.command(cmd="tag", quiet=args.quiet,
+                    argv=["%s/%s" % (args.registry, args.tag), args.tag])
+
 
 class UpdateCommand(SubCommand):
     """ Update a docker image. Args: <tag> <actions>"""
-- 
2.20.1


