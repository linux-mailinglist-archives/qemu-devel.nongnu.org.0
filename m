Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9F45B728
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:12:36 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoKQ-0000oH-Jc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mpoHs-0007vp-PR
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:09:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mpoHp-0006ox-DI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637744992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b8yRU/yadvZ/c1gpSOXmEAidGFVd8i1yMAhBQkTPK6k=;
 b=TtuWnANjRTN+1hoSIzSe3O+/eJUau/yfdP8kC/cZnHIpEYTJpBN3nHxKBUiatiiHt8ffga
 c3k79FtWEqRQXUpAELQ66mSQh2ufYBawVq6ZKtEXvHf0f8QVYItTP5rb0VolPkI6pCiCm0
 8Y9hZGJtpAwArTojeYR2+4ZLLzYM2dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-4S98foY4MR695rI6DXN9bg-1; Wed, 24 Nov 2021 04:09:50 -0500
X-MC-Unique: 4S98foY4MR695rI6DXN9bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF48685B664;
 Wed, 24 Nov 2021 09:09:49 +0000 (UTC)
Received: from localhost (unknown [10.2.14.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58F2260C05;
 Wed, 24 Nov 2021 09:09:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: replace "blacklist" with "blocklist"
Date: Wed, 24 Nov 2021 13:09:37 +0400
Message-Id: <20211124090937.293966-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's use a more neutral language for that option.

"blacklist" is still silently accepted for compatibility reasons.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/interop/qemu-ga.rst   |  4 ++--
 qga/guest-agent-core.h     |  2 +-
 qga/commands-posix.c       | 14 ++++++------
 qga/commands-win32.c       | 10 ++++----
 qga/main.c                 | 47 ++++++++++++++++++++++----------------
 tests/unit/test-qga.c      |  8 +++----
 tests/data/test-qga-config |  2 +-
 7 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
index 3063357bb5d6..706c7b189b0e 100644
--- a/docs/interop/qemu-ga.rst
+++ b/docs/interop/qemu-ga.rst
@@ -79,7 +79,7 @@ Options
 
   Daemonize after startup (detach from terminal).
 
-.. option:: -b, --blacklist=LIST
+.. option:: -b, --blocklist=LIST
 
   Comma-separated list of RPCs to disable (no spaces, ``?`` to list
   available RPCs).
@@ -125,7 +125,7 @@ pidfile        string
 fsfreeze-hook  string
 statedir       string
 verbose        boolean
-blacklist      string list
+blocklist      string list
 =============  ===========
 
 See also
diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
index 9d01ea9c82ab..e3bef90b17db 100644
--- a/qga/guest-agent-core.h
+++ b/qga/guest-agent-core.h
@@ -24,7 +24,7 @@ typedef struct GACommandState GACommandState;
 extern GAState *ga_state;
 extern QmpCommandList ga_commands;
 
-GList *ga_command_blacklist_init(GList *blacklist);
+GList *ga_command_blocklist_init(GList *blocklist);
 void ga_command_state_init(GAState *s, GACommandState *cs);
 void ga_command_state_add(GACommandState *cs,
                           void (*init)(void),
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68ea9..046b07a6cf4e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -3042,8 +3042,8 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 }
 #endif
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the blocklist */
+GList *ga_command_blocklist_init(GList *blocklist)
 {
 #if !defined(__linux__)
     {
@@ -3057,7 +3057,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blocklist = g_list_append(blocklist, g_strdup(*p++));
         }
     }
 #endif
@@ -3072,18 +3072,18 @@ GList *ga_command_blacklist_init(GList *blacklist)
         char **p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blocklist = g_list_append(blocklist, g_strdup(*p++));
         }
     }
 #endif
 
 #if !defined(CONFIG_FSTRIM)
-    blacklist = g_list_append(blacklist, g_strdup("guest-fstrim"));
+    blocklist = g_list_append(blocklist, g_strdup("guest-fstrim"));
 #endif
 
-    blacklist = g_list_append(blacklist, g_strdup("guest-get-devices"));
+    blocklist = g_list_append(blocklist, g_strdup("guest-get-devices"));
 
-    return blacklist;
+    return blocklist;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4e84afd83bee..785867a30a4a 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2005,8 +2005,8 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
     return NULL;
 }
 
-/* add unsupported commands to the blacklist */
-GList *ga_command_blacklist_init(GList *blacklist)
+/* add unsupported commands to the blocklist */
+GList *ga_command_blocklist_init(GList *blocklist)
 {
     const char *list_unsupported[] = {
         "guest-suspend-hybrid",
@@ -2017,7 +2017,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
     char **p = (char **)list_unsupported;
 
     while (*p) {
-        blacklist = g_list_append(blacklist, g_strdup(*p++));
+        blocklist = g_list_append(blocklist, g_strdup(*p++));
     }
 
     if (!vss_init(true)) {
@@ -2028,11 +2028,11 @@ GList *ga_command_blacklist_init(GList *blacklist)
         p = (char **)list;
 
         while (*p) {
-            blacklist = g_list_append(blacklist, g_strdup(*p++));
+            blocklist = g_list_append(blocklist, g_strdup(*p++));
         }
     }
 
-    return blacklist;
+    return blocklist;
 }
 
 /* register init/cleanup routines for stateful command groups */
diff --git a/qga/main.c b/qga/main.c
index 15fd3a4149f4..016e3f160570 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -88,7 +88,7 @@ struct GAState {
 #endif
     bool delimit_response;
     bool frozen;
-    GList *blacklist;
+    GList *blocklist;
     char *state_filepath_isfrozen;
     struct {
         const char *log_filepath;
@@ -257,7 +257,7 @@ QEMU_COPYRIGHT "\n"
 #ifdef _WIN32
 "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
 #endif
-"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
+"  -b, --blocklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
 "                    to list available RPCs)\n"
 "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
 "                    options / command-line parameters to stdout\n"
@@ -379,13 +379,13 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
     }
 }
 
-/* [re-]enable all commands, except those explicitly blacklisted by user */
-static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)
+/* [re-]enable all commands, except those explicitly blocklisted by user */
+static void ga_enable_non_blocklisted(const QmpCommand *cmd, void *opaque)
 {
-    GList *blacklist = opaque;
+    GList *blocklist = opaque;
     const char *name = qmp_command_name(cmd);
 
-    if (g_list_find_custom(blacklist, name, ga_strcmp) == NULL &&
+    if (g_list_find_custom(blocklist, name, ga_strcmp) == NULL &&
         !qmp_command_is_enabled(cmd)) {
         g_debug("enabling command: %s", name);
         qmp_enable_command(&ga_commands, name);
@@ -463,8 +463,8 @@ void ga_unset_frozen(GAState *s)
         s->deferred_options.pid_filepath = NULL;
     }
 
-    /* enable all disabled, non-blacklisted commands */
-    qmp_for_each_command(&ga_commands, ga_enable_non_blacklisted, s->blacklist);
+    /* enable all disabled, non-blocklisted commands */
+    qmp_for_each_command(&ga_commands, ga_enable_non_blocklisted, s->blocklist);
     s->frozen = false;
     if (!ga_delete_file(s->state_filepath_isfrozen)) {
         g_warning("unable to delete %s, fsfreeze may not function properly",
@@ -894,7 +894,7 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)
     int64_t handle;
 
     g_assert(s->pstate_filepath);
-    /* we blacklist commands and avoid operations that potentially require
+    /* we blocklist commands and avoid operations that potentially require
      * writing to disk when we're in a frozen state. this includes opening
      * new files, so we should never get here in that situation
      */
@@ -948,8 +948,8 @@ struct GAConfig {
 #ifdef _WIN32
     const char *service;
 #endif
-    gchar *bliststr; /* blacklist may point to this string */
-    GList *blacklist;
+    gchar *bliststr; /* blocklist may point to this string */
+    GList *blocklist;
     int daemonize;
     GLogLevelFlags log_level;
     int dumpconf;
@@ -1007,10 +1007,16 @@ static void config_load(GAConfig *config)
         config->retry_path =
             g_key_file_get_boolean(keyfile, "general", "retry-path", &gerr);
     }
+    if (g_key_file_has_key(keyfile, "general", "blocklist", NULL)) {
+        config->bliststr =
+            g_key_file_get_string(keyfile, "general", "blocklist", &gerr);
+        config->blocklist = g_list_concat(config->blocklist,
+                                          split_list(config->bliststr, ","));
+    }
     if (g_key_file_has_key(keyfile, "general", "blacklist", NULL)) {
         config->bliststr =
             g_key_file_get_string(keyfile, "general", "blacklist", &gerr);
-        config->blacklist = g_list_concat(config->blacklist,
+        config->blocklist = g_list_concat(config->blocklist,
                                           split_list(config->bliststr, ","));
     }
 
@@ -1070,8 +1076,8 @@ static void config_dump(GAConfig *config)
                            config->log_level == G_LOG_LEVEL_MASK);
     g_key_file_set_boolean(keyfile, "general", "retry-path",
                            config->retry_path);
-    tmp = list_join(config->blacklist, ',');
-    g_key_file_set_string(keyfile, "general", "blacklist", tmp);
+    tmp = list_join(config->blocklist, ',');
+    g_key_file_set_string(keyfile, "general", "blocklist", tmp);
     g_free(tmp);
 
     tmp = g_key_file_to_data(keyfile, NULL, &error);
@@ -1103,6 +1109,7 @@ static void config_parse(GAConfig *config, int argc, char **argv)
         { "method", 1, NULL, 'm' },
         { "path", 1, NULL, 'p' },
         { "daemonize", 0, NULL, 'd' },
+        { "blocklist", 1, NULL, 'b' },
         { "blacklist", 1, NULL, 'b' },
 #ifdef _WIN32
         { "service", 1, NULL, 's' },
@@ -1161,7 +1168,7 @@ static void config_parse(GAConfig *config, int argc, char **argv)
                 qmp_for_each_command(&ga_commands, ga_print_cmd, NULL);
                 exit(EXIT_SUCCESS);
             }
-            config->blacklist = g_list_concat(config->blacklist,
+            config->blocklist = g_list_concat(config->blocklist,
                                              split_list(optarg, ","));
             break;
         }
@@ -1216,7 +1223,7 @@ static void config_free(GAConfig *config)
 #ifdef CONFIG_FSFREEZE
     g_free(config->fsfreeze_hook);
 #endif
-    g_list_free_full(config->blacklist, g_free);
+    g_list_free_full(config->blocklist, g_free);
     g_free(config);
 }
 
@@ -1322,10 +1329,10 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         return NULL;
     }
 
-    config->blacklist = ga_command_blacklist_init(config->blacklist);
-    if (config->blacklist) {
-        GList *l = config->blacklist;
-        s->blacklist = config->blacklist;
+    config->blocklist = ga_command_blocklist_init(config->blocklist);
+    if (config->blocklist) {
+        GList *l = config->blocklist;
+        s->blocklist = config->blocklist;
         do {
             g_debug("disabling command: %s", (char *)l->data);
             qmp_disable_command(&ga_commands, l->data, NULL);
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 5cb140d1b53d..228a457a68dc 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -655,7 +655,7 @@ static void test_qga_get_time(gconstpointer fix)
     qobject_unref(ret);
 }
 
-static void test_qga_blacklist(gconstpointer data)
+static void test_qga_blocklist(gconstpointer data)
 {
     TestFixture fix;
     QDict *ret, *error;
@@ -663,7 +663,7 @@ static void test_qga_blacklist(gconstpointer data)
 
     fixture_setup(&fix, "-b guest-ping,guest-get-time", NULL);
 
-    /* check blacklist */
+    /* check blocklist */
     ret = qmp_fd(fix.fd, "{'execute': 'guest-ping'}");
     g_assert_nonnull(ret);
     error = qdict_get_qdict(ret, "error");
@@ -752,7 +752,7 @@ static void test_qga_config(gconstpointer data)
     g_assert_true(g_key_file_get_boolean(kf, "general", "verbose", &error));
     g_assert_no_error(error);
 
-    strv = g_key_file_get_string_list(kf, "general", "blacklist", &n, &error);
+    strv = g_key_file_get_string_list(kf, "general", "blocklist", &n, &error);
     g_assert_cmpint(n, ==, 2);
     g_assert_true(g_strv_contains((const char * const *)strv,
                                   "guest-ping"));
@@ -997,7 +997,7 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/fsfreeze-status", &fix,
                          test_qga_fsfreeze_status);
 
-    g_test_add_data_func("/qga/blacklist", NULL, test_qga_blacklist);
+    g_test_add_data_func("/qga/blocklist", NULL, test_qga_blocklist);
     g_test_add_data_func("/qga/config", NULL, test_qga_config);
     g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
diff --git a/tests/data/test-qga-config b/tests/data/test-qga-config
index 4bb721a4a187..50bbb2caf7d4 100644
--- a/tests/data/test-qga-config
+++ b/tests/data/test-qga-config
@@ -5,4 +5,4 @@ path=/path/to/org.qemu.guest_agent.0
 pidfile=/var/foo/qemu-ga.pid
 statedir=/var/state
 verbose=true
-blacklist=guest-ping;guest-get-time
+blocklist=guest-ping;guest-get-time
-- 
2.33.0.721.g106298f7f9


