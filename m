Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC9515079
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:11:23 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTDG-0000W7-GX
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr9-00080z-5N
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr6-0001c4-AN
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXFu73gALppvmr8yj2JONQC6MdXh396kpNmEv6Rk/AU=;
 b=eFl5jQWLZaOx1KeifzfeJIHBTF3+x+cCAwCtBR5jgINEgi78dIjLt8/+bPHFTAcPpHcH8p
 pmSRxVCQwE/gP33w1xy/9ZxwFyTUHTUNuhet76rsrIWGlG3QTXdoz9ZRZQ+fUXmDg9139U
 3hIDfuQxza9zn2N38/I637OxFyAxPNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-r8VR0ZgSM-Ouh0MouaBcNw-1; Fri, 29 Apr 2022 11:48:26 -0400
X-MC-Unique: r8VR0ZgSM-Ouh0MouaBcNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD7CF101AA47;
 Fri, 29 Apr 2022 15:48:25 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95EA3416363;
 Fri, 29 Apr 2022 15:48:22 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] qapi: Drop unnecessary horizontal spacing in comments
Date: Fri, 29 Apr 2022 17:47:57 +0200
Message-Id: <20220429154758.354610-7-abologna@redhat.com>
In-Reply-To: <20220429154758.354610-1-abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Care was taken not to break vertical alignment.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/block-core.json   | 62 +++++++++++++++++++++---------------------
 qapi/block-export.json |  2 +-
 qapi/block.json        |  2 +-
 qapi/char.json         |  2 +-
 qapi/control.json      | 10 +++----
 qapi/crypto.json       | 44 +++++++++++++++---------------
 qapi/dump.json         |  4 +--
 qapi/machine.json      |  8 +++---
 qapi/misc-target.json  |  6 ++--
 qapi/misc.json         |  6 ++--
 qapi/run-state.json    |  4 +--
 qapi/sockets.json      |  6 ++--
 qapi/ui.json           | 18 ++++++------
 13 files changed, 87 insertions(+), 87 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2bce5bb0ae..5fd66ea676 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -337,9 +337,9 @@
 #
 # Cache mode information for a block device
 #
-# @writeback:   true if writeback mode is enabled
-# @direct:      true if the host page cache is bypassed (O_DIRECT)
-# @no-flush:    true if flush requests are ignored for the device
+# @writeback: true if writeback mode is enabled
+# @direct:    true if the host page cache is bypassed (O_DIRECT)
+# @no-flush:  true if flush requests are ignored for the device
 #
 # Since: 2.3
 ##
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
@@ -3333,15 +3333,15 @@
 ##
 # @BlockdevOptionsSsh:
 #
-# @server:              host address
+# @server:         host address
 #
-# @path:                path to the image on the host
+# @path:           path to the image on the host
 #
-# @user:                user as which to connect, defaults to current
-#                       local user name
+# @user:           user as which to connect, defaults to current
+#                  local user name
 #
-# @host-key-check:      Defines how and what to check the host key against
-#                       (default: known_hosts)
+# @host-key-check: Defines how and what to check the host key against
+#                  (default: known_hosts)
 #
 # Since: 2.9
 ##
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
@@ -4865,9 +4865,9 @@
 # Starts a job to create an image format on a given node. The job is
 # automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:          Identifier for the newly created job.
+# @job-id:  Identifier for the newly created job.
 #
-# @options:         Options for the image creation.
+# @options: Options for the image creation.
 #
 # Since: 3.0
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
@@ -4923,17 +4923,17 @@
 # Starts a job to amend format specific options of an existing open block device
 # The job is automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:          Identifier for the newly created job.
+# @job-id:    Identifier for the newly created job.
 #
-# @node-name:       Name of the block node to work on
+# @node-name: Name of the block node to work on
 #
-# @options:         Options (driver specific)
+# @options:   Options (driver specific)
 #
-# @force:           Allow unsafe operations, format specific
-#                   For luks that allows erase of the last active keyslot
-#                   (permanent loss of data),
-#                   and replacement of an active keyslot
-#                   (possible loss of data if IO error happens)
+# @force:     Allow unsafe operations, format specific
+#             For luks that allows erase of the last active keyslot
+#             (permanent loss of data),
+#             and replacement of an active keyslot
+#             (possible loss of data if IO error happens)
 #
 # Features:
 # @unstable: This command is experimental.
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 1de16d2589..53013b03ff 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -387,7 +387,7 @@
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
diff --git a/qapi/control.json b/qapi/control.json
index 53461cec05..7107f55db3 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -192,14 +192,14 @@
 #
 # Options to be used for adding a new monitor.
 #
-# @id:          Name of the monitor
+# @id:      Name of the monitor
 #
-# @mode:        Selects the monitor mode (default: readline in the system
-#               emulator, control in qemu-storage-daemon)
+# @mode:    Selects the monitor mode (default: readline in the system
+#           emulator, control in qemu-storage-daemon)
 #
-# @pretty:      Enables pretty printing (QMP only)
+# @pretty:  Enables pretty printing (QMP only)
 #
-# @chardev:     Name of a character device to expose the monitor on
+# @chardev: Name of a character device to expose the monitor on
 #
 # Since: 5.0
 ##
diff --git a/qapi/crypto.json b/qapi/crypto.json
index ff33e1fe1f..5c442a0c36 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -311,8 +311,8 @@
 #
 # Defines state of keyslots that are affected by the update
 #
-# @active:    The slots contain the given password and marked as active
-# @inactive:  The slots are erased (contain garbage) and marked as inactive
+# @active:   The slots contain the given password and marked as active
+# @inactive: The slots are erased (contain garbage) and marked as inactive
 #
 # Since: 5.1
 ##
@@ -325,32 +325,32 @@
 # This struct defines the update parameters that activate/de-activate set
 # of keyslots
 #
-# @state: the desired state of the keyslots
+# @state:      the desired state of the keyslots
 #
-# @new-secret:    The ID of a QCryptoSecret object providing the password to be
-#                 written into added active keyslots
+# @new-secret: The ID of a QCryptoSecret object providing the password to be
+#              written into added active keyslots
 #
-# @old-secret:    Optional (for deactivation only)
-#                 If given will deactivate all keyslots that
-#                 match password located in QCryptoSecret with this ID
+# @old-secret: Optional (for deactivation only)
+#              If given will deactivate all keyslots that
+#              match password located in QCryptoSecret with this ID
 #
-# @iter-time:     Optional (for activation only)
-#                 Number of milliseconds to spend in
-#                 PBKDF passphrase processing for the newly activated keyslot.
-#                 Currently defaults to 2000.
+# @iter-time:  Optional (for activation only)
+#              Number of milliseconds to spend in
+#              PBKDF passphrase processing for the newly activated keyslot.
+#              Currently defaults to 2000.
 #
-# @keyslot:       Optional. ID of the keyslot to activate/deactivate.
-#                 For keyslot activation, keyslot should not be active already
-#                 (this is unsafe to update an active keyslot),
-#                 but possible if 'force' parameter is given.
-#                 If keyslot is not given, first free keyslot will be written.
+# @keyslot:    Optional. ID of the keyslot to activate/deactivate.
+#              For keyslot activation, keyslot should not be active already
+#              (this is unsafe to update an active keyslot),
+#              but possible if 'force' parameter is given.
+#              If keyslot is not given, first free keyslot will be written.
 #
-#                 For keyslot deactivation, this parameter specifies the exact
-#                 keyslot to deactivate
+#              For keyslot deactivation, this parameter specifies the exact
+#              keyslot to deactivate
 #
-# @secret:        Optional. The ID of a QCryptoSecret object providing the
-#                 password to use to retrieve current master key.
-#                 Defaults to the same secret that was used to open the image
+# @secret:     Optional. The ID of a QCryptoSecret object providing the
+#              password to use to retrieve current master key.
+#              Defaults to the same secret that was used to open the image
 #
 # Since 5.1
 ##
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
index 9f91e46e8b..6c120eb1bb 100644
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
index b83cc39029..6aec6bdbf3 100644
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
index fccc38584b..bad74e34d3 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -167,9 +167,9 @@
 #
 # Available SocketAddress types
 #
-# @inet:  Internet address
+# @inet: Internet address
 #
-# @unix:  Unix domain socket
+# @unix: Unix domain socket
 #
 # @vsock: VMCI address
 #
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
index 9f19beea6d..15c3f790a6 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1018,8 +1018,8 @@
 #
 # Keyboard input event.
 #
-# @key:    Which key this event is for.
-# @down:   True for key-down and false for key-up events.
+# @key:  Which key this event is for.
+# @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
 ##
@@ -1260,7 +1260,7 @@
 #
 # Curses display options.
 #
-# @charset:       Font charset used by guest (default: CP437).
+# @charset: Font charset used by guest (default: CP437).
 #
 # Since: 4.0
 ##
@@ -1353,12 +1353,12 @@
 #
 # Display (user interface) options.
 #
-# @type:          Which DisplayType qemu should use.
-# @full-screen:   Start user interface in fullscreen mode (default: off).
-# @window-close:  Allow to quit qemu with window close button (default: on).
-# @show-cursor:   Force showing the mouse cursor (default: off).
-#                 (since: 5.0)
-# @gl:            Enable OpenGL support (default: off).
+# @type:         Which DisplayType qemu should use.
+# @full-screen:  Start user interface in fullscreen mode (default: off).
+# @window-close: Allow to quit qemu with window close button (default: on).
+# @show-cursor:  Force showing the mouse cursor (default: off).
+#                (since: 5.0)
+# @gl:           Enable OpenGL support (default: off).
 #
 # Since: 2.12
 ##
-- 
2.35.1


