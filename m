Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F4527F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:16:10 +0200 (CEST)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVtg-0002Yw-Rf
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGP-0000qu-75
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGL-0001tq-L0
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQMVK8xSVw4Vl1+cgkX/pKVGRlPqHg2Ed7L3UrmKsRk=;
 b=MddHZnIzBJc2+eiOrXrkhRDVcQpZPVB8cfZeQqhYswuorjnkr21+xoOVp0gqvTp3BOP3jd
 ouZWBSXcw0t+5Nku4ImXMf+5djgtValD9wg/ggmBx6SSFZLo1tAc7+v/XPr+rXSbVw7u2n
 kFJZFlh72D17MdCZlvKyoai3uRRdzfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-ild496AsNuye_sOLZufg2A-1; Mon, 16 May 2022 03:35:25 -0400
X-MC-Unique: ild496AsNuye_sOLZufg2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5020029AB44E;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ECED40D1B98;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF8AB21E6939; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 07/11] qapi: Drop unnecessary whitespace in comments
Date: Mon, 16 May 2022 09:35:18 +0200
Message-Id: <20220516073522.3880774-8-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrea Bolognani <abologna@redhat.com>

The only instances that get changed are those in which the
additional whitespace was not (or couldn't possibly be) used for
alignment purposes.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Message-Id: <20220503073737.84223-7-abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json   | 24 ++++++++++++------------
 qapi/block-export.json |  2 +-
 qapi/block.json        |  2 +-
 qapi/char.json         |  2 +-
 qapi/dump.json         |  4 ++--
 qapi/machine.json      |  8 ++++----
 qapi/misc-target.json  |  6 +++---
 qapi/misc.json         |  6 +++---
 qapi/run-state.json    |  4 ++--
 qapi/sockets.json      |  2 +-
 qapi/ui.json           |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2bce5bb0ae..e110af2f1d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -604,7 +604,7 @@
 # @inserted: @BlockDeviceInfo describing the device if media is
 #            present
 #
-# Since:  0.14
+# Since: 0.14
 ##
 { 'struct': 'BlockInfo',
   'data': {'device': 'str', '*qdev': 'str', 'type': 'str', 'removable': 'bool',
@@ -795,9 +795,9 @@
 #
 # Statistics of a virtual block device or a block backing device.
 #
-# @rd_bytes:      The number of bytes read by the device.
+# @rd_bytes: The number of bytes read by the device.
 #
-# @wr_bytes:      The number of bytes written by the device.
+# @wr_bytes: The number of bytes written by the device.
 #
 # @unmap_bytes: The number of bytes unmapped by the device (Since 4.2)
 #
@@ -970,7 +970,7 @@
 # @qdev: The qdev ID, or if no ID is assigned, the QOM path of the block
 #        device. (since 3.0)
 #
-# @stats:  A @BlockDeviceStats for the device.
+# @stats: A @BlockDeviceStats for the device.
 #
 # @driver-specific: Optional driver-specific stats. (Since 4.2)
 #
@@ -1275,7 +1275,7 @@
 #
 # @node-name: graph node name to get the image resized (Since 2.0)
 #
-# @size:  new image size in bytes
+# @size: new image size in bytes
 #
 # Returns: - nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
@@ -1960,8 +1960,8 @@
 # @job-id: identifier for the newly-created block job. If
 #          omitted, the device name will be used. (Since 2.7)
 #
-# @device:  the device name or node-name of a root node whose writes should be
-#           mirrored.
+# @device: the device name or node-name of a root node whose writes should be
+#          mirrored.
 #
 # @target: the target of the new image. If the file exists, or if it
 #          is a device, the existing file/device will be used as the new
@@ -1981,7 +1981,7 @@
 # @mode: whether and how QEMU should create a new image, default is
 #        'absolute-paths'.
 #
-# @speed:  the maximum speed, in bytes per second
+# @speed: the maximum speed, in bytes per second
 #
 # @sync: what parts of the disk image should be copied to the destination
 #        (all the disk, only the sectors allocated in the topmost image, or
@@ -2296,7 +2296,7 @@
 #            broken Quorum files.  By default, @device is replaced, although
 #            implicitly created filters on it are kept.
 #
-# @speed:  the maximum speed, in bytes per second
+# @speed: the maximum speed, in bytes per second
 #
 # @sync: what parts of the disk image should be copied to the destination
 #        (all the disk, only the sectors allocated in the topmost image, or
@@ -4548,8 +4548,8 @@
 ##
 # @BlockdevQcow2Version:
 #
-# @v2:  The original QCOW2 format as introduced in qemu 0.10 (version 2)
-# @v3:  The extended QCOW2 format as introduced in qemu 1.1 (version 3)
+# @v2: The original QCOW2 format as introduced in qemu 0.10 (version 2)
+# @v3: The extended QCOW2 format as introduced in qemu 1.1 (version 3)
 #
 # Since: 2.12
 ##
@@ -4905,7 +4905,7 @@
 #
 # Options for amending an image format
 #
-# @driver:          Block driver of the node to amend.
+# @driver: Block driver of the node to amend.
 #
 # Since: 5.1
 ##
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 7776248435..0685cb8b9a 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -391,7 +391,7 @@
 #                 block-export-del command, but before the shutdown has
 #                 completed)
 #
-# Since:  5.2
+# Since: 5.2
 ##
 { 'struct': 'BlockExportInfo',
   'data': { 'id': 'str',
diff --git a/qapi/block.json b/qapi/block.json
index 41b73c9934..96f557b3bb 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -106,7 +106,7 @@
 # Returns: - Nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
 #
-# Notes:    Ejecting a device with no media results in success
+# Notes: Ejecting a device with no media results in success
 #
 # Since: 0.14
 #
diff --git a/qapi/char.json b/qapi/char.json
index 8414ef2bc2..a40fe4b7bd 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -216,7 +216,7 @@
 #
 # Configuration info for file chardevs.
 #
-# @in:  The name of the input file
+# @in: The name of the input file
 # @out: The name of the output file
 # @append: Open the file in append mode (default false to
 #          truncate) (Since 2.6)
diff --git a/qapi/dump.json b/qapi/dump.json
index 29441af9d8..90859c5483 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -186,8 +186,8 @@
 #
 # Returns the available formats for dump-guest-memory
 #
-# Returns:  A @DumpGuestMemoryCapability object listing available formats for
-#           dump-guest-memory
+# Returns: A @DumpGuestMemoryCapability object listing available formats for
+#          dump-guest-memory
 #
 # Since: 2.0
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 3fe977e903..1e5bf02480 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -315,9 +315,9 @@
 # query-current-machine), wake-up guest from suspend if the guest is
 # in SUSPENDED state. Return an error otherwise.
 #
-# Since:  1.1
+# Since: 1.1
 #
-# Returns:  nothing.
+# Returns: nothing.
 #
 # Note: prior to 4.0, this command does nothing in case the guest
 #       isn't suspended.
@@ -368,9 +368,9 @@
 # Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
 # The command fails when the guest doesn't support injecting.
 #
-# Returns:  If successful, nothing
+# Returns: If successful, nothing
 #
-# Since:  0.14
+# Since: 0.14
 #
 # Note: prior to 2.1, this command was only supported for x86 and s390 VMs
 #
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 2fa68a6796..4944c0528f 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -136,9 +136,9 @@
 # The struct describes capability for a Secure Encrypted Virtualization
 # feature.
 #
-# @pdh:  Platform Diffie-Hellman key (base64 encoded)
+# @pdh: Platform Diffie-Hellman key (base64 encoded)
 #
-# @cert-chain:  PDH certificate chain (base64 encoded)
+# @cert-chain: PDH certificate chain (base64 encoded)
 #
 # @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.1)
 #
@@ -201,7 +201,7 @@
 # The struct describes attestation report for a Secure Encrypted
 # Virtualization feature.
 #
-# @data:  guest attestation report (base64 encoded)
+# @data: guest attestation report (base64 encoded)
 #
 # Since: 6.1
 ##
diff --git a/qapi/misc.json b/qapi/misc.json
index f8a9feda30..45344483cd 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -136,7 +136,7 @@
 #
 # Stop all guest VCPU execution.
 #
-# Since:  0.14
+# Since: 0.14
 #
 # Notes: This function will succeed even if the guest is already in the stopped
 #        state.  In "inmigrate" state, it will ensure that the guest
@@ -156,9 +156,9 @@
 #
 # Resume guest VCPU execution.
 #
-# Since:  0.14
+# Since: 0.14
 #
-# Returns:  If successful, nothing
+# Returns: If successful, nothing
 #
 # Notes: This command will succeed if the guest is currently running.  It
 #        will also succeed if the guest is in the "inmigrate" state; in
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 30a2f5231d..6e2162d7b3 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -104,7 +104,7 @@
 #
 # @status: the virtual machine @RunState
 #
-# Since:  0.14
+# Since: 0.14
 #
 # Notes: @singlestep is enabled through the GDB stub
 ##
@@ -118,7 +118,7 @@
 #
 # Returns: @StatusInfo reflecting all VCPUs
 #
-# Since:  0.14
+# Since: 0.14
 #
 # Example:
 #
diff --git a/qapi/sockets.json b/qapi/sockets.json
index fccc38584b..b4f84d3334 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -189,7 +189,7 @@
 # Captures the address of a socket, which could also be a named file
 # descriptor
 #
-# @type:       Transport type
+# @type: Transport type
 #
 # Since: 2.9
 ##
diff --git a/qapi/ui.json b/qapi/ui.json
index 9f19beea6d..c844237434 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1260,7 +1260,7 @@
 #
 # Curses display options.
 #
-# @charset:       Font charset used by guest (default: CP437).
+# @charset: Font charset used by guest (default: CP437).
 #
 # Since: 4.0
 ##
-- 
2.35.3


