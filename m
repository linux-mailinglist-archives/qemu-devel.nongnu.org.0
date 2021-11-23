Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074AE45A154
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:22:47 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTsr-0006pi-Sl
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTo9-00019B-9C
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTo5-00063w-LM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637666269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+P+E+4M8XxcWiJ1o+hf6VWyneP3fRquGoiWlNIpqhoc=;
 b=jREQGOaHwToKB9uebWoi2RcId5yjuGRdj30LXzSp5y96PHytRCkVocOOFhVcE9ylbSJWYd
 vNUKOBWx13KAaK+aHz2H9Ynx3/MrdODgK5A7Xe2L0oGBBC7PYOrLtdLaXStkpSyS+X0oX+
 s/UZYmrfe6IW3k8Xt3sb+LAMedEueog=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-vHDfUuPbMTyYafjUpdoQwA-1; Tue, 23 Nov 2021 06:17:46 -0500
X-MC-Unique: vHDfUuPbMTyYafjUpdoQwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1350628wms.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 03:17:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+P+E+4M8XxcWiJ1o+hf6VWyneP3fRquGoiWlNIpqhoc=;
 b=h+9Oq+xGg+napJL2RfygNQXkQarIQ9uQuCcge10i/D0vF5YlnkvtsnVKcnKBjErY1u
 D4CzK/83Yt5HZb1p2wJehTJz4lUKxAY5w47dj/JIT7mESolT1XUbydFF2u1T0NkTy0zV
 BA9ME9tl2FzT0yzmvqxgumst4R9qmJj4ve7+MzcBL5HOc4f+i9vWvvWMkLNeUMXc/hzt
 hpj4oMljggzFRFouUz9PmdmfA5CvojAidX9SepS+J0KlLN685NmJFVh1M2AEDVnRXYSP
 k4GXPzaMxhOTMjtCNS/+6tMNsq+M8bVND9YljfWHxTTu1A1N7hNfQ/xUjQSn/U2HiInd
 Dh6w==
X-Gm-Message-State: AOAM530mb0LEW2Okkd6+lor+OQTxTNmbzJa8ueWMe8b2GUTvPZBHZXgw
 gxO9q60z8Bnad8fEZUirz/s1Nl5EGEpebOPU0ZgXN0EQqaq1E1KUS3m0nHB07jQZ2N+3KK3OZjG
 wgR/4azmhIECXpFgWK+EZ9EOmb9PCCQC/EGrgXUVGtDx/sp9P1Iid3KIiQ2MQeN2F
X-Received: by 2002:adf:e387:: with SMTP id e7mr6348121wrm.412.1637666264533; 
 Tue, 23 Nov 2021 03:17:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyM35XcZMVkpEum36QHi87x3IRVYPw66WxhSw4/TEmkTj/UxvIVh5RO/QolSzROKMGWshLACg==
X-Received: by 2002:adf:e387:: with SMTP id e7mr6348076wrm.412.1637666264288; 
 Tue, 23 Nov 2021 03:17:44 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o10sm14469746wri.15.2021.11.23.03.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 03:17:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] tests/qtest: Add fuzz-lsi53c895a-test
Date: Tue, 23 Nov 2021 12:17:32 +0100
Message-Id: <20211123111732.83137-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123111732.83137-1-philmd@redhat.com>
References: <20211123111732.83137-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without the previous commit, this test triggers:

  $ make check-qtest-x86_64
  [...]
  Running test qtest-x86_64/fuzz-lsi53c895a-test
  qemu-system-x86_64: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.
  ERROR qtest-x86_64/fuzz-lsi53c895a-test - too few tests run (expected 1, got 0)

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 52 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 tests/qtest/meson.build            |  1 +
 3 files changed, 54 insertions(+)
 create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
new file mode 100644
index 00000000000..ba5d468970c
--- /dev/null
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QTest fuzzer-generated testcase for LSI53C895A device
+ *
+ * Copyright (c) Red Hat
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * This used to trigger the assert in lsi_do_dma()
+ * https://bugs.launchpad.net/qemu/+bug/697510
+ * https://bugs.launchpad.net/qemu/+bug/1905521
+ * https://bugs.launchpad.net/qemu/+bug/1908515
+ */
+static void test_lsi_do_dma_empty_queue(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M q35 -nographic -monitor none -serial none "
+                   "-drive if=none,id=drive0,"
+                            "file=null-co://,file.read-zeroes=on,format=raw "
+                   "-device lsi53c895a,id=scsi0 "
+                   "-device scsi-hd,drive=drive0,"
+                            "bus=scsi0.0,channel=0,scsi-id=0,lun=0");
+    qtest_outl(s, 0xcf8, 0x80001814);
+    qtest_outl(s, 0xcfc, 0xe1068000);
+    qtest_outl(s, 0xcf8, 0x80001818);
+    qtest_outl(s, 0xcf8, 0x80001804);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80002010);
+
+    qtest_writeb(s, 0xe106802e, 0xff); /* Fill DSP bits 16-23 */
+    qtest_writeb(s, 0xe106802f, 0xff); /* Fill DSP bits 24-31: trigger SCRIPT */
+
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
+                       test_lsi_do_dma_empty_queue);
+    }
+
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12..3c0f76b7801 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1825,6 +1825,7 @@ F: hw/scsi/*
 F: tests/qtest/virtio-scsi-test.c
 F: tests/qtest/fuzz-virtio-scsi-test.c
 F: tests/qtest/am53c974-test.c
+F: tests/qtest/fuzz-lsi53c895a-test.c
 T: git https://github.com/bonzini/qemu.git scsi-next
 
 SSI
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062f..d2ce20d3047 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -19,6 +19,7 @@
 
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
-- 
2.33.1


