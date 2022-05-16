Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69270527F45
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:09:16 +0200 (CEST)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVn1-0007IT-Fu
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGN-0000qS-Ue
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGJ-0001s2-QO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88WZoYleZt78cyWHcWlBnun10sJcL+SURQ+YQ+Uh1cw=;
 b=CBypNZN6moaFETUwJkuYgtYMsz9TUDTm87PF+6CXD4uq68EPRoCl8TzxJpR8uq4FEOFRVB
 ixI3YWuGjuyQijV9fO6qCofvzKrSy4gjAikzADKa3++YN07GSVYEmggA8RE3k59KueYtQO
 USSs41l/BRCvQ3g6sZU4jAlf6hL4R60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-f95bxNEJP3WrQNm_WqibNg-1; Mon, 16 May 2022 03:35:25 -0400
X-MC-Unique: f95bxNEJP3WrQNm_WqibNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A6651815CF7;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3DB155F6B2;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1B3421E693E; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Andrea Bolognani <abologna@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 08/11] qapi: Stop using whitespace for alignment in comments
Date: Mon, 16 May 2022 09:35:19 +0200
Message-Id: <20220516073522.3880774-9-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Perfectly aligned things look pretty, but keeping them that
way as the schema evolves requires churn, and in some cases
newly-added lines are not aligned properly.

Overall, trying to align things is just not worth the trouble.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Message-Id: <20220503073737.84223-8-abologna@redhat.com>
Message-Id: <20220503073737.84223-9-abologna@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Two patches squashed together]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 53 ++++++++++++++++++++++----------------------
 qapi/block.json      |  6 ++---
 qapi/char.json       |  6 ++---
 qapi/control.json    | 10 ++++-----
 qapi/crypto.json     | 42 +++++++++++++++++------------------
 qapi/migration.json  |  8 +++----
 qapi/sockets.json    |  4 ++--
 qapi/ui.json         | 17 +++++++-------
 8 files changed, 72 insertions(+), 74 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e110af2f1d..f0383c7925 100644
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
+# @direct: true if the host page cache is bypassed (O_DIRECT)
+# @no-flush: true if flush requests are ignored for the device
 #
 # Since: 2.3
 ##
@@ -3333,15 +3333,14 @@
 ##
 # @BlockdevOptionsSsh:
 #
-# @server:              host address
+# @server: host address
 #
-# @path:                path to the image on the host
+# @path: path to the image on the host
 #
-# @user:                user as which to connect, defaults to current
-#                       local user name
+# @user: user as which to connect, defaults to current local user name
 #
-# @host-key-check:      Defines how and what to check the host key against
-#                       (default: known_hosts)
+# @host-key-check: Defines how and what to check the host key against
+#                  (default: known_hosts)
 #
 # Since: 2.9
 ##
@@ -4662,18 +4661,18 @@
 #
 # Subformat options for VMDK images
 #
-# @monolithicSparse:     Single file image with sparse cluster allocation
+# @monolithicSparse: Single file image with sparse cluster allocation
 #
-# @monolithicFlat:       Single flat data image and a descriptor file
+# @monolithicFlat: Single flat data image and a descriptor file
 #
 # @twoGbMaxExtentSparse: Data is split into 2GB (per virtual LBA) sparse extent
 #                        files, in addition to a descriptor file
 #
-# @twoGbMaxExtentFlat:   Data is split into 2GB (per virtual LBA) flat extent
-#                        files, in addition to a descriptor file
+# @twoGbMaxExtentFlat: Data is split into 2GB (per virtual LBA) flat extent
+#                      files, in addition to a descriptor file
 #
-# @streamOptimized:      Single file image sparse cluster allocation, optimized
-#                        for streaming over network.
+# @streamOptimized: Single file image sparse cluster allocation, optimized
+#                   for streaming over network.
 #
 # Since: 4.0
 ##
@@ -4764,7 +4763,7 @@
 # @BlockdevVhdxSubformat:
 #
 # @dynamic: Growing image file
-# @fixed:   Preallocated fixed-size image file
+# @fixed: Preallocated fixed-size image file
 #
 # Since: 2.12
 ##
@@ -4802,7 +4801,7 @@
 # @BlockdevVpcSubformat:
 #
 # @dynamic: Growing image file
-# @fixed:   Preallocated fixed-size image file
+# @fixed: Preallocated fixed-size image file
 #
 # Since: 2.12
 ##
@@ -4865,9 +4864,9 @@
 # Starts a job to create an image format on a given node. The job is
 # automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:          Identifier for the newly created job.
+# @job-id: Identifier for the newly created job.
 #
-# @options:         Options for the image creation.
+# @options: Options for the image creation.
 #
 # Since: 3.0
 ##
@@ -4923,17 +4922,17 @@
 # Starts a job to amend format specific options of an existing open block device
 # The job is automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:          Identifier for the newly created job.
+# @job-id: Identifier for the newly created job.
 #
-# @node-name:       Name of the block node to work on
+# @node-name: Name of the block node to work on
 #
-# @options:         Options (driver specific)
+# @options: Options (driver specific)
 #
-# @force:           Allow unsafe operations, format specific
-#                   For luks that allows erase of the last active keyslot
-#                   (permanent loss of data),
-#                   and replacement of an active keyslot
-#                   (possible loss of data if IO error happens)
+# @force: Allow unsafe operations, format specific
+#         For luks that allows erase of the last active keyslot
+#         (permanent loss of data),
+#         and replacement of an active keyslot
+#         (possible loss of data if IO error happens)
 #
 # Features:
 # @unstable: This command is experimental.
diff --git a/qapi/block.json b/qapi/block.json
index 96f557b3bb..19326641ac 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -50,9 +50,9 @@
 #
 # Type of Floppy drive to be emulated by the Floppy Disk Controller.
 #
-# @144:  1.44MB 3.5" drive
-# @288:  2.88MB 3.5" drive
-# @120:  1.2MB 5.25" drive
+# @144: 1.44MB 3.5" drive
+# @288: 2.88MB 3.5" drive
+# @120: 1.2MB 5.25" drive
 # @none: No drive connected
 # @auto: Automatically determined by inserted media at boot
 #
diff --git a/qapi/char.json b/qapi/char.json
index a40fe4b7bd..923dc5056d 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -376,10 +376,10 @@
 #
 # Configuration info for virtual console chardevs.
 #
-# @width:  console width,  in pixels
+# @width: console width, in pixels
 # @height: console height, in pixels
-# @cols:   console width,  in chars
-# @rows:   console height, in chars
+# @cols: console width, in chars
+# @rows: console height, in chars
 #
 # Since: 1.5
 ##
diff --git a/qapi/control.json b/qapi/control.json
index 53461cec05..afca2043af 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -192,14 +192,14 @@
 #
 # Options to be used for adding a new monitor.
 #
-# @id:          Name of the monitor
+# @id: Name of the monitor
 #
-# @mode:        Selects the monitor mode (default: readline in the system
-#               emulator, control in qemu-storage-daemon)
+# @mode: Selects the monitor mode (default: readline in the system
+#           emulator, control in qemu-storage-daemon)
 #
-# @pretty:      Enables pretty printing (QMP only)
+# @pretty: Enables pretty printing (QMP only)
 #
-# @chardev:     Name of a character device to expose the monitor on
+# @chardev: Name of a character device to expose the monitor on
 #
 # Since: 5.0
 ##
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 9ec0aca1c6..15c24f0078 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -311,8 +311,8 @@
 #
 # Defines state of keyslots that are affected by the update
 #
-# @active:    The slots contain the given password and marked as active
-# @inactive:  The slots are erased (contain garbage) and marked as inactive
+# @active: The slots contain the given password and marked as active
+# @inactive: The slots are erased (contain garbage) and marked as inactive
 #
 # Since: 5.1
 ##
@@ -327,30 +327,30 @@
 #
 # @state: the desired state of the keyslots
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
+# @iter-time: Optional (for activation only)
+#             Number of milliseconds to spend in
+#             PBKDF passphrase processing for the newly activated keyslot.
+#             Currently defaults to 2000.
 #
-# @keyslot:       Optional. ID of the keyslot to activate/deactivate.
-#                 For keyslot activation, keyslot should not be active already
-#                 (this is unsafe to update an active keyslot),
-#                 but possible if 'force' parameter is given.
-#                 If keyslot is not given, first free keyslot will be written.
+# @keyslot: Optional. ID of the keyslot to activate/deactivate.
+#           For keyslot activation, keyslot should not be active already
+#           (this is unsafe to update an active keyslot),
+#           but possible if 'force' parameter is given.
+#           If keyslot is not given, first free keyslot will be written.
 #
-#                 For keyslot deactivation, this parameter specifies the exact
-#                 keyslot to deactivate
+#           For keyslot deactivation, this parameter specifies the exact
+#           keyslot to deactivate
 #
-# @secret:        Optional. The ID of a QCryptoSecret object providing the
-#                 password to use to retrieve current master key.
-#                 Defaults to the same secret that was used to open the image
+# @secret: Optional. The ID of a QCryptoSecret object providing the
+#          password to use to retrieve current master key.
+#          Defaults to the same secret that was used to open the image
 #
 # Since: 5.1
 ##
diff --git a/qapi/migration.json b/qapi/migration.json
index dd4dde6361..1ff4d7eaff 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1191,10 +1191,10 @@
 # ask the client to automatically reconnect using the new parameters
 # once migration finished successfully.  Only implemented for SPICE.
 #
-# @protocol:     must be "spice"
-# @hostname:     migration target hostname
-# @port:         spice tcp port for plaintext channels
-# @tls-port:     spice tcp port for tls-secured channels
+# @protocol: must be "spice"
+# @hostname: migration target hostname
+# @port: spice tcp port for plaintext channels
+# @tls-port: spice tcp port for tls-secured channels
 # @cert-subject: server certificate subject
 #
 # Since: 0.14
diff --git a/qapi/sockets.json b/qapi/sockets.json
index b4f84d3334..bad74e34d3 100644
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
diff --git a/qapi/ui.json b/qapi/ui.json
index c844237434..11a827d10f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1018,8 +1018,8 @@
 #
 # Keyboard input event.
 #
-# @key:    Which key this event is for.
-# @down:   True for key-down and false for key-up events.
+# @key: Which key this event is for.
+# @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
 ##
@@ -1033,7 +1033,7 @@
 # Pointer button input event.
 #
 # @button: Which button this event is for.
-# @down:   True for key-down and false for key-up events.
+# @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
 ##
@@ -1353,12 +1353,11 @@
 #
 # Display (user interface) options.
 #
-# @type:          Which DisplayType qemu should use.
-# @full-screen:   Start user interface in fullscreen mode (default: off).
-# @window-close:  Allow to quit qemu with window close button (default: on).
-# @show-cursor:   Force showing the mouse cursor (default: off).
-#                 (since: 5.0)
-# @gl:            Enable OpenGL support (default: off).
+# @type: Which DisplayType qemu should use.
+# @full-screen: Start user interface in fullscreen mode (default: off).
+# @window-close: Allow to quit qemu with window close button (default: on).
+# @show-cursor: Force showing the mouse cursor (default: off). (since: 5.0)
+# @gl: Enable OpenGL support (default: off).
 #
 # Since: 2.12
 ##
-- 
2.35.3


