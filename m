Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501F6B159D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2bp-0001P7-St; Wed, 08 Mar 2023 17:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bn-0001MH-Q2
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:07 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bm-00084S-1q
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:07 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 967C65C0194;
 Wed,  8 Mar 2023 17:50:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 08 Mar 2023 17:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678315805; x=
 1678402205; bh=yoW8IBadWWrC4GNpMhxwRyCIfIwhj0PWxXVer2KZ6uU=; b=m
 Wand3FIZ05cFibGZhnFTqIO02Z6Urokeh7sXNI3aJGyyiQYBm2knBfRBMUULdZ7u
 LgSvVsJJL7yXx7oQHy/I3F9wEZu8ljZ6a396arh2jOj1Yzpt423NZc1y/cPWm7OL
 GI6eQNZgVszAWV/RLaUlVC1yPTXcC3ooCMBShb9V3oXzTTeyehyxE7zpls6jeQLB
 0T5nHNgNMzDTqGdjp+a+NDMjS1CGMR6jCp0qmT+RRPitTTlLL2Dxf3eVqqVKSFYG
 irqKcLUzMiQA/Xaay0WUwXZGN6pCzEHBYHVUdcqSovA73EfG2m7c4qKldTUtap4d
 Dg5S8xWgg+Wbmx3piwkfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678315805; x=
 1678402205; bh=yoW8IBadWWrC4GNpMhxwRyCIfIwhj0PWxXVer2KZ6uU=; b=G
 w5g/IZ/CBv2bfYUmiC4L+rLHFeCzM9MSwLRDvx7DymkPdp3Ixt3HdOIjNvpsReUa
 a7JJibt5lVGO2S41OSIGhucYdsY/K3MMmbinezwIAJmcXYYawK4NRHxEceoak+ka
 rpXRthYSnvnamIwIAN4zth7k3ME0UX70WYpdzFTwMLdIcA6EhK2Ai7iirKK9uDKY
 gCisHay+B+OYBJu90MUwI15Bx7E8NWMYp3SzJYDvimP9b0wyz41JktGaX7wf0gH7
 uMF8GxWPPOuzkSLSHEL3BC+SEyAZrNTiMKKPDwqIoNMTGJ/h2GFH1QKILWmOceQL
 6CKluuyzfjB+XdQeqdN0Q==
X-ME-Sender: <xms:HREJZD20Cmxns6wJkGgRCYtn0jJEo3InZ1lX7gcA_bBthCIaSWqmqA>
 <xme:HREJZCGor_SVu5-iOZBQLpwR9a66Efh8NAN_9ZYGW9AFcDaZEMrvYxZuC1rXZuL0q
 xJncw2Qc6LDgqJHlA>
X-ME-Received: <xmr:HREJZD6UpJPXz3rs5KEcXnNAdE4_Sj_X8NkuvFSXj59ZBLR9jXc_iJDkWTfmPaux4MnzJyPJC18yTvqFW60M5PXfpnmqfl_61sqWe9E27WXI4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvvefuff
 fkofgjfhgggfestdekredtredttdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihu
 segugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpefgfefggeejhfduieekvdeute
 ffleeifeeuvdfhheejleejjeekgfffgefhtddtteenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HREJZI0-TmzT-5caXoc3CPn2nUu7uopTAwJ0pOqO5AXYDOdJpxA49w>
 <xmx:HREJZGEUw5VcLSubkiTIbcAeyfqfa6XbldvbAvHLo8OGb6IQntJZyA>
 <xmx:HREJZJ9vsXAtyBikRO8-Oe7cOvtt11xRNpKcQrChpl-Dfa1BdqQHYA>
 <xmx:HREJZCCK1oNDHJRobhccIHDqy6wmWrKrUyN5nqYRqEMBzk7Hp3Nm5g>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 17:50:04 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] qga: Add `all-merge` variant to
 GuestExecCaptureOutputMode
Date: Wed,  8 Mar 2023 15:49:40 -0700
Message-Id: <a9d2c50550caf96531296d37ae219d825e480980.1678314204.git.dxu@dxuuu.xyz>
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
index 5504fc5b8c..7d458d0aca 100644
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
     case GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL:
         has_output = true;
         break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL_MERGE:
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
+        error_setg(errp, "all-merge unsupported on windows");
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
index 4ef585da5d..d364ab78de 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1209,11 +1209,13 @@
 # @stdout: only capture stdout
 # @stderr: only capture stderr
 # @all: capture both stdout and stderr
+# @all-merge: capture both stdout and stderr and merge together
+#             into stdout. not effective on windows guests.
 #
 # Since: 8.0
 ##
  { 'enum': 'GuestExecCaptureOutputMode',
-   'data': [ 'none', 'stdout', 'stderr', 'all' ] }
+   'data': [ 'none', 'stdout', 'stderr', 'all', 'all-merge' ] }
 
 ##
 # @GuestExecCaptureOutput:
-- 
2.39.1


