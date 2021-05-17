Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99776383985
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:20:39 +0200 (CEST)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifyw-0000KL-Kz
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpB-0007NQ-NY
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp9-0005yE-If
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h4so6982606wrt.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uUMKiPKMAS7O1QKMD26oNu3/VNnJ7Kibrl6YvpCZrWU=;
 b=JAx6hmmRmYi4Gg34VzXPFAKHVTHLMKGhQaB8C7EbsSTOrVqrwXzBe1zQsCT8gyIhH4
 boWYo020crllYJPBfyIFejhnjUCgVRxukKE/AiRba+yam+VaQLwhrEb8bFxlGtmDLtrR
 RbgNRrgfZcc8uDHoLAxzdq910O5kwYqMaUcMSwtpYVPdC7prW4cIRAiKy6YoTroxjRDI
 3WB6Vaw0LcRpdU1qzr+6Ag/xLx5rcssnYGVna94W32rFTVcblSqO58ExaQjrlXILpIqe
 jU1eZILtcPBY1MRaRiCD+pefm2TuJjeGN5V4xL9ZPSCCjeVDppyCmeFkPcq0zaSeCdbv
 veJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uUMKiPKMAS7O1QKMD26oNu3/VNnJ7Kibrl6YvpCZrWU=;
 b=CSlmSzPiInSh9XzPR2xh3Z7z7Q6NqyHZFWydIMpQwIbd+ToDWmYxxUI3MPYXto5Rz0
 xLOAaFyGxLleknVvB38Fz4cSmh09aP6WxwfsJmoKFEGlEwhKEvVd2xTNjCL6ur1tZsLm
 O4GieY6FOJPbjzE4n+ke+4Hb5c/KVMPc75qno3VTa+pPBOEdFpuhYqBIyE6vIwJnrKTD
 FX11kcJDa3yYG8iofUcfr5wx2vc8KqUvjqYq9qsQYXDgoRqFyQW9lqH6Oi1922jO5c06
 Katu60eOF0muZ5Apa3vJAvLw7luF/cSsjiaD/0z3v4RgMs921zcG5NGpECH5fbt4zQrw
 viVA==
X-Gm-Message-State: AOAM5306WEO1HafE/8ASzmyGs20sjriuUiYPf0HEZoYrSzOg81XJYk6l
 7gDJFgDNxlkUmv1sTLnm/mPFVw==
X-Google-Smtp-Source: ABdhPJwHO3l6JkDuZqbXABrWyLRxfeFDW5zp+W0DUBSM6JGF6RZyRy3UsI8TejXr29jxLg6usr0lVA==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr557215wri.30.1621267830225;
 Mon, 17 May 2021 09:10:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm14896092wmq.30.2021.05.17.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65E1C1FF90;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/29] tests/docker: add "fetch" sub-command
Date: Mon, 17 May 2021 17:09:57 +0100
Message-Id: <20210517161022.13984-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply wraps up fetching a build from the registry and tagging it
as the local build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210512102051.12134-6-alex.bennee@linaro.org>

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


