Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5395137288E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:13:01 +0200 (CEST)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds32-0006D4-AJ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsz-0002V0-QQ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsy-00037r-2R
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id v12so8693010wrq.6
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89FGk/7QSTLsW61jmi4iC132gql+p7Aet7f7N9abrBY=;
 b=U1249CTFphaPEBl7URrQajoY/q+Njr/qyVEqQ/ZZPBAgUHnqOPOGQS96C43BfdGahS
 wVcCd2ZLFPLEXZ/k9LiaDB4IfDEQStI+R5iMz6jCJhe/oW7taXrvNCYZe9BGlI6B6Nl5
 DKwp+FUHa1TWx5NHs+NV6LJxsj6zi0DJpaQqIhjhH4zoPIlmNfvc4T81ZyHV9CHGIYxN
 S1z4+8sHV8yE0c5fcd3RWJPxTqGGiU3Sbxzck69awwZA1qxU7fYWpaqZ4DT3gL1XpTBO
 0vRuEBf6WcLP/K8pwrbFM1cjmpPAArfFUY5wjTXt5YOTVoNgOklbgGwEpmnUlzGjybIU
 Sihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89FGk/7QSTLsW61jmi4iC132gql+p7Aet7f7N9abrBY=;
 b=GcLxJPZRzQvb85ZejFy2BrKO4JDEMkP7zhmpj23cOfborvCU3uNyqPeqyFTrWisPOB
 Fug1p4cgigzIqd+KGXIjIbb3U3E/x7VLVlmA0HOzjtMP8YKrrK3twfzk4tnPtDcY/LFK
 gNhRypI4o9ydtE8VC8DlrxfEXS0qbCPpPADJZoXLcgthmTlWTiJDkhq6/BfY9/W3DEnR
 Aif50l1cA8bcHSHs8PC5YYdAZbxh1XY1utYX+Ggff/SCMcWKVVMhT2f7dWzRUgtvLYku
 WRY2QadrhHpG2VbHyrlHygqZdKSHcucS3fmGysNkS3rsiBZcyXjVEgGXpC6I2Et32boC
 pW4w==
X-Gm-Message-State: AOAM530Fhs5YSzNusRk7rUSNhRnmCqaSREIzOUsALjLm0WmWzgv3QRkV
 SQSBJKZnaHLoJXWuuh/llPC7xg==
X-Google-Smtp-Source: ABdhPJz64dFJmrj1CjrcI7EBc1Pvpcact3ZrqLNNYSvXx8x1Qa8DjshXFvc96sGp5HGUIudME/rovw==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr30375717wrs.134.1620122554683; 
 Tue, 04 May 2021 03:02:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o15sm5826361wru.42.2021.05.04.03.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0926A1FF91;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 05/30] tests/docker: add "fetch" sub-command
Date: Tue,  4 May 2021 11:01:58 +0100
Message-Id: <20210504100223.25427-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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


