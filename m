Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D596B3133
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 23:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paOwl-0002ae-W6; Thu, 09 Mar 2023 17:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwi-0002ZN-Dt
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:12 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1paOwe-0003ms-Iw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 17:41:12 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 17D355C019C;
 Thu,  9 Mar 2023 17:41:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 09 Mar 2023 17:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1678401668; x=1678488068; bh=911bRxRHfZhJbhh0SFAD0XuN3d4jdEvPV0L
 FIHE2YVc=; b=oW01ICI8YO2wwJOGsq0fE1C/tt/HR4G4ZmG/iddexJmGItpYALF
 LokIuNJSE0096sVEucUgg2EzHVWsEII21vyR6i9nBAGHEBEfdihHJ5o/qHMQoSqI
 WtXxd3cV7j41uP4aHmHxxrlTD07UvkUnB2wN+Hs35kvJuEgP00ezYCUcB7BnaUKi
 MLZgO1PObnENtiPgw4WuctXwPPZJyqB0qIbd+I6FYqTOzdOf2V4E1+mZ4gnUFA4y
 Q/P9D84pg+TVCa5VXxOqD6SL3Nseld+BMJAKsbafBz4E5ie56u5bg+jRE8TXOv/W
 zGMfO8gR4Zk0Up1Uw+TgN/yraYca3cqbTsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678401668; x=1678488068; bh=911bRxRHfZhJbhh0SFAD0XuN3d4jdEvPV0L
 FIHE2YVc=; b=SzIPkT5g8ZkCyhZPvptfPVMFLH44kAIpm9NrE0N7SO5esXSlE17
 w7qYXVXOA0gFxCh+bUqwaufxsTwjPqb8yocfme574IWdrn4Bs7XPRLq165AjuHA4
 /02HU5cJgpCn3GG919nJKJtQUCjlM7Aa4DlLnmiDG1FGo0G2/49Uq5fSsudA+dxi
 qUsR5cmdzOI4DyEWQNQQ8Ss+v5jgeJ+92rrssZqSXxZzdZlAPRcvC48CyAco3K4B
 aXibJSAbKhAuoqB0wKh6YLhVk1oCd4JMGDEtsDY8GjDZTc+FlMfmUTO/vJMo2+hr
 5E8y7pe8Nwtro0k1K6Ba88UQ1qmR52WmWBQ==
X-ME-Sender: <xms:g2AKZGTO64Y6TozIc9XbRL-U9ePn-8wtqe_WLVirdCR7V2wIGa_0Zg>
 <xme:g2AKZLzU-pFfzKbBf5jD7IkT30oniJaDeBC5MCF_vvp7yZ2X6BeFaICGrPpRN74ej
 lWNiqKrRUE5aLj2IQ>
X-ME-Received: <xmr:g2AKZD3UnZ9MKsYHpSLL5btgckDnNTCzzETdsuoHOaF_sS6qxr2yCZrd_SMCWkyx554ug4E3OtM9OkYNL99fjf5Ilv_IGd1CDEsGj-DcsHu6Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduiedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhephf
 fvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighu
 uceougiguhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepteehkeekgffgie
 evvdetgfeliefftdelgeefueelvddutddvudfhkefguddtveeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:g2AKZCCYAZY9_C6R-2AW-REr-BMSI2woJT2VcHPlrf7Wkwz5VcCQtg>
 <xmx:g2AKZPhJHocPvCF_zewPcB3TPwqCy24QREmtxTjtATN9NB8br7kx8g>
 <xmx:g2AKZOrq4H8TG1vo0evGkEcRQIGJ4On6RdDblKZ4xTKztCjuhQC4_w>
 <xmx:hGAKZMsDYF1P_4JxM86LBWAnubIaRYs1SfIqL71PocdJXV6j5ph_sw>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 17:41:07 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com, kkostiuk@redhat.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v5 1/3] qga: Refactor guest-exec capture-output to take enum
Date: Thu,  9 Mar 2023 15:40:56 -0700
Message-Id: <23a0e6273bb21895b0937f60c03c2e3ffdb83d67.1678401400.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678401400.git.dxu@dxuuu.xyz>
References: <cover.1678401400.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Previously capture-output was an optional boolean flag that either
captured all output or captured none. While this is OK in most cases, it
lacks flexibility for more advanced capture cases, such as wanting to
only capture stdout.

This commits refactors guest-exec qapi to take an enum for capture mode
instead while preserving backwards compatibility.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
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


