Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F096F1629
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLke-0008WR-JL; Fri, 28 Apr 2023 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkb-0008W8-Ns
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkS-00041C-L9
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MQhsKi3G87Tzl5paFP3m5AiFv3UrBGzopAGF6ZIa6M=;
 b=F5+4Ilav0wLVKH6Ik/PnUj80r4K/oFFtxlg7iqPqSCHw1k2egfQnpe52mSDPZ2/HUBDv5l
 b1VtRt73ddb9Vw//XdhDTmCAI4YMGtP8N4yuGMUJ/d3XfTFAnt+d+Yqbk6s+1RNDwNpDgf
 6l9EsIrEqRGU0At/KzUfk6R74tzg/oI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-0VrIxycMOYGll6u_byyUQg-1; Fri, 28 Apr 2023 06:54:37 -0400
X-MC-Unique: 0VrIxycMOYGll6u_byyUQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F42585A5B1;
 Fri, 28 Apr 2023 10:54:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A126A2027043;
 Fri, 28 Apr 2023 10:54:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8BDA21C6901; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 17/17] qapi: Reformat doc comments to conform to current
 conventions
Date: Fri, 28 Apr 2023 12:54:29 +0200
Message-Id: <20230428105429.1687850-18-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Change

    # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #        do eiusmod tempor incididunt ut labore et dolore magna aliqua.

to

    # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
    #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.

See recent commit "qapi: Relax doc string @name: description
indentation rules" for rationale.

Reflow paragraphs to 70 columns width, and consistently use two spaces
to separate sentences.

To check the generated documentation does not change, I compared the
generated HTML before and after this commit with "wdiff -3".  Finds no
differences.  Comparing with diff is not useful, as the reflown
paragraphs are visible there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/acpi.json           |   50 +-
 qapi/audio.json          |   85 +-
 qapi/authz.json          |   29 +-
 qapi/block-core.json     | 2801 ++++++++++++++++++++------------------
 qapi/block-export.json   |  242 ++--
 qapi/block.json          |  214 +--
 qapi/char.json           |  134 +-
 qapi/common.json         |   19 +-
 qapi/compat.json         |   13 +-
 qapi/control.json        |   59 +-
 qapi/crypto.json         |  261 ++--
 qapi/cryptodev.json      |    3 +
 qapi/cxl.json            |   74 +-
 qapi/dump.json           |   78 +-
 qapi/error.json          |    6 +-
 qapi/introspect.json     |   89 +-
 qapi/job.json            |  139 +-
 qapi/machine-target.json |  303 +++--
 qapi/machine.json        |  389 +++---
 qapi/migration.json      | 1117 ++++++++-------
 qapi/misc-target.json    |   67 +-
 qapi/misc.json           |  180 ++-
 qapi/net.json            |  260 ++--
 qapi/pci.json            |   35 +-
 qapi/qapi-schema.json    |   25 +-
 qapi/qdev.json           |   63 +-
 qapi/qom.json            |  404 +++---
 qapi/rdma.json           |    1 -
 qapi/replay.json         |   48 +-
 qapi/rocker.json         |   20 +-
 qapi/run-state.json      |  215 +--
 qapi/sockets.json        |   50 +-
 qapi/stats.json          |   83 +-
 qapi/tpm.json            |   20 +-
 qapi/trace.json          |   34 +-
 qapi/transaction.json    |   87 +-
 qapi/ui.json             |  435 +++---
 qapi/virtio.json         |   84 +-
 qapi/yank.json           |   42 +-
 39 files changed, 4322 insertions(+), 3936 deletions(-)

diff --git a/qapi/acpi.json b/qapi/acpi.json
index d148f6db9f..e0739bd6ae 100644
--- a/qapi/acpi.json
+++ b/qapi/acpi.json
@@ -14,18 +14,19 @@
 #
 # Specify an ACPI table on the command line to load.
 #
-# At most one of @file and @data can be specified. The list of files specified
-# by any one of them is loaded and concatenated in order. If both are omitted,
-# @data is implied.
+# At most one of @file and @data can be specified.  The list of files
+# specified by any one of them is loaded and concatenated in order.
+# If both are omitted, @data is implied.
 #
-# Other fields / optargs can be used to override fields of the generic ACPI
-# table header; refer to the ACPI specification 5.0, section 5.2.6 System
-# Description Table Header. If a header field is not overridden, then the
-# corresponding value from the concatenated blob is used (in case of @file), or
-# it is filled in with a hard-coded value (in case of @data).
+# Other fields / optargs can be used to override fields of the generic
+# ACPI table header; refer to the ACPI specification 5.0, section
+# 5.2.6 System Description Table Header.  If a header field is not
+# overridden, then the corresponding value from the concatenated blob
+# is used (in case of @file), or it is filled in with a hard-coded
+# value (in case of @data).
 #
-# String fields are copied into the matching ACPI member from lowest address
-# upwards, and silently truncated / NUL-padded to length.
+# String fields are copied into the matching ACPI member from lowest
+# address upwards, and silently truncated / NUL-padded to length.
 #
 # @sig: table signature / identifier (4 bytes)
 #
@@ -38,20 +39,20 @@
 # @oem_rev: OEM-supplied revision number (4 bytes)
 #
 # @asl_compiler_id: identifier of the utility that created the table
-#                   (4 bytes)
+#     (4 bytes)
 #
 # @asl_compiler_rev: revision number of the utility that created the
-#                    table (4 bytes)
+#     table (4 bytes)
 #
-# @file: colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob is expected to
-#        have an ACPI table header. At least one file is required. This field
-#        excludes @data.
+# @file: colon (:) separated list of pathnames to load and concatenate
+#     as table data.  The resultant binary blob is expected to have an
+#     ACPI table header.  At least one file is required.  This field
+#     excludes @data.
 #
-# @data: colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob must not have an
-#        ACPI table header. At least one file is required. This field excludes
-#        @file.
+# @data: colon (:) separated list of pathnames to load and concatenate
+#     as table data.  The resultant binary blob must not have an ACPI
+#     table header.  At least one file is required.  This field
+#     excludes @file.
 #
 # Since: 1.5
 ##
@@ -71,6 +72,7 @@
 # @ACPISlotType:
 #
 # @DIMM: memory slot
+#
 # @CPU: logical CPU slot (since 2.7)
 ##
 { 'enum': 'ACPISlotType', 'data': [ 'DIMM', 'CPU' ] }
@@ -78,9 +80,9 @@
 ##
 # @ACPIOSTInfo:
 #
-# OSPM Status Indication for a device
-# For description of possible values of @source and @status fields
-# see "_OST (OSPM Status Indication)" chapter of ACPI5.0 spec.
+# OSPM Status Indication for a device For description of possible
+# values of @source and @status fields see "_OST (OSPM Status
+# Indication)" chapter of ACPI5.0 spec.
 #
 # @device: device ID associated with slot
 #
@@ -117,7 +119,6 @@
 #                  { "slot": "2", "slot-type": "DIMM", "source": 0, "status": 0},
 #                  { "slot": "3", "slot-type": "DIMM", "source": 0, "status": 0}
 #    ]}
-#
 ##
 { 'command': 'query-acpi-ospm-status', 'returns': ['ACPIOSTInfo'] }
 
@@ -136,7 +137,6 @@
 #      "data": { "info": { "device": "d1", "slot": "0",
 #                          "slot-type": "DIMM", "source": 1, "status": 0 } },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'ACPI_DEVICE_OST',
      'data': { 'info': 'ACPIOSTInfo' } }
diff --git a/qapi/audio.json b/qapi/audio.json
index 4e54c00f51..c17edac604 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -16,24 +16,24 @@
 # General audio backend options that are used for both playback and
 # recording.
 #
-# @mixing-engine: use QEMU's mixing engine to mix all streams inside QEMU and
-#                 convert audio formats when not supported by the backend. When
-#                 set to off, fixed-settings must be also off (default on,
-#                 since 4.2)
+# @mixing-engine: use QEMU's mixing engine to mix all streams inside
+#     QEMU and convert audio formats when not supported by the
+#     backend.  When set to off, fixed-settings must be also off
+#     (default on, since 4.2)
 #
-# @fixed-settings: use fixed settings for host input/output. When off,
-#                  frequency, channels and format must not be
-#                  specified (default true)
+# @fixed-settings: use fixed settings for host input/output.  When
+#     off, frequency, channels and format must not be specified
+#     (default true)
 #
-# @frequency: frequency to use when using fixed settings
-#             (default 44100)
+# @frequency: frequency to use when using fixed settings (default
+#     44100)
 #
 # @channels: number of channels when using fixed settings (default 2)
 #
 # @voices: number of voices to use (default 1)
 #
-# @format: sample format to use when using fixed settings
-#          (default s16)
+# @format: sample format to use when using fixed settings (default
+#     s16)
 #
 # @buffer-length: the buffer length in microseconds
 #
@@ -76,7 +76,7 @@
 # @period-length: the period length in microseconds
 #
 # @try-poll: attempt to use poll mode, falling back to non-polling
-#            access on failure (default true)
+#     access on failure (default true)
 #
 # Since: 4.0
 ##
@@ -131,8 +131,8 @@
 ##
 # @AudiodevCoreaudioPerDirectionOptions:
 #
-# Options of the Core Audio backend that are used for both playback and
-# recording.
+# Options of the Core Audio backend that are used for both playback
+# and recording.
 #
 # @buffer-count: number of buffers
 #
@@ -168,8 +168,8 @@
 #
 # @out: options of the playback stream
 #
-# @latency: add extra latency to playback in microseconds
-#           (default 10000)
+# @latency: add extra latency to playback in microseconds (default
+#     10000)
 #
 # Since: 4.0
 ##
@@ -185,21 +185,22 @@
 # Options of the JACK backend that are used for both playback and
 # recording.
 #
-# @server-name: select from among several possible concurrent server instances
-#               (default: environment variable $JACK_DEFAULT_SERVER if set, else "default")
+# @server-name: select from among several possible concurrent server
+#     instances (default: environment variable $JACK_DEFAULT_SERVER if
+#     set, else "default")
 #
-# @client-name: the client name to use. The server will modify this name to
-#               create a unique variant, if needed unless @exact-name is true (default: the
-#               guest's name)
+# @client-name: the client name to use.  The server will modify this
+#     name to create a unique variant, if needed unless @exact-name is
+#     true (default: the guest's name)
 #
-# @connect-ports: if set, a regular expression of JACK client port name(s) to
-#                 monitor for and automatically connect to
+# @connect-ports: if set, a regular expression of JACK client port
+#     name(s) to monitor for and automatically connect to
 #
-# @start-server: start a jack server process if one is not already present
-#                (default: false)
+# @start-server: start a jack server process if one is not already
+#     present (default: false)
 #
-# @exact-name: use the exact name requested otherwise JACK automatically
-#              generates a unique one, if needed (default: false)
+# @exact-name: use the exact name requested otherwise JACK
+#     automatically generates a unique one, if needed (default: false)
 #
 # Since: 5.1
 ##
@@ -239,7 +240,7 @@
 # @buffer-count: number of buffers
 #
 # @try-poll: attempt to use poll mode, falling back to non-polling
-#            access on failure (default true)
+#     access on failure (default true)
 #
 # Since: 4.0
 ##
@@ -260,15 +261,15 @@
 # @out: options of the playback stream
 #
 # @try-mmap: try using memory-mapped access, falling back to
-#            non-memory-mapped access on failure (default true)
+#     non-memory-mapped access on failure (default true)
 #
-# @exclusive: open device in exclusive mode (vmix won't work)
-#             (default false)
+# @exclusive: open device in exclusive mode (vmix won't work) (default
+#     false)
 #
 # @dsp-policy: set the timing policy of the device (between 0 and 10,
-#              where smaller number means smaller latency but higher
-#              CPU usage) or -1 to use fragment mode (option ignored
-#              on some platforms) (default 5)
+#     where smaller number means smaller latency but higher CPU usage)
+#     or -1 to use fragment mode (option ignored on some platforms)
+#     (default 5)
 #
 # Since: 4.0
 ##
@@ -283,18 +284,18 @@
 ##
 # @AudiodevPaPerDirectionOptions:
 #
-# Options of the Pulseaudio backend that are used for both playback and
-# recording.
+# Options of the Pulseaudio backend that are used for both playback
+# and recording.
 #
 # @name: name of the sink/source to use
 #
 # @stream-name: name of the PulseAudio stream created by qemu.  Can be
-#               used to identify the stream in PulseAudio when you
-#               create multiple PulseAudio devices or run multiple qemu
-#               instances (default: audiodev's id, since 4.2)
+#     used to identify the stream in PulseAudio when you create
+#     multiple PulseAudio devices or run multiple qemu instances
+#     (default: audiodev's id, since 4.2)
 #
 # @latency: latency you want PulseAudio to achieve in microseconds
-#           (default 15000)
+#     (default 15000)
 #
 # Since: 4.0
 ##
@@ -430,7 +431,8 @@
 #
 # @driver: the backend driver to use
 #
-# @timer-period: timer period (in microseconds, 0: use lowest possible)
+# @timer-period: timer period (in microseconds, 0: use lowest
+#     possible)
 #
 # Since: 4.0
 ##
@@ -472,7 +474,6 @@
 # Returns: array of @Audiodev
 #
 # Since: 8.0
-#
 ##
 { 'command': 'query-audiodevs',
   'returns': ['Audiodev'] }
diff --git a/qapi/authz.json b/qapi/authz.json
index 51845e37cc..7fc6e3032e 100644
--- a/qapi/authz.json
+++ b/qapi/authz.json
@@ -11,6 +11,7 @@
 # The authorization policy result
 #
 # @deny: deny access
+#
 # @allow: allow access
 #
 # Since: 4.0
@@ -25,6 +26,7 @@
 # The authorization policy match format
 #
 # @exact: an exact string match
+#
 # @glob: string with ? and * shell wildcard support
 #
 # Since: 4.0
@@ -39,7 +41,9 @@
 # A single authorization rule.
 #
 # @match: a string or glob to match against a user identity
+#
 # @policy: the result to return if @match evaluates to true
+#
 # @format: the format of the @match rule (default 'exact')
 #
 # Since: 4.0
@@ -54,7 +58,8 @@
 #
 # Properties for authz-list objects.
 #
-# @policy: Default policy to apply when no rule matches (default: deny)
+# @policy: Default policy to apply when no rule matches (default:
+#     deny)
 #
 # @rules: Authorization rules based on matching user
 #
@@ -69,14 +74,14 @@
 #
 # Properties for authz-listfile objects.
 #
-# @filename: File name to load the configuration from. The file must
-#            contain valid JSON for AuthZListProperties.
+# @filename: File name to load the configuration from.  The file must
+#     contain valid JSON for AuthZListProperties.
 #
-# @refresh: If true, inotify is used to monitor the file, automatically
-#           reloading changes. If an error occurs during reloading, all
-#           authorizations will fail until the file is next successfully
-#           loaded. (default: true if the binary was built with
-#           CONFIG_INOTIFY1, false otherwise)
+# @refresh: If true, inotify is used to monitor the file,
+#     automatically reloading changes.  If an error occurs during
+#     reloading, all authorizations will fail until the file is next
+#     successfully loaded.  (default: true if the binary was built
+#     with CONFIG_INOTIFY1, false otherwise)
 #
 # Since: 4.0
 ##
@@ -101,10 +106,10 @@
 #
 # Properties for authz-simple objects.
 #
-# @identity: Identifies the allowed user. Its format depends on the network
-#            service that authorization object is associated with. For
-#            authorizing based on TLS x509 certificates, the identity must be
-#            the x509 distinguished name.
+# @identity: Identifies the allowed user.  Its format depends on the
+#     network service that authorization object is associated with.
+#     For authorizing based on TLS x509 certificates, the identity
+#     must be the x509 distinguished name.
 #
 # Since: 4.0
 ##
diff --git a/qapi/block-core.json b/qapi/block-core.json
index b57978957f..187e35d473 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -25,15 +25,16 @@
 #
 # @vm-clock-sec: VM clock relative to boot in seconds
 #
-# @vm-clock-nsec: fractional part in nano seconds to be used with vm-clock-sec
+# @vm-clock-nsec: fractional part in nano seconds to be used with
+#     vm-clock-sec
 #
-# @icount: Current instruction count. Appears when execution record/replay
-#          is enabled. Used for "time-traveling" to match the moment
-#          in the recorded execution with the snapshots. This counter may
-#          be obtained through @query-replay command (since 5.2)
+# @icount: Current instruction count.  Appears when execution
+#     record/replay is enabled.  Used for "time-traveling" to match
+#     the moment in the recorded execution with the snapshots.  This
+#     counter may be obtained through @query-replay command (since
+#     5.2)
 #
 # Since: 1.3
-#
 ##
 { 'struct': 'SnapshotInfo',
   'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
@@ -66,25 +67,26 @@
 #
 # @compat: compatibility level
 #
-# @data-file: the filename of the external data file that is stored in the
-#             image and used as a default for opening the image (since: 4.0)
+# @data-file: the filename of the external data file that is stored in
+#     the image and used as a default for opening the image
+#     (since: 4.0)
 #
 # @data-file-raw: True if the external data file must stay valid as a
-#                 standalone (read-only) raw image without looking at qcow2
-#                 metadata (since: 4.0)
+#     standalone (read-only) raw image without looking at qcow2
+#     metadata (since: 4.0)
 #
-# @extended-l2: true if the image has extended L2 entries; only valid for
-#               compat >= 1.1 (since 5.2)
+# @extended-l2: true if the image has extended L2 entries; only valid
+#     for compat >= 1.1 (since 5.2)
 #
 # @lazy-refcounts: on or off; only valid for compat >= 1.1
 #
 # @corrupt: true if the image has been marked corrupt; only valid for
-#           compat >= 1.1 (since 2.2)
+#     compat >= 1.1 (since 2.2)
 #
 # @refcount-bits: width of a refcount entry in bits (since 2.3)
 #
-# @encrypt: details about encryption parameters; only set if image
-#           is encrypted (since 2.10)
+# @encrypt: details about encryption parameters; only set if image is
+#     encrypted (since 2.10)
 #
 # @bitmaps: A list of qcow2 bitmap details (since 4.0)
 #
@@ -134,7 +136,7 @@
 #
 # @filename: Name of the extent file
 #
-# @format: Extent type (e.g. FLAT or SPARSE)
+# @format: Extent type (e.g.  FLAT or SPARSE)
 #
 # @virtual-size: Number of bytes covered by this extent
 #
@@ -181,7 +183,9 @@
 # @ImageInfoSpecificKind:
 #
 # @luks: Since 2.7
+#
 # @rbd: Since 6.1
+#
 # @file: Since 8.0
 #
 # Since: 1.7
@@ -235,7 +239,8 @@
 ##
 # @ImageInfoSpecific:
 #
-# A discriminated record of image format specific information structures.
+# A discriminated record of image format specific information
+# structures.
 #
 # Since: 1.7
 ##
@@ -280,7 +285,7 @@
 # @snapshots: list of VM snapshots
 #
 # @format-specific: structure supplying additional format-specific
-#                   information (since 1.7)
+#     information (since 1.7)
 #
 # Since: 8.0
 ##
@@ -295,7 +300,8 @@
 ##
 # @ImageInfo:
 #
-# Information about a QEMU image file, and potentially its backing image
+# Information about a QEMU image file, and potentially its backing
+# image
 #
 # @backing-image: info of the backing image
 #
@@ -310,11 +316,12 @@
 ##
 # @BlockChildInfo:
 #
-# Information about all nodes in the block graph starting at some node,
-# annotated with information about that node in relation to its parent.
+# Information about all nodes in the block graph starting at some
+# node, annotated with information about that node in relation to its
+# parent.
 #
-# @name: Child name of the root node in the BlockGraphInfo struct, in its role
-#        as the child of some undescribed parent node
+# @name: Child name of the root node in the BlockGraphInfo struct, in
+#     its role as the child of some undescribed parent node
 #
 # @info: Block graph information starting at this node
 #
@@ -329,10 +336,9 @@
 ##
 # @BlockGraphInfo:
 #
-# Information about all nodes in a block (sub)graph in the form of BlockNodeInfo
-# data.
-# The base BlockNodeInfo struct contains the information for the (sub)graph's
-# root node.
+# Information about all nodes in a block (sub)graph in the form of
+# BlockNodeInfo data.  The base BlockNodeInfo struct contains the
+# information for the (sub)graph's root node.
 #
 # @children: Array of links to this node's child nodes' information
 #
@@ -354,32 +360,28 @@
 # @check-errors: number of unexpected errors occurred during check
 #
 # @image-end-offset: offset (in bytes) where the image ends, this
-#                    field is present if the driver for the image format
-#                    supports it
+#     field is present if the driver for the image format supports it
 #
 # @corruptions: number of corruptions found during the check if any
 #
 # @leaks: number of leaks found during the check if any
 #
-# @corruptions-fixed: number of corruptions fixed during the check
-#                     if any
+# @corruptions-fixed: number of corruptions fixed during the check if
+#     any
 #
 # @leaks-fixed: number of leaks fixed during the check if any
 #
-# @total-clusters: total number of clusters, this field is present
-#                  if the driver for the image format supports it
+# @total-clusters: total number of clusters, this field is present if
+#     the driver for the image format supports it
 #
-# @allocated-clusters: total number of allocated clusters, this
-#                      field is present if the driver for the image format
-#                      supports it
+# @allocated-clusters: total number of allocated clusters, this field
+#     is present if the driver for the image format supports it
 #
 # @fragmented-clusters: total number of fragmented clusters, this
-#                       field is present if the driver for the image format
-#                       supports it
+#     field is present if the driver for the image format supports it
 #
 # @compressed-clusters: total number of compressed clusters, this
-#                       field is present if the driver for the image format
-#                       supports it
+#     field is present if the driver for the image format supports it
 #
 # Since: 1.4
 ##
@@ -396,27 +398,27 @@
 # Mapping information from a virtual block range to a host file range
 #
 # @start: virtual (guest) offset of the first byte described by this
-#         entry
+#     entry
 #
 # @length: the number of bytes of the mapped virtual range
 #
 # @data: reading the image will actually read data from a file (in
-#        particular, if @offset is present this means that the sectors
-#        are not simply preallocated, but contain actual data in raw
-#        format)
+#     particular, if @offset is present this means that the sectors
+#     are not simply preallocated, but contain actual data in raw
+#     format)
 #
 # @zero: whether the virtual blocks read as zeroes
 #
 # @depth: number of layers (0 = top image, 1 = top image's backing
-#         file, ..., n - 1 = bottom image (where n is the number of
-#         images in the chain)) before reaching one for which the
-#         range is allocated
+#     file, ..., n - 1 = bottom image (where n is the number of images
+#     in the chain)) before reaching one for which the range is
+#     allocated
 #
-# @present: true if this layer provides the data, false if adding a backing
-#           layer could impact this region (since 6.1)
+# @present: true if this layer provides the data, false if adding a
+#     backing layer could impact this region (since 6.1)
 #
 # @offset: if present, the image file stores the data for this range
-#          in raw format at the given (host) offset
+#     in raw format at the given (host) offset
 #
 # @filename: filename that is referred to by @offset
 #
@@ -433,7 +435,9 @@
 # Cache mode information for a block device
 #
 # @writeback: true if writeback mode is enabled
+#
 # @direct: true if the host page cache is bypassed (O_DIRECT)
+#
 # @no-flush: true if flush requests are ignored for the device
 #
 # Since: 2.3
@@ -454,21 +458,19 @@
 #
 # @ro: true if the backing device was open read-only
 #
-# @drv: the name of the block format used to open the backing device. As of
-#       0.14 this can be: 'blkdebug', 'bochs', 'cloop', 'cow', 'dmg',
-#       'file', 'file', 'ftp', 'ftps', 'host_cdrom', 'host_device',
-#       'http', 'https', 'luks', 'nbd', 'parallels', 'qcow',
-#       'qcow2', 'raw', 'vdi', 'vmdk', 'vpc', 'vvfat'
-#       2.2: 'archipelago' added, 'cow' dropped
-#       2.3: 'host_floppy' deprecated
-#       2.5: 'host_floppy' dropped
-#       2.6: 'luks' added
-#       2.8: 'replication' added, 'tftp' dropped
-#       2.9: 'archipelago' dropped
+# @drv: the name of the block format used to open the backing device.
+#     As of 0.14 this can be: 'blkdebug', 'bochs', 'cloop', 'cow',
+#     'dmg', 'file', 'file', 'ftp', 'ftps', 'host_cdrom',
+#     'host_device', 'http', 'https', 'luks', 'nbd', 'parallels',
+#     'qcow', 'qcow2', 'raw', 'vdi', 'vmdk', 'vpc', 'vvfat' 2.2:
+#     'archipelago' added, 'cow' dropped 2.3: 'host_floppy' deprecated
+#     2.5: 'host_floppy' dropped 2.6: 'luks' added 2.8: 'replication'
+#     added, 'tftp' dropped 2.9: 'archipelago' dropped
 #
 # @backing_file: the name of the backing file (for copy-on-write)
 #
-# @backing_file_depth: number of files in the backing file chain (since: 1.2)
+# @backing_file_depth: number of files in the backing file chain
+#     (since: 1.2)
 #
 # @encrypted: true if the backing device is encrypted
 #
@@ -488,41 +490,40 @@
 #
 # @image: the info of image used (since: 1.6)
 #
-# @bps_max: total throughput limit during bursts, in bytes
-#           (Since 1.7)
+# @bps_max: total throughput limit during bursts, in bytes (Since 1.7)
 #
-# @bps_rd_max: read throughput limit during bursts, in bytes
-#              (Since 1.7)
+# @bps_rd_max: read throughput limit during bursts, in bytes (Since
+#     1.7)
 #
-# @bps_wr_max: write throughput limit during bursts, in bytes
-#              (Since 1.7)
+# @bps_wr_max: write throughput limit during bursts, in bytes (Since
+#     1.7)
 #
 # @iops_max: total I/O operations per second during bursts, in bytes
-#            (Since 1.7)
+#     (Since 1.7)
 #
 # @iops_rd_max: read I/O operations per second during bursts, in bytes
-#               (Since 1.7)
+#     (Since 1.7)
 #
 # @iops_wr_max: write I/O operations per second during bursts, in
-#               bytes (Since 1.7)
+#     bytes (Since 1.7)
 #
 # @bps_max_length: maximum length of the @bps_max burst period, in
-#                  seconds. (Since 2.6)
+#     seconds.  (Since 2.6)
 #
 # @bps_rd_max_length: maximum length of the @bps_rd_max burst period,
-#                     in seconds. (Since 2.6)
+#     in seconds.  (Since 2.6)
 #
 # @bps_wr_max_length: maximum length of the @bps_wr_max burst period,
-#                     in seconds. (Since 2.6)
+#     in seconds.  (Since 2.6)
 #
 # @iops_max_length: maximum length of the @iops burst period, in
-#                   seconds. (Since 2.6)
+#     seconds.  (Since 2.6)
 #
 # @iops_rd_max_length: maximum length of the @iops_rd_max burst
-#                      period, in seconds. (Since 2.6)
+#     period, in seconds.  (Since 2.6)
 #
 # @iops_wr_max_length: maximum length of the @iops_wr_max burst
-#                      period, in seconds. (Since 2.6)
+#     period, in seconds.  (Since 2.6)
 #
 # @iops_size: an I/O size in bytes (Since 1.7)
 #
@@ -530,11 +531,11 @@
 #
 # @cache: the cache mode used for the block device (since: 2.3)
 #
-# @write_threshold: configured write threshold for the device.
-#                   0 if disabled. (Since 2.3)
+# @write_threshold: configured write threshold for the device.  0 if
+#     disabled.  (Since 2.3)
 #
-# @dirty-bitmaps: dirty bitmaps information (only present if node
-#                 has one or more dirty bitmaps) (Since 4.2)
+# @dirty-bitmaps: dirty bitmaps information (only present if node has
+#     one or more dirty bitmaps) (Since 4.2)
 #
 # Since: 0.14
 ##
@@ -564,7 +565,8 @@
 #
 # @failed: The last I/O operation has failed
 #
-# @nospace: The last I/O operation has failed due to a no-space condition
+# @nospace: The last I/O operation has failed due to a no-space
+#     condition
 #
 # Since: 1.0
 ##
@@ -581,20 +583,20 @@
 #
 # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
 #
-# @recording: true if the bitmap is recording new writes from the guest.
-#             (since 4.0)
+# @recording: true if the bitmap is recording new writes from the
+#     guest.  (since 4.0)
 #
 # @busy: true if the bitmap is in-use by some operation (NBD or jobs)
-#        and cannot be modified via QMP or used by another operation.
-#        (since 4.0)
+#     and cannot be modified via QMP or used by another operation.
+#     (since 4.0)
 #
-# @persistent: true if the bitmap was stored on disk, is scheduled to be stored
-#              on disk, or both. (since 4.0)
+# @persistent: true if the bitmap was stored on disk, is scheduled to
+#     be stored on disk, or both.  (since 4.0)
 #
-# @inconsistent: true if this is a persistent bitmap that was improperly
-#                stored. Implies @persistent to be true; @recording and
-#                @busy to be false. This bitmap cannot be used. To remove
-#                it, use @block-dirty-bitmap-remove. (Since 4.0)
+# @inconsistent: true if this is a persistent bitmap that was
+#     improperly stored.  Implies @persistent to be true; @recording
+#     and @busy to be false.  This bitmap cannot be used.  To remove
+#     it, use @block-dirty-bitmap-remove.  (Since 4.0)
 #
 # Since: 1.3
 ##
@@ -608,14 +610,14 @@
 #
 # An enumeration of flags that a bitmap can report to the user.
 #
-# @in-use: This flag is set by any process actively modifying the qcow2 file,
-#          and cleared when the updated bitmap is flushed to the qcow2 image.
-#          The presence of this flag in an offline image means that the bitmap
-#          was not saved correctly after its last usage, and may contain
-#          inconsistent data.
+# @in-use: This flag is set by any process actively modifying the
+#     qcow2 file, and cleared when the updated bitmap is flushed to
+#     the qcow2 image.  The presence of this flag in an offline image
+#     means that the bitmap was not saved correctly after its last
+#     usage, and may contain inconsistent data.
 #
-# @auto: The bitmap must reflect all changes of the virtual disk by any
-#        application that would write to this qcow2 file.
+# @auto: The bitmap must reflect all changes of the virtual disk by
+#     any application that would write to this qcow2 file.
 #
 # Since: 4.0
 ##
@@ -644,15 +646,16 @@
 #
 # Block latency histogram.
 #
-# @boundaries: list of interval boundary values in nanoseconds, all greater
-#              than zero and in ascending order.
-#              For example, the list [10, 50, 100] produces the following
-#              histogram intervals: [0, 10), [10, 50), [50, 100), [100, +inf).
+# @boundaries: list of interval boundary values in nanoseconds, all
+#     greater than zero and in ascending order.  For example, the list
+#     [10, 50, 100] produces the following histogram intervals: [0,
+#     10), [10, 50), [50, 100), [100, +inf).
 #
-# @bins: list of io request counts corresponding to histogram intervals.
-#        len(@bins) = len(@boundaries) + 1
-#        For the example above, @bins may be something like [3, 1, 5, 2],
-#        and corresponding histogram looks like:
+# @bins: list of io request counts corresponding to histogram
+#     intervals.
+#     len(@bins) = len(@boundaries) + 1
+#     For the example above, @bins may be something like [3, 1, 5, 2],
+#     and corresponding histogram looks like:
 #
 # ::
 #
@@ -672,32 +675,32 @@
 ##
 # @BlockInfo:
 #
-# Block device information.  This structure describes a virtual device and
-# the backing device associated with it.
+# Block device information.  This structure describes a virtual device
+# and the backing device associated with it.
 #
 # @device: The device name associated with the virtual device.
 #
-# @qdev: The qdev ID, or if no ID is assigned, the QOM path of the block
-#        device. (since 2.10)
+# @qdev: The qdev ID, or if no ID is assigned, the QOM path of the
+#     block device.  (since 2.10)
 #
-# @type: This field is returned only for compatibility reasons, it should
-#        not be used (always returns 'unknown')
+# @type: This field is returned only for compatibility reasons, it
+#     should not be used (always returns 'unknown')
 #
 # @removable: True if the device supports removable media.
 #
-# @locked: True if the guest has locked this device from having its media
-#          removed
+# @locked: True if the guest has locked this device from having its
+#     media removed
 #
-# @tray_open: True if the device's tray is open
-#             (only present if it has a tray)
+# @tray_open: True if the device's tray is open (only present if it
+#     has a tray)
 #
-# @io-status: @BlockDeviceIoStatus. Only present if the device
-#             supports it and the VM is configured to stop on errors
-#             (supported device models: virtio-blk, IDE, SCSI except
-#             scsi-generic)
+# @io-status: @BlockDeviceIoStatus.  Only present if the device
+#     supports it and the VM is configured to stop on errors
+#     (supported device models: virtio-blk, IDE, SCSI except
+#     scsi-generic)
 #
 # @inserted: @BlockDeviceInfo describing the device if media is
-#            present
+#     present
 #
 # Since: 0.14
 ##
@@ -709,28 +712,31 @@
 ##
 # @BlockMeasureInfo:
 #
-# Image file size calculation information.  This structure describes the size
-# requirements for creating a new image file.
+# Image file size calculation information.  This structure describes
+# the size requirements for creating a new image file.
 #
-# The size requirements depend on the new image file format.  File size always
-# equals virtual disk size for the 'raw' format, even for sparse POSIX files.
-# Compact formats such as 'qcow2' represent unallocated and zero regions
-# efficiently so file size may be smaller than virtual disk size.
+# The size requirements depend on the new image file format.  File
+# size always equals virtual disk size for the 'raw' format, even for
+# sparse POSIX files.  Compact formats such as 'qcow2' represent
+# unallocated and zero regions efficiently so file size may be smaller
+# than virtual disk size.
 #
-# The values are upper bounds that are guaranteed to fit the new image file.
-# Subsequent modification, such as internal snapshot or further bitmap
-# creation, may require additional space and is not covered here.
+# The values are upper bounds that are guaranteed to fit the new image
+# file.  Subsequent modification, such as internal snapshot or further
+# bitmap creation, may require additional space and is not covered
+# here.
 #
-# @required: Size required for a new image file, in bytes, when copying just
-#            allocated guest-visible contents.
+# @required: Size required for a new image file, in bytes, when
+#     copying just allocated guest-visible contents.
 #
-# @fully-allocated: Image file size, in bytes, once data has been written
-#                   to all sectors, when copying just guest-visible contents.
+# @fully-allocated: Image file size, in bytes, once data has been
+#     written to all sectors, when copying just guest-visible
+#     contents.
 #
-# @bitmaps: Additional size required if all the top-level bitmap metadata
-#           in the source image were to be copied to the destination,
-#           present only when source and destination both support
-#           persistent bitmaps. (since 5.1)
+# @bitmaps: Additional size required if all the top-level bitmap
+#     metadata in the source image were to be copied to the
+#     destination, present only when source and destination both
+#     support persistent bitmaps.  (since 5.1)
 #
 # Since: 2.10
 ##
@@ -742,8 +748,8 @@
 #
 # Get a list of BlockInfo for all virtual block devices.
 #
-# Returns: a list of @BlockInfo describing each virtual block device. Filter
-#          nodes that were created implicitly are skipped over.
+# Returns: a list of @BlockInfo describing each virtual block device.
+#     Filter nodes that were created implicitly are skipped over.
 #
 # Since: 0.14
 #
@@ -830,7 +836,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-block', 'returns': ['BlockInfo'],
   'allow-preconfig': true }
@@ -840,41 +845,41 @@
 #
 # Statistics of a block device during a given interval of time.
 #
-# @interval_length: Interval used for calculating the statistics,
-#                   in seconds.
+# @interval_length: Interval used for calculating the statistics, in
+#     seconds.
 #
 # @min_rd_latency_ns: Minimum latency of read operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @min_wr_latency_ns: Minimum latency of write operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @min_flush_latency_ns: Minimum latency of flush operations in the
-#                        defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @max_rd_latency_ns: Maximum latency of read operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @max_wr_latency_ns: Maximum latency of write operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @max_flush_latency_ns: Maximum latency of flush operations in the
-#                        defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @avg_rd_latency_ns: Average latency of read operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @avg_wr_latency_ns: Average latency of write operations in the
-#                     defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
 # @avg_flush_latency_ns: Average latency of flush operations in the
-#                        defined interval, in nanoseconds.
+#     defined interval, in nanoseconds.
 #
-# @avg_rd_queue_depth: Average number of pending read operations
-#                      in the defined interval.
+# @avg_rd_queue_depth: Average number of pending read operations in
+#     the defined interval.
 #
-# @avg_wr_queue_depth: Average number of pending write operations
-#                      in the defined interval.
+# @avg_wr_queue_depth: Average number of pending write operations in
+#     the defined interval.
 #
 # Since: 2.5
 ##
@@ -897,82 +902,86 @@
 #
 # @unmap_bytes: The number of bytes unmapped by the device (Since 4.2)
 #
-# @rd_operations: The number of read operations performed by the device.
+# @rd_operations: The number of read operations performed by the
+#     device.
 #
-# @wr_operations: The number of write operations performed by the device.
+# @wr_operations: The number of write operations performed by the
+#     device.
 #
-# @flush_operations: The number of cache flush operations performed by the
-#                    device (since 0.15)
+# @flush_operations: The number of cache flush operations performed by
+#     the device (since 0.15)
 #
-# @unmap_operations: The number of unmap operations performed by the device
-#                    (Since 4.2)
+# @unmap_operations: The number of unmap operations performed by the
+#     device (Since 4.2)
 #
-# @rd_total_time_ns: Total time spent on reads in nanoseconds (since 0.15).
+# @rd_total_time_ns: Total time spent on reads in nanoseconds (since
+#     0.15).
 #
-# @wr_total_time_ns: Total time spent on writes in nanoseconds (since 0.15).
+# @wr_total_time_ns: Total time spent on writes in nanoseconds (since
+#     0.15).
 #
-# @flush_total_time_ns: Total time spent on cache flushes in nanoseconds
-#                       (since 0.15).
+# @flush_total_time_ns: Total time spent on cache flushes in
+#     nanoseconds (since 0.15).
 #
-# @unmap_total_time_ns: Total time spent on unmap operations in nanoseconds
-#                       (Since 4.2)
+# @unmap_total_time_ns: Total time spent on unmap operations in
+#     nanoseconds (Since 4.2)
 #
-# @wr_highest_offset: The offset after the greatest byte written to the
-#                     device.  The intended use of this information is for
-#                     growable sparse files (like qcow2) that are used on top
-#                     of a physical device.
+# @wr_highest_offset: The offset after the greatest byte written to
+#     the device.  The intended use of this information is for
+#     growable sparse files (like qcow2) that are used on top of a
+#     physical device.
 #
-# @rd_merged: Number of read requests that have been merged into another
-#             request (Since 2.3).
+# @rd_merged: Number of read requests that have been merged into
+#     another request (Since 2.3).
 #
-# @wr_merged: Number of write requests that have been merged into another
-#             request (Since 2.3).
+# @wr_merged: Number of write requests that have been merged into
+#     another request (Since 2.3).
 #
-# @unmap_merged: Number of unmap requests that have been merged into another
-#                request (Since 4.2)
+# @unmap_merged: Number of unmap requests that have been merged into
+#     another request (Since 4.2)
 #
-# @idle_time_ns: Time since the last I/O operation, in
-#                nanoseconds. If the field is absent it means that
-#                there haven't been any operations yet (Since 2.5).
+# @idle_time_ns: Time since the last I/O operation, in nanoseconds.
+#     If the field is absent it means that there haven't been any
+#     operations yet (Since 2.5).
 #
 # @failed_rd_operations: The number of failed read operations
-#                        performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
 # @failed_wr_operations: The number of failed write operations
-#                        performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
 # @failed_flush_operations: The number of failed flush operations
-#                           performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
-# @failed_unmap_operations: The number of failed unmap operations performed
-#                           by the device (Since 4.2)
+# @failed_unmap_operations: The number of failed unmap operations
+#     performed by the device (Since 4.2)
 #
 # @invalid_rd_operations: The number of invalid read operations
-#                         performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
 # @invalid_wr_operations: The number of invalid write operations
-#                         performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
 # @invalid_flush_operations: The number of invalid flush operations
-#                            performed by the device (Since 2.5)
+#     performed by the device (Since 2.5)
 #
-# @invalid_unmap_operations: The number of invalid unmap operations performed
-#                            by the device (Since 4.2)
+# @invalid_unmap_operations: The number of invalid unmap operations
+#     performed by the device (Since 4.2)
 #
 # @account_invalid: Whether invalid operations are included in the
-#                   last access statistics (Since 2.5)
+#     last access statistics (Since 2.5)
 #
 # @account_failed: Whether failed operations are included in the
-#                  latency and last access statistics (Since 2.5)
+#     latency and last access statistics (Since 2.5)
 #
 # @timed_stats: Statistics specific to the set of previously defined
-#               intervals of time (Since 2.5)
+#     intervals of time (Since 2.5)
 #
-# @rd_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @rd_latency_histogram: @BlockLatencyHistogramInfo.  (Since 4.0)
 #
-# @wr_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @wr_latency_histogram: @BlockLatencyHistogramInfo.  (Since 4.0)
 #
-# @flush_latency_histogram: @BlockLatencyHistogramInfo. (Since 4.0)
+# @flush_latency_histogram: @BlockLatencyHistogramInfo.  (Since 4.0)
 #
 # Since: 0.14
 ##
@@ -1000,11 +1009,11 @@
 #
 # File driver statistics
 #
-# @discard-nb-ok: The number of successful discard operations performed by
-#                 the driver.
+# @discard-nb-ok: The number of successful discard operations
+#     performed by the driver.
 #
-# @discard-nb-failed: The number of failed discard operations performed by
-#                     the driver.
+# @discard-nb-failed: The number of failed discard operations
+#     performed by the driver.
 #
 # @discard-bytes-ok: The number of bytes discarded by the driver.
 #
@@ -1023,11 +1032,11 @@
 #
 # @completion-errors: The number of completion errors.
 #
-# @aligned-accesses: The number of aligned accesses performed by
-#                    the driver.
+# @aligned-accesses: The number of aligned accesses performed by the
+#     driver.
 #
 # @unaligned-accesses: The number of unaligned accesses performed by
-#                      the driver.
+#     the driver.
 #
 # Since: 5.2
 ##
@@ -1059,24 +1068,24 @@
 # Statistics of a virtual block device or a block backing device.
 #
 # @device: If the stats are for a virtual block device, the name
-#          corresponding to the virtual block device.
+#     corresponding to the virtual block device.
 #
-# @node-name: The node name of the device. (Since 2.3)
+# @node-name: The node name of the device.  (Since 2.3)
 #
-# @qdev: The qdev ID, or if no ID is assigned, the QOM path of the block
-#        device. (since 3.0)
+# @qdev: The qdev ID, or if no ID is assigned, the QOM path of the
+#     block device.  (since 3.0)
 #
 # @stats: A @BlockDeviceStats for the device.
 #
-# @driver-specific: Optional driver-specific stats. (Since 4.2)
+# @driver-specific: Optional driver-specific stats.  (Since 4.2)
 #
 # @parent: This describes the file block device if it has one.
-#          Contains recursively the statistics of the underlying
-#          protocol (e.g. the host file for a qcow2 image). If there is
-#          no underlying protocol, this field is omitted
+#     Contains recursively the statistics of the underlying protocol
+#     (e.g. the host file for a qcow2 image). If there is no
+#     underlying protocol, this field is omitted
 #
 # @backing: This describes the backing block device if it has one.
-#           (Since 2.0)
+#     (Since 2.0)
 #
 # Since: 0.14
 ##
@@ -1093,12 +1102,12 @@
 # Query the @BlockStats for all virtual block devices.
 #
 # @query-nodes: If true, the command will query all the block nodes
-#               that have a node name, in a list which will include "parent"
-#               information, but not "backing".
-#               If false or omitted, the behavior is as before - query all the
-#               device backends, recursively including their "parent" and
-#               "backing". Filter nodes that were created implicitly are
-#               skipped over in this mode. (Since 2.3)
+#     that have a node name, in a list which will include "parent"
+#     information, but not "backing". If false or omitted, the
+#     behavior is as before - query all the device backends,
+#     recursively including their "parent" and "backing". Filter nodes
+#     that were created implicitly are skipped over in this mode.
+#     (Since 2.3)
 #
 # Returns: A list of @BlockStats for each virtual block devices.
 #
@@ -1205,7 +1214,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-blockstats',
   'data': { '*query-nodes': 'bool' },
@@ -1216,22 +1224,22 @@
 # @BlockdevOnError:
 #
 # An enumeration of possible behaviors for errors on I/O operations.
-# The exact meaning depends on whether the I/O was initiated by a guest
-# or by a block job
+# The exact meaning depends on whether the I/O was initiated by a
+# guest or by a block job
 #
-# @report: for guest operations, report the error to the guest;
-#          for jobs, cancel the job
+# @report: for guest operations, report the error to the guest; for
+#     jobs, cancel the job
 #
 # @ignore: ignore the error, only report a QMP event (BLOCK_IO_ERROR
-#          or BLOCK_JOB_ERROR). The backup, mirror and commit block jobs retry
-#          the failing request later and may still complete successfully. The
-#          stream block job continues to stream and will complete with an
-#          error.
+#     or BLOCK_JOB_ERROR). The backup, mirror and commit block jobs
+#     retry the failing request later and may still complete
+#     successfully.  The stream block job continues to stream and will
+#     complete with an error.
 #
 # @enospc: same as @stop on ENOSPC, same as @report otherwise.
 #
-# @stop: for guest operations, stop the virtual machine;
-#        for jobs, pause the job
+# @stop: for guest operations, stop the virtual machine; for jobs,
+#     pause the job
 #
 # @auto: inherit the error handling policy of the backend (since: 2.7)
 #
@@ -1252,10 +1260,11 @@
 #
 # @none: only copy data written from now on
 #
-# @incremental: only copy data described by the dirty bitmap. (since: 2.4)
+# @incremental: only copy data described by the dirty bitmap.
+#     (since: 2.4)
 #
-# @bitmap: only copy data described by the dirty bitmap. (since: 4.2)
-#          Behavior on completion is determined by the BitmapSyncMode.
+# @bitmap: only copy data described by the dirty bitmap.  (since: 4.2)
+#     Behavior on completion is determined by the BitmapSyncMode.
 #
 # Since: 1.3
 ##
@@ -1265,17 +1274,18 @@
 ##
 # @BitmapSyncMode:
 #
-# An enumeration of possible behaviors for the synchronization of a bitmap
-# when used for data copy operations.
+# An enumeration of possible behaviors for the synchronization of a
+# bitmap when used for data copy operations.
 #
-# @on-success: The bitmap is only synced when the operation is successful.
-#              This is the behavior always used for 'INCREMENTAL' backups.
+# @on-success: The bitmap is only synced when the operation is
+#     successful.  This is the behavior always used for 'INCREMENTAL'
+#     backups.
 #
 # @never: The bitmap is never synchronized with the operation, and is
-#         treated solely as a read-only manifest of blocks to copy.
+#     treated solely as a read-only manifest of blocks to copy.
 #
 # @always: The bitmap is always synchronized with the operation,
-#          regardless of whether or not the operation was successful.
+#     regardless of whether or not the operation was successful.
 #
 # Since: 4.2
 ##
@@ -1291,9 +1301,8 @@
 # @background: copy data in background only.
 #
 # @write-blocking: when data is written to the source, write it
-#                  (synchronously) to the target as well.  In
-#                  addition, data is copied in background just like in
-#                  @background mode.
+#     (synchronously) to the target as well.  In addition, data is
+#     copied in background just like in @background mode.
 #
 # Since: 3.0
 ##
@@ -1307,21 +1316,22 @@
 #
 # @type: the job type ('stream' for image streaming)
 #
-# @device: The job identifier. Originally the device name but other
-#          values are allowed since QEMU 2.7
+# @device: The job identifier.  Originally the device name but other
+#     values are allowed since QEMU 2.7
 #
-# @len: Estimated @offset value at the completion of the job. This value can
-#       arbitrarily change while the job is running, in both directions.
+# @len: Estimated @offset value at the completion of the job.  This
+#     value can arbitrarily change while the job is running, in both
+#     directions.
 #
-# @offset: Progress made until now. The unit is arbitrary and the value can
-#          only meaningfully be used for the ratio of @offset to @len. The
-#          value is monotonically increasing.
+# @offset: Progress made until now.  The unit is arbitrary and the
+#     value can only meaningfully be used for the ratio of @offset to
+#     @len.  The value is monotonically increasing.
 #
-# @busy: false if the job is known to be in a quiescent state, with
-#        no pending I/O.  (Since 1.3)
+# @busy: false if the job is known to be in a quiescent state, with no
+#     pending I/O.  (Since 1.3)
 #
-# @paused: whether the job is paused or, if @busy is true, will
-#          pause itself as soon as possible.  (Since 1.3)
+# @paused: whether the job is paused or, if @busy is true, will pause
+#     itself as soon as possible.  (Since 1.3)
 #
 # @speed: the rate limit, bytes per second
 #
@@ -1331,14 +1341,14 @@
 #
 # @status: Current job state/status (since 2.12)
 #
-# @auto-finalize: Job will finalize itself when PENDING, moving to
-#                 the CONCLUDED state. (since 2.12)
+# @auto-finalize: Job will finalize itself when PENDING, moving to the
+#     CONCLUDED state.  (since 2.12)
 #
-# @auto-dismiss: Job will dismiss itself when CONCLUDED, moving to the NULL
-#                state and disappearing from the query list. (since 2.12)
+# @auto-dismiss: Job will dismiss itself when CONCLUDED, moving to the
+#     NULL state and disappearing from the query list.  (since 2.12)
 #
 # @error: Error information if the job did not complete successfully.
-#         Not set if the job completed successfully. (since 2.12.1)
+#     Not set if the job completed successfully.  (since 2.12.1)
 #
 # Since: 1.1
 ##
@@ -1375,8 +1385,9 @@
 #
 # @size: new image size in bytes
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, DeviceNotFound
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, DeviceNotFound
 #
 # Since: 0.14
 #
@@ -1385,7 +1396,6 @@
 # -> { "execute": "block_resize",
 #      "arguments": { "device": "scratch", "size": 1073741824 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block_resize',
   'data': { '*device': 'str',
@@ -1397,14 +1407,14 @@
 ##
 # @NewImageMode:
 #
-# An enumeration that tells QEMU how to set the backing file path in
-# a new image file.
+# An enumeration that tells QEMU how to set the backing file path in a
+# new image file.
 #
 # @existing: QEMU should look for an existing image file.
 #
 # @absolute-paths: QEMU should create a new image with absolute paths
-#                  for the backing file. If there is no backing file available, the new
-#                  image will not be backed either.
+#     for the backing file.  If there is no backing file available,
+#     the new image will not be backed either.
 #
 # Since: 1.1
 ##
@@ -1418,13 +1428,15 @@
 #
 # @device: the name of the device to take a snapshot of.
 #
-# @node-name: graph node name to generate the snapshot from (Since 2.0)
+# @node-name: graph node name to generate the snapshot from (Since
+#     2.0)
 #
-# @snapshot-file: the target of the new overlay image. If the file
-#                 exists, or if it is a device, the overlay will be created in the
-#                 existing file/device. Otherwise, a new file will be created.
+# @snapshot-file: the target of the new overlay image.  If the file
+#     exists, or if it is a device, the overlay will be created in the
+#     existing file/device.  Otherwise, a new file will be created.
 #
-# @snapshot-node-name: the graph node name of the new image (Since 2.0)
+# @snapshot-node-name: the graph node name of the new image (Since
+#     2.0)
 #
 # @format: the format of the overlay image, default is 'qcow2'.
 #
@@ -1442,9 +1454,9 @@
 # @node: device or node name that will have a snapshot taken.
 #
 # @overlay: reference to the existing block device that will become
-#           the overlay of @node, as part of taking the snapshot.
-#           It must not have a current backing file (this can be
-#           achieved by passing "backing": null to blockdev-add).
+#     the overlay of @node, as part of taking the snapshot.  It must
+#     not have a current backing file (this can be achieved by passing
+#     "backing": null to blockdev-add).
 #
 # Since: 2.5
 ##
@@ -1454,20 +1466,20 @@
 ##
 # @BackupPerf:
 #
-# Optional parameters for backup. These parameters don't affect
+# Optional parameters for backup.  These parameters don't affect
 # functionality, but may significantly affect performance.
 #
-# @use-copy-range: Use copy offloading. Default false.
+# @use-copy-range: Use copy offloading.  Default false.
 #
-# @max-workers: Maximum number of parallel requests for the sustained background
-#               copying process. Doesn't influence copy-before-write operations.
-#               Default 64.
+# @max-workers: Maximum number of parallel requests for the sustained
+#     background copying process.  Doesn't influence copy-before-write
+#     operations.  Default 64.
 #
-# @max-chunk: Maximum request length for the sustained background copying
-#             process. Doesn't influence copy-before-write operations.
-#             0 means unlimited. If max-chunk is non-zero then it should not be
-#             less than job cluster size which is calculated as maximum of
-#             target image cluster size and 64k. Default 0.
+# @max-chunk: Maximum request length for the sustained background
+#     copying process.  Doesn't influence copy-before-write
+#     operations.  0 means unlimited.  If max-chunk is non-zero then
+#     it should not be less than job cluster size which is calculated
+#     as maximum of target image cluster size and 64k.  Default 0.
 #
 # Since: 6.0
 ##
@@ -1478,66 +1490,65 @@
 ##
 # @BackupCommon:
 #
-# @job-id: identifier for the newly-created block job. If
-#          omitted, the device name will be used. (Since 2.7)
+# @job-id: identifier for the newly-created block job.  If omitted,
+#     the device name will be used.  (Since 2.7)
 #
-# @device: the device name or node-name of a root node which should be copied.
+# @device: the device name or node-name of a root node which should be
+#     copied.
 #
-# @sync: what parts of the disk image should be copied to the destination
-#        (all the disk, only the sectors allocated in the topmost image, from a
-#        dirty bitmap, or only new I/O).
+# @sync: what parts of the disk image should be copied to the
+#     destination (all the disk, only the sectors allocated in the
+#     topmost image, from a dirty bitmap, or only new I/O).
 #
-# @speed: the maximum speed, in bytes per second. The default is 0,
-#         for unlimited.
+# @speed: the maximum speed, in bytes per second.  The default is 0,
+#     for unlimited.
 #
-# @bitmap: The name of a dirty bitmap to use.
-#          Must be present if sync is "bitmap" or "incremental".
-#          Can be present if sync is "full" or "top".
-#          Must not be present otherwise.
-#          (Since 2.4 (drive-backup), 3.1 (blockdev-backup))
+# @bitmap: The name of a dirty bitmap to use.  Must be present if sync
+#     is "bitmap" or "incremental". Can be present if sync is "full"
+#     or "top". Must not be present otherwise.
+#     (Since 2.4 (drive-backup), 3.1 (blockdev-backup))
 #
-# @bitmap-mode: Specifies the type of data the bitmap should contain after
-#               the operation concludes.
-#               Must be present if a bitmap was provided,
-#               Must NOT be present otherwise. (Since 4.2)
+# @bitmap-mode: Specifies the type of data the bitmap should contain
+#     after the operation concludes.  Must be present if a bitmap was
+#     provided, Must NOT be present otherwise.  (Since 4.2)
 #
 # @compress: true to compress data, if the target format supports it.
-#            (default: false) (since 2.8)
+#     (default: false) (since 2.8)
 #
 # @on-source-error: the action to take on an error on the source,
-#                   default 'report'.  'stop' and 'enospc' can only be used
-#                   if the block device supports io-status (see BlockInfo).
+#     default 'report'.  'stop' and 'enospc' can only be used if the
+#     block device supports io-status (see BlockInfo).
 #
 # @on-target-error: the action to take on an error on the target,
-#                   default 'report' (no limitations, since this applies to
-#                   a different block device than @device).
+#     default 'report' (no limitations, since this applies to a
+#     different block device than @device).
 #
-# @auto-finalize: When false, this job will wait in a PENDING state after it has
-#                 finished its work, waiting for @block-job-finalize before
-#                 making any block graph changes.
-#                 When true, this job will automatically
-#                 perform its abort or commit actions.
-#                 Defaults to true. (Since 2.12)
+# @auto-finalize: When false, this job will wait in a PENDING state
+#     after it has finished its work, waiting for @block-job-finalize
+#     before making any block graph changes.  When true, this job will
+#     automatically perform its abort or commit actions.  Defaults to
+#     true.  (Since 2.12)
 #
-# @auto-dismiss: When false, this job will wait in a CONCLUDED state after it
-#                has completely ceased all work, and awaits @block-job-dismiss.
-#                When true, this job will automatically disappear from the query
-#                list without user intervention.
-#                Defaults to true. (Since 2.12)
+# @auto-dismiss: When false, this job will wait in a CONCLUDED state
+#     after it has completely ceased all work, and awaits
+#     @block-job-dismiss.  When true, this job will automatically
+#     disappear from the query list without user intervention.
+#     Defaults to true.  (Since 2.12)
 #
 # @filter-node-name: the node name that should be assigned to the
-#                    filter driver that the backup job inserts into the graph
-#                    above node specified by @drive. If this option is not given,
-#                    a node name is autogenerated. (Since: 4.2)
+#     filter driver that the backup job inserts into the graph above
+#     node specified by @drive.  If this option is not given, a node
+#     name is autogenerated.  (Since: 4.2)
 #
-# @x-perf: Performance options. (Since 6.0)
+# @x-perf: Performance options.  (Since 6.0)
 #
 # Features:
+#
 # @unstable: Member @x-perf is experimental.
 #
 # Note: @on-source-error and @on-target-error only affect background
-#       I/O.  If an error occurs during a guest write request, the device's
-#       rerror/werror actions will be used.
+#     I/O.  If an error occurs during a guest write request, the
+#     device's rerror/werror actions will be used.
 #
 # Since: 4.2
 ##
@@ -1556,15 +1567,15 @@
 ##
 # @DriveBackup:
 #
-# @target: the target of the new image. If the file exists, or if it
-#          is a device, the existing file/device will be used as the new
-#          destination.  If it does not exist, a new file will be created.
+# @target: the target of the new image.  If the file exists, or if it
+#     is a device, the existing file/device will be used as the new
+#     destination.  If it does not exist, a new file will be created.
 #
-# @format: the format of the new destination, default is to
-#          probe if @mode is 'existing', else the format of the source
+# @format: the format of the new destination, default is to probe if
+#     @mode is 'existing', else the format of the source
 #
 # @mode: whether and how QEMU should create a new image, default is
-#        'absolute-paths'.
+#     'absolute-paths'.
 #
 # Since: 1.6
 ##
@@ -1592,8 +1603,9 @@
 #
 # For the arguments, see the documentation of BlockdevSnapshotSync.
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, DeviceNotFound
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, DeviceNotFound
 #
 # Since: 0.14
 #
@@ -1605,7 +1617,6 @@
 #                     "/some/place/my-image",
 #                     "format": "qcow2" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-snapshot-sync',
   'data': 'BlockdevSnapshotSync',
@@ -1618,16 +1629,16 @@
 #
 # Take a snapshot, by installing 'node' as the backing image of
 # 'overlay'. Additionally, if 'node' is associated with a block
-# device, the block device changes to using 'overlay' as its new active
-# image.
+# device, the block device changes to using 'overlay' as its new
+# active image.
 #
 # For the arguments, see the documentation of BlockdevSnapshot.
 #
 # Features:
-# @allow-write-only-overlay: If present, the check whether this operation is safe
-#                            was relaxed so that it can be used to change
-#                            backing file of a destination of a blockdev-mirror.
-#                            (since 5.0)
+#
+# @allow-write-only-overlay: If present, the check whether this
+#     operation is safe was relaxed so that it can be used to change
+#     backing file of a destination of a blockdev-mirror.  (since 5.0)
 #
 # Since: 2.5
 #
@@ -1646,7 +1657,6 @@
 #      "arguments": { "node": "ide-hd0",
 #                     "overlay": "node1534" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-snapshot',
   'data': 'BlockdevSnapshot',
@@ -1658,26 +1668,25 @@
 #
 # Change the backing file in the image file metadata.  This does not
 # cause QEMU to reopen the image file to reparse the backing filename
-# (it may, however, perform a reopen to change permissions from
-# r/o -> r/w -> r/o, if needed). The new backing file string is written
-# into the image file metadata, and the QEMU internal strings are
-# updated.
+# (it may, however, perform a reopen to change permissions from r/o ->
+# r/w -> r/o, if needed). The new backing file string is written into
+# the image file metadata, and the QEMU internal strings are updated.
 #
 # @image-node-name: The name of the block driver state node of the
-#                   image to modify. The "device" argument is used
-#                   to verify "image-node-name" is in the chain
-#                   described by "device".
+#     image to modify.  The "device" argument is used to verify
+#     "image-node-name" is in the chain described by "device".
 #
 # @device: The device name or node-name of the root node that owns
-#          image-node-name.
+#     image-node-name.
 #
-# @backing-file: The string to write as the backing file.  This
-#                string is not validated, so care should be taken
-#                when specifying the string or the image chain may
-#                not be able to be reopened again.
+# @backing-file: The string to write as the backing file.  This string
+#     is not validated, so care should be taken when specifying the
+#     string or the image chain may not be able to be reopened again.
 #
-# Returns: - Nothing on success
-#          - If "device" does not exist or cannot be determined, DeviceNotFound
+# Returns:
+#     - Nothing on success
+#     - If "device" does not exist or cannot be determined,
+#       DeviceNotFound
 #
 # Since: 2.1
 ##
@@ -1689,14 +1698,14 @@
 ##
 # @block-commit:
 #
-# Live commit of data from overlay image nodes into backing nodes - i.e.,
-# writes data between 'top' and 'base' into 'base'.
+# Live commit of data from overlay image nodes into backing nodes -
+# i.e., writes data between 'top' and 'base' into 'base'.
 #
-# If top == base, that is an error.
-# If top has no overlays on top of it, or if it is in use by a writer,
-# the job will not be completed by itself.  The user needs to complete
-# the job with the block-job-complete command after getting the ready
-# event. (Since 2.0)
+# If top == base, that is an error.  If top has no overlays on top of
+# it, or if it is in use by a writer, the job will not be completed by
+# itself.  The user needs to complete the job with the
+# block-job-complete command after getting the ready event.  (Since
+# 2.0)
 #
 # If the base image is smaller than top, then the base image will be
 # resized to be the same size as top.  If top is smaller than the base
@@ -1704,77 +1713,75 @@
 # size to match the size of the smaller top, you can safely truncate
 # it yourself once the commit operation successfully completes.
 #
-# @job-id: identifier for the newly-created block job. If
-#          omitted, the device name will be used. (Since 2.7)
+# @job-id: identifier for the newly-created block job.  If omitted,
+#     the device name will be used.  (Since 2.7)
 #
 # @device: the device name or node-name of a root node
 #
 # @base-node: The node name of the backing image to write data into.
-#             If not specified, this is the deepest backing image.
-#             (since: 3.1)
+#     If not specified, this is the deepest backing image.
+#     (since: 3.1)
 #
-# @base: Same as @base-node, except that it is a file name rather than a node
-#        name. This must be the exact filename string that was used to open the
-#        node; other strings, even if addressing the same file, are not
-#        accepted
+# @base: Same as @base-node, except that it is a file name rather than
+#     a node name.  This must be the exact filename string that was
+#     used to open the node; other strings, even if addressing the
+#     same file, are not accepted
 #
 # @top-node: The node name of the backing image within the image chain
-#            which contains the topmost data to be committed down. If
-#            not specified, this is the active layer. (since: 3.1)
+#     which contains the topmost data to be committed down.  If not
+#     specified, this is the active layer.  (since: 3.1)
 #
-# @top: Same as @top-node, except that it is a file name rather than a node
-#       name. This must be the exact filename string that was used to open the
-#       node; other strings, even if addressing the same file, are not
-#       accepted
+# @top: Same as @top-node, except that it is a file name rather than a
+#     node name.  This must be the exact filename string that was used
+#     to open the node; other strings, even if addressing the same
+#     file, are not accepted
 #
 # @backing-file: The backing file string to write into the overlay
-#                image of 'top'.  If 'top' does not have an overlay
-#                image, or if 'top' is in use by a writer, specifying
-#                a backing file string is an error.
+#     image of 'top'.  If 'top' does not have an overlay image, or if
+#     'top' is in use by a writer, specifying a backing file string is
+#     an error.
 #
-#                This filename is not validated.  If a pathname string
-#                is such that it cannot be resolved by QEMU, that
-#                means that subsequent QMP or HMP commands must use
-#                node-names for the image in question, as filename
-#                lookup methods will fail.
+#     This filename is not validated.  If a pathname string is such
+#     that it cannot be resolved by QEMU, that means that subsequent
+#     QMP or HMP commands must use node-names for the image in
+#     question, as filename lookup methods will fail.
 #
-#                If not specified, QEMU will automatically determine
-#                the backing file string to use, or error out if
-#                there is no obvious choice. Care should be taken
-#                when specifying the string, to specify a valid
-#                filename or protocol.
-#                (Since 2.1)
+#     If not specified, QEMU will automatically determine the backing
+#     file string to use, or error out if there is no obvious choice.
+#     Care should be taken when specifying the string, to specify a
+#     valid filename or protocol.  (Since 2.1)
 #
 # @speed: the maximum speed, in bytes per second
 #
-# @on-error: the action to take on an error. 'ignore' means that the request
-#            should be retried. (default: report; Since: 5.0)
+# @on-error: the action to take on an error.  'ignore' means that the
+#     request should be retried.  (default: report; Since: 5.0)
 #
 # @filter-node-name: the node name that should be assigned to the
-#                    filter driver that the commit job inserts into the graph
-#                    above @top. If this option is not given, a node name is
-#                    autogenerated. (Since: 2.9)
+#     filter driver that the commit job inserts into the graph above
+#     @top.  If this option is not given, a node name is
+#     autogenerated.  (Since: 2.9)
 #
-# @auto-finalize: When false, this job will wait in a PENDING state after it has
-#                 finished its work, waiting for @block-job-finalize before
-#                 making any block graph changes.
-#                 When true, this job will automatically
-#                 perform its abort or commit actions.
-#                 Defaults to true. (Since 3.1)
+# @auto-finalize: When false, this job will wait in a PENDING state
+#     after it has finished its work, waiting for @block-job-finalize
+#     before making any block graph changes.  When true, this job will
+#     automatically perform its abort or commit actions.  Defaults to
+#     true.  (Since 3.1)
 #
-# @auto-dismiss: When false, this job will wait in a CONCLUDED state after it
-#                has completely ceased all work, and awaits @block-job-dismiss.
-#                When true, this job will automatically disappear from the query
-#                list without user intervention.
-#                Defaults to true. (Since 3.1)
+# @auto-dismiss: When false, this job will wait in a CONCLUDED state
+#     after it has completely ceased all work, and awaits
+#     @block-job-dismiss.  When true, this job will automatically
+#     disappear from the query list without user intervention.
+#     Defaults to true.  (Since 3.1)
 #
 # Features:
-# @deprecated: Members @base and @top are deprecated.  Use @base-node
-#              and @top-node instead.
 #
-# Returns: - Nothing on success
-#          - If @device does not exist, DeviceNotFound
-#          - Any other error returns a GenericError.
+# @deprecated: Members @base and @top are deprecated.  Use @base-node
+#     and @top-node instead.
+#
+# Returns:
+#     - Nothing on success
+#     - If @device does not exist, DeviceNotFound
+#     - Any other error returns a GenericError.
 #
 # Since: 1.3
 #
@@ -1784,7 +1791,6 @@
 #      "arguments": { "device": "virtio0",
 #                     "top": "/tmp/snap1.qcow2" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-commit',
   'data': { '*job-id': 'str', 'device': 'str', '*base-node': 'str',
@@ -1800,17 +1806,20 @@
 ##
 # @drive-backup:
 #
-# Start a point-in-time copy of a block device to a new destination.  The
-# status of ongoing drive-backup operations can be checked with
-# query-block-jobs where the BlockJobInfo.type field has the value 'backup'.
-# The operation can be stopped before it has completed using the
-# block-job-cancel command.
+# Start a point-in-time copy of a block device to a new destination.
+# The status of ongoing drive-backup operations can be checked with
+# query-block-jobs where the BlockJobInfo.type field has the value
+# 'backup'. The operation can be stopped before it has completed using
+# the block-job-cancel command.
 #
 # Features:
-# @deprecated: This command is deprecated. Use @blockdev-backup instead.
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, GenericError
+# @deprecated: This command is deprecated.  Use @blockdev-backup
+#     instead.
+#
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, GenericError
 #
 # Since: 1.6
 #
@@ -1821,7 +1830,6 @@
 #                     "sync": "full",
 #                     "target": "backup.img" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'drive-backup', 'boxed': true,
   'data': 'DriveBackup', 'features': ['deprecated'],
@@ -1830,14 +1838,15 @@
 ##
 # @blockdev-backup:
 #
-# Start a point-in-time copy of a block device to a new destination.  The
-# status of ongoing blockdev-backup operations can be checked with
-# query-block-jobs where the BlockJobInfo.type field has the value 'backup'.
-# The operation can be stopped before it has completed using the
-# block-job-cancel command.
+# Start a point-in-time copy of a block device to a new destination.
+# The status of ongoing blockdev-backup operations can be checked with
+# query-block-jobs where the BlockJobInfo.type field has the value
+# 'backup'. The operation can be stopped before it has completed using
+# the block-job-cancel command.
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, DeviceNotFound
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, DeviceNotFound
 #
 # Since: 2.3
 #
@@ -1848,7 +1857,6 @@
 #                     "sync": "full",
 #                     "target": "tgt-id" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-backup', 'boxed': true,
   'data': 'BlockdevBackup',
@@ -1859,8 +1867,8 @@
 #
 # Get the named block driver list
 #
-# @flat: Omit the nested data about backing image ("backing-image" key) if true.
-#        Default is false (Since 5.0)
+# @flat: Omit the nested data about backing image ("backing-image"
+#     key) if true.  Default is false (Since 5.0)
 #
 # Returns: the list of BlockDeviceInfo
 #
@@ -1914,7 +1922,6 @@
 #                           "virtual-size":2048000
 #                       }
 #                    } } ] }
-#
 ##
 { 'command': 'query-named-block-nodes',
   'returns': [ 'BlockDeviceInfo' ],
@@ -1938,16 +1945,16 @@
 ##
 # @XDbgBlockGraphNode:
 #
-# @id: Block graph node identifier. This @id is generated only for
-#      x-debug-query-block-graph and does not relate to any other identifiers in
-#      Qemu.
+# @id: Block graph node identifier.  This @id is generated only for
+#     x-debug-query-block-graph and does not relate to any other
+#     identifiers in Qemu.
 #
-# @type: Type of graph node. Can be one of block-backend, block-job or
-#        block-driver-state.
+# @type: Type of graph node.  Can be one of block-backend, block-job
+#     or block-driver-state.
 #
-# @name: Human readable name of the node. Corresponds to node-name for
-#        block-driver-state nodes; is not guaranteed to be unique in the whole
-#        graph (with block-jobs and block-backends).
+# @name: Human readable name of the node.  Corresponds to node-name
+#     for block-driver-state nodes; is not guaranteed to be unique in
+#     the whole graph (with block-jobs and block-backends).
 #
 # Since: 4.0
 ##
@@ -1959,25 +1966,26 @@
 #
 # Enum of base block permissions.
 #
-# @consistent-read: A user that has the "permission" of consistent reads is
-#                   guaranteed that their view of the contents of the block
-#                   device is complete and self-consistent, representing the
-#                   contents of a disk at a specific point.
-#                   For most block devices (including their backing files) this
-#                   is true, but the property cannot be maintained in a few
-#                   situations like for intermediate nodes of a commit block
-#                   job.
+# @consistent-read: A user that has the "permission" of consistent
+#     reads is guaranteed that their view of the contents of the block
+#     device is complete and self-consistent, representing the
+#     contents of a disk at a specific point.  For most block devices
+#     (including their backing files) this is true, but the property
+#     cannot be maintained in a few situations like for intermediate
+#     nodes of a commit block job.
 #
-# @write: This permission is required to change the visible disk contents.
+# @write: This permission is required to change the visible disk
+#     contents.
 #
-# @write-unchanged: This permission (which is weaker than BLK_PERM_WRITE) is
-#                   both enough and required for writes to the block node when
-#                   the caller promises that the visible disk content doesn't
-#                   change.
-#                   As the BLK_PERM_WRITE permission is strictly stronger,
-#                   either is sufficient to perform an unchanging write.
+# @write-unchanged: This permission (which is weaker than
+#     BLK_PERM_WRITE) is both enough and required for writes to the
+#     block node when the caller promises that the visible disk
+#     content doesn't change.  As the BLK_PERM_WRITE permission is
+#     strictly stronger, either is sufficient to perform an unchanging
+#     write.
 #
-# @resize: This permission is required to change the size of a block node.
+# @resize: This permission is required to change the size of a block
+#     node.
 #
 # Since: 4.0
 ##
@@ -1997,8 +2005,8 @@
 #
 # @perm: granted permissions for the parent operating on the child
 #
-# @shared-perm: permissions that can still be granted to other users of the
-#               child while it is still attached to this parent
+# @shared-perm: permissions that can still be granted to other users
+#     of the child while it is still attached to this parent
 #
 # Since: 4.0
 ##
@@ -2023,6 +2031,7 @@
 # Get the block graph.
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Since: 4.0
@@ -2034,15 +2043,16 @@
 ##
 # @drive-mirror:
 #
-# Start mirroring a block device's writes to a new destination. target
-# specifies the target of the new image. If the file exists, or if it
-# is a device, it will be used as the new destination for writes. If
-# it does not exist, a new file will be created. format specifies the
-# format of the mirror image, default is to probe if mode='existing',
-# else the format of the source.
+# Start mirroring a block device's writes to a new destination.
+# target specifies the target of the new image.  If the file exists,
+# or if it is a device, it will be used as the new destination for
+# writes.  If it does not exist, a new file will be created.  format
+# specifies the format of the mirror image, default is to probe if
+# mode='existing', else the format of the source.
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, GenericError
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, GenericError
 #
 # Since: 1.3
 #
@@ -2054,7 +2064,6 @@
 #                     "sync": "full",
 #                     "format": "qcow2" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'drive-mirror', 'boxed': true,
   'data': 'DriveMirror',
@@ -2065,73 +2074,72 @@
 #
 # A set of parameters describing drive mirror setup.
 #
-# @job-id: identifier for the newly-created block job. If
-#          omitted, the device name will be used. (Since 2.7)
+# @job-id: identifier for the newly-created block job.  If omitted,
+#     the device name will be used.  (Since 2.7)
 #
-# @device: the device name or node-name of a root node whose writes should be
-#          mirrored.
+# @device: the device name or node-name of a root node whose writes
+#     should be mirrored.
 #
-# @target: the target of the new image. If the file exists, or if it
-#          is a device, the existing file/device will be used as the new
-#          destination.  If it does not exist, a new file will be created.
+# @target: the target of the new image.  If the file exists, or if it
+#     is a device, the existing file/device will be used as the new
+#     destination.  If it does not exist, a new file will be created.
 #
-# @format: the format of the new destination, default is to
-#          probe if @mode is 'existing', else the format of the source
+# @format: the format of the new destination, default is to probe if
+#     @mode is 'existing', else the format of the source
 #
-# @node-name: the new block driver state node name in the graph
-#             (Since 2.1)
+# @node-name: the new block driver state node name in the graph (Since
+#     2.1)
 #
 # @replaces: with sync=full graph node name to be replaced by the new
-#            image when a whole image copy is done. This can be used to repair
-#            broken Quorum files.  By default, @device is replaced, although
-#            implicitly created filters on it are kept. (Since 2.1)
+#     image when a whole image copy is done.  This can be used to
+#     repair broken Quorum files.  By default, @device is replaced,
+#     although implicitly created filters on it are kept.  (Since 2.1)
 #
 # @mode: whether and how QEMU should create a new image, default is
-#        'absolute-paths'.
+#     'absolute-paths'.
 #
 # @speed: the maximum speed, in bytes per second
 #
-# @sync: what parts of the disk image should be copied to the destination
-#        (all the disk, only the sectors allocated in the topmost image, or
-#        only new I/O).
+# @sync: what parts of the disk image should be copied to the
+#     destination (all the disk, only the sectors allocated in the
+#     topmost image, or only new I/O).
 #
-# @granularity: granularity of the dirty bitmap, default is 64K
-#               if the image format doesn't have clusters, 4K if the clusters
-#               are smaller than that, else the cluster size.  Must be a
-#               power of 2 between 512 and 64M (since 1.4).
+# @granularity: granularity of the dirty bitmap, default is 64K if the
+#     image format doesn't have clusters, 4K if the clusters are
+#     smaller than that, else the cluster size.  Must be a power of 2
+#     between 512 and 64M (since 1.4).
 #
-# @buf-size: maximum amount of data in flight from source to
-#            target (since 1.4).
+# @buf-size: maximum amount of data in flight from source to target
+#     (since 1.4).
 #
 # @on-source-error: the action to take on an error on the source,
-#                   default 'report'.  'stop' and 'enospc' can only be used
-#                   if the block device supports io-status (see BlockInfo).
+#     default 'report'.  'stop' and 'enospc' can only be used if the
+#     block device supports io-status (see BlockInfo).
 #
 # @on-target-error: the action to take on an error on the target,
-#                   default 'report' (no limitations, since this applies to
-#                   a different block device than @device).
+#     default 'report' (no limitations, since this applies to a
+#     different block device than @device).
 #
-# @unmap: Whether to try to unmap target sectors where source has
-#         only zero. If true, and target unallocated sectors will read as zero,
-#         target image sectors will be unmapped; otherwise, zeroes will be
-#         written. Both will result in identical contents.
-#         Default is true. (Since 2.4)
+# @unmap: Whether to try to unmap target sectors where source has only
+#     zero.  If true, and target unallocated sectors will read as
+#     zero, target image sectors will be unmapped; otherwise, zeroes
+#     will be written.  Both will result in identical contents.
+#     Default is true.  (Since 2.4)
 #
-# @copy-mode: when to copy data to the destination; defaults to 'background'
-#             (Since: 3.0)
+# @copy-mode: when to copy data to the destination; defaults to
+#     'background' (Since: 3.0)
 #
-# @auto-finalize: When false, this job will wait in a PENDING state after it has
-#                 finished its work, waiting for @block-job-finalize before
-#                 making any block graph changes.
-#                 When true, this job will automatically
-#                 perform its abort or commit actions.
-#                 Defaults to true. (Since 3.1)
+# @auto-finalize: When false, this job will wait in a PENDING state
+#     after it has finished its work, waiting for @block-job-finalize
+#     before making any block graph changes.  When true, this job will
+#     automatically perform its abort or commit actions.  Defaults to
+#     true.  (Since 3.1)
 #
-# @auto-dismiss: When false, this job will wait in a CONCLUDED state after it
-#                has completely ceased all work, and awaits @block-job-dismiss.
-#                When true, this job will automatically disappear from the query
-#                list without user intervention.
-#                Defaults to true. (Since 3.1)
+# @auto-dismiss: When false, this job will wait in a CONCLUDED state
+#     after it has completely ceased all work, and awaits
+#     @block-job-dismiss.  When true, this job will automatically
+#     disappear from the query list without user intervention.
+#     Defaults to true.  (Since 3.1)
 #
 # Since: 1.3
 ##
@@ -2165,16 +2173,16 @@
 # @name: name of the dirty bitmap (must be less than 1024 bytes)
 #
 # @granularity: the bitmap granularity, default is 64k for
-#               block-dirty-bitmap-add
+#     block-dirty-bitmap-add
 #
 # @persistent: the bitmap is persistent, i.e. it will be saved to the
-#              corresponding block device image file on its close. For now only
-#              Qcow2 disks support persistent bitmaps. Default is false for
-#              block-dirty-bitmap-add. (Since: 2.10)
+#     corresponding block device image file on its close.  For now
+#     only Qcow2 disks support persistent bitmaps.  Default is false
+#     for block-dirty-bitmap-add.  (Since: 2.10)
 #
-# @disabled: the bitmap is created in the disabled state, which means that
-#            it will not track drive changes. The bitmap may be enabled with
-#            block-dirty-bitmap-enable. Default is false. (Since: 4.0)
+# @disabled: the bitmap is created in the disabled state, which means
+#     that it will not track drive changes.  The bitmap may be enabled
+#     with block-dirty-bitmap-enable.  Default is false.  (Since: 4.0)
 #
 # Since: 2.4
 ##
@@ -2185,7 +2193,8 @@
 ##
 # @BlockDirtyBitmapOrStr:
 #
-# @local: name of the bitmap, attached to the same node as target bitmap.
+# @local: name of the bitmap, attached to the same node as target
+#     bitmap.
 #
 # @external: bitmap with specified node
 #
@@ -2202,9 +2211,9 @@
 #
 # @target: name of the destination dirty bitmap
 #
-# @bitmaps: name(s) of the source dirty bitmap(s) at @node and/or fully
-#           specified BlockDirtyBitmap elements. The latter are supported
-#           since 4.1.
+# @bitmaps: name(s) of the source dirty bitmap(s) at @node and/or
+#     fully specified BlockDirtyBitmap elements.  The latter are
+#     supported since 4.1.
 #
 # Since: 4.0
 ##
@@ -2215,11 +2224,13 @@
 ##
 # @block-dirty-bitmap-add:
 #
-# Create a dirty bitmap with a name on the node, and start tracking the writes.
+# Create a dirty bitmap with a name on the node, and start tracking
+# the writes.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device or node, DeviceNotFound
-#          - If @name is already taken, GenericError with an explanation
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device or node, DeviceNotFound
+#     - If @name is already taken, GenericError with an explanation
 #
 # Since: 2.4
 #
@@ -2228,7 +2239,6 @@
 # -> { "execute": "block-dirty-bitmap-add",
 #      "arguments": { "node": "drive0", "name": "bitmap0" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-add',
   'data': 'BlockDirtyBitmapAdd',
@@ -2238,13 +2248,14 @@
 # @block-dirty-bitmap-remove:
 #
 # Stop write tracking and remove the dirty bitmap that was created
-# with block-dirty-bitmap-add. If the bitmap is persistent, remove it from its
-# storage too.
+# with block-dirty-bitmap-add.  If the bitmap is persistent, remove it
+# from its storage too.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device or node, DeviceNotFound
-#          - If @name is not found, GenericError with an explanation
-#          - if @name is frozen by an operation, GenericError
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device or node, DeviceNotFound
+#     - If @name is not found, GenericError with an explanation
+#     - if @name is frozen by an operation, GenericError
 #
 # Since: 2.4
 #
@@ -2253,7 +2264,6 @@
 # -> { "execute": "block-dirty-bitmap-remove",
 #      "arguments": { "node": "drive0", "name": "bitmap0" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-remove',
   'data': 'BlockDirtyBitmap',
@@ -2266,9 +2276,10 @@
 # backup from this point in time forward will only backup clusters
 # modified after this clear operation.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device, DeviceNotFound
-#          - If @name is not found, GenericError with an explanation
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device, DeviceNotFound
+#     - If @name is not found, GenericError with an explanation
 #
 # Since: 2.4
 #
@@ -2277,7 +2288,6 @@
 # -> { "execute": "block-dirty-bitmap-clear",
 #      "arguments": { "node": "drive0", "name": "bitmap0" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-clear',
   'data': 'BlockDirtyBitmap',
@@ -2288,9 +2298,10 @@
 #
 # Enables a dirty bitmap so that it will begin tracking disk changes.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device, DeviceNotFound
-#          - If @name is not found, GenericError with an explanation
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device, DeviceNotFound
+#     - If @name is not found, GenericError with an explanation
 #
 # Since: 4.0
 #
@@ -2299,7 +2310,6 @@
 # -> { "execute": "block-dirty-bitmap-enable",
 #      "arguments": { "node": "drive0", "name": "bitmap0" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-enable',
   'data': 'BlockDirtyBitmap',
@@ -2310,9 +2320,10 @@
 #
 # Disables a dirty bitmap so that it will stop tracking disk changes.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device, DeviceNotFound
-#          - If @name is not found, GenericError with an explanation
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device, DeviceNotFound
+#     - If @name is not found, GenericError with an explanation
 #
 # Since: 4.0
 #
@@ -2321,7 +2332,6 @@
 # -> { "execute": "block-dirty-bitmap-disable",
 #      "arguments": { "node": "drive0", "name": "bitmap0" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-disable',
   'data': 'BlockDirtyBitmap',
@@ -2331,20 +2341,22 @@
 # @block-dirty-bitmap-merge:
 #
 # Merge dirty bitmaps listed in @bitmaps to the @target dirty bitmap.
-# Dirty bitmaps in @bitmaps will be unchanged, except if it also appears
-# as the @target bitmap. Any bits already set in @target will still be
-# set after the merge, i.e., this operation does not clear the target.
-# On error, @target is unchanged.
+# Dirty bitmaps in @bitmaps will be unchanged, except if it also
+# appears as the @target bitmap.  Any bits already set in @target will
+# still be set after the merge, i.e., this operation does not clear
+# the target.  On error, @target is unchanged.
 #
-# The resulting bitmap will count as dirty any clusters that were dirty in any
-# of the source bitmaps. This can be used to achieve backup checkpoints, or in
-# simpler usages, to copy bitmaps.
+# The resulting bitmap will count as dirty any clusters that were
+# dirty in any of the source bitmaps.  This can be used to achieve
+# backup checkpoints, or in simpler usages, to copy bitmaps.
 #
-# Returns: - nothing on success
-#          - If @node is not a valid block device, DeviceNotFound
-#          - If any bitmap in @bitmaps or @target is not found, GenericError
-#          - If any of the bitmaps have different sizes or granularities,
-#            GenericError
+# Returns:
+#     - nothing on success
+#     - If @node is not a valid block device, DeviceNotFound
+#     - If any bitmap in @bitmaps or @target is not found,
+#       GenericError
+#     - If any of the bitmaps have different sizes or granularities,
+#       GenericError
 #
 # Since: 4.0
 #
@@ -2354,7 +2366,6 @@
 #      "arguments": { "node": "drive0", "target": "bitmap0",
 #                     "bitmaps": ["bitmap1"] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-dirty-bitmap-merge',
   'data': 'BlockDirtyBitmapMerge',
@@ -2378,12 +2389,14 @@
 # Get bitmap SHA256.
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
-# Returns: - BlockDirtyBitmapSha256 on success
-#          - If @node is not a valid block device, DeviceNotFound
-#          - If @name is not found or if hashing has failed, GenericError with an
-#            explanation
+# Returns:
+#     - BlockDirtyBitmapSha256 on success
+#     - If @node is not a valid block device, DeviceNotFound
+#     - If @name is not found or if hashing has failed, GenericError
+#       with an explanation
 #
 # Since: 2.10
 ##
@@ -2397,62 +2410,60 @@
 #
 # Start mirroring a block device's writes to a new destination.
 #
-# @job-id: identifier for the newly-created block job. If
-#          omitted, the device name will be used. (Since 2.7)
+# @job-id: identifier for the newly-created block job.  If omitted,
+#     the device name will be used.  (Since 2.7)
 #
-# @device: The device name or node-name of a root node whose writes should be
-#          mirrored.
+# @device: The device name or node-name of a root node whose writes
+#     should be mirrored.
 #
-# @target: the id or node-name of the block device to mirror to. This mustn't be
-#          attached to guest.
+# @target: the id or node-name of the block device to mirror to.  This
+#     mustn't be attached to guest.
 #
 # @replaces: with sync=full graph node name to be replaced by the new
-#            image when a whole image copy is done. This can be used to repair
-#            broken Quorum files.  By default, @device is replaced, although
-#            implicitly created filters on it are kept.
+#     image when a whole image copy is done.  This can be used to
+#     repair broken Quorum files.  By default, @device is replaced,
+#     although implicitly created filters on it are kept.
 #
 # @speed: the maximum speed, in bytes per second
 #
-# @sync: what parts of the disk image should be copied to the destination
-#        (all the disk, only the sectors allocated in the topmost image, or
-#        only new I/O).
+# @sync: what parts of the disk image should be copied to the
+#     destination (all the disk, only the sectors allocated in the
+#     topmost image, or only new I/O).
 #
-# @granularity: granularity of the dirty bitmap, default is 64K
-#               if the image format doesn't have clusters, 4K if the clusters
-#               are smaller than that, else the cluster size.  Must be a
-#               power of 2 between 512 and 64M
+# @granularity: granularity of the dirty bitmap, default is 64K if the
+#     image format doesn't have clusters, 4K if the clusters are
+#     smaller than that, else the cluster size.  Must be a power of 2
+#     between 512 and 64M
 #
-# @buf-size: maximum amount of data in flight from source to
-#            target
+# @buf-size: maximum amount of data in flight from source to target
 #
 # @on-source-error: the action to take on an error on the source,
-#                   default 'report'.  'stop' and 'enospc' can only be used
-#                   if the block device supports io-status (see BlockInfo).
+#     default 'report'.  'stop' and 'enospc' can only be used if the
+#     block device supports io-status (see BlockInfo).
 #
 # @on-target-error: the action to take on an error on the target,
-#                   default 'report' (no limitations, since this applies to
-#                   a different block device than @device).
+#     default 'report' (no limitations, since this applies to a
+#     different block device than @device).
 #
 # @filter-node-name: the node name that should be assigned to the
-#                    filter driver that the mirror job inserts into the graph
-#                    above @device. If this option is not given, a node name is
-#                    autogenerated. (Since: 2.9)
+#     filter driver that the mirror job inserts into the graph above
+#     @device.  If this option is not given, a node name is
+#     autogenerated.  (Since: 2.9)
 #
-# @copy-mode: when to copy data to the destination; defaults to 'background'
-#             (Since: 3.0)
+# @copy-mode: when to copy data to the destination; defaults to
+#     'background' (Since: 3.0)
 #
-# @auto-finalize: When false, this job will wait in a PENDING state after it has
-#                 finished its work, waiting for @block-job-finalize before
-#                 making any block graph changes.
-#                 When true, this job will automatically
-#                 perform its abort or commit actions.
-#                 Defaults to true. (Since 3.1)
+# @auto-finalize: When false, this job will wait in a PENDING state
+#     after it has finished its work, waiting for @block-job-finalize
+#     before making any block graph changes.  When true, this job will
+#     automatically perform its abort or commit actions.  Defaults to
+#     true.  (Since 3.1)
 #
-# @auto-dismiss: When false, this job will wait in a CONCLUDED state after it
-#                has completely ceased all work, and awaits @block-job-dismiss.
-#                When true, this job will automatically disappear from the query
-#                list without user intervention.
-#                Defaults to true. (Since 3.1)
+# @auto-dismiss: When false, this job will wait in a CONCLUDED state
+#     after it has completely ceased all work, and awaits
+#     @block-job-dismiss.  When true, this job will automatically
+#     disappear from the query list without user intervention.
+#     Defaults to true.  (Since 3.1)
 #
 # Returns: nothing on success.
 #
@@ -2465,7 +2476,6 @@
 #                     "target": "target0",
 #                     "sync": "full" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-mirror',
   'data': { '*job-id': 'str', 'device': 'str', 'target': 'str',
@@ -2500,59 +2510,53 @@
 #
 # @iops_wr: write I/O operations per second
 #
-# @bps_max: total throughput limit during bursts,
-#           in bytes (Since 1.7)
+# @bps_max: total throughput limit during bursts, in bytes (Since 1.7)
 #
-# @bps_rd_max: read throughput limit during bursts,
-#              in bytes (Since 1.7)
+# @bps_rd_max: read throughput limit during bursts, in bytes (Since
+#     1.7)
 #
-# @bps_wr_max: write throughput limit during bursts,
-#              in bytes (Since 1.7)
+# @bps_wr_max: write throughput limit during bursts, in bytes (Since
+#     1.7)
 #
-# @iops_max: total I/O operations per second during bursts,
-#            in bytes (Since 1.7)
+# @iops_max: total I/O operations per second during bursts, in bytes
+#     (Since 1.7)
 #
-# @iops_rd_max: read I/O operations per second during bursts,
-#               in bytes (Since 1.7)
+# @iops_rd_max: read I/O operations per second during bursts, in bytes
+#     (Since 1.7)
 #
-# @iops_wr_max: write I/O operations per second during bursts,
-#               in bytes (Since 1.7)
+# @iops_wr_max: write I/O operations per second during bursts, in
+#     bytes (Since 1.7)
 #
-# @bps_max_length: maximum length of the @bps_max burst
-#                  period, in seconds. It must only
-#                  be set if @bps_max is set as well.
-#                  Defaults to 1. (Since 2.6)
+# @bps_max_length: maximum length of the @bps_max burst period, in
+#     seconds.  It must only be set if @bps_max is set as well.
+#     Defaults to 1. (Since 2.6)
 #
-# @bps_rd_max_length: maximum length of the @bps_rd_max
-#                     burst period, in seconds. It must only
-#                     be set if @bps_rd_max is set as well.
-#                     Defaults to 1. (Since 2.6)
+# @bps_rd_max_length: maximum length of the @bps_rd_max burst period,
+#     in seconds.  It must only be set if @bps_rd_max is set as well.
+#     Defaults to 1. (Since 2.6)
 #
-# @bps_wr_max_length: maximum length of the @bps_wr_max
-#                     burst period, in seconds. It must only
-#                     be set if @bps_wr_max is set as well.
-#                     Defaults to 1. (Since 2.6)
+# @bps_wr_max_length: maximum length of the @bps_wr_max burst period,
+#     in seconds.  It must only be set if @bps_wr_max is set as well.
+#     Defaults to 1. (Since 2.6)
 #
-# @iops_max_length: maximum length of the @iops burst
-#                   period, in seconds. It must only
-#                   be set if @iops_max is set as well.
-#                   Defaults to 1. (Since 2.6)
+# @iops_max_length: maximum length of the @iops burst period, in
+#     seconds.  It must only be set if @iops_max is set as well.
+#     Defaults to 1. (Since 2.6)
 #
-# @iops_rd_max_length: maximum length of the @iops_rd_max
-#                      burst period, in seconds. It must only
-#                      be set if @iops_rd_max is set as well.
-#                      Defaults to 1. (Since 2.6)
+# @iops_rd_max_length: maximum length of the @iops_rd_max burst
+#     period, in seconds.  It must only be set if @iops_rd_max is set
+#     as well.  Defaults to 1. (Since 2.6)
 #
-# @iops_wr_max_length: maximum length of the @iops_wr_max
-#                      burst period, in seconds. It must only
-#                      be set if @iops_wr_max is set as well.
-#                      Defaults to 1. (Since 2.6)
+# @iops_wr_max_length: maximum length of the @iops_wr_max burst
+#     period, in seconds.  It must only be set if @iops_wr_max is set
+#     as well.  Defaults to 1. (Since 2.6)
 #
 # @iops_size: an I/O size in bytes (Since 1.7)
 #
 # @group: throttle group name (Since 2.4)
 #
 # Features:
+#
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
 # Since: 1.1
@@ -2572,35 +2576,55 @@
 ##
 # @ThrottleLimits:
 #
-# Limit parameters for throttling.
-# Since some limit combinations are illegal, limits should always be set in one
-# transaction. All fields are optional. When setting limits, if a field is
-# missing the current value is not changed.
+# Limit parameters for throttling.  Since some limit combinations are
+# illegal, limits should always be set in one transaction.  All fields
+# are optional.  When setting limits, if a field is missing the
+# current value is not changed.
 #
 # @iops-total: limit total I/O operations per second
+#
 # @iops-total-max: I/O operations burst
-# @iops-total-max-length: length of the iops-total-max burst period, in seconds
-#                         It must only be set if @iops-total-max is set as well.
+#
+# @iops-total-max-length: length of the iops-total-max burst period,
+#     in seconds It must only be set if @iops-total-max is set as
+#     well.
+#
 # @iops-read: limit read operations per second
+#
 # @iops-read-max: I/O operations read burst
-# @iops-read-max-length: length of the iops-read-max burst period, in seconds
-#                        It must only be set if @iops-read-max is set as well.
+#
+# @iops-read-max-length: length of the iops-read-max burst period, in
+#     seconds It must only be set if @iops-read-max is set as well.
+#
 # @iops-write: limit write operations per second
+#
 # @iops-write-max: I/O operations write burst
-# @iops-write-max-length: length of the iops-write-max burst period, in seconds
-#                         It must only be set if @iops-write-max is set as well.
+#
+# @iops-write-max-length: length of the iops-write-max burst period,
+#     in seconds It must only be set if @iops-write-max is set as
+#     well.
+#
 # @bps-total: limit total bytes per second
+#
 # @bps-total-max: total bytes burst
-# @bps-total-max-length: length of the bps-total-max burst period, in seconds.
-#                        It must only be set if @bps-total-max is set as well.
+#
+# @bps-total-max-length: length of the bps-total-max burst period, in
+#     seconds.  It must only be set if @bps-total-max is set as well.
+#
 # @bps-read: limit read bytes per second
+#
 # @bps-read-max: total bytes read burst
-# @bps-read-max-length: length of the bps-read-max burst period, in seconds
-#                       It must only be set if @bps-read-max is set as well.
+#
+# @bps-read-max-length: length of the bps-read-max burst period, in
+#     seconds It must only be set if @bps-read-max is set as well.
+#
 # @bps-write: limit write bytes per second
+#
 # @bps-write-max: total bytes write burst
-# @bps-write-max-length: length of the bps-write-max burst period, in seconds
-#                        It must only be set if @bps-write-max is set as well.
+#
+# @bps-write-max-length: length of the bps-write-max burst period, in
+#     seconds It must only be set if @bps-write-max is set as well.
+#
 # @iops-size: when limiting by iops max size of an I/O in bytes
 #
 # Since: 2.11
@@ -2625,11 +2649,11 @@
 # @limits: limits to apply for this throttle group
 #
 # Features:
+#
 # @unstable: All members starting with x- are aliases for the same key
-#            without x- in the @limits object.  This is not a stable
-#            interface and may be removed or changed incompatibly in
-#            the future.  Use @limits for a supported stable
-#            interface.
+#     without x- in the @limits object.  This is not a stable
+#     interface and may be removed or changed incompatibly in the
+#     future.  Use @limits for a supported stable interface.
 #
 # Since: 2.11
 ##
@@ -2679,90 +2703,90 @@
 #
 # Copy data from a backing file into a block device.
 #
-# The block streaming operation is performed in the background until the entire
-# backing file has been copied.  This command returns immediately once streaming
-# has started.  The status of ongoing block streaming operations can be checked
-# with query-block-jobs.  The operation can be stopped before it has completed
-# using the block-job-cancel command.
+# The block streaming operation is performed in the background until
+# the entire backing file has been copied.  This command returns
+# immediately once streaming has started.  The status of ongoing block
+# streaming operations can be checked with query-block-jobs.  The
+# operation can be stopped before it has completed using the
+# block-job-cancel command.
 #
-# The node that receives the data is called the top image, can be located in
-# any part of the chain (but always above the base image; see below) and can be
-# specified using its device or node name. Earlier qemu versions only allowed
-# 'device' to name the top level node; presence of the 'base-node' parameter
-# during introspection can be used as a witness of the enhanced semantics
-# of 'device'.
+# The node that receives the data is called the top image, can be
+# located in any part of the chain (but always above the base image;
+# see below) and can be specified using its device or node name.
+# Earlier qemu versions only allowed 'device' to name the top level
+# node; presence of the 'base-node' parameter during introspection can
+# be used as a witness of the enhanced semantics of 'device'.
 #
-# If a base file is specified then sectors are not copied from that base file and
-# its backing chain.  This can be used to stream a subset of the backing file
-# chain instead of flattening the entire image.
-# When streaming completes the image file will have the base file as its backing
-# file, unless that node was changed while the job was running.  In that case,
-# base's parent's backing (or filtered, whichever exists) child (i.e., base at
-# the beginning of the job) will be the new backing file.
+# If a base file is specified then sectors are not copied from that
+# base file and its backing chain.  This can be used to stream a
+# subset of the backing file chain instead of flattening the entire
+# image.  When streaming completes the image file will have the base
+# file as its backing file, unless that node was changed while the job
+# was running.  In that case, base's parent's backing (or filtered,
+# whichever exists) child (i.e., base at the beginning of the job)
+# will be the new backing file.
 #
-# On successful completion the image file is updated to drop the backing file
-# and the BLOCK_JOB_COMPLETED event is emitted.
+# On successful completion the image file is updated to drop the
+# backing file and the BLOCK_JOB_COMPLETED event is emitted.
 #
-# In case @device is a filter node, block-stream modifies the first non-filter
-# overlay node below it to point to the new backing node instead of modifying
-# @device itself.
+# In case @device is a filter node, block-stream modifies the first
+# non-filter overlay node below it to point to the new backing node
+# instead of modifying @device itself.
 #
-# @job-id: identifier for the newly-created block job. If
-#          omitted, the device name will be used. (Since 2.7)
+# @job-id: identifier for the newly-created block job.  If omitted,
+#     the device name will be used.  (Since 2.7)
 #
 # @device: the device or node name of the top image
 #
-# @base: the common backing file name.
-#        It cannot be set if @base-node or @bottom is also set.
+# @base: the common backing file name.  It cannot be set if @base-node
+#     or @bottom is also set.
 #
-# @base-node: the node name of the backing file.
-#             It cannot be set if @base or @bottom is also set. (Since 2.8)
+# @base-node: the node name of the backing file.  It cannot be set if
+#     @base or @bottom is also set.  (Since 2.8)
 #
 # @bottom: the last node in the chain that should be streamed into
-#          top. It cannot be set if @base or @base-node is also set.
-#          It cannot be filter node. (Since 6.0)
+#     top.  It cannot be set if @base or @base-node is also set.  It
+#     cannot be filter node.  (Since 6.0)
 #
-# @backing-file: The backing file string to write into the top
-#                image. This filename is not validated.
+# @backing-file: The backing file string to write into the top image.
+#     This filename is not validated.
 #
-#                If a pathname string is such that it cannot be
-#                resolved by QEMU, that means that subsequent QMP or
-#                HMP commands must use node-names for the image in
-#                question, as filename lookup methods will fail.
+#     If a pathname string is such that it cannot be resolved by QEMU,
+#     that means that subsequent QMP or HMP commands must use
+#     node-names for the image in question, as filename lookup methods
+#     will fail.
 #
-#                If not specified, QEMU will automatically determine
-#                the backing file string to use, or error out if there
-#                is no obvious choice.  Care should be taken when
-#                specifying the string, to specify a valid filename or
-#                protocol.
-#                (Since 2.1)
+#     If not specified, QEMU will automatically determine the backing
+#     file string to use, or error out if there is no obvious choice.
+#     Care should be taken when specifying the string, to specify a
+#     valid filename or protocol.  (Since 2.1)
 #
 # @speed: the maximum speed, in bytes per second
 #
-# @on-error: the action to take on an error (default report).
-#            'stop' and 'enospc' can only be used if the block device
-#            supports io-status (see BlockInfo).  (Since 1.3)
+# @on-error: the action to take on an error (default report). 'stop'
+#     and 'enospc' can only be used if the block device supports
+#     io-status (see BlockInfo).  (Since 1.3)
 #
 # @filter-node-name: the node name that should be assigned to the
-#                    filter driver that the stream job inserts into the graph
-#                    above @device. If this option is not given, a node name is
-#                    autogenerated. (Since: 6.0)
+#     filter driver that the stream job inserts into the graph above
+#     @device.  If this option is not given, a node name is
+#     autogenerated.  (Since: 6.0)
 #
-# @auto-finalize: When false, this job will wait in a PENDING state after it has
-#                 finished its work, waiting for @block-job-finalize before
-#                 making any block graph changes.
-#                 When true, this job will automatically
-#                 perform its abort or commit actions.
-#                 Defaults to true. (Since 3.1)
+# @auto-finalize: When false, this job will wait in a PENDING state
+#     after it has finished its work, waiting for @block-job-finalize
+#     before making any block graph changes.  When true, this job will
+#     automatically perform its abort or commit actions.  Defaults to
+#     true.  (Since 3.1)
 #
-# @auto-dismiss: When false, this job will wait in a CONCLUDED state after it
-#                has completely ceased all work, and awaits @block-job-dismiss.
-#                When true, this job will automatically disappear from the query
-#                list without user intervention.
-#                Defaults to true. (Since 3.1)
+# @auto-dismiss: When false, this job will wait in a CONCLUDED state
+#     after it has completely ceased all work, and awaits
+#     @block-job-dismiss.  When true, this job will automatically
+#     disappear from the query list without user intervention.
+#     Defaults to true.  (Since 3.1)
 #
-# Returns: - Nothing on success.
-#          - If @device does not exist, DeviceNotFound.
+# Returns:
+#     - Nothing on success.
+#     - If @device does not exist, DeviceNotFound.
 #
 # Since: 1.1
 #
@@ -2772,7 +2796,6 @@
 #      "arguments": { "device": "virtio0",
 #                     "base": "/tmp/master.qcow2" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-stream',
   'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
@@ -2791,15 +2814,17 @@
 #
 # Throttling can be disabled by setting the speed to 0.
 #
-# @device: The job identifier. This used to be a device name (hence
-#          the name of the parameter), but since QEMU 2.7 it can have
-#          other values.
+# @device: The job identifier.  This used to be a device name (hence
+#     the name of the parameter), but since QEMU 2.7 it can have other
+#     values.
 #
 # @speed: the maximum speed, in bytes per second, or 0 for unlimited.
-#         Defaults to 0.
+#     Defaults to 0.
 #
-# Returns: - Nothing on success
-#          - If no background operation is active on this device, DeviceNotActive
+# Returns:
+#     - Nothing on success
+#     - If no background operation is active on this device,
+#       DeviceNotActive
 #
 # Since: 1.1
 ##
@@ -2812,35 +2837,39 @@
 #
 # Stop an active background block operation.
 #
-# This command returns immediately after marking the active background block
-# operation for cancellation.  It is an error to call this command if no
-# operation is in progress.
+# This command returns immediately after marking the active background
+# block operation for cancellation.  It is an error to call this
+# command if no operation is in progress.
 #
 # The operation will cancel as soon as possible and then emit the
-# BLOCK_JOB_CANCELLED event.  Before that happens the job is still visible when
-# enumerated using query-block-jobs.
+# BLOCK_JOB_CANCELLED event.  Before that happens the job is still
+# visible when enumerated using query-block-jobs.
 #
-# Note that if you issue 'block-job-cancel' after 'drive-mirror' has indicated
-# (via the event BLOCK_JOB_READY) that the source and destination are
-# synchronized, then the event triggered by this command changes to
-# BLOCK_JOB_COMPLETED, to indicate that the mirroring has ended and the
-# destination now has a point-in-time copy tied to the time of the cancellation.
+# Note that if you issue 'block-job-cancel' after 'drive-mirror' has
+# indicated (via the event BLOCK_JOB_READY) that the source and
+# destination are synchronized, then the event triggered by this
+# command changes to BLOCK_JOB_COMPLETED, to indicate that the
+# mirroring has ended and the destination now has a point-in-time copy
+# tied to the time of the cancellation.
 #
-# For streaming, the image file retains its backing file unless the streaming
-# operation happens to complete just as it is being cancelled.  A new streaming
-# operation can be started at a later time to finish copying all data from the
-# backing file.
+# For streaming, the image file retains its backing file unless the
+# streaming operation happens to complete just as it is being
+# cancelled.  A new streaming operation can be started at a later time
+# to finish copying all data from the backing file.
 #
-# @device: The job identifier. This used to be a device name (hence
-#          the name of the parameter), but since QEMU 2.7 it can have
-#          other values.
+# @device: The job identifier.  This used to be a device name (hence
+#     the name of the parameter), but since QEMU 2.7 it can have other
+#     values.
 #
-# @force: If true, and the job has already emitted the event BLOCK_JOB_READY,
-#         abandon the job immediately (even if it is paused) instead of waiting
-#         for the destination to complete its final synchronization (since 1.3)
+# @force: If true, and the job has already emitted the event
+#     BLOCK_JOB_READY, abandon the job immediately (even if it is
+#     paused) instead of waiting for the destination to complete its
+#     final synchronization (since 1.3)
 #
-# Returns: - Nothing on success
-#          - If no background operation is active on this device, DeviceNotActive
+# Returns:
+#     - Nothing on success
+#     - If no background operation is active on this device,
+#       DeviceNotActive
 #
 # Since: 1.1
 ##
@@ -2852,20 +2881,22 @@
 #
 # Pause an active background block operation.
 #
-# This command returns immediately after marking the active background block
-# operation for pausing.  It is an error to call this command if no
-# operation is in progress or if the job is already paused.
+# This command returns immediately after marking the active background
+# block operation for pausing.  It is an error to call this command if
+# no operation is in progress or if the job is already paused.
 #
-# The operation will pause as soon as possible.  No event is emitted when
-# the operation is actually paused.  Cancelling a paused job automatically
-# resumes it.
+# The operation will pause as soon as possible.  No event is emitted
+# when the operation is actually paused.  Cancelling a paused job
+# automatically resumes it.
 #
-# @device: The job identifier. This used to be a device name (hence
-#          the name of the parameter), but since QEMU 2.7 it can have
-#          other values.
+# @device: The job identifier.  This used to be a device name (hence
+#     the name of the parameter), but since QEMU 2.7 it can have other
+#     values.
 #
-# Returns: - Nothing on success
-#          - If no background operation is active on this device, DeviceNotActive
+# Returns:
+#     - Nothing on success
+#     - If no background operation is active on this device,
+#       DeviceNotActive
 #
 # Since: 1.3
 ##
@@ -2877,18 +2908,20 @@
 #
 # Resume an active background block operation.
 #
-# This command returns immediately after resuming a paused background block
-# operation.  It is an error to call this command if no operation is in
-# progress or if the job is not paused.
+# This command returns immediately after resuming a paused background
+# block operation.  It is an error to call this command if no
+# operation is in progress or if the job is not paused.
 #
 # This command also clears the error status of the job.
 #
-# @device: The job identifier. This used to be a device name (hence
-#          the name of the parameter), but since QEMU 2.7 it can have
-#          other values.
+# @device: The job identifier.  This used to be a device name (hence
+#     the name of the parameter), but since QEMU 2.7 it can have other
+#     values.
 #
-# Returns: - Nothing on success
-#          - If no background operation is active on this device, DeviceNotActive
+# Returns:
+#     - Nothing on success
+#     - If no background operation is active on this device,
+#       DeviceNotActive
 #
 # Since: 1.3
 ##
@@ -2898,26 +2931,29 @@
 ##
 # @block-job-complete:
 #
-# Manually trigger completion of an active background block operation.  This
-# is supported for drive mirroring, where it also switches the device to
-# write to the target path only.  The ability to complete is signaled with
-# a BLOCK_JOB_READY event.
+# Manually trigger completion of an active background block operation.
+# This is supported for drive mirroring, where it also switches the
+# device to write to the target path only.  The ability to complete is
+# signaled with a BLOCK_JOB_READY event.
 #
-# This command completes an active background block operation synchronously.
-# The ordering of this command's return with the BLOCK_JOB_COMPLETED event
-# is not defined.  Note that if an I/O error occurs during the processing of
-# this command: 1) the command itself will fail; 2) the error will be processed
-# according to the rerror/werror arguments that were specified when starting
-# the operation.
+# This command completes an active background block operation
+# synchronously.  The ordering of this command's return with the
+# BLOCK_JOB_COMPLETED event is not defined.  Note that if an I/O error
+# occurs during the processing of this command: 1) the command itself
+# will fail; 2) the error will be processed according to the
+# rerror/werror arguments that were specified when starting the
+# operation.
 #
 # A cancelled or paused job cannot be completed.
 #
-# @device: The job identifier. This used to be a device name (hence
-#          the name of the parameter), but since QEMU 2.7 it can have
-#          other values.
+# @device: The job identifier.  This used to be a device name (hence
+#     the name of the parameter), but since QEMU 2.7 it can have other
+#     values.
 #
-# Returns: - Nothing on success
-#          - If no background operation is active on this device, DeviceNotActive
+# Returns:
+#     - Nothing on success
+#     - If no background operation is active on this device,
+#       DeviceNotActive
 #
 # Since: 1.3
 ##
@@ -2927,14 +2963,15 @@
 ##
 # @block-job-dismiss:
 #
-# For jobs that have already concluded, remove them from the block-job-query
-# list. This command only needs to be run for jobs which were started with
-# QEMU 2.12+ job lifetime management semantics.
+# For jobs that have already concluded, remove them from the
+# block-job-query list.  This command only needs to be run for jobs
+# which were started with QEMU 2.12+ job lifetime management
+# semantics.
 #
-# This command will refuse to operate on any job that has not yet reached
-# its terminal state, JOB_STATUS_CONCLUDED. For jobs that make use of the
-# BLOCK_JOB_READY event, block-job-cancel or block-job-complete will still need
-# to be used as appropriate.
+# This command will refuse to operate on any job that has not yet
+# reached its terminal state, JOB_STATUS_CONCLUDED. For jobs that make
+# use of the BLOCK_JOB_READY event, block-job-cancel or
+# block-job-complete will still need to be used as appropriate.
 #
 # @id: The job identifier.
 #
@@ -2949,11 +2986,11 @@
 # @block-job-finalize:
 #
 # Once a job that has manual=true reaches the pending state, it can be
-# instructed to finalize any graph changes and do any necessary cleanup
-# via this command.
-# For jobs in a transaction, instructing one job to finalize will force
-# ALL jobs in the transaction to finalize, so it is only necessary to instruct
-# a single member job to finalize.
+# instructed to finalize any graph changes and do any necessary
+# cleanup via this command.  For jobs in a transaction, instructing
+# one job to finalize will force ALL jobs in the transaction to
+# finalize, so it is only necessary to instruct a single member job to
+# finalize.
 #
 # @id: The job identifier.
 #
@@ -2970,6 +3007,7 @@
 # Determines how to handle discard requests.
 #
 # @ignore: Ignore the request
+#
 # @unmap: Forward as an unmap request
 #
 # Since: 2.9
@@ -2981,12 +3019,16 @@
 # @BlockdevDetectZeroesOptions:
 #
 # Describes the operation mode for the automatic conversion of plain
-# zero writes by the OS to driver specific optimized zero write commands.
+# zero writes by the OS to driver specific optimized zero write
+# commands.
 #
 # @off: Disabled (default)
+#
 # @on: Enabled
-# @unmap: Enabled and even try to unmap blocks if possible. This requires
-#         also that @BlockdevDiscardOptions is set to unmap for this device.
+#
+# @unmap: Enabled and even try to unmap blocks if possible.  This
+#     requires also that @BlockdevDiscardOptions is set to unmap for
+#     this device.
 #
 # Since: 2.1
 ##
@@ -2999,7 +3041,9 @@
 # Selects the AIO backend to handle I/O requests
 #
 # @threads: Use qemu's thread pool
+#
 # @native: Use native AIO backend (only Linux and Windows)
+#
 # @io_uring: Use linux io_uring (since 5.0)
 #
 # Since: 2.9
@@ -3014,9 +3058,9 @@
 # Includes cache-related options for block devices
 #
 # @direct: enables use of O_DIRECT (bypass the host page cache;
-#          default: false)
-# @no-flush: ignore any flush requests for the device (default:
-#            false)
+#     default: false)
+#
+# @no-flush: ignore any flush requests for the device (default: false)
 #
 # Since: 2.9
 ##
@@ -3030,12 +3074,19 @@
 # Drivers that are supported in block device operations.
 #
 # @throttle: Since 2.11
+#
 # @nvme: Since 2.12
+#
 # @copy-on-read: Since 3.0
+#
 # @blklogwrites: Since 3.0
+#
 # @blkreplay: Since 4.2
+#
 # @compress: Since 5.0
+#
 # @copy-before-write: Since 6.2
+#
 # @snapshot-access: Since 7.0
 #
 # Since: 2.9
@@ -3066,36 +3117,43 @@
 # Driver specific block device options for the file backend.
 #
 # @filename: path to the image file
-# @pr-manager: the id for the object that will handle persistent reservations
-#              for this device (default: none, forward the commands via SG_IO;
-#              since 2.11)
+#
+# @pr-manager: the id for the object that will handle persistent
+#     reservations for this device (default: none, forward the
+#     commands via SG_IO; since 2.11)
+#
 # @aio: AIO backend (default: threads) (since: 2.8)
-# @aio-max-batch: maximum number of requests to batch together into a single
-#                 submission in the AIO backend. The smallest value between
-#                 this and the aio-max-batch value of the IOThread object is
-#                 chosen.
-#                 0 means that the AIO backend will handle it automatically.
-#                 (default: 0, since 6.2)
-# @locking: whether to enable file locking. If set to 'auto', only enable
-#           when Open File Descriptor (OFD) locking API is available
-#           (default: auto, since 2.10)
-# @drop-cache: invalidate page cache during live migration.  This prevents
-#              stale data on the migration destination with cache.direct=off.
-#              Currently only supported on Linux hosts.
-#              (default: on, since: 4.0)
-# @x-check-cache-dropped: whether to check that page cache was dropped on live
-#                         migration.  May cause noticeable delays if the image
-#                         file is large, do not use in production.
-#                         (default: off) (since: 3.0)
+#
+# @aio-max-batch: maximum number of requests to batch together into a
+#     single submission in the AIO backend.  The smallest value
+#     between this and the aio-max-batch value of the IOThread object
+#     is chosen.  0 means that the AIO backend will handle it
+#     automatically.  (default: 0, since 6.2)
+#
+# @locking: whether to enable file locking.  If set to 'auto', only
+#     enable when Open File Descriptor (OFD) locking API is available
+#     (default: auto, since 2.10)
+#
+# @drop-cache: invalidate page cache during live migration.  This
+#     prevents stale data on the migration destination with
+#     cache.direct=off.  Currently only supported on Linux hosts.
+#     (default: on, since: 4.0)
+#
+# @x-check-cache-dropped: whether to check that page cache was dropped
+#     on live migration.  May cause noticeable delays if the image
+#     file is large, do not use in production.  (default: off)
+#     (since: 3.0)
 #
 # Features:
-# @dynamic-auto-read-only: If present, enabled auto-read-only means that the
-#                          driver will open the image read-only at first,
-#                          dynamically reopen the image file read-write when
-#                          the first writer is attached to the node and reopen
-#                          read-only when the last writer is detached. This
-#                          allows giving QEMU write permissions only on demand
-#                          when an operation actually needs write access.
+#
+# @dynamic-auto-read-only: If present, enabled auto-read-only means
+#     that the driver will open the image read-only at first,
+#     dynamically reopen the image file read-write when the first
+#     writer is attached to the node and reopen read-only when the
+#     last writer is detached.  This allows giving QEMU write
+#     permissions only on demand when an operation actually needs
+#     write access.
+#
 # @unstable: Member x-check-cache-dropped is meant for debugging.
 #
 # Since: 2.9
@@ -3119,11 +3177,14 @@
 # Driver specific block device options for the null backend.
 #
 # @size: size of the device in bytes.
+#
 # @latency-ns: emulated latency (in nanoseconds) in processing
-#              requests. Default to zero which completes requests immediately.
-#              (Since 2.4)
-# @read-zeroes: if true, reads from the device produce zeroes; if false, the
-#               buffer is left unchanged. (default: false; since: 4.1)
+#     requests.  Default to zero which completes requests immediately.
+#     (Since 2.4)
+#
+# @read-zeroes: if true, reads from the device produce zeroes; if
+#     false, the buffer is left unchanged.
+#     (default: false; since: 4.1)
 #
 # Since: 2.9
 ##
@@ -3135,8 +3196,9 @@
 #
 # Driver specific block device options for the NVMe backend.
 #
-# @device: PCI controller address of the NVMe device in
-#          format hhhh:bb:ss.f (host:bus:slot.function)
+# @device: PCI controller address of the NVMe device in format
+#     hhhh:bb:ss.f (host:bus:slot.function)
+#
 # @namespace: namespace number of the device, starting from 1.
 #
 # Note that the PCI @device must have been unbound from any host
@@ -3153,13 +3215,17 @@
 # Driver specific block device options for the vvfat protocol.
 #
 # @dir: directory to be exported as FAT image
+#
 # @fat-type: FAT type: 12, 16 or 32
-# @floppy: whether to export a floppy image (true) or
-#          partitioned hard disk (false; default)
-# @label: set the volume label, limited to 11 bytes. FAT16 and
-#         FAT32 traditionally have some restrictions on labels, which are
-#         ignored by most operating systems. Defaults to "QEMU VVFAT".
-#         (since 2.4)
+#
+# @floppy: whether to export a floppy image (true) or partitioned hard
+#     disk (false; default)
+#
+# @label: set the volume label, limited to 11 bytes.  FAT16 and FAT32
+#     traditionally have some restrictions on labels, which are
+#     ignored by most operating systems.  Defaults to "QEMU VVFAT".
+#     (since 2.4)
+#
 # @rw: whether to allow write operations (default: false)
 #
 # Since: 2.9
@@ -3171,8 +3237,8 @@
 ##
 # @BlockdevOptionsGenericFormat:
 #
-# Driver specific block device options for image format that have no option
-# besides their data source.
+# Driver specific block device options for image format that have no
+# option besides their data source.
 #
 # @file: reference to or definition of the data source block device
 #
@@ -3186,9 +3252,9 @@
 #
 # Driver specific block device options for LUKS.
 #
-# @key-secret: the ID of a QCryptoSecret object providing
-#              the decryption key (since 2.6). Mandatory except when
-#              doing a metadata-only probe of the image.
+# @key-secret: the ID of a QCryptoSecret object providing the
+#     decryption key (since 2.6). Mandatory except when doing a
+#     metadata-only probe of the image.
 #
 # Since: 2.9
 ##
@@ -3199,12 +3265,12 @@
 ##
 # @BlockdevOptionsGenericCOWFormat:
 #
-# Driver specific block device options for image format that have no option
-# besides their data source and an optional backing file.
+# Driver specific block device options for image format that have no
+# option besides their data source and an optional backing file.
 #
 # @backing: reference to or definition of the backing file block
-#           device, null disables the backing file entirely.
-#           Defaults to the backing file stored the image file.
+#     device, null disables the backing file entirely.  Defaults to
+#     the backing file stored the image file.
 #
 # Since: 2.9
 ##
@@ -3219,11 +3285,11 @@
 #
 # @none: Do not perform any checks
 #
-# @constant: Perform only checks which can be done in constant time and
-#            without reading anything from disk
+# @constant: Perform only checks which can be done in constant time
+#     and without reading anything from disk
 #
-# @cached: Perform only checks which can be done without reading anything
-#          from disk
+# @cached: Perform only checks which can be done without reading
+#     anything from disk
 #
 # @all: Perform all available overlap checks
 #
@@ -3235,12 +3301,13 @@
 ##
 # @Qcow2OverlapCheckFlags:
 #
-# Structure of flags for each metadata structure. Setting a field to 'true'
-# makes qemu guard that structure against unintended overwriting. The default
-# value is chosen according to the template given.
+# Structure of flags for each metadata structure.  Setting a field to
+# 'true' makes qemu guard that structure against unintended
+# overwriting.  The default value is chosen according to the template
+# given.
 #
-# @template: Specifies a template mode which can be adjusted using the other
-#            flags, defaults to 'cached'
+# @template: Specifies a template mode which can be adjusted using the
+#     other flags, defaults to 'cached'
 #
 # @bitmap-directory: since 3.0
 #
@@ -3261,11 +3328,11 @@
 ##
 # @Qcow2OverlapChecks:
 #
-# Specifies which metadata structures should be guarded against unintended
-# overwriting.
+# Specifies which metadata structures should be guarded against
+# unintended overwriting.
 #
-# @flags: set of flags for separate specification of each metadata structure
-#         type
+# @flags: set of flags for separate specification of each metadata
+#     structure type
 #
 # @mode: named mode which chooses a specific set of flags
 #
@@ -3300,9 +3367,8 @@
 #
 # Driver specific block device options for qcow.
 #
-# @encrypt: Image decryption options. Mandatory for
-#           encrypted images, except when doing a metadata-only
-#           probe of the image.
+# @encrypt: Image decryption options.  Mandatory for encrypted images,
+#     except when doing a metadata-only probe of the image.
 #
 # Since: 2.10
 ##
@@ -3334,11 +3400,11 @@
 ##
 # @BlockdevOptionsPreallocate:
 #
-# Filter driver intended to be inserted between format and protocol node
-# and do preallocation in protocol node on write.
+# Filter driver intended to be inserted between format and protocol
+# node and do preallocation in protocol node on write.
 #
 # @prealloc-align: on preallocation, align file length to this number,
-#                  default 1048576 (1M)
+#     default 1048576 (1M)
 #
 # @prealloc-size: how much to preallocate, default 134217728 (128M)
 #
@@ -3353,51 +3419,48 @@
 #
 # Driver specific block device options for qcow2.
 #
-# @lazy-refcounts: whether to enable the lazy refcounts
-#                  feature (default is taken from the image file)
+# @lazy-refcounts: whether to enable the lazy refcounts feature
+#     (default is taken from the image file)
 #
-# @pass-discard-request: whether discard requests to the qcow2
-#                        device should be forwarded to the data source
+# @pass-discard-request: whether discard requests to the qcow2 device
+#     should be forwarded to the data source
 #
 # @pass-discard-snapshot: whether discard requests for the data source
-#                         should be issued when a snapshot operation (e.g.
-#                         deleting a snapshot) frees clusters in the qcow2 file
+#     should be issued when a snapshot operation (e.g. deleting a
+#     snapshot) frees clusters in the qcow2 file
 #
 # @pass-discard-other: whether discard requests for the data source
-#                      should be issued on other occasions where a cluster
-#                      gets freed
+#     should be issued on other occasions where a cluster gets freed
 #
-# @overlap-check: which overlap checks to perform for writes
-#                 to the image, defaults to 'cached' (since 2.2)
+# @overlap-check: which overlap checks to perform for writes to the
+#     image, defaults to 'cached' (since 2.2)
 #
-# @cache-size: the maximum total size of the L2 table and
-#              refcount block caches in bytes (since 2.2)
+# @cache-size: the maximum total size of the L2 table and refcount
+#     block caches in bytes (since 2.2)
 #
-# @l2-cache-size: the maximum size of the L2 table cache in
-#                 bytes (since 2.2)
+# @l2-cache-size: the maximum size of the L2 table cache in bytes
+#     (since 2.2)
 #
 # @l2-cache-entry-size: the size of each entry in the L2 cache in
-#                       bytes. It must be a power of two between 512
-#                       and the cluster size. The default value is
-#                       the cluster size (since 2.12)
+#     bytes.  It must be a power of two between 512 and the cluster
+#     size.  The default value is the cluster size (since 2.12)
 #
 # @refcount-cache-size: the maximum size of the refcount block cache
-#                       in bytes (since 2.2)
+#     in bytes (since 2.2)
 #
 # @cache-clean-interval: clean unused entries in the L2 and refcount
-#                        caches. The interval is in seconds. The default value
-#                        is 600 on supporting platforms, and 0 on other
-#                        platforms. 0 disables this feature. (since 2.5)
+#     caches.  The interval is in seconds.  The default value is 600
+#     on supporting platforms, and 0 on other platforms.  0 disables
+#     this feature.  (since 2.5)
 #
-# @encrypt: Image decryption options. Mandatory for
-#           encrypted images, except when doing a metadata-only
-#           probe of the image. (since 2.10)
+# @encrypt: Image decryption options.  Mandatory for encrypted images,
+#     except when doing a metadata-only probe of the image.  (since
+#     2.10)
 #
 # @data-file: reference to or definition of the external data file.
-#             This may only be specified for images that require an
-#             external data file. If it is not specified for such
-#             an image, the data file name is loaded from the image
-#             file. (since 4.0)
+#     This may only be specified for images that require an external
+#     data file.  If it is not specified for such an image, the data
+#     file name is loaded from the image file.  (since 4.0)
 #
 # Since: 2.9
 ##
@@ -3420,7 +3483,9 @@
 # @SshHostKeyCheckMode:
 #
 # @none: Don't check the host key at all
+#
 # @hash: Compare the host key with a given hash
+#
 # @known_hosts: Check the host key against the known_hosts file
 #
 # Since: 2.12
@@ -3432,7 +3497,9 @@
 # @SshHostKeyCheckHashType:
 #
 # @md5: The given hash is an md5 hash
+#
 # @sha1: The given hash is an sha1 hash
+#
 # @sha256: The given hash is an sha256 hash
 #
 # Since: 2.12
@@ -3444,6 +3511,7 @@
 # @SshHostKeyHash:
 #
 # @type: The hash algorithm used for the hash
+#
 # @hash: The expected hash value
 #
 # Since: 2.12
@@ -3472,7 +3540,7 @@
 # @user: user as which to connect, defaults to current local user name
 #
 # @host-key-check: Defines how and what to check the host key against
-#                  (default: known_hosts)
+#     (default: known_hosts)
 #
 # Since: 2.9
 ##
@@ -3488,13 +3556,14 @@
 # Trigger events supported by blkdebug.
 #
 # @l1_shrink_write_table: write zeros to the l1 table to shrink image.
-#                         (since 2.11)
+#     (since 2.11)
 #
-# @l1_shrink_free_l2_clusters: discard the l2 tables. (since 2.11)
+# @l1_shrink_free_l2_clusters: discard the l2 tables.  (since 2.11)
 #
 # @cor_write: a write due to copy-on-read (since 2.11)
 #
-# @cluster_alloc_space: an allocation of file space for a cluster (since 4.1)
+# @cluster_alloc_space: an allocation of file space for a cluster
+#     (since 4.1)
 #
 # @none: triggers once at creation of the blkdebug node (since 4.1)
 #
@@ -3548,23 +3617,20 @@
 #
 # @event: trigger event
 #
-# @state: the state identifier blkdebug needs to be in to
-#         actually trigger the event; defaults to "any"
+# @state: the state identifier blkdebug needs to be in to actually
+#     trigger the event; defaults to "any"
 #
-# @iotype: the type of I/O operations on which this error should
-#          be injected; defaults to "all read, write,
-#          write-zeroes, discard, and flush operations"
-#          (since: 4.1)
+# @iotype: the type of I/O operations on which this error should be
+#     injected; defaults to "all read, write, write-zeroes, discard,
+#     and flush operations" (since: 4.1)
 #
-# @errno: error identifier (errno) to be returned; defaults to
-#         EIO
+# @errno: error identifier (errno) to be returned; defaults to EIO
 #
-# @sector: specifies the sector index which has to be affected
-#          in order to actually trigger the event; defaults to "any
-#          sector"
+# @sector: specifies the sector index which has to be affected in
+#     order to actually trigger the event; defaults to "any sector"
 #
-# @once: disables further events after this one has been
-#        triggered; defaults to false
+# @once: disables further events after this one has been triggered;
+#     defaults to false
 #
 # @immediately: fail immediately; defaults to false
 #
@@ -3587,10 +3653,10 @@
 # @event: trigger event
 #
 # @state: the current state identifier blkdebug needs to be in;
-#         defaults to "any"
+#     defaults to "any"
 #
 # @new_state: the state identifier blkdebug is supposed to assume if
-#             this event is triggered
+#     this event is triggered
 #
 # Since: 2.9
 ##
@@ -3608,47 +3674,45 @@
 #
 # @config: filename of the configuration file
 #
-# @align: required alignment for requests in bytes, must be
-#         positive power of 2, or 0 for default
+# @align: required alignment for requests in bytes, must be positive
+#     power of 2, or 0 for default
 #
 # @max-transfer: maximum size for I/O transfers in bytes, must be
-#                positive multiple of @align and of the underlying
-#                file's request alignment (but need not be a power of
-#                2), or 0 for default (since 2.10)
+#     positive multiple of @align and of the underlying file's request
+#     alignment (but need not be a power of 2), or 0 for default
+#     (since 2.10)
 #
-# @opt-write-zero: preferred alignment for write zero requests in bytes,
-#                  must be positive multiple of @align and of the
-#                  underlying file's request alignment (but need not be a
-#                  power of 2), or 0 for default (since 2.10)
+# @opt-write-zero: preferred alignment for write zero requests in
+#     bytes, must be positive multiple of @align and of the underlying
+#     file's request alignment (but need not be a power of 2), or 0
+#     for default (since 2.10)
 #
-# @max-write-zero: maximum size for write zero requests in bytes, must be
-#                  positive multiple of @align, of @opt-write-zero, and of
-#                  the underlying file's request alignment (but need not
-#                  be a power of 2), or 0 for default (since 2.10)
+# @max-write-zero: maximum size for write zero requests in bytes, must
+#     be positive multiple of @align, of @opt-write-zero, and of the
+#     underlying file's request alignment (but need not be a power of
+#     2), or 0 for default (since 2.10)
 #
-# @opt-discard: preferred alignment for discard requests in bytes, must
-#               be positive multiple of @align and of the underlying
-#               file's request alignment (but need not be a power of
-#               2), or 0 for default (since 2.10)
+# @opt-discard: preferred alignment for discard requests in bytes,
+#     must be positive multiple of @align and of the underlying file's
+#     request alignment (but need not be a power of 2), or 0 for
+#     default (since 2.10)
 #
 # @max-discard: maximum size for discard requests in bytes, must be
-#               positive multiple of @align, of @opt-discard, and of
-#               the underlying file's request alignment (but need not
-#               be a power of 2), or 0 for default (since 2.10)
+#     positive multiple of @align, of @opt-discard, and of the
+#     underlying file's request alignment (but need not be a power of
+#     2), or 0 for default (since 2.10)
 #
 # @inject-error: array of error injection descriptions
 #
 # @set-state: array of state-change descriptions
 #
 # @take-child-perms: Permissions to take on @image in addition to what
-#                    is necessary anyway (which depends on how the
-#                    blkdebug node is used).  Defaults to none.
-#                    (since 5.0)
+#     is necessary anyway (which depends on how the blkdebug node is
+#     used).  Defaults to none.  (since 5.0)
 #
 # @unshare-child-perms: Permissions not to share on @image in addition
-#                       to what cannot be shared anyway (which depends
-#                       on how the blkdebug node is used).  Defaults
-#                       to none.  (since 5.0)
+#     to what cannot be shared anyway (which depends on how the
+#     blkdebug node is used).  Defaults to none.  (since 5.0)
 #
 # Since: 2.9
 ##
@@ -3672,13 +3736,14 @@
 #
 # @log: block device used to log writes to @file
 #
-# @log-sector-size: sector size used in logging writes to @file, determines
-#                   granularity of offsets and sizes of writes (default: 512)
+# @log-sector-size: sector size used in logging writes to @file,
+#     determines granularity of offsets and sizes of writes
+#     (default: 512)
 #
 # @log-append: append to an existing log (default: false)
 #
-# @log-super-update-interval: interval of write requests after which the log
-#                             super block is updated to disk (default: 4096)
+# @log-super-update-interval: interval of write requests after which
+#     the log super block is updated to disk (default: 4096)
 #
 # Since: 3.0
 ##
@@ -3734,18 +3799,18 @@
 #
 # Driver specific block device options for Quorum
 #
-# @blkverify: true if the driver must print content mismatch
-#             set to false by default
+# @blkverify: true if the driver must print content mismatch set to
+#     false by default
 #
 # @children: the children block devices to use
 #
 # @vote-threshold: the vote limit under which a read will fail
 #
 # @rewrite-corrupted: rewrite corrupted data when quorum is reached
-#                     (Since 2.1)
+#     (Since 2.1)
 #
 # @read-pattern: choose read pattern and set to quorum by default
-#                (Since 2.2)
+#     (Since 2.2)
 #
 # Since: 2.9
 ##
@@ -3767,8 +3832,7 @@
 #
 # @server: gluster servers description
 #
-# @debug: libgfapi log level (default '4' which is Error)
-#         (Since 2.8)
+# @debug: libgfapi log level (default '4' which is Error) (Since 2.8)
 #
 # @logfile: libgfapi log file (default /dev/stderr) (Since 2.8)
 #
@@ -3799,7 +3863,8 @@
 #
 # Driver specific block device options for the nvme-io_uring backend.
 #
-# @path: path to the NVMe namespace's character device (e.g. /dev/ng0n1).
+# @path: path to the NVMe namespace's character device (e.g.
+#     /dev/ng0n1).
 #
 # Since: 7.2
 ##
@@ -3810,10 +3875,11 @@
 ##
 # @BlockdevOptionsVirtioBlkVfioPci:
 #
-# Driver specific block device options for the virtio-blk-vfio-pci backend.
+# Driver specific block device options for the virtio-blk-vfio-pci
+# backend.
 #
 # @path: path to the PCI device's sysfs directory (e.g.
-#        /sys/bus/pci/devices/0000:00:01.0).
+#     /sys/bus/pci/devices/0000:00:01.0).
 #
 # Since: 7.2
 ##
@@ -3824,7 +3890,8 @@
 ##
 # @BlockdevOptionsVirtioBlkVhostUser:
 #
-# Driver specific block device options for the virtio-blk-vhost-user backend.
+# Driver specific block device options for the virtio-blk-vhost-user
+# backend.
 #
 # @path: path to the vhost-user UNIX domain socket.
 #
@@ -3837,7 +3904,8 @@
 ##
 # @BlockdevOptionsVirtioBlkVhostVdpa:
 #
-# Driver specific block device options for the virtio-blk-vhost-vdpa backend.
+# Driver specific block device options for the virtio-blk-vhost-vdpa
+# backend.
 #
 # @path: path to the vhost-vdpa character device.
 #
@@ -3877,24 +3945,23 @@
 #
 # @target: The target iqn name
 #
-# @lun: LUN to connect to. Defaults to 0.
+# @lun: LUN to connect to.  Defaults to 0.
 #
-# @user: User name to log in with. If omitted, no CHAP
-#        authentication is performed.
+# @user: User name to log in with.  If omitted, no CHAP authentication
+#     is performed.
 #
-# @password-secret: The ID of a QCryptoSecret object providing
-#                   the password for the login. This option is required if
-#                   @user is specified.
+# @password-secret: The ID of a QCryptoSecret object providing the
+#     password for the login.  This option is required if @user is
+#     specified.
 #
-# @initiator-name: The iqn name we want to identify to the target
-#                  as. If this option is not specified, an initiator name is
-#                  generated automatically.
+# @initiator-name: The iqn name we want to identify to the target as.
+#     If this option is not specified, an initiator name is generated
+#     automatically.
 #
-# @header-digest: The desired header digest. Defaults to
-#                 none-crc32c.
+# @header-digest: The desired header digest.  Defaults to none-crc32c.
 #
-# @timeout: Timeout in seconds after which a request will
-#           timeout. 0 means no timeout and is the default.
+# @timeout: Timeout in seconds after which a request will timeout.  0
+#     means no timeout and is the default.
 #
 # Driver specific block device options for iscsi
 #
@@ -3932,8 +3999,8 @@
 ##
 # @RbdEncryptionOptionsLUKSBase:
 #
-# @key-secret: ID of a QCryptoSecret object providing a passphrase
-#              for unlocking the encryption
+# @key-secret: ID of a QCryptoSecret object providing a passphrase for
+#     unlocking the encryption
 #
 # Since: 6.1
 ##
@@ -4001,11 +4068,10 @@
 #
 # @format: Encryption format.
 #
-# @parent: Parent image encryption options (for cloned images).
-#          Can be left unspecified if this cloned image is encrypted
-#          using the same format and secret as its parent image (i.e.
-#          not explicitly formatted) or if its parent image is not
-#          encrypted. (Since 8.0)
+# @parent: Parent image encryption options (for cloned images).  Can
+#     be left unspecified if this cloned image is encrypted using the
+#     same format and secret as its parent image (i.e. not explicitly
+#     formatted) or if its parent image is not encrypted.  (Since 8.0)
 #
 # Since: 6.1
 ##
@@ -4033,31 +4099,29 @@
 #
 # @pool: Ceph pool name.
 #
-# @namespace: Rados namespace name in the Ceph pool. (Since 5.0)
+# @namespace: Rados namespace name in the Ceph pool.  (Since 5.0)
 #
 # @image: Image name in the Ceph pool.
 #
-# @conf: path to Ceph configuration file.  Values
-#        in the configuration file will be overridden by
-#        options specified via QAPI.
+# @conf: path to Ceph configuration file.  Values in the configuration
+#     file will be overridden by options specified via QAPI.
 #
 # @snapshot: Ceph snapshot name.
 #
-# @encrypt: Image encryption options. (Since 6.1)
+# @encrypt: Image encryption options.  (Since 6.1)
 #
 # @user: Ceph id name.
 #
-# @auth-client-required: Acceptable authentication modes.
-#                        This maps to Ceph configuration option
-#                        "auth_client_required".  (Since 3.0)
+# @auth-client-required: Acceptable authentication modes.  This maps
+#     to Ceph configuration option "auth_client_required".  (Since
+#     3.0)
 #
-# @key-secret: ID of a QCryptoSecret object providing a key
-#              for cephx authentication.
-#              This maps to Ceph configuration option
-#              "key".  (Since 3.0)
+# @key-secret: ID of a QCryptoSecret object providing a key for cephx
+#     authentication.  This maps to Ceph configuration option "key".
+#     (Since 3.0)
 #
-# @server: Monitor host address and port.  This maps
-#          to the "mon_host" Ceph option.
+# @server: Monitor host address and port.  This maps to the "mon_host"
+#     Ceph option.
 #
 # Since: 2.9
 ##
@@ -4078,9 +4142,11 @@
 #
 # An enumeration of replication modes.
 #
-# @primary: Primary mode, the vm's state will be sent to secondary QEMU.
+# @primary: Primary mode, the vm's state will be sent to secondary
+#     QEMU.
 #
-# @secondary: Secondary mode, receive the vm's state from primary QEMU.
+# @secondary: Secondary mode, receive the vm's state from primary
+#     QEMU.
 #
 # Since: 2.9
 ##
@@ -4094,9 +4160,9 @@
 #
 # @mode: the replication mode
 #
-# @top-id: In secondary mode, node name or device ID of the root
-#          node who owns the replication node chain. Must not be given in
-#          primary mode.
+# @top-id: In secondary mode, node name or device ID of the root node
+#     who owns the replication node chain.  Must not be given in
+#     primary mode.
 #
 # Since: 2.9
 ##
@@ -4142,25 +4208,22 @@
 #
 # @path: path of the image on the host
 #
-# @user: UID value to use when talking to the
-#        server (defaults to 65534 on Windows and getuid()
-#        on unix)
+# @user: UID value to use when talking to the server (defaults to
+#     65534 on Windows and getuid() on unix)
 #
-# @group: GID value to use when talking to the
-#         server (defaults to 65534 on Windows and getgid()
-#         in unix)
+# @group: GID value to use when talking to the server (defaults to
+#     65534 on Windows and getgid() in unix)
 #
-# @tcp-syn-count: number of SYNs during the session
-#                 establishment (defaults to libnfs default)
+# @tcp-syn-count: number of SYNs during the session establishment
+#     (defaults to libnfs default)
 #
-# @readahead-size: set the readahead size in bytes (defaults
-#                  to libnfs default)
+# @readahead-size: set the readahead size in bytes (defaults to libnfs
+#     default)
 #
-# @page-cache-size: set the pagecache size in bytes (defaults
-#                   to libnfs default)
+# @page-cache-size: set the pagecache size in bytes (defaults to
+#     libnfs default)
 #
-# @debug: set the NFS debug level (max 2) (defaults
-#         to libnfs default)
+# @debug: set the NFS debug level (max 2) (defaults to libnfs default)
 #
 # Since: 2.9
 ##
@@ -4177,25 +4240,26 @@
 ##
 # @BlockdevOptionsCurlBase:
 #
-# Driver specific block device options shared by all protocols supported by the
-# curl backend.
+# Driver specific block device options shared by all protocols
+# supported by the curl backend.
 #
 # @url: URL of the image file
 #
-# @readahead: Size of the read-ahead cache; must be a multiple of
-#             512 (defaults to 256 kB)
+# @readahead: Size of the read-ahead cache; must be a multiple of 512
+#     (defaults to 256 kB)
 #
 # @timeout: Timeout for connections, in seconds (defaults to 5)
 #
 # @username: Username for authentication (defaults to none)
 #
 # @password-secret: ID of a QCryptoSecret object providing a password
-#                   for authentication (defaults to no password)
+#     for authentication (defaults to no password)
 #
-# @proxy-username: Username for proxy authentication (defaults to none)
+# @proxy-username: Username for proxy authentication (defaults to
+#     none)
 #
-# @proxy-password-secret: ID of a QCryptoSecret object providing a password
-#                         for proxy authentication (defaults to no password)
+# @proxy-password-secret: ID of a QCryptoSecret object providing a
+#     password for proxy authentication (defaults to no password)
 #
 # Since: 2.9
 ##
@@ -4211,15 +4275,15 @@
 ##
 # @BlockdevOptionsCurlHttp:
 #
-# Driver specific block device options for HTTP connections over the curl
-# backend.  URLs must start with "http://".
+# Driver specific block device options for HTTP connections over the
+# curl backend.  URLs must start with "http://".
 #
-# @cookie: List of cookies to set; format is
-#          "name1=content1; name2=content2;" as explained by
-#          CURLOPT_COOKIE(3). Defaults to no cookies.
+# @cookie: List of cookies to set; format is "name1=content1;
+#     name2=content2;" as explained by CURLOPT_COOKIE(3). Defaults to
+#     no cookies.
 #
-# @cookie-secret: ID of a QCryptoSecret object providing the cookie data in a
-#                 secure way. See @cookie for the format. (since 2.10)
+# @cookie-secret: ID of a QCryptoSecret object providing the cookie
+#     data in a secure way.  See @cookie for the format.  (since 2.10)
 #
 # Since: 2.9
 ##
@@ -4231,18 +4295,18 @@
 ##
 # @BlockdevOptionsCurlHttps:
 #
-# Driver specific block device options for HTTPS connections over the curl
-# backend.  URLs must start with "https://".
+# Driver specific block device options for HTTPS connections over the
+# curl backend.  URLs must start with "https://".
 #
-# @cookie: List of cookies to set; format is
-#          "name1=content1; name2=content2;" as explained by
-#          CURLOPT_COOKIE(3). Defaults to no cookies.
+# @cookie: List of cookies to set; format is "name1=content1;
+#     name2=content2;" as explained by CURLOPT_COOKIE(3). Defaults to
+#     no cookies.
 #
-# @sslverify: Whether to verify the SSL certificate's validity (defaults to
-#             true)
+# @sslverify: Whether to verify the SSL certificate's validity
+#     (defaults to true)
 #
-# @cookie-secret: ID of a QCryptoSecret object providing the cookie data in a
-#                 secure way. See @cookie for the format. (since 2.10)
+# @cookie-secret: ID of a QCryptoSecret object providing the cookie
+#     data in a secure way.  See @cookie for the format.  (since 2.10)
 #
 # Since: 2.9
 ##
@@ -4255,8 +4319,8 @@
 ##
 # @BlockdevOptionsCurlFtp:
 #
-# Driver specific block device options for FTP connections over the curl
-# backend.  URLs must start with "ftp://".
+# Driver specific block device options for FTP connections over the
+# curl backend.  URLs must start with "ftp://".
 #
 # Since: 2.9
 ##
@@ -4267,11 +4331,11 @@
 ##
 # @BlockdevOptionsCurlFtps:
 #
-# Driver specific block device options for FTPS connections over the curl
-# backend.  URLs must start with "ftps://".
+# Driver specific block device options for FTPS connections over the
+# curl backend.  URLs must start with "ftps://".
 #
-# @sslverify: Whether to verify the SSL certificate's validity (defaults to
-#             true)
+# @sslverify: Whether to verify the SSL certificate's validity
+#     (defaults to true)
 #
 # Since: 2.9
 ##
@@ -4290,30 +4354,31 @@
 #
 # @tls-creds: TLS credentials ID
 #
-# @tls-hostname: TLS hostname override for certificate validation (Since 7.0)
+# @tls-hostname: TLS hostname override for certificate validation
+#     (Since 7.0)
 #
-# @x-dirty-bitmap: A metadata context name such as "qemu:dirty-bitmap:NAME"
-#                  or "qemu:allocation-depth" to query in place of the
-#                  traditional "base:allocation" block status (see
-#                  NBD_OPT_LIST_META_CONTEXT in the NBD protocol; and
-#                  yes, naming this option x-context would have made
-#                  more sense) (since 3.0)
+# @x-dirty-bitmap: A metadata context name such as
+#     "qemu:dirty-bitmap:NAME" or "qemu:allocation-depth" to query in
+#     place of the traditional "base:allocation" block status (see
+#     NBD_OPT_LIST_META_CONTEXT in the NBD protocol; and yes, naming
+#     this option x-context would have made more sense) (since 3.0)
 #
-# @reconnect-delay: On an unexpected disconnect, the nbd client tries to
-#                   connect again until succeeding or encountering a serious
-#                   error.  During the first @reconnect-delay seconds, all
-#                   requests are paused and will be rerun on a successful
-#                   reconnect. After that time, any delayed requests and all
-#                   future requests before a successful reconnect will
-#                   immediately fail. Default 0 (Since 4.2)
+# @reconnect-delay: On an unexpected disconnect, the nbd client tries
+#     to connect again until succeeding or encountering a serious
+#     error.  During the first @reconnect-delay seconds, all requests
+#     are paused and will be rerun on a successful reconnect.  After
+#     that time, any delayed requests and all future requests before a
+#     successful reconnect will immediately fail.  Default 0 (Since
+#     4.2)
 #
-# @open-timeout: In seconds. If zero, the nbd driver tries the connection
-#                only once, and fails to open if the connection fails.
-#                If non-zero, the nbd driver will repeat connection attempts
-#                until successful or until @open-timeout seconds have elapsed.
-#                Default 0 (Since 7.0)
+# @open-timeout: In seconds.  If zero, the nbd driver tries the
+#     connection only once, and fails to open if the connection fails.
+#     If non-zero, the nbd driver will repeat connection attempts
+#     until successful or until @open-timeout seconds have elapsed.
+#     Default 0 (Since 7.0)
 #
 # Features:
+#
 # @unstable: Member @x-dirty-bitmap is experimental.
 #
 # Since: 2.9
@@ -4333,6 +4398,7 @@
 # Driver specific block device options for the raw driver.
 #
 # @offset: position where the block device starts
+#
 # @size: the assumed size of the device
 #
 # Since: 2.9
@@ -4346,8 +4412,9 @@
 #
 # Driver specific block device options for the throttle driver
 #
-# @throttle-group: the name of the throttle-group object to use. It
-#                  must already exist.
+# @throttle-group: the name of the throttle-group object to use.  It
+#     must already exist.
+#
 # @file: reference to or definition of the data source block device
 #
 # Since: 2.11
@@ -4362,11 +4429,11 @@
 #
 # Driver specific block device options for the copy-on-read driver.
 #
-# @bottom: The name of a non-filter node (allocation-bearing layer) that
-#          limits the COR operations in the backing chain (inclusive), so
-#          that no data below this node will be copied by this filter.
-#          If option is absent, the limit is not applied, so that data
-#          from all backing layers may be copied.
+# @bottom: The name of a non-filter node (allocation-bearing layer)
+#     that limits the COR operations in the backing chain (inclusive),
+#     so that no data below this node will be copied by this filter.
+#     If option is absent, the limit is not applied, so that data from
+#     all backing layers may be copied.
 #
 # Since: 6.0
 ##
@@ -4380,13 +4447,13 @@
 # An enumeration of possible behaviors for copy-before-write operation
 # failures.
 #
-# @break-guest-write: report the error to the guest. This way, the guest
-#                     will not be able to overwrite areas that cannot be
-#                     backed up, so the backup process remains valid.
+# @break-guest-write: report the error to the guest.  This way, the
+#     guest will not be able to overwrite areas that cannot be backed
+#     up, so the backup process remains valid.
 #
-# @break-snapshot: continue guest write. Doing so will make the provided
-#                  snapshot state invalid and any backup or export
-#                  process based on it will finally fail.
+# @break-snapshot: continue guest write.  Doing so will make the
+#     provided snapshot state invalid and any backup or export process
+#     based on it will finally fail.
 #
 # Since: 7.1
 ##
@@ -4396,32 +4463,32 @@
 ##
 # @BlockdevOptionsCbw:
 #
-# Driver specific block device options for the copy-before-write driver,
-# which does so called copy-before-write operations: when data is
-# written to the filter, the filter first reads corresponding blocks
-# from its file child and copies them to @target child. After successfully
-# copying, the write request is propagated to file child. If copying
-# fails, the original write request is failed too and no data is written
-# to file child.
+# Driver specific block device options for the copy-before-write
+# driver, which does so called copy-before-write operations: when data
+# is written to the filter, the filter first reads corresponding
+# blocks from its file child and copies them to @target child.  After
+# successfully copying, the write request is propagated to file child.
+# If copying fails, the original write request is failed too and no
+# data is written to file child.
 #
 # @target: The target for copy-before-write operations.
 #
 # @bitmap: If specified, copy-before-write filter will do
-#          copy-before-write operations only for dirty regions of the
-#          bitmap. Bitmap size must be equal to length of file and
-#          target child of the filter. Note also, that bitmap is used
-#          only to initialize internal bitmap of the process, so further
-#          modifications (or removing) of specified bitmap doesn't
-#          influence the filter. (Since 7.0)
+#     copy-before-write operations only for dirty regions of the
+#     bitmap.  Bitmap size must be equal to length of file and target
+#     child of the filter.  Note also, that bitmap is used only to
+#     initialize internal bitmap of the process, so further
+#     modifications (or removing) of specified bitmap doesn't
+#     influence the filter.  (Since 7.0)
 #
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
-#                Default is @break-guest-write. (Since 7.1)
+#     Default is @break-guest-write.  (Since 7.1)
 #
-# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
-#               for copy-before-write operation. When a timeout occurs,
-#               the respective copy-before-write operation will fail, and
-#               the @on-cbw-error parameter will decide how this failure
-#               is handled. Default 0. (Since 7.1)
+# @cbw-timeout: Zero means no limit.  Non-zero sets the timeout in
+#     seconds for copy-before-write operation.  When a timeout occurs,
+#     the respective copy-before-write operation will fail, and the
+#     @on-cbw-error parameter will decide how this failure is handled.
+#     Default 0. (Since 7.1)
 #
 # Since: 6.2
 ##
@@ -4433,32 +4500,39 @@
 ##
 # @BlockdevOptions:
 #
-# Options for creating a block device.  Many options are available for all
-# block devices, independent of the block driver:
+# Options for creating a block device.  Many options are available for
+# all block devices, independent of the block driver:
 #
 # @driver: block driver name
-# @node-name: the node name of the new node (Since 2.0).
-#             This option is required on the top level of blockdev-add.
-#             Valid node names start with an alphabetic character and may
-#             contain only alphanumeric characters, '-', '.' and '_'. Their
-#             maximum length is 31 characters.
+#
+# @node-name: the node name of the new node (Since 2.0). This option
+#     is required on the top level of blockdev-add.  Valid node names
+#     start with an alphabetic character and may contain only
+#     alphanumeric characters, '-', '.' and '_'. Their maximum length
+#     is 31 characters.
+#
 # @discard: discard-related options (default: ignore)
+#
 # @cache: cache-related options
-# @read-only: whether the block device should be read-only (default: false).
-#             Note that some block drivers support only read-only access,
-#             either generally or in certain configurations. In this case,
-#             the default value does not work and the option must be
-#             specified explicitly.
-# @auto-read-only: if true and @read-only is false, QEMU may automatically
-#                  decide not to open the image read-write as requested, but
-#                  fall back to read-only instead (and switch between the modes
-#                  later), e.g. depending on whether the image file is writable
-#                  or whether a writing user is attached to the node
-#                  (default: false, since 3.1)
+#
+# @read-only: whether the block device should be read-only (default:
+#     false). Note that some block drivers support only read-only
+#     access, either generally or in certain configurations.  In this
+#     case, the default value does not work and the option must be
+#     specified explicitly.
+#
+# @auto-read-only: if true and @read-only is false, QEMU may
+#     automatically decide not to open the image read-write as
+#     requested, but fall back to read-only instead (and switch
+#     between the modes later), e.g. depending on whether the image
+#     file is writable or whether a writing user is attached to the
+#     node (default: false, since 3.1)
+#
 # @detect-zeroes: detect and optimize zero writes (Since 2.1)
-#                 (default: off)
-# @force-share: force share all permission on added nodes.
-#               Requires read-only=true. (Since 2.10)
+#     (default: off)
+#
+# @force-share: force share all permission on added nodes.  Requires
+#     read-only=true.  (Since 2.10)
 #
 # Remaining options are determined by the block driver.
 #
@@ -4541,6 +4615,7 @@
 # Reference to a block device.
 #
 # @definition: defines a new block device inline
+#
 # @reference: references the ID of an existing block device
 #
 # Since: 2.9
@@ -4555,9 +4630,11 @@
 # Reference to a block device.
 #
 # @definition: defines a new block device inline
-# @reference: references the ID of an existing block device.
-#             An empty string means that no block device should
-#             be referenced.  Deprecated; use null instead.
+#
+# @reference: references the ID of an existing block device.  An empty
+#     string means that no block device should be referenced.
+#     Deprecated; use null instead.
+#
 # @null: No block device should be referenced (since 2.10)
 #
 # Since: 2.9
@@ -4611,7 +4688,6 @@
 #      }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
   'allow-preconfig': true }
@@ -4620,18 +4696,19 @@
 # @blockdev-reopen:
 #
 # Reopens one or more block devices using the given set of options.
-# Any option not specified will be reset to its default value regardless
-# of its previous status. If an option cannot be changed or a particular
-# driver does not support reopening then the command will return an
-# error. All devices in the list are reopened in one transaction, so
-# if one of them fails then the whole transaction is cancelled.
+# Any option not specified will be reset to its default value
+# regardless of its previous status.  If an option cannot be changed
+# or a particular driver does not support reopening then the command
+# will return an error.  All devices in the list are reopened in one
+# transaction, so if one of them fails then the whole transaction is
+# cancelled.
 #
-# The command receives a list of block devices to reopen. For each one
-# of them, the top-level @node-name option (from BlockdevOptions) must be
-# specified and is used to select the block device to be reopened.
-# Other @node-name options must be either omitted or set to the
-# current name of the appropriate node. This command won't change any
-# node name and any attempt to do it will result in an error.
+# The command receives a list of block devices to reopen.  For each
+# one of them, the top-level @node-name option (from BlockdevOptions)
+# must be specified and is used to select the block device to be
+# reopened.  Other @node-name options must be either omitted or set to
+# the current name of the appropriate node.  This command won't change
+# any node name and any attempt to do it will result in an error.
 #
 # In the case of options that refer to child nodes, the behavior of
 # this command depends on the value:
@@ -4647,7 +4724,7 @@
 #
 #  4) NULL: the current child (if any) is detached.
 #
-# Options (1) and (2) are supported in all cases. Option (3) is
+# Options (1) and (2) are supported in all cases.  Option (3) is
 # supported for @file and @backing, and option (4) for @backing only.
 #
 # Unlike with blockdev-add, the @backing option must always be present
@@ -4664,8 +4741,8 @@
 ##
 # @blockdev-del:
 #
-# Deletes a block device that has been added using blockdev-add.
-# The command will fail if the node is attached to a device or is
+# Deletes a block device that has been added using blockdev-add.  The
+# command will fail if the node is attached to a device or is
 # otherwise being used.
 #
 # @node-name: Name of the graph node to delete.
@@ -4690,7 +4767,6 @@
 #      "arguments": { "node-name": "node0" }
 #    }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-del', 'data': { 'node-name': 'str' },
   'allow-preconfig': true }
@@ -4701,14 +4777,17 @@
 # Driver specific image creation options for file.
 #
 # @filename: Filename for the new image file
+#
 # @size: Size of the virtual disk in bytes
+#
 # @preallocation: Preallocation mode for the new image (default: off;
-#                 allowed values: off,
-#                 falloc (if CONFIG_POSIX_FALLOCATE),
-#                 full (if CONFIG_POSIX))
+#     allowed values: off, falloc (if CONFIG_POSIX_FALLOCATE), full
+#     (if CONFIG_POSIX))
+#
 # @nocow: Turn off copy-on-write (valid only on btrfs; default: off)
-# @extent-size-hint: Extent size hint to add to the image file; 0 for not
-#                    adding an extent size hint (default: 1 MB, since 5.1)
+#
+# @extent-size-hint: Extent size hint to add to the image file; 0 for
+#     not adding an extent size hint (default: 1 MB, since 5.1)
 #
 # Since: 2.12
 ##
@@ -4725,11 +4804,12 @@
 # Driver specific image creation options for gluster.
 #
 # @location: Where to store the new image file
+#
 # @size: Size of the virtual disk in bytes
+#
 # @preallocation: Preallocation mode for the new image (default: off;
-#                 allowed values: off,
-#                 falloc (if CONFIG_GLUSTERFS_FALLOCATE),
-#                 full (if CONFIG_GLUSTERFS_ZEROFILL))
+#     allowed values: off, falloc (if CONFIG_GLUSTERFS_FALLOCATE),
+#     full (if CONFIG_GLUSTERFS_ZEROFILL))
 #
 # Since: 2.12
 ##
@@ -4744,10 +4824,11 @@
 # Driver specific image creation options for LUKS.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
-# @preallocation: Preallocation mode for the new image
-#                 (since: 4.2)
-#                 (default: off; allowed values: off, metadata, falloc, full)
+#
+# @preallocation: Preallocation mode for the new image (since: 4.2)
+#     (default: off; allowed values: off, metadata, falloc, full)
 #
 # Since: 2.12
 ##
@@ -4763,6 +4844,7 @@
 # Driver specific image creation options for NFS.
 #
 # @location: Where to store the new image file
+#
 # @size: Size of the virtual disk in bytes
 #
 # Since: 2.12
@@ -4777,7 +4859,9 @@
 # Driver specific image creation options for parallels.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
+#
 # @cluster-size: Cluster size in bytes (default: 1 MB)
 #
 # Since: 2.12
@@ -4793,9 +4877,12 @@
 # Driver specific image creation options for qcow.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
+#
 # @backing-file: File name of the backing file if a backing file
-#                should be used
+#     should be used
+#
 # @encrypt: Encryption options if the image should be encrypted
 #
 # Since: 2.12
@@ -4809,7 +4896,9 @@
 ##
 # @BlockdevQcow2Version:
 #
-# @v2: The original QCOW2 format as introduced in qemu 0.10 (version 2)
+# @v2: The original QCOW2 format as introduced in qemu 0.10 (version
+#     2)
+#
 # @v3: The extended QCOW2 format as introduced in qemu 1.1 (version 3)
 #
 # Since: 2.12
@@ -4823,6 +4912,7 @@
 # Compression type used in qcow2 image file
 #
 # @zlib: zlib compression, see <http://zlib.net/>
+#
 # @zstd: zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 5.1
@@ -4836,27 +4926,41 @@
 # Driver specific image creation options for qcow2.
 #
 # @file: Node to create the image format on
+#
 # @data-file: Node to use as an external data file in which all guest
-#             data is stored so that only metadata remains in the qcow2
-#             file (since: 4.0)
+#     data is stored so that only metadata remains in the qcow2 file
+#     (since: 4.0)
+#
 # @data-file-raw: True if the external data file must stay valid as a
-#                 standalone (read-only) raw image without looking at qcow2
-#                 metadata (default: false; since: 4.0)
+#     standalone (read-only) raw image without looking at qcow2
+#     metadata (default: false; since: 4.0)
+#
 # @extended-l2: True to make the image have extended L2 entries
-#               (default: false; since 5.2)
+#     (default: false; since 5.2)
+#
 # @size: Size of the virtual disk in bytes
+#
 # @version: Compatibility level (default: v3)
+#
 # @backing-file: File name of the backing file if a backing file
-#                should be used
+#     should be used
+#
 # @backing-fmt: Name of the block driver to use for the backing file
+#
 # @encrypt: Encryption options if the image should be encrypted
+#
 # @cluster-size: qcow2 cluster size in bytes (default: 65536)
+#
 # @preallocation: Preallocation mode for the new image (default: off;
-#                 allowed values: off, falloc, full, metadata)
-# @lazy-refcounts: True if refcounts may be updated lazily (default: off)
+#     allowed values: off, falloc, full, metadata)
+#
+# @lazy-refcounts: True if refcounts may be updated lazily
+#     (default: off)
+#
 # @refcount-bits: Width of reference counts in bits (default: 16)
+#
 # @compression-type: The image cluster compression method
-#                    (default: zlib, since 5.1)
+#     (default: zlib, since 5.1)
 #
 # Since: 2.12
 ##
@@ -4882,11 +4986,16 @@
 # Driver specific image creation options for qed.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
+#
 # @backing-file: File name of the backing file if a backing file
-#                should be used
+#     should be used
+#
 # @backing-fmt: Name of the block driver to use for the backing file
+#
 # @cluster-size: Cluster size in bytes (default: 65536)
+#
 # @table-size: L1/L2 table size (in clusters)
 #
 # Since: 2.12
@@ -4904,11 +5013,14 @@
 #
 # Driver specific image creation options for rbd/Ceph.
 #
-# @location: Where to store the new image file. This location cannot
-#            point to a snapshot.
+# @location: Where to store the new image file.  This location cannot
+#     point to a snapshot.
+#
 # @size: Size of the virtual disk in bytes
+#
 # @cluster-size: RBD object size
-# @encrypt: Image encryption options. (Since 6.1)
+#
+# @encrypt: Image encryption options.  (Since 6.1)
 #
 # Since: 2.12
 ##
@@ -4927,14 +5039,14 @@
 #
 # @monolithicFlat: Single flat data image and a descriptor file
 #
-# @twoGbMaxExtentSparse: Data is split into 2GB (per virtual LBA) sparse extent
-#                        files, in addition to a descriptor file
+# @twoGbMaxExtentSparse: Data is split into 2GB (per virtual LBA)
+#     sparse extent files, in addition to a descriptor file
 #
-# @twoGbMaxExtentFlat: Data is split into 2GB (per virtual LBA) flat extent
-#                      files, in addition to a descriptor file
+# @twoGbMaxExtentFlat: Data is split into 2GB (per virtual LBA) flat
+#     extent files, in addition to a descriptor file
 #
-# @streamOptimized: Single file image sparse cluster allocation, optimized
-#                   for streaming over network.
+# @streamOptimized: Single file image sparse cluster allocation,
+#     optimized for streaming over network.
 #
 # Since: 4.0
 ##
@@ -4957,25 +5069,36 @@
 #
 # Driver specific image creation options for VMDK.
 #
-# @file: Where to store the new image file. This refers to the image
-#        file for monolithcSparse and streamOptimized format, or the
-#        descriptor file for other formats.
+# @file: Where to store the new image file.  This refers to the image
+#     file for monolithcSparse and streamOptimized format, or the
+#     descriptor file for other formats.
+#
 # @size: Size of the virtual disk in bytes
-# @extents: Where to store the data extents. Required for monolithcFlat,
-#           twoGbMaxExtentSparse and twoGbMaxExtentFlat formats. For
-#           monolithicFlat, only one entry is required; for
-#           twoGbMaxExtent* formats, the number of entries required is
-#           calculated as extent_number = virtual_size / 2GB. Providing
-#           more extents than will be used is an error.
-# @subformat: The subformat of the VMDK image. Default: "monolithicSparse".
-# @backing-file: The path of backing file. Default: no backing file is used.
-# @adapter-type: The adapter type used to fill in the descriptor. Default: ide.
-# @hwversion: Hardware version. The meaningful options are "4" or "6".
-#             Default: "4".
-# @toolsversion: VMware guest tools version.
-#                Default: "2147483647" (Since 6.2)
-# @zeroed-grain: Whether to enable zeroed-grain feature for sparse subformats.
-#                Default: false.
+#
+# @extents: Where to store the data extents.  Required for
+#     monolithcFlat, twoGbMaxExtentSparse and twoGbMaxExtentFlat
+#     formats.  For monolithicFlat, only one entry is required; for
+#     twoGbMaxExtent* formats, the number of entries required is
+#     calculated as extent_number = virtual_size / 2GB. Providing more
+#     extents than will be used is an error.
+#
+# @subformat: The subformat of the VMDK image.  Default:
+#     "monolithicSparse".
+#
+# @backing-file: The path of backing file.  Default: no backing file
+#     is used.
+#
+# @adapter-type: The adapter type used to fill in the descriptor.
+#     Default: ide.
+#
+# @hwversion: Hardware version.  The meaningful options are "4" or
+#     "6". Default: "4".
+#
+# @toolsversion: VMware guest tools version.  Default: "2147483647"
+#     (Since 6.2)
+#
+# @zeroed-grain: Whether to enable zeroed-grain feature for sparse
+#     subformats.  Default: false.
 #
 # Since: 4.0
 ##
@@ -4996,6 +5119,7 @@
 # Driver specific image creation options for SSH.
 #
 # @location: Where to store the new image file
+#
 # @size: Size of the virtual disk in bytes
 #
 # Since: 2.12
@@ -5010,9 +5134,11 @@
 # Driver specific image creation options for VDI.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
+#
 # @preallocation: Preallocation mode for the new image (default: off;
-#                 allowed values: off, metadata)
+#     allowed values: off, metadata)
 #
 # Since: 2.12
 ##
@@ -5025,6 +5151,7 @@
 # @BlockdevVhdxSubformat:
 #
 # @dynamic: Growing image file
+#
 # @fixed: Preallocated fixed-size image file
 #
 # Since: 2.12
@@ -5038,16 +5165,21 @@
 # Driver specific image creation options for vhdx.
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
-# @log-size: Log size in bytes, must be a multiple of 1 MB
-#            (default: 1 MB)
+#
+# @log-size: Log size in bytes, must be a multiple of 1 MB (default: 1
+#     MB)
+#
 # @block-size: Block size in bytes, must be a multiple of 1 MB and not
-#              larger than 256 MB (default: automatically choose a block
-#              size depending on the image size)
+#     larger than 256 MB (default: automatically choose a block size
+#     depending on the image size)
+#
 # @subformat: vhdx subformat (default: dynamic)
-# @block-state-zero: Force use of payload blocks of type 'ZERO'. Non-standard,
-#                    but default.  Do not set to 'off' when using 'qemu-img
-#                    convert' with subformat=dynamic.
+#
+# @block-state-zero: Force use of payload blocks of type
+#     'ZERO'. Non-standard, but default.  Do not set to 'off' when
+#     using 'qemu-img convert' with subformat=dynamic.
 #
 # Since: 2.12
 ##
@@ -5063,6 +5195,7 @@
 # @BlockdevVpcSubformat:
 #
 # @dynamic: Growing image file
+#
 # @fixed: Preallocated fixed-size image file
 #
 # Since: 2.12
@@ -5076,11 +5209,14 @@
 # Driver specific image creation options for vpc (VHD).
 #
 # @file: Node to create the image format on
+#
 # @size: Size of the virtual disk in bytes
+#
 # @subformat: vhdx subformat (default: dynamic)
-# @force-size: Force use of the exact byte size instead of rounding to the
-#              next size that can be represented in CHS geometry
-#              (default: false)
+#
+# @force-size: Force use of the exact byte size instead of rounding to
+#     the next size that can be represented in CHS geometry
+#     (default: false)
 #
 # Since: 2.12
 ##
@@ -5123,7 +5259,7 @@
 ##
 # @blockdev-create:
 #
-# Starts a job to create an image format on a given node. The job is
+# Starts a job to create an image format on a given node.  The job is
 # automatically finalized, but a manual job-dismiss is required.
 #
 # @job-id: Identifier for the newly created job.
@@ -5152,8 +5288,8 @@
 ##
 # @BlockdevAmendOptionsQcow2:
 #
-# Driver specific image amend options for qcow2.
-# For now, only encryption options can be amended
+# Driver specific image amend options for qcow2. For now, only
+# encryption options can be amended
 #
 # @encrypt: Encryption options to be amended
 #
@@ -5182,8 +5318,9 @@
 ##
 # @x-blockdev-amend:
 #
-# Starts a job to amend format specific options of an existing open block device
-# The job is automatically finalized, but a manual job-dismiss is required.
+# Starts a job to amend format specific options of an existing open
+# block device The job is automatically finalized, but a manual
+# job-dismiss is required.
 #
 # @job-id: Identifier for the newly created job.
 #
@@ -5191,13 +5328,13 @@
 #
 # @options: Options (driver specific)
 #
-# @force: Allow unsafe operations, format specific
-#         For luks that allows erase of the last active keyslot
-#         (permanent loss of data),
-#         and replacement of an active keyslot
-#         (possible loss of data if IO error happens)
+# @force: Allow unsafe operations, format specific For luks that
+#     allows erase of the last active keyslot (permanent loss of
+#     data), and replacement of an active keyslot (possible loss of
+#     data if IO error happens)
 #
 # Features:
+#
 # @unstable: This command is experimental.
 #
 # Since: 5.1
@@ -5229,33 +5366,33 @@
 ##
 # @BLOCK_IMAGE_CORRUPTED:
 #
-# Emitted when a disk image is being marked corrupt. The image can be
-# identified by its device or node name. The 'device' field is always
+# Emitted when a disk image is being marked corrupt.  The image can be
+# identified by its device or node name.  The 'device' field is always
 # present for compatibility reasons, but it can be empty ("") if the
 # image does not have a device name associated.
 #
-# @device: device name. This is always present for compatibility
-#          reasons, but it can be empty ("") if the image does not
-#          have a device name associated.
+# @device: device name.  This is always present for compatibility
+#     reasons, but it can be empty ("") if the image does not have a
+#     device name associated.
 #
 # @node-name: node name (Since: 2.4)
 #
 # @msg: informative message for human consumption, such as the kind of
-#       corruption being detected. It should not be parsed by machine as it is
-#       not guaranteed to be stable
+#     corruption being detected.  It should not be parsed by machine
+#     as it is not guaranteed to be stable
 #
 # @offset: if the corruption resulted from an image access, this is
-#          the host's access offset into the image
+#     the host's access offset into the image
 #
-# @size: if the corruption resulted from an image access, this is
-#        the access size
+# @size: if the corruption resulted from an image access, this is the
+#     access size
 #
-# @fatal: if set, the image is marked corrupt and therefore unusable after this
-#         event and must be repaired (Since 2.2; before, every
-#         BLOCK_IMAGE_CORRUPTED event was fatal)
+# @fatal: if set, the image is marked corrupt and therefore unusable
+#     after this event and must be repaired (Since 2.2; before, every
+#     BLOCK_IMAGE_CORRUPTED event was fatal)
 #
 # Note: If action is "stop", a STOP event will eventually follow the
-#       BLOCK_IO_ERROR event.
+#     BLOCK_IO_ERROR event.
 #
 # Example:
 #
@@ -5279,30 +5416,30 @@
 #
 # Emitted when a disk I/O error occurs
 #
-# @device: device name. This is always present for compatibility
-#          reasons, but it can be empty ("") if the image does not
-#          have a device name associated.
+# @device: device name.  This is always present for compatibility
+#     reasons, but it can be empty ("") if the image does not have a
+#     device name associated.
 #
-# @node-name: node name. Note that errors may be reported for the root node
-#             that is directly attached to a guest device rather than for the
-#             node where the error occurred. The node name is not present if
-#             the drive is empty. (Since: 2.8)
+# @node-name: node name.  Note that errors may be reported for the
+#     root node that is directly attached to a guest device rather
+#     than for the node where the error occurred.  The node name is
+#     not present if the drive is empty.  (Since: 2.8)
 #
 # @operation: I/O operation
 #
 # @action: action that has been taken
 #
-# @nospace: true if I/O error was caused due to a no-space
-#           condition. This key is only present if query-block's
-#           io-status is present, please see query-block documentation
-#           for more information (since: 2.2)
+# @nospace: true if I/O error was caused due to a no-space condition.
+#     This key is only present if query-block's io-status is present,
+#     please see query-block documentation for more information
+#     (since: 2.2)
 #
-# @reason: human readable string describing the error cause.
-#          (This field is a debugging aid for humans, it should not
-#          be parsed by applications) (since: 2.2)
+# @reason: human readable string describing the error cause.  (This
+#     field is a debugging aid for humans, it should not be parsed by
+#     applications) (since: 2.2)
 #
 # Note: If action is "stop", a STOP event will eventually follow the
-#       BLOCK_IO_ERROR event
+#     BLOCK_IO_ERROR event
 #
 # Since: 0.13
 #
@@ -5315,7 +5452,6 @@
 #                "action": "stop",
 #                "reason": "No space left on device" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'BLOCK_IO_ERROR',
   'data': { 'device': 'str', '*node-name': 'str',
@@ -5330,20 +5466,20 @@
 #
 # @type: job type
 #
-# @device: The job identifier. Originally the device name but other
-#          values are allowed since QEMU 2.7
+# @device: The job identifier.  Originally the device name but other
+#     values are allowed since QEMU 2.7
 #
 # @len: maximum progress value
 #
-# @offset: current progress value. On success this is equal to len.
-#          On failure this is less than len
+# @offset: current progress value.  On success this is equal to len.
+#     On failure this is less than len
 #
 # @speed: rate limit, bytes per second
 #
-# @error: error message. Only present on failure. This field
-#         contains a human-readable error message. There are no semantics
-#         other than that streaming has failed and clients should not try to
-#         interpret the error string
+# @error: error message.  Only present on failure.  This field
+#     contains a human-readable error message.  There are no semantics
+#     other than that streaming has failed and clients should not try
+#     to interpret the error string
 #
 # Since: 1.1
 #
@@ -5354,7 +5490,6 @@
 #                "len": 10737418240, "offset": 10737418240,
 #                "speed": 0 },
 #      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
-#
 ##
 { 'event': 'BLOCK_JOB_COMPLETED',
   'data': { 'type'  : 'JobType',
@@ -5371,13 +5506,13 @@
 #
 # @type: job type
 #
-# @device: The job identifier. Originally the device name but other
-#          values are allowed since QEMU 2.7
+# @device: The job identifier.  Originally the device name but other
+#     values are allowed since QEMU 2.7
 #
 # @len: maximum progress value
 #
-# @offset: current progress value. On success this is equal to len.
-#          On failure this is less than len
+# @offset: current progress value.  On success this is equal to len.
+#     On failure this is less than len
 #
 # @speed: rate limit, bytes per second
 #
@@ -5390,7 +5525,6 @@
 #                "len": 10737418240, "offset": 134217728,
 #                "speed": 0 },
 #      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
-#
 ##
 { 'event': 'BLOCK_JOB_CANCELLED',
   'data': { 'type'  : 'JobType',
@@ -5404,8 +5538,8 @@
 #
 # Emitted when a block job encounters an error
 #
-# @device: The job identifier. Originally the device name but other
-#          values are allowed since QEMU 2.7
+# @device: The job identifier.  Originally the device name but other
+#     values are allowed since QEMU 2.7
 #
 # @operation: I/O operation
 #
@@ -5420,7 +5554,6 @@
 #                "operation": "write",
 #                "action": "stop" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'BLOCK_JOB_ERROR',
   'data': { 'device'   : 'str',
@@ -5434,18 +5567,18 @@
 #
 # @type: job type
 #
-# @device: The job identifier. Originally the device name but other
-#          values are allowed since QEMU 2.7
+# @device: The job identifier.  Originally the device name but other
+#     values are allowed since QEMU 2.7
 #
 # @len: maximum progress value
 #
-# @offset: current progress value. On success this is equal to len.
-#          On failure this is less than len
+# @offset: current progress value.  On success this is equal to len.
+#     On failure this is less than len
 #
 # @speed: rate limit, bytes per second
 #
-# Note: The "ready to complete" status is always reset by a @BLOCK_JOB_ERROR
-#       event
+# Note: The "ready to complete" status is always reset by a
+#     @BLOCK_JOB_ERROR event
 #
 # Since: 1.3
 #
@@ -5455,7 +5588,6 @@
 #      "data": { "device": "drive0", "type": "mirror", "speed": 0,
 #                "len": 2097152, "offset": 2097152 },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'BLOCK_JOB_READY',
   'data': { 'type'  : 'JobType',
@@ -5467,9 +5599,10 @@
 ##
 # @BLOCK_JOB_PENDING:
 #
-# Emitted when a block job is awaiting explicit authorization to finalize graph
-# changes via @block-job-finalize. If this job is part of a transaction, it will
-# not emit this event until the transaction has converged first.
+# Emitted when a block job is awaiting explicit authorization to
+# finalize graph changes via @block-job-finalize.  If this job is part
+# of a transaction, it will not emit this event until the transaction
+# has converged first.
 #
 # @type: job type
 #
@@ -5482,7 +5615,6 @@
 # <- { "event": "BLOCK_JOB_PENDING",
 #      "data": { "type": "mirror", "id": "backup_1" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'BLOCK_JOB_PENDING',
   'data': { 'type'  : 'JobType',
@@ -5494,13 +5626,16 @@
 # Preallocation mode of QEMU image file
 #
 # @off: no preallocation
+#
 # @metadata: preallocate only for metadata
+#
 # @falloc: like @full preallocation but allocate disk space by
-#          posix_fallocate() rather than writing data.
+#     posix_fallocate() rather than writing data.
+#
 # @full: preallocate all data by writing it to the device to ensure
-#        disk space is really available. This data may or may not be
-#        zero, depending on the image format and storage.
-#        @full preallocation also sets up metadata correctly.
+#     disk space is really available.  This data may or may not be
+#     zero, depending on the image format and storage.  @full
+#     preallocation also sets up metadata correctly.
 #
 # Since: 2.2
 ##
@@ -5511,15 +5646,15 @@
 # @BLOCK_WRITE_THRESHOLD:
 #
 # Emitted when writes on block device reaches or exceeds the
-# configured write threshold. For thin-provisioned devices, this
-# means the device should be extended to avoid pausing for
-# disk exhaustion.
-# The event is one shot. Once triggered, it needs to be
+# configured write threshold.  For thin-provisioned devices, this
+# means the device should be extended to avoid pausing for disk
+# exhaustion.  The event is one shot.  Once triggered, it needs to be
 # re-registered with another block-set-write-threshold command.
 #
 # @node-name: graph node name on which the threshold was exceeded.
 #
-# @amount-exceeded: amount of data which exceeded the threshold, in bytes.
+# @amount-exceeded: amount of data which exceeded the threshold, in
+#     bytes.
 #
 # @write-threshold: last configured threshold, in bytes.
 #
@@ -5533,19 +5668,19 @@
 ##
 # @block-set-write-threshold:
 #
-# Change the write threshold for a block drive. An event will be
+# Change the write threshold for a block drive.  An event will be
 # delivered if a write to this block drive crosses the configured
-# threshold.  The threshold is an offset, thus must be
-# non-negative. Default is no write threshold. Setting the threshold
-# to zero disables it.
+# threshold.  The threshold is an offset, thus must be non-negative.
+# Default is no write threshold.  Setting the threshold to zero
+# disables it.
 #
-# This is useful to transparently resize thin-provisioned drives without
-# the guest OS noticing.
+# This is useful to transparently resize thin-provisioned drives
+# without the guest OS noticing.
 #
 # @node-name: graph node name on which the threshold must be set.
 #
 # @write-threshold: configured threshold for the block device, bytes.
-#                   Use 0 to disable the threshold.
+#     Use 0 to disable the threshold.
 #
 # Since: 2.3
 #
@@ -5555,7 +5690,6 @@
 #      "arguments": { "node-name": "mydev",
 #                     "write-threshold": 17179869184 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'block-set-write-threshold',
   'data': { 'node-name': 'str', 'write-threshold': 'uint64' },
@@ -5564,13 +5698,13 @@
 ##
 # @x-blockdev-change:
 #
-# Dynamically reconfigure the block driver state graph. It can be used
-# to add, remove, insert or replace a graph node. Currently only the
-# Quorum driver implements this feature to add or remove its child. This
-# is useful to fix a broken quorum child.
+# Dynamically reconfigure the block driver state graph.  It can be
+# used to add, remove, insert or replace a graph node.  Currently only
+# the Quorum driver implements this feature to add or remove its
+# child.  This is useful to fix a broken quorum child.
 #
-# If @node is specified, it will be inserted under @parent. @child
-# may not be specified in this case. If both @parent and @child are
+# If @node is specified, it will be inserted under @parent.  @child
+# may not be specified in this case.  If both @parent and @child are
 # specified but @node is not, @child will be detached from @parent.
 #
 # @parent: the id or name of the parent node.
@@ -5580,23 +5714,25 @@
 # @node: the name of the node that will be added.
 #
 # Features:
-# @unstable: This command is experimental, and its API is not stable.  It
-#            does not support all kinds of operations, all kinds of
-#            children, nor all block drivers.
 #
-#            FIXME Removing children from a quorum node means introducing
-#            gaps in the child indices. This cannot be represented in the
-#            'children' list of BlockdevOptionsQuorum, as returned by
-#            .bdrv_refresh_filename().
+# @unstable: This command is experimental, and its API is not stable.
+#     It does not support all kinds of operations, all kinds of
+#     children, nor all block drivers.
 #
-#            Warning: The data in a new quorum child MUST be consistent
-#            with that of the rest of the array.
+#     FIXME Removing children from a quorum node means introducing
+#     gaps in the child indices.  This cannot be represented in the
+#     'children' list of BlockdevOptionsQuorum, as returned by
+#     .bdrv_refresh_filename().
+#
+#     Warning: The data in a new quorum child MUST be consistent with
+#     that of the rest of the array.
 #
 # Since: 2.7
 #
 # Examples:
 #
 # 1. Add a new node to a quorum
+#
 # -> { "execute": "blockdev-add",
 #      "arguments": {
 #          "driver": "raw",
@@ -5610,11 +5746,11 @@
 # <- { "return": {} }
 #
 # 2. Delete a quorum's node
+#
 # -> { "execute": "x-blockdev-change",
 #      "arguments": { "parent": "disk1",
 #                     "child": "children.1" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'x-blockdev-change',
   'data' : { 'parent': 'str',
@@ -5626,8 +5762,8 @@
 ##
 # @x-blockdev-set-iothread:
 #
-# Move @node and its children into the @iothread.  If @iothread is null then
-# move @node and its children into the main loop.
+# Move @node and its children into the @iothread.  If @iothread is
+# null then move @node and its children into the main loop.
 #
 # The node must not be attached to a BlockBackend.
 #
@@ -5635,29 +5771,31 @@
 #
 # @iothread: the name of the IOThread object or null for the main loop
 #
-# @force: true if the node and its children should be moved when a BlockBackend
-#         is already attached
+# @force: true if the node and its children should be moved when a
+#     BlockBackend is already attached
 #
 # Features:
-# @unstable: This command is experimental and intended for test cases that
-#            need control over IOThreads only.
+#
+# @unstable: This command is experimental and intended for test cases
+#     that need control over IOThreads only.
 #
 # Since: 2.12
 #
 # Examples:
 #
 # 1. Move a node into an IOThread
+#
 # -> { "execute": "x-blockdev-set-iothread",
 #      "arguments": { "node-name": "disk1",
 #                     "iothread": "iothread0" } }
 # <- { "return": {} }
 #
 # 2. Move a node into the main loop
+#
 # -> { "execute": "x-blockdev-set-iothread",
 #      "arguments": { "node-name": "disk1",
 #                     "iothread": null } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'x-blockdev-set-iothread',
   'data' : { 'node-name': 'str',
@@ -5702,7 +5840,6 @@
 # <- { "event": "QUORUM_FAILURE",
 #      "data": { "reference": "usr1", "sector-num": 345435, "sectors-count": 5 },
 #      "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
-#
 ##
 { 'event': 'QUORUM_FAILURE',
   'data': { 'reference': 'str', 'sector-num': 'int', 'sectors-count': 'int' } }
@@ -5714,10 +5851,10 @@
 #
 # @type: quorum operation type (Since 2.6)
 #
-# @error: error message. Only present on failure. This field
-#         contains a human-readable error message. There are no semantics other
-#         than that the block layer reported an error and clients should not
-#         try to interpret the error string.
+# @error: error message.  Only present on failure.  This field
+#     contains a human-readable error message.  There are no semantics
+#     other than that the block layer reported an error and clients
+#     should not try to interpret the error string.
 #
 # @node-name: the graph node name of the block driver state
 #
@@ -5744,7 +5881,6 @@
 #      "data": { "node-name": "node0", "sector-num": 0, "sectors-count": 2097120,
 #                "type": "flush", "error": "Broken pipe" },
 #      "timestamp": { "seconds": 1456406829, "microseconds": 291763 } }
-#
 ##
 { 'event': 'QUORUM_REPORT_BAD',
   'data': { 'type': 'QuorumOpType', '*error': 'str', 'node-name': 'str',
@@ -5753,14 +5889,14 @@
 ##
 # @BlockdevSnapshotInternal:
 #
-# @device: the device name or node-name of a root node to generate the snapshot
-#          from
+# @device: the device name or node-name of a root node to generate the
+#     snapshot from
 #
 # @name: the name of the internal snapshot to be created
 #
-# Notes: In transaction, if @name is empty, or any snapshot matching @name
-#        exists, the operation will fail. Only some image formats support it,
-#        for example, qcow2, and rbd.
+# Notes: In transaction, if @name is empty, or any snapshot matching
+#     @name exists, the operation will fail.  Only some image formats
+#     support it, for example, qcow2, and rbd.
 #
 # Since: 1.7
 ##
@@ -5771,18 +5907,20 @@
 # @blockdev-snapshot-internal-sync:
 #
 # Synchronously take an internal snapshot of a block device, when the
-# format of the image used supports it. If the name is an empty
+# format of the image used supports it.  If the name is an empty
 # string, or a snapshot with name already exists, the operation will
 # fail.
 #
-# For the arguments, see the documentation of BlockdevSnapshotInternal.
+# For the arguments, see the documentation of
+# BlockdevSnapshotInternal.
 #
-# Returns: - nothing on success
-#          - If @device is not a valid block device, GenericError
-#          - If any snapshot matching @name exists, or @name is empty,
-#            GenericError
-#          - If the format of the image used does not support it,
-#            GenericError
+# Returns:
+#     - nothing on success
+#     - If @device is not a valid block device, GenericError
+#     - If any snapshot matching @name exists, or @name is empty,
+#       GenericError
+#     - If the format of the image used does not support it,
+#       GenericError
 #
 # Since: 1.7
 #
@@ -5793,7 +5931,6 @@
 #                     "name": "snapshot0" }
 #    }
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-snapshot-internal-sync',
   'data': 'BlockdevSnapshotInternal',
@@ -5802,24 +5939,25 @@
 ##
 # @blockdev-snapshot-delete-internal-sync:
 #
-# Synchronously delete an internal snapshot of a block device, when the format
-# of the image used support it. The snapshot is identified by name or id or
-# both. One of the name or id is required. Return SnapshotInfo for the
-# successfully deleted snapshot.
+# Synchronously delete an internal snapshot of a block device, when
+# the format of the image used support it.  The snapshot is identified
+# by name or id or both.  One of the name or id is required.  Return
+# SnapshotInfo for the successfully deleted snapshot.
 #
-# @device: the device name or node-name of a root node to delete the snapshot
-#          from
+# @device: the device name or node-name of a root node to delete the
+#     snapshot from
 #
 # @id: optional the snapshot's ID to be deleted
 #
 # @name: optional the snapshot's name to be deleted
 #
-# Returns: - SnapshotInfo on success
-#          - If @device is not a valid block device, GenericError
-#          - If snapshot not found, GenericError
-#          - If the format of the image used does not support it,
-#            GenericError
-#          - If @id and @name are both not specified, GenericError
+# Returns:
+#     - SnapshotInfo on success
+#     - If @device is not a valid block device, GenericError
+#     - If snapshot not found, GenericError
+#     - If the format of the image used does not support it,
+#       GenericError
+#     - If @id and @name are both not specified, GenericError
 #
 # Since: 1.7
 #
@@ -5840,7 +5978,6 @@
 #                    "icount": 220414
 #      }
 #    }
-#
 ##
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 3ec8ad0ce7..7874a49ba7 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -11,20 +11,24 @@
 ##
 # @NbdServerOptions:
 #
-# Keep this type consistent with the nbd-server-start arguments. The only
-# intended difference is using SocketAddress instead of SocketAddressLegacy.
+# Keep this type consistent with the nbd-server-start arguments.  The
+# only intended difference is using SocketAddress instead of
+# SocketAddressLegacy.
 #
 # @addr: Address on which to listen.
+#
 # @tls-creds: ID of the TLS credentials object (since 2.6).
+#
 # @tls-authz: ID of the QAuthZ authorization object used to validate
-#             the client's x509 distinguished name. This object is
-#             is only resolved at time of use, so can be deleted and
-#             recreated on the fly while the NBD server is active.
-#             If missing, it will default to denying access (since 4.0).
-# @max-connections: The maximum number of connections to allow at the same
-#                   time, 0 for unlimited. Setting this to 1 also stops
-#                   the server from advertising multiple client support
-#                   (since 5.2; default: 0)
+#     the client's x509 distinguished name.  This object is is only
+#     resolved at time of use, so can be deleted and recreated on the
+#     fly while the NBD server is active.  If missing, it will default
+#     to denying access (since 4.0).
+#
+# @max-connections: The maximum number of connections to allow at the
+#     same time, 0 for unlimited.  Setting this to 1 also stops the
+#     server from advertising multiple client support (since 5.2;
+#     default: 0)
 #
 # Since: 4.2
 ##
@@ -38,24 +42,28 @@
 # @nbd-server-start:
 #
 # Start an NBD server listening on the given host and port.  Block
-# devices can then be exported using @nbd-server-add.  The NBD
-# server will present them as named exports; for example, another
-# QEMU instance could refer to them as "nbd:HOST:PORT:exportname=NAME".
+# devices can then be exported using @nbd-server-add.  The NBD server
+# will present them as named exports; for example, another QEMU
+# instance could refer to them as "nbd:HOST:PORT:exportname=NAME".
 #
-# Keep this type consistent with the NbdServerOptions type. The only intended
-# difference is using SocketAddressLegacy instead of SocketAddress.
+# Keep this type consistent with the NbdServerOptions type.  The only
+# intended difference is using SocketAddressLegacy instead of
+# SocketAddress.
 #
 # @addr: Address on which to listen.
+#
 # @tls-creds: ID of the TLS credentials object (since 2.6).
+#
 # @tls-authz: ID of the QAuthZ authorization object used to validate
-#             the client's x509 distinguished name. This object is
-#             is only resolved at time of use, so can be deleted and
-#             recreated on the fly while the NBD server is active.
-#             If missing, it will default to denying access (since 4.0).
-# @max-connections: The maximum number of connections to allow at the same
-#                   time, 0 for unlimited. Setting this to 1 also stops
-#                   the server from advertising multiple client support
-#                   (since 5.2; default: 0).
+#     the client's x509 distinguished name.  This object is is only
+#     resolved at time of use, so can be deleted and recreated on the
+#     fly while the NBD server is active.  If missing, it will default
+#     to denying access (since 4.0).
+#
+# @max-connections: The maximum number of connections to allow at the
+#     same time, 0 for unlimited.  Setting this to 1 also stops the
+#     server from advertising multiple client support (since 5.2;
+#     default: 0).
 #
 # Returns: error if the server is already running.
 #
@@ -71,14 +79,14 @@
 ##
 # @BlockExportOptionsNbdBase:
 #
-# An NBD block export (common options shared between nbd-server-add and
-# the NBD branch of block-export-add).
+# An NBD block export (common options shared between nbd-server-add
+# and the NBD branch of block-export-add).
 #
-# @name: Export name. If unspecified, the @device parameter is used as the
-#        export name. (Since 2.12)
+# @name: Export name.  If unspecified, the @device parameter is used
+#     as the export name.  (Since 2.12)
 #
 # @description: Free-form description of the export, up to 4096 bytes.
-#               (Since 5.0)
+#     (Since 5.0)
 #
 # Since: 5.0
 ##
@@ -92,15 +100,15 @@
 # block-export-add).
 #
 # @bitmaps: Also export each of the named dirty bitmaps reachable from
-#           @device, so the NBD client can use NBD_OPT_SET_META_CONTEXT with
-#           the metadata context name "qemu:dirty-bitmap:BITMAP" to inspect
-#           each bitmap.
-#           Since 7.1 bitmap may be specified by node/name pair.
+#     @device, so the NBD client can use NBD_OPT_SET_META_CONTEXT with
+#     the metadata context name "qemu:dirty-bitmap:BITMAP" to inspect
+#     each bitmap.  Since 7.1 bitmap may be specified by node/name
+#     pair.
 #
-# @allocation-depth: Also export the allocation depth map for @device, so
-#                    the NBD client can use NBD_OPT_SET_META_CONTEXT with
-#                    the metadata context name "qemu:allocation-depth" to
-#                    inspect allocation details. (since 5.2)
+# @allocation-depth: Also export the allocation depth map for @device,
+#     so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
+#     metadata context name "qemu:allocation-depth" to inspect
+#     allocation details.  (since 5.2)
 #
 # Since: 5.2
 ##
@@ -114,12 +122,15 @@
 #
 # A vhost-user-blk block export.
 #
-# @addr: The vhost-user socket on which to listen. Both 'unix' and 'fd'
-#        SocketAddress types are supported. Passed fds must be UNIX domain
-#        sockets.
-# @logical-block-size: Logical block size in bytes. Defaults to 512 bytes.
-# @num-queues: Number of request virtqueues. Must be greater than 0. Defaults
-#              to 1.
+# @addr: The vhost-user socket on which to listen.  Both 'unix' and
+#     'fd' SocketAddress types are supported.  Passed fds must be UNIX
+#     domain sockets.
+#
+# @logical-block-size: Logical block size in bytes.  Defaults to 512
+#     bytes.
+#
+# @num-queues: Number of request virtqueues.  Must be greater than 0.
+#     Defaults to 1.
 #
 # Since: 5.2
 ##
@@ -138,7 +149,7 @@
 # @on: Pass allow_other as a mount option.
 #
 # @auto: Try mounting with allow_other first, and if that fails, retry
-#        without allow_other.
+#     without allow_other.
 #
 # Since: 6.1
 ##
@@ -151,24 +162,21 @@
 # Options for exporting a block graph node on some (file) mountpoint
 # as a raw image.
 #
-# @mountpoint: Path on which to export the block device via FUSE.
-#              This must point to an existing regular file.
+# @mountpoint: Path on which to export the block device via FUSE. This
+#     must point to an existing regular file.
 #
 # @growable: Whether writes beyond the EOF should grow the block node
-#            accordingly. (default: false)
+#     accordingly.  (default: false)
 #
 # @allow-other: If this is off, only qemu's user is allowed access to
-#               this export.  That cannot be changed even with chmod or
-#               chown.
-#               Enabling this option will allow other users access to
-#               the export with the FUSE mount option "allow_other".
-#               Note that using allow_other as a non-root user requires
-#               user_allow_other to be enabled in the global fuse.conf
-#               configuration file.
-#               In auto mode (the default), the FUSE export driver will
-#               first attempt to mount the export with allow_other, and
-#               if that fails, try again without.
-#               (since 6.1; default: auto)
+#     this export.  That cannot be changed even with chmod or chown.
+#     Enabling this option will allow other users access to the export
+#     with the FUSE mount option "allow_other". Note that using
+#     allow_other as a non-root user requires user_allow_other to be
+#     enabled in the global fuse.conf configuration file.  In auto
+#     mode (the default), the FUSE export driver will first attempt to
+#     mount the export with allow_other, and if that fails, try again
+#     without.  (since 6.1; default: auto)
 #
 # Since: 6.0
 ##
@@ -184,11 +192,16 @@
 # A vduse-blk block export.
 #
 # @name: the name of VDUSE device (must be unique across the host).
-# @num-queues: the number of virtqueues. Defaults to 1.
-# @queue-size: the size of virtqueue. Defaults to 256.
-# @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
-#                      and must be power of 2. Defaults to 512 bytes.
-# @serial: the serial number of virtio block device. Defaults to empty string.
+#
+# @num-queues: the number of virtqueues.  Defaults to 1.
+#
+# @queue-size: the size of virtqueue.  Defaults to 256.
+#
+# @logical-block-size: Logical block size in bytes.  Range [512,
+#     PAGE_SIZE] and must be power of 2. Defaults to 512 bytes.
+#
+# @serial: the serial number of virtio block device.  Defaults to
+#     empty string.
 #
 # Since: 7.1
 ##
@@ -206,13 +219,13 @@
 #
 # @device: The device name or node name of the node to be exported
 #
-# @writable: Whether clients should be able to write to the device via the
-#            NBD connection (default false).
+# @writable: Whether clients should be able to write to the device via
+#     the NBD connection (default false).
 #
-# @bitmap: Also export a single dirty bitmap reachable from @device, so the
-#          NBD client can use NBD_OPT_SET_META_CONTEXT with the metadata
-#          context name "qemu:dirty-bitmap:BITMAP" to inspect the bitmap
-#          (since 4.0).
+# @bitmap: Also export a single dirty bitmap reachable from @device,
+#     so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
+#     metadata context name "qemu:dirty-bitmap:BITMAP" to inspect the
+#     bitmap (since 4.0).
 #
 # Since: 5.0
 ##
@@ -226,13 +239,16 @@
 #
 # Export a block node to QEMU's embedded NBD server.
 #
-# The export name will be used as the id for the resulting block export.
+# The export name will be used as the id for the resulting block
+# export.
 #
 # Features:
-# @deprecated: This command is deprecated. Use @block-export-add instead.
 #
-# Returns: error if the server is not running, or export with the same name
-#          already exists.
+# @deprecated: This command is deprecated.  Use @block-export-add
+#     instead.
+#
+# Returns: error if the server is not running, or export with the same
+#     name already exists.
 #
 # Since: 1.3
 ##
@@ -245,17 +261,18 @@
 #
 # Mode for removing a block export.
 #
-# @safe: Remove export if there are no existing connections, fail otherwise.
+# @safe: Remove export if there are no existing connections, fail
+#     otherwise.
 #
 # @hard: Drop all connections immediately and remove export.
 #
 # Potential additional modes to be added in the future:
 #
-# hide: Just hide export from new clients, leave existing connections as is.
-# Remove export after all clients are disconnected.
+# hide: Just hide export from new clients, leave existing connections
+# as is.  Remove export after all clients are disconnected.
 #
-# soft: Hide export from new clients, answer with ESHUTDOWN for all further
-# requests from existing clients.
+# soft: Hide export from new clients, answer with ESHUTDOWN for all
+# further requests from existing clients.
 #
 # Since: 2.12
 ##
@@ -268,17 +285,19 @@
 #
 # @name: Block export id.
 #
-# @mode: Mode of command operation. See @BlockExportRemoveMode description.
-#        Default is 'safe'.
+# @mode: Mode of command operation.  See @BlockExportRemoveMode
+#     description.  Default is 'safe'.
 #
 # Features:
-# @deprecated: This command is deprecated. Use @block-export-del instead.
+#
+# @deprecated: This command is deprecated.  Use @block-export-del
+#     instead.
 #
 # Returns: error if
 #
-#          - the server is not running
-#          - export is not found
-#          - mode is 'safe' and there are existing connections
+#     - the server is not running
+#     - export is not found
+#     - mode is 'safe' and there are existing connections
 #
 # Since: 2.12
 ##
@@ -290,8 +309,8 @@
 ##
 # @nbd-server-stop:
 #
-# Stop QEMU's embedded NBD server, and unregister all devices previously
-# added via @nbd-server-add.
+# Stop QEMU's embedded NBD server, and unregister all devices
+# previously added via @nbd-server-add.
 #
 # Since: 1.3
 ##
@@ -304,8 +323,11 @@
 # An enumeration of block export types
 #
 # @nbd: NBD export
+#
 # @vhost-user-blk: vhost-user-blk export (since 5.2)
+#
 # @fuse: FUSE export (since: 6.0)
+#
 # @vduse-blk: vduse-blk export (since 7.1)
 #
 # Since: 4.2
@@ -320,28 +342,31 @@
 ##
 # @BlockExportOptions:
 #
-# Describes a block export, i.e. how single node should be exported on an
-# external interface.
+# Describes a block export, i.e. how single node should be exported on
+# an external interface.
 #
-# @id: A unique identifier for the block export (across all export types)
+# @id: A unique identifier for the block export (across all export
+#     types)
 #
-# @node-name: The node name of the block node to be exported (since: 5.2)
+# @node-name: The node name of the block node to be exported
+#     (since: 5.2)
 #
 # @writable: True if clients should be able to write to the export
-#            (default false)
+#     (default false)
 #
-# @writethrough: If true, caches are flushed after every write request to the
-#                export before completion is signalled. (since: 5.2;
-#                default: false)
+# @writethrough: If true, caches are flushed after every write request
+#     to the export before completion is signalled.  (since: 5.2;
+#     default: false)
 #
-# @iothread: The name of the iothread object where the export will run. The
-#            default is to use the thread currently associated with the
-#            block node. (since: 5.2)
+# @iothread: The name of the iothread object where the export will
+#     run.  The default is to use the thread currently associated with
+#     the block node.  (since: 5.2)
 #
-# @fixed-iothread: True prevents the block node from being moved to another
-#                  thread while the export is active. If true and @iothread is
-#                  given, export creation fails if the block node cannot be
-#                  moved to the iothread. The default is false. (since: 5.2)
+# @fixed-iothread: True prevents the block node from being moved to
+#     another thread while the export is active.  If true and
+#     @iothread is given, export creation fails if the block node
+#     cannot be moved to the iothread.  The default is false.
+#     (since: 5.2)
 #
 # Since: 4.2
 ##
@@ -378,17 +403,17 @@
 ##
 # @block-export-del:
 #
-# Request to remove a block export. This drops the user's reference to the
-# export, but the export may still stay around after this command returns until
-# the shutdown of the export has completed.
+# Request to remove a block export.  This drops the user's reference
+# to the export, but the export may still stay around after this
+# command returns until the shutdown of the export has completed.
 #
 # @id: Block export id.
 #
-# @mode: Mode of command operation. See @BlockExportRemoveMode description.
-#        Default is 'safe'.
+# @mode: Mode of command operation.  See @BlockExportRemoveMode
+#     description.  Default is 'safe'.
 #
-# Returns: Error if the export is not found or @mode is 'safe' and the export
-#          is still in use (e.g. by existing client connections)
+# Returns: Error if the export is not found or @mode is 'safe' and the
+#     export is still in use (e.g. by existing client connections)
 #
 # Since: 5.2
 ##
@@ -420,8 +445,7 @@
 # @node-name: The node name of the block node that is exported
 #
 # @shutting-down: True if the export is shutting down (e.g. after a
-#                 block-export-del command, but before the shutdown has
-#                 completed)
+#     block-export-del command, but before the shutdown has completed)
 #
 # Since: 5.2
 ##
diff --git a/qapi/block.json b/qapi/block.json
index 94339a1761..a1e16592fd 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -19,26 +19,26 @@
 # translate logical CHS to physical; instead, they will use logical
 # block addressing.
 #
-# @auto: If cylinder/heads/sizes are passed, choose between none and LBA
-#        depending on the size of the disk.  If they are not passed,
-#        choose none if QEMU can guess that the disk had 16 or fewer
-#        heads, large if QEMU can guess that the disk had 131072 or
-#        fewer tracks across all heads (i.e. cylinders*heads<131072),
-#        otherwise LBA.
+# @auto: If cylinder/heads/sizes are passed, choose between none and
+#     LBA depending on the size of the disk.  If they are not passed,
+#     choose none if QEMU can guess that the disk had 16 or fewer
+#     heads, large if QEMU can guess that the disk had 131072 or fewer
+#     tracks across all heads (i.e. cylinders*heads<131072), otherwise
+#     LBA.
 #
 # @none: The physical disk geometry is equal to the logical geometry.
 #
 # @lba: Assume 63 sectors per track and one of 16, 32, 64, 128 or 255
-#       heads (if fewer than 255 are enough to cover the whole disk
-#       with 1024 cylinders/head).  The number of cylinders/head is
-#       then computed based on the number of sectors and heads.
+#     heads (if fewer than 255 are enough to cover the whole disk with
+#     1024 cylinders/head).  The number of cylinders/head is then
+#     computed based on the number of sectors and heads.
 #
-# @large: The number of cylinders per head is scaled down to 1024
-#         by correspondingly scaling up the number of heads.
+# @large: The number of cylinders per head is scaled down to 1024 by
+#     correspondingly scaling up the number of heads.
 #
 # @rechs: Same as @large, but first convert a 16-head geometry to
-#         15-head, by proportionally scaling up the number of
-#         cylinders/head.
+#     15-head, by proportionally scaling up the number of
+#     cylinders/head.
 #
 # Since: 2.0
 ##
@@ -51,9 +51,13 @@
 # Type of Floppy drive to be emulated by the Floppy Disk Controller.
 #
 # @144: 1.44MB 3.5" drive
+#
 # @288: 2.88MB 3.5" drive
+#
 # @120: 1.2MB 5.25" drive
+#
 # @none: No drive connected
+#
 # @auto: Automatically determined by inserted media at boot
 #
 # Since: 2.6
@@ -68,8 +72,8 @@
 #
 # @id: the identifier of the persistent reservation manager
 #
-# @connected: true if the persistent reservation manager is connected to
-#             the underlying storage or helper
+# @connected: true if the persistent reservation manager is connected
+#     to the underlying storage or helper
 #
 # Since: 3.0
 ##
@@ -79,9 +83,11 @@
 ##
 # @query-pr-managers:
 #
-# Returns a list of information about each persistent reservation manager.
+# Returns a list of information about each persistent reservation
+# manager.
 #
-# Returns: a list of @PRManagerInfo for each persistent reservation manager
+# Returns: a list of @PRManagerInfo for each persistent reservation
+#     manager
 #
 # Since: 3.0
 ##
@@ -98,13 +104,15 @@
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
 # @force: If true, eject regardless of whether the drive is locked.
-#         If not specified, the default value is false.
+#     If not specified, the default value is false.
 #
 # Features:
+#
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
-# Returns: - Nothing on success
-#          - If @device is not a valid block device, DeviceNotFound
+# Returns:
+#     - Nothing on success
+#     - If @device is not a valid block device, DeviceNotFound
 #
 # Notes: Ejecting a device with no media results in success
 #
@@ -123,32 +131,33 @@
 ##
 # @blockdev-open-tray:
 #
-# Opens a block device's tray. If there is a block driver state tree inserted as
-# a medium, it will become inaccessible to the guest (but it will remain
-# associated to the block device, so closing the tray will make it accessible
-# again).
+# Opens a block device's tray.  If there is a block driver state tree
+# inserted as a medium, it will become inaccessible to the guest (but
+# it will remain associated to the block device, so closing the tray
+# will make it accessible again).
 #
 # If the tray was already open before, this will be a no-op.
 #
-# Once the tray opens, a DEVICE_TRAY_MOVED event is emitted. There are cases in
-# which no such event will be generated, these include:
+# Once the tray opens, a DEVICE_TRAY_MOVED event is emitted.  There
+# are cases in which no such event will be generated, these include:
 #
-# - if the guest has locked the tray, @force is false and the guest does not
-#   respond to the eject request
-# - if the BlockBackend denoted by @device does not have a guest device attached
-#   to it
+# - if the guest has locked the tray, @force is false and the guest
+#   does not respond to the eject request
+# - if the BlockBackend denoted by @device does not have a guest
+#   device attached to it
 # - if the guest device does not have an actual tray
 #
 # @device: Block device name
 #
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
-# @force: if false (the default), an eject request will be sent to
-#         the guest if it has locked the tray (and the tray will not be opened
-#         immediately); if true, the tray will be opened regardless of whether
-#         it is locked
+# @force: if false (the default), an eject request will be sent to the
+#     guest if it has locked the tray (and the tray will not be opened
+#     immediately); if true, the tray will be opened regardless of
+#     whether it is locked
 #
 # Features:
+#
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
 # Since: 2.5
@@ -166,7 +175,6 @@
 #                "tray-open": true } }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-open-tray',
   'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
@@ -176,9 +184,9 @@
 ##
 # @blockdev-close-tray:
 #
-# Closes a block device's tray. If there is a block driver state tree associated
-# with the block device (which is currently ejected), that tree will be loaded
-# as the medium.
+# Closes a block device's tray.  If there is a block driver state tree
+# associated with the block device (which is currently ejected), that
+# tree will be loaded as the medium.
 #
 # If the tray was already closed before, this will be a no-op.
 #
@@ -187,6 +195,7 @@
 # @id: The name or QOM path of the guest device (since: 2.8)
 #
 # Features:
+#
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
 # Since: 2.5
@@ -204,7 +213,6 @@
 #                "tray-open": false } }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-close-tray',
   'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
@@ -213,11 +221,12 @@
 ##
 # @blockdev-remove-medium:
 #
-# Removes a medium (a block driver state tree) from a block device. That block
-# device's tray must currently be open (unless there is no attached guest
-# device).
+# Removes a medium (a block driver state tree) from a block device.
+# That block device's tray must currently be open (unless there is no
+# attached guest device).
 #
-# If the tray is open and there is no medium inserted, this will be a no-op.
+# If the tray is open and there is no medium inserted, this will be a
+# no-op.
 #
 # @id: The name or QOM path of the guest device
 #
@@ -247,7 +256,6 @@
 #      "arguments": { "id": "ide0-1-0" } }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-remove-medium',
   'data': { 'id': 'str' } }
@@ -255,9 +263,9 @@
 ##
 # @blockdev-insert-medium:
 #
-# Inserts a medium (a block driver state tree) into a block device. That block
-# device's tray must currently be open (unless there is no attached guest
-# device) and there must be no medium inserted already.
+# Inserts a medium (a block driver state tree) into a block device.
+# That block device's tray must currently be open (unless there is no
+# attached guest device) and there must be no medium inserted already.
 #
 # @id: The name or QOM path of the guest device
 #
@@ -280,7 +288,6 @@
 #                     "node-name": "node0" } }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-insert-medium',
   'data': { 'id': 'str',
@@ -306,30 +313,32 @@
 ##
 # @blockdev-change-medium:
 #
-# Changes the medium inserted into a block device by ejecting the current medium
-# and loading a new image file which is inserted as the new medium (this command
-# combines blockdev-open-tray, blockdev-remove-medium, blockdev-insert-medium
-# and blockdev-close-tray).
+# Changes the medium inserted into a block device by ejecting the
+# current medium and loading a new image file which is inserted as the
+# new medium (this command combines blockdev-open-tray,
+# blockdev-remove-medium, blockdev-insert-medium and
+# blockdev-close-tray).
 #
 # @device: Block device name
 #
-# @id: The name or QOM path of the guest device
-#      (since: 2.8)
+# @id: The name or QOM path of the guest device (since: 2.8)
 #
 # @filename: filename of the new image to be loaded
 #
-# @format: format to open the new image with (defaults to
-#          the probed format)
+# @format: format to open the new image with (defaults to the probed
+#     format)
 #
 # @read-only-mode: change the read-only mode of the device; defaults
-#                  to 'retain'
+#     to 'retain'
 #
-# @force: if false (the default), an eject request through blockdev-open-tray
-#         will be sent to the guest if it has locked the tray (and the tray
-#         will not be opened immediately); if true, the tray will be opened
-#         regardless of whether it is locked. (since 7.1)
+# @force: if false (the default), an eject request through
+#     blockdev-open-tray will be sent to the guest if it has locked
+#     the tray (and the tray will not be opened immediately); if true,
+#     the tray will be opened regardless of whether it is locked.
+#     (since 7.1)
 #
 # Features:
+#
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
 # Since: 2.5
@@ -363,7 +372,6 @@
 #                     "read-only-mode": "read-only" } }
 #
 # <- { "return": {} }
-#
 ##
 { 'command': 'blockdev-change-medium',
   'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
@@ -376,16 +384,17 @@
 ##
 # @DEVICE_TRAY_MOVED:
 #
-# Emitted whenever the tray of a removable device is moved by the guest or by
-# HMP/QMP commands
+# Emitted whenever the tray of a removable device is moved by the
+# guest or by HMP/QMP commands
 #
-# @device: Block device name. This is always present for compatibility
-#          reasons, but it can be empty ("") if the image does not
-#          have a device name associated.
+# @device: Block device name.  This is always present for
+#     compatibility reasons, but it can be empty ("") if the image
+#     does not have a device name associated.
 #
 # @id: The name or QOM path of the guest device (since 2.8)
 #
-# @tray-open: true if the tray has been opened or false if it has been closed
+# @tray-open: true if the tray has been opened or false if it has been
+#     closed
 #
 # Since: 1.1
 #
@@ -397,7 +406,6 @@
 #                "tray-open": true
 #      },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'DEVICE_TRAY_MOVED',
   'data': { 'device': 'str', 'id': 'str', 'tray-open': 'bool' } }
@@ -421,7 +429,6 @@
 #                "connected": true
 #      },
 #      "timestamp": { "seconds": 1519840375, "microseconds": 450486 } }
-#
 ##
 { 'event': 'PR_MANAGER_STATUS_CHANGED',
   'data': { 'id': 'str', 'connected': 'bool' } }
@@ -436,24 +443,25 @@
 #
 # If two or more devices are members of the same group, the limits
 # will apply to the combined I/O of the whole group in a round-robin
-# fashion. Therefore, setting new I/O limits to a device will affect
+# fashion.  Therefore, setting new I/O limits to a device will affect
 # the whole group.
 #
 # The name of the group can be specified using the 'group' parameter.
 # If the parameter is unset, it is assumed to be the current group of
-# that device. If it's not in any group yet, the name of the device
+# that device.  If it's not in any group yet, the name of the device
 # will be used as the name for its group.
 #
 # The 'group' parameter can also be used to move a device to a
-# different group. In this case the limits specified in the parameters
-# will be applied to the new group only.
+# different group.  In this case the limits specified in the
+# parameters will be applied to the new group only.
 #
 # I/O limits can be disabled by setting all of them to 0. In this case
 # the device will be removed from its group and the rest of its
-# members will not be affected. The 'group' parameter is ignored.
+# members will not be affected.  The 'group' parameter is ignored.
 #
-# Returns: - Nothing on success
-#          - If @device is not a valid block device, DeviceNotFound
+# Returns:
+#     - Nothing on success
+#     - If @device is not a valid block device, DeviceNotFound
 #
 # Since: 1.1
 #
@@ -504,37 +512,40 @@
 #
 # Manage read, write and flush latency histograms for the device.
 #
-# If only @id parameter is specified, remove all present latency histograms
-# for the device. Otherwise, add/reset some of (or all) latency histograms.
+# If only @id parameter is specified, remove all present latency
+# histograms for the device.  Otherwise, add/reset some of (or all)
+# latency histograms.
 #
 # @id: The name or QOM path of the guest device.
 #
 # @boundaries: list of interval boundary values (see description in
-#              BlockLatencyHistogramInfo definition). If specified, all
-#              latency histograms are removed, and empty ones created for all
-#              io types with intervals corresponding to @boundaries (except for
-#              io types, for which specific boundaries are set through the
-#              following parameters).
+#     BlockLatencyHistogramInfo definition). If specified, all latency
+#     histograms are removed, and empty ones created for all io types
+#     with intervals corresponding to @boundaries (except for io
+#     types, for which specific boundaries are set through the
+#     following parameters).
 #
 # @boundaries-read: list of interval boundary values for read latency
-#                   histogram. If specified, old read latency histogram is
-#                   removed, and empty one created with intervals
-#                   corresponding to @boundaries-read. The parameter has higher
-#                   priority then @boundaries.
+#     histogram.  If specified, old read latency histogram is removed,
+#     and empty one created with intervals corresponding to
+#     @boundaries-read.  The parameter has higher priority then
+#     @boundaries.
 #
-# @boundaries-write: list of interval boundary values for write latency
-#                    histogram.
+# @boundaries-write: list of interval boundary values for write
+#     latency histogram.
 #
-# @boundaries-flush: list of interval boundary values for flush latency
-#                    histogram.
+# @boundaries-flush: list of interval boundary values for flush
+#     latency histogram.
 #
-# Returns: error if device is not found or any boundary arrays are invalid.
+# Returns: error if device is not found or any boundary arrays are
+#     invalid.
 #
 # Since: 4.0
 #
 # Example:
-# set new histograms for all io types with intervals
-# [0, 10), [10, 50), [50, 100), [100, +inf):
+#
+# set new histograms for all io types with intervals [0, 10), [10,
+# 50), [50, 100), [100, +inf):
 #
 # -> { "execute": "block-latency-histogram-set",
 #      "arguments": { "id": "drive0",
@@ -542,8 +553,9 @@
 # <- { "return": {} }
 #
 # Example:
-# set new histogram only for write, other histograms will remain
-# not changed (or not created):
+#
+# set new histogram only for write, other histograms will remain not
+# changed (or not created):
 #
 # -> { "execute": "block-latency-histogram-set",
 #      "arguments": { "id": "drive0",
@@ -551,9 +563,10 @@
 # <- { "return": {} }
 #
 # Example:
-# set new histograms with the following intervals:
-#   read, flush: [0, 10), [10, 50), [50, 100), [100, +inf)
-#   write: [0, 1000), [1000, 5000), [5000, +inf)
+#
+# set new histograms with the following intervals:   read, flush: [0,
+# 10), [10, 50), [50, 100), [100, +inf)   write: [0, 1000), [1000,
+# 5000), [5000, +inf)
 #
 # -> { "execute": "block-latency-histogram-set",
 #      "arguments": { "id": "drive0",
@@ -562,6 +575,7 @@
 # <- { "return": {} }
 #
 # Example:
+#
 # remove all latency histograms:
 #
 # -> { "execute": "block-latency-histogram-set",
diff --git a/qapi/char.json b/qapi/char.json
index c9431dd0a7..e413ac2b70 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -17,12 +17,12 @@
 #
 # @filename: the filename of the character device
 #
-# @frontend-open: shows whether the frontend device attached to this backend
-#                 (eg. with the chardev=... option) is in open or closed state
-#                 (since 2.1)
+# @frontend-open: shows whether the frontend device attached to this
+#     backend (eg. with the chardev=... option) is in open or closed
+#     state (since 2.1)
 #
-# Notes: @filename is encoded using the QEMU command line character device
-#        encoding.  See the QEMU man page for details.
+# Notes: @filename is encoded using the QEMU command line character
+#     device encoding.  See the QEMU man page for details.
 #
 # Since: 0.14
 ##
@@ -62,7 +62,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-chardev', 'returns': ['ChardevInfo'],
   'allow-preconfig': true }
@@ -106,7 +105,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-chardev-backends', 'returns': ['ChardevBackendInfo'] }
 
@@ -135,11 +133,11 @@
 #
 # @format: data encoding (default 'utf8').
 #
-#          - base64: data must be base64 encoded text.  Its binary
-#            decoding gets written.
-#          - utf8: data's UTF-8 encoding is written
-#          - data itself is always Unicode regardless of format, like
-#            any other string.
+#     - base64: data must be base64 encoded text.  Its binary decoding
+#       gets written.
+#     - utf8: data's UTF-8 encoding is written
+#     - data itself is always Unicode regardless of format, like any
+#       other string.
 #
 # Returns: Nothing on success
 #
@@ -152,7 +150,6 @@
 #                     "data": "abcdefgh",
 #                     "format": "utf8" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'ringbuf-write',
   'data': { 'device': 'str',
@@ -170,14 +167,13 @@
 #
 # @format: data encoding (default 'utf8').
 #
-#          - base64: the data read is returned in base64 encoding.
-#          - utf8: the data read is interpreted as UTF-8.
-#            Bug: can screw up when the buffer contains invalid UTF-8
-#            sequences, NUL characters, after the ring buffer lost
-#            data, and when reading stops because the size limit is
-#            reached.
-#          - The return value is always Unicode regardless of format,
-#            like any other string.
+#     - base64: the data read is returned in base64 encoding.
+#     - utf8: the data read is interpreted as UTF-8.
+#       Bug: can screw up when the buffer contains invalid UTF-8
+#       sequences, NUL characters, after the ring buffer lost data,
+#       and when reading stops because the size limit is reached.
+#     - The return value is always Unicode regardless of format, like
+#       any other string.
 #
 # Returns: data read from the device
 #
@@ -190,7 +186,6 @@
 #                     "size": 1000,
 #                     "format": "utf8" } }
 # <- { "return": "abcdefgh" }
-#
 ##
 { 'command': 'ringbuf-read',
   'data': {'device': 'str', 'size': 'int', '*format': 'DataFormat'},
@@ -202,8 +197,9 @@
 # Configuration shared across all chardev backends
 #
 # @logfile: The name of a logfile to save output
-# @logappend: true to append instead of truncate
-#             (default to false to truncate)
+#
+# @logappend: true to append instead of truncate (default to false to
+#     truncate)
 #
 # Since: 2.6
 ##
@@ -217,9 +213,11 @@
 # Configuration info for file chardevs.
 #
 # @in: The name of the input file
+#
 # @out: The name of the output file
-# @append: Open the file in append mode (default false to
-#          truncate) (Since 2.6)
+#
+# @append: Open the file in append mode (default false to truncate)
+#     (Since 2.6)
 #
 # Since: 1.4
 ##
@@ -234,8 +232,8 @@
 #
 # Configuration info for device and pipe chardevs.
 #
-# @device: The name of the special file for the device,
-#          i.e. /dev/ttyS0 on Unix or COM1: on Windows
+# @device: The name of the special file for the device, i.e.
+#     /dev/ttyS0 on Unix or COM1: on Windows
 #
 # Since: 1.4
 ##
@@ -248,29 +246,36 @@
 #
 # Configuration info for (stream) socket chardevs.
 #
-# @addr: socket address to listen on (server=true)
-#        or connect to (server=false)
+# @addr: socket address to listen on (server=true) or connect to
+#     (server=false)
+#
 # @tls-creds: the ID of the TLS credentials object (since 2.6)
+#
 # @tls-authz: the ID of the QAuthZ authorization object against which
-#             the client's x509 distinguished name will be validated. This
-#             object is only resolved at time of use, so can be deleted
-#             and recreated on the fly while the chardev server is active.
-#             If missing, it will default to denying access (since 4.0)
+#     the client's x509 distinguished name will be validated.  This
+#     object is only resolved at time of use, so can be deleted and
+#     recreated on the fly while the chardev server is active.  If
+#     missing, it will default to denying access (since 4.0)
+#
 # @server: create server socket (default: true)
-# @wait: wait for incoming connection on server
-#        sockets (default: false).
-#        Silently ignored with server: false.  This use is deprecated.
+#
+# @wait: wait for incoming connection on server sockets (default:
+#     false). Silently ignored with server: false.  This use is
+#     deprecated.
+#
 # @nodelay: set TCP_NODELAY socket option (default: false)
-# @telnet: enable telnet protocol on server
-#          sockets (default: false)
-# @tn3270: enable tn3270 protocol on server
-#          sockets (default: false) (Since: 2.10)
-# @websocket: enable websocket protocol on server
-#             sockets (default: false) (Since: 3.1)
-# @reconnect: For a client socket, if a socket is disconnected,
-#             then attempt a reconnect after the given number of seconds.
-#             Setting this to zero disables this function. (default: 0)
-#             (Since: 2.2)
+#
+# @telnet: enable telnet protocol on server sockets (default: false)
+#
+# @tn3270: enable tn3270 protocol on server sockets (default: false)
+#     (Since: 2.10)
+#
+# @websocket: enable websocket protocol on server sockets
+#     (default: false) (Since: 3.1)
+#
+# @reconnect: For a client socket, if a socket is disconnected, then
+#     attempt a reconnect after the given number of seconds.  Setting
+#     this to zero disables this function.  (default: 0) (Since: 2.2)
 #
 # Since: 1.4
 ##
@@ -293,6 +298,7 @@
 # Configuration info for datagram socket chardevs.
 #
 # @remote: remote address
+#
 # @local: local address
 #
 # Since: 1.5
@@ -320,8 +326,8 @@
 #
 # Configuration info for stdio chardevs.
 #
-# @signal: Allow signals (such as SIGINT triggered by ^C)
-#          be delivered to qemu.  Default: true.
+# @signal: Allow signals (such as SIGINT triggered by ^C) be delivered
+#     to qemu.  Default: true.
 #
 # Since: 1.5
 ##
@@ -377,8 +383,11 @@
 # Configuration info for virtual console chardevs.
 #
 # @width: console width, in pixels
+#
 # @height: console height, in pixels
+#
 # @cols: console width, in chars
+#
 # @rows: console height, in chars
 #
 # Since: 1.5
@@ -409,6 +418,7 @@
 # Configuration info for qemu vdagent implementation.
 #
 # @mouse: enable/disable mouse, default is enabled.
+#
 # @clipboard: enable/disable clipboard, default is disabled.
 #
 # Since: 6.1
@@ -423,20 +433,35 @@
 # @ChardevBackendKind:
 #
 # @pipe: Since 1.5
+#
 # @udp: Since 1.5
+#
 # @mux: Since 1.5
+#
 # @msmouse: Since 1.5
+#
 # @wctablet: Since 2.9
+#
 # @braille: Since 1.5
+#
 # @testdev: Since 2.2
+#
 # @stdio: Since 1.5
+#
 # @console: Since 1.5
+#
 # @spicevmc: Since 1.5
+#
 # @spiceport: Since 1.5
+#
 # @qemu-vdagent: Since 6.1
+#
 # @dbus: Since 7.0
+#
 # @vc: v1.5
+#
 # @ringbuf: Since 1.6
+#
 # @memory: Since 1.5
 #
 # Since: 1.4
@@ -617,8 +642,8 @@
 #
 # Return info about the chardev backend just created.
 #
-# @pty: name of the slave pseudoterminal device, present if
-#       and only if a chardev of type 'pty' was created
+# @pty: name of the slave pseudoterminal device, present if and only
+#     if a chardev of type 'pty' was created
 #
 # Since: 1.4
 ##
@@ -631,6 +656,7 @@
 # Add a character device backend
 #
 # @id: the chardev's ID, must be unique
+#
 # @backend: backend type and parameters
 #
 # Returns: ChardevReturn.
@@ -654,7 +680,6 @@
 #      "arguments" : { "id" : "baz",
 #                      "backend" : { "type" : "pty", "data" : {} } } }
 # <- { "return": { "pty" : "/dev/pty/42" } }
-#
 ##
 { 'command': 'chardev-add',
   'data': { 'id': 'str',
@@ -667,6 +692,7 @@
 # Change a character device backend
 #
 # @id: the chardev's ID, must exist
+#
 # @backend: new backend type and parameters
 #
 # Returns: ChardevReturn.
@@ -695,7 +721,6 @@
 #                  "server" : true,
 #                  "wait" : false }}}}
 # <- {"return": {}}
-#
 ##
 { 'command': 'chardev-change',
   'data': { 'id': 'str',
@@ -717,7 +742,6 @@
 #
 # -> { "execute": "chardev-remove", "arguments": { "id" : "foo" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'chardev-remove',
   'data': { 'id': 'str' } }
@@ -737,7 +761,6 @@
 #
 # -> { "execute": "chardev-send-break", "arguments": { "id" : "foo" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'chardev-send-break',
   'data': { 'id': 'str' } }
@@ -760,7 +783,6 @@
 # <- { "event": "VSERPORT_CHANGE",
 #      "data": { "id": "channel0", "open": true },
 #      "timestamp": { "seconds": 1401385907, "microseconds": 422329 } }
-#
 ##
 { 'event': 'VSERPORT_CHANGE',
   'data': { 'id': 'str',
diff --git a/qapi/common.json b/qapi/common.json
index 356db3f670..6fed9cde1a 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -70,6 +70,7 @@
 # has a different meaning.
 #
 # @s: the string value
+#
 # @n: no string value
 #
 # Since: 2.10
@@ -155,11 +156,11 @@
 #
 # @preferred: set the preferred host nodes for allocation
 #
-# @bind: a strict policy that restricts memory allocation to the
-#        host nodes specified
+# @bind: a strict policy that restricts memory allocation to the host
+#     nodes specified
 #
-# @interleave: memory allocations are interleaved across the set
-#              of host nodes specified
+# @interleave: memory allocations are interleaved across the set of
+#     host nodes specified
 #
 # Since: 2.1
 ##
@@ -169,17 +170,17 @@
 ##
 # @NetFilterDirection:
 #
-# Indicates whether a netfilter is attached to a netdev's transmit queue or
-# receive queue or both.
+# Indicates whether a netfilter is attached to a netdev's transmit
+# queue or receive queue or both.
 #
 # @all: the filter is attached both to the receive and the transmit
-#       queue of the netdev (default).
+#     queue of the netdev (default).
 #
 # @rx: the filter is attached to the receive queue of the netdev,
-#      where it will receive packets sent to the netdev.
+#     where it will receive packets sent to the netdev.
 #
 # @tx: the filter is attached to the transmit queue of the netdev,
-#      where it will receive packets sent by the netdev.
+#     where it will receive packets sent by the netdev.
 #
 # Since: 2.5
 ##
diff --git a/qapi/compat.json b/qapi/compat.json
index 39b52872d5..f4c19837eb 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -11,7 +11,9 @@
 # Policy for handling "funny" input.
 #
 # @accept: Accept silently
+#
 # @reject: Reject with an error
+#
 # @crash: abort() the process
 #
 # Since: 6.0
@@ -25,6 +27,7 @@
 # Policy for handling "funny" output.
 #
 # @accept: Pass on unchanged
+#
 # @hide: Filter out
 #
 # Since: 6.0
@@ -47,11 +50,15 @@
 # enumeration values.  They behave the same as with policy @accept.
 #
 # @deprecated-input: how to handle deprecated input (default 'accept')
-# @deprecated-output: how to handle deprecated output (default 'accept')
+#
+# @deprecated-output: how to handle deprecated output (default
+#     'accept')
+#
 # @unstable-input: how to handle unstable input (default 'accept')
-#                  (since 6.2)
+#     (since 6.2)
+#
 # @unstable-output: how to handle unstable output (default 'accept')
-#                   (since 6.2)
+#     (since 6.2)
 #
 # Since: 6.0
 ##
diff --git a/qapi/control.json b/qapi/control.json
index f83499280a..6a7c5af882 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -14,10 +14,9 @@
 # Arguments:
 #
 # @enable: An optional list of QMPCapability values to enable.  The
-#          client must not enable any capability that is not
-#          mentioned in the QMP greeting message.  If the field is not
-#          provided, it means no QMP capabilities will be enabled.
-#          (since 2.12)
+#     client must not enable any capability that is not mentioned in
+#     the QMP greeting message.  If the field is not provided, it
+#     means no QMP capabilities will be enabled.  (since 2.12)
 #
 # Example:
 #
@@ -25,12 +24,14 @@
 #      "arguments": { "enable": [ "oob" ] } }
 # <- { "return": {} }
 #
-# Notes: This command is valid exactly when first connecting: it must be
-#        issued before any other command will be accepted, and will fail once the
-#        monitor is accepting other commands. (see qemu docs/interop/qmp-spec.txt)
+# Notes: This command is valid exactly when first connecting: it must
+#     be issued before any other command will be accepted, and will
+#     fail once the monitor is accepting other commands.  (see qemu
+#     docs/interop/qmp-spec.txt)
 #
-#        The QMP client needs to explicitly enable QMP capabilities, otherwise
-#        all the QMP capabilities will be turned off by default.
+#     The QMP client needs to explicitly enable QMP capabilities,
+#     otherwise all the QMP capabilities will be turned off by
+#     default.
 #
 # Since: 0.13
 ##
@@ -44,8 +45,8 @@
 # Enumeration of capabilities to be advertised during initial client
 # connection, used for agreeing on particular QMP extension behaviors.
 #
-# @oob: QMP ability to support out-of-band requests.
-#       (Please refer to qmp-spec.txt for more information on OOB)
+# @oob: QMP ability to support out-of-band requests.  (Please refer to
+#     qmp-spec.txt for more information on OOB)
 #
 # Since: 2.12
 ##
@@ -73,16 +74,16 @@
 #
 # A description of QEMU's version.
 #
-# @qemu: The version of QEMU.  By current convention, a micro
-#        version of 50 signifies a development branch.  A micro version
-#        greater than or equal to 90 signifies a release candidate for
-#        the next minor version.  A micro version of less than 50
-#        signifies a stable release.
+# @qemu: The version of QEMU.  By current convention, a micro version
+#     of 50 signifies a development branch.  A micro version greater
+#     than or equal to 90 signifies a release candidate for the next
+#     minor version.  A micro version of less than 50 signifies a
+#     stable release.
 #
-# @package: QEMU will always set this field to an empty string.  Downstream
-#           versions of QEMU should set this to a non-empty string.  The
-#           exact format depends on the downstream however it highly
-#           recommended that a unique name is used.
+# @package: QEMU will always set this field to an empty string.
+#     Downstream versions of QEMU should set this to a non-empty
+#     string.  The exact format depends on the downstream however it
+#     highly recommended that a unique name is used.
 #
 # Since: 0.14
 ##
@@ -94,7 +95,8 @@
 #
 # Returns the current version of QEMU.
 #
-# Returns: A @VersionInfo object describing the current version of QEMU.
+# Returns: A @VersionInfo object describing the current version of
+#     QEMU.
 #
 # Since: 0.14
 #
@@ -111,7 +113,6 @@
 #          "package":""
 #       }
 #    }
-#
 ##
 { 'command': 'query-version', 'returns': 'VersionInfo',
   'allow-preconfig': true }
@@ -150,8 +151,8 @@
 #      ]
 #    }
 #
-# Note: This example has been shortened as the real response is too long.
-#
+# Note: This example has been shortened as the real response is too
+#     long.
 ##
 { 'command': 'query-commands', 'returns': ['CommandInfo'],
   'allow-preconfig': true }
@@ -159,10 +160,10 @@
 ##
 # @quit:
 #
-# This command will cause the QEMU process to exit gracefully.  While every
-# attempt is made to send the QMP response before terminating, this is not
-# guaranteed.  When using this interface, a premature EOF would not be
-# unexpected.
+# This command will cause the QEMU process to exit gracefully.  While
+# every attempt is made to send the QMP response before terminating,
+# this is not guaranteed.  When using this interface, a premature EOF
+# would not be unexpected.
 #
 # Since: 0.14
 #
@@ -195,7 +196,7 @@
 # @id: Name of the monitor
 #
 # @mode: Selects the monitor mode (default: readline in the system
-#        emulator, control in qemu-storage-daemon)
+#     emulator, control in qemu-storage-daemon)
 #
 # @pretty: Enables pretty printing (QMP only)
 #
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 653e6e3f3d..fd3d46ebd1 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -11,8 +11,7 @@
 #
 # The type of network endpoint that will be using the credentials.
 # Most types of credential require different setup / structures
-# depending on whether they will be used in a server versus a
-# client.
+# depending on whether they will be used in a server versus a client.
 #
 # @client: the network endpoint is acting as the client
 #
@@ -29,7 +28,9 @@
 #
 # The data format that the secret is provided in
 #
-# @raw: raw bytes. When encoded in JSON only valid UTF-8 sequences can be used
+# @raw: raw bytes.  When encoded in JSON only valid UTF-8 sequences
+#     can be used
+#
 # @base64: arbitrary base64 encoded binary data
 #
 # Since: 2.6
@@ -44,11 +45,17 @@
 # The supported algorithms for computing content digests
 #
 # @md5: MD5. Should not be used in any new code, legacy compat only
+#
 # @sha1: SHA-1. Should not be used in any new code, legacy compat only
+#
 # @sha224: SHA-224. (since 2.7)
+#
 # @sha256: SHA-256. Current recommended strong hash.
+#
 # @sha384: SHA-384. (since 2.7)
+#
 # @sha512: SHA-512. (since 2.7)
+#
 # @ripemd160: RIPEMD-160. (since 2.7)
 #
 # Since: 2.6
@@ -63,16 +70,28 @@
 # The supported algorithms for content encryption ciphers
 #
 # @aes-128: AES with 128 bit / 16 byte keys
+#
 # @aes-192: AES with 192 bit / 24 byte keys
+#
 # @aes-256: AES with 256 bit / 32 byte keys
-# @des: DES with 56 bit / 8 byte keys. Do not use except in VNC. (since 6.1)
+#
+# @des: DES with 56 bit / 8 byte keys.  Do not use except in VNC.
+#     (since 6.1)
+#
 # @3des: 3DES(EDE) with 192 bit / 24 byte keys (since 2.9)
+#
 # @cast5-128: Cast5 with 128 bit / 16 byte keys
+#
 # @serpent-128: Serpent with 128 bit / 16 byte keys
+#
 # @serpent-192: Serpent with 192 bit / 24 byte keys
+#
 # @serpent-256: Serpent with 256 bit / 32 byte keys
+#
 # @twofish-128: Twofish with 128 bit / 16 byte keys
+#
 # @twofish-192: Twofish with 192 bit / 24 byte keys
+#
 # @twofish-256: Twofish with 256 bit / 32 byte keys
 #
 # Since: 2.6
@@ -91,8 +110,11 @@
 # The supported modes for content encryption ciphers
 #
 # @ecb: Electronic Code Book
+#
 # @cbc: Cipher Block Chaining
+#
 # @xts: XEX with tweaked code book and ciphertext stealing
+#
 # @ctr: Counter (Since 2.8)
 #
 # Since: 2.6
@@ -104,15 +126,17 @@
 ##
 # @QCryptoIVGenAlgorithm:
 #
-# The supported algorithms for generating initialization
-# vectors for full disk encryption. The 'plain' generator
-# should not be used for disks with sector numbers larger
-# than 2^32, except where compatibility with pre-existing
-# Linux dm-crypt volumes is required.
+# The supported algorithms for generating initialization vectors for
+# full disk encryption.  The 'plain' generator should not be used for
+# disks with sector numbers larger than 2^32, except where
+# compatibility with pre-existing Linux dm-crypt volumes is required.
 #
 # @plain: 64-bit sector number truncated to 32-bits
+#
 # @plain64: 64-bit sector number
-# @essiv: 64-bit sector number encrypted with a hash of the encryption key
+#
+# @essiv: 64-bit sector number encrypted with a hash of the encryption
+#     key
 #
 # Since: 2.6
 ##
@@ -125,9 +149,10 @@
 #
 # The supported full disk encryption formats
 #
-# @qcow: QCow/QCow2 built-in AES-CBC encryption. Use only
-#        for liberating data from old images.
-# @luks: LUKS encryption format. Recommended for new images
+# @qcow: QCow/QCow2 built-in AES-CBC encryption.  Use only for
+#     liberating data from old images.
+#
+# @luks: LUKS encryption format.  Recommended for new images
 #
 # Since: 2.6
 ##
@@ -138,8 +163,7 @@
 ##
 # @QCryptoBlockOptionsBase:
 #
-# The common options that apply to all full disk
-# encryption formats
+# The common options that apply to all full disk encryption formats
 #
 # @format: the encryption format
 #
@@ -154,8 +178,8 @@
 # The options that apply to QCow/QCow2 AES-CBC encryption format
 #
 # @key-secret: the ID of a QCryptoSecret object providing the
-#              decryption key. Mandatory except when probing image for
-#              metadata only.
+#     decryption key.  Mandatory except when probing image for
+#     metadata only.
 #
 # Since: 2.6
 ##
@@ -168,8 +192,8 @@
 # The options that apply to LUKS encryption format
 #
 # @key-secret: the ID of a QCryptoSecret object providing the
-#              decryption key. Mandatory except when probing image for
-#              metadata only.
+#     decryption key.  Mandatory except when probing image for
+#     metadata only.
 #
 # Since: 2.6
 ##
@@ -181,19 +205,23 @@
 #
 # The options that apply to LUKS encryption format initialization
 #
-# @cipher-alg: the cipher algorithm for data encryption
-#              Currently defaults to 'aes-256'.
-# @cipher-mode: the cipher mode for data encryption
-#               Currently defaults to 'xts'
-# @ivgen-alg: the initialization vector generator
-#             Currently defaults to 'plain64'
-# @ivgen-hash-alg: the initialization vector generator hash
-#                  Currently defaults to 'sha256'
-# @hash-alg: the master key hash algorithm
-#            Currently defaults to 'sha256'
-# @iter-time: number of milliseconds to spend in
-#             PBKDF passphrase processing. Currently defaults
-#             to 2000. (since 2.8)
+# @cipher-alg: the cipher algorithm for data encryption Currently
+#     defaults to 'aes-256'.
+#
+# @cipher-mode: the cipher mode for data encryption Currently defaults
+#     to 'xts'
+#
+# @ivgen-alg: the initialization vector generator Currently defaults
+#     to 'plain64'
+#
+# @ivgen-hash-alg: the initialization vector generator hash Currently
+#     defaults to 'sha256'
+#
+# @hash-alg: the master key hash algorithm Currently defaults to
+#     'sha256'
+#
+# @iter-time: number of milliseconds to spend in PBKDF passphrase
+#     processing.  Currently defaults to 2000. (since 2.8)
 #
 # Since: 2.6
 ##
@@ -209,8 +237,8 @@
 ##
 # @QCryptoBlockOpenOptions:
 #
-# The options that are available for all encryption formats
-# when opening an existing volume
+# The options that are available for all encryption formats when
+# opening an existing volume
 #
 # Since: 2.6
 ##
@@ -223,8 +251,8 @@
 ##
 # @QCryptoBlockCreateOptions:
 #
-# The options that are available for all encryption formats
-# when initializing a new volume
+# The options that are available for all encryption formats when
+# initializing a new volume
 #
 # Since: 2.6
 ##
@@ -237,8 +265,8 @@
 ##
 # @QCryptoBlockInfoBase:
 #
-# The common information that applies to all full disk
-# encryption formats
+# The common information that applies to all full disk encryption
+# formats
 #
 # @format: the encryption format
 #
@@ -250,12 +278,14 @@
 ##
 # @QCryptoBlockInfoLUKSSlot:
 #
-# Information about the LUKS block encryption key
-# slot options
+# Information about the LUKS block encryption key slot options
 #
 # @active: whether the key slot is currently in use
+#
 # @key-offset: offset to the key material in bytes
+#
 # @iters: number of PBKDF2 iterations for key material
+#
 # @stripes: number of stripes for splitting key material
 #
 # Since: 2.7
@@ -272,13 +302,21 @@
 # Information about the LUKS block encryption options
 #
 # @cipher-alg: the cipher algorithm for data encryption
+#
 # @cipher-mode: the cipher mode for data encryption
+#
 # @ivgen-alg: the initialization vector generator
+#
 # @ivgen-hash-alg: the initialization vector generator hash
+#
 # @hash-alg: the master key hash algorithm
+#
 # @payload-offset: offset to the payload data in bytes
+#
 # @master-key-iters: number of PBKDF2 iterations for key material
+#
 # @uuid: unique identifier for the volume
+#
 # @slots: information about each key slot
 #
 # Since: 2.7
@@ -312,7 +350,9 @@
 # Defines state of keyslots that are affected by the update
 #
 # @active: The slots contain the given password and marked as active
-# @inactive: The slots are erased (contain garbage) and marked as inactive
+#
+# @inactive: The slots are erased (contain garbage) and marked as
+#     inactive
 #
 # Since: 5.1
 ##
@@ -322,35 +362,34 @@
 ##
 # @QCryptoBlockAmendOptionsLUKS:
 #
-# This struct defines the update parameters that activate/de-activate set
-# of keyslots
+# This struct defines the update parameters that activate/de-activate
+# set of keyslots
 #
 # @state: the desired state of the keyslots
 #
-# @new-secret: The ID of a QCryptoSecret object providing the password to be
-#              written into added active keyslots
+# @new-secret: The ID of a QCryptoSecret object providing the password
+#     to be written into added active keyslots
 #
-# @old-secret: Optional (for deactivation only)
-#              If given will deactivate all keyslots that
-#              match password located in QCryptoSecret with this ID
+# @old-secret: Optional (for deactivation only) If given will
+#     deactivate all keyslots that match password located in
+#     QCryptoSecret with this ID
 #
-# @iter-time: Optional (for activation only)
-#             Number of milliseconds to spend in
-#             PBKDF passphrase processing for the newly activated keyslot.
-#             Currently defaults to 2000.
+# @iter-time: Optional (for activation only) Number of milliseconds to
+#     spend in PBKDF passphrase processing for the newly activated
+#     keyslot.  Currently defaults to 2000.
 #
-# @keyslot: Optional. ID of the keyslot to activate/deactivate.
-#           For keyslot activation, keyslot should not be active already
-#           (this is unsafe to update an active keyslot),
-#           but possible if 'force' parameter is given.
-#           If keyslot is not given, first free keyslot will be written.
+# @keyslot: Optional.  ID of the keyslot to activate/deactivate.  For
+#     keyslot activation, keyslot should not be active already (this
+#     is unsafe to update an active keyslot), but possible if 'force'
+#     parameter is given.  If keyslot is not given, first free keyslot
+#     will be written.
 #
-#           For keyslot deactivation, this parameter specifies the exact
-#           keyslot to deactivate
+#     For keyslot deactivation, this parameter specifies the exact
+#     keyslot to deactivate
 #
-# @secret: Optional. The ID of a QCryptoSecret object providing the
-#          password to use to retrieve current master key.
-#          Defaults to the same secret that was used to open the image
+# @secret: Optional.  The ID of a QCryptoSecret object providing the
+#     password to use to retrieve current master key.  Defaults to the
+#     same secret that was used to open the image
 #
 # Since: 5.1
 ##
@@ -365,8 +404,8 @@
 ##
 # @QCryptoBlockAmendOptions:
 #
-# The options that are available for all encryption formats
-# when amending encryption settings
+# The options that are available for all encryption formats when
+# amending encryption settings
 #
 # Since: 5.1
 ##
@@ -381,22 +420,27 @@
 #
 # Properties for objects of classes derived from secret-common.
 #
-# @loaded: if true, the secret is loaded immediately when applying this option
-#          and will probably fail when processing the next option. Don't use;
-#          only provided for compatibility. (default: false)
+# @loaded: if true, the secret is loaded immediately when applying
+#     this option and will probably fail when processing the next
+#     option.  Don't use; only provided for compatibility.
+#     (default: false)
 #
-# @format: the data format that the secret is provided in (default: raw)
+# @format: the data format that the secret is provided in
+#     (default: raw)
 #
-# @keyid: the name of another secret that should be used to decrypt the
-#         provided data. If not present, the data is assumed to be unencrypted.
+# @keyid: the name of another secret that should be used to decrypt
+#     the provided data.  If not present, the data is assumed to be
+#     unencrypted.
 #
-# @iv: the random initialization vector used for encryption of this particular
-#      secret. Should be a base64 encrypted string of the 16-byte IV. Mandatory
-#      if @keyid is given. Ignored if @keyid is absent.
+# @iv: the random initialization vector used for encryption of this
+#     particular secret.  Should be a base64 encrypted string of the
+#     16-byte IV. Mandatory if @keyid is given.  Ignored if @keyid is
+#     absent.
 #
 # Features:
-# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
-#              and false is already the default.
+#
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't
+#     make sense, and false is already the default.
 #
 # Since: 2.6
 ##
@@ -443,16 +487,17 @@
 # Properties for objects of classes derived from tls-creds.
 #
 # @verify-peer: if true the peer credentials will be verified once the
-#               handshake is completed.  This is a no-op for anonymous
-#               credentials. (default: true)
+#     handshake is completed.  This is a no-op for anonymous
+#     credentials.  (default: true)
 #
 # @dir: the path of the directory that contains the credential files
 #
-# @endpoint: whether the QEMU network backend that uses the credentials will be
-#            acting as a client or as a server (default: client)
+# @endpoint: whether the QEMU network backend that uses the
+#     credentials will be acting as a client or as a server
+#     (default: client)
 #
 # @priority: a gnutls priority string as described at
-#            https://gnutls.org/manual/html_node/Priority-Strings.html
+#     https://gnutls.org/manual/html_node/Priority-Strings.html
 #
 # Since: 2.5
 ##
@@ -467,13 +512,15 @@
 #
 # Properties for tls-creds-anon objects.
 #
-# @loaded: if true, the credentials are loaded immediately when applying this
-#          option and will ignore options that are processed later. Don't use;
-#          only provided for compatibility. (default: false)
+# @loaded: if true, the credentials are loaded immediately when
+#     applying this option and will ignore options that are processed
+#     later.  Don't use; only provided for compatibility.
+#     (default: false)
 #
 # Features:
-# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
-#              and false is already the default.
+#
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't
+#     make sense, and false is already the default.
 #
 # Since: 2.5
 ##
@@ -486,17 +533,19 @@
 #
 # Properties for tls-creds-psk objects.
 #
-# @loaded: if true, the credentials are loaded immediately when applying this
-#          option and will ignore options that are processed later. Don't use;
-#          only provided for compatibility. (default: false)
+# @loaded: if true, the credentials are loaded immediately when
+#     applying this option and will ignore options that are processed
+#     later.  Don't use; only provided for compatibility.
+#     (default: false)
 #
-# @username: the username which will be sent to the server.  For clients only.
-#            If absent, "qemu" is sent and the property will read back as an
-#            empty string.
+# @username: the username which will be sent to the server.  For
+#     clients only.  If absent, "qemu" is sent and the property will
+#     read back as an empty string.
 #
 # Features:
-# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
-#              and false is already the default.
+#
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't
+#     make sense, and false is already the default.
 #
 # Since: 3.0
 ##
@@ -510,22 +559,24 @@
 #
 # Properties for tls-creds-x509 objects.
 #
-# @loaded: if true, the credentials are loaded immediately when applying this
-#          option and will ignore options that are processed later. Don't use;
-#          only provided for compatibility. (default: false)
+# @loaded: if true, the credentials are loaded immediately when
+#     applying this option and will ignore options that are processed
+#     later.  Don't use; only provided for compatibility.
+#     (default: false)
 #
 # @sanity-check: if true, perform some sanity checks before using the
-#                credentials (default: true)
+#     credentials (default: true)
 #
-# @passwordid: For the server-key.pem and client-key.pem files which contain
-#              sensitive private keys, it is possible to use an encrypted
-#              version by providing the @passwordid parameter.  This provides
-#              the ID of a previously created secret object containing the
-#              password for decryption.
+# @passwordid: For the server-key.pem and client-key.pem files which
+#     contain sensitive private keys, it is possible to use an
+#     encrypted version by providing the @passwordid parameter.  This
+#     provides the ID of a previously created secret object containing
+#     the password for decryption.
 #
 # Features:
-# @deprecated: Member @loaded is deprecated.  Setting true doesn't make sense,
-#              and false is already the default.
+#
+# @deprecated: Member @loaded is deprecated.  Setting true doesn't
+#     make sense, and false is already the default.
 #
 # Since: 2.5
 ##
@@ -564,6 +615,7 @@
 # The padding algorithm for RSA.
 #
 # @raw: no padding used
+#
 # @pkcs1: pkcs1#v1.5
 #
 # Since: 7.1
@@ -578,6 +630,7 @@
 # Specific parameters for RSA algorithm.
 #
 # @hash-alg: QCryptoHashAlgorithm
+#
 # @padding-alg: QCryptoRSAPaddingAlgorithm
 #
 # Since: 7.1
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index cf960ea81f..77f48a9c21 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -14,6 +14,7 @@
 # The supported algorithm types of a crypto device.
 #
 # @sym: symmetric encryption
+#
 # @asym: asymmetric Encryption
 #
 # Since: 8.0
@@ -39,7 +40,9 @@
 # The crypto device backend type
 #
 # @builtin: the QEMU builtin support
+#
 # @vhost-user: vhost-user
+#
 # @lkcf: Linux kernel cryptographic framework
 #
 # Since: 8.0
diff --git a/qapi/cxl.json b/qapi/cxl.json
index 4be7d46041..b21c9b4c1c 100644
--- a/qapi/cxl.json
+++ b/qapi/cxl.json
@@ -8,26 +8,45 @@
 ##
 # @CxlUncorErrorType:
 #
-# Type of uncorrectable CXL error to inject. These errors are reported via
-# an AER uncorrectable internal error with additional information logged at
-# the CXL device.
+# Type of uncorrectable CXL error to inject.  These errors are
+# reported via an AER uncorrectable internal error with additional
+# information logged at the CXL device.
+#
+# @cache-data-parity: Data error such as data parity or data ECC error
+#     CXL.cache
+#
+# @cache-address-parity: Address parity or other errors associated
+#     with the address field on CXL.cache
+#
+# @cache-be-parity: Byte enable parity or other byte enable errors on
+#     CXL.cache
 #
-# @cache-data-parity: Data error such as data parity or data ECC error CXL.cache
-# @cache-address-parity: Address parity or other errors associated with the
-#                        address field on CXL.cache
-# @cache-be-parity: Byte enable parity or other byte enable errors on CXL.cache
 # @cache-data-ecc: ECC error on CXL.cache
-# @mem-data-parity: Data error such as data parity or data ECC error on CXL.mem
-# @mem-address-parity: Address parity or other errors associated with the
-#                      address field on CXL.mem
-# @mem-be-parity: Byte enable parity or other byte enable errors on CXL.mem.
+#
+# @mem-data-parity: Data error such as data parity or data ECC error
+#     on CXL.mem
+#
+# @mem-address-parity: Address parity or other errors associated with
+#     the address field on CXL.mem
+#
+# @mem-be-parity: Byte enable parity or other byte enable errors on
+#     CXL.mem.
+#
 # @mem-data-ecc: Data ECC error on CXL.mem.
+#
 # @reinit-threshold: REINIT threshold hit.
+#
 # @rsvd-encoding: Received unrecognized encoding.
+#
 # @poison-received: Received poison from the peer.
-# @receiver-overflow: Buffer overflows (first 3 bits of header log indicate which)
+#
+# @receiver-overflow: Buffer overflows (first 3 bits of header log
+#     indicate which)
+#
 # @internal: Component specific error
+#
 # @cxl-ide-tx: Integrity and data encryption tx error.
+#
 # @cxl-ide-rx: Integrity and data encryption rx error.
 #
 # Since: 8.0
@@ -58,6 +77,7 @@
 # Record of a single error including header log.
 #
 # @type: Type of error
+#
 # @header: 16 DWORD of header.
 #
 # Since: 8.0
@@ -72,10 +92,11 @@
 ##
 # @cxl-inject-uncorrectable-errors:
 #
-# Command to allow injection of multiple errors in one go. This allows testing
-# of multiple header log handling in the OS.
+# Command to allow injection of multiple errors in one go.  This
+# allows testing of multiple header log handling in the OS.
 #
 # @path: CXL Type 3 device canonical QOM path
+#
 # @errors: Errors to inject
 #
 # Since: 8.0
@@ -90,10 +111,16 @@
 # Type of CXL correctable error to inject
 #
 # @cache-data-ecc: Data ECC error on CXL.cache
+#
 # @mem-data-ecc: Data ECC error on CXL.mem
-# @crc-threshold: Component specific and applicable to 68 byte Flit mode only.
+#
+# @crc-threshold: Component specific and applicable to 68 byte Flit
+#     mode only.
+#
 # @cache-poison-received: Received poison from a peer on CXL.cache.
+#
 # @mem-poison-received: Received poison from a peer on CXL.mem
+#
 # @physical: Received error indication from the physical layer.
 #
 # Since: 8.0
@@ -111,18 +138,17 @@
 ##
 # @cxl-inject-correctable-error:
 #
-# Command to inject a single correctable error.  Multiple error injection
-# of this error type is not interesting as there is no associated header log.
-# These errors are reported via AER as a correctable internal error, with
-# additional detail available from the CXL device.
+# Command to inject a single correctable error.  Multiple error
+# injection of this error type is not interesting as there is no
+# associated header log.  These errors are reported via AER as a
+# correctable internal error, with additional detail available from
+# the CXL device.
 #
 # @path: CXL Type 3 device canonical QOM path
+#
 # @type: Type of error.
 #
 # Since: 8.0
 ##
-{ 'command': 'cxl-inject-correctable-error',
-  'data': { 'path': 'str',
-            'type': 'CxlCorErrorType'
-  }
-}
+{'command': 'cxl-inject-correctable-error',
+ 'data': {'path': 'str', 'type': 'CxlCorErrorType'}}
diff --git a/qapi/dump.json b/qapi/dump.json
index 24af1df7db..4ae1f722a9 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -21,8 +21,8 @@
 #
 # @kdump-snappy: kdump-compressed format with snappy-compressed
 #
-# @win-dmp: Windows full crashdump format,
-#           can be used instead of ELF converting (since 2.13)
+# @win-dmp: Windows full crashdump format, can be used instead of ELF
+#     converting (since 2.13)
 #
 # Since: 2.0
 ##
@@ -32,47 +32,47 @@
 ##
 # @dump-guest-memory:
 #
-# Dump guest's memory to vmcore. It is a synchronous operation that can take
-# very long depending on the amount of guest memory.
+# Dump guest's memory to vmcore.  It is a synchronous operation that
+# can take very long depending on the amount of guest memory.
 #
-# @paging: if true, do paging to get guest's memory mapping. This allows
-#          using gdb to process the core file.
+# @paging: if true, do paging to get guest's memory mapping.  This
+#     allows using gdb to process the core file.
 #
-#          IMPORTANT: this option can make QEMU allocate several gigabytes
-#          of RAM. This can happen for a large guest, or a
-#          malicious guest pretending to be large.
+#     IMPORTANT: this option can make QEMU allocate several gigabytes
+#     of RAM. This can happen for a large guest, or a malicious guest
+#     pretending to be large.
 #
-#          Also, paging=true has the following limitations:
+#     Also, paging=true has the following limitations:
 #
-#          1. The guest may be in a catastrophic state or can have corrupted
-#             memory, which cannot be trusted
-#          2. The guest can be in real-mode even if paging is enabled. For
-#             example, the guest uses ACPI to sleep, and ACPI sleep state
-#             goes in real-mode
-#          3. Currently only supported on i386 and x86_64.
+#     1. The guest may be in a catastrophic state or can have
+#        corrupted memory, which cannot be trusted
+#     2. The guest can be in real-mode even if paging is enabled.  For
+#        example, the guest uses ACPI to sleep, and ACPI sleep state
+#        goes in real-mode
+#     3. Currently only supported on i386 and x86_64.
 #
-# @protocol: the filename or file descriptor of the vmcore. The supported
-#            protocols are:
+# @protocol: the filename or file descriptor of the vmcore.  The
+#     supported protocols are:
 #
-#            1. file: the protocol starts with "file:", and the following
-#               string is the file's path.
-#            2. fd: the protocol starts with "fd:", and the following string
-#               is the fd's name.
+#     1. file: the protocol starts with "file:", and the following
+#        string is the file's path.
+#     2. fd: the protocol starts with "fd:", and the following string
+#        is the fd's name.
 #
-# @detach: if true, QMP will return immediately rather than
-#          waiting for the dump to finish. The user can track progress
-#          using "query-dump". (since 2.6).
+# @detach: if true, QMP will return immediately rather than waiting
+#     for the dump to finish.  The user can track progress using
+#     "query-dump". (since 2.6).
 #
 # @begin: if specified, the starting physical address.
 #
-# @length: if specified, the memory size, in bytes. If you don't
-#          want to dump all guest's memory, please specify the start @begin
-#          and @length
+# @length: if specified, the memory size, in bytes.  If you don't want
+#     to dump all guest's memory, please specify the start @begin and
+#     @length
 #
-# @format: if specified, the format of guest memory dump. But non-elf
-#          format is conflict with paging and filter, ie. @paging, @begin and
-#          @length is not allowed to be specified with non-elf @format at the
-#          same time (since 2.0)
+# @format: if specified, the format of guest memory dump.  But non-elf
+#     format is conflict with paging and filter, ie.  @paging, @begin
+#     and @length is not allowed to be specified with non-elf @format
+#     at the same time (since 2.0)
 #
 # Note: All boolean arguments default to false
 #
@@ -85,7 +85,6 @@
 # -> { "execute": "dump-guest-memory",
 #      "arguments": { "paging": false, "protocol": "fd:dump" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'dump-guest-memory',
   'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
@@ -142,7 +141,6 @@
 # -> { "execute": "query-dump" }
 # <- { "return": { "status": "active", "completed": 1024000,
 #                  "total": 2048000 } }
-#
 ##
 { 'command': 'query-dump', 'returns': 'DumpQueryResult' }
 
@@ -153,9 +151,9 @@
 #
 # @result: final dump status
 #
-# @error: human-readable error string that provides
-#         hint on why dump failed. Only presents on failure. The
-#         user should not try to interpret the error string.
+# @error: human-readable error string that provides hint on why dump
+#     failed.  Only presents on failure.  The user should not try to
+#     interpret the error string.
 #
 # Since: 2.6
 #
@@ -165,7 +163,6 @@
 #      "data": { "result": { "total": 1090650112, "status": "completed",
 #                            "completed": 1090650112 } },
 #      "timestamp": { "seconds": 1648244171, "microseconds": 950316 } }
-#
 ##
 { 'event': 'DUMP_COMPLETED' ,
   'data': { 'result': 'DumpQueryResult', '*error': 'str' } }
@@ -186,8 +183,8 @@
 #
 # Returns the available formats for dump-guest-memory
 #
-# Returns: A @DumpGuestMemoryCapability object listing available formats for
-#          dump-guest-memory
+# Returns: A @DumpGuestMemoryCapability object listing available
+#     formats for dump-guest-memory
 #
 # Since: 2.0
 #
@@ -196,7 +193,6 @@
 # -> { "execute": "query-dump-guest-memory-capability" }
 # <- { "return": { "formats":
 #                  ["elf", "kdump-zlib", "kdump-lzo", "kdump-snappy"] } }
-#
 ##
 { 'command': 'query-dump-guest-memory-capability',
   'returns': 'DumpGuestMemoryCapability' }
diff --git a/qapi/error.json b/qapi/error.json
index 94a6502de9..135c1e8231 100644
--- a/qapi/error.json
+++ b/qapi/error.json
@@ -10,8 +10,8 @@
 #
 # QEMU error classes
 #
-# @GenericError: this is used for errors that don't require a specific error
-#                class. This should be the default case for most errors
+# @GenericError: this is used for errors that don't require a specific
+#     error class.  This should be the default case for most errors
 #
 # @CommandNotFound: the requested command has not been found
 #
@@ -20,7 +20,7 @@
 # @DeviceNotFound: the requested device has not been found
 #
 # @KVMMissingCap: the requested operation can't be fulfilled because a
-#                 required KVM capability is missing
+#     required KVM capability is missing
 #
 # Since: 1.2
 ##
diff --git a/qapi/introspect.json b/qapi/introspect.json
index 183148b2e9..9173e60fdd 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -35,15 +35,15 @@
 # alternate that includes the original type alongside something else.
 #
 # Returns: array of @SchemaInfo, where each element describes an
-#          entity in the ABI: command, event, type, ...
+#     entity in the ABI: command, event, type, ...
 #
-#          The order of the various SchemaInfo is unspecified; however, all
-#          names are guaranteed to be unique (no name will be duplicated with
-#          different meta-types).
+#     The order of the various SchemaInfo is unspecified; however, all
+#     names are guaranteed to be unique (no name will be duplicated
+#     with different meta-types).
 #
 # Note: the QAPI schema is also used to help define *internal*
-#       interfaces, by defining QAPI types.  These are not part of the QMP
-#       wire ABI, and therefore not returned by this command.
+#     interfaces, by defining QAPI types.  These are not part of the
+#     QMP wire ABI, and therefore not returned by this command.
 #
 # Since: 2.5
 ##
@@ -80,20 +80,18 @@
 ##
 # @SchemaInfo:
 #
-# @name: the entity's name, inherited from @base.
-#        The SchemaInfo is always referenced by this name.
-#        Commands and events have the name defined in the QAPI schema.
-#        Unlike command and event names, type names are not part of
-#        the wire ABI.  Consequently, type names are meaningless
-#        strings here, although they are still guaranteed unique
-#        regardless of @meta-type.
+# @name: the entity's name, inherited from @base.  The SchemaInfo is
+#     always referenced by this name.  Commands and events have the
+#     name defined in the QAPI schema.  Unlike command and event
+#     names, type names are not part of the wire ABI.  Consequently,
+#     type names are meaningless strings here, although they are still
+#     guaranteed unique regardless of @meta-type.
 #
 # @meta-type: the entity's meta type, inherited from @base.
 #
 # @features: names of features associated with the entity, in no
-#            particular order.
-#            (since 4.1 for object types, 4.2 for commands, 5.0 for
-#            the rest)
+#     particular order.  (since 4.1 for object types, 4.2 for
+#     commands, 5.0 for the rest)
 #
 # Additional members depend on the value of @meta-type.
 #
@@ -142,13 +140,15 @@
 #
 # Additional SchemaInfo members for meta-type 'enum'.
 #
-# @members: the enum type's members, in no particular order
-#           (since 6.2).
+# @members: the enum type's members, in no particular order (since
+#     6.2).
 #
-# @values: the enumeration type's member names, in no particular order.
-#          Redundant with @members.  Just for backward compatibility.
+# @values: the enumeration type's member names, in no particular
+#     order.  Redundant with @members.  Just for backward
+#     compatibility.
 #
 # Features:
+#
 # @deprecated: Member @values is deprecated.  Use @members instead.
 #
 # Values of this type are JSON string on the wire.
@@ -168,7 +168,7 @@
 # @name: the member's name, as defined in the QAPI schema.
 #
 # @features: names of features associated with the member, in no
-#            particular order.
+#     particular order.
 #
 # Since: 6.2
 ##
@@ -194,16 +194,16 @@
 #
 # Additional SchemaInfo members for meta-type 'object'.
 #
-# @members: the object type's (non-variant) members, in no particular order.
+# @members: the object type's (non-variant) members, in no particular
+#     order.
 #
-# @tag: the name of the member serving as type tag.
-#       An element of @members with this name must exist.
+# @tag: the name of the member serving as type tag.  An element of
+#     @members with this name must exist.
 #
-# @variants: variant members, i.e. additional members that
-#            depend on the type tag's value.  Present exactly when
-#            @tag is present.  The variants are in no particular order,
-#            and may even differ from the order of the values of the
-#            enum type of the @tag.
+# @variants: variant members, i.e. additional members that depend on
+#     the type tag's value.  Present exactly when @tag is present.
+#     The variants are in no particular order, and may even differ
+#     from the order of the values of the enum type of the @tag.
 #
 # Values of this type are JSON object on the wire.
 #
@@ -223,16 +223,14 @@
 #
 # @type: the name of the member's type.
 #
-# @default: default when used as command parameter.
-#           If absent, the parameter is mandatory.
-#           If present, the value must be null.  The parameter is
-#           optional, and behavior when it's missing is not specified
-#           here.
-#           Future extension: if present and non-null, the parameter
-#           is optional, and defaults to this value.
+# @default: default when used as command parameter.  If absent, the
+#     parameter is mandatory.  If present, the value must be null.
+#     The parameter is optional, and behavior when it's missing is not
+#     specified here.  Future extension: if present and non-null, the
+#     parameter is optional, and defaults to this value.
 #
 # @features: names of features associated with the member, in no
-#            particular order.  (since 5.0)
+#     particular order.  (since 5.0)
 #
 # Since: 2.5
 ##
@@ -249,7 +247,7 @@
 # @case: a value of the type tag.
 #
 # @type: the name of the object type that provides the variant members
-#        when the type tag has value @case.
+#     when the type tag has value @case.
 #
 # Since: 2.5
 ##
@@ -261,9 +259,9 @@
 #
 # Additional SchemaInfo members for meta-type 'alternate'.
 #
-# @members: the alternate type's members, in no particular order.
-#           The members' wire encoding is distinct, see
-#           docs/devel/qapi-code-gen.txt section Alternate types.
+# @members: the alternate type's members, in no particular order.  The
+#     members' wire encoding is distinct, see
+#     docs/devel/qapi-code-gen.txt section Alternate types.
 #
 # On the wire, this can be any of the members.
 #
@@ -290,14 +288,15 @@
 # Additional SchemaInfo members for meta-type 'command'.
 #
 # @arg-type: the name of the object type that provides the command's
-#            parameters.
+#     parameters.
 #
 # @ret-type: the name of the command's result type.
 #
 # @allow-oob: whether the command allows out-of-band execution,
-#             defaults to false (Since: 2.12)
+#     defaults to false (Since: 2.12)
 #
-# TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
+# TODO: @success-response (currently irrelevant, because it's QGA, not
+#     QMP)
 #
 # Since: 2.5
 ##
@@ -311,7 +310,7 @@
 # Additional SchemaInfo members for meta-type 'event'.
 #
 # @arg-type: the name of the object type that provides the event's
-#            parameters.
+#     parameters.
 #
 # Since: 2.5
 ##
diff --git a/qapi/job.json b/qapi/job.json
index 9e29a796c5..7f0ba090de 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -20,13 +20,17 @@
 #
 # @create: image creation job type, see "blockdev-create" (since 3.0)
 #
-# @amend: image options amend job type, see "x-blockdev-amend" (since 5.1)
+# @amend: image options amend job type, see "x-blockdev-amend" (since
+#     5.1)
 #
-# @snapshot-load: snapshot load job type, see "snapshot-load" (since 6.0)
+# @snapshot-load: snapshot load job type, see "snapshot-load" (since
+#     6.0)
 #
-# @snapshot-save: snapshot save job type, see "snapshot-save" (since 6.0)
+# @snapshot-save: snapshot save job type, see "snapshot-save" (since
+#     6.0)
 #
-# @snapshot-delete: snapshot delete job type, see "snapshot-delete" (since 6.0)
+# @snapshot-delete: snapshot delete job type, see "snapshot-delete"
+#     (since 6.0)
 #
 # Since: 1.7
 ##
@@ -39,41 +43,42 @@
 #
 # Indicates the present state of a given job in its lifetime.
 #
-# @undefined: Erroneous, default state. Should not ever be visible.
+# @undefined: Erroneous, default state.  Should not ever be visible.
 #
 # @created: The job has been created, but not yet started.
 #
 # @running: The job is currently running.
 #
-# @paused: The job is running, but paused. The pause may be requested by
-#          either the QMP user or by internal processes.
+# @paused: The job is running, but paused.  The pause may be requested
+#     by either the QMP user or by internal processes.
 #
-# @ready: The job is running, but is ready for the user to signal completion.
-#         This is used for long-running jobs like mirror that are designed to
-#         run indefinitely.
+# @ready: The job is running, but is ready for the user to signal
+#     completion.  This is used for long-running jobs like mirror that
+#     are designed to run indefinitely.
 #
-# @standby: The job is ready, but paused. This is nearly identical to @paused.
-#           The job may return to @ready or otherwise be canceled.
+# @standby: The job is ready, but paused.  This is nearly identical to
+#     @paused.  The job may return to @ready or otherwise be canceled.
 #
-# @waiting: The job is waiting for other jobs in the transaction to converge
-#           to the waiting state. This status will likely not be visible for
-#           the last job in a transaction.
+# @waiting: The job is waiting for other jobs in the transaction to
+#     converge to the waiting state.  This status will likely not be
+#     visible for the last job in a transaction.
 #
-# @pending: The job has finished its work, but has finalization steps that it
-#           needs to make prior to completing. These changes will require
-#           manual intervention via @job-finalize if auto-finalize was set to
-#           false. These pending changes may still fail.
+# @pending: The job has finished its work, but has finalization steps
+#     that it needs to make prior to completing.  These changes will
+#     require manual intervention via @job-finalize if auto-finalize
+#     was set to false.  These pending changes may still fail.
 #
-# @aborting: The job is in the process of being aborted, and will finish with
-#            an error. The job will afterwards report that it is @concluded.
-#            This status may not be visible to the management process.
+# @aborting: The job is in the process of being aborted, and will
+#     finish with an error.  The job will afterwards report that it is
+#     @concluded.  This status may not be visible to the management
+#     process.
 #
-# @concluded: The job has finished all work. If auto-dismiss was set to false,
-#             the job will remain in the query list until it is dismissed via
-#             @job-dismiss.
+# @concluded: The job has finished all work.  If auto-dismiss was set
+#     to false, the job will remain in the query list until it is
+#     dismissed via @job-dismiss.
 #
-# @null: The job is in the process of being dismantled. This state should not
-#        ever be visible externally.
+# @null: The job is in the process of being dismantled.  This state
+#     should not ever be visible externally.
 #
 # Since: 2.12
 ##
@@ -112,6 +117,7 @@
 # Emitted when a job transitions to a different status.
 #
 # @id: The job identifier
+#
 # @status: The new job status
 #
 # Since: 3.0
@@ -125,12 +131,12 @@
 #
 # Pause an active job.
 #
-# This command returns immediately after marking the active job for pausing.
-# Pausing an already paused job is an error.
+# This command returns immediately after marking the active job for
+# pausing.  Pausing an already paused job is an error.
 #
-# The job will pause as soon as possible, which means transitioning into the
-# PAUSED state if it was RUNNING, or into STANDBY if it was READY. The
-# corresponding JOB_STATUS_CHANGE event will be emitted.
+# The job will pause as soon as possible, which means transitioning
+# into the PAUSED state if it was RUNNING, or into STANDBY if it was
+# READY. The corresponding JOB_STATUS_CHANGE event will be emitted.
 #
 # Cancelling a paused job automatically resumes it.
 #
@@ -145,8 +151,8 @@
 #
 # Resume a paused job.
 #
-# This command returns immediately after resuming a paused job. Resuming an
-# already running job is an error.
+# This command returns immediately after resuming a paused job.
+# Resuming an already running job is an error.
 #
 # @id: The job identifier.
 #
@@ -161,11 +167,11 @@
 # This command returns immediately after marking the active job for
 # cancellation.
 #
-# The job will cancel as soon as possible and then emit a JOB_STATUS_CHANGE
-# event. Usually, the status will change to ABORTING, but it is possible that
-# a job successfully completes (e.g. because it was almost done and there was
-# no opportunity to cancel earlier than completing the job) and transitions to
-# PENDING instead.
+# The job will cancel as soon as possible and then emit a
+# JOB_STATUS_CHANGE event.  Usually, the status will change to
+# ABORTING, but it is possible that a job successfully completes (e.g.
+# because it was almost done and there was no opportunity to cancel
+# earlier than completing the job) and transitions to PENDING instead.
 #
 # @id: The job identifier.
 #
@@ -187,12 +193,14 @@
 ##
 # @job-dismiss:
 #
-# Deletes a job that is in the CONCLUDED state. This command only needs to be
-# run explicitly for jobs that don't have automatic dismiss enabled.
+# Deletes a job that is in the CONCLUDED state.  This command only
+# needs to be run explicitly for jobs that don't have automatic
+# dismiss enabled.
 #
-# This command will refuse to operate on any job that has not yet reached its
-# terminal state, JOB_STATUS_CONCLUDED. For jobs that make use of JOB_READY
-# event, job-cancel or job-complete will still need to be used as appropriate.
+# This command will refuse to operate on any job that has not yet
+# reached its terminal state, JOB_STATUS_CONCLUDED. For jobs that make
+# use of JOB_READY event, job-cancel or job-complete will still need
+# to be used as appropriate.
 #
 # @id: The job identifier.
 #
@@ -203,16 +211,17 @@
 ##
 # @job-finalize:
 #
-# Instructs all jobs in a transaction (or a single job if it is not part of any
-# transaction) to finalize any graph changes and do any necessary cleanup. This
-# command requires that all involved jobs are in the PENDING state.
+# Instructs all jobs in a transaction (or a single job if it is not
+# part of any transaction) to finalize any graph changes and do any
+# necessary cleanup.  This command requires that all involved jobs are
+# in the PENDING state.
 #
-# For jobs in a transaction, instructing one job to finalize will force
-# ALL jobs in the transaction to finalize, so it is only necessary to instruct
-# a single member job to finalize.
+# For jobs in a transaction, instructing one job to finalize will
+# force ALL jobs in the transaction to finalize, so it is only
+# necessary to instruct a single member job to finalize.
 #
-# @id: The identifier of any job in the transaction, or of a job that is not
-#      part of any transaction.
+# @id: The identifier of any job in the transaction, or of a job that
+#     is not part of any transaction.
 #
 # Since: 3.0
 ##
@@ -229,22 +238,22 @@
 #
 # @status: Current job state/status
 #
-# @current-progress: Progress made until now. The unit is arbitrary and the
-#                    value can only meaningfully be used for the ratio of
-#                    @current-progress to @total-progress. The value is
-#                    monotonically increasing.
+# @current-progress: Progress made until now.  The unit is arbitrary
+#     and the value can only meaningfully be used for the ratio of
+#     @current-progress to @total-progress.  The value is
+#     monotonically increasing.
 #
-# @total-progress: Estimated @current-progress value at the completion of
-#                  the job. This value can arbitrarily change while the
-#                  job is running, in both directions.
+# @total-progress: Estimated @current-progress value at the completion
+#     of the job.  This value can arbitrarily change while the job is
+#     running, in both directions.
 #
-# @error: If this field is present, the job failed; if it is
-#         still missing in the CONCLUDED state, this indicates
-#         successful completion.
+# @error: If this field is present, the job failed; if it is still
+#     missing in the CONCLUDED state, this indicates successful
+#     completion.
 #
-#         The value is a human-readable error message to describe
-#         the reason for the job failure. It should not be parsed
-#         by applications.
+#     The value is a human-readable error message to describe the
+#     reason for the job failure.  It should not be parsed by
+#     applications.
 #
 # Since: 3.0
 ##
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index b94fbdb65e..6f1d71c16f 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -9,12 +9,13 @@
 #
 # Virtual CPU model.
 #
-# A CPU model consists of the name of a CPU definition, to which
-# delta changes are applied (e.g. features added/removed). Most magic values
+# A CPU model consists of the name of a CPU definition, to which delta
+# changes are applied (e.g. features added/removed). Most magic values
 # that an architecture might require should be hidden behind the name.
 # However, if required, architectures can expose relevant properties.
 #
 # @name: the name of the CPU definition the model is based on
+#
 # @props: a dictionary of QOM properties to be applied
 #
 # Since: 2.8
@@ -28,26 +29,28 @@
 #
 # An enumeration of CPU model expansion types.
 #
-# @static: Expand to a static CPU model, a combination of a static base
-#          model name and property delta changes. As the static base model will
-#          never change, the expanded CPU model will be the same, independent of
-#          QEMU version, machine type, machine options, and accelerator options.
-#          Therefore, the resulting model can be used by tooling without having
-#          to specify a compatibility machine - e.g. when displaying the "host"
-#          model. The @static CPU models are migration-safe.
-
-# @full: Expand all properties. The produced model is not guaranteed to be
-#        migration-safe, but allows tooling to get an insight and work with
-#        model details.
+# @static: Expand to a static CPU model, a combination of a static
+#     base model name and property delta changes.  As the static base
+#     model will never change, the expanded CPU model will be the
+#     same, independent of QEMU version, machine type, machine
+#     options, and accelerator options.  Therefore, the resulting
+#     model can be used by tooling without having to specify a
+#     compatibility machine - e.g. when displaying the "host" model.
+#     The @static CPU models are migration-safe.
 #
-# Note: When a non-migration-safe CPU model is expanded in static mode, some
-#       features enabled by the CPU model may be omitted, because they can't be
-#       implemented by a static CPU model definition (e.g. cache info passthrough and
-#       PMU passthrough in x86). If you need an accurate representation of the
-#       features enabled by a non-migration-safe CPU model, use @full. If you need a
-#       static representation that will keep ABI compatibility even when changing QEMU
-#       version or machine-type, use @static (but keep in mind that some features may
-#       be omitted).
+# @full: Expand all properties.  The produced model is not guaranteed
+#     to be migration-safe, but allows tooling to get an insight and
+#     work with model details.
+#
+# Note: When a non-migration-safe CPU model is expanded in static
+#     mode, some features enabled by the CPU model may be omitted,
+#     because they can't be implemented by a static CPU model
+#     definition (e.g. cache info passthrough and PMU passthrough in
+#     x86). If you need an accurate representation of the features
+#     enabled by a non-migration-safe CPU model, use @full.  If you
+#     need a static representation that will keep ABI compatibility
+#     even when changing QEMU version or machine-type, use @static
+#     (but keep in mind that some features may be omitted).
 #
 # Since: 2.8
 ##
@@ -57,20 +60,22 @@
 ##
 # @CpuModelCompareResult:
 #
-# An enumeration of CPU model comparison results. The result is usually
-# calculated using e.g. CPU features or CPU generations.
+# An enumeration of CPU model comparison results.  The result is
+# usually calculated using e.g.  CPU features or CPU generations.
 #
 # @incompatible: If model A is incompatible to model B, model A is not
-#                guaranteed to run where model B runs and the other way around.
+#     guaranteed to run where model B runs and the other way around.
 #
-# @identical: If model A is identical to model B, model A is guaranteed to run
-#             where model B runs and the other way around.
+# @identical: If model A is identical to model B, model A is
+#     guaranteed to run where model B runs and the other way around.
 #
-# @superset: If model A is a superset of model B, model B is guaranteed to run
-#            where model A runs. There are no guarantees about the other way.
+# @superset: If model A is a superset of model B, model B is
+#     guaranteed to run where model A runs.  There are no guarantees
+#     about the other way.
 #
-# @subset: If model A is a subset of model B, model A is guaranteed to run
-#          where model B runs. There are no guarantees about the other way.
+# @subset: If model A is a subset of model B, model A is guaranteed to
+#     run where model B runs.  There are no guarantees about the other
+#     way.
 #
 # Since: 2.8
 ##
@@ -96,15 +101,16 @@
 # The result of a CPU model comparison.
 #
 # @result: The result of the compare operation.
-# @responsible-properties: List of properties that led to the comparison result
-#                          not being identical.
+#
+# @responsible-properties: List of properties that led to the
+#     comparison result not being identical.
 #
 # @responsible-properties is a list of QOM property names that led to
-# both CPUs not being detected as identical. For identical models, this
-# list is empty.
-# If a QOM property is read-only, that means there's no known way to make the
-# CPU models identical. If the special property name "type" is included, the
-# models are by definition not identical and cannot be made identical.
+# both CPUs not being detected as identical.  For identical models,
+# this list is empty.  If a QOM property is read-only, that means
+# there's no known way to make the CPU models identical.  If the
+# special property name "type" is included, the models are by
+# definition not identical and cannot be made identical.
 #
 # Since: 2.8
 ##
@@ -117,38 +123,42 @@
 # @query-cpu-model-comparison:
 #
 # Compares two CPU models, returning how they compare in a specific
-# configuration. The results indicates how both models compare regarding
-# runnability. This result can be used by tooling to make decisions if a
-# certain CPU model will run in a certain configuration or if a compatible
-# CPU model has to be created by baselining.
+# configuration.  The results indicates how both models compare
+# regarding runnability.  This result can be used by tooling to make
+# decisions if a certain CPU model will run in a certain configuration
+# or if a compatible CPU model has to be created by baselining.
 #
-# Usually, a CPU model is compared against the maximum possible CPU model
-# of a certain configuration (e.g. the "host" model for KVM). If that CPU
-# model is identical or a subset, it will run in that configuration.
+# Usually, a CPU model is compared against the maximum possible CPU
+# model of a certain configuration (e.g. the "host" model for KVM).
+# If that CPU model is identical or a subset, it will run in that
+# configuration.
 #
 # The result returned by this command may be affected by:
 #
-# * QEMU version: CPU models may look different depending on the QEMU version.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine-type: CPU model may look different depending on the machine-type.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine options (including accelerator): in some architectures, CPU models
-#   may look different depending on machine and accelerator options. (Except for
-#   CPU models reported as "static" in query-cpu-definitions.)
-# * "-cpu" arguments and global properties: arguments to the -cpu option and
-#   global properties may affect expansion of CPU models. Using
-#   query-cpu-model-expansion while using these is not advised.
+# * QEMU version: CPU models may look different depending on the QEMU
+#   version.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine-type: CPU model may look different depending on the
+#   machine-type.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine options (including accelerator): in some architectures,
+#   CPU models may look different depending on machine and accelerator
+#   options.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * "-cpu" arguments and global properties: arguments to the -cpu
+#   option and global properties may affect expansion of CPU models.
+#   Using query-cpu-model-expansion while using these is not advised.
 #
-# Some architectures may not support comparing CPU models. s390x supports
-# comparing CPU models.
+# Some architectures may not support comparing CPU models.  s390x
+# supports comparing CPU models.
 #
-# Returns: a CpuModelBaselineInfo. Returns an error if comparing CPU models is
-#          not supported, if a model cannot be used, if a model contains
-#          an unknown cpu definition name, unknown properties or properties
-#          with wrong types.
+# Returns: a CpuModelBaselineInfo.  Returns an error if comparing CPU
+#     models is not supported, if a model cannot be used, if a model
+#     contains an unknown cpu definition name, unknown properties or
+#     properties with wrong types.
 #
 # Note: this command isn't specific to s390x, but is only implemented
-#       on this architecture currently.
+#     on this architecture currently.
 #
 # Since: 2.8
 ##
@@ -160,38 +170,42 @@
 ##
 # @query-cpu-model-baseline:
 #
-# Baseline two CPU models, creating a compatible third model. The created
-# model will always be a static, migration-safe CPU model (see "static"
-# CPU model expansion for details).
+# Baseline two CPU models, creating a compatible third model.  The
+# created model will always be a static, migration-safe CPU model (see
+# "static" CPU model expansion for details).
 #
-# This interface can be used by tooling to create a compatible CPU model out
-# two CPU models. The created CPU model will be identical to or a subset of
-# both CPU models when comparing them. Therefore, the created CPU model is
-# guaranteed to run where the given CPU models run.
+# This interface can be used by tooling to create a compatible CPU
+# model out two CPU models.  The created CPU model will be identical
+# to or a subset of both CPU models when comparing them.  Therefore,
+# the created CPU model is guaranteed to run where the given CPU
+# models run.
 #
 # The result returned by this command may be affected by:
 #
-# * QEMU version: CPU models may look different depending on the QEMU version.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine-type: CPU model may look different depending on the machine-type.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine options (including accelerator): in some architectures, CPU models
-#   may look different depending on machine and accelerator options. (Except for
-#   CPU models reported as "static" in query-cpu-definitions.)
-# * "-cpu" arguments and global properties: arguments to the -cpu option and
-#   global properties may affect expansion of CPU models. Using
-#   query-cpu-model-expansion while using these is not advised.
+# * QEMU version: CPU models may look different depending on the QEMU
+#   version.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine-type: CPU model may look different depending on the
+#   machine-type.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine options (including accelerator): in some architectures,
+#   CPU models may look different depending on machine and accelerator
+#   options.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * "-cpu" arguments and global properties: arguments to the -cpu
+#   option and global properties may affect expansion of CPU models.
+#   Using query-cpu-model-expansion while using these is not advised.
 #
-# Some architectures may not support baselining CPU models. s390x supports
-# baselining CPU models.
+# Some architectures may not support baselining CPU models.  s390x
+# supports baselining CPU models.
 #
-# Returns: a CpuModelBaselineInfo. Returns an error if baselining CPU models is
-#          not supported, if a model cannot be used, if a model contains
-#          an unknown cpu definition name, unknown properties or properties
-#          with wrong types.
+# Returns: a CpuModelBaselineInfo.  Returns an error if baselining CPU
+#     models is not supported, if a model cannot be used, if a model
+#     contains an unknown cpu definition name, unknown properties or
+#     properties with wrong types.
 #
 # Note: this command isn't specific to s390x, but is only implemented
-#       on this architecture currently.
+#     on this architecture currently.
 #
 # Since: 2.8
 ##
@@ -219,33 +233,37 @@
 ##
 # @query-cpu-model-expansion:
 #
-# Expands a given CPU model (or a combination of CPU model + additional options)
-# to different granularities, allowing tooling to get an understanding what a
-# specific CPU model looks like in QEMU under a certain configuration.
+# Expands a given CPU model (or a combination of CPU model +
+# additional options) to different granularities, allowing tooling to
+# get an understanding what a specific CPU model looks like in QEMU
+# under a certain configuration.
 #
 # This interface can be used to query the "host" CPU model.
 #
 # The data returned by this command may be affected by:
 #
-# * QEMU version: CPU models may look different depending on the QEMU version.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine-type: CPU model  may look different depending on the machine-type.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine options (including accelerator): in some architectures, CPU models
-#   may look different depending on machine and accelerator options. (Except for
-#   CPU models reported as "static" in query-cpu-definitions.)
-# * "-cpu" arguments and global properties: arguments to the -cpu option and
-#   global properties may affect expansion of CPU models. Using
-#   query-cpu-model-expansion while using these is not advised.
+# * QEMU version: CPU models may look different depending on the QEMU
+#   version.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine-type: CPU model may look different depending on the
+#   machine-type.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * machine options (including accelerator): in some architectures,
+#   CPU models may look different depending on machine and accelerator
+#   options.  (Except for CPU models reported as "static" in
+#   query-cpu-definitions.)
+# * "-cpu" arguments and global properties: arguments to the -cpu
+#   option and global properties may affect expansion of CPU models.
+#   Using query-cpu-model-expansion while using these is not advised.
 #
-# Some architectures may not support all expansion types. s390x supports
-# "full" and "static". Arm only supports "full".
+# Some architectures may not support all expansion types.  s390x
+# supports "full" and "static". Arm only supports "full".
 #
-# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
-#          not supported, if the model cannot be expanded, if the model contains
-#          an unknown CPU definition name, unknown properties or properties
-#          with a wrong type. Also returns an error if an expansion type is
-#          not supported.
+# Returns: a CpuModelExpansionInfo.  Returns an error if expanding CPU
+#     models is not supported, if the model cannot be expanded, if the
+#     model contains an unknown CPU definition name, unknown
+#     properties or properties with a wrong type.  Also returns an
+#     error if an expansion type is not supported.
 #
 # Since: 2.8
 ##
@@ -265,49 +283,48 @@
 # @name: the name of the CPU definition
 #
 # @migration-safe: whether a CPU definition can be safely used for
-#                  migration in combination with a QEMU compatibility machine
-#                  when migrating between different QEMU versions and between
-#                  hosts with different sets of (hardware or software)
-#                  capabilities. If not provided, information is not available
-#                  and callers should not assume the CPU definition to be
-#                  migration-safe. (since 2.8)
+#     migration in combination with a QEMU compatibility machine when
+#     migrating between different QEMU versions and between hosts with
+#     different sets of (hardware or software) capabilities.  If not
+#     provided, information is not available and callers should not
+#     assume the CPU definition to be migration-safe.  (since 2.8)
 #
-# @static: whether a CPU definition is static and will not change depending on
-#          QEMU version, machine type, machine options and accelerator options.
-#          A static model is always migration-safe. (since 2.8)
+# @static: whether a CPU definition is static and will not change
+#     depending on QEMU version, machine type, machine options and
+#     accelerator options.  A static model is always migration-safe.
+#     (since 2.8)
 #
-# @unavailable-features: List of properties that prevent
-#                        the CPU model from running in the current
-#                        host. (since 2.8)
-# @typename: Type name that can be used as argument to @device-list-properties,
-#            to introspect properties configurable using -cpu or -global.
-#            (since 2.9)
+# @unavailable-features: List of properties that prevent the CPU model
+#     from running in the current host.  (since 2.8)
 #
-# @alias-of: Name of CPU model this model is an alias for.  The target of the
-#            CPU model alias may change depending on the machine type.
-#            Management software is supposed to translate CPU model aliases
-#            in the VM configuration, because aliases may stop being
-#            migration-safe in the future (since 4.1)
+# @typename: Type name that can be used as argument to
+#     @device-list-properties, to introspect properties configurable
+#     using -cpu or -global.  (since 2.9)
 #
-# @deprecated: If true, this CPU model is deprecated and may be removed in
-#              in some future version of QEMU according to the QEMU deprecation
-#              policy. (since 5.2)
+# @alias-of: Name of CPU model this model is an alias for.  The target
+#     of the CPU model alias may change depending on the machine type.
+#     Management software is supposed to translate CPU model aliases
+#     in the VM configuration, because aliases may stop being
+#     migration-safe in the future (since 4.1)
 #
-# @unavailable-features is a list of QOM property names that
-# represent CPU model attributes that prevent the CPU from running.
-# If the QOM property is read-only, that means there's no known
-# way to make the CPU model run in the current host. Implementations
-# that choose not to provide specific information return the
-# property name "type".
-# If the property is read-write, it means that it MAY be possible
-# to run the CPU model in the current host if that property is
-# changed. Management software can use it as hints to suggest or
-# choose an alternative for the user, or just to generate meaningful
-# error messages explaining why the CPU model can't be used.
-# If @unavailable-features is an empty list, the CPU model is
-# runnable using the current host and machine-type.
-# If @unavailable-features is not present, runnability
-# information for the CPU is not available.
+# @deprecated: If true, this CPU model is deprecated and may be
+#     removed in in some future version of QEMU according to the QEMU
+#     deprecation policy.  (since 5.2)
+#
+# @unavailable-features is a list of QOM property names that represent
+# CPU model attributes that prevent the CPU from running.  If the QOM
+# property is read-only, that means there's no known way to make the
+# CPU model run in the current host.  Implementations that choose not
+# to provide specific information return the property name "type". If
+# the property is read-write, it means that it MAY be possible to run
+# the CPU model in the current host if that property is changed.
+# Management software can use it as hints to suggest or choose an
+# alternative for the user, or just to generate meaningful error
+# messages explaining why the CPU model can't be used.  If
+# @unavailable-features is an empty list, the CPU model is runnable
+# using the current host and machine-type.  If @unavailable-features
+# is not present, runnability information for the CPU is not
+# available.
 #
 # Since: 1.2
 ##
diff --git a/qapi/machine.json b/qapi/machine.json
index fcd69965e5..37660d8f2a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -14,17 +14,18 @@
 # @SysEmuTarget:
 #
 # The comprehensive enumeration of QEMU system emulation ("softmmu")
-# targets. Run "./configure --help" in the project root directory, and
-# look for the \*-softmmu targets near the "--target-list" option. The
-# individual target constants are not documented here, for the time
-# being.
+# targets.  Run "./configure --help" in the project root directory,
+# and look for the \*-softmmu targets near the "--target-list" option.
+# The individual target constants are not documented here, for the
+# time being.
 #
 # @rx: since 5.0
+#
 # @avr: since 5.1
 #
-# Notes: The resulting QMP strings can be appended to the "qemu-system-"
-#        prefix to produce the corresponding QEMU executable name. This
-#        is true even for "qemu-system-x86_64".
+# Notes: The resulting QMP strings can be appended to the
+#     "qemu-system-" prefix to produce the corresponding QEMU
+#     executable name.  This is true even for "qemu-system-x86_64".
 #
 # Since: 3.0
 ##
@@ -39,8 +40,8 @@
 ##
 # @CpuS390State:
 #
-# An enumeration of cpu states that can be assumed by a virtual
-# S390 CPU
+# An enumeration of cpu states that can be assumed by a virtual S390
+# CPU
 #
 # Since: 2.12
 ##
@@ -71,10 +72,10 @@
 # @thread-id: ID of the underlying host thread
 #
 # @props: properties describing to which node/socket/core/thread
-#         virtual CPU belongs to, provided if supported by board
+#     virtual CPU belongs to, provided if supported by board
 #
 # @target: the QEMU system emulation target, which determines which
-#          additional fields will be listed (since 3.0)
+#     additional fields will be listed (since 3.0)
 #
 # Since: 2.12
 ##
@@ -139,21 +140,22 @@
 # @is-default: whether the machine is default
 #
 # @cpu-max: maximum number of CPUs supported by the machine type
-#           (since 1.5)
+#     (since 1.5)
 #
 # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7)
 #
 # @numa-mem-supported: true if '-numa node,mem' option is supported by
-#                      the machine type and false otherwise (since 4.1)
+#     the machine type and false otherwise (since 4.1)
 #
-# @deprecated: if true, the machine type is deprecated and may be removed
-#              in future versions of QEMU according to the QEMU deprecation
-#              policy (since 4.1)
+# @deprecated: if true, the machine type is deprecated and may be
+#     removed in future versions of QEMU according to the QEMU
+#     deprecation policy (since 4.1)
 #
-# @default-cpu-type: default CPU model typename if none is requested via
-#                    the -cpu argument. (since 4.2)
+# @default-cpu-type: default CPU model typename if none is requested
+#     via the -cpu argument.  (since 4.2)
 #
-# @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
+# @default-ram-id: the default ID of initial RAM memory backend (since
+#     5.2)
 #
 # @acpi: machine type supports ACPI (since 8.0)
 #
@@ -183,7 +185,7 @@
 # Information describing the running machine parameters.
 #
 # @wakeup-suspend-support: true if the machine supports wake up from
-#                          suspend
+#     suspend
 #
 # Since: 4.0
 ##
@@ -233,7 +235,8 @@
 #
 # Since: 0.14
 #
-# Notes: If no UUID was specified for the guest, a null UUID is returned.
+# Notes: If no UUID was specified for the guest, a null UUID is
+#     returned.
 ##
 { 'struct': 'UuidInfo', 'data': {'UUID': 'str'} }
 
@@ -250,7 +253,6 @@
 #
 # -> { "execute": "query-uuid" }
 # <- { "return": { "UUID": "550e8400-e29b-41d4-a716-446655440000" } }
-#
 ##
 { 'command': 'query-uuid', 'returns': 'UuidInfo', 'allow-preconfig': true }
 
@@ -285,7 +287,6 @@
 #
 # -> { "execute": "system_reset" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'system_reset' }
 
@@ -297,67 +298,65 @@
 # Since: 0.14
 #
 # Notes: A guest may or may not respond to this command.  This command
-#        returning does not indicate that a guest has accepted the request or
-#        that it has shut down.  Many guests will respond to this command by
-#        prompting the user in some way.
+#     returning does not indicate that a guest has accepted the
+#     request or that it has shut down.  Many guests will respond to
+#     this command by prompting the user in some way.
 #
 # Example:
 #
 # -> { "execute": "system_powerdown" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'system_powerdown' }
 
 ##
 # @system_wakeup:
 #
-# Wake up guest from suspend. If the guest has wake-up from suspend
+# Wake up guest from suspend.  If the guest has wake-up from suspend
 # support enabled (wakeup-suspend-support flag from
 # query-current-machine), wake-up guest from suspend if the guest is
-# in SUSPENDED state. Return an error otherwise.
+# in SUSPENDED state.  Return an error otherwise.
 #
 # Since: 1.1
 #
 # Returns: nothing.
 #
 # Note: prior to 4.0, this command does nothing in case the guest
-#       isn't suspended.
+#     isn't suspended.
 #
 # Example:
 #
 # -> { "execute": "system_wakeup" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'system_wakeup' }
 
 ##
 # @LostTickPolicy:
 #
-# Policy for handling lost ticks in timer devices.  Ticks end up getting
-# lost when, for example, the guest is paused.
+# Policy for handling lost ticks in timer devices.  Ticks end up
+# getting lost when, for example, the guest is paused.
 #
-# @discard: throw away the missed ticks and continue with future injection
-#           normally.  The guest OS will see the timer jump ahead by a
-#           potentially quite significant amount all at once, as if the
-#           intervening chunk of time had simply not existed; needless to
-#           say, such a sudden jump can easily confuse a guest OS which is
-#           not specifically prepared to deal with it.  Assuming the guest
-#           OS can deal correctly with the time jump, the time in the guest
-#           and in the host should now match.
+# @discard: throw away the missed ticks and continue with future
+#     injection normally.  The guest OS will see the timer jump ahead
+#     by a potentially quite significant amount all at once, as if the
+#     intervening chunk of time had simply not existed; needless to
+#     say, such a sudden jump can easily confuse a guest OS which is
+#     not specifically prepared to deal with it.  Assuming the guest
+#     OS can deal correctly with the time jump, the time in the guest
+#     and in the host should now match.
 #
-# @delay: continue to deliver ticks at the normal rate.  The guest OS will
-#         not notice anything is amiss, as from its point of view time will
-#         have continued to flow normally.  The time in the guest should now
-#         be behind the time in the host by exactly the amount of time during
-#         which ticks have been missed.
+# @delay: continue to deliver ticks at the normal rate.  The guest OS
+#     will not notice anything is amiss, as from its point of view
+#     time will have continued to flow normally.  The time in the
+#     guest should now be behind the time in the host by exactly the
+#     amount of time during which ticks have been missed.
 #
-# @slew: deliver ticks at a higher rate to catch up with the missed ticks.
-#        The guest OS will not notice anything is amiss, as from its point
-#        of view time will have continued to flow normally.  Once the timer
-#        has managed to catch up with all the missing ticks, the time in
-#        the guest and in the host should match.
+# @slew: deliver ticks at a higher rate to catch up with the missed
+#     ticks.  The guest OS will not notice anything is amiss, as from
+#     its point of view time will have continued to flow normally.
+#     Once the timer has managed to catch up with all the missing
+#     ticks, the time in the guest and in the host should match.
 #
 # Since: 2.0
 ##
@@ -367,20 +366,21 @@
 ##
 # @inject-nmi:
 #
-# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or all CPUs (ppc64).
-# The command fails when the guest doesn't support injecting.
+# Injects a Non-Maskable Interrupt into the default CPU (x86/s390) or
+# all CPUs (ppc64). The command fails when the guest doesn't support
+# injecting.
 #
 # Returns: If successful, nothing
 #
 # Since: 0.14
 #
-# Note: prior to 2.1, this command was only supported for x86 and s390 VMs
+# Note: prior to 2.1, this command was only supported for x86 and s390
+#     VMs
 #
 # Example:
 #
 # -> { "execute": "inject-nmi" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'inject-nmi' }
 
@@ -410,7 +410,6 @@
 #
 # -> { "execute": "query-kvm" }
 # <- { "return": { "enabled": true, "present": true } }
-#
 ##
 { 'command': 'query-kvm', 'returns': 'KvmInfo' }
 
@@ -435,7 +434,7 @@
 ##
 # @NumaOptions:
 #
-# A discriminated record of NUMA options. (for OptsVisitor)
+# A discriminated record of NUMA options.  (for OptsVisitor)
 #
 # Since: 2.1
 ##
@@ -452,26 +451,25 @@
 ##
 # @NumaNodeOptions:
 #
-# Create a guest NUMA node. (for OptsVisitor)
+# Create a guest NUMA node.  (for OptsVisitor)
 #
 # @nodeid: NUMA node ID (increase by 1 from 0 if omitted)
 #
-# @cpus: VCPUs belonging to this node (assign VCPUS round-robin
-#        if omitted)
+# @cpus: VCPUs belonging to this node (assign VCPUS round-robin if
+#     omitted)
 #
 # @mem: memory size of this node; mutually exclusive with @memdev.
-#       Equally divide total memory among nodes if both @mem and @memdev are
-#       omitted.
+#     Equally divide total memory among nodes if both @mem and @memdev
+#     are omitted.
 #
-# @memdev: memory backend object.  If specified for one node,
-#          it must be specified for all nodes.
+# @memdev: memory backend object.  If specified for one node, it must
+#     be specified for all nodes.
 #
-# @initiator: defined in ACPI 6.3 Chapter 5.2.27.3 Table 5-145,
-#             points to the nodeid which has the memory controller
-#             responsible for this NUMA node. This field provides
-#             additional information as to the initiator node that
-#             is closest (as in directly attached) to this node, and
-#             therefore has the best performance (since 5.0)
+# @initiator: defined in ACPI 6.3 Chapter 5.2.27.3 Table 5-145, points
+#     to the nodeid which has the memory controller responsible for
+#     this NUMA node.  This field provides additional information as
+#     to the initiator node that is closest (as in directly attached)
+#     to this node, and therefore has the best performance (since 5.0)
 #
 # Since: 2.1
 ##
@@ -492,9 +490,9 @@
 #
 # @dst: destination NUMA node.
 #
-# @val: NUMA distance from source node to destination node.
-#       When a node is unreachable from another node, set the distance
-#       between them to 255.
+# @val: NUMA distance from source node to destination node.  When a
+#     node is unreachable from another node, set the distance between
+#     them to 255.
 #
 # Since: 2.10
 ##
@@ -509,13 +507,15 @@
 #
 # Create a CXL Fixed Memory Window
 #
-# @size: Size of the Fixed Memory Window in bytes. Must be a multiple
-#        of 256MiB.
+# @size: Size of the Fixed Memory Window in bytes.  Must be a multiple
+#     of 256MiB.
+#
 # @interleave-granularity: Number of contiguous bytes for which
-#                          accesses will go to a given interleave target.
-#                          Accepted values [256, 512, 1k, 2k, 4k, 8k, 16k]
-# @targets: Target root bridge IDs from -device ...,id=<ID> for each root
-#           bridge.
+#     accesses will go to a given interleave target.  Accepted values
+#     [256, 512, 1k, 2k, 4k, 8k, 16k]
+#
+# @targets: Target root bridge IDs from -device ...,id=<ID> for each
+#     root bridge.
 #
 # Since: 7.1
 ##
@@ -553,10 +553,11 @@
 #
 # Information about a X86 CPU feature word
 #
-# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
+# @cpuid-input-eax: Input EAX value for CPUID instruction for that
+#     feature word
 #
 # @cpuid-input-ecx: Input ECX value for CPUID instruction for that
-#                   feature word
+#     feature word
 #
 # @cpuid-register: Output register containing the feature bits
 #
@@ -573,7 +574,8 @@
 ##
 # @DummyForceArrays:
 #
-# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
+# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList
+# internally
 #
 # Since: 2.5
 ##
@@ -583,8 +585,8 @@
 ##
 # @NumaCpuOptions:
 #
-# Option "-numa cpu" overrides default cpu to node mapping.
-# It accepts the same set of cpu properties as returned by
+# Option "-numa cpu" overrides default cpu to node mapping.  It
+# accepts the same set of cpu properties as returned by
 # query-hotpluggable-cpus[].props, where node-id could be used to
 # override default node mapping.
 #
@@ -619,11 +621,11 @@
 ##
 # @HmatLBDataType:
 #
-# Data type in the System Locality Latency and Bandwidth
-# Information Structure of HMAT (Heterogeneous Memory Attribute Table)
+# Data type in the System Locality Latency and Bandwidth Information
+# Structure of HMAT (Heterogeneous Memory Attribute Table)
 #
-# For more information about @HmatLBDataType, see chapter
-# 5.2.27.4: Table 5-146:  Field "Data Type" of ACPI 6.3 spec.
+# For more information about @HmatLBDataType, see chapter 5.2.27.4:
+# Table 5-146:  Field "Data Type" of ACPI 6.3 spec.
 #
 # @access-latency: access latency (nanoseconds)
 #
@@ -646,28 +648,27 @@
 ##
 # @NumaHmatLBOptions:
 #
-# Set the system locality latency and bandwidth information
-# between Initiator and Target proximity Domains.
+# Set the system locality latency and bandwidth information between
+# Initiator and Target proximity Domains.
 #
-# For more information about @NumaHmatLBOptions, see chapter
-# 5.2.27.4: Table 5-146 of ACPI 6.3 spec.
+# For more information about @NumaHmatLBOptions, see chapter 5.2.27.4:
+# Table 5-146 of ACPI 6.3 spec.
 #
 # @initiator: the Initiator Proximity Domain.
 #
 # @target: the Target Proximity Domain.
 #
-# @hierarchy: the Memory Hierarchy. Indicates the performance
-#             of memory or side cache.
+# @hierarchy: the Memory Hierarchy.  Indicates the performance of
+#     memory or side cache.
 #
-# @data-type: presents the type of data, access/read/write
-#             latency or hit latency.
+# @data-type: presents the type of data, access/read/write latency or
+#     hit latency.
 #
-# @latency: the value of latency from @initiator to @target
-#           proximity domain, the latency unit is "ns(nanosecond)".
+# @latency: the value of latency from @initiator to @target proximity
+#     domain, the latency unit is "ns(nanosecond)".
 #
 # @bandwidth: the value of bandwidth between @initiator and @target
-#             proximity domain, the bandwidth unit is
-#             "Bytes per second".
+#     proximity domain, the bandwidth unit is "Bytes per second".
 #
 # Since: 5.0
 ##
@@ -689,8 +690,8 @@
 # For more information of @HmatCacheAssociativity, see chapter
 # 5.2.27.5: Table 5-147 of ACPI 6.3 spec.
 #
-# @none: None (no memory side cache in this proximity domain,
-#        or cache associativity unknown)
+# @none: None (no memory side cache in this proximity domain, or cache
+#     associativity unknown)
 #
 # @direct: Direct Mapped
 #
@@ -704,14 +705,14 @@
 ##
 # @HmatCacheWritePolicy:
 #
-# Cache write policy in the Memory Side Cache Information Structure
-# of HMAT
+# Cache write policy in the Memory Side Cache Information Structure of
+# HMAT
 #
-# For more information of @HmatCacheWritePolicy, see chapter
-# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+# For more information of @HmatCacheWritePolicy, see chapter 5.2.27.5:
+# Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
 #
-# @none: None (no memory side cache in this proximity domain,
-#        or cache write policy unknown)
+# @none: None (no memory side cache in this proximity domain, or cache
+#     write policy unknown)
 #
 # @write-back: Write Back (WB)
 #
@@ -727,8 +728,8 @@
 #
 # Set the memory side cache information for a given memory domain.
 #
-# For more information of @NumaHmatCacheOptions, see chapter
-# 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
+# For more information of @NumaHmatCacheOptions, see chapter 5.2.27.5:
+# Table 5-147: Field "Cache Attributes" of ACPI 6.3 spec.
 #
 # @node-id: the memory proximity domain to which the memory belongs.
 #
@@ -737,7 +738,7 @@
 # @level: the cache level described in this structure.
 #
 # @associativity: the cache associativity,
-#                 none/direct-mapped/complex(complex cache indexing).
+#     none/direct-mapped/complex(complex cache indexing).
 #
 # @policy: the write policy, none/write-back/write-through.
 #
@@ -766,7 +767,7 @@
 # @filename: the file to save the memory to as binary data
 #
 # @cpu-index: the index of the virtual CPU to use for translating the
-#             virtual address (defaults to CPU 0)
+#     virtual address (defaults to CPU 0)
 #
 # Returns: Nothing on success
 #
@@ -781,7 +782,6 @@
 #                     "size": 100,
 #                     "filename": "/tmp/virtual-mem-dump" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'memsave',
   'data': {'val': 'int', 'size': 'int', 'filename': 'str', '*cpu-index': 'int'} }
@@ -810,7 +810,6 @@
 #                     "size": 100,
 #                     "filename": "/tmp/physical-mem-dump" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'pmemsave',
   'data': {'val': 'int', 'size': 'int', 'filename': 'str'} }
@@ -832,11 +831,11 @@
 #
 # @share: whether memory is private to QEMU or shared (since 6.1)
 #
-# @reserve: whether swap space (or huge pages) was reserved if applicable.
-#           This corresponds to the user configuration and not the actual
-#           behavior implemented in the OS to perform the reservation.
-#           For example, Linux will never reserve swap space for shared
-#           file mappings. (since 6.1)
+# @reserve: whether swap space (or huge pages) was reserved if
+#     applicable.  This corresponds to the user configuration and not
+#     the actual behavior implemented in the OS to perform the
+#     reservation.  For example, Linux will never reserve swap space
+#     for shared file mappings.  (since 6.1)
 #
 # @host-nodes: host nodes for its memory policy
 #
@@ -890,29 +889,34 @@
 #        }
 #      ]
 #    }
-#
 ##
 { 'command': 'query-memdev', 'returns': ['Memdev'], 'allow-preconfig': true }
 
 ##
 # @CpuInstanceProperties:
 #
-# List of properties to be used for hotplugging a CPU instance,
-# it should be passed by management with device_add command when
-# a CPU is being hotplugged.
+# List of properties to be used for hotplugging a CPU instance, it
+# should be passed by management with device_add command when a CPU is
+# being hotplugged.
 #
 # @node-id: NUMA node ID the CPU belongs to
+#
 # @socket-id: socket number within node/board the CPU belongs to
+#
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
+#
+# @cluster-id: cluster number within die the CPU belongs to (since
+#     7.1)
+#
 # @core-id: core number within cluster the CPU belongs to
+#
 # @thread-id: thread number within core the CPU belongs to
 #
-# Note: currently there are 6 properties that could be present
-#       but management should be prepared to pass through other
-#       properties with device_add command to allow for future
-#       interface extension. This also requires the filed names to be kept in
-#       sync with the properties passed to -device/device_add.
+# Note: currently there are 6 properties that could be present but
+#     management should be prepared to pass through other properties
+#     with device_add command to allow for future interface extension.
+#     This also requires the filed names to be kept in sync with the
+#     properties passed to -device/device_add.
 #
 # Since: 2.7
 ##
@@ -930,10 +934,14 @@
 # @HotpluggableCPU:
 #
 # @type: CPU object type for usage with device_add command
+#
 # @props: list of properties to be used for hotplugging CPU
-# @vcpus-count: number of logical VCPU threads @HotpluggableCPU provides
-# @qom-path: link to existing CPU object if CPU is present or
-#            omitted if CPU is not present.
+#
+# @vcpus-count: number of logical VCPU threads @HotpluggableCPU
+#     provides
+#
+# @qom-path: link to existing CPU object if CPU is present or omitted
+#     if CPU is not present.
 #
 # Since: 2.7
 ##
@@ -956,7 +964,8 @@
 #
 # Examples:
 #
-# For pseries machine type started with -smp 2,cores=2,maxcpus=4 -cpu POWER8:
+# For pseries machine type started with -smp 2,cores=2,maxcpus=4 -cpu
+# POWER8:
 #
 # -> { "execute": "query-hotpluggable-cpus" }
 # <- {"return": [
@@ -981,8 +990,8 @@
 #      }
 #    ]}
 #
-# For s390x-virtio-ccw machine type started with -smp 1,maxcpus=2 -cpu qemu
-# (Since: 2.11):
+# For s390x-virtio-ccw machine type started with -smp 1,maxcpus=2 -cpu
+# qemu (Since: 2.11):
 #
 # -> { "execute": "query-hotpluggable-cpus" }
 # <- {"return": [
@@ -996,7 +1005,6 @@
 #         "props": { "core-id": 0 }
 #      }
 #    ]}
-#
 ##
 { 'command': 'query-hotpluggable-cpus', 'returns': ['HotpluggableCPU'],
              'allow-preconfig': true }
@@ -1004,9 +1012,8 @@
 ##
 # @set-numa-node:
 #
-# Runtime equivalent of '-numa' CLI option, available at
-# preconfigure stage to configure numa mapping before initializing
-# machine.
+# Runtime equivalent of '-numa' CLI option, available at preconfigure
+# stage to configure numa mapping before initializing machine.
 #
 # Since: 3.0
 ##
@@ -1020,21 +1027,22 @@
 #
 # Request the balloon driver to change its balloon size.
 #
-# @value: the target logical size of the VM in bytes.
-#         We can deduce the size of the balloon using this formula:
+# @value: the target logical size of the VM in bytes.  We can deduce
+#     the size of the balloon using this formula:
 #
-#            logical_vm_size = vm_ram_size - balloon_size
+#        logical_vm_size = vm_ram_size - balloon_size
 #
-#         From it we have: balloon_size = vm_ram_size - @value
+#     From it we have: balloon_size = vm_ram_size - @value
 #
-# Returns: - Nothing on success
-#          - If the balloon driver is enabled but not functional because the KVM
-#            kernel module cannot support it, KVMMissingCap
-#          - If no balloon device is present, DeviceNotActive
+# Returns:
+# - Nothing on success
+# - If the balloon driver is enabled but not functional because the
+#   KVM kernel module cannot support it, KVMMissingCap
+# - If no balloon device is present, DeviceNotActive
 #
-# Notes: This command just issues a request to the guest.  When it returns,
-#        the balloon size may not have changed.  A guest can change the balloon
-#        size independent of this command.
+# Notes: This command just issues a request to the guest.  When it
+#     returns, the balloon size may not have changed.  A guest can
+#     change the balloon size independent of this command.
 #
 # Since: 0.14
 #
@@ -1044,7 +1052,6 @@
 # <- { "return": {} }
 #
 # With a 2.5GiB guest this command inflated the ballon to 3GiB.
-#
 ##
 { 'command': 'balloon', 'data': {'value': 'int'} }
 
@@ -1053,8 +1060,8 @@
 #
 # Information about the guest balloon device.
 #
-# @actual: the logical size of the VM in bytes
-#          Formula used: logical_vm_size = vm_ram_size - balloon_size
+# @actual: the logical size of the VM in bytes Formula used:
+#     logical_vm_size = vm_ram_size - balloon_size
 #
 # Since: 0.14
 ##
@@ -1065,10 +1072,11 @@
 #
 # Return information about the balloon device.
 #
-# Returns: - @BalloonInfo on success
-#          - If the balloon driver is enabled but not functional because the KVM
-#            kernel module cannot support it, KVMMissingCap
-#          - If no balloon device is present, DeviceNotActive
+# Returns:
+# - @BalloonInfo on success
+# - If the balloon driver is enabled but not functional because the
+#   KVM kernel module cannot support it, KVMMissingCap
+# - If no balloon device is present, DeviceNotActive
 #
 # Since: 0.14
 #
@@ -1079,18 +1087,18 @@
 #          "actual": 1073741824
 #       }
 #    }
-#
 ##
 { 'command': 'query-balloon', 'returns': 'BalloonInfo' }
 
 ##
 # @BALLOON_CHANGE:
 #
-# Emitted when the guest changes the actual BALLOON level. This value is
-# equivalent to the @actual field return by the 'query-balloon' command
+# Emitted when the guest changes the actual BALLOON level.  This value
+# is equivalent to the @actual field return by the 'query-balloon'
+# command
 #
-# @actual: the logical size of the VM in bytes
-#          Formula used: logical_vm_size = vm_ram_size - balloon_size
+# @actual: the logical size of the VM in bytes Formula used:
+#     logical_vm_size = vm_ram_size - balloon_size
 #
 # Note: this event is rate-limited.
 #
@@ -1101,7 +1109,6 @@
 # <- { "event": "BALLOON_CHANGE",
 #      "data": { "actual": 944766976 },
 #      "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
 ##
 { 'event': 'BALLOON_CHANGE',
   'data': { 'actual': 'int' } }
@@ -1112,11 +1119,11 @@
 # Actual memory information in bytes.
 #
 # @base-memory: size of "base" memory specified with command line
-#               option -m.
+#     option -m.
 #
-# @plugged-memory: size of memory that can be hot-unplugged. This field
-#                  is omitted if target doesn't support memory hotplug
-#                  (i.e. CONFIG_MEM_DEVICE not defined at build time).
+# @plugged-memory: size of memory that can be hot-unplugged.  This
+#     field is omitted if target doesn't support memory hotplug (i.e.
+#     CONFIG_MEM_DEVICE not defined at build time).
 #
 # Since: 2.11
 ##
@@ -1126,8 +1133,8 @@
 ##
 # @query-memory-size-summary:
 #
-# Return the amount of initially allocated and present hotpluggable (if
-# enabled) memory in bytes.
+# Return the amount of initially allocated and present hotpluggable
+# (if enabled) memory in bytes.
 #
 # Example:
 #
@@ -1157,7 +1164,8 @@
 #
 # @hotplugged: true if device was hotplugged
 #
-# @hotpluggable: true if device if could be added/removed while machine is running
+# @hotpluggable: true if device if could be added/removed while
+#     machine is running
 #
 # Since: 2.1
 ##
@@ -1374,16 +1382,15 @@
 #                         "slot": 0},
 #                    "type": "dimm"
 #                  } ] }
-#
 ##
 { 'command': 'query-memory-devices', 'returns': ['MemoryDeviceInfo'] }
 
 ##
 # @MEMORY_DEVICE_SIZE_CHANGE:
 #
-# Emitted when the size of a memory device changes. Only emitted for memory
-# devices that can actually change the size (e.g., virtio-mem due to guest
-# action).
+# Emitted when the size of a memory device changes.  Only emitted for
+# memory devices that can actually change the size (e.g., virtio-mem
+# due to guest action).
 #
 # @id: device's ID
 #
@@ -1401,7 +1408,6 @@
 #      "data": { "id": "vm0", "size": 1073741824,
 #                "qom-path": "/machine/unattached/device[2]" },
 #      "timestamp": { "seconds": 1588168529, "microseconds": 201316 } }
-#
 ##
 { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
@@ -1416,8 +1422,9 @@
 # @msg: Informative message
 #
 # Features:
-# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_GUEST_ERROR
-#              instead.
+#
+# @deprecated: This event is deprecated.  Use
+#     @DEVICE_UNPLUG_GUEST_ERROR instead.
 #
 # Since: 2.4
 #
@@ -1428,7 +1435,6 @@
 #                "msg": "acpi: device unplug for unsupported device"
 #      },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' },
@@ -1445,13 +1451,15 @@
 #
 # @menu: Whether to show a boot menu
 #
-# @splash: The name of the file to be passed to the firmware as logo picture, if @menu is true.
+# @splash: The name of the file to be passed to the firmware as logo
+#     picture, if @menu is true.
 #
 # @splash-time: How long to show the logo picture, in milliseconds
 #
 # @reboot-timeout: Timeout before guest reboots after boot fails
 #
-# @strict: Whether to attempt booting from devices not included in the boot order
+# @strict: Whether to attempt booting from devices not included in the
+#     boot order
 #
 # Since: 7.1
 ##
@@ -1467,8 +1475,8 @@
 ##
 # @SMPConfiguration:
 #
-# Schema for CPU topology configuration.  A missing value lets
-# QEMU figure out a suitable value based on the ones that are provided.
+# Schema for CPU topology configuration.  A missing value lets QEMU
+# figure out a suitable value based on the ones that are provided.
 #
 # @cpus: number of virtual CPUs in the virtual machine
 #
@@ -1476,13 +1484,15 @@
 #
 # @dies: number of dies per socket in the CPU topology
 #
-# @clusters: number of clusters per die in the CPU topology (since 7.0)
+# @clusters: number of clusters per die in the CPU topology (since
+#     7.0)
 #
 # @cores: number of cores per cluster in the CPU topology
 #
 # @threads: number of threads per core in the CPU topology
 #
-# @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual machine
+# @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual
+#     machine
 #
 # Since: 6.1
 ##
@@ -1501,6 +1511,7 @@
 # Query interrupt statistics
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: interrupt statistics
@@ -1517,6 +1528,7 @@
 # Query TCG compiler statistics
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: TCG compiler statistics
@@ -1534,6 +1546,7 @@
 # Query NUMA topology information
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: topology information
@@ -1550,6 +1563,7 @@
 # Query TCG opcode counters
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: TCG opcode counters
@@ -1567,6 +1581,7 @@
 # Query TCG profiling information
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: profile information
@@ -1584,6 +1599,7 @@
 # Query system ramblock information
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: system ramblock information
@@ -1600,6 +1616,7 @@
 # Query RDMA state
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: RDMA state
@@ -1616,6 +1633,7 @@
 # Query information on the registered ROMS
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: registered ROMs
@@ -1632,6 +1650,7 @@
 # Query information on the USB devices
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: USB device information
@@ -1682,10 +1701,10 @@
 # Since: 7.2
 #
 # Example:
+#
 # -> { "execute": "dumpdtb" }
 #      "arguments": { "filename": "fdt.dtb" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'dumpdtb',
   'data': { 'filename': 'str' },
diff --git a/qapi/migration.json b/qapi/migration.json
index 11c09800c2..952d3e2c9a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -16,7 +16,8 @@
 #
 # @transferred: amount of bytes already transferred to the target VM
 #
-# @remaining: amount of bytes remaining to be transferred to the target VM
+# @remaining: amount of bytes remaining to be transferred to the
+#     target VM
 #
 # @total: total amount of bytes involved in the migration process
 #
@@ -28,37 +29,39 @@
 #
 # @normal-bytes: number of normal bytes sent (since 1.2)
 #
-# @dirty-pages-rate: number of pages dirtied by second by the
-#                    guest (since 1.3)
+# @dirty-pages-rate: number of pages dirtied by second by the guest
+#     (since 1.3)
 #
-# @mbps: throughput in megabits/sec. (since 1.6)
+# @mbps: throughput in megabits/sec.  (since 1.6)
 #
-# @dirty-sync-count: number of times that dirty ram was synchronized (since 2.1)
+# @dirty-sync-count: number of times that dirty ram was synchronized
+#     (since 2.1)
 #
-# @postcopy-requests: The number of page requests received from the destination
-#                     (since 2.7)
+# @postcopy-requests: The number of page requests received from the
+#     destination (since 2.7)
 #
 # @page-size: The number of bytes per page for the various page-based
-#             statistics (since 2.10)
+#     statistics (since 2.10)
 #
 # @multifd-bytes: The number of bytes sent through multifd (since 3.0)
 #
 # @pages-per-second: the number of memory pages transferred per second
-#                    (Since 4.0)
+#     (Since 4.0)
 #
 # @precopy-bytes: The number of bytes sent in the pre-copy phase
-#                 (since 7.0).
+#     (since 7.0).
 #
 # @downtime-bytes: The number of bytes sent while the guest is paused
-#                  (since 7.0).
+#     (since 7.0).
 #
 # @postcopy-bytes: The number of bytes sent during the post-copy phase
-#                  (since 7.0).
+#     (since 7.0).
+#
+# @dirty-sync-missed-zero-copy: Number of times dirty RAM
+#     synchronization could not avoid copying dirty pages.  This is
+#     between 0 and @dirty-sync-count * @multifd-channels.  (since
+#     7.1)
 #
-# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
-#                               not avoid copying dirty pages. This is between
-#                               0 and @dirty-sync-count * @multifd-channels.
-#                               (since 7.1)
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -105,7 +108,8 @@
 #
 # @pages: amount of pages compressed and transferred to the target VM
 #
-# @busy: count of times that no free thread was available to compress data
+# @busy: count of times that no free thread was available to compress
+#     data
 #
 # @busy-rate: rate of thread busy
 #
@@ -134,26 +138,29 @@
 #
 # @active: in the process of doing migration.
 #
-# @postcopy-active: like active, but now in postcopy mode. (since 2.5)
+# @postcopy-active: like active, but now in postcopy mode.  (since
+#     2.5)
 #
-# @postcopy-paused: during postcopy but paused. (since 3.0)
+# @postcopy-paused: during postcopy but paused.  (since 3.0)
 #
-# @postcopy-recover: trying to recover from a paused postcopy. (since 3.0)
+# @postcopy-recover: trying to recover from a paused postcopy.  (since
+#     3.0)
 #
 # @completed: migration is finished.
 #
 # @failed: some error occurred during migration process.
 #
-# @colo: VM is in the process of fault tolerance, VM can not get into this
-#        state unless colo capability is enabled for migration. (since 2.8)
+# @colo: VM is in the process of fault tolerance, VM can not get into
+#     this state unless colo capability is enabled for migration.
+#     (since 2.8)
 #
-# @pre-switchover: Paused before device serialisation. (since 2.11)
+# @pre-switchover: Paused before device serialisation.  (since 2.11)
 #
-# @device: During device serialisation when pause-before-switchover is enabled
-#          (since 2.11)
+# @device: During device serialisation when pause-before-switchover is
+#     enabled (since 2.11)
 #
-# @wait-unplug: wait for device unplug request by guest OS to be completed.
-#               (since 4.2)
+# @wait-unplug: wait for device unplug request by guest OS to be
+#     completed.  (since 4.2)
 #
 # Since: 2.3
 ##
@@ -167,7 +174,8 @@
 #
 # Detailed VFIO devices migration statistics
 #
-# @transferred: amount of bytes transferred to the target VM by VFIO devices
+# @transferred: amount of bytes transferred to the target VM by VFIO
+#     devices
 #
 # Since: 5.2
 ##
@@ -180,67 +188,67 @@
 # Information about current migration process.
 #
 # @status: @MigrationStatus describing the current migration status.
-#          If this field is not returned, no migration process
-#          has been initiated
+#     If this field is not returned, no migration process has been
+#     initiated
 #
-# @ram: @MigrationStats containing detailed migration
-#       status, only returned if status is 'active' or
-#       'completed'(since 1.2)
+# @ram: @MigrationStats containing detailed migration status, only
+#     returned if status is 'active' or 'completed'(since 1.2)
 #
-# @disk: @MigrationStats containing detailed disk migration
-#        status, only returned if status is 'active' and it is a block
-#        migration
+# @disk: @MigrationStats containing detailed disk migration status,
+#     only returned if status is 'active' and it is a block migration
 #
 # @xbzrle-cache: @XBZRLECacheStats containing detailed XBZRLE
-#                migration statistics, only returned if XBZRLE feature is on and
-#                status is 'active' or 'completed' (since 1.2)
+#     migration statistics, only returned if XBZRLE feature is on and
+#     status is 'active' or 'completed' (since 1.2)
 #
 # @total-time: total amount of milliseconds since migration started.
-#              If migration has ended, it returns the total migration
-#              time. (since 1.2)
+#     If migration has ended, it returns the total migration time.
+#     (since 1.2)
 #
-# @downtime: only present when migration finishes correctly
-#            total downtime in milliseconds for the guest.
-#            (since 1.3)
+# @downtime: only present when migration finishes correctly total
+#     downtime in milliseconds for the guest.  (since 1.3)
 #
-# @expected-downtime: only present while migration is active
-#                     expected downtime in milliseconds for the guest in last walk
-#                     of the dirty bitmap. (since 1.3)
+# @expected-downtime: only present while migration is active expected
+#     downtime in milliseconds for the guest in last walk of the dirty
+#     bitmap.  (since 1.3)
 #
 # @setup-time: amount of setup time in milliseconds *before* the
-#              iterations begin but *after* the QMP command is issued. This is designed
-#              to provide an accounting of any activities (such as RDMA pinning) which
-#              may be expensive, but do not actually occur during the iterative
-#              migration rounds themselves. (since 1.6)
+#     iterations begin but *after* the QMP command is issued.  This is
+#     designed to provide an accounting of any activities (such as
+#     RDMA pinning) which may be expensive, but do not actually occur
+#     during the iterative migration rounds themselves.  (since 1.6)
 #
 # @cpu-throttle-percentage: percentage of time guest cpus are being
-#                           throttled during auto-converge. This is only present when auto-converge
-#                           has started throttling guest cpus. (Since 2.7)
+#     throttled during auto-converge.  This is only present when
+#     auto-converge has started throttling guest cpus.  (Since 2.7)
 #
 # @error-desc: the human readable error description string, when
-#              @status is 'failed'. Clients should not attempt to parse the
-#              error strings. (Since 2.7)
+#     @status is 'failed'. Clients should not attempt to parse the
+#     error strings.  (Since 2.7)
 #
-# @postcopy-blocktime: total time when all vCPU were blocked during postcopy
-#                      live migration. This is only present when the postcopy-blocktime
-#                      migration capability is enabled. (Since 3.0)
+# @postcopy-blocktime: total time when all vCPU were blocked during
+#     postcopy live migration.  This is only present when the
+#     postcopy-blocktime migration capability is enabled.  (Since 3.0)
 #
-# @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
-#                           only present when the postcopy-blocktime migration capability
-#                           is enabled. (Since 3.0)
+# @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.
+#     This is only present when the postcopy-blocktime migration
+#     capability is enabled.  (Since 3.0)
 #
-# @compression: migration compression statistics, only returned if compression
-#               feature is on and status is 'active' or 'completed' (Since 3.1)
+# @compression: migration compression statistics, only returned if
+#     compression feature is on and status is 'active' or 'completed'
+#     (Since 3.1)
 #
-# @socket-address: Only used for tcp, to know what the real port is (Since 4.0)
+# @socket-address: Only used for tcp, to know what the real port is
+#     (Since 4.0)
 #
-# @vfio: @VfioStats containing detailed VFIO devices migration statistics,
-#        only returned if VFIO device is present, migration is supported by all
-#        VFIO devices and status is 'active' or 'completed' (since 5.2)
+# @vfio: @VfioStats containing detailed VFIO devices migration
+#     statistics, only returned if VFIO device is present, migration
+#     is supported by all VFIO devices and status is 'active' or
+#     'completed' (since 5.2)
 #
-# @blocked-reasons: A list of reasons an outgoing migration is blocked.
-#                   Present and non-empty when migration is blocked.
-#                   (since 6.0)
+# @blocked-reasons: A list of reasons an outgoing migration is
+#     blocked.  Present and non-empty when migration is blocked.
+#     (since 6.0)
 #
 # Since: 0.14
 ##
@@ -264,7 +272,7 @@
 ##
 # @query-migrate:
 #
-# Returns information about current migration process. If migration
+# Returns information about current migration process.  If migration
 # is active there will be another json-object with RAM migration
 # status and if block migration is active another one with block
 # migration status.
@@ -381,7 +389,6 @@
 #          }
 #       }
 #    }
-#
 ##
 { 'command': 'query-migrate', 'returns': 'MigrationInfo' }
 
@@ -390,95 +397,98 @@
 #
 # Migration capabilities enumeration
 #
-# @xbzrle: Migration supports xbzrle (Xor Based Zero Run Length Encoding).
-#          This feature allows us to minimize migration traffic for certain work
-#          loads, by sending compressed difference of the pages
+# @xbzrle: Migration supports xbzrle (Xor Based Zero Run Length
+#     Encoding). This feature allows us to minimize migration traffic
+#     for certain work loads, by sending compressed difference of the
+#     pages
 #
-# @rdma-pin-all: Controls whether or not the entire VM memory footprint is
-#                mlock()'d on demand or all at once. Refer to docs/rdma.txt for usage.
-#                Disabled by default. (since 2.0)
+# @rdma-pin-all: Controls whether or not the entire VM memory
+#     footprint is mlock()'d on demand or all at once.  Refer to
+#     docs/rdma.txt for usage.  Disabled by default.  (since 2.0)
 #
-# @zero-blocks: During storage migration encode blocks of zeroes efficiently. This
-#               essentially saves 1MB of zeroes per block on the wire. Enabling requires
-#               source and target VM to support this feature. To enable it is sufficient
-#               to enable the capability on the source VM. The feature is disabled by
-#               default. (since 1.6)
+# @zero-blocks: During storage migration encode blocks of zeroes
+#     efficiently.  This essentially saves 1MB of zeroes per block on
+#     the wire.  Enabling requires source and target VM to support
+#     this feature.  To enable it is sufficient to enable the
+#     capability on the source VM. The feature is disabled by default.
+#     (since 1.6)
 #
-# @compress: Use multiple compression threads to accelerate live migration.
-#            This feature can help to reduce the migration traffic, by sending
-#            compressed pages. Please note that if compress and xbzrle are both
-#            on, compress only takes effect in the ram bulk stage, after that,
-#            it will be disabled and only xbzrle takes effect, this can help to
-#            minimize migration traffic. The feature is disabled by default.
-#            (since 2.4 )
+# @compress: Use multiple compression threads to accelerate live
+#     migration.  This feature can help to reduce the migration
+#     traffic, by sending compressed pages.  Please note that if
+#     compress and xbzrle are both on, compress only takes effect in
+#     the ram bulk stage, after that, it will be disabled and only
+#     xbzrle takes effect, this can help to minimize migration
+#     traffic.  The feature is disabled by default.  (since 2.4 )
 #
-# @events: generate events for each migration state change
-#          (since 2.4 )
+# @events: generate events for each migration state change (since 2.4
+#     )
 #
-# @auto-converge: If enabled, QEMU will automatically throttle down the guest
-#                 to speed up convergence of RAM migration. (since 1.6)
+# @auto-converge: If enabled, QEMU will automatically throttle down
+#     the guest to speed up convergence of RAM migration.  (since 1.6)
 #
-# @postcopy-ram: Start executing on the migration target before all of RAM has
-#                been migrated, pulling the remaining pages along as needed. The
-#                capacity must have the same setting on both source and target
-#                or migration will not even start. NOTE: If the migration fails during
-#                postcopy the VM will fail.  (since 2.6)
+# @postcopy-ram: Start executing on the migration target before all of
+#     RAM has been migrated, pulling the remaining pages along as
+#     needed.  The capacity must have the same setting on both source
+#     and target or migration will not even start.  NOTE: If the
+#     migration fails during postcopy the VM will fail.  (since 2.6)
 #
-# @x-colo: If enabled, migration will never end, and the state of the VM on the
-#          primary side will be migrated continuously to the VM on secondary
-#          side, this process is called COarse-Grain LOck Stepping (COLO) for
-#          Non-stop Service. (since 2.8)
+# @x-colo: If enabled, migration will never end, and the state of the
+#     VM on the primary side will be migrated continuously to the VM
+#     on secondary side, this process is called COarse-Grain LOck
+#     Stepping (COLO) for Non-stop Service.  (since 2.8)
 #
-# @release-ram: if enabled, qemu will free the migrated ram pages on the source
-#               during postcopy-ram migration. (since 2.9)
+# @release-ram: if enabled, qemu will free the migrated ram pages on
+#     the source during postcopy-ram migration.  (since 2.9)
 #
 # @block: If enabled, QEMU will also migrate the contents of all block
-#         devices.  Default is disabled.  A possible alternative uses
-#         mirror jobs to a builtin NBD server on the destination, which
-#         offers more flexibility.
-#         (Since 2.10)
+#     devices.  Default is disabled.  A possible alternative uses
+#     mirror jobs to a builtin NBD server on the destination, which
+#     offers more flexibility.  (Since 2.10)
 #
 # @return-path: If enabled, migration will use the return path even
-#               for precopy. (since 2.10)
+#     for precopy.  (since 2.10)
 #
-# @pause-before-switchover: Pause outgoing migration before serialising device
-#                           state and before disabling block IO (since 2.11)
+# @pause-before-switchover: Pause outgoing migration before
+#     serialising device state and before disabling block IO (since
+#     2.11)
 #
 # @multifd: Use more than one fd for migration (since 4.0)
 #
 # @dirty-bitmaps: If enabled, QEMU will migrate named dirty bitmaps.
-#                 (since 2.12)
+#     (since 2.12)
 #
 # @postcopy-blocktime: Calculate downtime for postcopy live migration
-#                      (since 3.0)
+#     (since 3.0)
 #
-# @late-block-activate: If enabled, the destination will not activate block
-#                       devices (and thus take locks) immediately at the end of migration.
-#                       (since 3.0)
+# @late-block-activate: If enabled, the destination will not activate
+#     block devices (and thus take locks) immediately at the end of
+#     migration.  (since 3.0)
 #
-# @x-ignore-shared: If enabled, QEMU will not migrate shared memory (since 4.0)
+# @x-ignore-shared: If enabled, QEMU will not migrate shared memory
+#     (since 4.0)
 #
 # @validate-uuid: Send the UUID of the source to allow the destination
-#                 to ensure it is the same. (since 4.2)
+#     to ensure it is the same.  (since 4.2)
 #
-# @background-snapshot: If enabled, the migration stream will be a snapshot
-#                       of the VM exactly at the point when the migration
-#                       procedure starts. The VM RAM is saved with running VM.
-#                       (since 6.0)
+# @background-snapshot: If enabled, the migration stream will be a
+#     snapshot of the VM exactly at the point when the migration
+#     procedure starts.  The VM RAM is saved with running VM. (since
+#     6.0)
 #
-# @zero-copy-send: Controls behavior on sending memory pages on migration.
-#                  When true, enables a zero-copy mechanism for sending
-#                  memory pages, if host supports it.
-#                  Requires that QEMU be permitted to use locked memory
-#                  for guest RAM pages.
-#                  (since 7.1)
-# @postcopy-preempt: If enabled, the migration process will allow postcopy
-#                    requests to preempt precopy stream, so postcopy requests
-#                    will be handled faster.  This is a performance feature and
-#                    should not affect the correctness of postcopy migration.
-#                    (since 7.1)
+# @zero-copy-send: Controls behavior on sending memory pages on
+#     migration.  When true, enables a zero-copy mechanism for sending
+#     memory pages, if host supports it.  Requires that QEMU be
+#     permitted to use locked memory for guest RAM pages.  (since 7.1)
+#
+# @postcopy-preempt: If enabled, the migration process will allow
+#     postcopy requests to preempt precopy stream, so postcopy
+#     requests will be handled faster.  This is a performance feature
+#     and should not affect the correctness of postcopy migration.
+#     (since 7.1)
 #
 # Features:
+#
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
 # Since: 1.2
@@ -522,7 +532,6 @@
 # -> { "execute": "migrate-set-capabilities" , "arguments":
 #      { "capabilities": [ { "capability": "xbzrle", "state": true } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate-set-capabilities',
   'data': { 'capabilities': ['MigrationCapabilityStatus'] } }
@@ -549,7 +558,6 @@
 #       {"state": false, "capability": "postcopy-ram"},
 #       {"state": false, "capability": "x-colo"}
 #    ]}
-#
 ##
 { 'command': 'query-migrate-capabilities', 'returns':   ['MigrationCapabilityStatus']}
 
@@ -559,7 +567,9 @@
 # An enumeration of multifd compression methods.
 #
 # @none: no compression.
+#
 # @zlib: use zlib compression method.
+#
 # @zstd: use zstd compression method.
 #
 # Since: 5.0
@@ -571,8 +581,8 @@
 ##
 # @BitmapMigrationBitmapAliasTransform:
 #
-# @persistent: If present, the bitmap will be made persistent
-#              or transient depending on this parameter.
+# @persistent: If present, the bitmap will be made persistent or
+#     transient depending on this parameter.
 #
 # Since: 6.0
 ##
@@ -587,10 +597,10 @@
 # @name: The name of the bitmap.
 #
 # @alias: An alias name for migration (for example the bitmap name on
-#         the opposite site).
+#     the opposite site).
 #
-# @transform: Allows the modification of the migrated bitmap.
-#             (since 6.0)
+# @transform: Allows the modification of the migrated bitmap.  (since
+#     6.0)
 #
 # Since: 5.2
 ##
@@ -609,8 +619,8 @@
 #
 # @node-name: A block node name.
 #
-# @alias: An alias block node name for migration (for example the
-#         node name on the opposite site).
+# @alias: An alias block node name for migration (for example the node
+#     name on the opposite site).
 #
 # @bitmaps: Mappings for the bitmaps on this node.
 #
@@ -628,156 +638,149 @@
 #
 # Migration parameters enumeration
 #
-# @announce-initial: Initial delay (in milliseconds) before sending the first
-#                    announce (Since 4.0)
+# @announce-initial: Initial delay (in milliseconds) before sending
+#     the first announce (Since 4.0)
 #
-# @announce-max: Maximum delay (in milliseconds) between packets in the
-#                announcement (Since 4.0)
+# @announce-max: Maximum delay (in milliseconds) between packets in
+#     the announcement (Since 4.0)
 #
-# @announce-rounds: Number of self-announce packets sent after migration
-#                   (Since 4.0)
+# @announce-rounds: Number of self-announce packets sent after
+#     migration (Since 4.0)
 #
-# @announce-step: Increase in delay (in milliseconds) between subsequent
-#                 packets in the announcement (Since 4.0)
+# @announce-step: Increase in delay (in milliseconds) between
+#     subsequent packets in the announcement (Since 4.0)
 #
-# @compress-level: Set the compression level to be used in live migration,
-#                  the compression level is an integer between 0 and 9, where 0 means
-#                  no compression, 1 means the best compression speed, and 9 means best
-#                  compression ratio which will consume more CPU.
+# @compress-level: Set the compression level to be used in live
+#     migration, the compression level is an integer between 0 and 9,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 9 means best compression ratio which will consume
+#     more CPU.
 #
-# @compress-threads: Set compression thread count to be used in live migration,
-#                    the compression thread count is an integer between 1 and 255.
+# @compress-threads: Set compression thread count to be used in live
+#     migration, the compression thread count is an integer between 1
+#     and 255.
 #
-# @compress-wait-thread: Controls behavior when all compression threads are
-#                        currently busy. If true (default), wait for a free
-#                        compression thread to become available; otherwise,
-#                        send the page uncompressed. (Since 3.1)
+# @compress-wait-thread: Controls behavior when all compression
+#     threads are currently busy.  If true (default), wait for a free
+#     compression thread to become available; otherwise, send the page
+#     uncompressed.  (Since 3.1)
 #
-# @decompress-threads: Set decompression thread count to be used in live
-#                      migration, the decompression thread count is an integer between 1
-#                      and 255. Usually, decompression is at least 4 times as fast as
-#                      compression, so set the decompress-threads to the number about 1/4
-#                      of compress-threads is adequate.
+# @decompress-threads: Set decompression thread count to be used in
+#     live migration, the decompression thread count is an integer
+#     between 1 and 255. Usually, decompression is at least 4 times as
+#     fast as compression, so set the decompress-threads to the number
+#     about 1/4 of compress-threads is adequate.
 #
-# @throttle-trigger-threshold: The ratio of bytes_dirty_period and bytes_xfer_period
-#                              to trigger throttling. It is expressed as percentage.
-#                              The default value is 50. (Since 5.0)
+# @throttle-trigger-threshold: The ratio of bytes_dirty_period and
+#     bytes_xfer_period to trigger throttling.  It is expressed as
+#     percentage.  The default value is 50. (Since 5.0)
 #
-# @cpu-throttle-initial: Initial percentage of time guest cpus are throttled
-#                        when migration auto-converge is activated. The
-#                        default value is 20. (Since 2.7)
+# @cpu-throttle-initial: Initial percentage of time guest cpus are
+#     throttled when migration auto-converge is activated.  The
+#     default value is 20. (Since 2.7)
 #
 # @cpu-throttle-increment: throttle percentage increase each time
-#                          auto-converge detects that migration is not making
-#                          progress. The default value is 10. (Since 2.7)
+#     auto-converge detects that migration is not making progress.
+#     The default value is 10. (Since 2.7)
 #
-# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
-#                         At the tail stage of throttling, the Guest is very
-#                         sensitive to CPU percentage while the @cpu-throttle
-#                         -increment is excessive usually at tail stage.
-#                         If this parameter is true, we will compute the ideal
-#                         CPU percentage used by the Guest, which may exactly make
-#                         the dirty rate match the dirty rate threshold. Then we
-#                         will choose a smaller throttle increment between the
-#                         one specified by @cpu-throttle-increment and the one
-#                         generated by ideal CPU percentage.
-#                         Therefore, it is compatible to traditional throttling,
-#                         meanwhile the throttle increment won't be excessive
-#                         at tail stage.
-#                         The default value is false. (Since 5.1)
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage At
+#     the tail stage of throttling, the Guest is very sensitive to CPU
+#     percentage while the @cpu-throttle -increment is excessive
+#     usually at tail stage.  If this parameter is true, we will
+#     compute the ideal CPU percentage used by the Guest, which may
+#     exactly make the dirty rate match the dirty rate threshold.
+#     Then we will choose a smaller throttle increment between the one
+#     specified by @cpu-throttle-increment and the one generated by
+#     ideal CPU percentage.  Therefore, it is compatible to
+#     traditional throttling, meanwhile the throttle increment won't
+#     be excessive at tail stage.  The default value is false.  (Since
+#     5.1)
 #
-# @tls-creds: ID of the 'tls-creds' object that provides credentials for
-#             establishing a TLS connection over the migration data channel.
-#             On the outgoing side of the migration, the credentials must
-#             be for a 'client' endpoint, while for the incoming side the
-#             credentials must be for a 'server' endpoint. Setting this
-#             will enable TLS for all migrations. The default is unset,
-#             resulting in unsecured migration at the QEMU level. (Since 2.7)
+# @tls-creds: ID of the 'tls-creds' object that provides credentials
+#     for establishing a TLS connection over the migration data
+#     channel.  On the outgoing side of the migration, the credentials
+#     must be for a 'client' endpoint, while for the incoming side the
+#     credentials must be for a 'server' endpoint.  Setting this will
+#     enable TLS for all migrations.  The default is unset, resulting
+#     in unsecured migration at the QEMU level.  (Since 2.7)
 #
-# @tls-hostname: hostname of the target host for the migration. This is
-#                required when using x509 based TLS credentials and the
-#                migration URI does not already include a hostname. For
-#                example if using fd: or exec: based migration, the
-#                hostname must be provided so that the server's x509
-#                certificate identity can be validated. (Since 2.7)
+# @tls-hostname: hostname of the target host for the migration.  This
+#     is required when using x509 based TLS credentials and the
+#     migration URI does not already include a hostname.  For example
+#     if using fd: or exec: based migration, the hostname must be
+#     provided so that the server's x509 certificate identity can be
+#     validated.  (Since 2.7)
 #
-# @tls-authz: ID of the 'authz' object subclass that provides access control
-#             checking of the TLS x509 certificate distinguished name.
-#             This object is only resolved at time of use, so can be deleted
-#             and recreated on the fly while the migration server is active.
-#             If missing, it will default to denying access (Since 4.0)
+# @tls-authz: ID of the 'authz' object subclass that provides access
+#     control checking of the TLS x509 certificate distinguished name.
+#     This object is only resolved at time of use, so can be deleted
+#     and recreated on the fly while the migration server is active.
+#     If missing, it will default to denying access (Since 4.0)
 #
-# @max-bandwidth: to set maximum speed for migration. maximum speed in
-#                 bytes per second. (Since 2.8)
+# @max-bandwidth: to set maximum speed for migration.  maximum speed
+#     in bytes per second.  (Since 2.8)
 #
-# @downtime-limit: set maximum tolerated downtime for migration. maximum
-#                  downtime in milliseconds (Since 2.8)
+# @downtime-limit: set maximum tolerated downtime for migration.
+#     maximum downtime in milliseconds (Since 2.8)
 #
-# @x-checkpoint-delay: The delay time (in ms) between two COLO checkpoints in
-#                      periodic mode. (Since 2.8)
+# @x-checkpoint-delay: The delay time (in ms) between two COLO
+#     checkpoints in periodic mode.  (Since 2.8)
 #
 # @block-incremental: Affects how much storage is migrated when the
-#                     block migration capability is enabled.  When false, the entire
-#                     storage backing chain is migrated into a flattened image at
-#                     the destination; when true, only the active qcow2 layer is
-#                     migrated and the destination must already have access to the
-#                     same backing chain as was used on the source.  (since 2.10)
+#     block migration capability is enabled.  When false, the entire
+#     storage backing chain is migrated into a flattened image at the
+#     destination; when true, only the active qcow2 layer is migrated
+#     and the destination must already have access to the same backing
+#     chain as was used on the source.  (since 2.10)
 #
 # @multifd-channels: Number of channels used to migrate data in
-#                    parallel. This is the same number that the
-#                    number of sockets used for migration.  The
-#                    default value is 2 (since 4.0)
+#     parallel.  This is the same number that the number of sockets
+#     used for migration.  The default value is 2 (since 4.0)
 #
 # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
-#                     needs to be a multiple of the target page size
-#                     and a power of 2
-#                     (Since 2.11)
+#     needs to be a multiple of the target page size and a power of 2
+#     (Since 2.11)
 #
-# @max-postcopy-bandwidth: Background transfer bandwidth during postcopy.
-#                          Defaults to 0 (unlimited).  In bytes per second.
-#                          (Since 3.0)
+# @max-postcopy-bandwidth: Background transfer bandwidth during
+#     postcopy.  Defaults to 0 (unlimited).  In bytes per second.
+#     (Since 3.0)
 #
-# @max-cpu-throttle: maximum cpu throttle percentage.
-#                    Defaults to 99. (Since 3.1)
+# @max-cpu-throttle: maximum cpu throttle percentage.  Defaults to 99.
+#     (Since 3.1)
 #
-# @multifd-compression: Which compression method to use.
-#                       Defaults to none. (Since 5.0)
+# @multifd-compression: Which compression method to use.  Defaults to
+#     none.  (Since 5.0)
 #
 # @multifd-zlib-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 9, where 0 means no compression, 1 means the best
-#                      compression speed, and 9 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
+#     migration, the compression level is an integer between 0 and 9,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 9 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @multifd-zstd-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 20, where 0 means no compression, 1 means the best
-#                      compression speed, and 20 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
-#
+#     migration, the compression level is an integer between 0 and 20,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 20 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
-#                        aliases for the purpose of dirty bitmap migration.  Such
-#                        aliases may for example be the corresponding names on the
-#                        opposite site.
-#                        The mapping must be one-to-one, but not necessarily
-#                        complete: On the source, unmapped bitmaps and all bitmaps
-#                        on unmapped nodes will be ignored.  On the destination,
-#                        encountering an unmapped alias in the incoming migration
-#                        stream will result in a report, and all further bitmap
-#                        migration data will then be discarded.
-#                        Note that the destination does not know about bitmaps it
-#                        does not receive, so there is no limitation or requirement
-#                        regarding the number of bitmaps received, or how they are
-#                        named, or on which nodes they are placed.
-#                        By default (when this parameter has never been set), bitmap
-#                        names are mapped to themselves.  Nodes are mapped to their
-#                        block device name if there is one, and to their node name
-#                        otherwise. (Since 5.2)
+#     aliases for the purpose of dirty bitmap migration.  Such aliases
+#     may for example be the corresponding names on the opposite site.
+#     The mapping must be one-to-one, but not necessarily complete: On
+#     the source, unmapped bitmaps and all bitmaps on unmapped nodes
+#     will be ignored.  On the destination, encountering an unmapped
+#     alias in the incoming migration stream will result in a report,
+#     and all further bitmap migration data will then be discarded.
+#     Note that the destination does not know about bitmaps it does
+#     not receive, so there is no limitation or requirement regarding
+#     the number of bitmaps received, or how they are named, or on
+#     which nodes they are placed.  By default (when this parameter
+#     has never been set), bitmap names are mapped to themselves.
+#     Nodes are mapped to their block device name if there is one, and
+#     to their node name otherwise.  (Since 5.2)
 #
 # Features:
+#
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
 # Since: 2.4
@@ -802,151 +805,142 @@
 ##
 # @MigrateSetParameters:
 #
-# @announce-initial: Initial delay (in milliseconds) before sending the first
-#                    announce (Since 4.0)
+# @announce-initial: Initial delay (in milliseconds) before sending
+#     the first announce (Since 4.0)
 #
-# @announce-max: Maximum delay (in milliseconds) between packets in the
-#                announcement (Since 4.0)
+# @announce-max: Maximum delay (in milliseconds) between packets in
+#     the announcement (Since 4.0)
 #
-# @announce-rounds: Number of self-announce packets sent after migration
-#                   (Since 4.0)
+# @announce-rounds: Number of self-announce packets sent after
+#     migration (Since 4.0)
 #
-# @announce-step: Increase in delay (in milliseconds) between subsequent
-#                 packets in the announcement (Since 4.0)
+# @announce-step: Increase in delay (in milliseconds) between
+#     subsequent packets in the announcement (Since 4.0)
 #
 # @compress-level: compression level
 #
 # @compress-threads: compression thread count
 #
-# @compress-wait-thread: Controls behavior when all compression threads are
-#                        currently busy. If true (default), wait for a free
-#                        compression thread to become available; otherwise,
-#                        send the page uncompressed. (Since 3.1)
+# @compress-wait-thread: Controls behavior when all compression
+#     threads are currently busy.  If true (default), wait for a free
+#     compression thread to become available; otherwise, send the page
+#     uncompressed.  (Since 3.1)
 #
 # @decompress-threads: decompression thread count
 #
-# @throttle-trigger-threshold: The ratio of bytes_dirty_period and bytes_xfer_period
-#                              to trigger throttling. It is expressed as percentage.
-#                              The default value is 50. (Since 5.0)
+# @throttle-trigger-threshold: The ratio of bytes_dirty_period and
+#     bytes_xfer_period to trigger throttling.  It is expressed as
+#     percentage.  The default value is 50. (Since 5.0)
 #
 # @cpu-throttle-initial: Initial percentage of time guest cpus are
-#                        throttled when migration auto-converge is activated.
-#                        The default value is 20. (Since 2.7)
+#     throttled when migration auto-converge is activated.  The
+#     default value is 20. (Since 2.7)
 #
 # @cpu-throttle-increment: throttle percentage increase each time
-#                          auto-converge detects that migration is not making
-#                          progress. The default value is 10. (Since 2.7)
+#     auto-converge detects that migration is not making progress.
+#     The default value is 10. (Since 2.7)
 #
-# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
-#                         At the tail stage of throttling, the Guest is very
-#                         sensitive to CPU percentage while the @cpu-throttle
-#                         -increment is excessive usually at tail stage.
-#                         If this parameter is true, we will compute the ideal
-#                         CPU percentage used by the Guest, which may exactly make
-#                         the dirty rate match the dirty rate threshold. Then we
-#                         will choose a smaller throttle increment between the
-#                         one specified by @cpu-throttle-increment and the one
-#                         generated by ideal CPU percentage.
-#                         Therefore, it is compatible to traditional throttling,
-#                         meanwhile the throttle increment won't be excessive
-#                         at tail stage.
-#                         The default value is false. (Since 5.1)
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage At
+#     the tail stage of throttling, the Guest is very sensitive to CPU
+#     percentage while the @cpu-throttle -increment is excessive
+#     usually at tail stage.  If this parameter is true, we will
+#     compute the ideal CPU percentage used by the Guest, which may
+#     exactly make the dirty rate match the dirty rate threshold.
+#     Then we will choose a smaller throttle increment between the one
+#     specified by @cpu-throttle-increment and the one generated by
+#     ideal CPU percentage.  Therefore, it is compatible to
+#     traditional throttling, meanwhile the throttle increment won't
+#     be excessive at tail stage.  The default value is false.  (Since
+#     5.1)
 #
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
-#             for establishing a TLS connection over the migration data
-#             channel. On the outgoing side of the migration, the credentials
-#             must be for a 'client' endpoint, while for the incoming side the
-#             credentials must be for a 'server' endpoint. Setting this
-#             to a non-empty string enables TLS for all migrations.
-#             An empty string means that QEMU will use plain text mode for
-#             migration, rather than TLS (Since 2.9)
-#             Previously (since 2.7), this was reported by omitting
-#             tls-creds instead.
+#     for establishing a TLS connection over the migration data
+#     channel.  On the outgoing side of the migration, the credentials
+#     must be for a 'client' endpoint, while for the incoming side the
+#     credentials must be for a 'server' endpoint.  Setting this to a
+#     non-empty string enables TLS for all migrations.  An empty
+#     string means that QEMU will use plain text mode for migration,
+#     rather than TLS (Since 2.9) Previously (since 2.7), this was
+#     reported by omitting tls-creds instead.
 #
-# @tls-hostname: hostname of the target host for the migration. This
-#                is required when using x509 based TLS credentials and the
-#                migration URI does not already include a hostname. For
-#                example if using fd: or exec: based migration, the
-#                hostname must be provided so that the server's x509
-#                certificate identity can be validated. (Since 2.7)
-#                An empty string means that QEMU will use the hostname
-#                associated with the migration URI, if any. (Since 2.9)
-#                Previously (since 2.7), this was reported by omitting
-#                tls-hostname instead.
+# @tls-hostname: hostname of the target host for the migration.  This
+#     is required when using x509 based TLS credentials and the
+#     migration URI does not already include a hostname.  For example
+#     if using fd: or exec: based migration, the hostname must be
+#     provided so that the server's x509 certificate identity can be
+#     validated.  (Since 2.7) An empty string means that QEMU will use
+#     the hostname associated with the migration URI, if any.  (Since
+#     2.9) Previously (since 2.7), this was reported by omitting
+#     tls-hostname instead.
 #
-# @max-bandwidth: to set maximum speed for migration. maximum speed in
-#                 bytes per second. (Since 2.8)
+# @max-bandwidth: to set maximum speed for migration.  maximum speed
+#     in bytes per second.  (Since 2.8)
 #
-# @downtime-limit: set maximum tolerated downtime for migration. maximum
-#                  downtime in milliseconds (Since 2.8)
+# @downtime-limit: set maximum tolerated downtime for migration.
+#     maximum downtime in milliseconds (Since 2.8)
 #
-# @x-checkpoint-delay: the delay time between two COLO checkpoints. (Since 2.8)
+# @x-checkpoint-delay: the delay time between two COLO checkpoints.
+#     (Since 2.8)
 #
 # @block-incremental: Affects how much storage is migrated when the
-#                     block migration capability is enabled.  When false, the entire
-#                     storage backing chain is migrated into a flattened image at
-#                     the destination; when true, only the active qcow2 layer is
-#                     migrated and the destination must already have access to the
-#                     same backing chain as was used on the source.  (since 2.10)
+#     block migration capability is enabled.  When false, the entire
+#     storage backing chain is migrated into a flattened image at the
+#     destination; when true, only the active qcow2 layer is migrated
+#     and the destination must already have access to the same backing
+#     chain as was used on the source.  (since 2.10)
 #
 # @multifd-channels: Number of channels used to migrate data in
-#                    parallel. This is the same number that the
-#                    number of sockets used for migration.  The
-#                    default value is 2 (since 4.0)
+#     parallel.  This is the same number that the number of sockets
+#     used for migration.  The default value is 2 (since 4.0)
 #
 # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
-#                     needs to be a multiple of the target page size
-#                     and a power of 2
-#                     (Since 2.11)
+#     needs to be a multiple of the target page size and a power of 2
+#     (Since 2.11)
 #
-# @max-postcopy-bandwidth: Background transfer bandwidth during postcopy.
-#                          Defaults to 0 (unlimited).  In bytes per second.
-#                          (Since 3.0)
+# @max-postcopy-bandwidth: Background transfer bandwidth during
+#     postcopy.  Defaults to 0 (unlimited).  In bytes per second.
+#     (Since 3.0)
 #
-# @max-cpu-throttle: maximum cpu throttle percentage.
-#                    The default value is 99. (Since 3.1)
+# @max-cpu-throttle: maximum cpu throttle percentage.  The default
+#     value is 99. (Since 3.1)
 #
-# @multifd-compression: Which compression method to use.
-#                       Defaults to none. (Since 5.0)
+# @multifd-compression: Which compression method to use.  Defaults to
+#     none.  (Since 5.0)
 #
 # @multifd-zlib-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 9, where 0 means no compression, 1 means the best
-#                      compression speed, and 9 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
+#     migration, the compression level is an integer between 0 and 9,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 9 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @multifd-zstd-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 20, where 0 means no compression, 1 means the best
-#                      compression speed, and 20 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
+#     migration, the compression level is an integer between 0 and 20,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 20 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
-#                        aliases for the purpose of dirty bitmap migration.  Such
-#                        aliases may for example be the corresponding names on the
-#                        opposite site.
-#                        The mapping must be one-to-one, but not necessarily
-#                        complete: On the source, unmapped bitmaps and all bitmaps
-#                        on unmapped nodes will be ignored.  On the destination,
-#                        encountering an unmapped alias in the incoming migration
-#                        stream will result in a report, and all further bitmap
-#                        migration data will then be discarded.
-#                        Note that the destination does not know about bitmaps it
-#                        does not receive, so there is no limitation or requirement
-#                        regarding the number of bitmaps received, or how they are
-#                        named, or on which nodes they are placed.
-#                        By default (when this parameter has never been set), bitmap
-#                        names are mapped to themselves.  Nodes are mapped to their
-#                        block device name if there is one, and to their node name
-#                        otherwise. (Since 5.2)
+#     aliases for the purpose of dirty bitmap migration.  Such aliases
+#     may for example be the corresponding names on the opposite site.
+#     The mapping must be one-to-one, but not necessarily complete: On
+#     the source, unmapped bitmaps and all bitmaps on unmapped nodes
+#     will be ignored.  On the destination, encountering an unmapped
+#     alias in the incoming migration stream will result in a report,
+#     and all further bitmap migration data will then be discarded.
+#     Note that the destination does not know about bitmaps it does
+#     not receive, so there is no limitation or requirement regarding
+#     the number of bitmaps received, or how they are named, or on
+#     which nodes they are placed.  By default (when this parameter
+#     has never been set), bitmap names are mapped to themselves.
+#     Nodes are mapped to their block device name if there is one, and
+#     to their node name otherwise.  (Since 5.2)
 #
 # Features:
+#
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
 # TODO: either fuse back into MigrationParameters, or make
-#       MigrationParameters members mandatory
+#     MigrationParameters members mandatory
 #
 # Since: 2.4
 ##
@@ -992,7 +986,6 @@
 # -> { "execute": "migrate-set-parameters" ,
 #      "arguments": { "compress-level": 1 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate-set-parameters', 'boxed': true,
   'data': 'MigrateSetParameters' }
@@ -1002,149 +995,140 @@
 #
 # The optional members aren't actually optional.
 #
-# @announce-initial: Initial delay (in milliseconds) before sending the
-#                    first announce (Since 4.0)
+# @announce-initial: Initial delay (in milliseconds) before sending
+#     the first announce (Since 4.0)
 #
-# @announce-max: Maximum delay (in milliseconds) between packets in the
-#                announcement (Since 4.0)
+# @announce-max: Maximum delay (in milliseconds) between packets in
+#     the announcement (Since 4.0)
 #
-# @announce-rounds: Number of self-announce packets sent after migration
-#                   (Since 4.0)
+# @announce-rounds: Number of self-announce packets sent after
+#     migration (Since 4.0)
 #
-# @announce-step: Increase in delay (in milliseconds) between subsequent
-#                 packets in the announcement (Since 4.0)
+# @announce-step: Increase in delay (in milliseconds) between
+#     subsequent packets in the announcement (Since 4.0)
 #
 # @compress-level: compression level
 #
 # @compress-threads: compression thread count
 #
-# @compress-wait-thread: Controls behavior when all compression threads are
-#                        currently busy. If true (default), wait for a free
-#                        compression thread to become available; otherwise,
-#                        send the page uncompressed. (Since 3.1)
+# @compress-wait-thread: Controls behavior when all compression
+#     threads are currently busy.  If true (default), wait for a free
+#     compression thread to become available; otherwise, send the page
+#     uncompressed.  (Since 3.1)
 #
 # @decompress-threads: decompression thread count
 #
-# @throttle-trigger-threshold: The ratio of bytes_dirty_period and bytes_xfer_period
-#                              to trigger throttling. It is expressed as percentage.
-#                              The default value is 50. (Since 5.0)
+# @throttle-trigger-threshold: The ratio of bytes_dirty_period and
+#     bytes_xfer_period to trigger throttling.  It is expressed as
+#     percentage.  The default value is 50. (Since 5.0)
 #
 # @cpu-throttle-initial: Initial percentage of time guest cpus are
-#                        throttled when migration auto-converge is activated.
-#                        (Since 2.7)
+#     throttled when migration auto-converge is activated.  (Since
+#     2.7)
 #
 # @cpu-throttle-increment: throttle percentage increase each time
-#                          auto-converge detects that migration is not making
-#                          progress. (Since 2.7)
+#     auto-converge detects that migration is not making progress.
+#     (Since 2.7)
 #
-# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
-#                         At the tail stage of throttling, the Guest is very
-#                         sensitive to CPU percentage while the @cpu-throttle
-#                         -increment is excessive usually at tail stage.
-#                         If this parameter is true, we will compute the ideal
-#                         CPU percentage used by the Guest, which may exactly make
-#                         the dirty rate match the dirty rate threshold. Then we
-#                         will choose a smaller throttle increment between the
-#                         one specified by @cpu-throttle-increment and the one
-#                         generated by ideal CPU percentage.
-#                         Therefore, it is compatible to traditional throttling,
-#                         meanwhile the throttle increment won't be excessive
-#                         at tail stage.
-#                         The default value is false. (Since 5.1)
+# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage At
+#     the tail stage of throttling, the Guest is very sensitive to CPU
+#     percentage while the @cpu-throttle -increment is excessive
+#     usually at tail stage.  If this parameter is true, we will
+#     compute the ideal CPU percentage used by the Guest, which may
+#     exactly make the dirty rate match the dirty rate threshold.
+#     Then we will choose a smaller throttle increment between the one
+#     specified by @cpu-throttle-increment and the one generated by
+#     ideal CPU percentage.  Therefore, it is compatible to
+#     traditional throttling, meanwhile the throttle increment won't
+#     be excessive at tail stage.  The default value is false.  (Since
+#     5.1)
 #
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
-#             for establishing a TLS connection over the migration data
-#             channel. On the outgoing side of the migration, the credentials
-#             must be for a 'client' endpoint, while for the incoming side the
-#             credentials must be for a 'server' endpoint.
-#             An empty string means that QEMU will use plain text mode for
-#             migration, rather than TLS (Since 2.7)
-#             Note: 2.8 reports this by omitting tls-creds instead.
+#     for establishing a TLS connection over the migration data
+#     channel.  On the outgoing side of the migration, the credentials
+#     must be for a 'client' endpoint, while for the incoming side the
+#     credentials must be for a 'server' endpoint.  An empty string
+#     means that QEMU will use plain text mode for migration, rather
+#     than TLS (Since 2.7) Note: 2.8 reports this by omitting
+#     tls-creds instead.
 #
-# @tls-hostname: hostname of the target host for the migration. This
-#                is required when using x509 based TLS credentials and the
-#                migration URI does not already include a hostname. For
-#                example if using fd: or exec: based migration, the
-#                hostname must be provided so that the server's x509
-#                certificate identity can be validated. (Since 2.7)
-#                An empty string means that QEMU will use the hostname
-#                associated with the migration URI, if any. (Since 2.9)
-#                Note: 2.8 reports this by omitting tls-hostname instead.
+# @tls-hostname: hostname of the target host for the migration.  This
+#     is required when using x509 based TLS credentials and the
+#     migration URI does not already include a hostname.  For example
+#     if using fd: or exec: based migration, the hostname must be
+#     provided so that the server's x509 certificate identity can be
+#     validated.  (Since 2.7) An empty string means that QEMU will use
+#     the hostname associated with the migration URI, if any.  (Since
+#     2.9) Note: 2.8 reports this by omitting tls-hostname instead.
 #
-# @tls-authz: ID of the 'authz' object subclass that provides access control
-#             checking of the TLS x509 certificate distinguished name. (Since
-#             4.0)
+# @tls-authz: ID of the 'authz' object subclass that provides access
+#     control checking of the TLS x509 certificate distinguished name.
+#     (Since 4.0)
 #
-# @max-bandwidth: to set maximum speed for migration. maximum speed in
-#                 bytes per second. (Since 2.8)
+# @max-bandwidth: to set maximum speed for migration.  maximum speed
+#     in bytes per second.  (Since 2.8)
 #
-# @downtime-limit: set maximum tolerated downtime for migration. maximum
-#                  downtime in milliseconds (Since 2.8)
+# @downtime-limit: set maximum tolerated downtime for migration.
+#     maximum downtime in milliseconds (Since 2.8)
 #
-# @x-checkpoint-delay: the delay time between two COLO checkpoints. (Since 2.8)
+# @x-checkpoint-delay: the delay time between two COLO checkpoints.
+#     (Since 2.8)
 #
 # @block-incremental: Affects how much storage is migrated when the
-#                     block migration capability is enabled.  When false, the entire
-#                     storage backing chain is migrated into a flattened image at
-#                     the destination; when true, only the active qcow2 layer is
-#                     migrated and the destination must already have access to the
-#                     same backing chain as was used on the source.  (since 2.10)
+#     block migration capability is enabled.  When false, the entire
+#     storage backing chain is migrated into a flattened image at the
+#     destination; when true, only the active qcow2 layer is migrated
+#     and the destination must already have access to the same backing
+#     chain as was used on the source.  (since 2.10)
 #
 # @multifd-channels: Number of channels used to migrate data in
-#                    parallel. This is the same number that the
-#                    number of sockets used for migration.
-#                    The default value is 2 (since 4.0)
+#     parallel.  This is the same number that the number of sockets
+#     used for migration.  The default value is 2 (since 4.0)
 #
 # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
-#                     needs to be a multiple of the target page size
-#                     and a power of 2
-#                     (Since 2.11)
+#     needs to be a multiple of the target page size and a power of 2
+#     (Since 2.11)
 #
-# @max-postcopy-bandwidth: Background transfer bandwidth during postcopy.
-#                          Defaults to 0 (unlimited).  In bytes per second.
-#                          (Since 3.0)
+# @max-postcopy-bandwidth: Background transfer bandwidth during
+#     postcopy.  Defaults to 0 (unlimited).  In bytes per second.
+#     (Since 3.0)
 #
-# @max-cpu-throttle: maximum cpu throttle percentage.
-#                    Defaults to 99.
-#                    (Since 3.1)
+# @max-cpu-throttle: maximum cpu throttle percentage.  Defaults to 99.
+#     (Since 3.1)
 #
-# @multifd-compression: Which compression method to use.
-#                       Defaults to none. (Since 5.0)
+# @multifd-compression: Which compression method to use.  Defaults to
+#     none.  (Since 5.0)
 #
 # @multifd-zlib-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 9, where 0 means no compression, 1 means the best
-#                      compression speed, and 9 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
+#     migration, the compression level is an integer between 0 and 9,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 9 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @multifd-zstd-level: Set the compression level to be used in live
-#                      migration, the compression level is an integer between 0
-#                      and 20, where 0 means no compression, 1 means the best
-#                      compression speed, and 20 means best compression ratio which
-#                      will consume more CPU.
-#                      Defaults to 1. (Since 5.0)
+#     migration, the compression level is an integer between 0 and 20,
+#     where 0 means no compression, 1 means the best compression
+#     speed, and 20 means best compression ratio which will consume
+#     more CPU. Defaults to 1. (Since 5.0)
 #
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
-#                        aliases for the purpose of dirty bitmap migration.  Such
-#                        aliases may for example be the corresponding names on the
-#                        opposite site.
-#                        The mapping must be one-to-one, but not necessarily
-#                        complete: On the source, unmapped bitmaps and all bitmaps
-#                        on unmapped nodes will be ignored.  On the destination,
-#                        encountering an unmapped alias in the incoming migration
-#                        stream will result in a report, and all further bitmap
-#                        migration data will then be discarded.
-#                        Note that the destination does not know about bitmaps it
-#                        does not receive, so there is no limitation or requirement
-#                        regarding the number of bitmaps received, or how they are
-#                        named, or on which nodes they are placed.
-#                        By default (when this parameter has never been set), bitmap
-#                        names are mapped to themselves.  Nodes are mapped to their
-#                        block device name if there is one, and to their node name
-#                        otherwise. (Since 5.2)
+#     aliases for the purpose of dirty bitmap migration.  Such aliases
+#     may for example be the corresponding names on the opposite site.
+#     The mapping must be one-to-one, but not necessarily complete: On
+#     the source, unmapped bitmaps and all bitmaps on unmapped nodes
+#     will be ignored.  On the destination, encountering an unmapped
+#     alias in the incoming migration stream will result in a report,
+#     and all further bitmap migration data will then be discarded.
+#     Note that the destination does not know about bitmaps it does
+#     not receive, so there is no limitation or requirement regarding
+#     the number of bitmaps received, or how they are named, or on
+#     which nodes they are placed.  By default (when this parameter
+#     has never been set), bitmap names are mapped to themselves.
+#     Nodes are mapped to their block device name if there is one, and
+#     to their node name otherwise.  (Since 5.2)
 #
 # Features:
+#
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
 # Since: 2.4
@@ -1201,7 +1185,6 @@
 #          "downtime-limit": 300
 #       }
 #    }
-#
 ##
 { 'command': 'query-migrate-parameters',
   'returns': 'MigrationParameters' }
@@ -1209,9 +1192,9 @@
 ##
 # @migrate-start-postcopy:
 #
-# Followup to a migration command to switch the migration to postcopy mode.
-# The postcopy-ram capability must be set on both source and destination
-# before the original migration command.
+# Followup to a migration command to switch the migration to postcopy
+# mode.  The postcopy-ram capability must be set on both source and
+# destination before the original migration command.
 #
 # Since: 2.5
 #
@@ -1219,7 +1202,6 @@
 #
 # -> { "execute": "migrate-start-postcopy" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate-start-postcopy' }
 
@@ -1237,7 +1219,6 @@
 # <- {"timestamp": {"seconds": 1432121972, "microseconds": 744001},
 #     "event": "MIGRATION",
 #     "data": {"status": "completed"} }
-#
 ##
 { 'event': 'MIGRATION',
   'data': {'status': 'MigrationStatus'}}
@@ -1245,8 +1226,8 @@
 ##
 # @MIGRATION_PASS:
 #
-# Emitted from the source side of a migration at the start of each pass
-# (when it syncs the dirty bitmap)
+# Emitted from the source side of a migration at the start of each
+# pass (when it syncs the dirty bitmap)
 #
 # @pass: An incrementing count (starting at 1 on the first pass)
 #
@@ -1256,7 +1237,6 @@
 #
 # <- { "timestamp": {"seconds": 1449669631, "microseconds": 239225},
 #       "event": "MIGRATION_PASS", "data": {"pass": 2} }
-#
 ##
 { 'event': 'MIGRATION_PASS',
   'data': { 'pass': 'int' } }
@@ -1268,7 +1248,8 @@
 #
 # @checkpoint-ready: Secondary VM (SVM) is ready for checkpointing
 #
-# @checkpoint-request: Primary VM (PVM) tells SVM to prepare for checkpointing
+# @checkpoint-request: Primary VM (PVM) tells SVM to prepare for
+#     checkpointing
 #
 # @checkpoint-reply: SVM gets PVM's checkpoint request
 #
@@ -1316,7 +1297,8 @@
 #
 # @completed: finish the process of failover
 #
-# @relaunch: restart the failover process, from 'none' -> 'completed' (Since 2.9)
+# @relaunch: restart the failover process, from 'none' -> 'completed'
+#     (Since 2.9)
 #
 # Since: 2.8
 ##
@@ -1339,7 +1321,6 @@
 #
 # <- { "timestamp": {"seconds": 2032141960, "microseconds": 417172},
 #      "event": "COLO_EXIT", "data": {"mode": "primary", "reason": "request" } }
-#
 ##
 { 'event': 'COLO_EXIT',
   'data': {'mode': 'COLOMode', 'reason': 'COLOExitReason' } }
@@ -1349,9 +1330,9 @@
 #
 # The reason for a COLO exit.
 #
-# @none: failover has never happened. This state does not occur
-#        in the COLO_EXIT event, and is only visible in the result of
-#        query-colo-status.
+# @none: failover has never happened.  This state does not occur in
+#     the COLO_EXIT event, and is only visible in the result of
+#     query-colo-status.
 #
 # @request: COLO exit is due to an external request.
 #
@@ -1367,12 +1348,14 @@
 ##
 # @x-colo-lost-heartbeat:
 #
-# Tell qemu that heartbeat is lost, request it to do takeover procedures.
-# If this command is sent to the PVM, the Primary side will exit COLO mode.
-# If sent to the Secondary, the Secondary side will run failover work,
-# then takes over server operation to become the service VM.
+# Tell qemu that heartbeat is lost, request it to do takeover
+# procedures.  If this command is sent to the PVM, the Primary side
+# will exit COLO mode.  If sent to the Secondary, the Secondary side
+# will run failover work, then takes over server operation to become
+# the service VM.
 #
 # Features:
+#
 # @unstable: This command is experimental.
 #
 # Since: 2.8
@@ -1381,7 +1364,6 @@
 #
 # -> { "execute": "x-colo-lost-heartbeat" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'x-colo-lost-heartbeat',
   'features': [ 'unstable' ] }
@@ -1393,7 +1375,8 @@
 #
 # Returns: nothing on success
 #
-# Notes: This command succeeds even if there is no migration process running.
+# Notes: This command succeeds even if there is no migration process
+#     running.
 #
 # Since: 0.14
 #
@@ -1401,7 +1384,6 @@
 #
 # -> { "execute": "migrate_cancel" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate_cancel' }
 
@@ -1435,8 +1417,8 @@
 #
 # @inc: incremental disk copy migration
 #
-# @detach: this argument exists only for compatibility reasons and
-#          is ignored by QEMU
+# @detach: this argument exists only for compatibility reasons and is
+#     ignored by QEMU
 #
 # @resume: resume one paused migration, default "off". (since 3.0)
 #
@@ -1446,19 +1428,19 @@
 #
 # Notes:
 #
-# 1. The 'query-migrate' command should be used to check migration's progress
-#    and final result (this information is provided by the 'status' member)
+# 1. The 'query-migrate' command should be used to check migration's
+#    progress and final result (this information is provided by the
+#    'status' member)
 #
 # 2. All boolean arguments default to false
 #
-# 3. The user Monitor's "detach" argument is invalid in QMP and should not
-#    be used
+# 3. The user Monitor's "detach" argument is invalid in QMP and should
+#    not be used
 #
 # Example:
 #
 # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate',
   'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
@@ -1467,11 +1449,11 @@
 ##
 # @migrate-incoming:
 #
-# Start an incoming migration, the qemu must have been started
-# with -incoming defer
+# Start an incoming migration, the qemu must have been started with
+# -incoming defer
 #
 # @uri: The Uniform Resource Identifier identifying the source or
-#       address to listen on
+#     address to listen on
 #
 # Returns: nothing on success
 #
@@ -1479,12 +1461,12 @@
 #
 # Notes:
 #
-# 1. It's a bad idea to use a string for the uri, but it needs to stay
-#    compatible with -incoming and the format of the uri is already exposed
-#    above libvirt.
+# 1. It's a bad idea to use a string for the uri, but it needs
+#    to stay compatible with -incoming and the format of the uri
+#    is already exposed above libvirt.
 #
-# 2. QEMU must be started with -incoming defer to allow migrate-incoming to
-#    be used.
+# 2. QEMU must be started with -incoming defer to allow
+#    migrate-incoming to be used.
 #
 # 3. The uri format is the same as for -incoming
 #
@@ -1493,22 +1475,21 @@
 # -> { "execute": "migrate-incoming",
 #      "arguments": { "uri": "tcp::4446" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
 
 ##
 # @xen-save-devices-state:
 #
-# Save the state of all devices to file. The RAM and the block devices
-# of the VM are not saved by this command.
+# Save the state of all devices to file.  The RAM and the block
+# devices of the VM are not saved by this command.
 #
 # @filename: the file to save the state of the devices to as binary
-#            data. See xen-save-devices-state.txt for a description of the binary
-#            format.
+#     data.  See xen-save-devices-state.txt for a description of the
+#     binary format.
 #
-# @live: Optional argument to ask QEMU to treat this command as part of a live
-#        migration. Default to true. (since 2.11)
+# @live: Optional argument to ask QEMU to treat this command as part
+#     of a live migration.  Default to true.  (since 2.11)
 #
 # Returns: Nothing on success
 #
@@ -1519,7 +1500,6 @@
 # -> { "execute": "xen-save-devices-state",
 #      "arguments": { "filename": "/tmp/save" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'xen-save-devices-state',
   'data': {'filename': 'str', '*live':'bool' } }
@@ -1540,19 +1520,18 @@
 # -> { "execute": "xen-set-global-dirty-log",
 #      "arguments": { "enable": true } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'xen-set-global-dirty-log', 'data': { 'enable': 'bool' } }
 
 ##
 # @xen-load-devices-state:
 #
-# Load the state of all devices from file. The RAM and the block devices
-# of the VM are not loaded by this command.
+# Load the state of all devices from file.  The RAM and the block
+# devices of the VM are not loaded by this command.
 #
 # @filename: the file to load the state of the devices from as binary
-#            data. See xen-save-devices-state.txt for a description of the binary
-#            format.
+#     data.  See xen-save-devices-state.txt for a description of the
+#     binary format.
 #
 # Since: 2.7
 #
@@ -1561,7 +1540,6 @@
 # -> { "execute": "xen-load-devices-state",
 #      "arguments": { "filename": "/tmp/resume" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'xen-load-devices-state', 'data': {'filename': 'str'} }
 
@@ -1574,8 +1552,8 @@
 #
 # @primary: true for primary or false for secondary.
 #
-# @failover: true to do failover, false to stop. but cannot be
-#            specified if 'enable' is true. default value is false.
+# @failover: true to do failover, false to stop.  but cannot be
+#     specified if 'enable' is true.  default value is false.
 #
 # Returns: nothing.
 #
@@ -1598,8 +1576,8 @@
 #
 # @error: true if an error happened, false if replication is normal.
 #
-# @desc: the human readable error description string, when
-#        @error is 'true'.
+# @desc: the human readable error description string, when @error is
+#     'true'.
 #
 # Since: 2.9
 ##
@@ -1647,12 +1625,12 @@
 #
 # The result format for 'query-colo-status'.
 #
-# @mode: COLO running mode. If COLO is running, this field will return
-#        'primary' or 'secondary'.
+# @mode: COLO running mode.  If COLO is running, this field will
+#     return 'primary' or 'secondary'.
 #
-# @last-mode: COLO last running mode. If COLO is running, this field
-#             will return same like mode field, after failover we can
-#             use this field to get last colo mode. (since 4.0)
+# @last-mode: COLO last running mode.  If COLO is running, this field
+#     will return same like mode field, after failover we can use this
+#     field to get last colo mode.  (since 4.0)
 #
 # @reason: describes the reason for the COLO exit.
 #
@@ -1720,9 +1698,9 @@
 # @UNPLUG_PRIMARY:
 #
 # Emitted from source side of a migration when migration state is
-# WAIT_UNPLUG. Device was unplugged by guest operating system.
-# Device resources in QEMU are kept on standby to be able to re-plug it in case
-# of migration failure.
+# WAIT_UNPLUG. Device was unplugged by guest operating system.  Device
+# resources in QEMU are kept on standby to be able to re-plug it in
+# case of migration failure.
 #
 # @device-id: QEMU device id of the unplugged device
 #
@@ -1733,7 +1711,6 @@
 # <- { "event": "UNPLUG_PRIMARY",
 #      "data": { "device-id": "hostdev0" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'UNPLUG_PRIMARY',
   'data': { 'device-id': 'str' } }
@@ -1761,7 +1738,8 @@
 #
 # @measuring: the dirtyrate thread is measuring.
 #
-# @measured: the dirtyrate thread has measured and results are available.
+# @measured: the dirtyrate thread has measured and results are
+#     available.
 #
 # Since: 5.2
 ##
@@ -1789,24 +1767,24 @@
 #
 # Information about current dirty page rate of vm.
 #
-# @dirty-rate: an estimate of the dirty page rate of the VM in units of
-#              MB/s, present only when estimating the rate has completed.
+# @dirty-rate: an estimate of the dirty page rate of the VM in units
+#     of MB/s, present only when estimating the rate has completed.
 #
 # @status: status containing dirtyrate query status includes
-#          'unstarted' or 'measuring' or 'measured'
+#     'unstarted' or 'measuring' or 'measured'
 #
 # @start-time: start time in units of second for calculation
 #
 # @calc-time: time in units of second for sample dirty pages
 #
-# @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.1)
+# @sample-pages: page count per GB for sample dirty pages the default
+#     value is 512 (since 6.1)
 #
 # @mode: mode containing method of calculate dirtyrate includes
-#        'page-sampling' and 'dirty-ring' (Since 6.2)
+#     'page-sampling' and 'dirty-ring' (Since 6.2)
 #
-# @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
-#                   mode specified (Since 6.2)
+# @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring mode
+#     specified (Since 6.2)
 #
 # Since: 5.2
 ##
@@ -1826,11 +1804,11 @@
 #
 # @calc-time: time in units of second for sample dirty pages
 #
-# @sample-pages: page count per GB for sample dirty pages
-#                the default value is 512 (since 6.1)
+# @sample-pages: page count per GB for sample dirty pages the default
+#     value is 512 (since 6.1)
 #
-# @mode: mechanism of calculating dirtyrate includes
-#        'page-sampling' and 'dirty-ring' (Since 6.1)
+# @mode: mechanism of calculating dirtyrate includes 'page-sampling'
+#     and 'dirty-ring' (Since 6.1)
 #
 # Since: 5.2
 #
@@ -1839,7 +1817,6 @@
 # -> {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
 #                                                 'sample-pages': 512} }
 # <- { "return": {} }
-#
 ##
 { 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64',
                                          '*sample-pages': 'int',
@@ -1862,12 +1839,11 @@
 # @cpu-index: index of a virtual CPU.
 #
 # @limit-rate: upper limit of dirty page rate (MB/s) for a virtual
-#              CPU, 0 means unlimited.
+#     CPU, 0 means unlimited.
 #
 # @current-rate: current dirty page rate (MB/s) for a virtual CPU.
 #
 # Since: 7.1
-#
 ##
 { 'struct': 'DirtyLimitInfo',
   'data': { 'cpu-index': 'int',
@@ -1879,9 +1855,9 @@
 #
 # Set the upper limit of dirty page rate for virtual CPUs.
 #
-# Requires KVM with accelerator property "dirty-ring-size" set.
-# A virtual CPU's dirty page rate is a measure of its memory load.
-# To observe dirty page rates, use @calc-dirty-rate.
+# Requires KVM with accelerator property "dirty-ring-size" set.  A
+# virtual CPU's dirty page rate is a measure of its memory load.  To
+# observe dirty page rates, use @calc-dirty-rate.
 #
 # @cpu-index: index of a virtual CPU, default is all.
 #
@@ -1895,7 +1871,6 @@
 #     "arguments": { "dirty-rate": 200,
 #                    "cpu-index": 1 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'set-vcpu-dirty-limit',
   'data': { '*cpu-index': 'int',
@@ -1907,7 +1882,7 @@
 # Cancel the upper limit of dirty page rate for virtual CPUs.
 #
 # Cancel the dirty page limit for the vCPU which has been set with
-# set-vcpu-dirty-limit command. Note that this command requires
+# set-vcpu-dirty-limit command.  Note that this command requires
 # support from dirty ring, same as the "set-vcpu-dirty-limit".
 #
 # @cpu-index: index of a virtual CPU, default is all.
@@ -1919,7 +1894,6 @@
 # -> {"execute": "cancel-vcpu-dirty-limit"},
 #     "arguments": { "cpu-index": 1 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'cancel-vcpu-dirty-limit',
   'data': { '*cpu-index': 'int'} }
@@ -1927,7 +1901,8 @@
 ##
 # @query-vcpu-dirty-limit:
 #
-# Returns information about virtual CPU dirty page rate limits, if any.
+# Returns information about virtual CPU dirty page rate limits, if
+# any.
 #
 # Since: 7.1
 #
@@ -1937,7 +1912,6 @@
 # <- {"return": [
 #        { "limit-rate": 60, "current-rate": 3, "cpu-index": 0},
 #        { "limit-rate": 60, "current-rate": 3, "cpu-index": 1}]}
-#
 ##
 { 'command': 'query-vcpu-dirty-limit',
   'returns': [ 'DirtyLimitInfo' ] }
@@ -1977,20 +1951,24 @@
 # Save a VM snapshot
 #
 # @job-id: identifier for the newly created job
+#
 # @tag: name of the snapshot to create
+#
 # @vmstate: block device node name to save vmstate to
+#
 # @devices: list of block device node names to save a snapshot to
 #
 # Applications should not assume that the snapshot save is complete
-# when this command returns. The job commands / events must be used
-# to determine completion and to fetch details of any errors that arise.
+# when this command returns.  The job commands / events must be used
+# to determine completion and to fetch details of any errors that
+# arise.
 #
-# Note that execution of the guest CPUs may be stopped during the
-# time it takes to save the snapshot. A future version of QEMU
-# may ensure CPUs are executing continuously.
+# Note that execution of the guest CPUs may be stopped during the time
+# it takes to save the snapshot.  A future version of QEMU may ensure
+# CPUs are executing continuously.
 #
-# It is strongly recommended that @devices contain all writable
-# block device nodes if a consistent snapshot is required.
+# It is strongly recommended that @devices contain all writable block
+# device nodes if a consistent snapshot is required.
 #
 # If @tag already exists, an error will be reported
 #
@@ -2047,20 +2025,24 @@
 # Load a VM snapshot
 #
 # @job-id: identifier for the newly created job
+#
 # @tag: name of the snapshot to load.
+#
 # @vmstate: block device node name to load vmstate from
+#
 # @devices: list of block device node names to load a snapshot from
 #
 # Applications should not assume that the snapshot load is complete
-# when this command returns. The job commands / events must be used
-# to determine completion and to fetch details of any errors that arise.
+# when this command returns.  The job commands / events must be used
+# to determine completion and to fetch details of any errors that
+# arise.
 #
 # Note that execution of the guest CPUs will be stopped during the
 # time it takes to load the snapshot.
 #
-# It is strongly recommended that @devices contain all writable
-# block device nodes that can have changed since the original
-# @snapshot-save command execution.
+# It is strongly recommended that @devices contain all writable block
+# device nodes that can have changed since the original @snapshot-save
+# command execution.
 #
 # Returns: nothing
 #
@@ -2115,12 +2097,15 @@
 # Delete a VM snapshot
 #
 # @job-id: identifier for the newly created job
+#
 # @tag: name of the snapshot to delete.
+#
 # @devices: list of block device node names to delete a snapshot from
 #
 # Applications should not assume that the snapshot delete is complete
-# when this command returns. The job commands / events must be used
-# to determine completion and to fetch details of any errors that arise.
+# when this command returns.  The job commands / events must be used
+# to determine completion and to fetch details of any errors that
+# arise.
 #
 # Returns: nothing
 #
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index de91054523..9689ed9d52 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -5,10 +5,9 @@
 ##
 # @rtc-reset-reinjection:
 #
-# This command will reset the RTC interrupt reinjection backlog.
-# Can be used if another mechanism to synchronize guest time
-# is in effect, for example QEMU guest agent's guest-set-time
-# command.
+# This command will reset the RTC interrupt reinjection backlog.  Can
+# be used if another mechanism to synchronize guest time is in effect,
+# for example QEMU guest agent's guest-set-time command.
 #
 # Since: 2.1
 #
@@ -16,7 +15,6 @@
 #
 # -> { "execute": "rtc-reset-reinjection" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'rtc-reset-reinjection',
   'if': 'TARGET_I386' }
@@ -28,17 +26,19 @@
 #
 # @uninit: The guest is uninitialized.
 #
-# @launch-update: The guest is currently being launched; plaintext data and
-#                 register state is being imported.
+# @launch-update: The guest is currently being launched; plaintext
+#     data and register state is being imported.
 #
-# @launch-secret: The guest is currently being launched; ciphertext data
-#                 is being imported.
+# @launch-secret: The guest is currently being launched; ciphertext
+#     data is being imported.
 #
 # @running: The guest is fully launched or migrated in.
 #
-# @send-update: The guest is currently being migrated out to another machine.
+# @send-update: The guest is currently being migrated out to another
+#     machine.
 #
-# @receive-update: The guest is currently being migrated from another machine.
+# @receive-update: The guest is currently being migrated from another
+#     machine.
 #
 # Since: 2.12
 ##
@@ -95,7 +95,6 @@
 # <- { "return": { "enabled": true, "api-major" : 0, "api-minor" : 0,
 #                  "build-id" : 0, "policy" : 0, "state" : "running",
 #                  "handle" : 1 } }
-#
 ##
 { 'command': 'query-sev', 'returns': 'SevInfo',
   'if': 'TARGET_I386' }
@@ -125,7 +124,6 @@
 #
 # -> { "execute": "query-sev-launch-measure" }
 # <- { "return": { "data": "4l8LXeNlSPUDlXPJG5966/8%YZ" } }
-#
 ##
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
   'if': 'TARGET_I386' }
@@ -133,8 +131,8 @@
 ##
 # @SevCapability:
 #
-# The struct describes capability for a Secure Encrypted Virtualization
-# feature.
+# The struct describes capability for a Secure Encrypted
+# Virtualization feature.
 #
 # @pdh: Platform Diffie-Hellman key (base64 encoded)
 #
@@ -144,8 +142,8 @@
 #
 # @cbitpos: C-bit location in page table entry
 #
-# @reduced-phys-bits: Number of physical Address bit reduction when SEV is
-#                     enabled
+# @reduced-phys-bits: Number of physical Address bit reduction when
+#     SEV is enabled
 #
 # Since: 2.12
 ##
@@ -160,8 +158,8 @@
 ##
 # @query-sev-capabilities:
 #
-# This command is used to get the SEV capabilities, and is supported on AMD
-# X86 platforms only.
+# This command is used to get the SEV capabilities, and is supported
+# on AMD X86 platforms only.
 #
 # Returns: SevCapability objects.
 #
@@ -173,7 +171,6 @@
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
 #                  "cpu0-id": "2lvmGwo+...61iEinw==",
 #                  "cbitpos": 47, "reduced-phys-bits": 5}}
-#
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
   'if': 'TARGET_I386' }
@@ -216,7 +213,7 @@
 # supported on AMD X86 platforms only.
 #
 # @mnonce: a random 16 bytes value encoded in base64 (it will be
-#          included in report)
+#     included in report)
 #
 # Returns: SevAttestationReport objects.
 #
@@ -227,7 +224,6 @@
 # -> { "execute" : "query-sev-attestation-report",
 #                  "arguments": { "mnonce": "aaaaaaa" } }
 # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
-#
 ##
 { 'command': 'query-sev-attestation-report',
   'data': { 'mnonce': 'str' },
@@ -250,7 +246,6 @@
 # -> { "execute": "dump-skeys",
 #      "arguments": { "filename": "/tmp/skeys" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'dump-skeys',
   'data': { 'filename': 'str' },
@@ -260,18 +255,18 @@
 # @GICCapability:
 #
 # The struct describes capability for a specific GIC (Generic
-# Interrupt Controller) version. These bits are not only decided by
-# QEMU/KVM software version, but also decided by the hardware that
-# the program is running upon.
+# Interrupt Controller) version.  These bits are not only decided by
+# QEMU/KVM software version, but also decided by the hardware that the
+# program is running upon.
 #
-# @version: version of GIC to be described. Currently, only 2 and 3
-#           are supported.
+# @version: version of GIC to be described.  Currently, only 2 and 3
+#     are supported.
 #
 # @emulated: whether current QEMU/hardware supports emulated GIC
-#            device in user space.
+#     device in user space.
 #
-# @kernel: whether current QEMU/hardware supports hardware
-#          accelerated GIC device in kernel.
+# @kernel: whether current QEMU/hardware supports hardware accelerated
+#     GIC device in kernel.
 #
 # Since: 2.6
 ##
@@ -284,7 +279,7 @@
 ##
 # @query-gic-capabilities:
 #
-# This command is ARM-only. It will return a list of GICCapability
+# This command is ARM-only.  It will return a list of GICCapability
 # objects that describe its capability bits.
 #
 # Returns: a list of GICCapability objects.
@@ -296,7 +291,6 @@
 # -> { "execute": "query-gic-capabilities" }
 # <- { "return": [{ "version": 2, "emulated": true, "kernel": false },
 #                 { "version": 3, "emulated": false, "kernel": true } ] }
-#
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'TARGET_ARM' }
@@ -357,7 +351,6 @@
 #                  "flc": true,
 #                  "sections": [{"node": 0, "size": 67108864},
 #                  {"node": 1, "size": 29360128}]} }
-#
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
 
@@ -377,7 +370,6 @@
 #                  "flc": true,
 #                  "section" : [{"node": 0, "size": 67108864},
 #                  {"node": 1, "size": 29360128}]} }
-#
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
 
@@ -470,7 +462,6 @@
 #         }
 #      ]
 #    }
-#
 ##
 { 'command': 'xen-event-list',
   'returns': ['EvtchnInfo'],
@@ -483,7 +474,8 @@
 #
 # @port: The port number
 #
-# Returns: - Nothing on success.
+# Returns:
+# - Nothing on success.
 #
 # Since: 8.0
 #
@@ -491,7 +483,6 @@
 #
 # -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
 # <- { "return": { } }
-#
 ##
 { 'command': 'xen-event-inject',
   'data': { 'port': 'uint32' },
diff --git a/qapi/misc.json b/qapi/misc.json
index 4afaee7fe7..ff070ec828 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -11,22 +11,22 @@
 ##
 # @add_client:
 #
-# Allow client connections for VNC, Spice and socket based
-# character devices to be passed in to QEMU via SCM_RIGHTS.
+# Allow client connections for VNC, Spice and socket based character
+# devices to be passed in to QEMU via SCM_RIGHTS.
 #
-# If the FD associated with @fdname is not a socket, the command will fail and
-# the FD will be closed.
+# If the FD associated with @fdname is not a socket, the command will
+# fail and the FD will be closed.
 #
-# @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-display" or
-#            the name of a character device (eg. from -chardev id=XXXX)
+# @protocol: protocol name.  Valid names are "vnc", "spice",
+#     "@dbus-display" or the name of a character device (eg. from
+#     -chardev id=XXXX)
 #
 # @fdname: file descriptor name previously passed via 'getfd' command
 #
-# @skipauth: whether to skip authentication. Only applies
-#            to "vnc" and "spice" protocols
+# @skipauth: whether to skip authentication.  Only applies to "vnc"
+#     and "spice" protocols
 #
-# @tls: whether to perform TLS. Only applies to the "spice"
-#       protocol
+# @tls: whether to perform TLS. Only applies to the "spice" protocol
 #
 # Returns: nothing on success.
 #
@@ -37,7 +37,6 @@
 # -> { "execute": "add_client", "arguments": { "protocol": "vnc",
 #                                              "fdname": "myclient" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'add_client',
   'data': { 'protocol': 'str', 'fdname': 'str', '*skipauth': 'bool',
@@ -67,7 +66,6 @@
 #
 # -> { "execute": "query-name" }
 # <- { "return": { "name": "qemu-name" } }
-#
 ##
 { 'command': 'query-name', 'returns': 'NameInfo', 'allow-preconfig': true }
 
@@ -80,17 +78,17 @@
 #
 # @thread-id: ID of the underlying host thread
 #
-# @poll-max-ns: maximum polling time in ns, 0 means polling is disabled
-#               (since 2.9)
+# @poll-max-ns: maximum polling time in ns, 0 means polling is
+#     disabled (since 2.9)
 #
-# @poll-grow: how many ns will be added to polling time, 0 means that it's not
-#             configured (since 2.9)
+# @poll-grow: how many ns will be added to polling time, 0 means that
+#     it's not configured (since 2.9)
 #
-# @poll-shrink: how many ns will be removed from polling time, 0 means that
-#               it's not configured (since 2.9)
+# @poll-shrink: how many ns will be removed from polling time, 0 means
+#     that it's not configured (since 2.9)
 #
-# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
-#                 0 means that the engine will use its default (since 6.1)
+# @aio-max-batch: maximum number of requests in a batch for the AIO
+#     engine, 0 means that the engine will use its default (since 6.1)
 #
 # Since: 2.0
 ##
@@ -107,9 +105,9 @@
 #
 # Returns a list of information about each iothread.
 #
-# Note: this list excludes the QEMU main loop thread, which is not declared
-#       using the -object iothread command-line option.  It is always the main thread
-#       of the process.
+# Note: this list excludes the QEMU main loop thread, which is not
+#     declared using the -object iothread command-line option.  It is
+#     always the main thread of the process.
 #
 # Returns: a list of @IOThreadInfo for each iothread
 #
@@ -129,7 +127,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-iothreads', 'returns': ['IOThreadInfo'],
   'allow-preconfig': true }
@@ -141,16 +138,15 @@
 #
 # Since: 0.14
 #
-# Notes: This function will succeed even if the guest is already in the stopped
-#        state.  In "inmigrate" state, it will ensure that the guest
-#        remains paused once migration finishes, as if the -S option was
-#        passed on the command line.
+# Notes: This function will succeed even if the guest is already in
+#     the stopped state.  In "inmigrate" state, it will ensure that
+#     the guest remains paused once migration finishes, as if the -S
+#     option was passed on the command line.
 #
 # Example:
 #
 # -> { "execute": "stop" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'stop' }
 
@@ -163,17 +159,16 @@
 #
 # Returns: If successful, nothing
 #
-# Notes: This command will succeed if the guest is currently running.  It
-#        will also succeed if the guest is in the "inmigrate" state; in
-#        this case, the effect of the command is to make sure the guest
-#        starts once migration finishes, removing the effect of the -S
-#        command line option if it was passed.
+# Notes: This command will succeed if the guest is currently running.
+#     It will also succeed if the guest is in the "inmigrate" state;
+#     in this case, the effect of the command is to make sure the
+#     guest starts once migration finishes, removing the effect of the
+#     -S command line option if it was passed.
 #
 # Example:
 #
 # -> { "execute": "cont" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'cont' }
 
@@ -182,13 +177,14 @@
 #
 # Exit from "preconfig" state
 #
-# This command makes QEMU exit the preconfig state and proceed with
-# VM initialization using configuration data provided on the command line
-# and via the QMP monitor during the preconfig state. The command is only
-# available during the preconfig state (i.e. when the --preconfig command
-# line option was in use).
+# This command makes QEMU exit the preconfig state and proceed with VM
+# initialization using configuration data provided on the command line
+# and via the QMP monitor during the preconfig state.  The command is
+# only available during the preconfig state (i.e. when the --preconfig
+# command line option was in use).
 #
 # Features:
+#
 # @unstable: This command is experimental.
 #
 # Since: 3.0
@@ -199,7 +195,6 @@
 #
 # -> { "execute": "x-exit-preconfig" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'x-exit-preconfig', 'allow-preconfig': true,
   'features': [ 'unstable' ] }
@@ -214,35 +209,33 @@
 # @cpu-index: The CPU to use for commands that require an implicit CPU
 #
 # Features:
+#
 # @savevm-monitor-nodes: If present, HMP command savevm only snapshots
-#                        monitor-owned nodes if they have no parents.
-#                        This allows the use of 'savevm' with
-#                        -blockdev. (since 4.2)
+#     monitor-owned nodes if they have no parents.  This allows the
+#     use of 'savevm' with -blockdev.  (since 4.2)
 #
 # Returns: the output of the command as a string
 #
 # Since: 0.14
 #
 # Notes: This command only exists as a stop-gap.  Its use is highly
-#        discouraged.  The semantics of this command are not
-#        guaranteed: this means that command names, arguments and
-#        responses can change or be removed at ANY time.  Applications
-#        that rely on long term stability guarantees should NOT
-#        use this command.
+#     discouraged.  The semantics of this command are not guaranteed:
+#     this means that command names, arguments and responses can
+#     change or be removed at ANY time.  Applications that rely on
+#     long term stability guarantees should NOT use this command.
 #
-#        Known limitations:
+#     Known limitations:
 #
-#        * This command is stateless, this means that commands that depend
-#          on state information (such as getfd) might not work
+#     * This command is stateless, this means that commands that
+#       depend on state information (such as getfd) might not work
 #
-#        * Commands that prompt the user for data don't currently work
+#     * Commands that prompt the user for data don't currently work
 #
 # Example:
 #
 # -> { "execute": "human-monitor-command",
 #      "arguments": { "command-line": "info kvm" } }
 # <- { "return": "kvm support: enabled\r\n" }
-#
 ##
 { 'command': 'human-monitor-command',
   'data': {'command-line': 'str', '*cpu-index': 'int'},
@@ -260,18 +253,16 @@
 #
 # Since: 0.14
 #
-# Notes: If @fdname already exists, the file descriptor assigned to
-#        it will be closed and replaced by the received file
-#        descriptor.
+# Notes: If @fdname already exists, the file descriptor assigned to it
+#     will be closed and replaced by the received file descriptor.
 #
-#        The 'closefd' command can be used to explicitly close the
-#        file descriptor when it is no longer needed.
+#     The 'closefd' command can be used to explicitly close the file
+#     descriptor when it is no longer needed.
 #
 # Example:
 #
 # -> { "execute": "getfd", "arguments": { "fdname": "fd1" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'getfd', 'data': {'fdname': 'str'}, 'if': 'CONFIG_POSIX' }
 
@@ -291,18 +282,16 @@
 #
 # Since: 8.0
 #
-# Notes: If @fdname already exists, the file descriptor assigned to
-#        it will be closed and replaced by the received file
-#        descriptor.
+# Notes: If @fdname already exists, the file descriptor assigned to it
+#     will be closed and replaced by the received file descriptor.
 #
-#        The 'closefd' command can be used to explicitly close the
-#        file descriptor when it is no longer needed.
+#     The 'closefd' command can be used to explicitly close the file
+#     descriptor when it is no longer needed.
 #
 # Example:
 #
 # -> { "execute": "get-win32-socket", "arguments": { "info": "abcd123..", fdname": "skclient" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname': 'str'}, 'if': 'CONFIG_WIN32' }
 
@@ -321,7 +310,6 @@
 #
 # -> { "execute": "closefd", "arguments": { "fdname": "fd1" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'closefd', 'data': {'fdname': 'str'} }
 
@@ -332,8 +320,8 @@
 #
 # @fdset-id: The ID of the fd set that @fd was added to.
 #
-# @fd: The file descriptor that was received via SCM rights and
-#      added to the fd set.
+# @fd: The file descriptor that was received via SCM rights and added
+#     to the fd set.
 #
 # Since: 1.2
 ##
@@ -348,13 +336,14 @@
 #
 # @opaque: A free-form string that can be used to describe the fd.
 #
-# Returns: - @AddfdInfo on success
-#          - If file descriptor was not received, GenericError
-#          - If @fdset-id is a negative value, GenericError
+# Returns:
+# - @AddfdInfo on success
+# - If file descriptor was not received, GenericError
+# - If @fdset-id is a negative value, GenericError
 #
 # Notes: The list of fd sets is shared by all monitor connections.
 #
-#        If @fdset-id is not specified, a new fd set will be created.
+# If @fdset-id is not specified, a new fd set will be created.
 #
 # Since: 1.2
 #
@@ -362,7 +351,6 @@
 #
 # -> { "execute": "add-fd", "arguments": { "fdset-id": 1 } }
 # <- { "return": { "fdset-id": 1, "fd": 3 } }
-#
 ##
 { 'command': 'add-fd',
   'data': { '*fdset-id': 'int',
@@ -378,21 +366,21 @@
 #
 # @fd: The file descriptor that is to be removed.
 #
-# Returns: - Nothing on success
-#          - If @fdset-id or @fd is not found, GenericError
+# Returns:
+# - Nothing on success
+# - If @fdset-id or @fd is not found, GenericError
 #
 # Since: 1.2
 #
 # Notes: The list of fd sets is shared by all monitor connections.
 #
-#        If @fd is not specified, all file descriptors in @fdset-id
-#        will be removed.
+# If @fd is not specified, all file descriptors in @fdset-id will be
+# removed.
 #
 # Example:
 #
 # -> { "execute": "remove-fd", "arguments": { "fdset-id": 1, "fd": 3 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'remove-fd', 'data': {'fdset-id': 'int', '*fd': 'int'} }
 
@@ -465,7 +453,6 @@
 #        }
 #      ]
 #    }
-#
 ##
 { 'command': 'query-fdsets', 'returns': ['FdsetInfo'] }
 
@@ -481,7 +468,7 @@
 # @number: accepts a number
 #
 # @size: accepts a number followed by an optional suffix (K)ilo,
-#        (M)ega, (G)iga, (T)era
+#     (M)ega, (G)iga, (T)era
 #
 # Since: 1.5
 ##
@@ -512,7 +499,8 @@
 ##
 # @CommandLineOptionInfo:
 #
-# Details about a command line option, including its list of parameter details
+# Details about a command line option, including its list of parameter
+# details
 #
 # @option: option name
 #
@@ -530,8 +518,9 @@
 #
 # @option: option name
 #
-# Returns: list of @CommandLineOptionInfo for all options (or for the given
-#          @option).  Returns an error if the given @option doesn't exist.
+# Returns: list of @CommandLineOptionInfo for all options (or for the
+#     given @option).  Returns an error if the given @option doesn't
+#     exist.
 #
 # Since: 1.5
 #
@@ -555,26 +544,25 @@
 #         }
 #      ]
 #    }
-#
 ##
 {'command': 'query-command-line-options',
- 'data': { '*option': 'str' },
+ 'data': {'*option': 'str'},
  'returns': ['CommandLineOptionInfo'],
- 'allow-preconfig': true }
+ 'allow-preconfig': true}
 
 ##
 # @RTC_CHANGE:
 #
 # Emitted when the guest changes the RTC time.
 #
-# @offset: offset in seconds between base RTC clock (as specified
-#          by -rtc base), and new RTC clock value
+# @offset: offset in seconds between base RTC clock (as specified by
+#     -rtc base), and new RTC clock value
 #
 # @qom-path: path to the RTC object in the QOM tree
 #
-# Note: This event is rate-limited.
-#       It is not guaranteed that the RTC in the system implements
-#       this event, or even that the system has an RTC at all.
+# Note: This event is rate-limited.  It is not guaranteed that the RTC
+#     in the system implements this event, or even that the system has
+#     an RTC at all.
 #
 # Since: 0.13
 #
@@ -593,10 +581,11 @@
 # Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
 # communication channel
 #
-# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object. It is the last component
-#          of @vfu-qom-path referenced below
+# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object.  It is the last
+#     component of @vfu-qom-path referenced below
 #
-# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM tree
+# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM
+#     tree
 #
 # @dev-id: ID of attached PCI device
 #
@@ -612,7 +601,6 @@
 #                "dev-id": "sas1",
 #                "dev-qom-path": "/machine/peripheral/sas1" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
diff --git a/qapi/net.json b/qapi/net.json
index 3606d9d27f..db67501308 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -18,21 +18,20 @@
 #
 # @up: true to set the link status to be up
 #
-# Returns: Nothing on success
-#          If @name is not a valid network device, DeviceNotFound
+# Returns: Nothing on success If @name is not a valid network device,
+#     DeviceNotFound
 #
 # Since: 0.14
 #
-# Notes: Not all network adapters support setting link status.  This command
-#        will succeed even if the network adapter does not support link status
-#        notification.
+# Notes: Not all network adapters support setting link status.  This
+#     command will succeed even if the network adapter does not
+#     support link status notification.
 #
 # Example:
 #
 # -> { "execute": "set_link",
 #      "arguments": { "name": "e1000.0", "up": false } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'set_link', 'data': {'name': 'str', 'up': 'bool'} }
 
@@ -45,8 +44,8 @@
 #
 # Since: 0.14
 #
-# Returns: Nothing on success
-#          If @type is not a valid network backend, DeviceNotFound
+# Returns: Nothing on success If @type is not a valid network backend,
+#     DeviceNotFound
 #
 # Example:
 #
@@ -54,7 +53,6 @@
 #      "arguments": { "type": "user", "id": "netdev1",
 #                     "dnssearch": [ { "str": "example.org" } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true,
   'allow-preconfig': true }
@@ -66,8 +64,8 @@
 #
 # @id: the name of the network backend to remove
 #
-# Returns: Nothing on success
-#          If @id is not a valid network backend, DeviceNotFound
+# Returns: Nothing on success If @id is not a valid network backend,
+#     DeviceNotFound
 #
 # Since: 0.14
 #
@@ -75,7 +73,6 @@
 #
 # -> { "execute": "netdev_del", "arguments": { "id": "netdev1" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'netdev_del', 'data': {'id': 'str'},
   'allow-preconfig': true }
@@ -108,25 +105,23 @@
 ##
 # @NetdevUserOptions:
 #
-# Use the user mode network stack which requires no administrator privilege to
-# run.
+# Use the user mode network stack which requires no administrator
+# privilege to run.
 #
 # @hostname: client hostname reported by the builtin DHCP server
 #
 # @restrict: isolate the guest from the host
 #
-# @ipv4: whether to support IPv4, default true for enabled
-#        (since 2.6)
+# @ipv4: whether to support IPv4, default true for enabled (since 2.6)
 #
-# @ipv6: whether to support IPv6, default true for enabled
-#        (since 2.6)
+# @ipv6: whether to support IPv6, default true for enabled (since 2.6)
 #
 # @ip: legacy parameter, use net= instead
 #
-# @net: IP network address that the guest will see, in the
-#       form addr[/netmask] The netmask is optional, and can be
-#       either in the form a.b.c.d or as a number of valid top-most
-#       bits. Default is 10.0.2.0/24.
+# @net: IP network address that the guest will see, in the form
+#     addr[/netmask] The netmask is optional, and can be either in the
+#     form a.b.c.d or as a number of valid top-most bits.  Default is
+#     10.0.2.0/24.
 #
 # @host: guest-visible address of the host
 #
@@ -135,34 +130,34 @@
 # @bootfile: BOOTP filename, for use with tftp=
 #
 # @dhcpstart: the first of the 16 IPs the built-in DHCP server can
-#             assign
+#     assign
 #
 # @dns: guest-visible address of the virtual nameserver
 #
-# @dnssearch: list of DNS suffixes to search, passed as DHCP option
-#             to the guest
+# @dnssearch: list of DNS suffixes to search, passed as DHCP option to
+#     the guest
 #
 # @domainname: guest-visible domain name of the virtual nameserver
-#              (since 3.0)
+#     (since 3.0)
 #
-# @ipv6-prefix: IPv6 network prefix (default is fec0::) (since
-#               2.6). The network prefix is given in the usual
-#               hexadecimal IPv6 address notation.
+# @ipv6-prefix: IPv6 network prefix (default is fec0::) (since 2.6).
+#     The network prefix is given in the usual hexadecimal IPv6
+#     address notation.
 #
-# @ipv6-prefixlen: IPv6 network prefix length (default is 64)
-#                  (since 2.6)
+# @ipv6-prefixlen: IPv6 network prefix length (default is 64) (since
+#     2.6)
 #
 # @ipv6-host: guest-visible IPv6 address of the host (since 2.6)
 #
-# @ipv6-dns: guest-visible IPv6 address of the virtual
-#            nameserver (since 2.6)
+# @ipv6-dns: guest-visible IPv6 address of the virtual nameserver
+#     (since 2.6)
 #
 # @smb: root directory of the built-in SMB server
 #
 # @smbserver: IP address of the built-in SMB server
 #
 # @hostfwd: redirect incoming TCP or UDP host connections to guest
-#           endpoints
+#     endpoints
 #
 # @guestfwd: forward guest TCP connections
 #
@@ -205,7 +200,7 @@
 # @fd: file descriptor of an already opened tap
 #
 # @fds: multiple file descriptors of already opened multiqueue capable
-#       tap
+#     tap
 #
 # @script: script to initialize the interface
 #
@@ -215,7 +210,7 @@
 #
 # @helper: command to execute to configure bridge
 #
-# @sndbuf: send buffer limit. Understands [TGMKkb] suffixes.
+# @sndbuf: send buffer limit.  Understands [TGMKkb] suffixes.
 #
 # @vnet_hdr: enable the IFF_VNET_HDR flag on the tap interface
 #
@@ -224,14 +219,14 @@
 # @vhostfd: file descriptor of an already opened vhost net device
 #
 # @vhostfds: file descriptors of multiple already opened vhost net
-#            devices
+#     devices
 #
 # @vhostforce: vhost on for non-MSIX virtio guests
 #
 # @queues: number of queues to be created for multiqueue capable tap
 #
-# @poll-us: maximum number of microseconds that could
-#           be spent on busy polling for tap (since 2.7)
+# @poll-us: maximum number of microseconds that could be spent on busy
+#     polling for tap (since 2.7)
 #
 # Since: 1.2
 ##
@@ -303,9 +298,8 @@
 #
 # @counter: have sequence counter
 #
-# @pincounter: pin sequence counter to zero -
-#              workaround for buggy implementations or
-#              networks with packet reorder
+# @pincounter: pin sequence counter to zero - workaround for buggy
+#     implementations or networks with packet reorder
 #
 # @txcookie: 32 or 64 bit transmit cookie
 #
@@ -313,11 +307,11 @@
 #
 # @txsession: 32 bit transmit session
 #
-# @rxsession: 32 bit receive session - if not specified
-#             set to the same value as transmit
+# @rxsession: 32 bit receive session - if not specified set to the
+#     same value as transmit
 #
-# @offset: additional offset - allows the insertion of
-#          additional application-specific data before the packet payload
+# @offset: additional offset - allows the insertion of additional
+#     application-specific data before the packet payload
 #
 # Since: 2.1
 ##
@@ -382,7 +376,9 @@
 # Connect two or more net clients through a software hub.
 #
 # @hubid: hub identifier number
-# @netdev: used to connect hub to a netdev instead of a device (since 2.12)
+#
+# @netdev: used to connect hub to a netdev instead of a device (since
+#     2.12)
 #
 # Since: 1.2
 ##
@@ -396,12 +392,12 @@
 #
 # Connect a client to a netmap-enabled NIC or to a VALE switch port
 #
-# @ifname: Either the name of an existing network interface supported by
-#          netmap, or the name of a VALE port (created on the fly).
-#          A VALE port name is in the form 'valeXXX:YYY', where XXX and
-#          YYY are non-negative integers. XXX identifies a switch and
-#          YYY identifies a port of the switch. VALE ports having the
-#          same XXX are therefore connected to the same switch.
+# @ifname: Either the name of an existing network interface supported
+#     by netmap, or the name of a VALE port (created on the fly). A
+#     VALE port name is in the form 'valeXXX:YYY', where XXX and YYY
+#     are non-negative integers.  XXX identifies a switch and YYY
+#     identifies a port of the switch.  VALE ports having the same XXX
+#     are therefore connected to the same switch.
 #
 # @devname: path of the netmap device (default: '/dev/netmap').
 #
@@ -422,7 +418,7 @@
 # @vhostforce: vhost on for non-MSIX virtio guests (default: false).
 #
 # @queues: number of queues to be created for multiqueue vhost-user
-#          (default: 1) (Since 2.5)
+#     (default: 1) (Since 2.5)
 #
 # Since: 2.1
 ##
@@ -437,21 +433,21 @@
 #
 # Vhost-vdpa network backend
 #
-# vDPA device is a device that uses a datapath which complies with the virtio
-# specifications with a vendor specific control path.
+# vDPA device is a device that uses a datapath which complies with the
+# virtio specifications with a vendor specific control path.
 #
-# @vhostdev: path of vhost-vdpa device
-#            (default:'/dev/vhost-vdpa-0')
+# @vhostdev: path of vhost-vdpa device (default:'/dev/vhost-vdpa-0')
 #
 # @vhostfd: file descriptor of an already opened vhost vdpa device
 #
 # @queues: number of queues to be created for multiqueue vhost-vdpa
-#          (default: 1)
+#     (default: 1)
 #
-# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.1)
-#         (default: false)
+# @x-svq: Start device with (experimental) shadow virtqueue.  (Since
+#     7.1) (default: false)
 #
 # Features:
+#
 # @unstable: Member @x-svq is experimental.
 #
 # Since: 5.1
@@ -472,31 +468,28 @@
 # interfaces that are in host mode and also with the host.
 #
 # @start-address: The starting IPv4 address to use for the interface.
-#                 Must be in the private IP range (RFC 1918). Must be
-#                 specified along with @end-address and @subnet-mask.
-#                 This address is used as the gateway address. The
-#                 subsequent address up to and including end-address are
-#                 placed in the DHCP pool.
+#     Must be in the private IP range (RFC 1918). Must be specified
+#     along with @end-address and @subnet-mask.  This address is used
+#     as the gateway address.  The subsequent address up to and
+#     including end-address are placed in the DHCP pool.
 #
 # @end-address: The DHCP IPv4 range end address to use for the
-#               interface. Must be in the private IP range (RFC 1918).
-#               Must be specified along with @start-address and
-#               @subnet-mask.
+#     interface.  Must be in the private IP range (RFC 1918). Must be
+#     specified along with @start-address and @subnet-mask.
 #
-# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
-#               be specified along with @start-address and @subnet-mask.
+# @subnet-mask: The IPv4 subnet mask to use on the interface.  Must be
+#     specified along with @start-address and @subnet-mask.
 #
-# @isolated: Enable isolation for this interface. Interface isolation
-#            ensures that vmnet interface is not able to communicate
-#            with any other vmnet interfaces. Only communication with
-#            host is allowed. Requires at least macOS Big Sur 11.0.
+# @isolated: Enable isolation for this interface.  Interface isolation
+#     ensures that vmnet interface is not able to communicate with any
+#     other vmnet interfaces.  Only communication with host is
+#     allowed.  Requires at least macOS Big Sur 11.0.
 #
 # @net-uuid: The identifier (UUID) to uniquely identify the isolated
-#            network vmnet interface should be added to. If
-#            set, no DHCP service is provided for this interface and
-#            network communication is allowed only with other interfaces
-#            added to this network identified by the UUID. Requires
-#            at least macOS Big Sur 11.0.
+#     network vmnet interface should be added to.  If set, no DHCP
+#     service is provided for this interface and network communication
+#     is allowed only with other interfaces added to this network
+#     identified by the UUID. Requires at least macOS Big Sur 11.0.
 #
 # Since: 7.1
 ##
@@ -515,34 +508,33 @@
 # vmnet (shared mode) network backend.
 #
 # Allows traffic originating from the vmnet interface to reach the
-# Internet through a network address translator (NAT).
-# The vmnet interface can communicate with the host and with
-# other shared mode interfaces on the same subnet. If no DHCP
-# settings, subnet mask and IPv6 prefix specified, the interface can
-# communicate with any of other interfaces in shared mode.
+# Internet through a network address translator (NAT). The vmnet
+# interface can communicate with the host and with other shared mode
+# interfaces on the same subnet.  If no DHCP settings, subnet mask and
+# IPv6 prefix specified, the interface can communicate with any of
+# other interfaces in shared mode.
 #
 # @start-address: The starting IPv4 address to use for the interface.
-#                 Must be in the private IP range (RFC 1918). Must be
-#                 specified along with @end-address and @subnet-mask.
-#                 This address is used as the gateway address. The
-#                 subsequent address up to and including end-address are
-#                 placed in the DHCP pool.
+#     Must be in the private IP range (RFC 1918). Must be specified
+#     along with @end-address and @subnet-mask.  This address is used
+#     as the gateway address.  The subsequent address up to and
+#     including end-address are placed in the DHCP pool.
 #
 # @end-address: The DHCP IPv4 range end address to use for the
-#               interface. Must be in the private IP range (RFC 1918).
-#               Must be specified along with @start-address and @subnet-mask.
+#     interface.  Must be in the private IP range (RFC 1918). Must be
+#     specified along with @start-address and @subnet-mask.
 #
-# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
-#               be specified along with @start-address and @subnet-mask.
+# @subnet-mask: The IPv4 subnet mask to use on the interface.  Must be
+#     specified along with @start-address and @subnet-mask.
 #
-# @isolated: Enable isolation for this interface. Interface isolation
-#            ensures that vmnet interface is not able to communicate
-#            with any other vmnet interfaces. Only communication with
-#            host is allowed. Requires at least macOS Big Sur 11.0.
+# @isolated: Enable isolation for this interface.  Interface isolation
+#     ensures that vmnet interface is not able to communicate with any
+#     other vmnet interfaces.  Only communication with host is
+#     allowed.  Requires at least macOS Big Sur 11.0.
 #
-# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
-#                unique local address i.e. start with fd00::/8 and have
-#                length of 64.
+# @nat66-prefix: The IPv6 prefix to use into guest network.  Must be a
+#     unique local address i.e. start with fd00::/8 and have length of
+#     64.
 #
 # Since: 7.1
 ##
@@ -564,10 +556,10 @@
 #
 # @ifname: The name of the physical interface to be bridged.
 #
-# @isolated: Enable isolation for this interface. Interface isolation
-#            ensures that vmnet interface is not able to communicate
-#            with any other vmnet interfaces. Only communication with
-#            host is allowed. Requires at least macOS Big Sur 11.0.
+# @isolated: Enable isolation for this interface.  Interface isolation
+#     ensures that vmnet interface is not able to communicate with any
+#     other vmnet interfaces.  Only communication with host is
+#     allowed.  Requires at least macOS Big Sur 11.0.
 #
 # Since: 7.1
 ##
@@ -582,13 +574,14 @@
 #
 # Configuration info for stream socket netdev
 #
-# @addr: socket address to listen on (server=true)
-#        or connect to (server=false)
+# @addr: socket address to listen on (server=true) or connect to
+#     (server=false)
+#
 # @server: create server socket (default: false)
-# @reconnect: For a client socket, if a socket is disconnected,
-#             then attempt a reconnect after the given number of seconds.
-#             Setting this to zero disables this function. (default: 0)
-#             (since 8.0)
+#
+# @reconnect: For a client socket, if a socket is disconnected, then
+#     attempt a reconnect after the given number of seconds.  Setting
+#     this to zero disables this function.  (default: 0) (since 8.0)
 #
 # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
@@ -606,13 +599,14 @@
 # Configuration info for datagram socket netdev.
 #
 # @remote: remote address
+#
 # @local: local address
 #
 # Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
 #
-# If remote address is present and it's a multicast address, local address
-# is optional. Otherwise local address is required and remote address is
-# optional.
+# If remote address is present and it's a multicast address, local
+# address is optional.  Otherwise local address is required and remote
+# address is optional.
 #
 # .. table:: Valid parameters combination table
 #    :widths: auto
@@ -764,9 +758,9 @@
 # @name: net client name
 #
 # Returns: list of @RxFilterInfo for all NICs (or for the given NIC).
-#          Returns an error if the given @name doesn't exist, or given
-#          NIC doesn't support rx-filter querying, or given net client
-#          isn't a NIC.
+#     Returns an error if the given @name doesn't exist, or given NIC
+#     doesn't support rx-filter querying, or given net client isn't a
+#     NIC.
 #
 # Since: 1.6
 #
@@ -798,7 +792,6 @@
 #         }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-rx-filter',
   'data': { '*name': 'str' },
@@ -807,8 +800,8 @@
 ##
 # @NIC_RX_FILTER_CHANGED:
 #
-# Emitted once until the 'query-rx-filter' command is executed, the first event
-# will always be emitted
+# Emitted once until the 'query-rx-filter' command is executed, the
+# first event will always be emitted
 #
 # @name: net client name
 #
@@ -822,7 +815,6 @@
 #      "data": { "name": "vnet0",
 #                "path": "/machine/peripheral/vnet0/virtio-backend" },
 #      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
-#
 ##
 { 'event': 'NIC_RX_FILTER_CHANGED',
   'data': { '*name': 'str', 'path': 'str' } }
@@ -833,7 +825,7 @@
 # Parameters for self-announce timers
 #
 # @initial: Initial delay (in ms) before sending the first GARP/RARP
-#           announcement
+#     announcement
 #
 # @max: Maximum delay (in ms) between GARP/RARP announcement packets
 #
@@ -841,12 +833,12 @@
 #
 # @step: Delay increase (in ms) after each self-announcement attempt
 #
-# @interfaces: An optional list of interface names, which restricts the
-#              announcement to the listed interfaces. (Since 4.1)
+# @interfaces: An optional list of interface names, which restricts
+#     the announcement to the listed interfaces.  (Since 4.1)
 #
 # @id: A name to be used to identify an instance of announce-timers
-#      and to allow it to modified later.  Not for use as
-#      part of the migration parameters. (Since 4.1)
+#     and to allow it to modified later.  Not for use as part of the
+#     migration parameters.  (Since 4.1)
 #
 # Since: 4.0
 ##
@@ -862,8 +854,9 @@
 ##
 # @announce-self:
 #
-# Trigger generation of broadcast RARP frames to update network switches.
-# This can be useful when network bonds fail-over the active slave.
+# Trigger generation of broadcast RARP frames to update network
+# switches.  This can be useful when network bonds fail-over the
+# active slave.
 #
 # Example:
 #
@@ -881,9 +874,10 @@
 ##
 # @FAILOVER_NEGOTIATED:
 #
-# Emitted when VIRTIO_NET_F_STANDBY was enabled during feature negotiation.
-# Failover primary devices which were hidden (not hotplugged when requested)
-# before will now be hotplugged by the virtio-net standby device.
+# Emitted when VIRTIO_NET_F_STANDBY was enabled during feature
+# negotiation.  Failover primary devices which were hidden (not
+# hotplugged when requested) before will now be hotplugged by the
+# virtio-net standby device.
 #
 # @device-id: QEMU device id of the unplugged device
 #
@@ -894,7 +888,6 @@
 # <- { "event": "FAILOVER_NEGOTIATED",
 #      "data": { "device-id": "net1" },
 #      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
-#
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
@@ -905,6 +898,7 @@
 # Emitted when the netdev stream backend is connected
 #
 # @netdev-id: QEMU netdev id that is connected
+#
 # @addr: The destination address
 #
 # Since: 7.2
@@ -921,7 +915,6 @@
 #      "data": { "netdev-id": "netdev0",
 #                "addr": { "path": "/tmp/qemu0", "type": "unix" } },
 #      "timestamp": { "seconds": 1666269706, "microseconds": 413651 } }
-#
 ##
 { 'event': 'NETDEV_STREAM_CONNECTED',
   'data': { 'netdev-id': 'str',
@@ -941,7 +934,6 @@
 # <- { 'event': 'NETDEV_STREAM_DISCONNECTED',
 #      'data': {'netdev-id': 'netdev0'},
 #      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
-#
 ##
 { 'event': 'NETDEV_STREAM_DISCONNECTED',
   'data': { 'netdev-id': 'str' } }
diff --git a/qapi/pci.json b/qapi/pci.json
index ee7c659fec..086c773052 100644
--- a/qapi/pci.json
+++ b/qapi/pci.json
@@ -29,8 +29,9 @@
 #
 # @bar: the index of the Base Address Register for this region
 #
-# @type: - 'io' if the region is a PIO region
-#        - 'memory' if the region is a MMIO region
+# @type:
+#     - 'io' if the region is a PIO region
+#     - 'memory' if the region is a MMIO region
 #
 # @size: memory size
 #
@@ -49,21 +50,21 @@
 #
 # Information about a bus of a PCI Bridge device
 #
-# @number: primary bus interface number.  This should be the number of the
-#          bus the device resides on.
+# @number: primary bus interface number.  This should be the number of
+#     the bus the device resides on.
 #
-# @secondary: secondary bus interface number.  This is the number of the
-#             main bus for the bridge
+# @secondary: secondary bus interface number.  This is the number of
+#     the main bus for the bridge
 #
 # @subordinate: This is the highest number bus that resides below the
-#               bridge.
+#     bridge.
 #
 # @io_range: The PIO range for all devices on this bridge
 #
 # @memory_range: The MMIO range for all devices on this bridge
 #
-# @prefetchable_range: The range of prefetchable MMIO for all devices on
-#                      this bridge
+# @prefetchable_range: The range of prefetchable MMIO for all devices
+#     on this bridge
 #
 # Since: 2.4
 ##
@@ -145,8 +146,8 @@
 #
 # @regions: a list of the PCI I/O regions associated with the device
 #
-# Notes: the contents of @class_info.desc are not stable and should only be
-#        treated as informational.
+# Notes: the contents of @class_info.desc are not stable and should
+#     only be treated as informational.
 #
 # Since: 0.14
 ##
@@ -174,10 +175,10 @@
 #
 # Return information about the PCI bus topology of the guest.
 #
-# Returns: a list of @PciInfo for each PCI bus. Each bus is
-#          represented by a json-object, which has a key with a json-array of
-#          all PCI devices attached to it. Each device is represented by a
-#          json-object.
+# Returns: a list of @PciInfo for each PCI bus.  Each bus is
+#     represented by a json-object, which has a key with a json-array
+#     of all PCI devices attached to it.  Each device is represented
+#     by a json-object.
 #
 # Since: 0.14
 #
@@ -310,7 +311,7 @@
 #       ]
 #    }
 #
-# Note: This example has been shortened as the real response is too long.
-#
+# Note: This example has been shortened as the real response is too
+#     long.
 ##
 { 'command': 'query-pci', 'returns': ['PciInfo'] }
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index bb7217da26..31e0b36454 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -5,17 +5,20 @@
 #
 # This document describes all commands currently supported by QMP.
 #
-# Most of the time their usage is exactly the same as in the user Monitor, this
-# means that any other document which also describe commands (the manpage,
-# QEMU's manual, etc) can and should be consulted.
+# Most of the time their usage is exactly the same as in the user
+# Monitor, this means that any other document which also describe
+# commands (the manpage, QEMU's manual, etc) can and should be
+# consulted.
 #
-# QMP has two types of commands: regular and query commands. Regular commands
-# usually change the Virtual Machine's state someway, while query commands just
-# return information. The sections below are divided accordingly.
+# QMP has two types of commands: regular and query commands.  Regular
+# commands usually change the Virtual Machine's state someway, while
+# query commands just return information.  The sections below are
+# divided accordingly.
 #
-# It's important to observe that all communication examples are formatted in
-# a reader-friendly way, so that they're easier to understand. However, in real
-# protocol usage, they're emitted as a single line.
+# It's important to observe that all communication examples are
+# formatted in a reader-friendly way, so that they're easier to
+# understand.  However, in real protocol usage, they're emitted as a
+# single line.
 #
 # Also, the following notation is used to denote data flow:
 #
@@ -26,8 +29,8 @@
 #   -> data issued by the Client
 #   <- Server data response
 #
-# Please, refer to the QMP specification (docs/interop/qmp-spec.txt) for
-# detailed information on the Server command and response formats.
+# Please, refer to the QMP specification (docs/interop/qmp-spec.txt)
+# for detailed information on the Server command and response formats.
 ##
 
 { 'include': 'pragma.json' }
diff --git a/qapi/qdev.json b/qapi/qdev.json
index f309facf8d..2d73b27c2a 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -17,11 +17,12 @@
 #
 # @typename: the type name of a device
 #
-# Returns: a list of ObjectPropertyInfo describing a devices properties
+# Returns: a list of ObjectPropertyInfo describing a devices
+#     properties
 #
-# Note: objects can create properties at runtime, for example to describe
-#       links between different devices and/or objects. These properties
-#       are not included in the output of this command.
+# Note: objects can create properties at runtime, for example to
+#     describe links between different devices and/or objects.  These
+#     properties are not included in the output of this command.
 #
 # Since: 1.2
 ##
@@ -41,12 +42,14 @@
 # @id: the device's ID, must be unique
 #
 # Features:
-# @json-cli: If present, the "-device" command line option supports JSON
-#            syntax with a structure identical to the arguments of this
-#            command.
-# @json-cli-hotplug: If present, the "-device" command line option supports JSON
-#                    syntax without the reference counting leak that broke
-#                    hot-unplug
+#
+# @json-cli: If present, the "-device" command line option supports
+#     JSON syntax with a structure identical to the arguments of this
+#     command.
+#
+# @json-cli-hotplug: If present, the "-device" command line option
+#     supports JSON syntax without the reference counting leak that
+#     broke hot-unplug
 #
 # Notes:
 #
@@ -68,9 +71,9 @@
 # <- { "return": {} }
 #
 # TODO: This command effectively bypasses QAPI completely due to its
-#       "additional arguments" business.  It shouldn't have been added to
-#       the schema in this form.  It should be qapified properly, or
-#       replaced by a properly qapified command.
+#     "additional arguments" business.  It shouldn't have been added
+#     to the schema in this form.  It should be qapified properly, or
+#     replaced by a properly qapified command.
 #
 # Since: 0.13
 ##
@@ -86,17 +89,18 @@
 #
 # @id: the device's ID or QOM path
 #
-# Returns: Nothing on success
-#          If @id is not a valid device, DeviceNotFound
+# Returns: Nothing on success If @id is not a valid device,
+#     DeviceNotFound
 #
-# Notes: When this command completes, the device may not be removed from the
-#        guest.  Hot removal is an operation that requires guest cooperation.
-#        This command merely requests that the guest begin the hot removal
-#        process.  Completion of the device removal process is signaled with a
-#        DEVICE_DELETED event. Guest reset will automatically complete removal
-#        for all devices.  If a guest-side error in the hot removal process is
-#        detected, the device will not be removed and a DEVICE_UNPLUG_GUEST_ERROR
-#        event is sent.  Some errors cannot be detected.
+# Notes: When this command completes, the device may not be removed
+#     from the guest.  Hot removal is an operation that requires guest
+#     cooperation.  This command merely requests that the guest begin
+#     the hot removal process.  Completion of the device removal
+#     process is signaled with a DEVICE_DELETED event.  Guest reset
+#     will automatically complete removal for all devices.  If a
+#     guest-side error in the hot removal process is detected, the
+#     device will not be removed and a DEVICE_UNPLUG_GUEST_ERROR event
+#     is sent.  Some errors cannot be detected.
 #
 # Since: 0.14
 #
@@ -109,16 +113,16 @@
 # -> { "execute": "device_del",
 #      "arguments": { "id": "/machine/peripheral-anon/device[0]" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'device_del', 'data': {'id': 'str'} }
 
 ##
 # @DEVICE_DELETED:
 #
-# Emitted whenever the device removal completion is acknowledged by the guest.
-# At this point, it's safe to reuse the specified device ID. Device removal can
-# be initiated by the guest or by HMP/QMP commands.
+# Emitted whenever the device removal completion is acknowledged by
+# the guest.  At this point, it's safe to reuse the specified device
+# ID. Device removal can be initiated by the guest or by HMP/QMP
+# commands.
 #
 # @device: the device's ID if it has one
 #
@@ -132,7 +136,6 @@
 #      "data": { "device": "virtio-net-pci-0",
 #                "path": "/machine/peripheral/virtio-net-pci-0" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
-#
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
@@ -140,7 +143,8 @@
 ##
 # @DEVICE_UNPLUG_GUEST_ERROR:
 #
-# Emitted when a device hot unplug fails due to a guest reported error.
+# Emitted when a device hot unplug fails due to a guest reported
+# error.
 #
 # @device: the device's ID if it has one
 #
@@ -154,7 +158,6 @@
 #      "data": { "device": "core1",
 #                "path": "/machine/peripheral/core1" },
 #      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
-#
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
diff --git a/qapi/qom.json b/qapi/qom.json
index 2a3891e3cb..f61badaba4 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -18,17 +18,20 @@
 #
 # @name: the name of the property
 #
-# @type: the type of the property.  This will typically come in one of four
-#        forms:
+# @type: the type of the property.  This will typically come in one of
+#     four forms:
 #
-#        1) A primitive type such as 'u8', 'u16', 'bool', 'str', or 'double'.
-#           These types are mapped to the appropriate JSON type.
+#     1) A primitive type such as 'u8', 'u16', 'bool', 'str', or
+#        'double'.  These types are mapped to the appropriate JSON
+#        type.
 #
-#        2) A child type in the form 'child<subtype>' where subtype is a qdev
-#           device type name.  Child properties create the composition tree.
+#     2) A child type in the form 'child<subtype>' where subtype is a
+#        qdev device type name.  Child properties create the
+#        composition tree.
 #
-#        3) A link type in the form 'link<subtype>' where subtype is a qdev
-#           device type name.  Link properties form the device model graph.
+#     3) A link type in the form 'link<subtype>' where subtype is a
+#        qdev device type name.  Link properties form the device model
+#        graph.
 #
 # @description: if specified, the description of the property.
 #
@@ -45,14 +48,14 @@
 ##
 # @qom-list:
 #
-# This command will list any properties of a object given a path in the object
-# model.
+# This command will list any properties of a object given a path in
+# the object model.
 #
-# @path: the path within the object model.  See @qom-get for a description of
-#        this parameter.
+# @path: the path within the object model.  See @qom-get for a
+#     description of this parameter.
 #
-# Returns: a list of @ObjectPropertyInfo that describe the properties of the
-#          object.
+# Returns: a list of @ObjectPropertyInfo that describe the properties
+#     of the object.
 #
 # Since: 1.2
 #
@@ -64,7 +67,6 @@
 #                  { "name": "parallel0", "type": "child<chardev-vc>" },
 #                  { "name": "serial0", "type": "child<chardev-vc>" },
 #                  { "name": "mon0", "type": "child<chardev-stdio>" } ] }
-#
 ##
 { 'command': 'qom-list',
   'data': { 'path': 'str' },
@@ -74,32 +76,31 @@
 ##
 # @qom-get:
 #
-# This command will get a property from a object model path and return the
-# value.
+# This command will get a property from a object model path and return
+# the value.
 #
-# @path: The path within the object model.  There are two forms of supported
-#        paths--absolute and partial paths.
+# @path: The path within the object model.  There are two forms of
+#     supported paths--absolute and partial paths.
 #
-#        Absolute paths are derived from the root object and can follow child<>
-#        or link<> properties.  Since they can follow link<> properties, they
-#        can be arbitrarily long.  Absolute paths look like absolute filenames
-#        and are prefixed  with a leading slash.
+#     Absolute paths are derived from the root object and can follow
+#     child<> or link<> properties.  Since they can follow link<>
+#     properties, they can be arbitrarily long.  Absolute paths look
+#     like absolute filenames and are prefixed  with a leading slash.
 #
-#        Partial paths look like relative filenames.  They do not begin
-#        with a prefix.  The matching rules for partial paths are subtle but
-#        designed to make specifying objects easy.  At each level of the
-#        composition tree, the partial path is matched as an absolute path.
-#        The first match is not returned.  At least two matches are searched
-#        for.  A successful result is only returned if only one match is
-#        found.  If more than one match is found, a flag is return to
-#        indicate that the match was ambiguous.
+#     Partial paths look like relative filenames.  They do not begin
+#     with a prefix.  The matching rules for partial paths are subtle
+#     but designed to make specifying objects easy.  At each level of
+#     the composition tree, the partial path is matched as an absolute
+#     path.  The first match is not returned.  At least two matches
+#     are searched for.  A successful result is only returned if only
+#     one match is found.  If more than one match is found, a flag is
+#     return to indicate that the match was ambiguous.
 #
 # @property: The property name to read
 #
-# Returns: The property value.  The type depends on the property
-#          type. child<> and link<> properties are returned as #str
-#          pathnames.  All integer property types (u8, u16, etc) are
-#          returned as #int.
+# Returns: The property value.  The type depends on the property type.
+#     child<> and link<> properties are returned as #str pathnames.
+#     All integer property types (u8, u16, etc) are returned as #int.
 #
 # Since: 1.2
 #
@@ -118,7 +119,6 @@
 #      "arguments": { "path": "unattached/sysbus",
 #                     "property": "type" } }
 # <- { "return": "System" }
-#
 ##
 { 'command': 'qom-get',
   'data': { 'path': 'str', 'property': 'str' },
@@ -134,8 +134,8 @@
 #
 # @property: the property name to set
 #
-# @value: a value who's type is appropriate for the property type.  See @qom-get
-#         for a description of type mapping.
+# @value: a value who's type is appropriate for the property type.
+#     See @qom-get for a description of type mapping.
 #
 # Since: 1.2
 #
@@ -146,7 +146,6 @@
 #                     "property": "graphics",
 #                     "value": false } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'qom-set',
   'data': { 'path': 'str', 'property': 'str', 'value': 'any' },
@@ -160,7 +159,7 @@
 # @name: the type name found in the search
 #
 # @abstract: the type is abstract and can't be directly instantiated.
-#            Omitted if false. (since 2.10)
+#     Omitted if false.  (since 2.10)
 #
 # @parent: Name of parent type, if any (since 2.10)
 #
@@ -174,11 +173,13 @@
 #
 # This command will return a list of types given search parameters
 #
-# @implements: if specified, only return types that implement this type name
+# @implements: if specified, only return types that implement this
+#     type name
 #
 # @abstract: if true, include abstract types in the results
 #
-# Returns: a list of @ObjectTypeInfo or an empty list if no results are found
+# Returns: a list of @ObjectTypeInfo or an empty list if no results
+#     are found
 #
 # Since: 1.1
 ##
@@ -194,9 +195,9 @@
 #
 # @typename: the type name of an object
 #
-# Note: objects can create properties at runtime, for example to describe
-#       links between different devices and/or objects. These properties
-#       are not included in the output of this command.
+# Note: objects can create properties at runtime, for example to
+#     describe links between different devices and/or objects.  These
+#     properties are not included in the output of this command.
 #
 # Returns: a list of ObjectPropertyInfo describing object properties
 #
@@ -214,7 +215,8 @@
 #
 # @if: interface name of the host system CAN bus to connect to
 #
-# @canbus: object ID of the can-bus object to connect to the host interface
+# @canbus: object ID of the can-bus object to connect to the host
+#     interface
 #
 # Since: 2.12
 ##
@@ -227,34 +229,35 @@
 #
 # Properties for colo-compare objects.
 #
-# @primary_in: name of the character device backend to use for the primary
-#              input (incoming packets are redirected to @outdev)
+# @primary_in: name of the character device backend to use for the
+#     primary input (incoming packets are redirected to @outdev)
 #
-# @secondary_in: name of the character device backend to use for secondary
-#                input (incoming packets are only compared to the input on
-#                @primary_in and then dropped)
+# @secondary_in: name of the character device backend to use for
+#     secondary input (incoming packets are only compared to the input
+#     on @primary_in and then dropped)
 #
 # @outdev: name of the character device backend to use for output
 #
 # @iothread: name of the iothread to run in
 #
-# @notify_dev: name of the character device backend to be used to communicate
-#              with the remote colo-frame (only for Xen COLO)
+# @notify_dev: name of the character device backend to be used to
+#     communicate with the remote colo-frame (only for Xen COLO)
 #
-# @compare_timeout: the maximum time to hold a packet from @primary_in for
-#                   comparison with an incoming packet on @secondary_in in
-#                   milliseconds (default: 3000)
+# @compare_timeout: the maximum time to hold a packet from @primary_in
+#     for comparison with an incoming packet on @secondary_in in
+#     milliseconds (default: 3000)
 #
-# @expired_scan_cycle: the interval at which colo-compare checks whether
-#                      packets from @primary have timed out, in milliseconds
-#                      (default: 3000)
+# @expired_scan_cycle: the interval at which colo-compare checks
+#     whether packets from @primary have timed out, in milliseconds
+#     (default: 3000)
 #
-# @max_queue_size: the maximum number of packets to keep in the queue for
-#                  comparing with incoming packets from @secondary_in.  If the
-#                  queue is full and additional packets are received, the
-#                  additional packets are dropped. (default: 1024)
+# @max_queue_size: the maximum number of packets to keep in the queue
+#     for comparing with incoming packets from @secondary_in.  If the
+#     queue is full and additional packets are received, the
+#     additional packets are dropped.  (default: 1024)
 #
-# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+# @vnet_hdr_support: if true, vnet header support is enabled
+#     (default: false)
 #
 # Since: 2.8
 ##
@@ -272,11 +275,12 @@
 ##
 # @CryptodevBackendProperties:
 #
-# Properties for cryptodev-backend and cryptodev-backend-builtin objects.
+# Properties for cryptodev-backend and cryptodev-backend-builtin
+# objects.
 #
-# @queues: the number of queues for the cryptodev backend. Ignored for
-#          cryptodev-backend and must be 1 for cryptodev-backend-builtin.
-#          (default: 1)
+# @queues: the number of queues for the cryptodev backend.  Ignored
+#     for cryptodev-backend and must be 1 for
+#     cryptodev-backend-builtin.  (default: 1)
 #
 # @throttle-bps: limit total bytes per second (Since 8.0)
 #
@@ -294,8 +298,8 @@
 #
 # Properties for cryptodev-vhost-user objects.
 #
-# @chardev: the name of a Unix domain socket character device that connects to
-#           the vhost-user server
+# @chardev: the name of a Unix domain socket character device that
+#     connects to the vhost-user server
 #
 # Since: 2.12
 ##
@@ -310,8 +314,8 @@
 #
 # @addr: the name of the DBus bus to connect to
 #
-# @id-list: a comma separated list of DBus IDs of helpers whose data should be
-#           included in the VM state on migration
+# @id-list: a comma separated list of DBus IDs of helpers whose data
+#     should be included in the VM state on migration
 #
 # Since: 5.0
 ##
@@ -322,7 +326,8 @@
 ##
 # @NetfilterInsert:
 #
-# Indicates where to insert a netfilter relative to a given other filter.
+# Indicates where to insert a netfilter relative to a given other
+# filter.
 #
 # @before: insert before the specified filter
 #
@@ -342,20 +347,20 @@
 #
 # @queue: indicates which queue(s) to filter (default: all)
 #
-# @status: indicates whether the filter is enabled ("on") or disabled ("off")
-#          (default: "on")
+# @status: indicates whether the filter is enabled ("on") or disabled
+#     ("off") (default: "on")
 #
-# @position: specifies where the filter should be inserted in the filter list.
-#            "head" means the filter is inserted at the head of the filter list,
-#            before any existing filters.
-#            "tail" means the filter is inserted at the tail of the filter list,
-#            behind any existing filters (default).
-#            "id=<id>" means the filter is inserted before or behind the filter
-#            specified by <id>, depending on the @insert property.
-#            (default: "tail")
+# @position: specifies where the filter should be inserted in the
+#     filter list.  "head" means the filter is inserted at the head of
+#     the filter list, before any existing filters.  "tail" means the
+#     filter is inserted at the tail of the filter list, behind any
+#     existing filters (default). "id=<id>" means the filter is
+#     inserted before or behind the filter specified by <id>,
+#     depending on the @insert property.  (default: "tail")
 #
-# @insert: where to insert the filter relative to the filter given in @position.
-#          Ignored if @position is "head" or "tail". (default: behind)
+# @insert: where to insert the filter relative to the filter given in
+#     @position.  Ignored if @position is "head" or "tail".
+#     (default: behind)
 #
 # Since: 2.5
 ##
@@ -371,8 +376,9 @@
 #
 # Properties for filter-buffer objects.
 #
-# @interval: a non-zero interval in microseconds.  All packets arriving in the
-#            given interval are delayed until the end of the interval.
+# @interval: a non-zero interval in microseconds.  All packets
+#     arriving in the given interval are delayed until the end of the
+#     interval.
 #
 # Since: 2.5
 ##
@@ -387,7 +393,8 @@
 #
 # @file: the filename where the dumped packets should be stored
 #
-# @maxlen: maximum number of bytes in a packet that are stored (default: 65536)
+# @maxlen: maximum number of bytes in a packet that are stored
+#     (default: 65536)
 #
 # Since: 2.5
 ##
@@ -401,10 +408,11 @@
 #
 # Properties for filter-mirror objects.
 #
-# @outdev: the name of a character device backend to which all incoming packets
-#          are mirrored
+# @outdev: the name of a character device backend to which all
+#     incoming packets are mirrored
 #
-# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+# @vnet_hdr_support: if true, vnet header support is enabled
+#     (default: false)
 #
 # Since: 2.6
 ##
@@ -418,16 +426,17 @@
 #
 # Properties for filter-redirector objects.
 #
-# At least one of @indev or @outdev must be present.  If both are present, they
-# must not refer to the same character device backend.
+# At least one of @indev or @outdev must be present.  If both are
+# present, they must not refer to the same character device backend.
 #
-# @indev: the name of a character device backend from which packets are
-#         received and redirected to the filtered network device
+# @indev: the name of a character device backend from which packets
+#     are received and redirected to the filtered network device
 #
-# @outdev: the name of a character device backend to which all incoming packets
-#          are redirected
+# @outdev: the name of a character device backend to which all
+#     incoming packets are redirected
 #
-# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+# @vnet_hdr_support: if true, vnet header support is enabled
+#     (default: false)
 #
 # Since: 2.6
 ##
@@ -442,7 +451,8 @@
 #
 # Properties for filter-rewriter objects.
 #
-# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
+# @vnet_hdr_support: if true, vnet header support is enabled
+#     (default: false)
 #
 # Since: 2.8
 ##
@@ -455,17 +465,18 @@
 #
 # Properties for input-barrier objects.
 #
-# @name: the screen name as declared in the screens section of barrier.conf
+# @name: the screen name as declared in the screens section of
+#     barrier.conf
 #
 # @server: hostname of the Barrier server (default: "localhost")
 #
 # @port: TCP port of the Barrier server (default: "24800")
 #
 # @x-origin: x coordinate of the leftmost pixel on the guest screen
-#            (default: "0")
+#     (default: "0")
 #
 # @y-origin: y coordinate of the topmost pixel on the guest screen
-#            (default: "0")
+#     (default: "0")
 #
 # @width: the width of secondary screen in pixels (default: "1920")
 #
@@ -489,13 +500,13 @@
 #
 # @evdev: the path of the host evdev device to use
 #
-# @grab_all: if true, grab is toggled for all devices (e.g. both keyboard and
-#            mouse) instead of just one device (default: false)
+# @grab_all: if true, grab is toggled for all devices (e.g. both
+#     keyboard and mouse) instead of just one device (default: false)
 #
 # @repeat: enables auto-repeat events (default: false)
 #
 # @grab-toggle: the key or key combination that toggles device grab
-#               (default: ctrl-ctrl)
+#     (default: ctrl-ctrl)
 #
 # Since: 2.6
 ##
@@ -510,15 +521,15 @@
 #
 # Common properties for event loops
 #
-# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
-#                 0 means that the engine will use its default.
-#                 (default: 0)
+# @aio-max-batch: maximum number of requests in a batch for the AIO
+#     engine, 0 means that the engine will use its default.
+#     (default: 0)
 #
-# @thread-pool-min: minimum number of threads reserved in the thread pool
-#                   (default:0)
+# @thread-pool-min: minimum number of threads reserved in the thread
+#     pool (default:0)
 #
-# @thread-pool-max: maximum number of threads the thread pool can contain
-#                   (default:64)
+# @thread-pool-max: maximum number of threads the thread pool can
+#     contain (default:64)
 #
 # Since: 7.1
 ##
@@ -532,17 +543,17 @@
 #
 # Properties for iothread objects.
 #
-# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
-#               0 means polling is disabled (default: 32768 on POSIX hosts,
-#               0 otherwise)
+# @poll-max-ns: the maximum number of nanoseconds to busy wait for
+#     events.  0 means polling is disabled (default: 32768 on POSIX
+#     hosts, 0 otherwise)
 #
-# @poll-grow: the multiplier used to increase the polling time when the
-#             algorithm detects it is missing events due to not polling long
-#             enough. 0 selects a default behaviour (default: 0)
+# @poll-grow: the multiplier used to increase the polling time when
+#     the algorithm detects it is missing events due to not polling
+#     long enough.  0 selects a default behaviour (default: 0)
 #
 # @poll-shrink: the divisor used to decrease the polling time when the
-#               algorithm detects it is spending too long polling without
-#               encountering events. 0 selects a default behaviour (default: 0)
+#     algorithm detects it is spending too long polling without
+#     encountering events.  0 selects a default behaviour (default: 0)
 #
 # The @aio-max-batch option is available since 6.1.
 #
@@ -570,11 +581,11 @@
 #
 # Properties for objects of classes derived from memory-backend.
 #
-# @merge: if true, mark the memory as mergeable (default depends on the machine
-#         type)
+# @merge: if true, mark the memory as mergeable (default depends on
+#     the machine type)
 #
-# @dump: if true, include the memory in core dumps (default depends on the
-#        machine type)
+# @dump: if true, include the memory in core dumps (default depends on
+#     the machine type)
 #
 # @host-nodes: the list of NUMA host nodes to bind the memory to
 #
@@ -582,31 +593,31 @@
 #
 # @prealloc: if true, preallocate memory (default: false)
 #
-# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
+# @prealloc-threads: number of CPU threads to use for prealloc
+#     (default: 1)
 #
-# @prealloc-context: thread context to use for creation of preallocation threads
-#                    (default: none) (since 7.2)
+# @prealloc-context: thread context to use for creation of
+#     preallocation threads (default: none) (since 7.2)
 #
-# @share: if false, the memory is private to QEMU; if true, it is shared
-#         (default: false)
+# @share: if false, the memory is private to QEMU; if true, it is
+#     shared (default: false)
 #
 # @reserve: if true, reserve swap space (or huge pages) if applicable
-#           (default: true) (since 6.1)
+#     (default: true) (since 6.1)
 #
 # @size: size of the memory region in bytes
 #
-# @x-use-canonical-path-for-ramblock-id: if true, the canonical path is used
-#                                        for ramblock-id. Disable this for 4.0
-#                                        machine types or older to allow
-#                                        migration with newer QEMU versions.
-#                                        (default: false generally,
-#                                        but true for machine types <= 4.0)
+# @x-use-canonical-path-for-ramblock-id: if true, the canonical path
+#     is used for ramblock-id.  Disable this for 4.0 machine types or
+#     older to allow migration with newer QEMU versions.
+#     (default: false generally, but true for machine types <= 4.0)
 #
-# Note: prealloc=true and reserve=false cannot be set at the same time. With
-#       reserve=true, the behavior depends on the operating system: for example,
-#       Linux will not reserve swap space for shared file mappings --
-#       "not applicable". In contrast, reserve=false will bail out if it cannot
-#       be configured accordingly.
+# Note: prealloc=true and reserve=false cannot be set at the same
+#     time.  With reserve=true, the behavior depends on the operating
+#     system: for example, Linux will not reserve swap space for
+#     shared file mappings -- "not applicable". In contrast,
+#     reserve=false will bail out if it cannot be configured
+#     accordingly.
 #
 # Since: 2.1
 ##
@@ -628,27 +639,29 @@
 #
 # Properties for memory-backend-file objects.
 #
-# @align: the base address alignment when QEMU mmap(2)s @mem-path. Some
-#         backend stores specified by @mem-path require an alignment different
-#         than the default one used by QEMU, e.g. the device DAX /dev/dax0.0
-#         requires 2M alignment rather than 4K. In such cases, users can
-#         specify the required alignment via this option.
-#         0 selects a default alignment (currently the page size). (default: 0)
+# @align: the base address alignment when QEMU mmap(2)s @mem-path.
+#     Some backend stores specified by @mem-path require an alignment
+#     different than the default one used by QEMU, e.g. the device DAX
+#     /dev/dax0.0 requires 2M alignment rather than 4K. In such cases,
+#     users can specify the required alignment via this option.  0
+#     selects a default alignment (currently the page size).
+#     (default: 0)
 #
-# @discard-data: if true, the file contents can be destroyed when QEMU exits,
-#                to avoid unnecessarily flushing data to the backing file. Note
-#                that @discard-data is only an optimization, and QEMU might
-#                not discard file contents if it aborts unexpectedly or is
-#                terminated using SIGKILL. (default: false)
+# @discard-data: if true, the file contents can be destroyed when QEMU
+#     exits, to avoid unnecessarily flushing data to the backing file.
+#     Note that @discard-data is only an optimization, and QEMU might
+#     not discard file contents if it aborts unexpectedly or is
+#     terminated using SIGKILL. (default: false)
 #
-# @mem-path: the path to either a shared memory or huge page filesystem mount
+# @mem-path: the path to either a shared memory or huge page
+#     filesystem mount
 #
-# @pmem: specifies whether the backing file specified by @mem-path is in
-#        host persistent memory that can be accessed using the SNIA NVM
-#        programming model (e.g. Intel NVDIMM).
+# @pmem: specifies whether the backing file specified by @mem-path is
+#     in host persistent memory that can be accessed using the SNIA
+#     NVM programming model (e.g.  Intel NVDIMM).
 #
-# @readonly: if true, the backing file is opened read-only; if false, it is
-#            opened read-write. (default: false)
+# @readonly: if true, the backing file is opened read-only; if false,
+#     it is opened read-write.  (default: false)
 #
 # Since: 2.1
 ##
@@ -667,16 +680,16 @@
 #
 # The @share boolean option is true by default with memfd.
 #
-# @hugetlb: if true, the file to be created resides in the hugetlbfs filesystem
-#           (default: false)
+# @hugetlb: if true, the file to be created resides in the hugetlbfs
+#     filesystem (default: false)
 #
-# @hugetlbsize: the hugetlb page size on systems that support multiple hugetlb
-#               page sizes (it must be a power of 2 value supported by the
-#               system). 0 selects a default page size. This option is ignored
-#               if @hugetlb is false. (default: 0)
+# @hugetlbsize: the hugetlb page size on systems that support multiple
+#     hugetlb page sizes (it must be a power of 2 value supported by
+#     the system). 0 selects a default page size.  This option is
+#     ignored if @hugetlb is false.  (default: 0)
 #
-# @seal: if true, create a sealed-file, which will block further resizing of
-#        the memory (default: true)
+# @seal: if true, create a sealed-file, which will block further
+#     resizing of the memory (default: true)
 #
 # Since: 2.12
 ##
@@ -708,7 +721,8 @@
 #
 # Properties for pr-manager-helper objects.
 #
-# @path: the path to a Unix domain socket for connecting to the external helper
+# @path: the path to a Unix domain socket for connecting to the
+#     external helper
 #
 # Since: 2.11
 ##
@@ -737,7 +751,8 @@
 #
 # @fd: file descriptor name previously passed via 'getfd' command
 #
-# @devid: the id of the device to be associated with the file descriptor
+# @devid: the id of the device to be associated with the file
+#     descriptor
 #
 # Since: 6.0
 ##
@@ -763,13 +778,15 @@
 #
 # Properties for objects of classes derived from rng.
 #
-# @opened: if true, the device is opened immediately when applying this option
-#          and will probably fail when processing the next option. Don't use;
-#          only provided for compatibility. (default: false)
+# @opened: if true, the device is opened immediately when applying
+#     this option and will probably fail when processing the next
+#     option.  Don't use; only provided for compatibility.
+#     (default: false)
 #
 # Features:
-# @deprecated: Member @opened is deprecated.  Setting true doesn't make sense,
-#              and false is already the default.
+#
+# @deprecated: Member @opened is deprecated.  Setting true doesn't
+#     make sense, and false is already the default.
 #
 # Since: 1.3
 ##
@@ -781,8 +798,8 @@
 #
 # Properties for rng-egd objects.
 #
-# @chardev: the name of a character device backend that provides the connection
-#           to the RNG daemon
+# @chardev: the name of a character device backend that provides the
+#     connection to the RNG daemon
 #
 # Since: 1.3
 ##
@@ -795,8 +812,8 @@
 #
 # Properties for rng-random objects.
 #
-# @filename: the filename of the device on the host to obtain entropy from
-#            (default: "/dev/urandom")
+# @filename: the filename of the device on the host to obtain entropy
+#     from (default: "/dev/urandom")
 #
 # Since: 1.3
 ##
@@ -822,11 +839,11 @@
 # @cbitpos: C-bit location in page table entry (default: 0)
 #
 # @reduced-phys-bits: number of bits in physical addresses that become
-#                     unavailable when SEV is enabled
+#     unavailable when SEV is enabled
 #
 # @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
-#                 designated guest firmware page for measured boot
-#                 with -kernel (default: false) (since 6.2)
+#     designated guest firmware page for measured boot with -kernel
+#     (default: false) (since 6.2)
 #
 # Since: 2.12
 ##
@@ -845,15 +862,15 @@
 #
 # Properties for thread context objects.
 #
-# @cpu-affinity: the list of host CPU numbers used as CPU affinity for all
-#                threads created in the thread context (default: QEMU main
-#                thread CPU affinity)
+# @cpu-affinity: the list of host CPU numbers used as CPU affinity for
+#     all threads created in the thread context (default: QEMU main
+#     thread CPU affinity)
 #
-# @node-affinity: the list of host node numbers that will be resolved to a
-#                 list of host CPU numbers used as CPU affinity. This is a
-#                 shortcut for specifying the list of host CPU numbers
-#                 belonging to the host nodes manually by setting
-#                 @cpu-affinity. (default: QEMU main thread affinity)
+# @node-affinity: the list of host node numbers that will be resolved
+#     to a list of host CPU numbers used as CPU affinity.  This is a
+#     shortcut for specifying the list of host CPU numbers belonging
+#     to the host nodes manually by setting @cpu-affinity.
+#     (default: QEMU main thread affinity)
 #
 # Since: 7.2
 ##
@@ -866,6 +883,7 @@
 # @ObjectType:
 #
 # Features:
+#
 # @unstable: Member @x-remote-object is experimental.
 #
 # Since: 6.0
@@ -998,8 +1016,8 @@
 #
 # Create a QOM object.
 #
-# Returns: Nothing on success
-#          Error if @qom-type is not a valid class name
+# Returns: Nothing on success Error if @qom-type is not a valid class
+#     name
 #
 # Since: 2.0
 #
@@ -1009,7 +1027,6 @@
 #      "arguments": { "qom-type": "rng-random", "id": "rng1",
 #                     "filename": "/dev/hwrng" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'object-add', 'data': 'ObjectOptions', 'boxed': true,
   'allow-preconfig': true }
@@ -1021,8 +1038,8 @@
 #
 # @id: the name of the QOM object to remove
 #
-# Returns: Nothing on success
-#          Error if @id is not a valid id for a QOM object
+# Returns: Nothing on success Error if @id is not a valid id for a QOM
+#     object
 #
 # Since: 2.0
 #
@@ -1030,7 +1047,6 @@
 #
 # -> { "execute": "object-del", "arguments": { "id": "rng1" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'object-del', 'data': {'id': 'str'},
   'allow-preconfig': true }
diff --git a/qapi/rdma.json b/qapi/rdma.json
index 5b6b66afa4..23ebcf7885 100644
--- a/qapi/rdma.json
+++ b/qapi/rdma.json
@@ -30,7 +30,6 @@
 #         "interface-id": 15880512517475447892,
 #         "gid-status": true,
 #         "subnet-prefix": 33022}}
-#
 ##
 { 'event': 'RDMA_GID_STATUS_CHANGED',
   'data': { 'netdev'        : 'str',
diff --git a/qapi/replay.json b/qapi/replay.json
index fcbf10e237..289b2d3658 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -13,13 +13,13 @@
 #
 # Mode of the replay subsystem.
 #
-# @none: normal execution mode. Replay or record are not enabled.
+# @none: normal execution mode.  Replay or record are not enabled.
 #
-# @record: record mode. All non-deterministic data is written into the
-#          replay log.
+# @record: record mode.  All non-deterministic data is written into
+#     the replay log.
 #
-# @play: replay mode. Non-deterministic data required for system execution
-#        is read from the log.
+# @play: replay mode.  Non-deterministic data required for system
+#     execution is read from the log.
 #
 # Since: 2.5
 ##
@@ -33,9 +33,8 @@
 #
 # @mode: current mode.
 #
-# @filename: name of the record/replay log file.
-#            It is present only in record or replay modes, when the log
-#            is recorded or replayed.
+# @filename: name of the record/replay log file.  It is present only
+#     in record or replay modes, when the log is recorded or replayed.
 #
 # @icount: current number of executed instructions.
 #
@@ -47,9 +46,9 @@
 ##
 # @query-replay:
 #
-# Retrieve the record/replay information.
-# It includes current instruction count which may be used for
-# @replay-break and @replay-seek commands.
+# Retrieve the record/replay information.  It includes current
+# instruction count which may be used for @replay-break and
+# @replay-seek commands.
 #
 # Returns: record/replay information.
 #
@@ -59,7 +58,6 @@
 #
 # -> { "execute": "query-replay" }
 # <- { "return": { "mode": "play", "filename": "log.rr", "icount": 220414 } }
-#
 ##
 { 'command': 'query-replay',
   'returns': 'ReplayInfo' }
@@ -67,12 +65,12 @@
 ##
 # @replay-break:
 #
-# Set replay breakpoint at instruction count @icount.
-# Execution stops when the specified instruction is reached.
-# There can be at most one breakpoint. When breakpoint is set, any prior
-# one is removed.  The breakpoint may be set only in replay mode and only
-# "in the future", i.e. at instruction counts greater than the current one.
-# The current instruction count can be observed with @query-replay.
+# Set replay breakpoint at instruction count @icount.  Execution stops
+# when the specified instruction is reached.  There can be at most one
+# breakpoint.  When breakpoint is set, any prior one is removed.  The
+# breakpoint may be set only in replay mode and only "in the future",
+# i.e. at instruction counts greater than the current one.  The
+# current instruction count can be observed with @query-replay.
 #
 # @icount: instruction count to stop at
 #
@@ -82,15 +80,14 @@
 #
 # -> { "execute": "replay-break", "arguments": { "icount": 220414 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'replay-break', 'data': { 'icount': 'int' } }
 
 ##
 # @replay-delete-break:
 #
-# Remove replay breakpoint which was set with @replay-break.
-# The command is ignored when there are no replay breakpoints.
+# Remove replay breakpoint which was set with @replay-break.  The
+# command is ignored when there are no replay breakpoints.
 #
 # Since: 5.2
 #
@@ -98,7 +95,6 @@
 #
 # -> { "execute": "replay-delete-break" }
 # <- { "return": {} }
-#
 ##
 { 'command': 'replay-delete-break' }
 
@@ -106,11 +102,11 @@
 # @replay-seek:
 #
 # Automatically proceed to the instruction count @icount, when
-# replaying the execution. The command automatically loads nearest
+# replaying the execution.  The command automatically loads nearest
 # snapshot and replays the execution to find the desired instruction.
-# When there is no preceding snapshot or the execution is not replayed,
-# then the command fails.
-# icount for the reference may be obtained with @query-replay command.
+# When there is no preceding snapshot or the execution is not
+# replayed, then the command fails.  icount for the reference may be
+# obtained with @query-replay command.
 #
 # @icount: target instruction count
 #
diff --git a/qapi/rocker.json b/qapi/rocker.json
index b48e49a89b..31ce0b36f6 100644
--- a/qapi/rocker.json
+++ b/qapi/rocker.json
@@ -34,7 +34,6 @@
 #
 # -> { "execute": "query-rocker", "arguments": { "name": "sw1" } }
 # <- { "return": {"name": "sw1", "ports": 2, "id": 1327446905938}}
-#
 ##
 { 'command': 'query-rocker',
   'data': { 'name': 'str' },
@@ -107,7 +106,6 @@
 #                  {"duplex": "full", "enabled": true, "name": "sw1.2",
 #                   "autoneg": "off", "link-up": true, "speed": 10000}
 #    ]}
-#
 ##
 { 'command': 'query-rocker-ports',
   'data': { 'name': 'str' },
@@ -141,7 +139,7 @@
 # @ip-dst: IP header destination address
 #
 # Note: optional members may or may not appear in the flow key
-#       depending if they're relevant to the flow key.
+#     depending if they're relevant to the flow key.
 #
 # Since: 2.4
 ##
@@ -171,7 +169,7 @@
 # @ip-tos: IP header TOS field
 #
 # Note: optional members may or may not appear in the flow mask
-#       depending if they're relevant to the flow mask.
+#     depending if they're relevant to the flow mask.
 #
 # Since: 2.4
 ##
@@ -198,7 +196,7 @@
 # @out-pport: physical output port
 #
 # Note: optional members may or may not appear in the flow action
-#       depending if they're relevant to the flow action.
+#     depending if they're relevant to the flow action.
 #
 # Since: 2.4
 ##
@@ -235,8 +233,8 @@
 #
 # @name: switch name
 #
-# @tbl-id: flow table ID.  If tbl-id is not specified, returns
-#          flow information for all tables.
+# @tbl-id: flow table ID.  If tbl-id is not specified, returns flow
+#     information for all tables.
 #
 # Returns: rocker OF-DPA flow information
 #
@@ -254,7 +252,6 @@
 #                  },
 #                  {...more...},
 #    ]}
-#
 ##
 { 'command': 'query-rocker-of-dpa-flows',
   'data': { 'name': 'str', '*tbl-id': 'uint32' },
@@ -292,7 +289,7 @@
 # @ttl-check: perform TTL check
 #
 # Note: optional members may or may not appear in the group depending
-#       if they're relevant to the group type.
+#     if they're relevant to the group type.
 #
 # Since: 2.4
 ##
@@ -311,8 +308,8 @@
 #
 # @name: switch name
 #
-# @type: group type.  If type is not specified, returns
-#        group information for all group types.
+# @type: group type.  If type is not specified, returns group
+#     information for all group types.
 #
 # Returns: rocker OF-DPA group information
 #
@@ -335,7 +332,6 @@
 #                   "pport": 0, "vlan-id": 3840,
 #                   "pop-vlan": 1, "id": 251658240}
 #    ]}
-#
 ##
 { 'command': 'query-rocker-of-dpa-groups',
   'data': { 'name': 'str', '*type': 'uint8' },
diff --git a/qapi/run-state.json b/qapi/run-state.json
index e5f5d31395..8a54bf12f1 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -16,16 +16,16 @@
 # @finish-migrate: guest is paused to finish the migration process
 #
 # @inmigrate: guest is paused waiting for an incoming migration.  Note
-#             that this state does not tell whether the machine will start at the
-#             end of the migration.  This depends on the command-line -S option and
-#             any invocation of 'stop' or 'cont' that has happened since QEMU was
-#             started.
+#     that this state does not tell whether the machine will start at
+#     the end of the migration.  This depends on the command-line -S
+#     option and any invocation of 'stop' or 'cont' that has happened
+#     since QEMU was started.
 #
-# @internal-error: An internal error that prevents further guest execution
-#                  has occurred
+# @internal-error: An internal error that prevents further guest
+#     execution has occurred
 #
-# @io-error: the last IOP has failed and the device is configured to pause
-#            on I/O errors
+# @io-error: the last IOP has failed and the device is configured to
+#     pause on I/O errors
 #
 # @paused: guest has been paused via the 'stop' command
 #
@@ -43,13 +43,15 @@
 #
 # @suspended: guest is suspended (ACPI S3)
 #
-# @watchdog: the watchdog action is configured to pause and has been triggered
+# @watchdog: the watchdog action is configured to pause and has been
+#     triggered
 #
-# @guest-panicked: guest has been panicked as a result of guest OS panic
+# @guest-panicked: guest has been panicked as a result of guest OS
+#     panic
 #
-# @colo: guest is paused to save/restore VM state under colo checkpoint,
-#        VM can not get into this state unless colo capability is enabled
-#        for migration. (since 2.8)
+# @colo: guest is paused to save/restore VM state under colo
+#     checkpoint, VM can not get into this state unless colo
+#     capability is enabled for migration.  (since 2.8)
 ##
 { 'enum': 'RunState',
   'data': [ 'debug', 'inmigrate', 'internal-error', 'io-error', 'paused',
@@ -75,21 +77,21 @@
 # @host-ui: Reaction to a UI event, like window close
 #
 # @guest-shutdown: Guest shutdown/suspend request, via ACPI or other
-#                  hardware-specific means
+#     hardware-specific means
 #
 # @guest-reset: Guest reset request, and command line turns that into
-#               a shutdown
+#     a shutdown
 #
-# @guest-panic: Guest panicked, and command line turns that into a shutdown
+# @guest-panic: Guest panicked, and command line turns that into a
+#     shutdown
 #
-# @subsystem-reset: Partial guest reset that does not trigger QMP events and
-#                   ignores --no-reboot. This is useful for sanitizing
-#                   hypercalls on s390 that are used during kexec/kdump/boot
+# @subsystem-reset: Partial guest reset that does not trigger QMP
+#     events and ignores --no-reboot.  This is useful for sanitizing
+#     hypercalls on s390 that are used during kexec/kdump/boot
 #
 # @snapshot-load: A snapshot is being loaded by the record & replay
-#                 subsystem. This value is used only within QEMU.  It
-#                 doesn't occur in QMP. (since 7.2)
-#
+#     subsystem.  This value is used only within QEMU.  It doesn't
+#     occur in QMP. (since 7.2)
 ##
 { 'enum': 'ShutdownCause',
   # Beware, shutdown_caused_by_guest() depends on enumeration order
@@ -130,7 +132,6 @@
 # <- { "return": { "running": true,
 #                  "singlestep": false,
 #                  "status": "running" } }
-#
 ##
 { 'command': 'query-status', 'returns': 'StatusInfo',
   'allow-preconfig': true }
@@ -138,17 +139,20 @@
 ##
 # @SHUTDOWN:
 #
-# Emitted when the virtual machine has shut down, indicating that qemu is
-# about to exit.
+# Emitted when the virtual machine has shut down, indicating that qemu
+# is about to exit.
 #
-# @guest: If true, the shutdown was triggered by a guest request (such as
-#         a guest-initiated ACPI shutdown request or other hardware-specific action)
-#         rather than a host request (such as sending qemu a SIGINT). (since 2.10)
+# @guest: If true, the shutdown was triggered by a guest request (such
+#     as a guest-initiated ACPI shutdown request or other
+#     hardware-specific action) rather than a host request (such as
+#     sending qemu a SIGINT). (since 2.10)
 #
-# @reason: The @ShutdownCause which resulted in the SHUTDOWN. (since 4.0)
+# @reason: The @ShutdownCause which resulted in the SHUTDOWN. (since
+#     4.0)
 #
-# Note: If the command-line option "-no-shutdown" has been specified, qemu will
-#       not exit, and a STOP event will eventually follow the SHUTDOWN event
+# Note: If the command-line option "-no-shutdown" has been specified,
+#     qemu will not exit, and a STOP event will eventually follow the
+#     SHUTDOWN event
 #
 # Since: 0.12
 #
@@ -157,15 +161,14 @@
 # <- { "event": "SHUTDOWN",
 #      "data": { "guest": true, "reason": "guest-shutdown" },
 #      "timestamp": { "seconds": 1267040730, "microseconds": 682951 } }
-#
 ##
 { 'event': 'SHUTDOWN', 'data': { 'guest': 'bool', 'reason': 'ShutdownCause' } }
 
 ##
 # @POWERDOWN:
 #
-# Emitted when the virtual machine is powered down through the power control
-# system, such as via ACPI.
+# Emitted when the virtual machine is powered down through the power
+# control system, such as via ACPI.
 #
 # Since: 0.12
 #
@@ -173,7 +176,6 @@
 #
 # <- { "event": "POWERDOWN",
 #      "timestamp": { "seconds": 1267040730, "microseconds": 682951 } }
-#
 ##
 { 'event': 'POWERDOWN' }
 
@@ -183,9 +185,9 @@
 # Emitted when the virtual machine is reset
 #
 # @guest: If true, the reset was triggered by a guest request (such as
-#         a guest-initiated ACPI reboot request or other hardware-specific action)
-#         rather than a host request (such as the QMP command system_reset).
-#         (since 2.10)
+#     a guest-initiated ACPI reboot request or other hardware-specific
+#     action) rather than a host request (such as the QMP command
+#     system_reset). (since 2.10)
 #
 # @reason: The @ShutdownCause of the RESET. (since 4.0)
 #
@@ -196,7 +198,6 @@
 # <- { "event": "RESET",
 #      "data": { "guest": false, "reason": "guest-reset" },
 #      "timestamp": { "seconds": 1267041653, "microseconds": 9518 } }
-#
 ##
 { 'event': 'RESET', 'data': { 'guest': 'bool', 'reason': 'ShutdownCause' } }
 
@@ -211,7 +212,6 @@
 #
 # <- { "event": "STOP",
 #      "timestamp": { "seconds": 1267041730, "microseconds": 281295 } }
-#
 ##
 { 'event': 'STOP' }
 
@@ -226,15 +226,14 @@
 #
 # <- { "event": "RESUME",
 #      "timestamp": { "seconds": 1271770767, "microseconds": 582542 } }
-#
 ##
 { 'event': 'RESUME' }
 
 ##
 # @SUSPEND:
 #
-# Emitted when guest enters a hardware suspension state, for example, S3 state,
-# which is sometimes called standby state
+# Emitted when guest enters a hardware suspension state, for example,
+# S3 state, which is sometimes called standby state
 #
 # Since: 1.1
 #
@@ -242,17 +241,18 @@
 #
 # <- { "event": "SUSPEND",
 #      "timestamp": { "seconds": 1344456160, "microseconds": 309119 } }
-#
 ##
 { 'event': 'SUSPEND' }
 
 ##
 # @SUSPEND_DISK:
 #
-# Emitted when guest enters a hardware suspension state with data saved on
-# disk, for example, S4 state, which is sometimes called hibernate state
+# Emitted when guest enters a hardware suspension state with data
+# saved on disk, for example, S4 state, which is sometimes called
+# hibernate state
 #
-# Note: QEMU shuts down (similar to event @SHUTDOWN) when entering this state
+# Note: QEMU shuts down (similar to event @SHUTDOWN) when entering
+#     this state
 #
 # Since: 1.2
 #
@@ -266,7 +266,8 @@
 ##
 # @WAKEUP:
 #
-# Emitted when the guest has woken up from suspend state and is running
+# Emitted when the guest has woken up from suspend state and is
+# running
 #
 # Since: 1.1
 #
@@ -274,7 +275,6 @@
 #
 # <- { "event": "WAKEUP",
 #      "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
-#
 ##
 { 'event': 'WAKEUP' }
 
@@ -285,8 +285,9 @@
 #
 # @action: action that has been taken
 #
-# Note: If action is "reset", "shutdown", or "pause" the WATCHDOG event is
-#       followed respectively by the RESET, SHUTDOWN, or STOP events
+# Note: If action is "reset", "shutdown", or "pause" the WATCHDOG
+#     event is followed respectively by the RESET, SHUTDOWN, or STOP
+#     events
 #
 # Note: This event is rate-limited.
 #
@@ -297,7 +298,6 @@
 # <- { "event": "WATCHDOG",
 #      "data": { "action": "reset" },
 #      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
-#
 ##
 { 'event': 'WATCHDOG',
   'data': { 'action': 'WatchdogAction' } }
@@ -305,13 +305,13 @@
 ##
 # @WatchdogAction:
 #
-# An enumeration of the actions taken when the watchdog device's timer is
-# expired
+# An enumeration of the actions taken when the watchdog device's timer
+# is expired
 #
 # @reset: system resets
 #
-# @shutdown: system shutdown, note that it is similar to @powerdown, which
-#            tries to set to system status and notify guest
+# @shutdown: system shutdown, note that it is similar to @powerdown,
+#     which tries to set to system status and notify guest
 #
 # @poweroff: system poweroff, the emulator program exits
 #
@@ -321,8 +321,8 @@
 #
 # @none: nothing is done
 #
-# @inject-nmi: a non-maskable interrupt is injected into the first VCPU (all
-#              VCPUS on x86) (since 2.4)
+# @inject-nmi: a non-maskable interrupt is injected into the first
+#     VCPU (all VCPUS on x86) (since 2.4)
 #
 # Since: 2.1
 ##
@@ -337,7 +337,8 @@
 #
 # @reset: Reset the VM
 #
-# @shutdown: Shutdown the VM and exit, according to the shutdown action
+# @shutdown: Shutdown the VM and exit, according to the shutdown
+#     action
 #
 # Since: 6.0
 ##
@@ -365,10 +366,11 @@
 #
 # @pause: Pause the VM
 #
-# @shutdown: Shutdown the VM and exit, according to the shutdown action
+# @shutdown: Shutdown the VM and exit, according to the shutdown
+#     action
 #
-# @exit-failure: Shutdown the VM and exit with nonzero status
-#                (since 7.1)
+# @exit-failure: Shutdown the VM and exit with nonzero status (since
+#     7.1)
 #
 # Since: 6.0
 ##
@@ -387,8 +389,8 @@
 ##
 # @set-action:
 #
-# Set the actions that will be taken by the emulator in response to guest
-# events.
+# Set the actions that will be taken by the emulator in response to
+# guest events.
 #
 # @reboot: @RebootAction action taken on guest reboot.
 #
@@ -396,7 +398,8 @@
 #
 # @panic: @PanicAction action taken on guest panic.
 #
-# @watchdog: @WatchdogAction action taken when watchdog timer expires .
+# @watchdog: @WatchdogAction action taken when watchdog timer expires
+#     .
 #
 # Returns: Nothing on success.
 #
@@ -434,7 +437,6 @@
 # <- { "event": "GUEST_PANICKED",
 #      "data": { "action": "pause" },
 #      "timestamp": { "seconds": 1648245231, "microseconds": 900001 } }
-#
 ##
 { 'event': 'GUEST_PANICKED',
   'data': { 'action': 'GuestPanicAction', '*info': 'GuestPanicInformation' } }
@@ -455,7 +457,6 @@
 # <- { "event": "GUEST_CRASHLOADED",
 #      "data": { "action": "run" },
 #      "timestamp": { "seconds": 1648245259, "microseconds": 893771 } }
-#
 ##
 { 'event': 'GUEST_CRASHLOADED',
   'data': { 'action': 'GuestPanicAction', '*info': 'GuestPanicInformation' } }
@@ -502,8 +503,8 @@
 {'union': 'GuestPanicInformation',
  'base': {'type': 'GuestPanicInformationType'},
  'discriminator': 'type',
- 'data': { 'hyper-v': 'GuestPanicInformationHyperV',
-           's390': 'GuestPanicInformationS390' } }
+ 'data': {'hyper-v': 'GuestPanicInformationHyperV',
+          's390': 'GuestPanicInformationS390'}}
 
 ##
 # @GuestPanicInformationHyperV:
@@ -513,11 +514,11 @@
 # Since: 2.9
 ##
 {'struct': 'GuestPanicInformationHyperV',
- 'data': { 'arg1': 'uint64',
-           'arg2': 'uint64',
-           'arg3': 'uint64',
-           'arg4': 'uint64',
-           'arg5': 'uint64' } }
+ 'data': {'arg1': 'uint64',
+          'arg2': 'uint64',
+          'arg3': 'uint64',
+          'arg4': 'uint64',
+          'arg5': 'uint64'}}
 
 ##
 # @S390CrashReason:
@@ -528,13 +529,13 @@
 #
 # @disabled-wait: the CPU has entered a disabled wait state
 #
-# @extint-loop: clock comparator or cpu timer interrupt with new PSW enabled
-#               for external interrupts
+# @extint-loop: clock comparator or cpu timer interrupt with new PSW
+#     enabled for external interrupts
 #
 # @pgmint-loop: program interrupt with BAD new PSW
 #
-# @opint-loop: operation exception interrupt with invalid code at the program
-#              interrupt new PSW
+# @opint-loop: operation exception interrupt with invalid code at the
+#     program interrupt new PSW
 #
 # Since: 2.12
 ##
@@ -551,17 +552,20 @@
 # S390 specific guest panic information (PSW)
 #
 # @core: core id of the CPU that crashed
+#
 # @psw-mask: control fields of guest PSW
+#
 # @psw-addr: guest instruction address
+#
 # @reason: guest crash reason
 #
 # Since: 2.12
 ##
 {'struct': 'GuestPanicInformationS390',
- 'data': { 'core': 'uint32',
-           'psw-mask': 'uint64',
-           'psw-addr': 'uint64',
-           'reason': 'S390CrashReason' } }
+ 'data': {'core': 'uint32',
+          'psw-mask': 'uint64',
+          'psw-addr': 'uint64',
+          'reason': 'S390CrashReason'}}
 
 ##
 # @MEMORY_FAILURE:
@@ -570,9 +574,11 @@
 #
 # @recipient: recipient is defined as @MemoryFailureRecipient.
 #
-# @action: action that has been taken. action is defined as @MemoryFailureAction.
+# @action: action that has been taken.  action is defined as
+#     @MemoryFailureAction.
 #
-# @flags: flags for MemoryFailureAction. action is defined as @MemoryFailureFlags.
+# @flags: flags for MemoryFailureAction.  action is defined as
+#     @MemoryFailureFlags.
 #
 # Since: 5.2
 #
@@ -584,7 +590,6 @@
 #                "flags": { "action-required": false,
 #                           "recursive": false } },
 #      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
-#
 ##
 { 'event': 'MEMORY_FAILURE',
   'data': { 'recipient': 'MemoryFailureRecipient',
@@ -596,8 +601,8 @@
 #
 # Hardware memory failure occurs, handled by recipient.
 #
-# @hypervisor: memory failure at QEMU process address space.
-#              (none guest memory, but used by QEMU itself).
+# @hypervisor: memory failure at QEMU process address space.  (none
+#     guest memory, but used by QEMU itself).
 #
 # @guest: memory failure at guest memory,
 #
@@ -612,19 +617,20 @@
 #
 # Actions taken by QEMU in response to a hardware memory failure.
 #
-# @ignore: the memory failure could be ignored.  This will only be the case
-#          for action-optional failures.
+# @ignore: the memory failure could be ignored.  This will only be the
+#     case for action-optional failures.
 #
-# @inject: memory failure occurred in guest memory, the guest enabled MCE
-#          handling mechanism, and QEMU could inject the MCE into the guest
-#          successfully.
+# @inject: memory failure occurred in guest memory, the guest enabled
+#     MCE handling mechanism, and QEMU could inject the MCE into the
+#     guest successfully.
 #
-# @fatal: the failure is unrecoverable.  This occurs for action-required
-#         failures if the recipient is the hypervisor; QEMU will exit.
+# @fatal: the failure is unrecoverable.  This occurs for
+#     action-required failures if the recipient is the hypervisor;
+#     QEMU will exit.
 #
-# @reset: the failure is unrecoverable but confined to the guest.  This
-#         occurs if the recipient is a guest guest which is not ready
-#         to handle memory failures.
+# @reset: the failure is unrecoverable but confined to the guest.
+#     This occurs if the recipient is a guest guest which is not ready
+#     to handle memory failures.
 #
 # Since: 5.2
 ##
@@ -640,10 +646,10 @@
 # Additional information on memory failures.
 #
 # @action-required: whether a memory failure event is action-required
-#                   or action-optional (e.g. a failure during memory scrub).
+#     or action-optional (e.g. a failure during memory scrub).
 #
-# @recursive: whether the failure occurred while the previous
-#             failure was still in progress.
+# @recursive: whether the failure occurred while the previous failure
+#     was still in progress.
 #
 # Since: 5.2
 ##
@@ -656,14 +662,15 @@
 #
 # An enumeration of the options specified when enabling notify VM exit
 #
-# @run: enable the feature, do nothing and continue if the notify VM exit happens.
+# @run: enable the feature, do nothing and continue if the notify VM
+#     exit happens.
 #
-# @internal-error: enable the feature, raise a internal error if the notify
-#                  VM exit happens.
+# @internal-error: enable the feature, raise a internal error if the
+#     notify VM exit happens.
 #
 # @disable: disable the feature.
 #
 # Since: 7.2
 ##
 { 'enum': 'NotifyVmexitOption',
-  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
+  'data': [ 'run', 'internal-error', 'disable' ] }
diff --git a/qapi/sockets.json b/qapi/sockets.json
index bad74e34d3..6213154525 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -41,21 +41,24 @@
 ##
 # @InetSocketAddress:
 #
-# Captures a socket address or address range in the Internet namespace.
+# Captures a socket address or address range in the Internet
+# namespace.
 #
-# @numeric: true if the host/port are guaranteed to be numeric,
-#           false if name resolution should be attempted. Defaults to false.
-#           (Since 2.9)
+# @numeric: true if the host/port are guaranteed to be numeric, false
+#     if name resolution should be attempted.  Defaults to false.
+#     (Since 2.9)
 #
 # @to: If present, this is range of possible addresses, with port
-#      between @port and @to.
+#     between @port and @to.
 #
-# @ipv4: whether to accept IPv4 addresses, default try both IPv4 and IPv6
+# @ipv4: whether to accept IPv4 addresses, default try both IPv4 and
+#     IPv6
 #
-# @ipv6: whether to accept IPv6 addresses, default try both IPv4 and IPv6
+# @ipv6: whether to accept IPv6 addresses, default try both IPv4 and
+#     IPv6
 #
-# @keep-alive: enable keep-alive when connecting to this socket. Not supported
-#              for passive sockets. (Since 4.2)
+# @keep-alive: enable keep-alive when connecting to this socket.  Not
+#     supported for passive sockets.  (Since 4.2)
 #
 # @mptcp: enable multi-path TCP. (Since 6.1)
 #
@@ -77,12 +80,14 @@
 # Captures a socket address in the local ("Unix socket") namespace.
 #
 # @path: filesystem path to use
+#
 # @abstract: if true, this is a Linux abstract socket address.  @path
-#            will be prefixed by a null byte, and optionally padded
-#            with null bytes.  Defaults to false.  (Since 5.1)
+#     will be prefixed by a null byte, and optionally padded with null
+#     bytes.  Defaults to false.  (Since 5.1)
+#
 # @tight: if false, pad an abstract socket address with enough null
-#         bytes to make it fill struct sockaddr_un member sun_path.
-#         Defaults to true.  (Since 5.1)
+#     bytes to make it fill struct sockaddr_un member sun_path.
+#     Defaults to true.  (Since 5.1)
 #
 # Since: 1.3
 ##
@@ -98,10 +103,11 @@
 # Captures a socket address in the vsock namespace.
 #
 # @cid: unique host identifier
+#
 # @port: port
 #
 # Note: string types are used to allow for possible future hostname or
-#       service resolution support.
+#     service resolution support.
 #
 # Since: 2.8
 ##
@@ -145,11 +151,12 @@
 ##
 # @SocketAddressLegacy:
 #
-# Captures the address of a socket, which could also be a named file descriptor
+# Captures the address of a socket, which could also be a named file
+# descriptor
 #
 # Note: This type is deprecated in favor of SocketAddress.  The
-#       difference between SocketAddressLegacy and SocketAddress is that the
-#       latter has fewer {} on the wire.
+#     difference between SocketAddressLegacy and SocketAddress is that
+#     the latter has fewer {} on the wire.
 #
 # Since: 1.3
 ##
@@ -173,10 +180,11 @@
 #
 # @vsock: VMCI address
 #
-# @fd: decimal is for file descriptor number, otherwise a file descriptor name.
-#      Named file descriptors are permitted in monitor commands, in combination
-#      with the 'getfd' command. Decimal file descriptors are permitted at
-#      startup or other contexts where no monitor context is active.
+# @fd: decimal is for file descriptor number, otherwise a file
+#     descriptor name.  Named file descriptors are permitted in
+#     monitor commands, in combination with the 'getfd' command.
+#     Decimal file descriptors are permitted at startup or other
+#     contexts where no monitor context is active.
 #
 # Since: 2.9
 ##
diff --git a/qapi/stats.json b/qapi/stats.json
index 36d5f4dc94..01791e86d5 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -18,11 +18,15 @@
 # Enumeration of statistics types
 #
 # @cumulative: stat is cumulative; value can only increase.
+#
 # @instant: stat is instantaneous; value can increase or decrease.
+#
 # @peak: stat is the peak value; value can only increase.
+#
 # @linear-histogram: stat is a linear histogram.
+#
 # @log2-histogram: stat is a logarithmic histogram, with one bucket
-#                  for each power of two.
+#     for each power of two.
 #
 # Since: 7.1
 ##
@@ -36,8 +40,11 @@
 # Enumeration of unit of measurement for statistics
 #
 # @bytes: stat reported in bytes.
+#
 # @seconds: stat reported in seconds.
+#
 # @cycles: stat reported in clock cycles.
+#
 # @boolean: stat is a boolean value.
 #
 # Since: 7.1
@@ -64,8 +71,8 @@
 #
 # The kinds of objects on which one can request statistics.
 #
-# @vm: statistics that apply to the entire virtual machine or
-#      the entire QEMU process.
+# @vm: statistics that apply to the entire virtual machine or the
+#     entire QEMU process.
 #
 # @vcpu: statistics that apply to a single virtual CPU.
 #
@@ -79,10 +86,11 @@
 ##
 # @StatsRequest:
 #
-# Indicates a set of statistics that should be returned by query-stats.
+# Indicates a set of statistics that should be returned by
+# query-stats.
 #
 # @provider: provider for which to return statistics.
-
+#
 # @names: statistics to be returned (all if omitted).
 #
 # Since: 7.1
@@ -104,9 +112,9 @@
 ##
 # @StatsFilter:
 #
-# The arguments to the query-stats command; specifies a target for which to
-# request statistics and optionally the required subset of information for
-# that target:
+# The arguments to the query-stats command; specifies a target for
+# which to request statistics and optionally the required subset of
+# information for that target:
 #
 # - which vCPUs to request statistics for
 # - which providers to request statistics from
@@ -125,6 +133,7 @@
 # @StatsValue:
 #
 # @scalar: single unsigned 64-bit integers.
+#
 # @list: list of unsigned 64-bit integers (used for histograms).
 #
 # Since: 7.1
@@ -138,6 +147,7 @@
 # @Stats:
 #
 # @name: name of stat.
+#
 # @value: stat value.
 #
 # Since: 7.1
@@ -152,7 +162,7 @@
 # @provider: provider for this set of statistics.
 #
 # @qom-path: Path to the object for which the statistics are returned,
-#            if the object is exposed in the QOM tree
+#     if the object is exposed in the QOM tree
 #
 # @stats: list of statistics.
 #
@@ -166,14 +176,14 @@
 ##
 # @query-stats:
 #
-# Return runtime-collected statistics for objects such as the
-# VM or its vCPUs.
+# Return runtime-collected statistics for objects such as the VM or
+# its vCPUs.
 #
 # The arguments are a StatsFilter and specify the provider and objects
 # to return statistics about.
 #
 # Returns: a list of StatsResult, one for each provider and object
-#          (e.g., for each vCPU).
+#     (e.g., for each vCPU).
 #
 # Since: 7.1
 ##
@@ -188,24 +198,25 @@
 # Schema for a single statistic.
 #
 # @name: name of the statistic; each element of the schema is uniquely
-#        identified by a target, a provider (both available in @StatsSchema)
-#        and the name.
+#     identified by a target, a provider (both available in
+#     @StatsSchema) and the name.
 #
 # @type: kind of statistic.
 #
-# @unit: basic unit of measure for the statistic; if missing, the statistic
-#        is a simple number or counter.
+# @unit: basic unit of measure for the statistic; if missing, the
+#     statistic is a simple number or counter.
 #
-# @base: base for the multiple of @unit in which the statistic is measured.
-#        Only present if @exponent is non-zero; @base and @exponent together
-#        form a SI prefix (e.g., _nano-_ for ``base=10`` and ``exponent=-9``)
-#        or IEC binary prefix (e.g. _kibi-_ for ``base=2`` and ``exponent=10``)
+# @base: base for the multiple of @unit in which the statistic is
+#     measured.  Only present if @exponent is non-zero; @base and
+#     @exponent together form a SI prefix (e.g., _nano-_ for
+#     ``base=10`` and ``exponent=-9``) or IEC binary prefix (e.g.
+#     _kibi-_ for ``base=2`` and ``exponent=10``)
 #
-# @exponent: exponent for the multiple of @unit in which the statistic is
-#            expressed, or 0 for the basic unit
+# @exponent: exponent for the multiple of @unit in which the statistic
+#     is expressed, or 0 for the basic unit
 #
-# @bucket-size: Present when @type is "linear-histogram", contains the width
-#               of each bucket of the histogram.
+# @bucket-size: Present when @type is "linear-histogram", contains the
+#     width of each bucket of the histogram.
 #
 # Since: 7.1
 ##
@@ -224,7 +235,8 @@
 #
 # @provider: provider for this set of statistics.
 #
-# @target: the kind of object that can be queried through the provider.
+# @target: the kind of object that can be queried through the
+#     provider.
 #
 # @stats: list of statistics.
 #
@@ -240,16 +252,17 @@
 #
 # Return the schema for all available runtime-collected statistics.
 #
-# Note: runtime-collected statistics and their names fall outside QEMU's usual
-#       deprecation policies.  QEMU will try to keep the set of available data
-#       stable, together with their names, but will not guarantee stability
-#       at all costs; the same is true of providers that source statistics
-#       externally, e.g. from Linux.  For example, if the same value is being
-#       tracked with different names on different architectures or by different
-#       providers, one of them might be renamed.  A statistic might go away if
-#       an algorithm is changed or some code is removed; changing a default
-#       might cause previously useful statistics to always report 0.  Such
-#       changes, however, are expected to be rare.
+# Note: runtime-collected statistics and their names fall outside
+#     QEMU's usual deprecation policies.  QEMU will try to keep the
+#     set of available data stable, together with their names, but
+#     will not guarantee stability at all costs; the same is true of
+#     providers that source statistics externally, e.g. from Linux.
+#     For example, if the same value is being tracked with different
+#     names on different architectures or by different providers, one
+#     of them might be renamed.  A statistic might go away if an
+#     algorithm is changed or some code is removed; changing a default
+#     might cause previously useful statistics to always report 0.
+#     Such changes, however, are expected to be rare.
 #
 # Since: 7.1
 ##
diff --git a/qapi/tpm.json b/qapi/tpm.json
index eac87d30b2..a754455ca5 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -12,7 +12,9 @@
 # An enumeration of TPM models
 #
 # @tpm-tis: TPM TIS model
+#
 # @tpm-crb: TPM CRB model (since 2.12)
+#
 # @tpm-spapr: TPM SPAPR model (since 5.0)
 #
 # Since: 1.5
@@ -33,7 +35,6 @@
 #
 # -> { "execute": "query-tpm-models" }
 # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
-#
 ##
 { 'command': 'query-tpm-models', 'returns': ['TpmModel'],
   'if': 'CONFIG_TPM' }
@@ -44,6 +45,7 @@
 # An enumeration of TPM types
 #
 # @passthrough: TPM passthrough type
+#
 # @emulator: Software Emulator TPM type (since 2.11)
 #
 # Since: 1.5
@@ -64,7 +66,6 @@
 #
 # -> { "execute": "query-tpm-types" }
 # <- { "return": [ "passthrough", "emulator" ] }
-#
 ##
 { 'command': 'query-tpm-types', 'returns': ['TpmType'],
   'if': 'CONFIG_TPM' }
@@ -76,8 +77,8 @@
 #
 # @path: string describing the path used for accessing the TPM device
 #
-# @cancel-path: string showing the TPM's sysfs cancel file
-#               for cancellation of TPM commands while they are executing
+# @cancel-path: string showing the TPM's sysfs cancel file for
+#     cancellation of TPM commands while they are executing
 #
 # Since: 1.5
 ##
@@ -119,10 +120,14 @@
 ##
 # @TpmTypeOptions:
 #
-# A union referencing different TPM backend types' configuration options
+# A union referencing different TPM backend types' configuration
+# options
 #
-# @type: - 'passthrough' The configuration options for the TPM passthrough type
-#        - 'emulator' The configuration options for TPM emulator backend type
+# @type:
+#     - 'passthrough' The configuration options for the TPM
+#       passthrough type
+#     - 'emulator' The configuration options for TPM emulator backend
+#       type
 #
 # Since: 1.5
 ##
@@ -178,7 +183,6 @@
 #        }
 #      ]
 #    }
-#
 ##
 { 'command': 'query-tpm', 'returns': ['TPMInfo'],
   'if': 'CONFIG_TPM' }
diff --git a/qapi/trace.json b/qapi/trace.json
index f425d10764..6bf0af0946 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -32,11 +32,13 @@
 # Information of a tracing event.
 #
 # @name: Event name.
+#
 # @state: Tracing state.
+#
 # @vcpu: Whether this is a per-vCPU event (since 2.7).
 #
-# An event is per-vCPU if it has the "vcpu" property in the "trace-events"
-# files.
+# An event is per-vCPU if it has the "vcpu" property in the
+# "trace-events" files.
 #
 # Since: 2.2
 ##
@@ -49,19 +51,20 @@
 # Query the state of events.
 #
 # @name: Event name pattern (case-sensitive glob).
+#
 # @vcpu: The vCPU to query (any by default; since 2.7).
 #
 # Returns: a list of @TraceEventInfo for the matching events
 #
-#          An event is returned if:
+# An event is returned if:
 #
-#          - its name matches the @name pattern, and
-#          - if @vcpu is given, the event has the "vcpu" property.
+# - its name matches the @name pattern, and
+# - if @vcpu is given, the event has the "vcpu" property.
 #
-#          Therefore, if @vcpu is given, the operation will only match per-vCPU events,
-#          returning their state on the specified vCPU. Special case: if @name is an
-#          exact match, @vcpu is given and the event does not have the "vcpu" property,
-#          an error is returned.
+# Therefore, if @vcpu is given, the operation will only match per-vCPU
+# events, returning their state on the specified vCPU. Special case:
+# if @name is an exact match, @vcpu is given and the event does not
+# have the "vcpu" property, an error is returned.
 #
 # Since: 2.2
 #
@@ -70,7 +73,6 @@
 # -> { "execute": "trace-event-get-state",
 #      "arguments": { "name": "qemu_memalign" } }
 # <- { "return": [ { "name": "qemu_memalign", "state": "disabled", "vcpu": false } ] }
-#
 ##
 { 'command': 'trace-event-get-state',
   'data': {'name': 'str', '*vcpu': 'int'},
@@ -82,8 +84,11 @@
 # Set the dynamic tracing state of events.
 #
 # @name: Event name pattern (case-sensitive glob).
+#
 # @enable: Whether to enable tracing.
+#
 # @ignore-unavailable: Do not match unavailable events with @name.
+#
 # @vcpu: The vCPU to act upon (all by default; since 2.7).
 #
 # An event's state is modified if:
@@ -91,10 +96,10 @@
 # - its name matches the @name pattern, and
 # - if @vcpu is given, the event has the "vcpu" property.
 #
-# Therefore, if @vcpu is given, the operation will only match per-vCPU events,
-# setting their state on the specified vCPU. Special case: if @name is an exact
-# match, @vcpu is given and the event does not have the "vcpu" property, an
-# error is returned.
+# Therefore, if @vcpu is given, the operation will only match per-vCPU
+# events, setting their state on the specified vCPU. Special case: if
+# @name is an exact match, @vcpu is given and the event does not have
+# the "vcpu" property, an error is returned.
 #
 # Since: 2.2
 #
@@ -103,7 +108,6 @@
 # -> { "execute": "trace-event-set-state",
 #      "arguments": { "name": "qemu_memalign", "enable": true } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'trace-event-set-state',
   'data': {'name': 'str', 'enable': 'bool', '*ignore-unavailable': 'bool',
diff --git a/qapi/transaction.json b/qapi/transaction.json
index 381a2df782..cffee2de28 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -23,15 +23,15 @@
 #
 # An enumeration of Transactional completion modes.
 #
-# @individual: Do not attempt to cancel any other Actions if any Actions fail
-#              after the Transaction request succeeds. All Actions that
-#              can complete successfully will do so without waiting on others.
-#              This is the default.
+# @individual: Do not attempt to cancel any other Actions if any
+#     Actions fail after the Transaction request succeeds.  All
+#     Actions that can complete successfully will do so without
+#     waiting on others.  This is the default.
 #
-# @grouped: If any Action fails after the Transaction succeeds, cancel all
-#           Actions. Actions do not complete until all Actions are ready to
-#           complete. May be rejected by Actions that do not support this
-#           completion mode.
+# @grouped: If any Action fails after the Transaction succeeds, cancel
+#     all Actions.  Actions do not complete until all Actions are
+#     ready to complete.  May be rejected by Actions that do not
+#     support this completion mode.
 #
 # Since: 2.5
 ##
@@ -42,21 +42,33 @@
 # @TransactionActionKind:
 #
 # @abort: Since 1.6
+#
 # @block-dirty-bitmap-add: Since 2.5
+#
 # @block-dirty-bitmap-remove: Since 4.2
+#
 # @block-dirty-bitmap-clear: Since 2.5
+#
 # @block-dirty-bitmap-enable: Since 4.0
+#
 # @block-dirty-bitmap-disable: Since 4.0
+#
 # @block-dirty-bitmap-merge: Since 4.0
+#
 # @blockdev-backup: Since 2.3
+#
 # @blockdev-snapshot: Since 2.5
+#
 # @blockdev-snapshot-internal-sync: Since 1.7
+#
 # @blockdev-snapshot-sync: since 1.1
+#
 # @drive-backup: Since 1.6
 #
 # Features:
+#
 # @deprecated: Member @drive-backup is deprecated.  Use member
-#              @blockdev-backup instead.
+#     @blockdev-backup instead.
 #
 # Since: 1.1
 ##
@@ -172,8 +184,8 @@
 # Optional arguments to modify the behavior of a Transaction.
 #
 # @completion-mode: Controls how jobs launched asynchronously by
-#                   Actions will complete or fail as a group.
-#                   See @ActionCompletionMode for details.
+#     Actions will complete or fail as a group.  See
+#     @ActionCompletionMode for details.
 #
 # Since: 2.5
 ##
@@ -186,46 +198,48 @@
 ##
 # @transaction:
 #
-# Executes a number of transactionable QMP commands atomically. If any
-# operation fails, then the entire set of actions will be abandoned and the
-# appropriate error returned.
+# Executes a number of transactionable QMP commands atomically.  If
+# any operation fails, then the entire set of actions will be
+# abandoned and the appropriate error returned.
 #
-# For external snapshots, the dictionary contains the device, the file to use for
-# the new snapshot, and the format.  The default format, if not specified, is
-# qcow2.
+# For external snapshots, the dictionary contains the device, the file
+# to use for the new snapshot, and the format.  The default format, if
+# not specified, is qcow2.
 #
 # Each new snapshot defaults to being created by QEMU (wiping any
-# contents if the file already exists), but it is also possible to reuse
-# an externally-created file.  In the latter case, you should ensure that
-# the new image file has the same contents as the current one; QEMU cannot
-# perform any meaningful check.  Typically this is achieved by using the
-# current image file as the backing file for the new image.
+# contents if the file already exists), but it is also possible to
+# reuse an externally-created file.  In the latter case, you should
+# ensure that the new image file has the same contents as the current
+# one; QEMU cannot perform any meaningful check.  Typically this is
+# achieved by using the current image file as the backing file for the
+# new image.
 #
 # On failure, the original disks pre-snapshot attempt will be used.
 #
 # For internal snapshots, the dictionary contains the device and the
-# snapshot's name.  If an internal snapshot matching name already exists,
-# the request will be rejected.  Only some image formats support it, for
-# example, qcow2, and rbd,
+# snapshot's name.  If an internal snapshot matching name already
+# exists, the request will be rejected.  Only some image formats
+# support it, for example, qcow2, and rbd,
 #
-# On failure, qemu will try delete the newly created internal snapshot in the
-# transaction.  When an I/O error occurs during deletion, the user needs to fix
-# it later with qemu-img or other command.
+# On failure, qemu will try delete the newly created internal snapshot
+# in the transaction.  When an I/O error occurs during deletion, the
+# user needs to fix it later with qemu-img or other command.
 #
-# @actions: List of @TransactionAction;
-#           information needed for the respective operations.
+# @actions: List of @TransactionAction; information needed for the
+#     respective operations.
 #
 # @properties: structure of additional options to control the
-#              execution of the transaction. See @TransactionProperties
-#              for additional detail.
+#     execution of the transaction.  See @TransactionProperties for
+#     additional detail.
 #
 # Returns: nothing on success
 #
-#          Errors depend on the operations of the transaction
+#     Errors depend on the operations of the transaction
 #
-# Note: The transaction aborts on the first failure.  Therefore, there will be
-#       information on only one failed operation returned in an error condition, and
-#       subsequent actions will not have been attempted.
+# Note: The transaction aborts on the first failure.  Therefore, there
+#     will be information on only one failed operation returned in an
+#     error condition, and subsequent actions will not have been
+#     attempted.
 #
 # Since: 1.1
 #
@@ -249,7 +263,6 @@
 #                                      "device": "ide-hd2",
 #                                      "name": "snapshot0" } } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'transaction',
   'data': { 'actions': [ 'TransactionAction' ],
diff --git a/qapi/ui.json b/qapi/ui.json
index b5650974fc..d51e34049c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -22,7 +22,8 @@
 ##
 # @SetPasswordAction:
 #
-# An action to take on changing a password on a connection with active clients.
+# An action to take on changing a password on a connection with active
+# clients.
 #
 # @keep: maintain existing clients
 #
@@ -40,14 +41,15 @@
 #
 # Options for set_password.
 #
-# @protocol: - 'vnc' to modify the VNC server password
-#            - 'spice' to modify the Spice server password
+# @protocol:
+#     - 'vnc' to modify the VNC server password
+#     - 'spice' to modify the Spice server password
 #
 # @password: the new password
 #
 # @connected: How to handle existing clients when changing the
-#             password. If nothing is specified, defaults to 'keep'.
-#             For VNC, only 'keep' is currently implemented.
+#     password.  If nothing is specified, defaults to 'keep'. For VNC,
+#     only 'keep' is currently implemented.
 #
 # Since: 7.0
 ##
@@ -63,8 +65,8 @@
 #
 # Options for set_password specific to the VNC procotol.
 #
-# @display: The id of the display where the password should be changed.
-#           Defaults to the first.
+# @display: The id of the display where the password should be
+#     changed.  Defaults to the first.
 #
 # Since: 7.0
 ##
@@ -76,8 +78,9 @@
 #
 # Set the password of a remote display server.
 #
-# Returns: - Nothing on success
-#          - If Spice is not enabled, DeviceNotFound
+# Returns:
+#     - Nothing on success
+#     - If Spice is not enabled, DeviceNotFound
 #
 # Since: 0.14
 #
@@ -86,7 +89,6 @@
 # -> { "execute": "set_password", "arguments": { "protocol": "vnc",
 #                                                "password": "secret" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
 
@@ -95,20 +97,22 @@
 #
 # General options for expire_password.
 #
-# @protocol: - 'vnc' to modify the VNC server expiration
-#            - 'spice' to modify the Spice server expiration
+# @protocol:
+#     - 'vnc' to modify the VNC server expiration
+#     - 'spice' to modify the Spice server expiration
 #
 # @time: when to expire the password.
 #
-#        - 'now' to expire the password immediately
-#        - 'never' to cancel password expiration
-#        - '+INT' where INT is the number of seconds from now (integer)
-#        - 'INT' where INT is the absolute time in seconds
+#     - 'now' to expire the password immediately
+#     - 'never' to cancel password expiration
+#     - '+INT' where INT is the number of seconds from now (integer)
+#     - 'INT' where INT is the absolute time in seconds
 #
-# Notes: Time is relative to the server and currently there is no way to
-#        coordinate server time with client time.  It is not recommended to
-#        use the absolute time version of the @time parameter unless you're
-#        sure you are on the same machine as the QEMU instance.
+# Notes: Time is relative to the server and currently there is no way
+#     to coordinate server time with client time.  It is not
+#     recommended to use the absolute time version of the @time
+#     parameter unless you're sure you are on the same machine as the
+#     QEMU instance.
 #
 # Since: 7.0
 ##
@@ -123,8 +127,8 @@
 #
 # Options for expire_password specific to the VNC procotol.
 #
-# @display: The id of the display where the expiration should be changed.
-#           Defaults to the first.
+# @display: The id of the display where the expiration should be
+#     changed.  Defaults to the first.
 #
 # Since: 7.0
 ##
@@ -136,8 +140,10 @@
 #
 # Expire the password of a remote display server.
 #
-# Returns: - Nothing on success
-#          - If @protocol is 'spice' and Spice is not active, DeviceNotFound
+# Returns:
+#     - Nothing on success
+#     - If @protocol is 'spice' and Spice is not active,
+#       DeviceNotFound
 #
 # Since: 0.14
 #
@@ -146,7 +152,6 @@
 # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
 #                                                   "time": "+60" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOptions' }
 
@@ -171,14 +176,16 @@
 #
 # @filename: the path of a new file to store the image
 #
-# @device: ID of the display device that should be dumped. If this parameter
-#          is missing, the primary display will be used. (Since 2.12)
+# @device: ID of the display device that should be dumped.  If this
+#     parameter is missing, the primary display will be used.  (Since
+#     2.12)
 #
-# @head: head to use in case the device supports multiple heads. If this
-#        parameter is missing, head #0 will be used. Also note that the head
-#        can only be specified in conjunction with the device ID. (Since 2.12)
+# @head: head to use in case the device supports multiple heads.  If
+#     this parameter is missing, head #0 will be used.  Also note that
+#     the head can only be specified in conjunction with the device
+#     ID. (Since 2.12)
 #
-# @format: image format for screendump. (default: ppm) (Since 7.1)
+# @format: image format for screendump.  (default: ppm) (Since 7.1)
 #
 # Returns: Nothing on success
 #
@@ -189,7 +196,6 @@
 # -> { "execute": "screendump",
 #      "arguments": { "filename": "/tmp/image" } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'screendump',
   'data': {'filename': 'str', '*device': 'str', '*head': 'int',
@@ -238,16 +244,16 @@
 #
 # Information about a SPICE client channel.
 #
-# @connection-id: SPICE connection id number.  All channels with the same id
-#                 belong to the same SPICE session.
+# @connection-id: SPICE connection id number.  All channels with the
+#     same id belong to the same SPICE session.
 #
 # @channel-type: SPICE channel type number.  "1" is the main control
-#                channel, filter for this one if you want to track spice
-#                sessions only
+#     channel, filter for this one if you want to track spice sessions
+#     only
 #
-# @channel-id: SPICE channel ID number.  Usually "0", might be different when
-#              multiple channels of the same type exist, such as multiple
-#              display channels in a multihead setup
+# @channel-id: SPICE channel ID number.  Usually "0", might be
+#     different when multiple channels of the same type exist, such as
+#     multiple display channels in a multihead setup
 #
 # @tls: true if the channel is encrypted, false otherwise.
 #
@@ -268,8 +274,8 @@
 #
 # @server: Mouse cursor position is determined by the server.
 #
-# @unknown: No information is available about mouse mode used by
-#           the spice server.
+# @unknown: No information is available about mouse mode used by the
+#     spice server.
 #
 # Note: spice/enums.h has a SpiceMouseMode already, hence the name.
 #
@@ -287,10 +293,10 @@
 # @enabled: true if the SPICE server is enabled, false otherwise
 #
 # @migrated: true if the last guest migration completed and spice
-#            migration had completed as well. false otherwise. (since 1.4)
+#     migration had completed as well.  false otherwise.  (since 1.4)
 #
 # @host: The hostname the SPICE server is bound to.  This depends on
-#        the name resolution on the host and may be an IP address.
+#     the name resolution on the host and may be an IP address.
 #
 # @port: The SPICE server's port number.
 #
@@ -300,13 +306,14 @@
 #
 # @auth: the current authentication type used by the server
 #
-#        - 'none'  if no authentication is being used
-#        - 'spice' uses SASL or direct TLS authentication, depending on command
-#          line options
+#     - 'none'  if no authentication is being used
+#     - 'spice' uses SASL or direct TLS authentication, depending on
+#       command line options
 #
-# @mouse-mode: The mode in which the mouse cursor is displayed currently. Can
-#              be determined by the client or the server, or unknown if spice
-#              server doesn't provide this information. (since: 1.1)
+# @mouse-mode: The mode in which the mouse cursor is displayed
+#     currently.  Can be determined by the client or the server, or
+#     unknown if spice server doesn't provide this information.
+#     (since: 1.1)
 #
 # @channels: a list of @SpiceChannel for each active spice channel
 #
@@ -361,7 +368,6 @@
 #          ]
 #       }
 #    }
-#
 ##
 { 'command': 'query-spice', 'returns': 'SpiceInfo',
   'if': 'CONFIG_SPICE' }
@@ -385,7 +391,6 @@
 #        "server": { "port": "5920", "family": "ipv4", "host": "127.0.0.1"},
 #        "client": {"port": "52873", "family": "ipv4", "host": "127.0.0.1"}
 #    }}
-#
 ##
 { 'event': 'SPICE_CONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
@@ -395,8 +400,8 @@
 ##
 # @SPICE_INITIALIZED:
 #
-# Emitted after initial handshake and authentication takes place (if any)
-# and the SPICE channel is up and running
+# Emitted after initial handshake and authentication takes place (if
+# any) and the SPICE channel is up and running
 #
 # @server: server information
 #
@@ -414,7 +419,6 @@
 #                          "connection-id": 1804289383, "host": "127.0.0.1",
 #                          "channel-id": 0, "tls": true}
 #    }}
-#
 ##
 { 'event': 'SPICE_INITIALIZED',
   'data': { 'server': 'SpiceServerInfo',
@@ -440,7 +444,6 @@
 #        "server": { "port": "5920", "family": "ipv4", "host": "127.0.0.1"},
 #        "client": {"port": "52873", "family": "ipv4", "host": "127.0.0.1"}
 #    }}
-#
 ##
 { 'event': 'SPICE_DISCONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
@@ -458,7 +461,6 @@
 #
 # <- { "timestamp": {"seconds": 1290688046, "microseconds": 417172},
 #      "event": "SPICE_MIGRATE_COMPLETED" }
-#
 ##
 { 'event': 'SPICE_MIGRATE_COMPLETED',
   'if': 'CONFIG_SPICE' }
@@ -474,9 +476,9 @@
 #
 # @host: IP address
 #
-# @service: The service name of the vnc port. This may depend on the host
-#           system's service database so symbolic names should not be relied
-#           on.
+# @service: The service name of the vnc port.  This may depend on the
+#     host system's service database so symbolic names should not be
+#     relied on.
 #
 # @family: address family
 #
@@ -496,8 +498,8 @@
 #
 # The network connection information for server
 #
-# @auth: authentication method used for
-#        the plain (non-websocket) VNC server
+# @auth: authentication method used for the plain (non-websocket) VNC
+#     server
 #
 # Since: 2.1
 ##
@@ -512,10 +514,10 @@
 # Information about a connected VNC client.
 #
 # @x509_dname: If x509 authentication is in use, the Distinguished
-#              Name of the client.
+#     Name of the client.
 #
 # @sasl_username: If SASL authentication is in use, the SASL username
-#                 used for authentication.
+#     used for authentication.
 #
 # Since: 0.14
 ##
@@ -531,33 +533,41 @@
 #
 # @enabled: true if the VNC server is enabled, false otherwise
 #
-# @host: The hostname the VNC server is bound to.  This depends on
-#        the name resolution on the host and may be an IP address.
+# @host: The hostname the VNC server is bound to.  This depends on the
+#     name resolution on the host and may be an IP address.
 #
-# @family: - 'ipv6' if the host is listening for IPv6 connections
-#          - 'ipv4' if the host is listening for IPv4 connections
-#          - 'unix' if the host is listening on a unix domain socket
-#          - 'unknown' otherwise
+# @family:
+#     - 'ipv6' if the host is listening for IPv6 connections
+#     - 'ipv4' if the host is listening for IPv4 connections
+#     - 'unix' if the host is listening on a unix domain socket
+#     - 'unknown' otherwise
 #
 # @service: The service name of the server's port.  This may depends
-#           on the host system's service database so symbolic names should not
-#           be relied on.
+#     on the host system's service database so symbolic names should
+#     not be relied on.
 #
 # @auth: the current authentication type used by the server
 #
-#        - 'none' if no authentication is being used
-#        - 'vnc' if VNC authentication is being used
-#        - 'vencrypt+plain' if VEncrypt is used with plain text authentication
-#        - 'vencrypt+tls+none' if VEncrypt is used with TLS and no authentication
-#        - 'vencrypt+tls+vnc' if VEncrypt is used with TLS and VNC authentication
-#        - 'vencrypt+tls+plain' if VEncrypt is used with TLS and plain text auth
-#        - 'vencrypt+x509+none' if VEncrypt is used with x509 and no auth
-#        - 'vencrypt+x509+vnc' if VEncrypt is used with x509 and VNC auth
-#        - 'vencrypt+x509+plain' if VEncrypt is used with x509 and plain text auth
-#        - 'vencrypt+tls+sasl' if VEncrypt is used with TLS and SASL auth
-#        - 'vencrypt+x509+sasl' if VEncrypt is used with x509 and SASL auth
+#     - 'none' if no authentication is being used
+#     - 'vnc' if VNC authentication is being used
+#     - 'vencrypt+plain' if VEncrypt is used with plain text
+#       authentication
+#     - 'vencrypt+tls+none' if VEncrypt is used with TLS and no
+#       authentication
+#     - 'vencrypt+tls+vnc' if VEncrypt is used with TLS and VNC
+#       authentication
+#     - 'vencrypt+tls+plain' if VEncrypt is used with TLS and plain
+#       text auth
+#     - 'vencrypt+x509+none' if VEncrypt is used with x509 and no auth
+#     - 'vencrypt+x509+vnc' if VEncrypt is used with x509 and VNC auth
+#     - 'vencrypt+x509+plain' if VEncrypt is used with x509 and plain
+#       text auth
+#     - 'vencrypt+tls+sasl' if VEncrypt is used with TLS and SASL auth
+#     - 'vencrypt+x509+sasl' if VEncrypt is used with x509 and SASL
+#       auth
 #
-# @clients: a list of @VncClientInfo of all currently connected clients
+# @clients: a list of @VncClientInfo of all currently connected
+#     clients
 #
 # Since: 0.14
 ##
@@ -601,8 +611,8 @@
 #
 # @auth: The current authentication type used by the servers
 #
-# @vencrypt: The vencrypt sub authentication type used by the
-#            servers, only specified in case auth == vencrypt.
+# @vencrypt: The vencrypt sub authentication type used by the servers,
+#     only specified in case auth == vencrypt.
 #
 # Since: 2.9
 ##
@@ -620,17 +630,18 @@
 # @id: vnc server name.
 #
 # @server: A list of @VncBasincInfo describing all listening sockets.
-#          The list can be empty (in case the vnc server is disabled).
-#          It also may have multiple entries: normal + websocket,
-#          possibly also ipv4 + ipv6 in the future.
+#     The list can be empty (in case the vnc server is disabled). It
+#     also may have multiple entries: normal + websocket, possibly
+#     also ipv4 + ipv6 in the future.
 #
-# @clients: A list of @VncClientInfo of all currently connected clients.
-#           The list can be empty, for obvious reasons.
+# @clients: A list of @VncClientInfo of all currently connected
+#     clients.  The list can be empty, for obvious reasons.
 #
-# @auth: The current authentication type used by the non-websockets servers
+# @auth: The current authentication type used by the non-websockets
+#     servers
 #
 # @vencrypt: The vencrypt authentication type used by the servers,
-#            only specified in case auth == vencrypt.
+#     only specified in case auth == vencrypt.
 #
 # @display: The display device the vnc server is linked to.
 #
@@ -673,7 +684,6 @@
 #          ]
 #       }
 #    }
-#
 ##
 { 'command': 'query-vnc', 'returns': 'VncInfo',
   'if': 'CONFIG_VNC' }
@@ -698,8 +708,9 @@
 #
 # Since: 1.1
 #
-# Notes: An empty password in this command will set the password to the empty
-#        string.  Existing clients are unaffected by executing this command.
+# Notes: An empty password in this command will set the password to
+#     the empty string.  Existing clients are unaffected by executing
+#     this command.
 ##
 { 'command': 'change-vnc-password',
   'data': { 'password': 'str' },
@@ -714,8 +725,8 @@
 #
 # @client: client information
 #
-# Note: This event is emitted before any authentication takes place, thus
-#       the authentication ID is not provided
+# Note: This event is emitted before any authentication takes place,
+#     thus the authentication ID is not provided
 #
 # Since: 0.13
 #
@@ -728,7 +739,6 @@
 #            "client": { "family": "ipv4", "service": "58425",
 #                        "host": "127.0.0.1", "websocket": false } },
 #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
-#
 ##
 { 'event': 'VNC_CONNECTED',
   'data': { 'server': 'VncServerInfo',
@@ -738,8 +748,8 @@
 ##
 # @VNC_INITIALIZED:
 #
-# Emitted after authentication takes place (if any) and the VNC session is
-# made active
+# Emitted after authentication takes place (if any) and the VNC
+# session is made active
 #
 # @server: server information
 #
@@ -756,7 +766,6 @@
 #            "client": { "family": "ipv4", "service": "46089", "websocket": false,
 #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
 #       "timestamp": { "seconds": 1263475302, "microseconds": 150772 } }
-#
 ##
 { 'event': 'VNC_INITIALIZED',
   'data': { 'server': 'VncServerInfo',
@@ -783,7 +792,6 @@
 #            "client": { "family": "ipv4", "service": "58425", "websocket": false,
 #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
 #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
-#
 ##
 { 'event': 'VNC_DISCONNECTED',
   'data': { 'server': 'VncServerInfo',
@@ -805,7 +813,8 @@
 #
 # @current: true if this device is currently receiving mouse events
 #
-# @absolute: true if this device supports absolute coordinates as input
+# @absolute: true if this device supports absolute coordinates as
+#     input
 #
 # Since: 0.14
 ##
@@ -840,7 +849,6 @@
 #          }
 #       ]
 #    }
-#
 ##
 { 'command': 'query-mice', 'returns': ['MouseInfo'] }
 
@@ -852,59 +860,96 @@
 # This is used by the @send-key command.
 #
 # @unmapped: since 2.0
+#
 # @pause: since 2.0
+#
 # @ro: since 2.4
+#
 # @kp_comma: since 2.4
+#
 # @kp_equals: since 2.6
+#
 # @power: since 2.6
+#
 # @hiragana: since 2.9
+#
 # @henkan: since 2.9
+#
 # @yen: since 2.9
 #
 # @sleep: since 2.10
+#
 # @wake: since 2.10
+#
 # @audionext: since 2.10
+#
 # @audioprev: since 2.10
+#
 # @audiostop: since 2.10
+#
 # @audioplay: since 2.10
+#
 # @audiomute: since 2.10
+#
 # @volumeup: since 2.10
+#
 # @volumedown: since 2.10
+#
 # @mediaselect: since 2.10
+#
 # @mail: since 2.10
+#
 # @calculator: since 2.10
+#
 # @computer: since 2.10
+#
 # @ac_home: since 2.10
+#
 # @ac_back: since 2.10
+#
 # @ac_forward: since 2.10
+#
 # @ac_refresh: since 2.10
+#
 # @ac_bookmarks: since 2.10
 #
 # @muhenkan: since 2.12
+#
 # @katakanahiragana: since 2.12
 #
 # @lang1: since 6.1
+#
 # @lang2: since 6.1
 #
 # @f13: since 8.0
+#
 # @f14: since 8.0
+#
 # @f15: since 8.0
+#
 # @f16: since 8.0
+#
 # @f17: since 8.0
+#
 # @f18: since 8.0
+#
 # @f19: since 8.0
+#
 # @f20: since 8.0
+#
 # @f21: since 8.0
+#
 # @f22: since 8.0
+#
 # @f23: since 8.0
+#
 # @f24: since 8.0
 #
-# 'sysrq' was mistakenly added to hack around the fact that
-# the ps2 driver was not generating correct scancodes sequences
-# when 'alt+print' was pressed. This flaw is now fixed and the
-# 'sysrq' key serves no further purpose. Any further use of
-# 'sysrq' will be transparently changed to 'print', so they
-# are effectively synonyms.
+# 'sysrq' was mistakenly added to hack around the fact that the ps2
+# driver was not generating correct scancodes sequences when
+# 'alt+print' was pressed.  This flaw is now fixed and the 'sysrq' key
+# serves no further purpose.  Any further use of 'sysrq' will be
+# transparently changed to 'print', so they are effectively synonyms.
 #
 # Since: 1.3
 ##
@@ -976,16 +1021,17 @@
 #
 # Send keys to guest.
 #
-# @keys: An array of @KeyValue elements. All @KeyValues in this array are
-#        simultaneously sent to the guest. A @KeyValue.number value is sent
-#        directly to the guest, while @KeyValue.qcode must be a valid
-#        @QKeyCode value
+# @keys: An array of @KeyValue elements.  All @KeyValues in this array
+#     are simultaneously sent to the guest.  A @KeyValue.number value
+#     is sent directly to the guest, while @KeyValue.qcode must be a
+#     valid @QKeyCode value
 #
-# @hold-time: time to delay key up events, milliseconds. Defaults
-#             to 100
+# @hold-time: time to delay key up events, milliseconds.  Defaults to
+#     100
 #
-# Returns: - Nothing on success
-#          - If key is unknown or redundant, GenericError
+# Returns:
+#     - Nothing on success
+#     - If key is unknown or redundant, GenericError
 #
 # Since: 1.3
 #
@@ -996,7 +1042,6 @@
 #                               { "type": "qcode", "data": "alt" },
 #                               { "type": "qcode", "data": "delete" } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'send-key',
   'data': { 'keys': ['KeyValue'], '*hold-time': 'int' } }
@@ -1032,6 +1077,7 @@
 # Keyboard input event.
 #
 # @key: Which key this event is for.
+#
 # @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
@@ -1046,6 +1092,7 @@
 # Pointer button input event.
 #
 # @button: Which button this event is for.
+#
 # @down: True for key-down and false for key-up events.
 #
 # Since: 2.0
@@ -1060,8 +1107,9 @@
 # Pointer motion input event.
 #
 # @axis: Which axis is referenced by @value.
-# @value: Pointer position.  For absolute coordinates the
-#         valid range is 0 -> 0x7ffff
+#
+# @value: Pointer position.  For absolute coordinates the valid range
+#     is 0 -> 0x7ffff
 #
 # Since: 2.0
 ##
@@ -1108,10 +1156,10 @@
 #
 # @type: the input type, one of:
 #
-#        - 'key': Input event of Keyboard
-#        - 'btn': Input event of pointer buttons
-#        - 'rel': Input event of relative pointer motion
-#        - 'abs': Input event of absolute pointer motion
+#     - 'key': Input event of Keyboard
+#     - 'btn': Input event of pointer buttons
+#     - 'rel': Input event of relative pointer motion
+#     - 'abs': Input event of absolute pointer motion
 #
 # Since: 2.0
 ##
@@ -1140,8 +1188,10 @@
 # precedence.
 #
 # @device: display device to send event(s) to.
-# @head: head to send event(s) to, in case the
-#        display device supports multiple scanouts.
+#
+# @head: head to send event(s) to, in case the display device supports
+#     multiple scanouts.
+#
 # @events: List of InputEvent union.
 #
 # Returns: Nothing on success.
@@ -1149,9 +1199,9 @@
 # Since: 2.6
 #
 # Note: The consoles are visible in the qom tree, under
-#       /backend/console[$index]. They have a device link and head property,
-#       so it is possible to map which console belongs to which device and
-#       display.
+#     /backend/console[$index]. They have a device link and head
+#     property, so it is possible to map which console belongs to
+#     which device and display.
 #
 # Examples:
 #
@@ -1188,7 +1238,6 @@
 #                { "type": "abs", "data" : { "axis": "x", "value" : 20000 } },
 #                { "type": "abs", "data" : { "axis": "y", "value" : 400 } } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'input-send-event',
   'data': { '*device': 'str',
@@ -1201,19 +1250,20 @@
 # GTK display options.
 #
 # @grab-on-hover: Grab keyboard input on mouse hover.
+#
 # @zoom-to-fit: Zoom guest display to fit into the host window.  When
-#               turned off the host window will be resized instead.
-#               In case the display device can notify the guest on
-#               window resizes (virtio-gpu) this will default to "on",
-#               assuming the guest will resize the display to match
-#               the window size then.  Otherwise it defaults to "off".
-#               (Since 3.1)
-# @show-tabs:   Display the tab bar for switching between the various graphical
-#               interfaces (e.g. VGA and virtual console character devices)
-#               by default.
-#               (Since 7.1)
-# @show-menubar: Display the main window menubar. Defaults to "on".
-#                (Since 8.0)
+#     turned off the host window will be resized instead.  In case the
+#     display device can notify the guest on window resizes
+#     (virtio-gpu) this will default to "on", assuming the guest will
+#     resize the display to match the window size then.  Otherwise it
+#     defaults to "off". (Since 3.1)
+#
+# @show-tabs: Display the tab bar for switching between the various
+#     graphical interfaces (e.g.  VGA and virtual console character
+#     devices) by default.  (Since 7.1)
+#
+# @show-menubar: Display the main window menubar.  Defaults to "on".
+#     (Since 8.0)
 #
 # Since: 2.12
 ##
@@ -1228,8 +1278,8 @@
 #
 # EGL headless display options.
 #
-# @rendernode: Which DRM render node should be used. Default is the first
-#              available node on the host.
+# @rendernode: Which DRM render node should be used.  Default is the
+#     first available node on the host.
 #
 # Since: 3.1
 ##
@@ -1243,11 +1293,11 @@
 #
 # @addr: The D-Bus bus address (default to the session bus).
 #
-# @rendernode: Which DRM render node should be used. Default is the first
-#              available node on the host.
+# @rendernode: Which DRM render node should be used.  Default is the
+#     first available node on the host.
 #
 # @p2p: Whether to use peer-to-peer connections (accepted through
-#       @add_client).
+#     @add_client).
 #
 # @audiodev: Use the specified DBus audiodev to export audio.
 #
@@ -1265,10 +1315,13 @@
 # Display OpenGL mode.
 #
 # @off: Disable OpenGL (default).
-# @on: Use OpenGL, pick context type automatically.
-#      Would better be named 'auto' but is called 'on' for backward
-#      compatibility with bool type.
+#
+# @on: Use OpenGL, pick context type automatically.  Would better be
+#     named 'auto' but is called 'on' for backward compatibility with
+#     bool type.
+#
 # @core: Use OpenGL with Core (desktop) Context.
+#
 # @es: Use OpenGL with ES (embedded systems) Context.
 #
 # Since: 3.0
@@ -1294,18 +1347,17 @@
 # Cocoa display options.
 #
 # @left-command-key: Enable/disable forwarding of left command key to
-#                    guest. Allows command-tab window switching on the
-#                    host without sending this key to the guest when
-#                    "off". Defaults to "on"
+#     guest.  Allows command-tab window switching on the host without
+#     sending this key to the guest when "off". Defaults to "on"
 #
-# @full-grab: Capture all key presses, including system combos. This
-#             requires accessibility permissions, since it performs
-#             a global grab on key events. (default: off)
-#             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+# @full-grab: Capture all key presses, including system combos.  This
+#     requires accessibility permissions, since it performs a global
+#     grab on key events.  (default: off) See
+#     https://support.apple.com/en-in/guide/mac-help/mh32356/mac
 #
-# @swap-opt-cmd: Swap the Option and Command keys so that their key codes match
-#                their position on non-Mac keyboards and you can use Meta/Super
-#                and Alt where you expect them. (default: off)
+# @swap-opt-cmd: Swap the Option and Command keys so that their key
+#     codes match their position on non-Mac keyboards and you can use
+#     Meta/Super and Alt where you expect them.  (default: off)
 #
 # Since: 7.0
 ##
@@ -1331,8 +1383,8 @@
 #
 # SDL2 display options.
 #
-# @grab-mod:  Modifier keys that should be pressed together with the
-#             "G" key to release the mouse grab.
+# @grab-mod: Modifier keys that should be pressed together with the
+#     "G" key to release the mouse grab.
 #
 # Since: 7.1
 ##
@@ -1344,36 +1396,35 @@
 #
 # Display (user interface) type.
 #
-# @default: The default user interface, selecting from the first available
-#           of gtk, sdl, cocoa, and vnc.
+# @default: The default user interface, selecting from the first
+#     available of gtk, sdl, cocoa, and vnc.
 #
-# @none: No user interface or video output display. The guest will
-#        still see an emulated graphics card, but its output will not
-#        be displayed to the QEMU user.
+# @none: No user interface or video output display.  The guest will
+#     still see an emulated graphics card, but its output will not be
+#     displayed to the QEMU user.
 #
 # @gtk: The GTK user interface.
 #
 # @sdl: The SDL user interface.
 #
 # @egl-headless: No user interface, offload GL operations to a local
-#                DRI device. Graphical display need to be paired with
-#                VNC or Spice. (Since 3.1)
+#     DRI device.  Graphical display need to be paired with VNC or
+#     Spice.  (Since 3.1)
 #
 # @curses: Display video output via curses.  For graphics device
-#          models which support a text mode, QEMU can display this
-#          output using a curses/ncurses interface. Nothing is
-#          displayed when the graphics device is in graphical mode or
-#          if the graphics device does not support a text
-#          mode. Generally only the VGA device models support text
-#          mode.
+#     models which support a text mode, QEMU can display this output
+#     using a curses/ncurses interface.  Nothing is displayed when the
+#     graphics device is in graphical mode or if the graphics device
+#     does not support a text mode.  Generally only the VGA device
+#     models support text mode.
 #
 # @cocoa: The Cocoa user interface.
 #
 # @spice-app: Set up a Spice server and run the default associated
-#             application to connect to it. The server will redirect
-#             the serial console and QEMU monitors. (Since 4.0)
+#     application to connect to it.  The server will redirect the
+#     serial console and QEMU monitors.  (Since 4.0)
 #
-# @dbus: Start a D-Bus service for the display. (Since 7.0)
+# @dbus: Start a D-Bus service for the display.  (Since 7.0)
 #
 # Since: 2.12
 ##
@@ -1398,9 +1449,16 @@
 # Display (user interface) options.
 #
 # @type: Which DisplayType qemu should use.
-# @full-screen: Start user interface in fullscreen mode (default: off).
-# @window-close: Allow to quit qemu with window close button (default: on).
-# @show-cursor: Force showing the mouse cursor (default: off). (since: 5.0)
+#
+# @full-screen: Start user interface in fullscreen mode
+#     (default: off).
+#
+# @window-close: Allow to quit qemu with window close button
+#     (default: on).
+#
+# @show-cursor: Force showing the mouse cursor (default: off).
+#     (since: 5.0)
+#
 # @gl: Enable OpenGL support (default: off).
 #
 # Since: 2.12
@@ -1487,7 +1545,6 @@
 # -> { "execute": "display-reload",
 #      "arguments": { "type": "vnc", "tls-certs": true  } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
@@ -1510,9 +1567,9 @@
 #
 # Specify the VNC reload options.
 #
-# @addresses: If specified, change set of addresses
-#             to listen for connections. Addresses configured
-#             for websockets are not touched.
+# @addresses: If specified, change set of addresses to listen for
+#     connections.  Addresses configured for websockets are not
+#     touched.
 #
 # Since: 7.1
 ##
@@ -1549,7 +1606,6 @@
 #                     [ { "type": "inet", "host": "0.0.0.0",
 #                         "port": "5901" } ] } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'display-update',
   'data': 'DisplayUpdateOptions',
@@ -1563,9 +1619,13 @@
 # once migration finished successfully.  Only implemented for SPICE.
 #
 # @protocol: must be "spice"
+#
 # @hostname: migration target hostname
+#
 # @port: spice tcp port for plaintext channels
+#
 # @tls-port: spice tcp port for tls-secured channels
+#
 # @cert-subject: server certificate subject
 #
 # Since: 0.14
@@ -1577,7 +1637,6 @@
 #                     "hostname": "virt42.lab.kraxel.org",
 #                     "port": 1234 } }
 # <- { "return": {} }
-#
 ##
 { 'command': 'client_migrate_info',
   'data': { 'protocol': 'str', 'hostname': 'str', '*port': 'int',
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 019d2d1987..e6dcee7b83 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -16,7 +16,6 @@
 # @name: Name of the VirtIODevice
 #
 # Since: 7.2
-#
 ##
 { 'struct': 'VirtioInfo',
   'data': { 'path': 'str',
@@ -28,6 +27,7 @@
 # Returns a list of all realized VirtIODevices
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: List of gathered VirtIODevices
@@ -60,9 +60,7 @@
 #          }
 #      ]
 #    }
-#
 ##
-
 { 'command': 'x-query-virtio',
   'returns': [ 'VirtioInfo' ],
   'features': [ 'unstable' ] }
@@ -70,7 +68,7 @@
 ##
 # @VhostStatus:
 #
-# Information about a vhost device. This information will only be
+# Information about a vhost device.  This information will only be
 # displayed if the vhost device is active.
 #
 # @n-mem-sections: vhost_dev n_mem_sections
@@ -98,9 +96,7 @@
 # @log-size: vhost_dev log_size
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VhostStatus',
   'data': { 'n-mem-sections': 'int',
             'n-tmp-sections': 'int',
@@ -119,8 +115,8 @@
 # @VirtioStatus:
 #
 # Full status of the virtio device with most VirtIODevice members.
-# Also includes the full status of the corresponding vhost device
-# if the vhost device is active.
+# Also includes the full status of the corresponding vhost device if
+# the vhost device is active.
 #
 # @name: VirtIODevice name
 #
@@ -136,8 +132,8 @@
 #
 # @device-endian: VirtIODevice device_endian
 #
-# @num-vqs: VirtIODevice virtqueue count. This is the number of active
-#           virtqueues being used by the VirtIODevice.
+# @num-vqs: VirtIODevice virtqueue count.  This is the number of
+#     active virtqueues being used by the VirtIODevice.
 #
 # @status: VirtIODevice configuration status (VirtioDeviceStatus)
 #
@@ -163,14 +159,12 @@
 #
 # @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
 #
-# @vhost-dev: Corresponding vhost device info for a given VirtIODevice.
-#             Present if the given VirtIODevice has an active vhost
-#             device.
+# @vhost-dev: Corresponding vhost device info for a given
+#     VirtIODevice.  Present if the given VirtIODevice has an active
+#     vhost device.
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtioStatus',
   'data': { 'name': 'str',
             'device-id': 'uint16',
@@ -202,6 +196,7 @@
 # @path: Canonical QOM path of the VirtIODevice
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: VirtioStatus of the virtio device
@@ -433,9 +428,7 @@
 #          "use-started": true
 #      }
 #    }
-#
 ##
-
 { 'command': 'x-query-virtio-status',
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus',
@@ -448,13 +441,13 @@
 # device
 #
 # @statuses: List of decoded configuration statuses of the virtio
-#            device
+#     device
 #
-# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
+# @unknown-statuses: Virtio device statuses bitmap that have not been
+#     decoded
 #
 # Since: 7.2
 ##
-
 { 'struct': 'VirtioDeviceStatus',
   'data': { 'statuses': [ 'str' ],
             '*unknown-statuses': 'uint8' } }
@@ -466,14 +459,13 @@
 # Vhost User device
 #
 # @protocols: List of decoded vhost user protocol features of a vhost
-#             user device
+#     user device
 #
 # @unknown-protocols: Vhost user device protocol features bitmap that
-#                     have not been decoded
+#     have not been decoded
 #
 # Since: 7.2
 ##
-
 { 'struct': 'VhostDeviceProtocols',
   'data': { 'protocols': [ 'str' ],
             '*unknown-protocols': 'uint64' } }
@@ -481,20 +473,19 @@
 ##
 # @VirtioDeviceFeatures:
 #
-# The common fields that apply to most Virtio devices. Some devices
+# The common fields that apply to most Virtio devices.  Some devices
 # may not have their own device-specific features (e.g. virtio-rng).
 #
 # @transports: List of transport features of the virtio device
 #
 # @dev-features: List of device-specific features (if the device has
-#                unique features)
+#     unique features)
 #
 # @unknown-dev-features: Virtio device features bitmap that have not
-#                        been decoded
+#     been decoded
 #
 # Since: 7.2
 ##
-
 { 'struct': 'VirtioDeviceFeatures',
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
@@ -525,7 +516,7 @@
 # @vring-used: VirtQueue vring.used (device area)
 #
 # @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
-#                  vhost_get_vring_base (if vhost active)
+#     vhost_get_vring_base (if vhost active)
 #
 # @shadow-avail-idx: VirtQueue shadow_avail_idx
 #
@@ -536,9 +527,7 @@
 # @signalled-used-valid: VirtQueue signalled_used_valid flag
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtQueueStatus',
   'data': { 'name': 'str',
             'queue-index': 'uint16',
@@ -565,16 +554,17 @@
 # @queue: VirtQueue index to examine
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: VirtQueueStatus of the VirtQueue
 #
-# Notes: last_avail_idx will not be displayed in the case where
-#        the selected VirtIODevice has a running vhost device and
-#        the VirtIODevice VirtQueue index (queue) does not exist for
-#        the corresponding vhost device vhost_virtqueue. Also,
-#        shadow_avail_idx will not be displayed in the case where
-#        the selected VirtIODevice has a running vhost device.
+# Notes: last_avail_idx will not be displayed in the case where the
+#     selected VirtIODevice has a running vhost device and the
+#     VirtIODevice VirtQueue index (queue) does not exist for the
+#     corresponding vhost device vhost_virtqueue.  Also,
+#     shadow_avail_idx will not be displayed in the case where the
+#     selected VirtIODevice has a running vhost device.
 #
 # Since: 7.2
 #
@@ -626,9 +616,7 @@
 #          "vring-num": 128
 #      }
 #    }
-#
 ##
-
 { 'command': 'x-query-virtio-queue-status',
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtQueueStatus',
@@ -667,9 +655,7 @@
 # @used-size: vhost_virtqueue used_size
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtVhostQueueStatus',
   'data': { 'name': 'str',
             'kick': 'int',
@@ -695,6 +681,7 @@
 # @queue: vhost_virtqueue index to examine
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: VirtVhostQueueStatus of the vhost_virtqueue
@@ -748,9 +735,7 @@
 #          "kick": 0
 #      }
 #    }
-#
 ##
-
 { 'command': 'x-query-virtio-vhost-queue-status',
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus',
@@ -768,9 +753,7 @@
 # @flags: List of descriptor flags
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtioRingDesc',
   'data': { 'addr': 'uint64',
             'len': 'uint32',
@@ -788,9 +771,7 @@
 # @ring: VRingAvail ring[] entry at provided index
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtioRingAvail',
   'data': { 'flags': 'uint16',
             'idx': 'uint16',
@@ -806,9 +787,7 @@
 # @idx: VRingUsed index
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtioRingUsed',
   'data': { 'flags': 'uint16',
             'idx': 'uint16' } }
@@ -830,9 +809,7 @@
 # @used: VRingUsed info
 #
 # Since: 7.2
-#
 ##
-
 { 'struct': 'VirtioQueueElement',
   'data': { 'name': 'str',
             'index': 'uint32',
@@ -849,10 +826,11 @@
 #
 # @queue: VirtQueue index to examine
 #
-# @index: Index of the element in the queue
-#         (default: head of the queue)
+# @index: Index of the element in the queue (default: head of the
+#     queue)
 #
 # Features:
+#
 # @unstable: This command is meant for debugging.
 #
 # Returns: VirtioQueueElement information
@@ -945,9 +923,7 @@
 #          }
 #      }
 #    }
-#
 ##
-
 { 'command': 'x-query-virtio-queue-element',
   'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
   'returns': 'VirtioQueueElement',
diff --git a/qapi/yank.json b/qapi/yank.json
index 1639744ada..87ec7cab96 100644
--- a/qapi/yank.json
+++ b/qapi/yank.json
@@ -9,7 +9,7 @@
 ##
 # @YankInstanceType:
 #
-# An enumeration of yank instance types. See @YankInstance for more
+# An enumeration of yank instance types.  See @YankInstance for more
 # information.
 #
 # Since: 6.0
@@ -20,8 +20,8 @@
 ##
 # @YankInstanceBlockNode:
 #
-# Specifies which block graph node to yank. See @YankInstance for more
-# information.
+# Specifies which block graph node to yank.  See @YankInstance for
+# more information.
 #
 # @node-name: the name of the block graph node
 #
@@ -33,8 +33,8 @@
 ##
 # @YankInstanceChardev:
 #
-# Specifies which character device to yank. See @YankInstance for more
-# information.
+# Specifies which character device to yank.  See @YankInstance for
+# more information.
 #
 # @id: the chardev's ID
 #
@@ -46,21 +46,18 @@
 ##
 # @YankInstance:
 #
-# A yank instance can be yanked with the @yank qmp command to recover from a
-# hanging QEMU.
+# A yank instance can be yanked with the @yank qmp command to recover
+# from a hanging QEMU.
 #
 # Currently implemented yank instances:
 #
-# - nbd block device:
-#   Yanking it will shut down the connection to the nbd server without
-#   attempting to reconnect.
-# - socket chardev:
-#   Yanking it will shut down the connected socket.
-# - migration:
-#   Yanking it will shut down all migration connections. Unlike
-#   @migrate_cancel, it will not notify the migration process, so migration
-#   will go into @failed state, instead of @cancelled state. @yank should be
-#   used to recover from hangs.
+# - nbd block device: Yanking it will shut down the connection to the
+#   nbd server without attempting to reconnect.
+# - socket chardev: Yanking it will shut down the connected socket.
+# - migration: Yanking it will shut down all migration connections.
+#   Unlike @migrate_cancel, it will not notify the migration process,
+#   so migration will go into @failed state, instead of @cancelled
+#   state.  @yank should be used to recover from hangs.
 #
 # Since: 6.0
 ##
@@ -74,13 +71,14 @@
 ##
 # @yank:
 #
-# Try to recover from hanging QEMU by yanking the specified instances. See
-# @YankInstance for more information.
+# Try to recover from hanging QEMU by yanking the specified instances.
+# See @YankInstance for more information.
 #
 # Takes a list of @YankInstance as argument.
 #
-# Returns: - Nothing on success
-#          - @DeviceNotFound error, if any of the YankInstances doesn't exist
+# Returns:
+# - Nothing on success
+# - @DeviceNotFound error, if any of the YankInstances doesn't exist
 #
 # Example:
 #
@@ -101,7 +99,7 @@
 ##
 # @query-yank:
 #
-# Query yank instances. See @YankInstance for more information.
+# Query yank instances.  See @YankInstance for more information.
 #
 # Returns: list of @YankInstance
 #
-- 
2.39.2


