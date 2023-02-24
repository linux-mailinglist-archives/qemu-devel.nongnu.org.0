Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B646A15E9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjK-00078F-4Q; Thu, 23 Feb 2023 23:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSr-0001qi-Lr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:38 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSo-0007QA-Sh
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:37 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D39C5C019F;
 Thu, 23 Feb 2023 21:05:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 21:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677204334; x=1677290734; bh=ep
 ENDiq/A2ouFrRvdVIfHeqR+yIzIpI+H0pVokqpzuc=; b=bk8bzpnwq9zqKv6wwI
 H7j7M4ITpn35+pcIwFIKZhEMavfMoQySepGG1chBWbaFOsJ0S3vL9U+pfs/SSB8N
 Ddz3Ic9JP2FC6l8PlIHt6FkJTaODSKXu7unkOaOGRkXMgc4nO6cu2IbAfWRbhfMN
 zViDye51qph1xiT0lMAlPWSQbNpglLg9ESwYH2iZ1gOeDIjPGSZR8iY/CqFMR+kd
 XO86pxqV0DBg7YmsAuupuAyoz1gq6k4ptKN6hKkWiiBZkbhjGiAbF0d8fee+zOOX
 u2yIhyfu7d5s+rxjSsie2yLaozFPdWeLSIj/m+pThWTO6l6qEUEsGXAhSH/G7/An
 TrTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677204334; x=1677290734; bh=epENDiq/A2ouF
 rRvdVIfHeqR+yIzIpI+H0pVokqpzuc=; b=SIjeNoSy6AxRZ5HTFsnPBq1j2y/Vk
 +Os0YXHEHalIFkGBXWDPF8UCHIkqqUvFPWfSWC2H7TK2yqOX2YgLw5KXgZyElEy/
 jrgf4BA8leEcakrXRPtqJNbAy/4Z3o8MjD3HOavim++0WTum1gcJpZwCtVoTwsV8
 /ES0qXe2Umqiq/NnQ06mWd3uU1RiH3TKtHoniGbrCPRqsqMh+MEK62Yxz9BQyRUn
 N3R/yIdJHirFhKkNeU1H1sZ65pY9nOINL5/c0sM7I2WRTJPelfUEF8v5hOnpnNy6
 fx09vUDUDSk+rKBKpfnXWZSV19Y+NgpAtOZiB0pvfjlXp6steyi1hP7sQ==
X-ME-Sender: <xms:bhv4Y30lukXdKz-BftJkvJIxLhzcfXURvRIEXfbCGgmVAI51Wip2hw>
 <xme:bhv4Y2FgIiulPUc0I8JkwQUmyFVBneH0wGfx1VOMoZvVDlR0N4TRO6qiTT7q0XqC_
 KkhyZGSiqE9P-kVFA>
X-ME-Received: <xmr:bhv4Y36HBi_SLkmP5HuP8PF1Brcu9pmnnc1Lt93yAkFUtqU6rbNgsgnu0fi3EPjbol80pWVPBzB2qPy3531Lf_Fie3g50K0IeyFV9jChxvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:bhv4Y81QjlSFQdpFBaINkPAkIUzhl6AFXM3Kc5VuIeNgFvYAlT2Yrg>
 <xmx:bhv4Y6FZcFyi6s1ZbQqfpFA5XqQtYDGAFb2FXZefrEjw-EHsWQD5Nw>
 <xmx:bhv4Y99rrwsEUYCbnMAFVc9jM53TPLrVykwA923uKBgfPKBkAW3_mg>
 <xmx:bhv4Y_SZNmLfKxz0D_4xHgDMbyLiGvAX25y3BOcZOOUmFCUF7XdgIA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 21:05:33 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org,
	dxu@dxuuu.xyz
Subject: [PATCH 3/3] qga: test: Add tests for `merge-output` flag
Date: Thu, 23 Feb 2023 19:05:15 -0700
Message-Id: <2d68032724822784750df4edc4df0c578c878871.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677197937.git.dxu@dxuuu.xyz>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:43 -0500
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
 tests/unit/test-qga.c | 128 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 111 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 9d8e1d1cd3..0b3966024c 100644
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
@@ -777,21 +801,7 @@ static void test_qga_guest_exec(gconstpointer fix)
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
     exitcode = qdict_get_int(val, "exitcode");
@@ -802,6 +812,86 @@ static void test_qga_guest_exec(gconstpointer fix)
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
+
 static void test_qga_guest_exec_invalid(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
@@ -975,6 +1065,10 @@ int main(int argc, char **argv)
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


