Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45B3874CE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:09:41 +0200 (CEST)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livjQ-00022r-U8
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhI-0007mh-To
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhG-0005Pu-OC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id j14so7587387wrq.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKQRss2uIBpRXo6hgFfm/Wk+D//+r61sABFE2JlaFZg=;
 b=WeeCyq1n8l1luYCg9Z06/+h6ukfDsAV9uV7wM1zC8IbBA4DQZKHjia5sHAOYAJhqoJ
 tkoaN1UPfSChEd7Pey2H39VynxBMtmpD2LoJb2A4xE7UMLPf+s+NJFu6fn8lj6y4QhaB
 m6c2m1pdXyazWac4/oC4uC6WN+qyd7aw5SK1BhCAz2YoYdokUJlOuJoCJZq0aL5fSJLS
 9aXwDqT+C5uv/0566PT4bGGYGn/uvHa/PQ6HXhUlb0oafW9VGaL90CmRt5HCpYHdqcXS
 b0Dtp1YNZ5R+sAxZy9qVH/PAafEB/G7vtX5tedELESPAY2Hg/7kc1pfOm2sVe2VcIax2
 NCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKQRss2uIBpRXo6hgFfm/Wk+D//+r61sABFE2JlaFZg=;
 b=qG4Gr8AF/RVMkCyFPRmX7zyIBuSOkc7bMHSLTkgwbNtDdtts1ihVlAexw6FMGlHzk2
 VqDNuJEp7xsB++OBNyrlYGX1NcuIFdc4a3w9UjoC6SDEAAbakk4Xhv4rRnLzdQVUs8ML
 9VSURP4ZIG67rgPzwWNcE50gGFv5mFUHrwGna6rO4LJ6P+Z+ii7hM1Ncltiu/eVXaEwG
 54bo1APAndX7Yh9vXX5UuSNcneC0OsFJWAR8gPcPe8H1Chx+zkZdaqApQ8Fmq5YaT2Fg
 XzUeFe0howvU+f2A4+Txdys4evNgaWpb1JmOUqDDjlqgbufO9CZE7mw832MIBg2VVDF0
 S7DA==
X-Gm-Message-State: AOAM531eQH9aSwm+pQiK8fdnQX+PElA2JqKh1MeE5fxGK9vuEM9xZZzd
 FmJa3AutKmAN1EI50cxCvVtLvA==
X-Google-Smtp-Source: ABdhPJwcnyIF1LNvcRfdNiIErPSy+ONy0BPtkn/2fG/vtXtvlqDXnaStURVnnusr7NdrMfRTPGF9Vg==
X-Received: by 2002:a5d:6291:: with SMTP id k17mr5632498wru.247.1621328845376; 
 Tue, 18 May 2021 02:07:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm15882585wmq.18.2021.05.18.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 254371FF8C;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/29] tests/docker: make executable an optional argument to
 "update"
Date: Tue, 18 May 2021 10:06:53 +0100
Message-Id: <20210518090720.21915-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

We're going to extend the abilities of the command shortly.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20210512102051.12134-4-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9f464cb92c..820423d718 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -248,7 +248,7 @@ docker-run: docker-qemu-src
 	$(if $(EXECUTABLE),						\
 		$(call quiet-command,					\
 			$(DOCKER_SCRIPT) update 			\
-			$(IMAGE) $(EXECUTABLE),				\
+			$(IMAGE) --executable $(EXECUTABLE),		\
 			"  COPYING $(EXECUTABLE) to $(IMAGE)"))
 	$(call quiet-command,						\
 		$(DOCKER_SCRIPT) run 					\
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0435a55d10..9b3425fec2 100755
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
+                    so_path = os.path.dirname(l)
+                    name = os.path.basename(l)
+                    real_l = os.path.realpath(l)
+                    try:
+                        tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                    except FileNotFoundError:
+                        print("Couldn't add %s/%s to archive" % (so_path, name))
+                        pass
+
+            df.write(u"ADD . /\n")
 
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
-- 
2.20.1


