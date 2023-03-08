Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814AB6B159C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2br-0001R1-M8; Wed, 08 Mar 2023 17:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bo-0001P3-Uv
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:09 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bm-00084l-Tz
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:08 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 66F235C012D;
 Wed,  8 Mar 2023 17:50:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 08 Mar 2023 17:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678315806; x=
 1678402206; bh=xQTrFt+LfgKM0nx7+MDilf5Eq/wi2bQFetpOeY/fifU=; b=u
 IJx4jE8lJWzsMfQ4QWR4WstOYFNke2cXeENlRkRdVZMpiwJo+zI/g9+AyB1/RFE7
 zKSAutoIynNpK7Z7sJQa9hj2SCsuwpo44bA5SnUUe253T0Lj2r0c231GCuDPJrDz
 VcWUbHnw1z4SPbKPS+oqxt77uWbYxMZjcCSaV6h2gUO0ruVxMliSnpOhg26BWwaK
 4DZi+JGGGncimzMuOLU5U6ZfxnzySZxtFYUsNX8WtOoJVTjw6QonP8AjM+ZezeeH
 S9kpSOckpuwF75sW3Je35bIuG1xZhvfuSMh7UsdJQBAZ8+52S23iFLEVVFI0k2ql
 jsfnIkkVbh7eK23pU41uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678315806; x=
 1678402206; bh=xQTrFt+LfgKM0nx7+MDilf5Eq/wi2bQFetpOeY/fifU=; b=h
 9tbAzT+HSSmiJXmV04XzcKZ0jMdf435URQaauItTqs7571dXeg7FslMcWnNIO7ef
 LGpXRJ8TsoVIvpZCyGW14U40B2MLKhTpyj14cILzHcnmEI+QwoZ57ql4WLeCZaGy
 sxcI16+PatkDp0TCTLLb/NKaXBaNt7JujbH3z8aMxiylHeAKyKaX3yNAX3yWV5GQ
 W5JOcBeUcH9bZ8yMf3MphAsNBD4yMzauoDwdLfMdZgrhoiY0Hz3tcrDdyHnwOIwY
 gEY6RafXBldQbw877FaPc6YwNPDSXmVyOzmbnr3vxSmoMhhlSy1FCAog75UT3LhR
 /wvnPcn5q4G8spgtCC73A==
X-ME-Sender: <xms:HhEJZCfdnn18iT_FTgoVehzzYMKioSF9PBUITW1lxKu0dCH0qhbKUw>
 <xme:HhEJZMNPPzEnd56BkdqS6_kC7YWwJH1lvsPHYigRHiAUS3eMt1ua_s5k7bY7BocHz
 pRze9d_-eJ2ZhLR7g>
X-ME-Received: <xmr:HhEJZDiAwnIgq5CmA6FC8FZ_ZzbSfD5mOpvNTiaPSTuz9s0PN3MO5VcSUe6atDE18zeefaNkU0n_1cMJ3_0b4b7g3nfggXT9SlDSI-xfHm79xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvvefuff
 fkofgjfhgggfestdekredtredttdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihu
 segugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpefgfefggeejhfduieekvdeute
 ffleeifeeuvdfhheejleejjeekgfffgefhtddtteenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HhEJZP9ThqRT-lycK9FJXh3BKjpHBFIIZBYEONr3ma0dl71ccop82w>
 <xmx:HhEJZOuhAIpIINzyju7aVblKHMdJ0BqUv4T489f5fkwYk3EnK1ePZg>
 <xmx:HhEJZGGvSOOdMYeCrP1IH5Va6v-t9KBkuZg27QQwYqZW-GYQB7auWA>
 <xmx:HhEJZCJA-e6PkcEv6D9Eig8Fs6S5IllgTI81dxzd8tMYWtQXbJ2d5A>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 17:50:05 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] qga: test: Add tests for `all-merge` flag
Date: Wed,  8 Mar 2023 15:49:41 -0700
Message-Id: <31e6def3bd18f1f06632c773bd45fd5a83e58f78.1678314204.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678314204.git.dxu@dxuuu.xyz>
References: <cover.1678314204.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=dxu@dxuuu.xyz;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This commit adds a test to ensure `all-merge` functions as expected.
We also add a negative test to ensure we haven't regressed previous
functionality.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 tests/unit/test-qga.c | 158 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 141 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a14573..fcb84ab81f 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -755,6 +755,31 @@ static void test_qga_fsfreeze_status(gconstpointer fix)
     g_assert_cmpstr(status, ==, "thawed");
 }
 
+static QDict *wait_for_guest_exec_completion(int fd, int64_t pid)
+{
+    QDict *ret = NULL;
+    int64_t now;
+    bool exited;
+    QDict *val;
+
+    now = g_get_monotonic_time();
+    do {
+        ret = qmp_fd(fd,
+                     "{'execute': 'guest-exec-status',"
+                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
+        g_assert_nonnull(ret);
+        val = qdict_get_qdict(ret, "return");
+        exited = qdict_get_bool(val, "exited");
+        if (!exited) {
+            qobject_unref(ret);
+        }
+    } while (!exited &&
+             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
+    g_assert(exited);
+
+    return ret;
+}
+
 static void test_qga_guest_exec(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
@@ -762,9 +787,8 @@ static void test_qga_guest_exec(gconstpointer fix)
     QDict *val;
     const gchar *out;
     g_autofree guchar *decoded = NULL;
-    int64_t pid, now, exitcode;
+    int64_t pid, exitcode;
     gsize len;
-    bool exited;
 
     /* exec 'echo foo bar' */
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
@@ -777,23 +801,10 @@ static void test_qga_guest_exec(gconstpointer fix)
     g_assert_cmpint(pid, >, 0);
     qobject_unref(ret);
 
-    /* wait for completion */
-    now = g_get_monotonic_time();
-    do {
-        ret = qmp_fd(fixture->fd,
-                     "{'execute': 'guest-exec-status',"
-                     " 'arguments': { 'pid': %" PRId64 " } }", pid);
-        g_assert_nonnull(ret);
-        val = qdict_get_qdict(ret, "return");
-        exited = qdict_get_bool(val, "exited");
-        if (!exited) {
-            qobject_unref(ret);
-        }
-    } while (!exited &&
-             g_get_monotonic_time() < now + 5 * G_TIME_SPAN_SECOND);
-    g_assert(exited);
+    ret = wait_for_guest_exec_completion(fixture->fd, pid);
 
     /* check stdout */
+    val = qdict_get_qdict(ret, "return");
     exitcode = qdict_get_int(val, "exitcode");
     g_assert_cmpint(exitcode, ==, 0);
     out = qdict_get_str(val, "out-data");
@@ -802,6 +813,115 @@ static void test_qga_guest_exec(gconstpointer fix)
     g_assert_cmpstr((char *)decoded, ==, "\" test_str \"");
 }
 
+#if defined(G_OS_WIN32)
+static void test_qga_guest_exec_all_no_merge(gconstpointer fix)
+{
+}
+static void test_qga_guest_exec_all_merge(gconstpointer fix)
+{
+    const TestFixture *fixture = fix;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
+    const gchar *class, *desc;
+    g_autofree guchar *decoded = NULL;
+
+    /* exec 'echo foo bar' */
+    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
+                 " 'path': 'echo',"
+                 " 'arg': [ 'execution never reaches here' ],"
+                 " 'capture-output': 'all-merge' } }");
+
+    g_assert_nonnull(ret);
+    val = qdict_get_qdict(ret, "error");
+    g_assert_nonnull(val);
+    class = qdict_get_str(val, "class");
+    desc = qdict_get_str(val, "desc");
+    g_assert_cmpstr(class, ==, "GenericError");
+    g_assert_cmpint(strlen(desc), >, 0);
+}
+#else
+static void test_qga_guest_exec_all_no_merge(gconstpointer fix)
+{
+    const TestFixture *fixture = fix;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
+    const gchar *out, *err;
+    g_autofree guchar *out_decoded = NULL;
+    g_autofree guchar *err_decoded = NULL;
+    int64_t pid, exitcode;
+    gsize len;
+
+    /* exec 'echo foo bar' */
+    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
+                 " 'path': '/bin/bash',"
+                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
+                 " 'capture-output': 'all' } }");
+    g_assert_nonnull(ret);
+    qmp_assert_no_error(ret);
+    val = qdict_get_qdict(ret, "return");
+    pid = qdict_get_int(val, "pid");
+    g_assert_cmpint(pid, >, 0);
+    qobject_unref(ret);
+
+    ret = wait_for_guest_exec_completion(fixture->fd, pid);
+
+    val = qdict_get_qdict(ret, "return");
+    exitcode = qdict_get_int(val, "exitcode");
+    g_assert_cmpint(exitcode, ==, 0);
+
+    /* check stdout */
+    out = qdict_get_str(val, "out-data");
+    out_decoded = g_base64_decode(out, &len);
+    g_assert_cmpint(len, ==, 14);
+    g_assert_cmpstr((char *)out_decoded, ==, "stdout\nstdout\n");
+
+    /* check stderr */
+    err = qdict_get_try_str(val, "err-data");
+    err_decoded = g_base64_decode(err, &len);
+    g_assert_cmpint(len, ==, 14);
+    g_assert_cmpstr((char *)err_decoded, ==, "stderr\nstderr\n");
+}
+
+static void test_qga_guest_exec_all_merge(gconstpointer fix)
+{
+    const TestFixture *fixture = fix;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
+    const gchar *out, *err;
+    g_autofree guchar *decoded = NULL;
+    int64_t pid, exitcode;
+    gsize len;
+
+    /* exec 'echo foo bar' */
+    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
+                 " 'path': '/bin/bash',"
+                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
+                 " 'capture-output': 'all-merge' } }");
+    g_assert_nonnull(ret);
+    qmp_assert_no_error(ret);
+    val = qdict_get_qdict(ret, "return");
+    pid = qdict_get_int(val, "pid");
+    g_assert_cmpint(pid, >, 0);
+    qobject_unref(ret);
+
+    ret = wait_for_guest_exec_completion(fixture->fd, pid);
+
+    val = qdict_get_qdict(ret, "return");
+    exitcode = qdict_get_int(val, "exitcode");
+    g_assert_cmpint(exitcode, ==, 0);
+
+    /* check stdout */
+    out = qdict_get_str(val, "out-data");
+    decoded = g_base64_decode(out, &len);
+    g_assert_cmpint(len, ==, 28);
+    g_assert_cmpstr((char *)decoded, ==, "stdout\nstderr\nstdout\nstderr\n");
+
+    /* check stderr */
+    err = qdict_get_try_str(val, "err-data");
+    g_assert_null(err);
+}
+#endif
+
 static void test_qga_guest_exec_invalid(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
@@ -972,6 +1092,10 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs);
     g_test_add_data_func("/qga/config", NULL, test_qga_config);
     g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
+    g_test_add_data_func("/qga/guest-exec-all-no-merge", &fix,
+                         test_qga_guest_exec_all_no_merge);
+    g_test_add_data_func("/qga/guest-exec-all-merge", &fix,
+                         test_qga_guest_exec_all_merge);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
                          test_qga_guest_exec_invalid);
     g_test_add_data_func("/qga/guest-get-osinfo", &fix,
-- 
2.39.1


