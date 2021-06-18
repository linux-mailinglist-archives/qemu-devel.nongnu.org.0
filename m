Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4813AC8F0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:36:09 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBr6-0003iq-E8
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBjC-0007oL-UF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBj6-0001Zf-KO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624012068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4Oxac+mz4dWOLX6DAysK5co9TzJVoRY4H/bk4Fii7o=;
 b=c5LPXwXeWy+62yUEsxfA5Hrd9IsBtUk4x3CLdSqdYhpWMkq3nZJps6LcvoIuPJ+PqxI8xC
 Oqd5+Boe59fPWHx4869kLXwQjNxmTwLg22Y8n/tXx0xUSHWKL7dSbLxb8ro0Rp64ZNgHtj
 /HYyO//owwv1Fj2MYOGoVX91bL+0NW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-ZBiqXwaqPN-fp5GgVHXLug-1; Fri, 18 Jun 2021 06:27:47 -0400
X-MC-Unique: ZBiqXwaqPN-fp5GgVHXLug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94FC619057A9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:27:46 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71AEF70C20;
 Fri, 18 Jun 2021 10:27:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/11] qapi: make 'if' condition strings simple identifiers
Date: Fri, 18 Jun 2021 14:25:07 +0400
Message-Id: <20210618102507.3761128-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Change the 'if' condition strings to be C-agnostic and be simple
identifiers.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 qapi/block-core.json                          | 16 ++---
 qapi/block-export.json                        |  6 +-
 qapi/char.json                                | 12 ++--
 qapi/machine-target.json                      | 40 ++++++-------
 qapi/migration.json                           | 10 ++--
 qapi/misc-target.json                         | 50 ++++++++--------
 qapi/qom.json                                 | 10 ++--
 qapi/sockets.json                             |  6 +-
 qapi/tpm.json                                 | 18 +++---
 qapi/ui.json                                  | 48 +++++++--------
 qga/qapi-schema.json                          |  8 +--
 scripts/qapi/common.py                        |  2 +-
 scripts/qapi/expr.py                          |  4 +-
 .../alternate-branch-if-invalid.err           |  2 +-
 tests/qapi-schema/bad-if-empty.err            |  2 +-
 tests/qapi-schema/bad-if-list.err             |  2 +-
 tests/qapi-schema/bad-if.json                 |  2 +-
 tests/qapi-schema/doc-good.json               |  6 +-
 tests/qapi-schema/doc-good.out                |  6 +-
 tests/qapi-schema/doc-good.txt                |  6 +-
 tests/qapi-schema/features-missing-name.json  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       | 52 ++++++++--------
 tests/qapi-schema/qapi-schema-test.out        | 60 +++++++++----------
 tests/qapi-schema/union-branch-if-invalid.err |  2 +-
 24 files changed, 186 insertions(+), 186 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2ea294129e..13fcdd6b91 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2779,7 +2779,7 @@
 ##
 { 'enum': 'BlockdevAioOptions',
   'data': [ 'threads', 'native',
-            { 'name': 'io_uring', 'if': 'defined(CONFIG_LINUX_IO_URING)' } ] }
+            { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' } ] }
 
 ##
 # @BlockdevCacheOptions:
@@ -2817,7 +2817,7 @@
             'gluster', 'host_cdrom', 'host_device', 'http', 'https', 'iscsi',
             'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
             'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
-            { 'name': 'replication', 'if': 'defined(CONFIG_REPLICATION)' },
+            { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
             'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
 
 ##
@@ -2859,10 +2859,10 @@
             '*locking': 'OnOffAuto',
             '*aio': 'BlockdevAioOptions',
             '*drop-cache': {'type': 'bool',
-                            'if': 'defined(CONFIG_LINUX)'},
+                            'if': 'CONFIG_LINUX'},
             '*x-check-cache-dropped': 'bool' },
   'features': [ { 'name': 'dynamic-auto-read-only',
-                  'if': 'defined(CONFIG_POSIX)' } ] }
+                  'if': 'CONFIG_POSIX' } ] }
 
 ##
 # @BlockdevOptionsNull:
@@ -3662,7 +3662,7 @@
 # Since: 2.9
 ##
 { 'enum' : 'ReplicationMode', 'data' : [ 'primary', 'secondary' ],
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @BlockdevOptionsReplication:
@@ -3681,7 +3681,7 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'mode': 'ReplicationMode',
             '*top-id': 'str' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @NFSTransport:
@@ -4015,7 +4015,7 @@
       'raw':        'BlockdevOptionsRaw',
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
-                       'if': 'defined(CONFIG_REPLICATION)' },
+                       'if': 'CONFIG_REPLICATION' },
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
@@ -4316,7 +4316,7 @@
 # Since: 5.1
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
diff --git a/qapi/block-export.json b/qapi/block-export.json
index e819e70cac..319992b1b0 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -137,7 +137,7 @@
 { 'struct': 'BlockExportOptionsFuse',
   'data': { 'mountpoint': 'str',
             '*growable': 'bool' },
-  'if': 'defined(CONFIG_FUSE)' }
+  'if': 'CONFIG_FUSE' }
 
 ##
 # @NbdServerAddOptions:
@@ -247,7 +247,7 @@
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd', 'vhost-user-blk',
-            { 'name': 'fuse', 'if': 'defined(CONFIG_FUSE)' } ] }
+            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
 # @BlockExportOptions:
@@ -290,7 +290,7 @@
       'nbd': 'BlockExportOptionsNbd',
       'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
       'fuse': { 'type': 'BlockExportOptionsFuse',
-                'if': 'defined(CONFIG_FUSE)' }
+                'if': 'CONFIG_FUSE' }
    } }
 
 ##
diff --git a/qapi/char.json b/qapi/char.json
index adf2685f68..9b18ee3305 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -342,7 +342,7 @@
 { 'struct': 'ChardevSpiceChannel',
   'data': { 'type': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @ChardevSpicePort:
@@ -356,7 +356,7 @@
 { 'struct': 'ChardevSpicePort',
   'data': { 'fqdn': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @ChardevVC:
@@ -405,7 +405,7 @@
   'data': { '*mouse': 'bool',
             '*clipboard': 'bool' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE_PROTOCOL)' }
+  'if': 'CONFIG_SPICE_PROTOCOL' }
 
 ##
 # @ChardevBackend:
@@ -431,11 +431,11 @@
             'stdio': 'ChardevStdio',
             'console': 'ChardevCommon',
             'spicevmc': { 'type': 'ChardevSpiceChannel',
-                          'if': 'defined(CONFIG_SPICE)' },
+                          'if': 'CONFIG_SPICE' },
             'spiceport': { 'type': 'ChardevSpicePort',
-                           'if': 'defined(CONFIG_SPICE)' },
+                           'if': 'CONFIG_SPICE' },
             'qemu-vdagent': { 'type': 'ChardevQemuVDAgent',
-                              'if': 'defined(CONFIG_SPICE_PROTOCOL)' },
+                              'if': 'CONFIG_SPICE_PROTOCOL' },
             'vc': 'ChardevVC',
             'ringbuf': 'ChardevRingbuf',
             # next one is just for compatibility
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 9b56b81bea..f5ec4bc172 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -89,7 +89,7 @@
 ##
 { 'struct': 'CpuModelBaselineInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @CpuModelCompareInfo:
@@ -112,7 +112,7 @@
 { 'struct': 'CpuModelCompareInfo',
   'data': { 'result': 'CpuModelCompareResult',
             'responsible-properties': ['str'] },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @query-cpu-model-comparison:
@@ -156,7 +156,7 @@
 { 'command': 'query-cpu-model-comparison',
   'data': { 'modela': 'CpuModelInfo', 'modelb': 'CpuModelInfo' },
   'returns': 'CpuModelCompareInfo',
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @query-cpu-model-baseline:
@@ -200,7 +200,7 @@
   'data': { 'modela': 'CpuModelInfo',
             'modelb': 'CpuModelInfo' },
   'returns': 'CpuModelBaselineInfo',
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @CpuModelExpansionInfo:
@@ -213,9 +213,9 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': { 'any': [ 'defined(TARGET_S390X)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_ARM)'] } }
+  'if': { 'any': [ 'TARGET_S390X',
+                   'TARGET_I386',
+                   'TARGET_ARM' ] } }
 
 ##
 # @query-cpu-model-expansion:
@@ -254,9 +254,9 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': { 'any': [ 'defined(TARGET_S390X)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_ARM)' ] } }
+  'if': { 'any': [ 'TARGET_S390X',
+                   'TARGET_I386',
+                   'TARGET_ARM' ] } }
 
 ##
 # @CpuDefinitionInfo:
@@ -320,11 +320,11 @@
             'typename': 'str',
             '*alias-of' : 'str',
             'deprecated' : 'bool' },
-  'if': { 'any': [ 'defined(TARGET_PPC)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_MIPS)' ] } }
+  'if': { 'any': [ 'TARGET_PPC',
+                   'TARGET_ARM',
+                   'TARGET_I386',
+                   'TARGET_S390X',
+                   'TARGET_MIPS' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -336,8 +336,8 @@
 # Since: 1.2
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
-  'if': { 'any': [ 'defined(TARGET_PPC)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_MIPS)' ] } }
+  'if': { 'any': [ 'TARGET_PPC',
+                   'TARGET_ARM',
+                   'TARGET_I386',
+                   'TARGET_S390X',
+                   'TARGET_MIPS' ] } }
diff --git a/qapi/migration.json b/qapi/migration.json
index 1124a2dda8..88f07baedd 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -533,7 +533,7 @@
 ##
 { 'enum': 'MultiFDCompression',
   'data': [ 'none', 'zlib',
-            { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
+            { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
 ##
 # @BitmapMigrationBitmapAliasTransform:
@@ -1562,7 +1562,7 @@
 ##
 { 'command': 'xen-set-replication',
   'data': { 'enable': 'bool', 'primary': 'bool', '*failover' : 'bool' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @ReplicationStatus:
@@ -1578,7 +1578,7 @@
 ##
 { 'struct': 'ReplicationStatus',
   'data': { 'error': 'bool', '*desc': 'str' },
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @query-xen-replication-status:
@@ -1596,7 +1596,7 @@
 ##
 { 'command': 'query-xen-replication-status',
   'returns': 'ReplicationStatus',
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @xen-colo-do-checkpoint:
@@ -1613,7 +1613,7 @@
 # Since: 2.9
 ##
 { 'command': 'xen-colo-do-checkpoint',
-  'if': 'defined(CONFIG_REPLICATION)' }
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @COLOStatus:
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 9e2ea4a04a..3b05ad3dbf 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -23,17 +23,17 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int' },
-  'if': { 'any': [ 'defined(TARGET_ALPHA)',
-                   'defined(TARGET_ARM)',
-                   'defined(TARGET_HPPA)',
-                   'defined(TARGET_I386)',
-                   'defined(TARGET_MIPS)',
-                   'defined(TARGET_MIPS64)',
-                   'defined(TARGET_PPC)',
-                   'defined(TARGET_PPC64)',
-                   'defined(TARGET_S390X)',
-                   'defined(TARGET_SH4)',
-                   'defined(TARGET_SPARC)' ] } }
+  'if': { 'any': [ 'TARGET_ALPHA',
+                   'TARGET_ARM',
+                   'TARGET_HPPA',
+                   'TARGET_I386',
+                   'TARGET_MIPS',
+                   'TARGET_MIPS64',
+                   'TARGET_PPC',
+                   'TARGET_PPC64',
+                   'TARGET_S390X',
+                   'TARGET_SH4',
+                   'TARGET_SPARC' ] } }
 
 ##
 # @rtc-reset-reinjection:
@@ -52,7 +52,7 @@
 #
 ##
 { 'command': 'rtc-reset-reinjection',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -79,7 +79,7 @@
 { 'enum': 'SevState',
   'data': ['uninit', 'launch-update', 'launch-secret', 'running',
            'send-update', 'receive-update' ],
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @SevInfo:
@@ -111,7 +111,7 @@
               'state' : 'SevState',
               'handle' : 'uint32'
             },
-  'if': 'defined(TARGET_I386)'
+  'if': 'TARGET_I386'
 }
 
 ##
@@ -132,7 +132,7 @@
 #
 ##
 { 'command': 'query-sev', 'returns': 'SevInfo',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -146,7 +146,7 @@
 #
 ##
 { 'struct': 'SevLaunchMeasureInfo', 'data': {'data': 'str'},
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @query-sev-launch-measure:
@@ -164,7 +164,7 @@
 #
 ##
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 
 ##
@@ -189,7 +189,7 @@
             'cert-chain': 'str',
             'cbitpos': 'int',
             'reduced-phys-bits': 'int'},
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @query-sev-capabilities:
@@ -209,7 +209,7 @@
 #
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @sev-inject-launch-secret:
@@ -227,7 +227,7 @@
 ##
 { 'command': 'sev-inject-launch-secret',
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @dump-skeys:
@@ -249,7 +249,7 @@
 ##
 { 'command': 'dump-skeys',
   'data': { 'filename': 'str' },
-  'if': 'defined(TARGET_S390X)' }
+  'if': 'TARGET_S390X' }
 
 ##
 # @GICCapability:
@@ -274,7 +274,7 @@
   'data': { 'version': 'int',
             'emulated': 'bool',
             'kernel': 'bool' },
-  'if': 'defined(TARGET_ARM)' }
+  'if': 'TARGET_ARM' }
 
 ##
 # @query-gic-capabilities:
@@ -294,7 +294,7 @@
 #
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
-  'if': 'defined(TARGET_ARM)' }
+  'if': 'TARGET_ARM' }
 
 
 ##
@@ -310,7 +310,7 @@
 ##
 { 'struct': 'SevAttestationReport',
   'data': { 'data': 'str'},
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
 
 ##
 # @query-sev-attestation-report:
@@ -332,4 +332,4 @@
 ##
 { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
-  'if': 'defined(TARGET_I386)' }
+  'if': 'TARGET_I386' }
diff --git a/qapi/qom.json b/qapi/qom.json
index 652be317b8..81f991c519 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -613,7 +613,7 @@
   'data': { '*align': 'size',
             '*discard-data': 'bool',
             'mem-path': 'str',
-            '*pmem': { 'type': 'bool', 'if': 'defined(CONFIG_LIBPMEM)' },
+            '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },
             '*readonly': 'bool' } }
 
 ##
@@ -777,7 +777,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
-      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
+      'if': 'CONFIG_VHOST_CRYPTO' },
     'dbus-vmstate',
     'filter-buffer',
     'filter-dump',
@@ -790,7 +790,7 @@
     'iothread',
     'memory-backend-file',
     { 'name': 'memory-backend-memfd',
-      'if': 'defined(CONFIG_LINUX)' },
+      'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
     'pef-guest',
     'pr-manager-helper',
@@ -835,7 +835,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
+                                      'if': 'CONFIG_VHOST_CRYPTO' },
       'dbus-vmstate':               'DBusVMStateProperties',
       'filter-buffer':              'FilterBufferProperties',
       'filter-dump':                'FilterDumpProperties',
@@ -848,7 +848,7 @@
       'iothread':                   'IothreadProperties',
       'memory-backend-file':        'MemoryBackendFileProperties',
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
-                                      'if': 'defined(CONFIG_LINUX)' },
+                                      'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 735eb4abb5..7866dc27d6 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -69,7 +69,7 @@
     '*ipv4': 'bool',
     '*ipv6': 'bool',
     '*keep-alive': 'bool',
-    '*mptcp': { 'type': 'bool', 'if': 'defined(IPPROTO_MPTCP)' } } }
+    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' } } }
 
 ##
 # @UnixSocketAddress:
@@ -89,8 +89,8 @@
 { 'struct': 'UnixSocketAddress',
   'data': {
     'path': 'str',
-    '*abstract': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' },
-    '*tight': { 'type': 'bool', 'if': 'defined(CONFIG_LINUX)' } } }
+    '*abstract': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
+    '*tight': { 'type': 'bool', 'if': 'CONFIG_LINUX' } } }
 
 ##
 # @VsockSocketAddress:
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 75590979fd..f4dde2f646 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -18,7 +18,7 @@
 # Since: 1.5
 ##
 { 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @query-tpm-models:
@@ -36,7 +36,7 @@
 #
 ##
 { 'command': 'query-tpm-models', 'returns': ['TpmModel'],
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @TpmType:
@@ -50,7 +50,7 @@
 # Since: 1.5
 ##
 { 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @query-tpm-types:
@@ -68,7 +68,7 @@
 #
 ##
 { 'command': 'query-tpm-types', 'returns': ['TpmType'],
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @TPMPassthroughOptions:
@@ -85,7 +85,7 @@
 { 'struct': 'TPMPassthroughOptions',
   'data': { '*path': 'str',
             '*cancel-path': 'str' },
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @TPMEmulatorOptions:
@@ -97,7 +97,7 @@
 # Since: 2.11
 ##
 { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @TpmTypeOptions:
@@ -112,7 +112,7 @@
 { 'union': 'TpmTypeOptions',
    'data': { 'passthrough' : 'TPMPassthroughOptions',
              'emulator': 'TPMEmulatorOptions' },
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @TPMInfo:
@@ -131,7 +131,7 @@
   'data': {'id': 'str',
            'model': 'TpmModel',
            'options': 'TpmTypeOptions' },
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
 
 ##
 # @query-tpm:
@@ -162,4 +162,4 @@
 #
 ##
 { 'command': 'query-tpm', 'returns': ['TPMInfo'],
-  'if': 'defined(CONFIG_TPM)' }
+  'if': 'CONFIG_TPM' }
diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..ec29a66c9f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -123,7 +123,7 @@
   'data': { 'host': 'str',
             'port': 'str',
             'family': 'NetworkAddressFamily' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceServerInfo:
@@ -137,7 +137,7 @@
 { 'struct': 'SpiceServerInfo',
   'base': 'SpiceBasicInfo',
   'data': { '*auth': 'str' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceChannel:
@@ -163,7 +163,7 @@
   'base': 'SpiceBasicInfo',
   'data': {'connection-id': 'int', 'channel-type': 'int', 'channel-id': 'int',
            'tls': 'bool'},
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceQueryMouseMode:
@@ -183,7 +183,7 @@
 ##
 { 'enum': 'SpiceQueryMouseMode',
   'data': [ 'client', 'server', 'unknown' ],
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SpiceInfo:
@@ -222,7 +222,7 @@
   'data': {'enabled': 'bool', 'migrated': 'bool', '*host': 'str', '*port': 'int',
            '*tls-port': 'int', '*auth': 'str', '*compiled-version': 'str',
            'mouse-mode': 'SpiceQueryMouseMode', '*channels': ['SpiceChannel']},
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @query-spice:
@@ -268,7 +268,7 @@
 #
 ##
 { 'command': 'query-spice', 'returns': 'SpiceInfo',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_CONNECTED:
@@ -294,7 +294,7 @@
 { 'event': 'SPICE_CONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
             'client': 'SpiceBasicInfo' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_INITIALIZED:
@@ -323,7 +323,7 @@
 { 'event': 'SPICE_INITIALIZED',
   'data': { 'server': 'SpiceServerInfo',
             'client': 'SpiceChannel' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_DISCONNECTED:
@@ -349,7 +349,7 @@
 { 'event': 'SPICE_DISCONNECTED',
   'data': { 'server': 'SpiceBasicInfo',
             'client': 'SpiceBasicInfo' },
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # @SPICE_MIGRATE_COMPLETED:
@@ -365,7 +365,7 @@
 #
 ##
 { 'event': 'SPICE_MIGRATE_COMPLETED',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'CONFIG_SPICE' }
 
 ##
 # == VNC
@@ -393,7 +393,7 @@
             'service': 'str',
             'family': 'NetworkAddressFamily',
             'websocket': 'bool' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncServerInfo:
@@ -408,7 +408,7 @@
 { 'struct': 'VncServerInfo',
   'base': 'VncBasicInfo',
   'data': { '*auth': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncClientInfo:
@@ -426,7 +426,7 @@
 { 'struct': 'VncClientInfo',
   'base': 'VncBasicInfo',
   'data': { '*x509_dname': 'str', '*sasl_username': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncInfo:
@@ -469,7 +469,7 @@
   'data': {'enabled': 'bool', '*host': 'str',
            '*family': 'NetworkAddressFamily',
            '*service': 'str', '*auth': 'str', '*clients': ['VncClientInfo']},
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncPrimaryAuth:
@@ -481,7 +481,7 @@
 { 'enum': 'VncPrimaryAuth',
   'data': [ 'none', 'vnc', 'ra2', 'ra2ne', 'tight', 'ultra',
             'tls', 'vencrypt', 'sasl' ],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncVencryptSubAuth:
@@ -496,7 +496,7 @@
             'tls-vnc',   'x509-vnc',
             'tls-plain', 'x509-plain',
             'tls-sasl',  'x509-sasl' ],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncServerInfo2:
@@ -514,7 +514,7 @@
   'base': 'VncBasicInfo',
   'data': { 'auth'      : 'VncPrimaryAuth',
             '*vencrypt' : 'VncVencryptSubAuth' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VncInfo2:
@@ -547,7 +547,7 @@
             'auth'      : 'VncPrimaryAuth',
             '*vencrypt' : 'VncVencryptSubAuth',
             '*display'  : 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @query-vnc:
@@ -579,7 +579,7 @@
 #
 ##
 { 'command': 'query-vnc', 'returns': 'VncInfo',
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 ##
 # @query-vnc-servers:
 #
@@ -590,7 +590,7 @@
 # Since: 2.3
 ##
 { 'command': 'query-vnc-servers', 'returns': ['VncInfo2'],
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @change-vnc-password:
@@ -606,7 +606,7 @@
 ##
 { 'command': 'change-vnc-password',
   'data': { 'password': 'str' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_CONNECTED:
@@ -636,7 +636,7 @@
 { 'event': 'VNC_CONNECTED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncBasicInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_INITIALIZED:
@@ -664,7 +664,7 @@
 { 'event': 'VNC_INITIALIZED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncClientInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # @VNC_DISCONNECTED:
@@ -691,7 +691,7 @@
 { 'event': 'VNC_DISCONNECTED',
   'data': { 'server': 'VncServerInfo',
             'client': 'VncClientInfo' },
-  'if': 'defined(CONFIG_VNC)' }
+  'if': 'CONFIG_VNC' }
 
 ##
 # = Input
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index fb17eebde3..c60f5e669d 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1380,7 +1380,7 @@
   'data': {
       'keys': ['str']
   },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 
 ##
@@ -1398,7 +1398,7 @@
 { 'command': 'guest-ssh-get-authorized-keys',
   'data': { 'username': 'str' },
   'returns': 'GuestAuthorizedKeys',
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 ##
 # @guest-ssh-add-authorized-keys:
@@ -1416,7 +1416,7 @@
 ##
 { 'command': 'guest-ssh-add-authorized-keys',
   'data': { 'username': 'str', 'keys': ['str'], '*reset': 'bool' },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
 
 ##
 # @guest-ssh-remove-authorized-keys:
@@ -1434,4 +1434,4 @@
 ##
 { 'command': 'guest-ssh-remove-authorized-keys',
   'data': { 'username': 'str', 'keys': ['str'] },
-  'if': 'defined(CONFIG_POSIX)' }
+  'if': 'CONFIG_POSIX' }
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index f8718e201b..0c718e43c9 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -218,7 +218,7 @@ def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     if not ifcond:
         return ''
     if isinstance(ifcond, str):
-        return ifcond
+        return 'defined(' + ifcond + ')'
 
     oper, operands = next(iter(ifcond.items()))
     if oper == 'not':
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index d2bd52c49f..d355cbc8c1 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -281,10 +281,10 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
 
     def _check_if(cond: Union[str, object]) -> None:
         if isinstance(cond, str):
-            if not cond.strip():
+            if not cond.isidentifier():
                 raise QAPISemError(
                     info,
-                    "'if' condition '%s' of %s makes no sense"
+                    "'if' condition '%s' of %s is not a valid identifier"
                     % (cond, source))
             return
 
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err b/tests/qapi-schema/alternate-branch-if-invalid.err
index d384929c51..03bad877a3 100644
--- a/tests/qapi-schema/alternate-branch-if-invalid.err
+++ b/tests/qapi-schema/alternate-branch-if-invalid.err
@@ -1,2 +1,2 @@
 alternate-branch-if-invalid.json: In alternate 'Alt':
-alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member 'branch' makes no sense
+alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member 'branch' is not a valid identifier
diff --git a/tests/qapi-schema/bad-if-empty.err b/tests/qapi-schema/bad-if-empty.err
index a0f3effefb..5208f543ce 100644
--- a/tests/qapi-schema/bad-if-empty.err
+++ b/tests/qapi-schema/bad-if-empty.err
@@ -1,2 +1,2 @@
 bad-if-empty.json: In struct 'TestIfStruct':
-bad-if-empty.json:2: 'if' condition '' of struct makes no sense
+bad-if-empty.json:2: 'if' condition '' of struct is not a valid identifier
diff --git a/tests/qapi-schema/bad-if-list.err b/tests/qapi-schema/bad-if-list.err
index c462f11b90..fa01894d03 100644
--- a/tests/qapi-schema/bad-if-list.err
+++ b/tests/qapi-schema/bad-if-list.err
@@ -1,2 +1,2 @@
 bad-if-list.json: In struct 'TestIfStruct':
-bad-if-list.json:2: 'if' condition ' ' of struct makes no sense
+bad-if-list.json:2: 'if' condition ' ' of struct is not a valid identifier
diff --git a/tests/qapi-schema/bad-if.json b/tests/qapi-schema/bad-if.json
index 3edd1a0bf2..67818888de 100644
--- a/tests/qapi-schema/bad-if.json
+++ b/tests/qapi-schema/bad-if.json
@@ -1,3 +1,3 @@
 # check invalid 'if' type
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': { 'value': 'defined(TEST_IF_STRUCT)' } }
+  'if': { 'value': 'TEST_IF_STRUCT' } }
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 836fb1bdc4..333a7f3dcf 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -61,9 +61,9 @@
 # @two is undocumented
 ##
 { 'enum': 'Enum', 'data':
-  [ { 'name': 'one', 'if': 'defined(IFONE)' }, 'two' ],
+  [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
   'features': [ 'enum-feat' ],
-  'if': 'defined(IFCOND)' }
+  'if': 'IFCOND' }
 
 ##
 # @Base:
@@ -87,7 +87,7 @@
   'features': [ 'variant1-feat' ],
   'data': { 'var1': { 'type': 'str',
                       'features': [ 'member-feat' ],
-                      'if': 'defined(IFSTR)' } } }
+                      'if': 'IFSTR' } } }
 
 ##
 # @Variant2:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index a8871e8f99..26d1fa5d28 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,16 +12,16 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if defined(IFONE)
+        if IFONE
     member two
-    if defined(IFCOND)
+    if IFCOND
     feature enum-feat
 object Base
     member base1: Enum optional=False
     if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
 object Variant1
     member var1: str optional=False
-        if defined(IFSTR)
+        if IFSTR
         feature member-feat
     feature variant1-feat
 object Variant2
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 03c98c4182..5bfe06e14e 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -43,7 +43,7 @@ Example:
 Values
 ~~~~~~
 
-"one" (**If: **"defined(IFONE)")
+"one" (**If: **"IFONE")
    The _one_ {and only}
 
 "two"
@@ -62,7 +62,7 @@ Features
 If
 ~~
 
-"defined(IFCOND)"
+"IFCOND"
 
 
 "Base" (Object)
@@ -93,7 +93,7 @@ Another paragraph (but no "var": line)
 Members
 ~~~~~~~
 
-"var1": "string" (**If: **"defined(IFSTR)")
+"var1": "string" (**If: **"IFSTR")
    Not documented
 
 
diff --git a/tests/qapi-schema/features-missing-name.json b/tests/qapi-schema/features-missing-name.json
index 2314f97c00..8772c8f7b3 100644
--- a/tests/qapi-schema/features-missing-name.json
+++ b/tests/qapi-schema/features-missing-name.json
@@ -1,3 +1,3 @@
 { 'struct': 'FeatureStruct0',
   'data': { 'foo': 'int' },
-  'features': [ { 'if': 'defined(NAMELESS_FEATURES)' } ] }
+  'features': [ { 'if': 'NAMELESS_FEATURES' } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index a0f09b277e..38b2b29d47 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -222,43 +222,43 @@
 
 { 'struct': 'TestIfStruct', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'defined(TEST_IF_STRUCT_BAR)'} },
-  'if': 'defined(TEST_IF_STRUCT)' }
+    'bar': { 'type': 'int', 'if': 'TEST_IF_STRUCT_BAR'} },
+  'if': 'TEST_IF_STRUCT' }
 
 { 'enum': 'TestIfEnum', 'data':
-  [ 'foo', { 'name' : 'bar', 'if': 'defined(TEST_IF_ENUM_BAR)' } ],
-  'if': 'defined(TEST_IF_ENUM)' }
+  [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
+  'if': 'TEST_IF_ENUM' }
 
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
-    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
-  'if': { 'all': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] } }
+    'union-bar': { 'type': 'str', 'if': 'TEST_IF_UNION_BAR'} },
+  'if': { 'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
-  'if': 'defined(TEST_IF_UNION)' }
+  'if': 'TEST_IF_UNION' }
 
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
-  'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
+    'bar': { 'type': 'TestStruct', 'if': 'TEST_IF_ALT_BAR'} },
+  'if': { 'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': { 'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
+  'if': { 'all': ['TEST_IF_ALT', {'not': 'TEST_IF_NOT_ALT'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
-    'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
+    'bar': { 'type': 'TestIfEnum', 'if': 'TEST_IF_CMD_BAR' } },
   'returns': 'UserDefThree',
-  'if': { 'all': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] } }
+  'if': { 'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT'] } }
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
-    'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
-  'if': { 'all': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] } }
+    'bar': { 'type': ['TestIfEnum'], 'if': 'TEST_IF_EVT_BAR' } },
+  'if': { 'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT'] } }
 
 # test 'features'
 
@@ -280,20 +280,20 @@
 
 { 'struct': 'CondFeatureStruct1',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
 { 'struct': 'CondFeatureStruct2',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
-                { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'},
+                { 'name': 'feature2', 'if': 'TEST_IF_FEATURE_2'} ] }
 { 'struct': 'CondFeatureStruct3',
   'data': { 'foo': 'int' },
   'features': [ { 'name': 'feature1',
-                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
-                                   'defined(TEST_IF_COND_2)'] } } ] }
+                  'if': { 'all': [ 'TEST_IF_COND_1',
+                                   'TEST_IF_COND_2'] } } ] }
 { 'struct': 'CondFeatureStruct4',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': {'any': ['defined(TEST_IF_COND_1)',
-                                                     'defined(TEST_IF_COND_2)'] } } ] }
+  'features': [ { 'name': 'feature1', 'if': {'any': ['TEST_IF_COND_1',
+                                                     'TEST_IF_COND_2'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -328,14 +328,14 @@
   'features': [ 'feature1', 'feature2' ] }
 
 { 'command': 'test-command-cond-features1',
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
 { 'command': 'test-command-cond-features2',
-  'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
-                { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
+  'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'},
+                { 'name': 'feature2', 'if': 'TEST_IF_FEATURE_2'} ] }
 { 'command': 'test-command-cond-features3',
   'features': [ { 'name': 'feature1',
-                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
-                                   'defined(TEST_IF_COND_2)'] } } ] }
+                  'if': { 'all': [ 'TEST_IF_COND_1',
+                                   'TEST_IF_COND_2'] } } ] }
 
 { 'event': 'TEST_EVENT_FEATURES0',
   'data': 'FeatureStruct1' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index df2c57de54..00cfa67809 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if defined(TEST_IF_STRUCT_BAR)
-    if defined(TEST_IF_STRUCT)
+        if TEST_IF_STRUCT_BAR
+    if TEST_IF_STRUCT
 enum TestIfEnum
     member foo
     member bar
-        if defined(TEST_IF_ENUM_BAR)
-    if defined(TEST_IF_ENUM)
+        if TEST_IF_ENUM_BAR
+    if TEST_IF_ENUM
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
     member union-bar
-        if defined(TEST_IF_UNION_BAR)
-    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
+        if TEST_IF_UNION_BAR
+    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case union-bar: q_obj_str-wrapper
-        if defined(TEST_IF_UNION_BAR)
-    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
+        if TEST_IF_UNION_BAR
+    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if defined(TEST_IF_UNION)
+    if TEST_IF_UNION
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if defined(TEST_IF_UNION)
+    if TEST_IF_UNION
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if defined(TEST_IF_ALT_BAR)
-    if OrderedDict([('all', ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])])
+        if TEST_IF_ALT_BAR
+    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if OrderedDict([('all', ['defined(TEST_IF_ALT)', OrderedDict([('not', 'defined(TEST_IF_NOT_ALT)')])])])
+    if OrderedDict([('all', ['TEST_IF_ALT', OrderedDict([('not', 'TEST_IF_NOT_ALT')])])])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['defined(TEST_IF_ALT)', OrderedDict([('not', 'defined(TEST_IF_NOT_ALT)')])])])
+    if OrderedDict([('all', ['TEST_IF_ALT', OrderedDict([('not', 'TEST_IF_NOT_ALT')])])])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if defined(TEST_IF_CMD_BAR)
-    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
+        if TEST_IF_CMD_BAR
+    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
+    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if defined(TEST_IF_ENUM)
+    if TEST_IF_ENUM
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if defined(TEST_IF_EVT_BAR)
-    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
+        if TEST_IF_EVT_BAR
+    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
+    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,21 +379,21 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if defined(TEST_IF_FEATURE_1)
+        if TEST_IF_FEATURE_1
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if defined(TEST_IF_FEATURE_1)
+        if TEST_IF_FEATURE_1
     feature feature2
-        if defined(TEST_IF_FEATURE_2)
+        if TEST_IF_FEATURE_2
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
+        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
 object CondFeatureStruct4
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('any', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
+        if OrderedDict([('any', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
 enum FeatureEnum1
     member eins
     member zwei
@@ -434,17 +434,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if defined(TEST_IF_FEATURE_1)
+        if TEST_IF_FEATURE_1
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if defined(TEST_IF_FEATURE_1)
+        if TEST_IF_FEATURE_1
     feature feature2
-        if defined(TEST_IF_FEATURE_2)
+        if TEST_IF_FEATURE_2
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
+        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/union-branch-if-invalid.err b/tests/qapi-schema/union-branch-if-invalid.err
index dd4518233e..046187a5b9 100644
--- a/tests/qapi-schema/union-branch-if-invalid.err
+++ b/tests/qapi-schema/union-branch-if-invalid.err
@@ -1,2 +1,2 @@
 union-branch-if-invalid.json: In union 'Uni':
-union-branch-if-invalid.json:4: 'if' condition '' of 'data' member 'branch1' makes no sense
+union-branch-if-invalid.json:4: 'if' condition '' of 'data' member 'branch1' is not a valid identifier
-- 
2.29.0


