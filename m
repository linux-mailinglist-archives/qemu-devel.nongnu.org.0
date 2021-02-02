Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2230CD86
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:02:35 +0100 (CET)
Received: from localhost ([::1]:33878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72ol-0003xh-27
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72l8-000226-Ts
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72l6-0006oN-VV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xlu9C8l46HeJfL6X9SL2SiRfjv5SEslChtTTiGjH9U=;
 b=KbaJbkzxrftGjdXU6UBUjwz8vsf54Ock4PMhz9UkbgQC4iV6juNin8TQTgyPvfaZmoq9sn
 6INuYgaF+75995P8j33x6iGT7gdWGs4/ZRm1HvWd3DonVzWVBUZU2kk2PV2pGF/U8IWjEp
 8ck4Xkvz8dwBS+WHCYgP3FOIlrcXyPs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537--EsC4TTDPH2Q8OYQrPPO_g-1; Tue, 02 Feb 2021 15:58:47 -0500
X-MC-Unique: -EsC4TTDPH2Q8OYQrPPO_g-1
Received: by mail-ej1-f70.google.com with SMTP id bz10so5520570ejc.20
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Xlu9C8l46HeJfL6X9SL2SiRfjv5SEslChtTTiGjH9U=;
 b=gsKijUIaZ3IihvA3h6ZANRmADOvZ+wwYkkrg9/92cbbqZnSsVsLTBqrYNUgKJr9MuB
 /FQ4gYWFFAg84m/3nyDdr5IJsKLU7vG/+fr6HFddxeIv6g11E+xKBqvqxxTVh0oUUNQh
 07pQtMT9T8B6T7Vb/OlOUqc6RS26KeRgiCWn1so/vxwOSe9Lz7l9Rwy5lK6WGJa6YbXw
 tL4DIqa+2a9SrlJqHIDX8GHC9gB0z4VuRrZT7JmUnm7EaPUmLJi4gn86yeyXiL3ZyC81
 dROTc1lVdbtLz4E0423tqu2kdT6wJb3B/eE71jR4Cmsn6pdIcDhU/vSWjCLr+cbF7J7g
 kjdQ==
X-Gm-Message-State: AOAM533VM/XAbXGZqvVjXleS+7je7wfvoMUsYot8zGMY4TATae+sjMml
 1DWrxq2NVI/VwaV77ALMwR3RQmERRmpWAmamw8pFmVaBY7N+xcle33eUBgIAeCngAelMt2oiK9e
 8n3Puop6YWs3VfZ+f6zQE80ETTiXyAXjM3rfakoKNnPhNgkpI+SxYt4FmkmIFtGj2
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr23301315ejc.197.1612299525689; 
 Tue, 02 Feb 2021 12:58:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycaM0s5bvfuIyFO+Pkw6XoqVYUhO0v3msX2x1AnXKxmRoILwJHUkIOlEmXapI+Fa2EcyHSvA==
X-Received: by 2002:a17:907:1629:: with SMTP id
 hb41mr23301298ejc.197.1612299525524; 
 Tue, 02 Feb 2021 12:58:45 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e19sm10317539eds.79.2021.02.02.12.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:58:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] qga: Rename config key 'blacklist' as 'denylist'
Date: Tue,  2 Feb 2021 21:58:14 +0100
Message-Id: <20210202205824.1085853-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/interop/qemu-ga.rst   |  2 +-
 qga/main.c                 | 15 +++++++++++----
 tests/test-qga.c           |  8 ++++----
 tests/data/test-qga-config |  2 +-
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
index 3063357bb5d..9a590bf95cb 100644
--- a/docs/interop/qemu-ga.rst
+++ b/docs/interop/qemu-ga.rst
@@ -125,7 +125,7 @@ pidfile        string
 fsfreeze-hook  string
 statedir       string
 verbose        boolean
-blacklist      string list
+denylist       string list
 =============  ===========
 
 See also
diff --git a/qga/main.c b/qga/main.c
index e7f8f3b1616..249fe06e8e5 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -962,6 +962,7 @@ static void config_load(GAConfig *config)
     GError *gerr = NULL;
     GKeyFile *keyfile;
     g_autofree char *conf = g_strdup(g_getenv("QGA_CONF")) ?: get_relocated_path(QGA_CONF_DEFAULT);
+    const gchar *denylist_key = "denylist";
 
     /* read system config */
     keyfile = g_key_file_new();
@@ -1008,10 +1009,16 @@ static void config_load(GAConfig *config)
         config->retry_path =
             g_key_file_get_boolean(keyfile, "general", "retry-path", &gerr);
     }
+
     if (g_key_file_has_key(keyfile, "general", "blacklist", NULL)) {
+        g_warning("config using deprecated 'blacklist' key, now replaced"
+                  " by the 'denylist' key.");
+        denylist_key = "blacklist";
+    }
+    if (g_key_file_has_key(keyfile, "general", denylist_key, NULL)) {
         config->bliststr =
-            g_key_file_get_string(keyfile, "general", "blacklist", &gerr);
-        config->blacklist = g_list_concat(config->blacklist,
+            g_key_file_get_string(keyfile, "general", denylist_key, &gerr);
+        config->denylist = g_list_concat(config->denylist,
                                           split_list(config->bliststr, ","));
     }
 
@@ -1071,8 +1078,8 @@ static void config_dump(GAConfig *config)
                            config->log_level == G_LOG_LEVEL_MASK);
     g_key_file_set_boolean(keyfile, "general", "retry-path",
                            config->retry_path);
-    tmp = list_join(config->blacklist, ',');
-    g_key_file_set_string(keyfile, "general", "blacklist", tmp);
+    tmp = list_join(config->denylist, ',');
+    g_key_file_set_string(keyfile, "general", "denylist", tmp);
     g_free(tmp);
 
     tmp = g_key_file_to_data(keyfile, NULL, &error);
diff --git a/tests/test-qga.c b/tests/test-qga.c
index eb33264e8ed..c2836244b04 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -655,7 +655,7 @@ static void test_qga_get_time(gconstpointer fix)
     qobject_unref(ret);
 }
 
-static void test_qga_blacklist(gconstpointer data)
+static void test_qga_denylist(gconstpointer data)
 {
     TestFixture fix;
     QDict *ret, *error;
@@ -663,7 +663,7 @@ static void test_qga_blacklist(gconstpointer data)
 
     fixture_setup(&fix, "-b guest-ping,guest-get-time", NULL);
 
-    /* check blacklist */
+    /* check denylist */
     ret = qmp_fd(fix.fd, "{'execute': 'guest-ping'}");
     g_assert_nonnull(ret);
     error = qdict_get_qdict(ret, "error");
@@ -752,7 +752,7 @@ static void test_qga_config(gconstpointer data)
     g_assert_true(g_key_file_get_boolean(kf, "general", "verbose", &error));
     g_assert_no_error(error);
 
-    strv = g_key_file_get_string_list(kf, "general", "blacklist", &n, &error);
+    strv = g_key_file_get_string_list(kf, "general", "denylist", &n, &error);
     g_assert_cmpint(n, ==, 2);
     g_assert_true(g_strv_contains((const char * const *)strv,
                                   "guest-ping"));
@@ -997,7 +997,7 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/fsfreeze-status", &fix,
                          test_qga_fsfreeze_status);
 
-    g_test_add_data_func("/qga/blacklist", NULL, test_qga_blacklist);
+    g_test_add_data_func("/qga/denylist", NULL, test_qga_denylist);
     g_test_add_data_func("/qga/config", NULL, test_qga_config);
     g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
diff --git a/tests/data/test-qga-config b/tests/data/test-qga-config
index 4bb721a4a18..d9ddc1a4d96 100644
--- a/tests/data/test-qga-config
+++ b/tests/data/test-qga-config
@@ -5,4 +5,4 @@ path=/path/to/org.qemu.guest_agent.0
 pidfile=/var/foo/qemu-ga.pid
 statedir=/var/state
 verbose=true
-blacklist=guest-ping;guest-get-time
+denylist=guest-ping;guest-get-time
-- 
2.26.2


