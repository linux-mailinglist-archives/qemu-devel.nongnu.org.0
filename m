Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE2F6A6119
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7KH-0004Rd-LG; Tue, 28 Feb 2023 16:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KF-0004RE-VH
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KE-0004MS-1e
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIbcHz+TqTCGXfu8pkkTMH6d/mSSOrmJ/pUC5dcPpkc=;
 b=dabrctEi7kN4WXqCMklkRHZoq8JMPalrN7S4K+HwnTtx5vQZXs0aU4kGHdlQrtGHaH4YeR
 ApHdzuTlGzQeJNiWEvGjG6A5kRkvrSFTWR1/aHj7mpcLq5IBu473or4mZIeE3QlIeL+IrO
 JeSg0N0Fn6tV8wSj2bLkznVo+tlW6p0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-OXeyYjkkO0O4OlCDZa7iDg-1; Tue, 28 Feb 2023 16:15:50 -0500
X-MC-Unique: OXeyYjkkO0O4OlCDZa7iDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEA411C04193;
 Tue, 28 Feb 2023 21:15:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B9D40C945A;
 Tue, 28 Feb 2023 21:15:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 6/6] tests/qtest/readconfig: Test docs/config/q35-emulated.cfg
Date: Tue, 28 Feb 2023 22:15:33 +0100
Message-Id: <20230228211533.201837-7-thuth@redhat.com>
In-Reply-To: <20230228211533.201837-1-thuth@redhat.com>
References: <20230228211533.201837-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This config file uses accel = "kvm", so it can only work on Linux.
It also uses two hard-coded image names which we have to replace
with unique temporary files to avoid race conditions. So after
creating the temporary image files, we also have to create a copy
of the config file where we replaced the hard-coded image names.
Once everything is in place, we can start QEMU with this config
file and check that everything is available in QEMU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/readconfig-test.c | 131 ++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 533623f638..fe64376e85 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -197,6 +197,132 @@ static void test_docs_config_ich9(void)
     qtest_quit(qts);
 }
 
+#ifdef CONFIG_LINUX
+
+static char *make_temp_img(const char *template, const char *format, int size)
+{
+    GError *error = NULL;
+    char *temp_name;
+    int fd;
+
+    /* Create a temporary image names */
+    fd = g_file_open_tmp(template, &temp_name, &error);
+    if (fd == -1) {
+        fprintf(stderr, "unable to create file: %s\n", error->message);
+        g_error_free(error);
+        return NULL;
+    }
+    close(fd);
+
+    if (!mkimg(temp_name, format, size)) {
+        fprintf(stderr, "qemu-img failed to create %s\n", temp_name);
+        g_free(temp_name);
+        return NULL;
+    }
+
+    return temp_name;
+}
+
+static void test_docs_q35_emulated(void)
+{
+    QTestState *qts;
+    QDict *resp;
+    QObject *qobj;
+    int ret, i;
+    g_autofree char *cfg_file = NULL, *sedcmd = NULL;
+    g_autofree char *hd_file = NULL, *cd_file = NULL;
+
+    struct {
+        const char *name;
+        const char *type;
+    } devices[] = {
+        { "ich9-pcie-port-1", "ioh3420" },
+        { "ich9-pcie-port-2", "ioh3420" },
+        { "ich9-pcie-port-3", "ioh3420" },
+        { "ich9-pcie-port-4", "ioh3420" },
+        { "ich9-pci-bridge", "i82801b11-bridge" },
+        { "ich9-ehci-1", "ich9-usb-ehci1" },
+        { "ich9-ehci-2", "ich9-usb-ehci2" },
+        { "ich9-uhci-1", "ich9-usb-uhci1" },
+        { "ich9-uhci-2", "ich9-usb-uhci2" },
+        { "ich9-uhci-3", "ich9-usb-uhci3" },
+        { "ich9-uhci-4", "ich9-usb-uhci4" },
+        { "ich9-uhci-5", "ich9-usb-uhci5" },
+        { "ich9-uhci-6", "ich9-usb-uhci6" },
+        { "sata-disk", "ide-hd" },
+        { "sata-optical-disk", "ide-cd" },
+        { "net", "e1000" },
+        { "video", "VGA" },
+        { "ich9-hda-audio", "ich9-intel-hda" },
+        { "ich9-hda-duplex", "hda-duplex" },
+    };
+
+    /* Check that all the devices are available in the QEMU binary */
+    for (i = 0; i < ARRAY_SIZE(devices); i++) {
+        if (!qtest_has_device(devices[i].type)) {
+            g_test_skip("one of the required devices is not available");
+            return;
+        }
+    }
+
+    hd_file = make_temp_img("qtest_disk_XXXXXX.qcow2", "qcow2", 1);
+    cd_file = make_temp_img("qtest_cdrom_XXXXXX.iso", "raw", 1);
+    if (!hd_file || !cd_file) {
+        g_test_skip("could not create disk images");
+        goto cleanup;
+    }
+
+    /* Create a temporary config file where we replace the disk image names */
+    ret = g_file_open_tmp("q35-emulated-XXXXXX.cfg", &cfg_file, NULL);
+    if (ret == -1) {
+        g_test_skip("could not create temporary config file");
+        goto cleanup;
+    }
+    close(ret);
+
+    sedcmd = g_strdup_printf("sed -e 's,guest.qcow2,%s,' -e 's,install.iso,%s,'"
+                             " docs/config/q35-emulated.cfg > '%s'",
+                             hd_file, cd_file, cfg_file);
+    ret = system(sedcmd);
+    if (ret) {
+        g_test_skip("could not modify temporary config file");
+        goto cleanup;
+    }
+
+    qts = qtest_initf("-machine none -nodefaults -readconfig %s", cfg_file);
+
+    /* Check memory size */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
+    test_x86_memdev_resp(qdict_get(resp, "return"), "pc.ram", 1024);
+    qobject_unref(resp);
+
+    resp = qtest_qmp(qts, "{ 'execute': 'qom-list',"
+                          "  'arguments': {'path': '/machine/peripheral' }}");
+    qobj = qdict_get(resp, "return");
+
+    /* Check that all the devices have been created */
+    for (i = 0; i < ARRAY_SIZE(devices); i++) {
+        test_object_available(qobj, devices[i].name, devices[i].type);
+    }
+
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+
+cleanup:
+    if (hd_file) {
+        unlink(hd_file);
+    }
+    if (cd_file) {
+        unlink(cd_file);
+    }
+    if (cfg_file) {
+        unlink(cfg_file);
+    }
+}
+
+#endif /* CONFIG_LINUX */
+
 int main(int argc, char *argv[])
 {
     const char *arch;
@@ -208,6 +334,11 @@ int main(int argc, char *argv[])
         g_str_equal(arch, "x86_64")) {
         qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
         qtest_add_func("readconfig/x86/ich9-ehci-uhci", test_docs_config_ich9);
+#ifdef CONFIG_LINUX
+        if (qtest_has_accel("kvm")) {
+            qtest_add_func("readconfig/x86/q35-emulated", test_docs_q35_emulated);
+        }
+#endif
     }
 #ifdef CONFIG_SPICE
     qtest_add_func("readconfig/spice", test_spice);
-- 
2.31.1


