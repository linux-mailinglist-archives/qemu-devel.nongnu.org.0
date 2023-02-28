Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D696A5F08
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX54J-0006oN-6e; Tue, 28 Feb 2023 13:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX54D-0006mF-MY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:14 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX54B-00071D-1n
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:51:12 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 97AE35C0071;
 Tue, 28 Feb 2023 13:51:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 28 Feb 2023 13:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677610270; x=1677696670; bh=De
 orb2Ky87bZWhMlXAeaO6j5gbitnxMii99qAMinGqU=; b=N8GD97VOY58jWFxuHf
 81WgCTCICDguSBoDV9zkmJT/2suYa4rJLwuMeQfGtJXWjdq6APc/NFTvdD9H4RH5
 lAiO3HCD+oMptMCt5I66pI2w7jxo/Vttjymwsz7HFW0FmlCuaXEz7VR1GQe8L6Nl
 waZo3WhQfdqS1U9VG52HU/ehGqJzf3JV2T/Vs5ZEBPp3Z4AE1a4HlPGxQ0bw/nYr
 /P3YVQUyhEAIP6ZFJgvdcqz3jfLodT+dncydlyzKT+5rnFDSsbiKZV4C+T+ECDYW
 JsfebRY3XS2qfZQsMKaERth7k1I6YeTkJknC0lGll4GrV7bhGO5l6YCTExlOOgj5
 aKGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677610270; x=1677696670; bh=Deorb2Ky87bZW
 hMlXAeaO6j5gbitnxMii99qAMinGqU=; b=pQwBZlsAfRVS7z/CF/sRHTFVX0eQ+
 2garmF3rcGPImwrkSsOnUATF9CF+lsUt/nUSsd/C9TZip8n7Rf7U3Hmvwc9+w5we
 hnhmfiLlSVfNVC5aTZCk7lJn9Bek/3ZQCoyPpA1f3A8omYSAuAN1526nQ0alnfp/
 ZhiTYi44N1qvLGa8YpXELuhtFKFT+jtLYaAXIgZBTl+TS4wbSVI+7JTcYdprrjyO
 hmB7w4DSjsA44G6Lov+6NofxejjReLBMwXmYlkprJWXa/NsR5MBoUoetT293vy+A
 LCMMhGVmZ1pkKtUd38/avJePfAmwkrRO7W3n1TITUYWMK6z14PM9vGadw==
X-ME-Sender: <xms:Hk3-YwjZ2jWsf5hHIkffqHxIK57CBPia7vS3VXak5-9V-Uv5evRStQ>
 <xme:Hk3-Y5C0gdjcX4kfZ8U8sEvHzexWVTPe5Qh0lx-7EirRs5JJ3jeFDhxbJulFqYFwj
 s5DUlPlCKy4jPUD-g>
X-ME-Received: <xmr:Hk3-Y4GZkwPzlzf141zyM6zFkkt9C_F4_Zv4Vg5gM2rPBbFb6oL3J7y0QQx16uDZz8M1pmeQubBDhHYwTlkEAHWnnlB9lqv_kSXeKrtvWaqR3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:Hk3-YxSukceP9hA-81zVf003sNJVDfCycQfHeKG3ycTsn4aL5cJzKw>
 <xmx:Hk3-Y9zaIOqa4mHK5yGtCCP0Z-K2qhQe65IRWWq6DypJ3N3KaAK8Pw>
 <xmx:Hk3-Y_5zVUCllMj1W-Ardfzqg3ZuFN3TXIas6dMtuT1AqgRTzxs6Cw>
 <xmx:Hk3-Y4_nwZiFpjzblUHrO05i8WlyFq8Dmr-zN5qO957jYV-AtX5QHA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 13:51:09 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com,
	michael.roth@amd.com,
	marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] qga: Add optional `merge-output` flag to guest-exec
 qapi
Date: Tue, 28 Feb 2023 11:50:35 -0700
Message-Id: <e4a6d274d554479c665de82b3627f1df2055306a.1677609866.git.dxu@dxuuu.xyz>
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
 qga/commands.c       | 14 ++++++++++++--
 qga/qapi-schema.json |  6 +++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 172826f8f8..e13a8e86df 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -270,12 +270,20 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
     g_spawn_close_pid(pid);
 }
 
-/** Reset ignored signals back to default. */
 static void guest_exec_task_setup(gpointer data)
 {
 #if !defined(G_OS_WIN32)
+    bool has_merge = *(bool *)data;
     struct sigaction sigact;
 
+    if (has_merge) {
+        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
+            slog("dup2() failed to merge stderr into stdout: %s",
+                 strerror(errno));
+        }
+    }
+
+    /* Reset ignored signals back to default. */
     memset(&sigact, 0, sizeof(struct sigaction));
     sigact.sa_handler = SIG_DFL;
 
@@ -384,6 +392,7 @@ GuestExec *qmp_guest_exec(const char *path,
                        bool has_env, strList *env,
                        const char *input_data,
                        bool has_capture_output, bool capture_output,
+                       bool has_merge_output, bool merge_output,
                        Error **errp)
 {
     GPid pid;
@@ -397,6 +406,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = (has_capture_output && capture_output);
+    bool has_merge = (has_merge_output && merge_output);
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
@@ -420,7 +430,7 @@ GuestExec *qmp_guest_exec(const char *path,
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


