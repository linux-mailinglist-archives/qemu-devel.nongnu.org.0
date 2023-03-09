Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28F6B3131
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 23:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paOwk-0002a2-7S; Thu, 09 Mar 2023 17:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwi-0002ZO-Ay
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:12 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwf-0003my-EK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE9FC5C019D;
 Thu,  9 Mar 2023 17:41:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 09 Mar 2023 17:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678401668; x=
 1678488068; bh=MCTKejwprUp8X263Wn8YvjYNgYFizbZ1OawyvOFQw7w=; b=g
 H7i1zuNKLilJ01A8tKxuCvsIBImlGMNn4iR59skrQhNo5kWDm+wrNm4dK/VECRAm
 Twgq5WEkLSVxNaiocmQeCX0Gg/pHjTKXwrmQ/RfUWwTD1GlwBT7VPVA8C+MRFU+j
 /uysA0ZK6ODU/lWI4ZIS9h6M+qDtC/3qiNK/tTDlcb5BBuaTg/aCEn3zjYzMnoA4
 BaisN3LOsBtyELkIwCtVYs/WE1dLT1ysFJjDPOhi2HK0tOanGwmqrhBAUcAkRKP3
 d8DCBbp/n0KhhPGpTJWUice9tFyNhV8aCQqv/M6IMb3j6SxVgck9VB6KZx2uYrJ3
 L5C3+1geU9YOrzy6NwUxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678401668; x=
 1678488068; bh=MCTKejwprUp8X263Wn8YvjYNgYFizbZ1OawyvOFQw7w=; b=n
 HFCH4g0FawXydy0BW0ljmV4UBrbSeNRpxxyz2dI1N8njvrya03xAioHzZmdDp37Q
 Q/G9m8Rvqdd8xZsc8+cqfYPo5LlPRLosyJ5o7h3I9WemLlcMFSPn4j1C44m1P8uA
 /dj+1QZW2G4OL3AQM32s6ZFJh3XBOqTNPLwneC2MYG5A//cPVIs514p8U+rfxHUp
 q088kHVhYTjdQL4cJMNiDyxkmKVAIAHRUkOgEAJ5pA6FcYzzS4qnvalamAadVFAS
 RXHaZCRqBpLxObfmCghpLPbT3PNcCBDGwcuyBQn6ko2BQs4THL06vMvy40ED2hHr
 tNyxllvyiDbcW7++zf9DA==
X-ME-Sender: <xms:hGAKZCk2dLPP1zlkhqGhbuaPwshaAp_kbLMQc8V57imCxVZBGqf1Ig>
 <xme:hGAKZJ0B5pSqiJ8D9hTVeDN_opbO-bT057Rw9N6YPQXswfTZj2no6aHHqsQn8rd-M
 pjSTvCKySmWFDomIg>
X-ME-Received: <xmr:hGAKZAoWfqVYjOcspt2-Tv8QHP_T1nNvH2Pd_y3FWCCWMKqw-5lIRoxd3KgVVM0qoSsLi0ydubNvj9czCLQYC0Wfg_SAvmOFYaCVGOryDfYulg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddujedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:hGAKZGnKlwDftIanNZlYq4_KAhL2yDJi2XED_w9cfdhdRMxgHX7IEA>
 <xmx:hGAKZA1Ji4NZaFuJsVGVrceR2o5lpuFKiXpL4nU5lFxrgaXeTmyZ1A>
 <xmx:hGAKZNtk0kTwNMrINbhTERfwvD9pDeuL_l_60ebBLpczsG6laLeYFA>
 <xmx:hGAKZNxqEgoeZfaXx_rXeXBeahYu3e5RrRqMToX9LvJvMog6UDVpMw>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 17:41:08 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] qga: Add `merged` variant to GuestExecCaptureOutputMode
Date: Thu,  9 Mar 2023 15:40:57 -0700
Message-Id: <c73263127c3533c9da06042a57bed2f334c5ea2e.1678401400.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678401400.git.dxu@dxuuu.xyz>
References: <cover.1678401400.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
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

Currently, any captured output (via `capture-output`) is segregated into
separate GuestExecStatus fields (`out-data` and `err-data`). This means
that downstream consumers have no way to reassemble the captured data
back into the original stream.

This is relevant for chatty and semi-interactive (ie. read only) CLI
tools.  Such tools may deliberately interleave stdout and stderr for
visual effect. If segregated, the output becomes harder to visually
understand.

This commit adds a new enum variant to the GuestExecCaptureOutputMode
qapi to merge the output streams such that consumers can have a pristine
view of the original command output.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 qga/commands.c       | 31 +++++++++++++++++++++++++++++--
 qga/qapi-schema.json |  4 +++-
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 01f68b45ab..c347d434ed 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -270,12 +270,26 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
     g_spawn_close_pid(pid);
 }
 
-/** Reset ignored signals back to default. */
 static void guest_exec_task_setup(gpointer data)
 {
 #if !defined(G_OS_WIN32)
+    bool has_merge = *(bool *)data;
     struct sigaction sigact;
 
+    if (has_merge) {
+        /*
+         * FIXME: When `GLIB_VERSION_MIN_REQUIRED` is bumped to 2.58+, use
+         * g_spawn_async_with_fds() to be portable on windows. The current
+         * logic does not work on windows b/c `GSpawnChildSetupFunc` is run
+         * inside the parent, not the child.
+         */
+        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
+            slog("dup2() failed to merge stderr into stdout: %s",
+                 strerror(errno));
+        }
+    }
+
+    /* Reset ignored signals back to default. */
     memset(&sigact, 0, sizeof(struct sigaction));
     sigact.sa_handler = SIG_DFL;
 
@@ -409,6 +423,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = false;
+    bool has_merge = false;
     GuestExecCaptureOutputMode output_mode;
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
@@ -445,13 +460,25 @@ GuestExec *qmp_guest_exec(const char *path,
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
         has_output = true;
         break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_MERGED:
+        has_output = true;
+        has_merge = true;
+        break;
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
         /* Silence warning; impossible branch */
         break;
     }
 
+#if defined(G_OS_WIN32)
+    /* FIXME: see comment in guest_exec_task_setup() */
+    if (has_merge) {
+        error_setg(errp, "merged unsupported on windows");
+        return NULL;
+    }
+#endif
+
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
+            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index d1e00a4234..b4782525ae 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1210,11 +1210,13 @@
 # @stderr: only capture stderr
 # @separated: capture both stdout and stderr, but separated into
 #             GuestExecStatus out-data and err-data, respectively
+# @merged: capture both stdout and stderr, but merge together
+#          into out-data. not effective on windows guests.
 #
 # Since: 8.0
 ##
  { 'enum': 'GuestExecCaptureOutputMode',
-   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
+   'data': [ 'none', 'stdout', 'stderr', 'separated', 'merged' ] }
 
 ##
 # @GuestExecCaptureOutput:
-- 
2.39.1


