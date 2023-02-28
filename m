Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99D6A5F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX54J-0006om-CJ; Tue, 28 Feb 2023 13:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX54G-0006nr-DM
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:16 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX54E-00071l-JD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C11265C00CF;
 Tue, 28 Feb 2023 13:51:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 28 Feb 2023 13:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677610273; x=1677696673; bh=OK
 mgUdQ/AbIr0037Bdi6kfEzLOqPts9KtHWtFOPs0WI=; b=JlJuerdDASBVhrzeJR
 u0IHcQ3KeGgrIPV0BXuSJX8b/FtZM70YGwiTBFcSilexgiPaDU+vvdzsOHQaver7
 0Hme+3nzXQxS3NYkBlbCRYM/+k6w3FCMfWvucbm+EjcueCSBcw1MvX49dv7KpHww
 65MbGszHz5/+MEGSb32D0jbjzo9zFm30I4oaR7Pb7ljXhCQp0vddK6ypDplDWNx1
 xE8alSGd0wCSjt6RfDGUybdOga8HhGg2YgqHW3Eg7X1+RAxaT23Ln8/nv6/BLsf9
 BgSJHf/JtNcmlSzS3fzaCfmUUpjaB+m/fEKavAFG0Jq2uysQDSuwnHT45Vmhu5QS
 LTxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677610273; x=1677696673; bh=OKmgUdQ/AbIr0
 037Bdi6kfEzLOqPts9KtHWtFOPs0WI=; b=b27ywx+d6G9SMUil7zXDU63WCUVa0
 Ff1ndh1GhUgvxh3PqefxBVuxSLy4WJC1CaEFge7TARYKniDFRj1Oxu4PR2YIGdxh
 DBeyzKlHo6EW2JmiUMVjCH5qpqrMZseMGiduVLbw508KWvyYtZ6npLqP/XTqxAAW
 JSJjVfiwkMPI478a05c7uJtCiDHeIpnL/Dvy8MqNvfo626djShRwILWfNB0u2146
 Ln9dS/46FmMcuDEGj6JqfCBEt1kEavJSOZqDUHr9GQCGYQbdH2PasXfXf3Xz6uEd
 JT0xeasF5Pl4FreA72G1Cy8yVaTPGHca06Icqtyi/vDIE+Sjb34SZ6Mpw==
X-ME-Sender: <xms:IU3-Y5ZQrQFrBsKcuHblqNNZCrvNC9R-7l90CaRjcWx6mzEYRvc6hg>
 <xme:IU3-YwYwcBMkCwi9ohIhVmwejr4HWsj2qkgfw7YOWuOAZZk33lU49o5rokXLkdauh
 rC8D9q55BbgAOLUXw>
X-ME-Received: <xmr:IU3-Y78u0oJ2MYDSMah5tdEl58jMZSsMsn0BrAo2WbHYRgjC1XT6O8O0ntXnbfMrLvNV-x50QiiUW7a8Odg2mp3S14rxPuG0lxLfn7EnVNOPRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:IU3-Y3rtdIhZdgWZwStn9M1ro9-qtFvIWKOqlLQGwE1xgIYlKGWxCA>
 <xmx:IU3-Y0p94BttUb_g0YbJlrmGDCGhurWhW2pLBU5ZylKRpO2nRmPj9Q>
 <xmx:IU3-Y9RwRLxgGUBbMYWk0H0XgPI4MutrnnM9ZpDhKGTOYwDAjtbuAA>
 <xmx:IU3-Y70pPtTKw2jkCOwK8ciRBjppiPIqsAM4RPpTZEit_fetu_lfZQ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 13:51:12 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com,
	michael.roth@amd.com,
	marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] qga: test: Add tests for `merge-output` flag
Date: Tue, 28 Feb 2023 11:50:36 -0700
Message-Id: <4d6cb0a2de825fc23c859a2b25836111e8ac0872.1677609866.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677609866.git.dxu@dxuuu.xyz>
References: <cover.1677609866.git.dxu@dxuuu.xyz>
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
 tests/unit/test-qga.c | 133 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 116 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a14573..02eb4bf980 100644
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
@@ -802,6 +813,90 @@ static void test_qga_guest_exec(gconstpointer fix)
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
+static void test_qga_guest_exec_output_merge(gconstpointer fix)
+{
+#if !defined(G_OS_WIN32)
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
+#endif
+}
+
 static void test_qga_guest_exec_invalid(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
@@ -972,6 +1067,10 @@ int main(int argc, char **argv)
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


