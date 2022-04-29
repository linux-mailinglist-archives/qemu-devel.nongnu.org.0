Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8745150E8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:30:52 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTW7-0007OG-MQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr6-0007sA-Ox
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr3-0001bS-O8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jp2ADW1vPhQr70u5+JOl41Nb1wBlDZUxzgXMdJubLWQ=;
 b=QXhQyenSvJ8U4kS3Ew+3jlTJD5HejHO+dPKR/8YNex7A7T/gTwwcuxdXH1W72stKGxx07j
 GK883wo47BhD9kdlZylVhU0+CmB0Hyo0KkE2/RSR9NEluW5/lskYOOBdGcm9EPQV9KfqTz
 tmILsACcj6gZrj29TN1wiGYifQtAQ0o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-Yc15touKMJK6Q4t-IAij3w-1; Fri, 29 Apr 2022 11:48:19 -0400
X-MC-Unique: Yc15touKMJK6Q4t-IAij3w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA0811E10B4D;
 Fri, 29 Apr 2022 15:48:18 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1726413707;
 Fri, 29 Apr 2022 15:48:15 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] qapi: Drop unnecessary empty lines in comments
Date: Fri, 29 Apr 2022 17:47:55 +0200
Message-Id: <20220429154758.354610-5-abologna@redhat.com>
In-Reply-To: <20220429154758.354610-1-abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/block-core.json  |  4 ----
 qapi/block.json       |  1 -
 qapi/char.json        |  1 -
 qapi/common.json      |  2 --
 qapi/control.json     |  2 --
 qapi/crypto.json      |  1 -
 qapi/machine.json     |  2 --
 qapi/migration.json   |  7 -------
 qapi/misc-target.json |  3 ---
 qapi/replay.json      |  1 -
 qapi/run-state.json   |  3 ---
 qapi/ui.json          | 22 ----------------------
 12 files changed, 49 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 34dae298ee..27832a1244 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -237,7 +237,6 @@
 #                   information (since 1.7)
 #
 # Since: 1.3
-#
 ##
 { 'struct': 'ImageInfo',
   'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
@@ -288,7 +287,6 @@
 #                       supports it
 #
 # Since: 1.4
-#
 ##
 { 'struct': 'ImageCheck',
   'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
@@ -328,7 +326,6 @@
 # @filename: filename that is referred to by @offset
 #
 # Since: 2.6
-#
 ##
 { 'struct': 'MapEntry',
   'data': {'start': 'int', 'length': 'int', 'data': 'bool',
@@ -445,7 +442,6 @@
 #                 has one or more dirty bitmaps) (Since 4.2)
 #
 # Since: 0.14
-#
 ##
 { 'struct': 'BlockDeviceInfo',
   'data': { 'file': 'str', '*node-name': 'str', 'ro': 'bool', 'drv': 'str',
diff --git a/qapi/block.json b/qapi/block.json
index e0f7898ed1..5de15c6070 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -300,7 +300,6 @@
 # @read-write: Makes the device writable
 #
 # Since: 2.3
-#
 ##
 { 'enum': 'BlockdevChangeReadOnlyMode',
   'data': ['retain', 'read-only', 'read-write'] }
diff --git a/qapi/char.json b/qapi/char.json
index 7b42151575..f0fd0d1c9f 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -413,7 +413,6 @@
 # @clipboard: enable/disable clipboard, default is disabled.
 #
 # Since: 6.1
-#
 ##
 { 'struct': 'ChardevQemuVDAgent',
   'data': { '*mouse': 'bool',
diff --git a/qapi/common.json b/qapi/common.json
index 412cc4f5ae..356db3f670 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -192,7 +192,6 @@
 # Keys to toggle input-linux between host and guest.
 #
 # Since: 4.0
-#
 ##
 { 'enum': 'GrabToggleKeys',
   'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
@@ -204,7 +203,6 @@
 # @human-readable-text: Formatted output intended for humans.
 #
 # Since: 6.2
-#
 ##
 { 'struct': 'HumanReadableText',
   'data': { 'human-readable-text': 'str' } }
diff --git a/qapi/control.json b/qapi/control.json
index 71a838d49e..8c9122ef7a 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -33,7 +33,6 @@
 #        all the QMP capabilities will be turned off by default.
 #
 # Since: 0.13
-#
 ##
 { 'command': 'qmp_capabilities',
   'data': { '*enable': [ 'QMPCapability' ] },
@@ -49,7 +48,6 @@
 #       (Please refer to qmp-spec.txt for more information on OOB)
 #
 # Since: 2.12
-#
 ##
 { 'enum': 'QMPCapability',
   'data': [ 'oob' ] }
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 829e70a168..aebe390ab7 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -364,7 +364,6 @@
 #                 password to use to retrieve current master key.
 #                 Defaults to the same secret that was used to open the image
 #
-#
 # Since 5.1
 ##
 { 'struct': 'QCryptoBlockAmendOptionsLUKS',
diff --git a/qapi/machine.json b/qapi/machine.json
index 9ec17b3992..20b1f0c748 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -77,7 +77,6 @@
 #          additional fields will be listed (since 3.0)
 #
 # Since: 2.12
-#
 ##
 { 'union'         : 'CpuInfoFast',
   'base'          : { 'cpu-index'    : 'int',
@@ -1020,7 +1019,6 @@
 #          Formula used: logical_vm_size = vm_ram_size - balloon_size
 #
 # Since: 0.14
-#
 ##
 { 'struct': 'BalloonInfo', 'data': {'actual': 'int' } }
 
diff --git a/qapi/migration.json b/qapi/migration.json
index fc1c157d3f..dd4dde6361 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -151,7 +151,6 @@
 #               (since 4.2)
 #
 # Since: 2.3
-#
 ##
 { 'enum': 'MigrationStatus',
   'data': [ 'none', 'setup', 'cancelling', 'cancelled',
@@ -166,7 +165,6 @@
 # @transferred: amount of bytes transferred to the target VM by VFIO devices
 #
 # Since: 5.2
-#
 ##
 { 'struct': 'VfioStats',
   'data': {'transferred': 'int' } }
@@ -546,7 +544,6 @@
 # @zstd: use zstd compression method.
 #
 # Since: 5.0
-#
 ##
 { 'enum': 'MultiFDCompression',
   'data': [ 'none', 'zlib',
@@ -1757,7 +1754,6 @@
 # @dirty-rate: dirty rate.
 #
 # Since: 6.2
-#
 ##
 { 'struct': 'DirtyRateVcpu',
   'data': { 'id': 'int', 'dirty-rate': 'int64' } }
@@ -1774,7 +1770,6 @@
 # @measured: the dirtyrate thread has measured and results are available.
 #
 # Since: 5.2
-#
 ##
 { 'enum': 'DirtyRateStatus',
   'data': [ 'unstarted', 'measuring', 'measured'] }
@@ -1791,7 +1786,6 @@
 # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
 #
 # Since: 6.2
-#
 ##
 { 'enum': 'DirtyRateMeasureMode',
   'data': ['page-sampling', 'dirty-ring', 'dirty-bitmap'] }
@@ -1821,7 +1815,6 @@
 #                   mode specified (Since 6.2)
 #
 # Since: 5.2
-#
 ##
 { 'struct': 'DirtyRateInfo',
   'data': {'*dirty-rate': 'int64',
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index ed4a468aab..ae2c483a68 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -110,7 +110,6 @@
 # @data: the measurement value encoded in base64
 #
 # Since: 2.12
-#
 ##
 { 'struct': 'SevLaunchMeasureInfo', 'data': {'data': 'str'},
   'if': 'TARGET_I386' }
@@ -194,7 +193,6 @@
 # @gpa: the guest physical address where secret will be injected.
 #
 # Since: 6.0
-#
 ##
 { 'command': 'sev-inject-launch-secret',
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
@@ -208,7 +206,6 @@
 #
 # @data:  guest attestation report (base64 encoded)
 #
-#
 # Since: 6.1
 ##
 { 'struct': 'SevAttestationReport',
diff --git a/qapi/replay.json b/qapi/replay.json
index 351898f60d..729470300d 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -40,7 +40,6 @@
 # @icount: current number of executed instructions.
 #
 # Since: 5.2
-#
 ##
 { 'struct': 'ReplayInfo',
   'data': { 'mode': 'ReplayMode', '*filename': 'str', 'icount': 'int' } }
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 15d6c9a2ed..a5d2db3b91 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -592,7 +592,6 @@
 # @guest: memory failure at guest memory,
 #
 # Since: 5.2
-#
 ##
 { 'enum': 'MemoryFailureRecipient',
   'data': [ 'hypervisor',
@@ -619,7 +618,6 @@
 #         to handle memory failures.
 #
 # Since: 5.2
-#
 ##
 { 'enum': 'MemoryFailureAction',
   'data': [ 'ignore',
@@ -639,7 +637,6 @@
 #             failure was still in progress.
 #
 # Since: 5.2
-#
 ##
 { 'struct': 'MemoryFailureFlags',
   'data': { 'action-required': 'bool',
diff --git a/qapi/ui.json b/qapi/ui.json
index 43e62efd76..0e903340fc 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -15,7 +15,6 @@
 # Display protocols which support changing password options.
 #
 # Since: 7.0
-#
 ##
 { 'enum': 'DisplayProtocol',
   'data': [ 'vnc', 'spice' ] }
@@ -32,7 +31,6 @@
 # @disconnect: disconnect existing clients
 #
 # Since: 7.0
-#
 ##
 { 'enum': 'SetPasswordAction',
   'data': [ 'keep', 'fail', 'disconnect' ] }
@@ -52,7 +50,6 @@
 #             For VNC, only 'keep' is currently implemented.
 #
 # Since: 7.0
-#
 ##
 { 'union': 'SetPasswordOptions',
   'base': { 'protocol': 'DisplayProtocol',
@@ -70,7 +67,6 @@
 #           Defaults to the first.
 #
 # Since: 7.0
-#
 ##
 { 'struct': 'SetPasswordOptionsVnc',
   'data': { '*display': 'str' } }
@@ -115,7 +111,6 @@
 #        sure you are on the same machine as the QEMU instance.
 #
 # Since: 7.0
-#
 ##
 { 'union': 'ExpirePasswordOptions',
   'base': { 'protocol': 'DisplayProtocol',
@@ -132,7 +127,6 @@
 #           Defaults to the first.
 #
 # Since: 7.0
-#
 ##
 
 { 'struct': 'ExpirePasswordOptionsVnc',
@@ -167,7 +161,6 @@
 # @ppm: PPM format
 #
 # Since: 7.1
-#
 ##
 { 'enum': 'ImageFormat',
   'data': ['ppm', 'png'] }
@@ -902,7 +895,6 @@
 # are effectively synonyms.
 #
 # Since: 1.3
-#
 ##
 { 'enum': 'QKeyCode',
   'data': [ 'unmapped',
@@ -1206,7 +1198,6 @@
 #               Since 3.1
 #
 # Since: 2.12
-#
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
@@ -1221,7 +1212,6 @@
 #              available node on the host.
 #
 # Since: 3.1
-#
 ##
 { 'struct'  : 'DisplayEGLHeadless',
   'data'    : { '*rendernode' : 'str' } }
@@ -1242,7 +1232,6 @@
 # @audiodev: Use the specified DBus audiodev to export audio.
 #
 # Since: 7.0
-#
 ##
 { 'struct'  : 'DisplayDBus',
   'data'    : { '*rendernode' : 'str',
@@ -1263,7 +1252,6 @@
 # @es: Use OpenGL with ES (embedded systems) Context.
 #
 # Since: 3.0
-#
 ##
 { 'enum'    : 'DisplayGLMode',
   'data'    : [ 'off', 'on', 'core', 'es' ] }
@@ -1276,7 +1264,6 @@
 # @charset:       Font charset used by guest (default: CP437).
 #
 # Since: 4.0
-#
 ##
 { 'struct'  : 'DisplayCurses',
   'data'    : { '*charset'       : 'str' } }
@@ -1346,7 +1333,6 @@
 # @dbus: Start a D-Bus service for the display. (Since 7.0)
 #
 # Since: 2.12
-#
 ##
 { 'enum'    : 'DisplayType',
   'data'    : [
@@ -1376,7 +1362,6 @@
 # @gl:            Enable OpenGL support (default: off).
 #
 # Since: 2.12
-#
 ##
 { 'union'   : 'DisplayOptions',
   'base'    : { 'type'           : 'DisplayType',
@@ -1403,7 +1388,6 @@
 # Returns: @DisplayOptions
 #
 # Since: 3.1
-#
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
@@ -1416,7 +1400,6 @@
 # @vnc: VNC display
 #
 # Since: 6.0
-#
 ##
 { 'enum': 'DisplayReloadType',
   'data': ['vnc'] }
@@ -1429,7 +1412,6 @@
 # @tls-certs: reload tls certs or not.
 #
 # Since: 6.0
-#
 ##
 { 'struct': 'DisplayReloadOptionsVNC',
   'data': { '*tls-certs': 'bool' } }
@@ -1442,7 +1424,6 @@
 # @type: Specify the display type.
 #
 # Since: 6.0
-#
 ##
 { 'union': 'DisplayReloadOptions',
   'base': {'type': 'DisplayReloadType'},
@@ -1477,7 +1458,6 @@
 # @vnc: VNC display
 #
 # Since: 7.1
-#
 ##
 { 'enum': 'DisplayUpdateType',
   'data': ['vnc'] }
@@ -1492,7 +1472,6 @@
 #             for websockets are not touched.
 #
 # Since: 7.1
-#
 ##
 { 'struct': 'DisplayUpdateOptionsVNC',
   'data': { '*addresses': ['SocketAddress'] } }
@@ -1505,7 +1484,6 @@
 # @type: Specify the display type.
 #
 # Since: 7.1
-#
 ##
 { 'union': 'DisplayUpdateOptions',
   'base': {'type': 'DisplayUpdateType'},
-- 
2.35.1


