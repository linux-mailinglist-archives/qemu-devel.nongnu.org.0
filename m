Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA26A611E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:18:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7Kl-0004Zh-QV; Tue, 28 Feb 2023 16:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7Ki-0004ZM-Of
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7Kh-0004QR-AD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap120i6BZ6AChi8u7XZe0nrIJdZJLwjXQyMn66atFlg=;
 b=cDtFwBhK8R3lV2XevRUzkG2DuFY4C1zVuafpPBLg/tgoE2ypncfqfRIU21M9WuCYpEDGUa
 zuNTsVIoPeRuc7vLGrou5AD+AhCXemW28XYFq2VmGWMIvae/AopDl/ilUvq/teoSzO9+DY
 HOVR25coq0hzoN6v1Q2rV6U4TwpcDfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-bFuvmBDOPIWxriQ0j046lA-1; Tue, 28 Feb 2023 16:15:56 -0500
X-MC-Unique: bFuvmBDOPIWxriQ0j046lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B368811E9C;
 Tue, 28 Feb 2023 21:15:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60F2340C6EC4;
 Tue, 28 Feb 2023 21:15:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 2/6] tests/qtest/readconfig: Test
 docs/config/ich9-ehci-uhci.cfg
Date: Tue, 28 Feb 2023 22:15:29 +0100
Message-Id: <20230228211533.201837-3-thuth@redhat.com>
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

We've got some sample config files in docs/config/ but no means
of regression checking them. Thus let's test them in our readconfig
qtest, starting with ich9-ehci-uhci.cfg. Note: To enable the test
to read the config files from the build folder, we have to install
a symlink for docs/config in the build directory.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                     |  1 +
 tests/qtest/readconfig-test.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/configure b/configure
index dccb5d4f96..4331fead78 100755
--- a/configure
+++ b/configure
@@ -2215,6 +2215,7 @@ fi
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
 LINKS="Makefile"
+LINKS="$LINKS docs/config"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS pc-bios/vof/Makefile"
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 26d79b5e4b..2160603880 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -177,6 +177,26 @@ static void test_object_rng(void)
     qtest_quit(qts);
 }
 
+static void test_docs_config_ich9(void)
+{
+    QTestState *qts;
+    QDict *resp;
+    QObject *qobj;
+
+    qts = qtest_initf("-nodefaults -readconfig docs/config/ich9-ehci-uhci.cfg");
+
+    resp = qtest_qmp(qts, "{ 'execute': 'qom-list',"
+                          "  'arguments': {'path': '/machine/peripheral' }}");
+    qobj = qdict_get(resp, "return");
+    test_object_available(qobj, "ehci", "ich9-usb-ehci1");
+    test_object_available(qobj, "uhci-1", "ich9-usb-uhci1");
+    test_object_available(qobj, "uhci-2", "ich9-usb-uhci2");
+    test_object_available(qobj, "uhci-3", "ich9-usb-uhci3");
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
 int main(int argc, char *argv[])
 {
     const char *arch;
@@ -187,6 +207,7 @@ int main(int argc, char *argv[])
     if (g_str_equal(arch, "i386") ||
         g_str_equal(arch, "x86_64")) {
         qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
+        qtest_add_func("readconfig/x86/ich9-ehci-uhci", test_docs_config_ich9);
     }
 #ifdef CONFIG_SPICE
     qtest_add_func("readconfig/spice", test_spice);
-- 
2.31.1


