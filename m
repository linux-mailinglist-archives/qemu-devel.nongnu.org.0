Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED0937BA53
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:28:04 +0200 (CEST)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm5p-0003VY-IU
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzD-0003IU-7j
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzB-0003ZX-EQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id l14so23047789wrx.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89FGk/7QSTLsW61jmi4iC132gql+p7Aet7f7N9abrBY=;
 b=SLxx1raCEuxOAhZ10P6ubKoM1pDlkluS3zc04Ord3kKEnR+Xpg0lU+lHZMDp2RBCUt
 xNuAK1AZoOerSv8lYbxAwflKfv78CxCqo/jVFFR40WMINDmxW9hUEAuqEaur1eF/9rvA
 mhfzYcGQv9jvgzz6A9/k/dPUPSRU2gYvMN57B3h0rrjSFRsfDzaDNf0Vnni2UMuf2G5c
 /+TgVtdVj2wSOIE/AjHPUNk0V9Z8YmcVVOsMda2AXksWb7ONCMsU5yMvhfmn+h7Bfqur
 rshwGu5GncD7gdGaxT8gEJxNswMvAGYcTKJk6hX5oXKTO98THNvUxQi0cy+rbKpKvId0
 FXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89FGk/7QSTLsW61jmi4iC132gql+p7Aet7f7N9abrBY=;
 b=Nyc3oZe3GidjYzoR9qCkciCdxC41mUw72L3h1/cyKn9xRxv/l3+vDa1zZHm+8UIig6
 D8vsek8jCEahts2RbhGFMfj0uRCsl2TQTOGpk+nGLWjpLVbzkqrkf7SHJfeut0H78VUv
 NBUHo6OG9HO06ArN5oais4C4i0xwErndMNb/lIZtJHkhM77ZLmxAAlmvSdsifz2hMspc
 SV1SE7gzzNHt7aScxRTZHXgno2UJ4J1nCwC6msrIjDL8rXErSPI/Vjj45QIl9Mh4O8lu
 HklC9eJlGahUwzA0xkT8yrG2DbeL3xF8/iTN+Yy2neTPhrVfsej1jIHKmL+dNAnxAO4X
 k+/w==
X-Gm-Message-State: AOAM532t3Nf3RFf5YsO9F364YL6EFF/knLYllZKvVSuG6JYlCW4xuLW2
 hiLG5NyyAwf7lyJj67l1GaC4AA==
X-Google-Smtp-Source: ABdhPJzfmJbLU4lj/DtffJE3CFGaN+Qragd5PxYeLHdYkpB5cqEL1aymaf01RVEkFA2wYSdq/kB3Qg==
X-Received: by 2002:adf:f508:: with SMTP id q8mr44711320wro.109.1620814860117; 
 Wed, 12 May 2021 03:21:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm34573244wrq.45.2021.05.12.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95E4C1FF91;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 05/31] tests/docker: add "fetch" sub-command
Date: Wed, 12 May 2021 11:20:25 +0100
Message-Id: <20210512102051.12134-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


