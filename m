Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD16334807
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:34:01 +0100 (CET)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4al-0004jL-SY
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qp-00065D-Ej
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:43 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qk-0002ie-SM
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:43 -0500
Received: by mail-ej1-x632.google.com with SMTP id c10so40933511ejx.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFa+cdC9IBoTS22ijLymreQbHtfFC8aWs/cXqoq0jLU=;
 b=SZaqtvYBS08K9aihvAFHuz1wZIitaMWYOzuwZBQJxikjH1g2HbsbTB8BvKbo3AkHf8
 dAJsFzXB9h//LJKirSrNbsBA25VU9eR83vqnkqIJgSsR9bCpPGVQnChuMwr8XPyCADcV
 Qrr08ZOeJJDBLEU9kekaba155Xft4kbPHqP7oR4pdNTJlAZh8jXyRUV1x6FvjBNWmJuB
 MSJB5BBrU+ctuEqxLeVzoxKeFt7LpDb70TFM0CAj05DbjBsBg9b1bthPhgR4SXN9CDUR
 EEaeiGtfsi+tqSklCn5thmf39Y5CZpjlOCMyu6IuJH2SYYVuG3FoBxm5iSvBwcBxCWmx
 Jfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFa+cdC9IBoTS22ijLymreQbHtfFC8aWs/cXqoq0jLU=;
 b=f7ynjlwQ0Ep+T0qE5WiJZxedH6KsOpdVmpyW55N+5/1MuapoZxW2z+F3DaGnU+JkSI
 6MIS6gAjHoscPyLr9CVqd0dZtJuJ3TQMsoqg439KDtnN7h5mO7VtfMQ1J2Sqceo8c2Lt
 U2Q1UxRX1rcOmTXihUzP/ITuW8D8Q81ORCG5U/jur7oCoPPR07dDKmm0ASIOuQAQ1828
 uSNz9Np1UGnQ1Z2biql46xDNg0ochFKQfdgpuNmFO9rHBmwooJACROzSEpLDQ+bEL7LZ
 NIOdR/PVpcDeyC99YAtZEmf0nJiaA/LsbUPKfpRZ3zJoyM+xhY73VBlV8A3yl/YYq1Ev
 3kIQ==
X-Gm-Message-State: AOAM530foaGW2q07P9AXp1LIgr8XqLflyvFF5VcGC02BGfi8/jNU6Xzh
 nGvnxOdF12AnnHcMkEbFoTIOEw==
X-Google-Smtp-Source: ABdhPJySPeUUymNgRrBJXEbT8/7K8rO0ADyu8y4t9XyaNRfi/xUDE9IL0WBvjaGQkXm3q73pWtcn3w==
X-Received: by 2002:a17:906:75a:: with SMTP id z26mr39380ejb.22.1615404217007; 
 Wed, 10 Mar 2021 11:23:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r5sm185435ejx.96.2021.03.10.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 264D71FF8F;
 Wed, 10 Mar 2021 19:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/7] tests/docker: allow "update" to add the current user
Date: Wed, 10 Mar 2021 19:23:27 +0000
Message-Id: <20210310192331.29284-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

The current user functionality is used for cross compiling to avoid
complications with permissions when building test programs. However
for images that come from the registry we still need the ability to
add the user after the fact.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 2352fdcd24..86d31a5fe6 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -517,7 +517,7 @@ def run(self, args, argv):
 
 
 class UpdateCommand(SubCommand):
-    """ Update a docker image with new executables. Args: <tag> <executable>"""
+    """ Update a docker image. Args: <tag> <actions>"""
     name = "update"
 
     def args(self, parser):
@@ -525,6 +525,9 @@ def args(self, parser):
                             help="Image Tag")
         parser.add_argument("--executable",
                             help="Executable to copy")
+        parser.add_argument("--add-current-user", "-u", dest="user",
+                            action="store_true",
+                            help="Add the current user to image's passwd")
 
     def run(self, args, argv):
         # Create a temporary tarball with our whole build context and
@@ -564,6 +567,13 @@ def run(self, args, argv):
 
             df.write(u"ADD . /\n")
 
+        if args.user:
+            uid = os.getuid()
+            uname = getpwuid(uid).pw_name
+            df.write("\n")
+            df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+                     (uname, uid, uname))
+
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
         df_tar = TarInfo(name="Dockerfile")
-- 
2.20.1


