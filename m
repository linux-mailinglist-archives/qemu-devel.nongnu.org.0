Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A7527F85
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:22:12 +0200 (CEST)
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVzW-0006pz-Ga
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGN-0000qT-V5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGJ-0001s3-OA
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4QDV8+kl8agCrvtD/a8BVz0fMtXcbmVVTkr3G8xIAo=;
 b=TeNtVhnPWi1bw/JCt2rXNHrVu9YZWhH1S2ozOwvx3RZAEe1oM0RLjaWt67Nt58cyqj3pxY
 ClppD3AN4CYxWDQf4Q68CxaZHiKnuHFQGK1grCV2XDXwLrHGUM34INKTnzmdjEXbDIY+/a
 mMuBOT0MQjdNBfshaKCJetBll4SFUP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-S3aYnmwsPCS4KCMEgc8BvQ-1; Mon, 16 May 2022 03:35:25 -0400
X-MC-Unique: S3aYnmwsPCS4KCMEgc8BvQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC61803D47;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD92492C14;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB29521E6930; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 05/11] qapi: Drop unnecessary empty lines in comments
Date: Mon, 16 May 2022 09:35:16 +0200
Message-Id: <20220516073522.3880774-6-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220503073737.84223-5-abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json  |  4 ----
 qapi/block.json       |  1 -
 qapi/char.json        |  1 -
 qapi/common.json      |  2 --
 qapi/control.json     |  2 --
 qapi/machine.json     |  2 --
 qapi/migration.json   |  7 -------
 qapi/misc-target.json |  3 ---
 qapi/replay.json      |  1 -
 qapi/run-state.json   |  3 ---
 qapi/ui.json          | 22 ----------------------
 11 files changed, 48 deletions(-)

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
diff --git a/qapi/machine.json b/qapi/machine.json
index 79901e1c09..c8f07c43cd 100644
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
@@ -1022,7 +1021,6 @@
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
2.35.3


