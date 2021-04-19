Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C0364690
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:59:20 +0200 (CEST)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVMt-0008L6-OF
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIU-00039Y-Pk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIR-0006ur-Vl
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so18261884wmg.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ie/HrKCWMTgDMtDkCgxYlk1rMs08SJcDlY4V+84QG/k=;
 b=GwRCwpNroyxUenjgMzBfjd9rXFP8QZLVy9nC6E8HdrUZUhMXaK0SbT4uCas25vRaoV
 sEWCpjCToFMw0gaQr8MxSc25KZSdJWGb5VV9/Z+s1JbruHdQym9MlefD31kCq3C6YKmM
 Nb4UG3MlbvhJYXc0Tp/n9HP1OKfC893eE8sY6qcVrLj7YFU68woj2KIci6eZRHsME/nk
 aszUt3AG+FTeiP1S3HOG4tD7qVIImcF5q5+c7h0Yapqvwq3J22JHAKbJQODyZOg5K8Q0
 0uPj+Zo1J9Ww0nqW96w0VE4BUFkny66YGREL6AwQ/ufbYAEaHv+JisuR4zYJtg2XJYb5
 Zh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ie/HrKCWMTgDMtDkCgxYlk1rMs08SJcDlY4V+84QG/k=;
 b=YuGkLmX3UuaVS4yrdY2TbRwcHEu1laOoHmXm1okT1CpOMX4eyI2AffPVI9Q+Gb7joG
 yQNwFhaMgnrKIBPZfV9Mw38ndq6bS+jyzEAkQVgtyvm8OuFXTBub1olNx/h1/o8BxsNQ
 gdUN5rJl/La23UP4DqrEakzDMQKgxB3gtCEXTukB8qOKVutLjslAeujbGztgA3Z2Pjxa
 Lekg9LJNEw3QTTHuXba3fH9PZO1cDTOuUfH8eYsbfAl7fV0WPWX7iqPoEG2l31iu3H9w
 /GWlu4iPtET4PR3hfBgjYIXV82yiuzW11cS/i/ReAiciez5QY5LPqPxgo+Ib/muV3Ydb
 dk5w==
X-Gm-Message-State: AOAM531D2/rid/4fpbKk8RiWew/7hYuBRn/4sDYmJxYoql7f1O5UUC3U
 RAHPQHCRy1TOO3Cqu5aKILuc5g==
X-Google-Smtp-Source: ABdhPJym8ubzHi3pXo60tXca+HSIbulUopXb/G/nOz4MCnj46wx1gOCP/WpYxn/TwqtDPIWz5VR6Lg==
X-Received: by 2002:a05:600c:20c:: with SMTP id
 12mr21434683wmi.138.1618844082675; 
 Mon, 19 Apr 2021 07:54:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a142sm1477950wmd.7.2021.04.19.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1FEC1FF90;
 Mon, 19 Apr 2021 15:54:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/25] tests/docker: allow "update" to add the current user
Date: Mon, 19 Apr 2021 15:54:14 +0100
Message-Id: <20210419145435.14083-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

The current user functionality is used for cross compiling to avoid
complications with permissions when building test programs. However
for images that come from the registry we still need the ability to
add the user after the fact.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 9b3425fec2..7a14058801 100755
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


