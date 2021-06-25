Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90D73B401C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:15:59 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhwM-0002wA-Do
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuS-0000Rt-KS
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuQ-0002sc-PW
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so5368705wma.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kiUdg16y+rpz0xmzHJCII4oHjLBoN3oJAAUdnqWaM8=;
 b=XAALvnmRMUeyxm1crmVLye3yL6T660qnfER5n1CXgXKBw01Lg/y+kHpIEeeMRbE10B
 wdaXRkV+l7UKbt/MvxBP4BCh7kngfH1xV3CT9eF8gXg5eJIb0eTC05KMgsTL3LRPWilt
 VxHRDwFU/Q7dk/E/C21jhL24FZLm4C5yw/oZC77x90/HxNaVhQJR96LvL6F4wKLyhOYK
 Du9ocAn/Kf3SEg8kMrwWA2N3HTWHWUv800ZAXoeaU5rnfJkTzwxrUWkA3Mf3YyrV+OY4
 gRq229z3kFwQ+fV1WFld8YQD1tmoUpUWkEj/uNjwKyhmdbBj+gaQKknOR6ac+xd0/Qfh
 5Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kiUdg16y+rpz0xmzHJCII4oHjLBoN3oJAAUdnqWaM8=;
 b=pHjLE/QMGtaO0xf7iSZ6Btt8FDkfHtG1web2QFOOwLygZkB6lreM9HTIIHPj/GnA5c
 uiPBk6lyUYz6eD1apmFPpxS2RMffHrKVy5Zz9ccotTsVcYov9wJMGgm8G7fv/o0ftvSA
 sy6oIuwdMSu06LlMihn/Kgwi6IdMLbi85nP9nmHT2tp36ybScJ33fpxPgztURqyycuhm
 YN+DAQ+MP4eFG0/uOQy9zFlIjGzUIdm0jCrU1w3ZPEzi4F1mCLZym5wlwCbm3APGyjev
 iWlA+e1ocDz7/GSd8oAXv/XiegqyHrDrTKITg5GCcA+L8MAjxmhc/lWqDNyaeBx3xOlc
 Dd6Q==
X-Gm-Message-State: AOAM530pXZGtNEcgPPYP9FjEcJIsLQfCZC9/aVcLDR4k1GUuERe36RNf
 jEBfqx/Z8rEvWalfmqhaEnOaqg==
X-Google-Smtp-Source: ABdhPJwQz4DkiKgpldHBMNV6J0ZF/QSP48jLnEfRLxRnXq4i0WleFbtaTmwMSCNXMva3xZxeNicotQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr9141148wmc.156.1624612436836; 
 Fri, 25 Jun 2021 02:13:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g10sm5132596wmh.33.2021.06.25.02.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:13:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B3FB1FF87;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/7] tests/acceptance: tweak the tcg/kvm tests for virt
Date: Fri, 25 Jun 2021 10:13:49 +0100
Message-Id: <20210625091355.25673-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Really it's only TCG that can select which GIC model you want, KVM
guests should always be using the "host" version of the GIC for which
QEMU already provides a handy shortcut. Make the KVM test use this and
split the TCG test into it's two versions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210623102749.25686-2-alex.bennee@linaro.org>

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 314370fd1f..4c8a5994b2 100644
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
         self.launch_and_wait(set_up_ssh_connection=False)
 
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
         self.launch_and_wait(set_up_ssh_connection=False)
 
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
         self.launch_and_wait(set_up_ssh_connection=False)
 
-- 
2.20.1


