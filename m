Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D643347ED
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:29:28 +0100 (CET)
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4WN-0000M7-4M
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qo-00064i-EC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qk-0002hs-5s
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:42 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b13so29865216edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3cpP5ZojDuDn/CAqL7XfB+7+n/MJmTsO9r9UuhC5UGQ=;
 b=m/BOXJPYNQ9oeGDJQy4zC51B7iHxMIsxWys6Q+y+xGUJHwzI0cdqowQx8cNvvh5a20
 ut+tKoElkywyj7+ZDaWRwlNVmHVOa5KFuSqcPClRFTrtUtWfhG2jjnVhgRwdpzsf1iVP
 ofcUwcGYNG+fAg7Jv5eChoupWUEvGqWqlrFVKThoUxHmDcQycErfX3ON/ldFaTKhepgj
 gZrAiSgvWzxyx1Cng+9kSCB5YDRwQvQNEabY1SNmZN3d45c8rzrpXVj/5IleBqZkcMqf
 2gzCbb38zjoab+mUCe4q0Hi2pfu1ybNjDj/A2nO5z3YnD7LEAgXxllPu920Lz9ljCyVF
 zkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3cpP5ZojDuDn/CAqL7XfB+7+n/MJmTsO9r9UuhC5UGQ=;
 b=Djc2CfKlI0E+fITmS3vd5rXW10jX3D9gsZWCGIlX+yOHPwI9RIvAMWELDN1LRZepYu
 18ngzpOO2ESsWf+EfxYIGYiX8gTpEetlBpp9ArJ9bor7OJTCN14NB0DmDB13pkxJ0Z6z
 tAAoLCFYy+MIuFKluVWKCuihS+yP4nT9ubrFZr3TleonxAbNtXAoBWy7UJ3kHPx+YGmN
 i1D9SpLBw6iKA6A3AZoEcWJ+NczLSHNfvYLS13JvEY8zbAADKCmKXjTo1U0PXfkkb1AY
 J+TZDmRjT15awY9d8Mpt1nHCyMep7Fo2ljVBYLmxL29z/g08aQpbkk6df2diEZgETDxz
 Ud7w==
X-Gm-Message-State: AOAM530DchWDU4QCFer75IzGILpjbJln9bfRaUcFvDGOStI0fXNy9I2N
 15NtRLEi1JAHlMvvGluI0nkE2A==
X-Google-Smtp-Source: ABdhPJzBHmzsjU+wQS2YL6Pl4HBEva61ZZcm57VPidrP7yejobFpKChjxMyarAu821+h6rd/EOEJHA==
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr5073445eds.269.1615404214437; 
 Wed, 10 Mar 2021 11:23:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bt14sm90203edb.92.2021.03.10.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C64D1FF8C;
 Wed, 10 Mar 2021 19:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/7] tests/docker: make executable an optional argument to
 "update"
Date: Wed, 10 Mar 2021 19:23:26 +0000
Message-Id: <20210310192331.29284-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

We're going to extend the abilities of the command shortly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include |  2 +-
 tests/docker/docker.py        | 56 ++++++++++++++++++-----------------
 2 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7cab761bf5..8f66049dcc 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -245,7 +245,7 @@ docker-run: docker-qemu-src
 	$(if $(EXECUTABLE),						\
 		$(call quiet-command,					\
 			$(DOCKER_SCRIPT) update 			\
-			$(IMAGE) $(EXECUTABLE),				\
+			$(IMAGE) --executable $(EXECUTABLE),		\
 			"  COPYING $(EXECUTABLE) to $(IMAGE)"))
 	$(call quiet-command,						\
 		$(DOCKER_SCRIPT) run 					\
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0435a55d10..2352fdcd24 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -523,7 +523,7 @@ class UpdateCommand(SubCommand):
     def args(self, parser):
         parser.add_argument("tag",
                             help="Image Tag")
-        parser.add_argument("executable",
+        parser.add_argument("--executable",
                             help="Executable to copy")
 
     def run(self, args, argv):
@@ -532,35 +532,37 @@ def run(self, args, argv):
         tmp = tempfile.NamedTemporaryFile(suffix="dckr.tar.gz")
         tmp_tar = TarFile(fileobj=tmp, mode='w')
 
-        # Add the executable to the tarball, using the current
-        # configured binfmt_misc path. If we don't get a path then we
-        # only need the support libraries copied
-        ff, enabled = _check_binfmt_misc(args.executable)
-
-        if not enabled:
-            print("binfmt_misc not enabled, update disabled")
-            return 1
-
-        if ff:
-            tmp_tar.add(args.executable, arcname=ff)
-
-        # Add any associated libraries
-        libs = _get_so_libs(args.executable)
-        if libs:
-            for l in libs:
-                so_path = os.path.dirname(l)
-                name = os.path.basename(l)
-                real_l = os.path.realpath(l)
-                try:
-                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
-                except FileNotFoundError:
-                    print("Couldn't add %s/%s to archive" % (so_path, name))
-                    pass
-
         # Create a Docker buildfile
         df = StringIO()
         df.write(u"FROM %s\n" % args.tag)
-        df.write(u"ADD . /\n")
+
+        if args.executable:
+            # Add the executable to the tarball, using the current
+            # configured binfmt_misc path. If we don't get a path then we
+            # only need the support libraries copied
+            ff, enabled = _check_binfmt_misc(args.executable)
+
+            if not enabled:
+                print("binfmt_misc not enabled, update disabled")
+                return 1
+
+            if ff:
+                tmp_tar.add(args.executable, arcname=ff)
+
+            # Add any associated libraries
+            libs = _get_so_libs(args.executable)
+            if libs:
+                for l in libs:
+                     so_path = os.path.dirname(l)
+                     name = os.path.basename(l)
+                     real_l = os.path.realpath(l)
+                     try:
+                         tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                     except FileNotFoundError:
+                         print("Couldn't add %s/%s to archive" % (so_path, name))
+                         pass
+
+            df.write(u"ADD . /\n")
 
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
-- 
2.20.1


