Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AE5F1F0E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 21:54:16 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeiYx-0001pw-K6
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 15:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeiXH-0000SI-Tj
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:52:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeiXF-0000jU-08
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 15:52:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bv17so2566459wrb.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=gq4rDrQMDJE7Bs0u6slRVh2LWDqUjh7Ekyold8xzjtQ=;
 b=gWcqhcxumZViM1rWKwUwQOgV5xInbgqz5zqSfCWG6P+PD6blsZZxAikksmJpXUgTAS
 SZCLcNcgd6KPdvHYB9JeNrlb/MVfHL15pofxtEY7Gj3YwXXw+YUh3t+DKzi1fMsrWsMC
 4jH9sAImjdSyKGU151FBXznF8NZdIcbDm302DfaiJzzEhQIhIES8CDY4N6kbbUES9e/1
 +iDmw8bSt8HLXtkY2d5+BW5EiDGZxgZExummrYYi2luDLhyhT2rw9XoZIIsLxoTnRqn4
 cERR1wQgyjpq3VfpHMnTW6nRFt3G5a0P1yd10MgyIokOsa8Z+kT+mRXEfbuXw6TKqYl4
 B5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=gq4rDrQMDJE7Bs0u6slRVh2LWDqUjh7Ekyold8xzjtQ=;
 b=RwOs/Czz+QNH7prPwQHNjWSJEHxeO31+/NWc4Rtw5+6gbOzzvn0nQOkQSHypLkGI7c
 2yr1ziVd5iYRx1OMQEUGARsLnYpW1RJp0elfpEwtXKmhHCGI3wBkDPCXmnj81XwPeJZY
 B4hi7gZRIPAJi1Ok6/6LyyVst1CcIlW706kyb7JEazGSwABVGitnVwWxj2Hxd3Ny1LP+
 Y6i3oBccfjdPkXeDBZH5DIo3k+tUHFmCmfJhi1g3Hj4k0G9JRwBeXq3T96M8DNynV+T6
 g3UYdmNg0kRr3zjI76IYD+CFMvt/OLqzAygWSHvvtBWk3QxcPm1ioGsZb9y04OQypc16
 rDaQ==
X-Gm-Message-State: ACrzQf1RVyoBfOFvqgMQKyh7u9iP2HVJ7zaIJGI8GQnpuq+PpM2HHjHB
 7k/ONJ3xsGidNtDMxL35+DhEeyNONDWYGQ==
X-Google-Smtp-Source: AMsMyM5mtXflz5oN1iNW9aRJt/1pF0+rRuVkxHurc/t6fqzQGrXnpoH/Aki4tyCukWWY+/cfBnWuBA==
X-Received: by 2002:adf:db03:0:b0:22a:dd80:4b45 with SMTP id
 s3-20020adfdb03000000b0022add804b45mr8867434wri.111.1664653946454; 
 Sat, 01 Oct 2022 12:52:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m28-20020adfa3dc000000b0022860e8ae7csm5927832wrb.77.2022.10.01.12.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 12:52:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado: Add missing require_netdev('user') checks
Date: Sat,  1 Oct 2022 20:52:24 +0100
Message-Id: <20221001195224.2453581-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some avocado tests fail if QEMU was built without libslirp. Add
require_netdev('user') checks where necessary:

These tests try to ping 10.0.2.2 and expect it to succeed:
  boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2
  boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
  ppc_bamboo.py:BambooMachine.test_ppc_bamboo

These tests run a commandline that includes '-net user':
  machine_aspeed.py:AST2x00Machine.test_arm_ast2500_evb_builroot
  (and others that use the do_test_arm_aspeed_buidroot_start()
  or do_test_arm_aspeed_sdk_start() helper functions)

These changes seem to be sufficient for 'make check-avocado'
to not fail on a --disable-slirp build.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 4 ++++
 tests/avocado/machine_aspeed.py     | 3 +++
 tests/avocado/ppc_bamboo.py         | 1 +
 3 files changed, 8 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index f26e036ab58..ca9d09b0d7c 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -381,6 +381,8 @@ def test_arm_emcraft_sf2(self):
         :avocado: tags=u-boot
         :avocado: tags=accel:tcg
         """
+        self.require_netdev('user')
+
         uboot_url = ('https://raw.githubusercontent.com/'
                      'Subbaraya-Sundeep/qemu-test-binaries/'
                      'fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot')
@@ -779,6 +781,8 @@ def test_arm_orangepi_sd(self):
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         """
+        self.require_netdev('user')
+
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0f64eb636c2..124649a24b5 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -93,6 +93,8 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
         self.do_test_arm_aspeed(image_path)
 
     def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+        self.require_netdev('user')
+
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
@@ -193,6 +195,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  vm=vm)
 
     def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+        self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
                          '-net', 'nic', '-net', 'user')
diff --git a/tests/avocado/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
index 102ff252dff..a81be3d6088 100644
--- a/tests/avocado/ppc_bamboo.py
+++ b/tests/avocado/ppc_bamboo.py
@@ -23,6 +23,7 @@ def test_ppc_bamboo(self):
         :avocado: tags=accel:tcg
         """
         self.require_accelerator("tcg")
+        self.require_netdev('user')
         tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
                    'system-image-powerpc-440fp.tar.gz')
         tar_hash = '53e5f16414b195b82d2c70272f81c2eedb39bad9'
-- 
2.25.1


