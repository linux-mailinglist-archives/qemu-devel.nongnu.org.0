Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AC415C78
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:03:41 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMVw-0002oh-RE
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTMO7-0003Vt-JR
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTMO5-0000mj-Un
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632394533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZlDr6wVbPLD57KeSrVyWzttaPmrJEZrj68uAaU9i1o=;
 b=XwK11MUw5DilSL6S5eO9LuTS1b4zczoYmnIlCn5V3qTanih7/xAWWKmCQcAD+kPClpf3lk
 MimlZTqXDLH4k2sf3UVNpmHNmmuvDyG9pbWDn9rvQPTVfrqroZOsHnUtOHOeyYxdLr7V4n
 S75OdSZz8a+ZTtNAexvFM5D8FKY/SFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-cYOlHrPhNkeiW30iypgHKQ-1; Thu, 23 Sep 2021 06:55:32 -0400
X-MC-Unique: cYOlHrPhNkeiW30iypgHKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D78319057A0;
 Thu, 23 Sep 2021 10:55:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B5B226E8;
 Thu, 23 Sep 2021 10:55:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
Date: Thu, 23 Sep 2021 06:55:29 -0400
Message-Id: <20210923105529.3845741-2-pbonzini@redhat.com>
In-Reply-To: <20210923105451.3845510-1-pbonzini@redhat.com>
References: <20210923105451.3845510-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Skip the test if bzip2 is not available, and run it after they are
uncompressed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/meson.build     | 3 ++-
 tests/qtest/meson.build | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index a3b3d87891..a44c9bc127 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,3 +1,4 @@
+roms = []
 if unpack_edk2_blobs
   fds = [
     'edk2-aarch64-code.fd',
@@ -11,7 +12,7 @@ if unpack_edk2_blobs
   ]
 
   foreach f : fds
-    custom_target(f,
+    roms += custom_target(f,
                   build_by_default: have_system,
                   output: f,
                   input: '@0@.bz2'.format(f),
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e1f4df3df8..c9d8458062 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,12 +68,12 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
    'boot-order-test',
-   'bios-tables-test',
    'rtc-test',
    'i440fx-test',
    'fw_cfg-test',
@@ -180,7 +180,7 @@ qtests_arm = \
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
+  (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
@@ -269,7 +269,7 @@ foreach dir : target_dirs
   qtest_emulator = emulators['qemu-system-' + target_base]
   target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
 
-  test_deps = []
+  test_deps = roms
   qtest_env = environment()
   if have_tools
     qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
-- 
2.27.0


