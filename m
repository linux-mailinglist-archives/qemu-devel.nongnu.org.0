Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899946C5B50
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:20:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf8gZ-0007eK-BU; Wed, 22 Mar 2023 20:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gH-0007dE-TB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:51 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gG-0005fW-4y
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B3D7B5C00E9;
 Wed, 22 Mar 2023 20:19:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Mar 2023 20:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1679530787; x=1679617187; bh=O86jAUROcuMAf5eThlp+O6BhkjqpUq6KDyY
 eULVJdb4=; b=ZzVegQd8uRfM9rc+4xjwN/biV9GS3n8rU2BkiD/3Fu4W6RmZw+e
 GNPeD1fjLwuio6BJwbfQdP74K+L2IZsLJefkpPz1F97Xt+HvQE0DHFyN2Otg3e3e
 DfKPs8op9aZ1ZtS74tIUOi6NX65MU/aqcMQyYPO9h853QLIg81+46XF7RmpLAR3P
 aR8NAmsxzVPLdpPbvD9LQehE80igYr+ZpCUaT7y+bcGJCJI7BPPWRtewATrp7WCp
 89+euEg43H+RpY4Yjlq3Y0J0isZ2vpfcvzhoEv6e9mxFs4XjaBRMGxlC5cq2diPk
 JnOFr+USl3wbInMHMur0lbCfz3EnJU2uBBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679530787; x=1679617187; bh=O86jAUROcuMAf5eThlp+O6BhkjqpUq6KDyY
 eULVJdb4=; b=g6tYeJfmfJm9v5ftxzYIjH1K7LLPLoCCjZ4Hlt0r/5f1vIeu8eJ
 qpP4RfTbEa6vv7t00Tbw0i8ZGbou1iDqgw6/694MTEDA1CU/tDMMMEhTO3fwzxAo
 OkFnN/sXOFlFMzHsDqt0Uc1NIiByA0zjcrAfOpRgZFVrlwMGDvI78a8kICxaBHOJ
 hBglFRyiPaHSlRpV8mj2Uyaoq2CwAOahH6OiVEziWkkkA1t+++v16Z7fC4yXzUdF
 fQvJsrULichWqu4+y/VurIoMWuMDPU3Di2vEEgQNwXY9LrVGB+/HS4bFOvr6djcO
 82nWnEKlpR2bK/BG8CqJ1TZUR63XVxIKdwg==
X-ME-Sender: <xms:I5sbZB4stjRI0fiNwlp2Dc4-XcKpkZDruazMKI-Rj5KbRmw_CU8CzQ>
 <xme:I5sbZO7Y0RTEC56DYHNCgd5aO_D056bNTaH31LU4VCt222anMIidMSYFCmBomOHC0
 zR0UIG6dEBd0kkrSg>
X-ME-Received: <xmr:I5sbZIeJB72BqV4v6t-JfGUzpfiaRP2CT_IOuA2T2-ucLD6ZIgbdQ_T5pFMIb1OinNZUo2hcc4zPd1fhlpnTY1t_eKzh2kNHK_Sw33eH9aVE_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefhvf
 evufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepffgrnhhivghlucgiuhcu
 oegugihusegugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpeetheekkefggfeive
 dvtefgleeiffdtleegfeeuledvuddtvdduhfekgfdutdevkeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:I5sbZKJEHGHbrvOr8mu08V7TOrxQZFKSjYf-s94_kCQFXZHNxiP2_w>
 <xmx:I5sbZFKJTrxwdHdJf-dKsg28qLWN1qXsdEZX_s_P-NdKwT5JNWWlYw>
 <xmx:I5sbZDzATvFSVtege2nI4RNt2RUg56HOIQAKwYuMgGEOT65gTY6IbA>
 <xmx:I5sbZF1x4PbvwXX0Ex2bo1kZh2113o-NeGA3BakRjT_W1ZlkfsRpYA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 20:19:46 -0400 (EDT)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v6 1/3] qga: Refactor guest-exec capture-output to take enum
Date: Wed, 22 Mar 2023 18:19:26 -0600
Message-Id: <f769587a9c59bea530247a7e1bb5b2e361cfe580.1679530587.git.dxu@dxuuu.xyz>
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

Previously capture-output was an optional boolean flag that either
captured all output or captured none. While this is OK in most cases, it
lacks flexibility for more advanced capture cases, such as wanting to
only capture stdout.

This commits refactors guest-exec qapi to take an enum for capture mode
instead while preserving backwards compatibility.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 qga/commands.c       | 37 ++++++++++++++++++++++++++++++++++---
 qga/qapi-schema.json | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 172826f8f8..01f68b45ab 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -379,11 +379,23 @@ close:
     return false;
 }
 
+static GuestExecCaptureOutputMode ga_parse_capture_output(
+        GuestExecCaptureOutput *capture_output)
+{
+    if (!capture_output)
+        return GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
+    else if (capture_output->type == QTYPE_QBOOL)
+        return capture_output->u.flag ? GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED
+                                      : GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE;
+    else
+        return capture_output->u.mode;
+}
+
 GuestExec *qmp_guest_exec(const char *path,
                        bool has_arg, strList *arg,
                        bool has_env, strList *env,
                        const char *input_data,
-                       bool has_capture_output, bool capture_output,
+                       GuestExecCaptureOutput *capture_output,
                        Error **errp)
 {
     GPid pid;
@@ -396,7 +408,8 @@ GuestExec *qmp_guest_exec(const char *path,
     gint in_fd, out_fd, err_fd;
     GIOChannel *in_ch, *out_ch, *err_ch;
     GSpawnFlags flags;
-    bool has_output = (has_capture_output && capture_output);
+    bool has_output = false;
+    GuestExecCaptureOutputMode output_mode;
     g_autofree uint8_t *input = NULL;
     size_t ninput = 0;
 
@@ -415,8 +428,26 @@ GuestExec *qmp_guest_exec(const char *path,
 
     flags = G_SPAWN_SEARCH_PATH | G_SPAWN_DO_NOT_REAP_CHILD |
         G_SPAWN_SEARCH_PATH_FROM_ENVP;
-    if (!has_output) {
+
+    output_mode = ga_parse_capture_output(capture_output);
+    switch (output_mode) {
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_NONE:
         flags |= G_SPAWN_STDOUT_TO_DEV_NULL | G_SPAWN_STDERR_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDOUT:
+        has_output = true;
+        flags |= G_SPAWN_STDERR_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_STDERR:
+        has_output = true;
+        flags |= G_SPAWN_STDOUT_TO_DEV_NULL;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_SEPARATED:
+        has_output = true;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
+        /* Silence warning; impossible branch */
+        break;
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 796434ed34..d1e00a4234 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1200,6 +1200,37 @@
 { 'struct': 'GuestExec',
   'data': { 'pid': 'int'} }
 
+##
+# @GuestExecCaptureOutputMode:
+#
+# An enumeration of guest-exec capture modes.
+#
+# @none: do not capture any output
+# @stdout: only capture stdout
+# @stderr: only capture stderr
+# @separated: capture both stdout and stderr, but separated into
+#             GuestExecStatus out-data and err-data, respectively
+#
+# Since: 8.0
+##
+ { 'enum': 'GuestExecCaptureOutputMode',
+   'data': [ 'none', 'stdout', 'stderr', 'separated' ] }
+
+##
+# @GuestExecCaptureOutput:
+#
+# Controls what guest-exec output gets captures.
+#
+# @flag: captures both stdout and stderr if true. Equivalent
+#        to GuestExecCaptureOutputMode::all. (since 2.5)
+# @mode: capture mode; preferred interface
+#
+# Since: 8.0
+##
+ { 'alternate': 'GuestExecCaptureOutput',
+   'data': { 'flag': 'bool',
+             'mode': 'GuestExecCaptureOutputMode'} }
+
 ##
 # @guest-exec:
 #
@@ -1218,7 +1249,7 @@
 ##
 { 'command': 'guest-exec',
   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
-               '*input-data': 'str', '*capture-output': 'bool' },
+               '*input-data': 'str', '*capture-output': 'GuestExecCaptureOutput' },
   'returns': 'GuestExec' }
 
 
-- 
2.39.1


