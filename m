Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC450ECC9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:46:02 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8P3-00079l-Rf
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IG-0006uO-GM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8ID-0007jI-SM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ouKYpdwGEGmWYs3o2Z5/+NwNQykEjUK6/pW0BTiY6R4=;
 b=La8ph+Blkc440FM51XClnWgp3GwGyZji09XlXLPljChH6CYi2VrYe/3Tj9WE/e63oM33EB
 +0PUQtrmxs2ovslrjwUBkEYmFR5ESXXUzdBmWRFL8TRuZS83W0CXyXmOs5gKEk36hiG87Y
 n7OMH4eNeoXS6fpNXH4tUo2f5osRYtw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-berkxsLDM_uNx1G2QqTTZQ-1; Mon, 25 Apr 2022 19:38:55 -0400
X-MC-Unique: berkxsLDM_uNx1G2QqTTZQ-1
Received: by mail-io1-f70.google.com with SMTP id
 k20-20020a5e9314000000b00649d55ffa67so12528300iom.20
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouKYpdwGEGmWYs3o2Z5/+NwNQykEjUK6/pW0BTiY6R4=;
 b=yXCpYrfWlTvpzslKIG8D+zcTDbg9KCGoX1gPbfz7nkMdDPk0XhUxQjyvZD8YdGiBeq
 VPW3rtqGvTNxXg7+ZfOCD08bGyaLS9YrIzpMQo6iDHPjQxOsIw8yx7H0F3+wVdD3ywWC
 m30CRXWGY09nqanzjoLtyhjS5h+JLvClNFPyohwhqq/gMlUVZXivlTksD2n+m+MoZXNp
 CXbRsNh7gIC3jhSaa8sSu0Wktx8Fdmsx+fbl4pE1TedyAawqv+skkA24RUN5V0QC2EhB
 Ud35e6bghbI1KD0OnDQBOe/t0BXGzCOQg14Lw/pEXxOgk0+Kxv4ANhx1FY52znUunjZ/
 BWLw==
X-Gm-Message-State: AOAM532PxjSeuCn40wXFgd7v3ZT8w2pXYCDObOK8O7XIk8xt01lXMCGU
 T3xpr6rhE5iC83GAEWJQ+O1jvTP+B6m4Tlse8piaIc1wnSOyEEq3xtOvhQq2h8yASdV8oWZ5tPB
 gSze83RYX/MjyAAdygb0oTTmzD2/gabiTmuy96r5QfljpYY/lluAkjlFzEbjwvTP4
X-Received: by 2002:a05:6638:3794:b0:32a:9f1e:a1d0 with SMTP id
 w20-20020a056638379400b0032a9f1ea1d0mr8454068jal.257.1650929934777; 
 Mon, 25 Apr 2022 16:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCZjZMOoNZoXD3vdiD7w9BHU4r4NLRIGDnmkJcE1uqFsyUSze1uuiX6UzjYdwZwi1lsSiNVA==
X-Received: by 2002:a05:6638:3794:b0:32a:9f1e:a1d0 with SMTP id
 w20-20020a056638379400b0032a9f1ea1d0mr8454047jal.257.1650929934454; 
 Mon, 25 Apr 2022 16:38:54 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:54 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/21] tests: add migration tests of TLS with x509
 credentials
Date: Mon, 25 Apr 2022 19:38:30 -0400
Message-Id: <20220425233847.10393-5-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This validates that we correctly handle migration success and failure
scenarios when using TLS with x509 certificates. There are quite a few
different scenarios that matter in relation to hostname validation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build                  |   1 +
 tests/qtest/meson.build      |   5 +
 tests/qtest/migration-test.c | 382 ++++++++++++++++++++++++++++++++++-
 3 files changed, 386 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index d083c6b7bf..d1231b23ae 100644
--- a/meson.build
+++ b/meson.build
@@ -1565,6 +1565,7 @@ config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
 config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
+config_host_data.set('CONFIG_TASN1', tasn1.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ec14559e73..af7c31d611 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -274,6 +274,11 @@ tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
 migration_files = [files('migration-helpers.c')]
 if gnutls.found()
   migration_files += [files('../unit/crypto-tls-psk-helpers.c'), gnutls]
+
+  if tasn1.found()
+    migration_files += [files('../unit/crypto-tls-x509-helpers.c',
+                              '../unit/pkix_asn1_tab.c'), tasn1]
+  endif
 endif
 
 qtests = {
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f733aa352e..c730697f74 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -29,6 +29,9 @@
 #include "tests/migration/migration-test.h"
 #ifdef CONFIG_GNUTLS
 # include "tests/unit/crypto-tls-psk-helpers.h"
+# ifdef CONFIG_TASN1
+#  include "tests/unit/crypto-tls-x509-helpers.h"
+# endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 /* For dirty ring test; so far only x86_64 is supported */
@@ -736,6 +739,234 @@ test_migrate_tls_psk_finish(QTestState *from,
     g_free(data->pskfile);
     g_free(data);
 }
+
+#ifdef CONFIG_TASN1
+typedef struct {
+    char *workdir;
+    char *keyfile;
+    char *cacert;
+    char *servercert;
+    char *serverkey;
+    char *clientcert;
+    char *clientkey;
+} TestMigrateTLSX509Data;
+
+typedef struct {
+    bool verifyclient;
+    bool clientcert;
+    bool hostileclient;
+    bool authzclient;
+    const char *certhostname;
+    const char *certipaddr;
+} TestMigrateTLSX509;
+
+static void *
+test_migrate_tls_x509_start_common(QTestState *from,
+                                   QTestState *to,
+                                   TestMigrateTLSX509 *args)
+{
+    TestMigrateTLSX509Data *data = g_new0(TestMigrateTLSX509Data, 1);
+    QDict *rsp;
+
+    data->workdir = g_strdup_printf("%s/tlscredsx5090", tmpfs);
+    data->keyfile = g_strdup_printf("%s/key.pem", data->workdir);
+
+    data->cacert = g_strdup_printf("%s/ca-cert.pem", data->workdir);
+    data->serverkey = g_strdup_printf("%s/server-key.pem", data->workdir);
+    data->servercert = g_strdup_printf("%s/server-cert.pem", data->workdir);
+    if (args->clientcert) {
+        data->clientkey = g_strdup_printf("%s/client-key.pem", data->workdir);
+        data->clientcert = g_strdup_printf("%s/client-cert.pem", data->workdir);
+    }
+
+    mkdir(data->workdir, 0700);
+
+    test_tls_init(data->keyfile);
+    g_assert(link(data->keyfile, data->serverkey) == 0);
+    if (args->clientcert) {
+        g_assert(link(data->keyfile, data->clientkey) == 0);
+    }
+
+    TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
+    if (args->clientcert) {
+        TLS_CERT_REQ_SIMPLE_CLIENT(servercertreq, cacertreq,
+                                   args->hostileclient ?
+                                   QCRYPTO_TLS_TEST_CLIENT_HOSTILE_NAME :
+                                   QCRYPTO_TLS_TEST_CLIENT_NAME,
+                                   data->clientcert);
+    }
+
+    TLS_CERT_REQ_SIMPLE_SERVER(clientcertreq, cacertreq,
+                               data->servercert,
+                               args->certhostname,
+                               args->certipaddr);
+
+    rsp = wait_command(from,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-x509',"
+                       "                 'id': 'tlscredsx509client0',"
+                       "                 'endpoint': 'client',"
+                       "                 'dir': %s,"
+                       "                 'sanity-check': true,"
+                       "                 'verify-peer': true} }",
+                       data->workdir);
+    qobject_unref(rsp);
+    migrate_set_parameter_str(from, "tls-creds", "tlscredsx509client0");
+    if (args->certhostname) {
+        migrate_set_parameter_str(from, "tls-hostname", args->certhostname);
+    }
+
+    rsp = wait_command(to,
+                       "{ 'execute': 'object-add',"
+                       "  'arguments': { 'qom-type': 'tls-creds-x509',"
+                       "                 'id': 'tlscredsx509server0',"
+                       "                 'endpoint': 'server',"
+                       "                 'dir': %s,"
+                       "                 'sanity-check': true,"
+                       "                 'verify-peer': %i} }",
+                       data->workdir, args->verifyclient);
+    qobject_unref(rsp);
+    migrate_set_parameter_str(to, "tls-creds", "tlscredsx509server0");
+
+    if (args->authzclient) {
+        rsp = wait_command(to,
+                           "{ 'execute': 'object-add',"
+                           "  'arguments': { 'qom-type': 'authz-simple',"
+                           "                 'id': 'tlsauthz0',"
+                           "                 'identity': %s} }",
+                           "CN=" QCRYPTO_TLS_TEST_CLIENT_NAME);
+        migrate_set_parameter_str(to, "tls-authz", "tlsauthz0");
+    }
+
+    return data;
+}
+
+/*
+ * The normal case: match server's cert hostname against
+ * whatever host we were telling QEMU to connect to (if any)
+ */
+static void *
+test_migrate_tls_x509_start_default_host(QTestState *from,
+                                         QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certipaddr = "127.0.0.1"
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The unusual case: the server's cert is different from
+ * the address we're telling QEMU to connect to (if any),
+ * so we must give QEMU an explicit hostname to validate
+ */
+static void *
+test_migrate_tls_x509_start_override_host(QTestState *from,
+                                          QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certhostname = "qemu.org",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The unusual case: the server's cert is different from
+ * the address we're telling QEMU to connect to, and so we
+ * expect the client to reject the server
+ */
+static void *
+test_migrate_tls_x509_start_mismatch_host(QTestState *from,
+                                          QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .certipaddr = "10.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void *
+test_migrate_tls_x509_start_friendly_client(QTestState *from,
+                                            QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .authzclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void *
+test_migrate_tls_x509_start_hostile_client(QTestState *from,
+                                           QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .clientcert = true,
+        .hostileclient = true,
+        .authzclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The case with no client certificate presented,
+ * and no server verification
+ */
+static void *
+test_migrate_tls_x509_start_allow_anon_client(QTestState *from,
+                                              QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+/*
+ * The case with no client certificate presented,
+ * and server verification rejecting
+ */
+static void *
+test_migrate_tls_x509_start_reject_anon_client(QTestState *from,
+                                               QTestState *to)
+{
+    TestMigrateTLSX509 args = {
+        .verifyclient = true,
+        .certipaddr = "127.0.0.1",
+    };
+    return test_migrate_tls_x509_start_common(from, to, &args);
+}
+
+static void
+test_migrate_tls_x509_finish(QTestState *from,
+                             QTestState *to,
+                             void *opaque)
+{
+    TestMigrateTLSX509Data *data = opaque;
+
+    test_tls_cleanup(data->keyfile);
+    unlink(data->cacert);
+    unlink(data->servercert);
+    unlink(data->serverkey);
+    unlink(data->clientcert);
+    unlink(data->clientkey);
+    rmdir(data->workdir);
+
+    g_free(data->workdir);
+    g_free(data->keyfile);
+    g_free(data);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 static int migrate_postcopy_prepare(QTestState **from_ptr,
@@ -1020,6 +1251,21 @@ static void test_precopy_unix_plain(void)
     test_precopy_common(&args);
 }
 
+static void test_precopy_unix_dirty_ring(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .start = {
+            .use_dirty_ring = true,
+        },
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    test_precopy_common(&args);
+}
+
+#ifdef CONFIG_GNUTLS
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1033,19 +1279,38 @@ static void test_precopy_unix_tls_psk(void)
     test_precopy_common(&args);
 }
 
-static void test_precopy_unix_dirty_ring(void)
+#ifdef CONFIG_TASN1
+static void test_precopy_unix_tls_x509_default_host(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateCommon args = {
         .start = {
-            .use_dirty_ring = true,
+            .hide_stderr = true,
         },
+        .connect_uri = uri,
         .listen_uri = uri,
+        .start_hook = test_migrate_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL_DEST_QUIT_ERR,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_unix_tls_x509_override_host(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
         .connect_uri = uri,
+        .listen_uri = uri,
+        .start_hook = test_migrate_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
     };
 
     test_precopy_common(&args);
 }
+#endif /* CONFIG_TASN1 */
+#endif /* CONFIG_GNUTLS */
 
 #if 0
 /* Currently upset on aarch64 TCG */
@@ -1172,6 +1437,97 @@ static void test_precopy_tcp_tls_psk_mismatch(void)
 
     test_precopy_common(&args);
 }
+
+#ifdef CONFIG_TASN1
+static void test_precopy_tcp_tls_x509_default_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_override_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_mismatch_host(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_mismatch_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL_DEST_QUIT_ERR,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_friendly_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_friendly_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_hostile_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_hostile_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_allow_anon_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_allow_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void test_precopy_tcp_tls_x509_reject_anon_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "tcp:127.0.0.1:0",
+        .start_hook = test_migrate_tls_x509_start_reject_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 static void *test_migrate_fd_start_hook(QTestState *from,
@@ -1640,6 +1996,12 @@ int main(int argc, char **argv)
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
+                   test_precopy_unix_tls_x509_default_host);
+    qtest_add_func("/migration/precopy/unix/tls/x509/override-host",
+                   test_precopy_unix_tls_x509_override_host);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
@@ -1648,6 +2010,22 @@ int main(int argc, char **argv)
                    test_precopy_tcp_tls_psk_match);
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/precopy/tcp/tls/x509/default-host",
+                   test_precopy_tcp_tls_x509_default_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/override-host",
+                   test_precopy_tcp_tls_x509_override_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/mismatch-host",
+                   test_precopy_tcp_tls_x509_mismatch_host);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/friendly-client",
+                   test_precopy_tcp_tls_x509_friendly_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/hostile-client",
+                   test_precopy_tcp_tls_x509_hostile_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/allow-anon-client",
+                   test_precopy_tcp_tls_x509_allow_anon_client);
+    qtest_add_func("/migration/precopy/tcp/tls/x509/reject-anon-client",
+                   test_precopy_tcp_tls_x509_reject_anon_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
-- 
2.32.0


