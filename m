Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD326A15EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjL-00078n-7o; Thu, 23 Feb 2023 23:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSr-0001qh-En
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:38 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSo-0007Pj-7s
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:37 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 895855C019E;
 Thu, 23 Feb 2023 21:05:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 21:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677204333; x=1677290733; bh=dG
 UQpzCg8TTG1lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=DsNXUQ67in6N4Q9Pnb
 W2uEBU2zCc7A0SHSvlXP3Zt/mwnPNYOI2MbuDljmqxkPTJYoGi79ZJUt5xraXxNn
 yjWCyjpz33Nu1t26GUAusbHCQj0iLhVucwheZZFR8Vbh5g4UI60aWP9arSNhYZHF
 gP36jMcdOzmVqk7Quplf5xrT9hZq7qaQVqK0sgqzMVek71ivSCxoesMlRoYlNsbO
 SJ5EmPTYntpq18q1zXcVzotTbb2pPdyZ2ClwikMYKkRF9nQnAK/vFta90EiIAsqH
 BLq2D7wvUyzjufP4Qcj39Zy5bFc2i88Ew2tL8s34rIz3ZnK+clYpnh1KVaPjUcen
 y61A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677204333; x=1677290733; bh=dGUQpzCg8TTG1
 lYtYf7iL4BAdJ4WD0zj1nWU7lBFehI=; b=tlrYsgjf2NEexXJNEgQqJIdogRgDF
 QSDvk8wSkDAxb5zd03cwRhmJBco1Ew5xfN8dgja/65rl72tCIa8Dc9kgMfUDBPaH
 ovpHitijhDWrK13m7MjOwX1R8znJQvhftvduRBC5EaOZiQZVyynU3RQ68qBDVVeJ
 yYzs84QRiJfDcsB1iiGDZI2moddsPgSnU5/nuLJ+qlmG4ffAEY8EmKeep8vShh6v
 hhhVnbjjjTrLgxcOucYKBkf0Ev9ezO6EwbqDtHqRuyiTIryk+cEjPRmAAWiRDs05
 Q9Xoj1YW5wufKV4DBQLZg0bbV/uxQQxjd0T6OlFSnEVUfQjS7cYESVTCw==
X-ME-Sender: <xms:bRv4Y_jvm9TESPE-wcnNL02S2JXx9iPDJ0OPIZC5ke_9Y5HiJZHL1w>
 <xme:bRv4Y8AYlDACvrFja-MDyW0Tvjg3EYtZVRBg7khIdQGlZLxwwJGtPiWMrzAtdbHtU
 2MmDon-ltJ-rvM6BQ>
X-ME-Received: <xmr:bRv4Y_FhqwW6RSTWV55wHMS_u22y1bwL1mQp80USOVFo4zZrL4radS-2Tezv_9xtoYITVQ-huFfBmmmdyFj_VJss-kb_Nrye2EqxDCW8hXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceo
 ugiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgfefgfegjefhudeike
 dvueetffelieefuedvhfehjeeljeejkefgffeghfdttdetnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:bRv4Y8SlBvFNrT-stcdnW36m7oEbick7E82mqaMrzjfkngO_JS-WVg>
 <xmx:bRv4Y8xwtp335H4TFvXR3QuPqSOtjSxoByZMIoOMmKPtpYJgK_GOGA>
 <xmx:bRv4Yy7r-3QJ70jNETNOePUOb3JPxgjR1ajdnGbo0hVslOcVGwNFBA>
 <xmx:bRv4Y39L2mK7QbyYTaG03qUR-rV_1HZ5aqilZAsKEXUgkGFCtqcDTg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 21:05:32 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org,
	dxu@dxuuu.xyz
Subject: [PATCH 2/3] qga: Add optional `merge-output` flag to guest-exec qapi
Date: Thu, 23 Feb 2023 19:05:14 -0700
Message-Id: <6ed3091be8bc0ae8d3fee767b6e7400a8e32c493.1677197937.git.dxu@dxuuu.xyz>
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
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:45 -0500
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


