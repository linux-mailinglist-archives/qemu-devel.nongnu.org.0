Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC56A15E4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjF-00076s-F1; Thu, 23 Feb 2023 23:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3E-00067k-8S
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:04 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3C-0003mV-1a
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:03 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AC36B5C00CC;
 Thu, 23 Feb 2023 19:35:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 23 Feb 2023 19:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677198900; x=1677285300; bh=dG
 UQpzCg8TTG1lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=oZznB0RegUDsuGilGU
 dEgNDAV5VSfW51dXzGonYGqP6iMiQpk6ZMKStK4XsNr53OH5aTuw0adCFaEAc9fV
 ASujD6i4YPE6u6cBKefxSD+B12I1aRFAJpjJScHfb9v8FYC5aDXzo6nInw22ZIvj
 fDygiyX1bbCN96W2KTg3ph1L+nBC9DWYBXn+Q0ucSFMRruAsVV5PdNQjnau46x4P
 pzTKCTbbzR07M4sDWnHA8oCvNoWzYLjSUX/ln0BhIspE+r9/HmSEj30DHPds53S9
 eXNGmp8OFtNimOUy7anpzdk3vJp2VGmLgMa5b70ktbQN8pifKcuHecGYWhaoljjl
 qV4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677198900; x=1677285300; bh=dGUQpzCg8TTG1
 lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=hSWeU89Pt5/KrpZjN94YV7qCBn9N/
 UG+aOXMuLT5NLu4snfmzleMiXiqnqRkAz2grwlmnLU6ffnhhey0FPcdj9SqUD1IA
 ySZNlAXYiuz362q43rVJxmAvJwK0KLSPKpGHmCOmoywgRLJ5nkY46BvrBsFGImFC
 qpONSYtYsc7s/M70QkDOhTbXXbSCLbovCId+fgeXDlFqyVACFA4b1361KWiyWLH5
 7+TceqjJ8gztTaajFeriFbNbFy8+3kL4cApI7B5+KfL8Ui5lg73GpkG23/ZD65h0
 oOaa1HPQEizTBcUYGAmgFDcNRwJ4H7hIblliG4GcdswfICgwdixTiuv1g==
X-ME-Sender: <xms:NAb4YwrE9SWVKB6n3hwgPNbIJWQN0s_1BLtEJG2nuuGVzjYs54FhkA>
 <xme:NAb4Y2qQ86QbtFieYJla2aPM66MlzDzzlPd24gZt8fdQmOWz36SZ-9kJTWdBBUTmb
 JtGFbMpqeFgVUnVgA>
X-ME-Received: <xmr:NAb4Y1MRjBQmQg9V4k1yQ7wFKR1TB7Hq0PbcB1JozOeHXhcUsFZLnDs1Eyc5WrT20Xs3OHrTs3JBgpMaQyBvYKJoofJAs5sm_Wy1FON02o4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:NAb4Y35em85qzszOwAgNm41yFuPHB8vTI6nhUbglQ0Mrlpty4k3p6Q>
 <xmx:NAb4Y_4zeCu3Knvxz1kIFcDw5PIXYLh5wDY0uEYz926p2wY1-hGWjw>
 <xmx:NAb4Y3jz8jNyRMDM4DMnmbbSg0kmNCjR7lKv3QUXUIOQBmrEK9XCVw>
 <xmx:NAb4Y5R7RCeGP87OagWGTElav7XRFwB_9NTeqnDgloV9GB0EWhbjNg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:35:00 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec qapi
Date: Thu, 23 Feb 2023 17:34:34 -0700
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
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:38 -0500
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


