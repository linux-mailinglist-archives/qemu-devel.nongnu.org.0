Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977966C5B4F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf8gb-0007iz-3B; Wed, 22 Mar 2023 20:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gJ-0007dI-Pc
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:54 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gH-0005ff-MK
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:51 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E6F45C00E8;
 Wed, 22 Mar 2023 20:19:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Mar 2023 20:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1679530789; x=1679617189; bh=IGHLqqNiDmgU13SjSAGFc98CRdKinjQJXaq
 NCCC9s+k=; b=t39AkN5Ec44Ohz42HY9zTvkS4TAZU8fDTPF/WaGgFeDZr6ASLMm
 nTo92c9fl7LZvsXSlGSFki542TccdprIums7LLrvYSNSFneChb/4O2ocr3tnHKQh
 C0b18yXa8XyRmZ7x6pwhDJvmD8wgEU9/wEU697BrPP5howVjKaRKsIOJKxzChNMY
 dzWSwS4Lj0iIjfBhRtkSClwLpf5RG9Xq18zRhwiJZ+vgjfuYyXWn43tzD91kCg2s
 D3NTV78OtBUvCLa5+KPGEiU75r3ymsId9ZSbzVLRU7Y+UBp7lUpL/j8GAyI1ss8t
 o+X0y3Pevvghfv0RpoHWw/SNqg1ygew4p3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679530789; x=1679617189; bh=IGHLqqNiDmgU13SjSAGFc98CRdKinjQJXaq
 NCCC9s+k=; b=AjQD1fUt4bGYxSiwyepfxs2Q3eOAJBP3K3Jlgok+k/6fmMH80pV
 V4y39P2CrmocTZ+xGHJ5suC5EuwsusovZyM3t3MthPVW1b7Xj2MRaoGoY+ubVTB3
 1ipchKZLKzmoJxO8jZ8ZIW4DoNh7Td8LGGOiVGOMFQx9ZiCfxkjdKvxoakfpgEPL
 JCW6VEmswrynO48Hhb5c5xzgcguXcuplhOVFQ465qkLEeVrdcys9CwXvaPfoRq9B
 ic1PUZzDDIDsesjYSX4VU4cVpMp2rpUQUfTeP2wZdD13bL0ZRM41rriGX/aldbj7
 ejMDFVVQnqJSDysda7/du01VtHPCODuoRJQ==
X-ME-Sender: <xms:JZsbZOUI61pd8YY90up1s5a8ZqM9qmnfGy_Rd311RqLwhxxQ6XIxGg>
 <xme:JZsbZKmjIvFnJAgjSvq-Ox2EgvjaZToqtcCRcxyRLblYk1Sh1roCVlcvc0daSO-K_
 Ubyj_UbiriAwb9G5w>
X-ME-Received: <xmr:JZsbZCbd9S_WKpVcTwPd2tbMQzcjrjNGQlzmlLtEL_A8cjLvHsXGLcSEudJYxpc3ur0LbjMEwUvaujYnaQ_-XsTPmm5sMi8UvwdRVnTR2utuFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvf
 evufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgrnhhivghlucgiuhcu
 oegugihusegugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpeetheekkefggfeive
 dvtefgleeiffdtleegfeeuledvuddtvdduhfekgfdutdevkeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:JZsbZFW5SmiKb1THf2LCBaEdPg1vOGu9dWYLQKazngqaEF9o6DTvtA>
 <xmx:JZsbZIkL81bXM20yLYLGEDSRZ9iFDXhO5tRJFbXl5SmLvAbtahuIBA>
 <xmx:JZsbZKebC1NQPbYfCMtshttZ40uH9XVPBjR5QNo8S81X5Iqvv5_dLQ>
 <xmx:JZsbZCgv9wf-UOdqhTDEkbAYSlbfrs2XBuQoMsJ7UNqjGl-O4BJbmA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 20:19:48 -0400 (EDT)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v6 3/3] qga: test: Add tests for `merged` flag
Date: Wed, 22 Mar 2023 18:19:28 -0600
Message-Id: <dba89f7d0f7fab8b5d65a34f068f6742ceaf6e98.1679530587.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1679530587.git.dxu@dxuuu.xyz>
References: <cover.1679530587.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=dxu@dxuuu.xyz;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

This commit adds a test to ensure `merged` functions as expected.
We also add a negative test to ensure we haven't regressed previous
functionality.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 tests/unit/test-qga.c | 158 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 141 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b4e0a14573..360b4cab23 100644
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
+static void test_qga_guest_exec_separated(gconstpointer fix)
+{
+}
+static void test_qga_guest_exec_merged(gconstpointer fix)
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
+                 " 'capture-output': 'merged' } }");
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
+static void test_qga_guest_exec_separated(gconstpointer fix)
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
+                 " 'capture-output': 'separated' } }");
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
+static void test_qga_guest_exec_merged(gconstpointer fix)
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
+                 " 'capture-output': 'merged' } }");
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
+    g_test_add_data_func("/qga/guest-exec-separated", &fix,
+                         test_qga_guest_exec_separated);
+    g_test_add_data_func("/qga/guest-exec-merged", &fix,
+                         test_qga_guest_exec_merged);
     g_test_add_data_func("/qga/guest-exec-invalid", &fix,
                          test_qga_guest_exec_invalid);
     g_test_add_data_func("/qga/guest-get-osinfo", &fix,
-- 
2.39.1


