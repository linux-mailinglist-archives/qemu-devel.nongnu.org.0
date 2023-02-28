Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347FC6A60AE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6tf-0000v4-CE; Tue, 28 Feb 2023 15:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6ta-0000tV-MO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:22 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tY-0006Zx-Q6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:22 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C5245C01EC;
 Tue, 28 Feb 2023 15:48:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 28 Feb 2023 15:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677617300; x=1677703700; bh=qo
 kfXO0eNdD15vZdAmFZWrJn60AJd0dKe9QL9sF0xH8=; b=WokOoBoWjY1x4f4Gti
 8J/2XnwZFzO7LeXLecCu69YXpI5SVbztWoGa3nI0ObMkxQRdmehpNbKo2jPMq1UN
 3O99kMfVJNQumTqF+dRF8yKMF8k4p4pgNJKgLEWR0tZ5pT65EMUVWRDOqb4mFw6R
 KF7nuQrRGngEakrJEeSIuyR2vCC99qUJeE53ZiY9K86uVe2+nDeuswrPt3v3N5le
 dN3s/5TTjbJTCLOnPcDpQrK0V6H5OLzVHadOtmsMEGV6TlKTDa/tO4Aq3h6vm7Yg
 2sgzKXPreRKrMnM0+iFsLaY2dPpNKdP79020hvRI4QYhdQ9gY1jhIjBKoo+hP+Fm
 EpOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677617300; x=1677703700; bh=qokfXO0eNdD15
 vZdAmFZWrJn60AJd0dKe9QL9sF0xH8=; b=Hx5X8eSZeNLgYPKe7Hd0WuYMlyoUk
 wAVwMPQGzSGU/GV0nw81Vu07i/+G0m0P8e13EuxBEv3FMJipenmoWJng4p6Oy46H
 v1JD/zM2PBV2E3qZXzKjok45gjQwzrORB7I5oOZc+M3C0Y2TCpifzvIKVftHogOZ
 R4ieZjitk+Pz+jcq87pExHhmGw7b0F8iOi8Lu6REdPWAnjvniyeDwcjzLbaO5y7o
 goKjy+p8jUHPoQ3a29dPullV4G4iWrh8RE1wBmxdr3lPregR+Rd8ytAJi57iKJfO
 lCnFNmEZNYIfc+KsxkVtqIZ/CPsDcm9qhyB2FATaNyUPSAImLHaP0ywYA==
X-ME-Sender: <xms:lGj-Y3tITQNkPXSq8X67D360pWUNuFbSmdHSoWw5GGuLTMg7CIGXoQ>
 <xme:lGj-Y4d6YJq47ylN8AMdXPOW2vpyJQBhZQ4zbHlpPPPWCDCnVBBjRdixfzqmiyvmR
 LnqHWh4uo6-J14KJw>
X-ME-Received: <xmr:lGj-Y6zN_WYc6_DI84wwCHR6kxUSCRfddDn1t1FgQh3QqUrWUj41hadFgSp0lDp5LSkKsb_ST-9VnxkjL2BA29MmNTFdH47ZvJM353FTLnKakw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:lGj-Y2OGTOgMscv-Vx5kc06yOCX-Q5lchSPBmd8f9uWFv_RS2O3smQ>
 <xmx:lGj-Y3_u2aJdZ8LkpI3NjK2IK_waeBt_T8Ry_2woQ5xgYFr8DetGoQ>
 <xmx:lGj-Y2VCC6P6U8sf8CDmEX_ghQpkgs_eCYREStXMShe5TKJF1bfQyA>
 <xmx:lGj-Y5KsXm8MBhqZBN1B3YJHrjTb1VjqCz3QwdocBwGLDvWsDaOCQA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:48:19 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com,
	marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] qga: test: Add tests for `merge-output` flag
Date: Tue, 28 Feb 2023 13:48:04 -0700
Message-Id: <46322f524542aa2147939efc1e814c9d1d273919.1677617035.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677617035.git.dxu@dxuuu.xyz>
References: <cover.1677617035.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This commit adds a test to ensure `merge-output` functions as expected.
We also add a negative test to ensure we haven't regressed previous
functionality.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 tests/unit/test-qga.c | 157 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 140 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a14573..717f3d1103 100644
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
@@ -802,6 +813,114 @@ static void test_qga_guest_exec(gconstpointer fix)
     g_assert_cmpstr((char *)decoded, ==, "\" test_str \"");
 }
 
+static void test_qga_guest_exec_output_no_merge(gconstpointer fix)
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
+                 " 'capture-output': true } }");
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
+#if defined(G_OS_WIN32)
+static void test_qga_guest_exec_output_merge(gconstpointer fix)
+{
+    const TestFixture *fixture = fix;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
+    const gchar *class, *desc;
+    g_autofree guchar *decoded = NULL;
+
+    /* exec 'echo foo bar' */
+    ret = qmp_fd(fixture->fd, "{'execute': 'guest-exec', 'arguments': {"
+                 " 'path': '/bin/bash',"
+                 " 'arg': [ '-c', 'for i in $(seq 4); do if (( $i %% 2 )); then echo stdout; else echo stderr 1>&2; fi; done;' ],"
+                 " 'capture-output': true,"
+                 " 'merge-output': true } }");
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
+static void test_qga_guest_exec_output_merge(gconstpointer fix)
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
+                 " 'capture-output': true,"
+                 " 'merge-output': true } }");
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
@@ -972,6 +1091,10 @@ int main(int argc, char **argv)
     g_test_add_data_func("/qga/blockedrpcs", NULL, test_qga_blockedrpcs);
     g_test_add_data_func("/qga/config", NULL, test_qga_config);
     g_test_add_data_func("/qga/guest-exec", &fix, test_qga_guest_exec);
+    g_test_add_data_func("/qga/guest-exec-output-no-merge", &fix,
+                         test_qga_guest_exec_output_no_merge);
+    g_test_add_data_func("/qga/guest-exec-output-merge", &fix,
+                         test_qga_guest_exec_output_merge);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
                          test_qga_guest_exec_invalid);
     g_test_add_data_func("/qga/guest-get-osinfo", &fix,
-- 
2.39.1


