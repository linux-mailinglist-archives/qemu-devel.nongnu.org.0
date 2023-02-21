Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348E869E510
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVmZ-00005a-8u; Tue, 21 Feb 2023 11:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV9E-0001t6-8Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pUV9C-0007vE-79
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:05:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so45999pjz.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loUKCpodH6rrX01BvhuMU1Hj1SqzrWBHPXyBozd3Y40=;
 b=M4QY1zsxHOkzkXuv2Dzdfu4kORbiL6sH3ToGmAshTWCPwREQ8WHuZL6s+kPsqDc7LY
 onOfgtMlUpINkDowxFQHBXZ6tA9cf6P04jD8s/hZAWDV/cIDa64tBHAt23CK2S3HhzQI
 L+RpfuA6zn7GnqYHr6V/8gKsfF4D22GFHdHU7SCAqtsb/W7gt4OWFW4ItZA3xhQydeqT
 aN8NX0xTBmaFcVIApFXmoKVqpdXRFTmhQ3PSd4GT67U4ZwEHlKJoasDb4qqlnqBbK/XB
 jJp/MvI6weZieOlEIw65tZCW1b2Mky4/1q3arg9EbHDdLsSeKFbc78PlorZt8BBW4M89
 qUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loUKCpodH6rrX01BvhuMU1Hj1SqzrWBHPXyBozd3Y40=;
 b=TMO9yokW7q5+3La9vurC/nZxyiO7vA6aBKbkIyy3/ZJnOmF/Cjcc3wphrLiT9mTbRU
 LF04ts7od+zwU5iwj0R3Fzk3ol1n0CsDQmfp4BOM4YOo/UycjZMqAnPwEgu1+NJpf4iJ
 yjIfXBR2dtpnasaMm/MvQEXz/2wMRak9miq0mGoUQME+Bl1VUayxKTSM/nTB+Ud01pwo
 Qj2XldW+VmDNdTa76YuPxjVzv7Zl1S5HxUM7S6Bum8q/lWXVn1vuBQHP/hemNe73xRma
 1Frvm01qy10bEM/DPzhqwj5hWru+D2N0/lR5iBZp5hIiDUo5j8F01lRl3fkmy9OnqSdc
 F88Q==
X-Gm-Message-State: AO0yUKV0SuppnC6ycFlLYmkUf5NcObcx60Sl4T8mh24Iw/SDFW1iKpOO
 K8T+6TgBMEcbpjzlOjSkuc26r8mOrjiGIg==
X-Google-Smtp-Source: AK7set8pVwho9BucX/V6+1IYCJuNV1JWspjNmLdi1vWoOBu5NWMrqIAnl24MInB0w7Aw9w+i784MhQ==
X-Received: by 2002:a17:902:e888:b0:19a:95ab:6b2b with SMTP id
 w8-20020a170902e88800b0019a95ab6b2bmr8113439plg.69.1676995540452; 
 Tue, 21 Feb 2023 08:05:40 -0800 (PST)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 b15-20020a170902650f00b001943d58268csm10076295plk.55.2023.02.21.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 08:05:40 -0800 (PST)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH 4/4] test/avocado: test Linux boot up in x2APIC with userspace
 local APIC
Date: Tue, 21 Feb 2023 23:05:00 +0700
Message-Id: <20230221160500.30336-5-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221160500.30336-1-minhquangbui99@gmail.com>
References: <20230221160500.30336-1-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Feb 2023 11:46:14 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Simple test to check Linux boot up in x2APIC with userspace local APIC and
TCG accelerator.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 tests/avocado/tcg_x2apic.py | 91 +++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 tests/avocado/tcg_x2apic.py

diff --git a/tests/avocado/tcg_x2apic.py b/tests/avocado/tcg_x2apic.py
new file mode 100644
index 0000000000..ff4f27017c
--- /dev/null
+++ b/tests/avocado/tcg_x2apic.py
@@ -0,0 +1,91 @@
+# x2APIC with TCG accelerator tests
+# Based on intel_iommu.py, INTEL_IOMMU Functional tests
+#
+# Copyright (c) Bui Quang Minh <minhquangbui99@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+import os
+
+from avocado import skipIf
+from avocado_qemu import LinuxTest
+
+@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+class TCGx2APIC(LinuxTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:31
+    :avocado: tags=machine:q35
+    :avocado: tags=accel:tcg
+    :avocado: tags=x2apic
+    """
+
+    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
+    kernel_path = None
+    initrd_path = None
+    kernel_params = None
+
+    def set_up_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
+                         'drive=drv0,id=virtio-disk0,bootindex=1,'
+                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
+        self.vm.add_args('-device', 'virtio-gpu-pci' + self.IOMMU_ADDON)
+        self.vm.add_args('-drive',
+                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
+
+    def setUp(self):
+        super(TCGx2APIC, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
+
+    def add_common_args(self):
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator('tcg')
+        self.add_common_args()
+        self.vm.add_args('-accel', 'tcg')
+        self.vm.add_args('-device', 'intel-iommu,intremap=on,eim=on')
+        self.vm.add_args('-cpu', 'qemu64,+x2apic')
+
+        if custom_kernel is None:
+            return
+
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
+        self.kernel_path = self.fetch_asset(kernel_url)
+        self.initrd_path = self.fetch_asset(initrd_url)
+
+    def run_and_check(self):
+        if self.kernel_path:
+            self.vm.add_args('-kernel', self.kernel_path,
+                             '-append', self.kernel_params,
+                             '-initrd', self.initrd_path)
+        self.launch_and_wait()
+        self.ssh_command('cat /proc/cmdline')
+        self.ssh_command('dmesg | grep "x2apic enabled"')
+
+    def test_physical_x2apic(self):
+        """
+        :avocado: tags=physical_x2apic
+        """
+
+        self.common_vm_setup(True)
+
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on x2apic_phys')
+        self.run_and_check()
+        self.ssh_command('dmesg | grep "Switched APIC routing to physical x2apic"')
+
+    def test_cluster_x2apic(self):
+        """
+        :avocado: tags=cluster_x2apic
+        """
+
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' quiet intel_iommu=on')
+        self.run_and_check()
+        self.ssh_command('dmesg | grep "Switched APIC routing to cluster x2apic"')
-- 
2.25.1


