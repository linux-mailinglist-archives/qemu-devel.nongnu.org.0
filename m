Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F66A15E6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPj4-00074T-OG; Thu, 23 Feb 2023 23:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqU-0005Sx-TA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:54 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqS-0000Cm-6x
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:54 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 247075C01B2;
 Thu, 23 Feb 2023 19:21:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Feb 2023 19:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677198110; x=1677284510; bh=dG
 UQpzCg8TTG1lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=nfLVuNX4Z3kiu16zqz
 F5B4SXX/EfbKYnZcZvCn+8G1/n4gfxpeX9nPA5CSC7VjBa5HX/oxEOu2v/rvnW+9
 5jMhkoa7uxO5BAcnsi808weB7m9ZKTJhoVF7vX8kyvQwyBv5Ulqpl4ZDWHqdAu/G
 GXQPsWzivqYGsK9ulqZio5i+6WmyU/WXpk2PEXUKf8S8k8xEwpBRsZk/A5twuBeb
 oRvjmvSRCGiOswwVO49D3wdKR25//jOJzDOo95hTNh9fu6Ex+vWC2GQ4Axz3AOPY
 9a7ziSmYOZDpQykL0AxBrU0iN6T78UH8b7oTgmgZTCbDPKIBdEiTbrdJ20LQodAs
 rrBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677198110; x=1677284510; bh=dGUQpzCg8TTG1
 lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=CGzRvG51G4daVuoHzmJr+sPjKbKLx
 LK7BfI03+GvGCOMJ4xqMW+yLCEzq4weMTJsEWN7PbyPK/Z1iAL3YGEakm8mxpuix
 f6AtHaDFbQ4DVaQuLFlfagnHc77B282YX2VSuqggjnkSrOkJtN7JhebzvZXen8ON
 C0kqxm833iyAVRW7pwGTx7SBbMq+BuFL998kwDF+jQVTgEx9zuDLtCNpi07CWrl/
 2wjFXFCQoNdlwjiWZAxjHsXslqxXCOwk17yZSeYN5mB4gCV+96FfOUP20rxRoL0a
 GZLhU3yoVyDTMzo6KJ2eJg9CtQHOKUor1rNWb8tpCXXyu9L6N1tKa/Ysg==
X-ME-Sender: <xms:HQP4Y-_YLDkOYhoGSw4HSGs8lBTJ67DKl075DeqC_ZHE4BexNSJNpQ>
 <xme:HQP4Y-szSSmsNp6uNa1NK8DlERKzMC-Xb7yWi1eXaVJTv_GjWPoeNqv7rZsnGVCEc
 QFCmhlSe3UQfBeh7A>
X-ME-Received: <xmr:HQP4Y0CV1PaaJeyW4VQpOgtpO0aKh1lW-N13V_9kJzERzhUe40RpvHm5QIBPVw_G1HfmF3o-jph-BDvDDkT2Rfv91QZSdogQ4KcD_XJknbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqeenuc
 ggtffrrghtthgvrhhnpefgkeduleekhfetvefhgefgvdegfeejfefguedvuddthffggffh
 hedtueeuteefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HQP4Y2d4fnKU8yI68noWQZV72d-TyQDvicDvXZHIgJVtCS_QiIoLAg>
 <xmx:HQP4YzOSPe0VUqQPqV5dcjFum6RXbqzPXegEmoQEoABwaT8VEzBnaA>
 <xmx:HQP4Ywmue9YMsMZBcVd_eDniVjb-QducbnK_07LdEoEH0if_sVwxqA>
 <xmx:HgP4Y52JT8qSR3TWXrpmG9Jq6zMCDYMmE1YY3OJltVuto6AfVuwgsA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:21:49 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec qapi
Date: Thu, 23 Feb 2023 17:21:31 -0700
Message-Id: <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677197937.git.dxu@dxuuu.xyz>
References: <cover.1677197937.git.dxu@dxuuu.xyz>
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
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:25 -0500
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
 qga/commands.c       | 13 ++++++++++++-
 qga/qapi-schema.json |  6 +++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 360077364e..14b970e768 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -274,6 +274,15 @@ static void guest_exec_child_watch(GPid pid, gint status, gpointer data)
 /** Reset ignored signals back to default. */
 static void guest_exec_task_setup(gpointer data)
 {
+    bool has_merge = *(bool *)data;
+
+    if (has_merge) {
+        if (dup2(STDOUT_FILENO, STDERR_FILENO) != 0) {
+            slog("dup2() failed to merge stderr into stdout: %s",
+                 strerror(errno));
+        }
+    }
+
 #if !defined(G_OS_WIN32)
     struct sigaction sigact;
 
@@ -385,6 +394,7 @@ GuestExec *qmp_guest_exec(const char *path,
                        bool has_env, strList *env,
                        const char *input_data,
                        bool has_capture_output, bool capture_output,
+                       bool has_merge_output, bool merge_output,
                        Error **errp)
 {
     GPid pid;
@@ -398,6 +408,7 @@ GuestExec *qmp_guest_exec(const char *path,
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
     bool has_output = (has_capture_output && capture_output);
+    bool has_merge = (has_merge_output && merge_output);
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
@@ -421,7 +432,7 @@ GuestExec *qmp_guest_exec(const char *path,
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
-            guest_exec_task_setup, NULL, &pid, input_data ? &in_fd : NULL,
+            guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
         error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 796434ed34..4192fcc5a4 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1211,6 +1211,9 @@
 # @input-data: data to be passed to process stdin (base64 encoded)
 # @capture-output: bool flag to enable capture of
 #                  stdout/stderr of running process. defaults to false.
+# @merge-output: bool flag to merge stdout/stderr of running process
+#                into stdout. only effective if used with @capture-output.
+#                defaults to false.
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


