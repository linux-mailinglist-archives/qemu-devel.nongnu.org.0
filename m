Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCA6B159B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2bo-0001MP-BG; Wed, 08 Mar 2023 17:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bn-0001M3-3Y
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:07 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bl-00083y-Cz
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:50:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D8B785C01BA;
 Wed,  8 Mar 2023 17:50:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Mar 2023 17:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1678315804; x=1678402204; bh=OhArRTgo0J5rYnJUDmCvpzUB5JbFQB8TBpZ
 4jyTDxQ4=; b=LKGzXD3c8n5QA/LZq8XWwd1Oa1fgcgfkAzxQTd7BVYInl25sVPu
 Ll40BQKfruvKcHRRiKrPwxUTjbgAv7Eq8d9o7MhO3X7vozkzRGN2aLnS1698VVLN
 w+pSJtOmJbwi8wLsqbILJ7wYQncRPBnKroNwqXpDhtEt4IKdv+rrcrLz4etSB670
 GfQCp5TEdgMZswAURKEDptkblKk3BJu7K7LyjRFwMjv2bGubkKwrhkg/wpM6WEef
 hF41bWQ+CadyTRgKULHpolrBNyw7P5tkl3Ox51Wbc7wlJ6oeBlu0o104zAkQ9F9y
 hTg+Blh4Jz+VGS6a9zT4AO71u59fkyh7Ygw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678315804; x=1678402204; bh=OhArRTgo0J5rYnJUDmCvpzUB5JbFQB8TBpZ
 4jyTDxQ4=; b=iJMvK34p+b9Lu+D7nFLH+fm5v2d0E9d07PV823yJq7zGo/0Wvwp
 hZAQBnEMdjPma9n0lbXBZP63fImwht0V/lQFMumsZR3PhXRybyqKSov0JLhKiwzM
 JTXObrNhrN/8Mp82j8ybWKdYEdPjkxClZ7aIAgrsjJlQYb2uZ9lC5KVtSHM9Bpby
 UneG/zGCY6L+pYSf7xnXI3MvW427zchTzIXx1IGmVW2113zJUjmUtfBlD4M+DREg
 dRMdXT8ZvjzMQhP8Jm9ws/asFSm2jhp7PPSNqUSgPL0prGq6hLDwmC3C1O2v5tk7
 K8KaPsB4OL6emcdElnkx9EAx/UtgoOKYMxA==
X-ME-Sender: <xms:GxEJZDQWPxH9VZA7Ome9uHKcsWFm0v_w7PoMJPpDuHD__8DP9RZFdA>
 <xme:GxEJZExItd2NRYfEQQ-AEpnivaQf7OtjptyXkJIsI6Jlqf5DSdKHZMyKSgOxMqAAd
 x7Lu3oLtJF9GjEoTA>
X-ME-Received: <xmr:GxEJZI1olMpPqePqV7UT5Z8C8TtN4l-hvpgjyJRmjygovgTmjYiaOw3HKi2Z0RfdEFIjybFWcnbB7yjOVJTDcVE_TczFppkS-iywpL8Bv6B3mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhephffvvefuff
 fkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepteehkeekgffgieevvdetgf
 eliefftdelgeefueelvddutddvudfhkefguddtveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:GxEJZDCe_oNH6YhIrl0OnUhpQvVWDSE_hCL2t_WDMl3vY3mcz1F8IA>
 <xmx:GxEJZMg-DKYLtz_MlR-jMH9e64d5yx_8MoIo6N4KAPZc2MNvOK7xig>
 <xmx:GxEJZHoH5YQIvnPuZM79wRgMXklT18tuNxDPwie5S6Dd4k8fRTwkOA>
 <xmx:HBEJZFsidSHyorcPMp5fjFgTr4nXBz1bJjtnCmeoMz_-8MsXVzg-EQ>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 17:50:03 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: kkostiuk@redhat.com, michael.roth@amd.com, marcandre.lureau@gmail.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] qga: Refactor guest-exec capture-output to take enum
Date: Wed,  8 Mar 2023 15:49:39 -0700
Message-Id: <59f4f17ac2cbe719fa4f571a1c373c36597b12a3.1678314204.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1678314204.git.dxu@dxuuu.xyz>
References: <cover.1678314204.git.dxu@dxuuu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 qga/qapi-schema.json | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/qga/commands.c b/qga/commands.c
index 172826f8f8..5504fc5b8c 100644
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
+        return capture_output->u.flag ? GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL
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
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE_ALL:
+        has_output = true;
+        break;
+    case GUEST_EXEC_CAPTURE_OUTPUT_MODE__MAX:
+        /* Silence warning; impossible branch */
+        break;
     }
 
     ret = g_spawn_async_with_pipes(NULL, argv, envp, flags,
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 796434ed34..4ef585da5d 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1200,6 +1200,36 @@
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
+# @all: capture both stdout and stderr
+#
+# Since: 8.0
+##
+ { 'enum': 'GuestExecCaptureOutputMode',
+   'data': [ 'none', 'stdout', 'stderr', 'all' ] }
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
@@ -1218,7 +1248,7 @@
 ##
 { 'command': 'guest-exec',
   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
-               '*input-data': 'str', '*capture-output': 'bool' },
+               '*input-data': 'str', '*capture-output': 'GuestExecCaptureOutput' },
   'returns': 'GuestExec' }
 
 
-- 
2.39.1


