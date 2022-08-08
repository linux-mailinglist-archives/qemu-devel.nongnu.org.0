Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B158C8F5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:05:46 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2Rv-0002cV-Ln
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jt-0007uQ-K7
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oL2Jr-0001gd-Ra
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659963439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r55Q/nWnujAQEEI0G38aUER1jlX16gFcQi+soe3UOkA=;
 b=TqXFKZwK5jYm8Z3Xqq6iHgjY6gos8MeI8Kwi7uOlL9qDP7ZYTOpCNCb74hFczY9mLTD2Wl
 KvriEQFvxJmwqUjAT0zm2KzuFemDBxN/FLcIAwx4K1hhPRRvSWAgsnnyvwJZn7BgO3sKQo
 mD/CJvj4a6u1KXNmY1tRaK/zuZScOQM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-aHVh-Jv7OduXs3jS0pPGXA-1; Mon, 08 Aug 2022 08:57:18 -0400
X-MC-Unique: aHVh-Jv7OduXs3jS0pPGXA-1
Received: by mail-ej1-f69.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso2367960ejj.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r55Q/nWnujAQEEI0G38aUER1jlX16gFcQi+soe3UOkA=;
 b=TgfqH6eaQx3LNn2OBxoksaEib56DBUxz1RWVHf0exrWelomYDLyWFdltZPOkQZOIiZ
 ny8RqO4ykiw6ReZqV3WnMnKQ2yrMAGfox518wfS796Fw4nCr2thXm3GnWU1VHp7XtiNs
 8IReW43IMRH1T1nuxz1R3+11s5mKxu8fPAryB8RokbKG8dcLn37Bg28m5XvAWUM+vgtX
 6nUtU3vU3v6wdUwjP5ubrRackrB28oL+ekXdZCTI/X1M5EsnLBBZDL9TQCVNo2FlqH7n
 ++V5knCOpjA6jwLM057ERAA7A+0pf77vdiWLQRC7hHA3VtZ4k5gw/zpugH5NEdBGDGNF
 WHUw==
X-Gm-Message-State: ACgBeo3l5/b91Enb4arAj6TR6T5bOkf+MECdhH096bkOatWMhbnpzX5o
 OHRXX4i34G7EpwKp+IljQb2b6cDYzkrGHXghPliS3fMBt6iebArBFaUXL4bQrrhJWsjr5R6f4I5
 DK3JPdP/iOuc8P30NAIbd/Z5CfGdZ47o3B6Cz9h5XXNnUQu6cbyxP7E2L3T2YTHQDqMQ=
X-Received: by 2002:a17:906:8a57:b0:730:8b50:610a with SMTP id
 gx23-20020a1709068a5700b007308b50610amr13608881ejc.557.1659963436610; 
 Mon, 08 Aug 2022 05:57:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xEkiFEaHsVejkEVi+tmUZWXOOqCf+QlQtOoD+gfK5Ca3X2RQLDSSB8klqh7T4oPr+53NBrA==
X-Received: by 2002:a17:906:8a57:b0:730:8b50:610a with SMTP id
 gx23-20020a1709068a5700b007308b50610amr13608867ejc.557.1659963436295; 
 Mon, 08 Aug 2022 05:57:16 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a056402070600b0043e35ae2610sm4546615edx.27.2022.08.08.05.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 05:57:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 5/5] tests/qtest: add scenario for -readconfig handling
Date: Mon,  8 Aug 2022 14:57:06 +0200
Message-Id: <20220808125706.60511-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125706.60511-1-pbonzini@redhat.com>
References: <20220808125706.60511-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

This test of -readconfig validates the last three regressions we
have fixed with -readconfig:

 * Interpretation of memory size units as MiB not bytes
 * Allow use of [spice]
 * Allow use of [object]

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220805115529.124544-2-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/meson.build       |   1 +
 tests/qtest/readconfig-test.c | 195 ++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 tests/qtest/readconfig-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 3a474010e4..be4b30dea2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -26,6 +26,7 @@ qtests_generic = [
   'qom-test',
   'test-hmp',
   'qos-test',
+  'readconfig-test',
 ]
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
new file mode 100644
index 0000000000..2e604d7c2d
--- /dev/null
+++ b/tests/qtest/readconfig-test.c
@@ -0,0 +1,195 @@
+/*
+ * Validate -readconfig
+ *
+ * Copyright (c) 2022 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-visit-qom.h"
+#include "qapi/qapi-visit-ui.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qstring.h"
+#include "qemu/units.h"
+
+static QTestState *qtest_init_with_config(const char *cfgdata)
+{
+    GError *error = NULL;
+    g_autofree char *args = NULL;
+    int cfgfd = -1;
+    g_autofree char *cfgpath = NULL;
+    QTestState *qts;
+    ssize_t ret;
+
+    cfgfd = g_file_open_tmp("readconfig-test-XXXXXX", &cfgpath, &error);
+    g_assert_no_error(error);
+    g_assert_cmpint(cfgfd, >=, 0);
+
+    ret = qemu_write_full(cfgfd, cfgdata, strlen(cfgdata));
+    if (ret < 0) {
+        unlink(cfgpath);
+    }
+    g_assert_cmpint(ret, ==, strlen(cfgdata));
+
+    close(cfgfd);
+
+    args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
+
+    qts = qtest_init(args);
+
+    unlink(cfgpath);
+
+    return qts;
+}
+
+static void test_x86_memdev_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(MemdevList) memdevs = NULL;
+    Memdev *memdev;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_MemdevList(v, NULL, &memdevs, &error_abort);
+
+    g_assert(memdevs);
+    g_assert(memdevs->value);
+    g_assert(!memdevs->next);
+
+    memdev = memdevs->value;
+    g_assert_cmpstr(memdev->id, ==, "ram");
+    g_assert_cmpint(memdev->size, ==, 200 * MiB);
+
+    visit_free(v);
+}
+
+static void test_x86_memdev(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[memory]\n"
+        "size = \"200\"";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
+    test_x86_memdev_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+
+#ifdef CONFIG_SPICE
+static void test_spice_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(SpiceInfo) spice = NULL;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_SpiceInfo(v, "spcie", &spice, &error_abort);
+
+    g_assert(spice);
+    g_assert(spice->enabled);
+
+    visit_free(v);
+}
+
+static void test_spice(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[spice]\n"
+        "disable-ticketing = \"on\"\n"
+        "unix = \"on\"\n";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts, "{ 'execute': 'query-spice' }");
+    test_spice_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+#endif
+
+static void test_object_rng_resp(QObject *res)
+{
+    Visitor *v;
+    g_autoptr(ObjectPropertyInfoList) objs = NULL;
+    ObjectPropertyInfoList *tmp;
+    ObjectPropertyInfo *obj;
+    bool seen_rng = false;
+
+    g_assert(res);
+    v = qobject_input_visitor_new(res);
+    visit_type_ObjectPropertyInfoList(v, NULL, &objs, &error_abort);
+
+    g_assert(objs);
+    tmp = objs;
+    while (tmp) {
+        g_assert(tmp->value);
+
+        obj = tmp->value;
+        if (g_str_equal(obj->name, "rng0") &&
+            g_str_equal(obj->type, "child<rng-builtin>")) {
+            seen_rng = true;
+        }
+
+        tmp = tmp->next;
+    }
+
+    g_assert(seen_rng);
+
+    visit_free(v);
+}
+
+static void test_object_rng(void)
+{
+    QDict *resp;
+    QTestState *qts;
+    const char *cfgdata =
+        "[object]\n"
+        "qom-type = \"rng-builtin\"\n"
+        "id = \"rng0\"\n";
+
+    qts = qtest_init_with_config(cfgdata);
+   /* Test valid command */
+    resp = qtest_qmp(qts,
+                     "{ 'execute': 'qom-list',"
+                     "  'arguments': {'path': '/objects' }}");
+    test_object_rng_resp(qdict_get(resp, "return"));
+    qobject_unref(resp);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *arch;
+    g_test_init(&argc, &argv, NULL);
+
+    arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "i386") ||
+        g_str_equal(arch, "x86_64")) {
+        qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
+    }
+#ifdef CONFIG_SPICE
+    qtest_add_func("readconfig/spice", test_spice);
+#endif
+
+    qtest_add_func("readconfig/object-rng", test_object_rng);
+
+    return g_test_run();
+}
-- 
2.37.1


