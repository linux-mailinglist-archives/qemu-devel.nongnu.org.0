Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BA6C5B53
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf8ga-0007iY-G7; Wed, 22 Mar 2023 20:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gI-0007dF-NF
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:52 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gG-0005fa-UW
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FEC55C016A;
 Wed, 22 Mar 2023 20:19:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Mar 2023 20:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679530788; x=
 1679617188; bh=EsWfeB8H0OpI9E8ri8JT0/6raJPZMclIjTMCoAentAw=; b=e
 BpgL6hQiaKgUDFpB77Qb6UsOO6J6Hn2dkmqUMb3xyj/k6C/KZl+R4KkWK6vVJTVW
 am+dk6RzzKS5oxIoeTyP/O7ImWk+Bw6WPsRParK+ypChTGV0E6ymb5iXOU1C6oY2
 kLQQbRcOsFcNVl5MYTCok0DPs0KWZj3fj7cpC9LlKBoe67q45YBpdVi2uEF9o4ws
 LonsLXzDlzZgHy9ocqrmYLibPWibb74xjMi4DzbH2YaRGGvM2KJcSaGS4RsmVu0a
 /n3sFFE4ISbYlkXZNjUjeQFWyn6CT1BZY/4Bjx6Tvi4KHSWIgA5sWVAqba1Vu3Ai
 telWNroSIHkXQ5UvCrTfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679530788; x=
 1679617188; bh=EsWfeB8H0OpI9E8ri8JT0/6raJPZMclIjTMCoAentAw=; b=Q
 qg3KEboNW3egnEC6FqZY2fSYE+COlkSEeTX3LaBUJgct2ys9Eb3Q3pcjf1+r/fqY
 XzrSRko0dalye2Orfc6wZBb+62G35p83R8nt1v/JtiYKiJpa/51BS/lFxStNMqeX
 zX5TYUmFmJBB9VAvF4cYXbWXi5ri9rkT2fQpkvUWz9vgsf4cz1KHKywXLvVlG94P
 Fx+XXr42q/IkkbYuQJ4aWW1NlLWd8Rb1mz2qQXBfLDYP2WRIQjjGJZGn8leug5NN
 onic2nwUnQLQ3rEG2glXuzRTGIUy/4qiX5XzrtwHnpmqF3FlUSg4OiOtC3qGg3su
 IfEyRV4iDTQruajnBYJMg==
X-ME-Sender: <xms:JJsbZOuMgrNVcqzoXGlgjBFekRI7PIUVgo-NbMsU9JRgwQYfAH0Krw>
 <xme:JJsbZDc-y7MNb2JxRwMVfkAx35Y0C2WpAt_XvH2FxJamzjp3tU9ATVzlmPH_PDtLg
 n4Wu8R5Yz-Lh3Ioag>
X-ME-Received: <xmr:JJsbZJw_gyvCJZkycoMqun0z3qg70HeY-76ZEk2c9syzRjEmFB0bVCCiXPzJz-RpehhOzcX79JAN14ZFctPvowD2WFb1ROPp7-mybybS-OltUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:JJsbZJOpu6KcG_8_miXdEn_9VCuoRuIoSnh_QHD5fTsceOYb5Ciz4w>
 <xmx:JJsbZO8JCe4QJUjr6faja0XENeAaDeE3bZ2ZSkE03cruTGQOV2f_MQ>
 <xmx:JJsbZBWRAGT1ODtxogL6I7-qhmFkfY0PGQCBaNgLLJUgd1p9YZpJvg>
 <xmx:JJsbZFYk4Cbpm0cb_-emZzuO6cudP2DYMMvvG1xmKPzpwII_BG4qAg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 20:19:47 -0400 (EDT)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v6 2/3] qga: Add `merged` variant to GuestExecCaptureOutputMode
Date: Wed, 22 Mar 2023 18:19:27 -0600
Message-Id: <9b355e4fe0574022459c0fd94ed30de3b7415011.1679530587.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1679530587.git.dxu@dxuuu.xyz>
References: <cover.1679530587.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
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
 qga/commands.c       | 25 +++++++++++++++++++++++--
 qga/qapi-schema.json |  5 ++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 01f68b45ab..09c683e263 100644
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
@@ -445,13 +460,19 @@ GuestExec *qmp_guest_exec(const char *path,
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
         has_output = true;
         break;
+#if !defined(G_OS_WIN32)
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_MERGED:
+        has_output = true;
+        has_merge = true;
+        break;
+#endif
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
         /* Silence warning; impossible branch */
         break;
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
+            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index d1e00a4234..39dd006d16 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1210,11 +1210,14 @@
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
+   'data': [ 'none', 'stdout', 'stderr', 'separated',
+             { 'name': 'merged', 'if': { 'not': 'CONFIG_WIN32' } } ] }
 
 ##
 # @GuestExecCaptureOutput:
-- 
2.39.1


