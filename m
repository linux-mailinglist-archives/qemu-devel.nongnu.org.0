Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081173B181C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:30:35 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw09S-00059N-0y
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw06y-00019x-P9
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw06s-0001XX-1I
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id y7so2029159wrh.7
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9PsUDVxk3C7pgdDQmjsngPKlAX7gw8tVzdh0nQKkN8=;
 b=UfGuxYnXxx9d8qbbBFYmOJR3B9xCX0OONi5lV5M6zxP/YPJjlaj/ThngwEVNVQ0GzB
 +5hrqekJRgkVyoqZ62JQlhB9eaKla1yGVpfjA0BpfM6HCzA0iVkRhU0EZ7DFY+lK49P2
 vDmfNWNygtprfIE6aDq112wGltok45NGvKIuojl64vrYJM0UXht8HZm/lu0Ewl12f99o
 HEVeQhrtW3CJFSJXQRPvoOxbDPkjmOAQJe4moPOf6wOmJmgRpYGOM5h2LQrM10aLnJWP
 DvHw05RVfmlObTNll+kxh/+pc4Nm6xKZlNtb7Y0ySWveDNC5Rdl39oEDVehT0JGCPO5k
 lIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9PsUDVxk3C7pgdDQmjsngPKlAX7gw8tVzdh0nQKkN8=;
 b=dA+PVe6F3O5zudgI3wVHX2UIs0fUIZ8YcmWklhQB4rYLLYoAdJxBrzeVs++YCtZ+6U
 1k/00dkqRjjfLKu/oP7uLUFJw4yIbHwA8/DKkGf/RzR21jCYyrPmoNx92+8OpCH1GUwD
 nB9tHrDa+wTgqJ0wgMUHZuG4Ce9WguoK6QITsPYYQuEiuGFgBClm068eljhFP2F3Khqb
 0zDyH/AvEBZBo8r+b94vY/6UqhS/n1YOOPbYRCjrOBVS8+7LoAniiGbwTrJ2Ad5GHs5g
 cv0ONtTLJVrtBdtJzWEwT8xCYbcnroIFzg/7/FHGGCLi9ZDpF2qhkjxk18Tsosa97B12
 sNrQ==
X-Gm-Message-State: AOAM5310bZ9ZQg3Xf2Yt2ontoNqZtAJhYtmLFfD6Z7FC4Y5zusgWLUPT
 IM4h/UVeRXT1GQwsrzgRlxjcjg==
X-Google-Smtp-Source: ABdhPJzR8xLd1ywmJM3PEOJClSiV1Y9tEK/sJD3hD9DYxmRWc8QOIRB/fTo29bb7NPRVO/8kXAKo1Q==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr4900033wrt.372.1624444071786; 
 Wed, 23 Jun 2021 03:27:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm2643750wrr.90.2021.06.23.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD8961FF87;
 Wed, 23 Jun 2021 11:27:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/8] tests/acceptance: tweak the tcg/kvm tests for virt
Date: Wed, 23 Jun 2021 11:27:42 +0100
Message-Id: <20210623102749.25686-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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


