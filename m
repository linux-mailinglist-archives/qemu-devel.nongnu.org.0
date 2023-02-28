Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B46A60B1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6te-0000ug-B1; Tue, 28 Feb 2023 15:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6ta-0000tU-HG
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:22 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tY-0006Zm-2H
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:22 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 962AF5C01F5;
 Tue, 28 Feb 2023 15:48:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 28 Feb 2023 15:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677617299; x=1677703699; bh=6h
 6xHiz+RMWsiNN43+3teHwnGSIws54LO/VhKcbgmS0=; b=tNtiYcWSdhkAaAcuTR
 GxqeVfcDmCnG3PP2uZmp5xgeG1Kdyvw8MWt3WkJCorvKKlE4u6gXhJFQZYhu/q5F
 LHAgKGafGhIMQ2JtkkojFmraXktmyHdEyeAzZlj1ohgacArZDhW1qKvCnUDOUTvZ
 YtdlzuRxjCUn9bfBMz2Z5k34ntotpXojwWrS9LjbVU6sCNVKm/Mhro5s0jSEnvc0
 OX1eYzFJ3hi5QTtPw202aUIGabnJC2f26tcJnj/Swi4STFqgIg+f/sqSNVuFp+NM
 DLco0Wk/bb/hgfUEwymhjj1D/g/vUkE61NsiZzXUdhYGTurBzllhM5/nmGYiPYdh
 AaLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677617299; x=1677703699; bh=6h6xHiz+RMWsi
 NN43+3teHwnGSIws54LO/VhKcbgmS0=; b=UqFQJ3nxYPnoMw+8pacijka4Bt6+S
 L3N7F5JHwyCd17lPDTbj6o8reMk0y8xQyTSKp9SK7/+7oWIoIIYFSxF3brJWKuvV
 q+w0+EK+o9jkJodXXvGu/EnDA9DXQKOzLkSVvqu/X1k81I5OQ9uMlrhbvbaCA2KR
 imzEXT0hcIae4CoRqzkNLMAE8Nijc9t58pcG2+ouDH8i2vbhFV2tzHqgIqbcX5Xv
 EA43Ak9USq+N323Aiaxb7XX7EaOJz8qKN8hsghlklIPOzmReHaXyLmWmz+Pk6YRe
 dc0oesR6GSZeMOujo1DLK3ADljAFfJuX8xoRNcuabrfksuBR14eRIuq7Q==
X-ME-Sender: <xms:k2j-YxGuiNZ-3K4tF8Ea2oleEH_PvBoS-n6hrPMmBS0XFoPqTT2glw>
 <xme:k2j-Y2V_N6KIogrkVDsHsNSWwZWZ-UyAVV-Qs9cwijySUKMrhd3ZBo8fRmP9AISQl
 8B9hqxu7eVQ5PszIQ>
X-ME-Received: <xmr:k2j-YzJUkuyW5B2xNAs9VXo1Bp5bzKp6-qoVD682kbpICvEwKz-cmCTVcG6EIK7tUbgqxYD-9O2mNDZ1OZDKU0moqLHAPt6c8luUycJ-7lJYaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:k2j-Y3Ex7nChsi17uV94o5sjXINO_Bq27s3gnsrgqnHDtNVFM2z9-A>
 <xmx:k2j-Y3VXRuSa4cnT39ZsEB92pCHAmpZERqfLrVAG4dIdK88T7H5Seg>
 <xmx:k2j-YyP3SPv-XDtmGauU7Xi_F740Om1Mz-hj3cgKQsGknW5BSTXMeQ>
 <xmx:k2j-Y0j-FilWQ7035uPNtx8RKTJZ8XgpTVpgXgfKlQYsx7T4vBFzRA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:48:19 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com,
	marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] qga: Add optional `merge-output` flag to guest-exec
 qapi
Date: Tue, 28 Feb 2023 13:48:03 -0700
Message-Id: <1575b08b853385eeaec6159b88b8c66525baec65.1677617035.git.dxu@dxuuu.xyz>
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

Currently, the captured output (via `capture-output`) is segregated into
separate GuestExecStatus fields (`out-data` and `err-data`). This means
that downstream consumers have no way to reassemble the captured data
back into the original stream.

This is relevant for chatty and semi-interactive (ie. read only) CLI
tools.  Such tools may deliberately interleave stdout and stderr for
visual effect. If segregated, the output becomes harder to visually
understand.

This commit adds a new optional flag to the guest-exec qapi to merge the
output streams such that consumers can have a pristine view of the
original command output.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 qga/commands.c       | 28 ++++++++++++++++++++++++++--
 qga/qapi-schema.json |  6 +++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 172826f8f8..cfce13d034 100644
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
 
@@ -384,6 +398,7 @@ GuestExec *qmp_guest_exec(const char *path,
                        bool has_env, strList *env,
                        const char *input_data,
                        bool has_capture_output, bool capture_output,
+                       bool has_merge_output, bool merge_output,
                        Error **errp)
 {
     GPid pid;
@@ -397,6 +412,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = (has_capture_output && capture_output);
+    bool has_merge = (has_merge_output && merge_output);
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
@@ -410,6 +426,14 @@ GuestExec *qmp_guest_exec(const char *path,
         }
     }
 
+#if defined(G_OS_WIN32)
+    /* FIXME: see comment in guest_exec_task_setup() */
+    if (has_merge) {
+        error_setg(errp, "merge-output unsupported on windows");
+        return NULL;
+    }
+#endif
+
     argv = guest_exec_get_args(&arglist, true);
     envp = has_env ? guest_exec_get_args(env, false) : NULL;
 
@@ -420,7 +444,7 @@ GuestExec *qmp_guest_exec(const char *path,
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
+            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 796434ed34..9c2367acdf 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1211,6 +1211,9 @@
 # @input-data: data to be passed to process stdin (base64 encoded)
 # @capture-output: bool flag to enable capture of
 #                  stdout/stderr of running process. defaults to false.
+# @merge-output: bool flag to merge stdout/stderr of running process
+#                into stdout. only effective if used with @capture-output.
+#                not effective on windows guests. defaults to false. (since 8.0)
 #
 # Returns: PID on success.
 #
@@ -1218,7 +1221,8 @@
 ##
 { 'command': 'guest-exec',
   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
-               '*input-data': 'str', '*capture-output': 'bool' },
+               '*input-data': 'str', '*capture-output': 'bool',
+               '*merge-output': 'bool' },
   'returns': 'GuestExec' }
 
 
-- 
2.39.1


