Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2C39333E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:11:16 +0200 (CEST)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIbL-0001Kd-Rr
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITt-00055i-Ms
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITq-0000Mt-DA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h3so514836wmq.3
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tgNjmn++qDEbKJ67Irv9XGiW/c7HNn9pcJT1QLxGpE=;
 b=NL5HmnMuQOgYlLu6urp7nrXIZ6d7d63AILxAmlsmA0m8aZHRbaw4ZJzEoPA5zfOCLz
 uWwZ6GG5+6Aan7LCXf/etC0greEHayOMkKgFIzcbqqstMpWuYF54jRbUYQmU5ECCsF2L
 DmtQ9bIQ1axgbyJuiXkS+nMrCjszVkgqlm+fe0Y/VMfDleTX+CPzHri1D21v2/OEPb9F
 GnpmBBQr+mB9w7G+j0ardx3eal8j6WOrlaTY1V3Dshg1/bNIIvrxQpYqJpJGPrP7Wc1f
 Gmv3pE2ms51qbUT75ZVDdCy3FX63JgFxQrPeQ+5lNaxbbJWrB9nEP2zrT+n+sWB+sCyQ
 beYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tgNjmn++qDEbKJ67Irv9XGiW/c7HNn9pcJT1QLxGpE=;
 b=gUEMUsGnl9lXE/U0Qk+m8/euKbNQSOcwJ0G2H4jnlRBtQc3qaPUAv8jEpCkMW3LMpy
 TYg4EC4/nBEWUPKAnavdSk1aRSFJrtzsZCAXs5MA0PGzts5V3771Mu0J/2D2HJNlu+iq
 fLtzxtrtvM/iqjS7Zat/SQFYTFlquzHpt8ChKtwMW7GbEjYeF0P2qv7W06dmtm1BjzWg
 rkczXHSzlw4otqysZ4ekqNLiIBBI+tgnN+fc3bDC/EyBuTuMIGYTvOrptq1iP9rwpjdV
 ohdWaeYWYn0MKKP3mhH7iz7jcJqajvqK4gkG4QlDNQVnKYe0h6Z1+14FY6aAOTwkf4Md
 AY9A==
X-Gm-Message-State: AOAM532tr28+7p6ODEo9nl9qGC0wXRUd8OFxj1ZH3Sa09uGfBFxU7LfZ
 7jL4KUGGBHj/zuzsT6JhD1kdow==
X-Google-Smtp-Source: ABdhPJzJNEL5sgbbh0OWaHQoyCIx9H6I0O6Vi3t17xRREigYIgmlchml5UDlHPIgEjex6KMDXDYg5g==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr9467093wmd.47.1622131407999; 
 Thu, 27 May 2021 09:03:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z12sm4580722wmc.5.2021.05.27.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD8201FF91;
 Thu, 27 May 2021 17:03:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/6] tests/acceptance: tweak the tcg/kvm tests for virt
Date: Thu, 27 May 2021 17:03:18 +0100
Message-Id: <20210527160319.19834-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527160319.19834-1-alex.bennee@linaro.org>
References: <20210527160319.19834-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Really it's only TCG that can select which GIC model you want, KVM
guests should always be using the "host" version of the GIC for which
QEMU already provides a handy shortcut. Make the KVM test use this and
split the TCG test into it's two versions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/boot_linux.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 0d178038a0..7221452d4b 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -75,10 +75,11 @@ def add_common_args(self):
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-    def test_virt_tcg(self):
+    def test_virt_tcg_gicv2(self):
         """
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
+        :avocado: tags=device:gicv2
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
@@ -87,29 +88,28 @@ def test_virt_tcg(self):
         self.add_common_args()
         self.launch_and_wait()
 
-    def test_virt_kvm_gicv2(self):
+    def test_virt_tcg_gicv3(self):
         """
-        :avocado: tags=accel:kvm
-        :avocado: tags=cpu:host
-        :avocado: tags=device:gicv2
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        :avocado: tags=device:gicv3
         """
-        self.require_accelerator("kvm")
-        self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
-        self.vm.add_args("-machine", "virt,gic-version=2")
+        self.require_accelerator("tcg")
+        self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max")
+        self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait()
 
-    def test_virt_kvm_gicv3(self):
+    def test_virt_kvm(self):
         """
         :avocado: tags=accel:kvm
         :avocado: tags=cpu:host
-        :avocado: tags=device:gicv3
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args("-cpu", "host")
-        self.vm.add_args("-machine", "virt,gic-version=3")
+        self.vm.add_args("-machine", "virt,gic-version=host")
         self.add_common_args()
         self.launch_and_wait()
 
-- 
2.20.1


