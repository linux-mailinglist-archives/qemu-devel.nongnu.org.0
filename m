Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E96383957
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:14:36 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lift5-0006DG-5X
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp9-0007HU-1Z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp6-0005tp-QD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3920615wmh.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2w+lSoGUeb8mcgLQ+RwoP+3nXJnqsEfRl/hSUtUI2kg=;
 b=UC7KpDFhJ78bOWVkqXOpjsLrb2eJ8qr83DdSdBiu5Z/HWxWMDv1L2OFExJYZ0/Lu6Q
 cKwSX7DybMXspWqhMDqESzUh8ok6u5HCywYMcvPELXH22U3kjMELAAzMh8/zmlL2sfIT
 iDgLgRuyOLHG6mL7abgwHpSTZ+O+72rD5ejpCP/HRSPC85rSws0pCIkco7pRFyWIXPak
 v5GiPMHN9maoBmxLqXTHjZCUETa1uoPudvK2KPIiHh58Fm04G2KB44wayVKdTsMWw8fZ
 R4xW2CXC2T/gNt3UCmDdB1tm8O17hktw1rOOoawbh1haMzbuDPoUPb7xEA2mJHu6rQxy
 9Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2w+lSoGUeb8mcgLQ+RwoP+3nXJnqsEfRl/hSUtUI2kg=;
 b=OpWpZ1C+JXOcYo61/f6ZnRZ4BM3g7O5gfT2UoFlnTKhTSZWx4jAZ6LegXFCJbx2Czr
 mVNVGSd81giLUYDyW963ycpf3x/SC3uyyBLV5l8ktTBBWA4h8+YVIoYuLr8Bp2mCDlju
 s55vF+62GuLFdcM7NNNG2NM+SUSYNqvS/Dyo1BFdNE1yq1rBU140EGDL30NEjLLaffw1
 KA/o+08H+vlijX0A2T5UoyDq54wR+i5P7+w/DQ4ikf6Ml2AXqwjKPh9PJyha+7FMvsN+
 Kf2Ylg76DqUscS8ktd2tCTT1YyaYjD7T/WAH84y+YrNGODTe5ACtRR/mFdx7UHhinDq5
 H+Vg==
X-Gm-Message-State: AOAM530Q1E48YX3ouraBdW6/aAxvnAoIzVQ9QqDWo1FNHpYnku8g1UnH
 lEe0nXR8cVLX/pnNE+7ULw33Ww==
X-Google-Smtp-Source: ABdhPJzcyjF1u4RjzfqIMoV/S8r/N8hO6rCAQTsxrb2i2urWaeVLS8F9DLgV4iP60pd5Wjd81QlHJw==
X-Received: by 2002:a1c:e156:: with SMTP id y83mr608422wmg.89.1621267827471;
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm12029418wrp.46.2021.05.17.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36DCA1FF8C;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/29] tests/docker: make executable an optional argument to
 "update"
Date: Mon, 17 May 2021 17:09:55 +0100
Message-Id: <20210517161022.13984-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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


