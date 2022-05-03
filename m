Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075A517F3A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:53:39 +0200 (CEST)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnLm-0006Gz-Fd
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln7t-00086E-Br
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nln7r-00049A-9S
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNARykRI9lkZQBcA3W5N7sOX2ToFhyHIuDuO7X8BG+A=;
 b=iq1SgJ3ohCVoHc7v/CzkVhw3K1K6SL7Q9uJqVBazjTc80/7ERTGGafm9maXipVXgW6cb+z
 J+4x675uzumwirtYqop2IevnvIm/b5LnWEWRlw8O2zV9JSxbGI/7AHsGE6INb4Kev3JPRH
 qL+s/dKh8Py+d+1IpMHbA8TrBgb3Qh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-SREEOmjhP1uRZyoxcCKBlg-1; Tue, 03 May 2022 03:39:11 -0400
X-MC-Unique: SREEOmjhP1uRZyoxcCKBlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1101E18D41;
 Tue,  3 May 2022 07:39:11 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 199FC9E71;
 Tue,  3 May 2022 07:39:07 +0000 (UTC)
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
Subject: [PATCH v2 7/8] qapi: Reduce whitespace used for alignment in comments
Date: Tue,  3 May 2022 09:37:36 +0200
Message-Id: <20220503073737.84223-8-abologna@redhat.com>
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

Use the minimum number of spaces necessary.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/block-core.json | 38 +++++++++++++++++++-------------------
 qapi/control.json    | 10 +++++-----
 qapi/crypto.json     | 42 +++++++++++++++++++++---------------------
 qapi/ui.json         | 16 ++++++++--------
 4 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e110af2f1d..5fd66ea676 100644
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
index ff33e1fe1f..64e2ce81f1 100644
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
diff --git a/qapi/ui.json b/qapi/ui.json
index c844237434..15c3f790a6 100644
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


