Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73538517F45
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:58:13 +0200 (CEST)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnQC-0003xx-D4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln8F-0008Vg-MN
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln8D-00049q-KM
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfbGBAkYrOAVmDqI7HSYce71teZFSnLfwHieVpleA3I=;
 b=W8zcnuCyUMem/cgWETxTCEjaCrHPG9KU48Lo6jz4ZpQPMw4Ewz78b9ZjnutQF/5J9e5r8S
 2wA9TystrANi5o/bToE26FeSeMYfbQeMHA6i2JBf4IGh2MclU4KY9ZrCyf//+Ejho7YD98
 e1Y7Zxi6ZFIbWLfzVrxQ3oFT8RZUi+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-cW_ihPM2P6-knykHWAbU0Q-1; Tue, 03 May 2022 03:39:29 -0400
X-MC-Unique: cW_ihPM2P6-knykHWAbU0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB3F1014A60;
 Tue,  3 May 2022 07:39:27 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589369E71;
 Tue,  3 May 2022 07:39:11 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 8/8] qapi: Stop using whitespace for alignment in comments
Date: Tue,  3 May 2022 09:37:37 +0200
Message-Id: <20220503073737.84223-9-abologna@redhat.com>
In-Reply-To: <20220503073737.84223-1-abologna@redhat.com>
References: <20220503073737.84223-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perfectly aligned things look pretty, but keeping them that
way as the schema evolves requires churn, and in some cases
newly-added lines are not aligned properly.

Overall, trying to align things is just not worth the trouble.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/block-core.json | 43 +++++++++++++++++++++----------------------
 qapi/block.json      |  6 +++---
 qapi/char.json       |  6 +++---
 qapi/control.json    |  6 +++---
 qapi/crypto.json     | 30 +++++++++++++++---------------
 qapi/migration.json  |  8 ++++----
 qapi/sockets.json    |  4 ++--
 qapi/ui.json         | 13 ++++++-------
 8 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 5fd66ea676..f0383c7925 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -338,8 +338,8 @@
 # Cache mode information for a block device
 #
 # @writeback: true if writeback mode is enabled
-# @direct:    true if the host page cache is bypassed (O_DIRECT)
-# @no-flush:  true if flush requests are ignored for the device
+# @direct: true if the host page cache is bypassed (O_DIRECT)
+# @no-flush: true if flush requests are ignored for the device
 #
 # Since: 2.3
 ##
@@ -3333,12 +3333,11 @@
 ##
 # @BlockdevOptionsSsh:
 #
-# @server:         host address
+# @server: host address
 #
-# @path:           path to the image on the host
+# @path: path to the image on the host
 #
-# @user:           user as which to connect, defaults to current
-#                  local user name
+# @user: user as which to connect, defaults to current local user name
 #
 # @host-key-check: Defines how and what to check the host key against
 #                  (default: known_hosts)
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
@@ -4865,7 +4864,7 @@
 # Starts a job to create an image format on a given node. The job is
 # automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:  Identifier for the newly created job.
+# @job-id: Identifier for the newly created job.
 #
 # @options: Options for the image creation.
 #
@@ -4923,17 +4922,17 @@
 # Starts a job to amend format specific options of an existing open block device
 # The job is automatically finalized, but a manual job-dismiss is required.
 #
-# @job-id:    Identifier for the newly created job.
+# @job-id: Identifier for the newly created job.
 #
 # @node-name: Name of the block node to work on
 #
-# @options:   Options (driver specific)
+# @options: Options (driver specific)
 #
-# @force:     Allow unsafe operations, format specific
-#             For luks that allows erase of the last active keyslot
-#             (permanent loss of data),
-#             and replacement of an active keyslot
-#             (possible loss of data if IO error happens)
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
index 7107f55db3..afca2043af 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -192,12 +192,12 @@
 #
 # Options to be used for adding a new monitor.
 #
-# @id:      Name of the monitor
+# @id: Name of the monitor
 #
-# @mode:    Selects the monitor mode (default: readline in the system
+# @mode: Selects the monitor mode (default: readline in the system
 #           emulator, control in qemu-storage-daemon)
 #
-# @pretty:  Enables pretty printing (QMP only)
+# @pretty: Enables pretty printing (QMP only)
 #
 # @chardev: Name of a character device to expose the monitor on
 #
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 64e2ce81f1..05386f6491 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -311,7 +311,7 @@
 #
 # Defines state of keyslots that are affected by the update
 #
-# @active:   The slots contain the given password and marked as active
+# @active: The slots contain the given password and marked as active
 # @inactive: The slots are erased (contain garbage) and marked as inactive
 #
 # Since: 5.1
@@ -334,23 +334,23 @@
 #              If given will deactivate all keyslots that
 #              match password located in QCryptoSecret with this ID
 #
-# @iter-time:  Optional (for activation only)
-#              Number of milliseconds to spend in
-#              PBKDF passphrase processing for the newly activated keyslot.
-#              Currently defaults to 2000.
+# @iter-time: Optional (for activation only)
+#             Number of milliseconds to spend in
+#             PBKDF passphrase processing for the newly activated keyslot.
+#             Currently defaults to 2000.
 #
-# @keyslot:    Optional. ID of the keyslot to activate/deactivate.
-#              For keyslot activation, keyslot should not be active already
-#              (this is unsafe to update an active keyslot),
-#              but possible if 'force' parameter is given.
-#              If keyslot is not given, first free keyslot will be written.
+# @keyslot: Optional. ID of the keyslot to activate/deactivate.
+#           For keyslot activation, keyslot should not be active already
+#           (this is unsafe to update an active keyslot),
+#           but possible if 'force' parameter is given.
+#           If keyslot is not given, first free keyslot will be written.
 #
-#              For keyslot deactivation, this parameter specifies the exact
-#              keyslot to deactivate
+#           For keyslot deactivation, this parameter specifies the exact
+#           keyslot to deactivate
 #
-# @secret:     Optional. The ID of a QCryptoSecret object providing the
-#              password to use to retrieve current master key.
-#              Defaults to the same secret that was used to open the image
+# @secret: Optional. The ID of a QCryptoSecret object providing the
+#          password to use to retrieve current master key.
+#          Defaults to the same secret that was used to open the image
 #
 # Since 5.1
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
index 15c3f790a6..11a827d10f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1018,7 +1018,7 @@
 #
 # Keyboard input event.
 #
-# @key:  Which key this event is for.
+# @key: Which key this event is for.
 # @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
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
-# @type:         Which DisplayType qemu should use.
-# @full-screen:  Start user interface in fullscreen mode (default: off).
+# @type: Which DisplayType qemu should use.
+# @full-screen: Start user interface in fullscreen mode (default: off).
 # @window-close: Allow to quit qemu with window close button (default: on).
-# @show-cursor:  Force showing the mouse cursor (default: off).
-#                (since: 5.0)
-# @gl:           Enable OpenGL support (default: off).
+# @show-cursor: Force showing the mouse cursor (default: off). (since: 5.0)
+# @gl: Enable OpenGL support (default: off).
 #
 # Since: 2.12
 ##
-- 
2.35.1


