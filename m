Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7C500D9F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 14:31:52 +0200 (CEST)
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neydb-0006GF-Mw
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 08:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neyaY-00051N-JH
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1neyaV-0006Vw-ER
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649939318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nEJH0YyYAwv7RNgox0zOf2Af+3BSJpWoIj5uXnvC0zs=;
 b=hu4DA8/zfJVpBNFzSZTiSMpv07s2D/o3OqU5I7ChKO/ZWUJ7/N1ZK8DMeu9RP6epGcDi4G
 wW8ah+MJfgOh4gj478fwIH/xY1iAcZ2adWlfmYi9mS+vqpnFmCPfWQy1FUaOGNsbNBm6SD
 KqY26QrG14EhjVR+XLKDbeChIOPzm4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-AUkM8-WWMkibEagfYgFE1A-1; Thu, 14 Apr 2022 08:28:37 -0400
X-MC-Unique: AUkM8-WWMkibEagfYgFE1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3160B86B8A4;
 Thu, 14 Apr 2022 12:28:37 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C756740F9D41;
 Thu, 14 Apr 2022 12:28:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/qtest: Run the fuzz-sdcard-test only on i386 and x86_64
Date: Thu, 14 Apr 2022 14:28:34 +0200
Message-Id: <20220414122834.652103-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fuzz-sdcard-test is currently scheduled for all targets,
but the code limits itself to "i386". Move it to the right
list in meson.build and allow it to be run on "x86_64", too.

While we're at it, also clean up the wrong indentation in
fuzz-sdcard-test.c (it was using 3 spaces instead of 4 in some
lines).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-sdcard-test.c | 6 +++---
 tests/qtest/meson.build        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index 0f94965a66..7707038a71 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -168,11 +168,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
-   if (strcmp(arch, "i386") == 0) {
+    if (g_str_equal(arch, "i386") || g_str_equal(arch, "x86_64")) {
         qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
         qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
         qtest_add_func("fuzz/sdcard/oss_fuzz_36391", oss_fuzz_36391);
-   }
+    }
 
-   return g_test_run();
+    return g_test_run();
 }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 1709fc6ccb..f3bee0b4c5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -22,7 +22,6 @@ qtests_generic = \
   (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
@@ -67,6 +66,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
+  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
   (config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +                        \
   (config_all_devices.has_key('CONFIG_VIRTIO_NET') and                                      \
-- 
2.27.0


