Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBD3347EE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:29:30 +0100 (CET)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4WP-0000SK-3R
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qq-00065H-2j
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:44 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qm-0002kC-Bb
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:43 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jt13so41079163ejb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KGrYzIufJSpHy5l9wMOv7nypCu9GhpL0NWYqpZ6BI7Q=;
 b=WhfDZF7poRcYiWTUNS4HZa2X96XW+LlxhDi1zgIDRryQt+i6M45oOXoVMayUKdv3AA
 gv1/ed1n0EfzuW7QeXq8qm1dF1TOVuNYNNuyxbh01GHNHiFEkr9BtvRjh2z8FaGQJpFo
 Eh6szjbI+thgGUgTDXqBh4FQnZlVaamhRibDN54dm+jaUBbQEhJEKevFPdOv8g7lft7j
 9GTwfJJZPe9rj2EOq7TZbZgTLEPHHzSDoO5VOi9RiL5xdZaZAFxE/7XMCe3S3l0Zz3jT
 3nusQRmBeQz6n/s+IKLUpCCJMonXrfZA/lhmQ/rAzCKRreLl5nrqCPb1pmlhHUwpo6EO
 F8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGrYzIufJSpHy5l9wMOv7nypCu9GhpL0NWYqpZ6BI7Q=;
 b=JBdkNOjg/iGr1PpeDt2bAaBQFCn2k42YUojWlJh5TZhEvEUGRXfN1yzqMvvZs5tczB
 Yo5jXaupcWUvSfE0M/4z8MdwHXhhyAit2nnoOmBhgCJVQetQB78WPe+90PPNo51GWwVE
 yRCNA+sdCJ07hAuMQlWBrgXZ9el0L29FWLTf0mOXOgm4u3K669jnJ7/nW2xlKhAcLYYG
 5Y9cObx0Nd91DDkxlaAllgsRIOHqWUbQbLJFDc7gkWZo3YL01M+Nru0+vjrtMVYslyCH
 R8KcCd6jRHzQaeoDQ1mNxHq72aWtGRuQOkSTl9oqPE351i452XXL0kCaUyBoh5G1KZFo
 om4Q==
X-Gm-Message-State: AOAM532MhbiXK4QP+tpxulfbPRmsT3FM0PHVJty7uD8h0WHDiwO6b4y1
 DL96kH1zKDe31Try9qYzjKubjXRW24n2uQ==
X-Google-Smtp-Source: ABdhPJzcRPb/rndjj+G5HTnJPEJEbQ95T/4GLDrtmgwpUuPcodhYj6OS4R6QuoBvlfCG7Hq58LOKMQ==
X-Received: by 2002:a17:906:18aa:: with SMTP id
 c10mr25632ejf.248.1615404219070; 
 Wed, 10 Mar 2021 11:23:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e22sm95477edu.61.2021.03.10.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FA6E1FF90;
 Wed, 10 Mar 2021 19:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/7] tests/docker: add "fetch" sub-command
Date: Wed, 10 Mar 2021 19:23:28 +0000
Message-Id: <20210310192331.29284-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply wraps up fetching a build from the registry and tagging it
as the local build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 86d31a5fe6..f6f461bbc9 100755
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


