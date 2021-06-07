Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBDC39DEF0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:38:13 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGOK-0006b7-UM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJc-0003Il-35
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJa-0000Q0-7N
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so16015171wrt.13
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DI4OcJA29QFIm91G7GUTHfaKFnWUsXmcsMW7JjhiiL0=;
 b=XZaQ9JITFfEeH2sW9kODOEAjm6BeVcmWgNvH1CMlcGimSsPcyvJ7YNn5+9fTVyhyk6
 c5tMBlcDtmnGTA6CdvQoJGAHY+fK2/+kR+pbB12C1SRrLUxHZR/hbRDYwVFDB30ItQ0q
 EE8GtQErBLN5kKe8cGjkDRON/u4xnNMh/diwlslyisEOIZJJERHZqMNRw7jIR/qDbFVU
 4WXLRAmDmHgsommvjqeDqhbgZ+SZ0UevlBzexKcpo0+JE0mjWSKr08iETll1h0QptOrB
 YFjyfFK9co2vs50Pmup/A7dHJgxqVa62MVJ6H4iKPqh5SLw3GjK47YXf/nvyW8zRyzjL
 XeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DI4OcJA29QFIm91G7GUTHfaKFnWUsXmcsMW7JjhiiL0=;
 b=a5Rti5O39IryB/zLyr0PDawVWBjpxwHoX1cl3uE62ScRbNAZuA+0DhqtzmL7qimYIU
 k7FxGdIUeRrsRsgGGVvbFjE3rtNX5KFuto0PpJCt4rW8rt4EY3Vgr2xaJPTUUvnKWVcA
 HMCaThfEW36v0CgHlyNeHYCdvfxoXT1/Ocd7CnPq45uYn34zsaM8uyFa1V33cEUDn8rB
 TNjx7Jf5XeacZEzQiEZJ7L29F4QpZeKWdepT05SaWg3JiLy0KqKvTO28SSJQzjjsqHVy
 OClovd1zFsdIzeQpnOg3J34IAYip/v+dRbgykm/aPsi5EFHJAoENgKtBcxb9t04ShKhV
 BnRw==
X-Gm-Message-State: AOAM533MgDn9/SGeVqgBII7AomscdFTc6uJmI90S/4WfeuyOmNoIFWFw
 n99ZV8DwbUIYUvsSkohy+qEFGA==
X-Google-Smtp-Source: ABdhPJxgLpuq6/Dzzq2gFKiErJ3mqBAlRwI4BBBW4WND5gNvuPwRqINq6B/zh4koH2Dr+VVi+MjiIQ==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr16588057wrq.376.1623076396909; 
 Mon, 07 Jun 2021 07:33:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h6sm7760970wrt.20.2021.06.07.07.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AB241FF93;
 Mon,  7 Jun 2021 15:33:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/8] tests/vm: expose --source-path to scripts to find extra
 files
Date: Mon,  7 Jun 2021 15:33:02 +0100
Message-Id: <20210607143303.28572-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
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

Currently the centos8 image expects to run an in-src build to find the
kick starter file. Fix this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210602103527.32021-1-alex.bennee@linaro.org>

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index e94d95ec54..f3a3a1c751 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -84,6 +84,7 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
 		$(if $(LOG_CONSOLE),--log-console) \
+		--source-path $(SRC_PATH) \
 		--image "$@" \
 		--force \
 		--build-image $@, \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 0f2e436ed3..254e11c932 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -96,6 +96,7 @@ def __init__(self, args, config=None):
         self._genisoimage = args.genisoimage
         self._build_path = args.build_path
         self._efi_aarch64 = args.efi_aarch64
+        self._source_path = args.source_path
         # Allow input config to override defaults.
         self._config = DEFAULT_CONFIG.copy()
         if config != None:
@@ -591,6 +592,9 @@ def get_default_jobs():
     parser.add_argument("--build-path", default=None,
                         help="Path of build directory, "\
                         "for using build tree QEMU binary. ")
+    parser.add_argument("--source-path", default=None,
+                        help="Path of source directory, "\
+                        "for finding additional files. ")
     parser.add_argument("--interactive", "-I", action="store_true",
                         help="Interactively run command")
     parser.add_argument("--snapshot", "-s", action="store_true",
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index e687b93e52..81c3004c3c 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -64,7 +64,7 @@ class CentosAarch64VM(basevm.BaseVM):
     def create_kickstart(self):
         """Generate the kickstart file used to generate the centos image."""
         # Start with the template for the kickstart.
-        ks_file = "../tests/vm/centos-8-aarch64.ks"
+        ks_file = self._source_path + "/tests/vm/centos-8-aarch64.ks"
         subprocess.check_call("cp {} ./ks.cfg".format(ks_file), shell=True)
         # Append the ssh keys to the kickstart file
         # as the post processing phase of installation.
-- 
2.20.1


