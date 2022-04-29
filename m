Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3F515069
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:07:58 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkT9x-0003N5-2C
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr6-0007sW-Ta
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSr4-0001bd-OC
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=by3rNo+mF0HXBwB3JoxC/F3ve31H/ybHNfgq702Un+w=;
 b=C+SCPu4wRfjx9PGlZ2k4jtY7BHSQ3VAwz0ihCOyKyRgVNiWBZ3m+JP1mZBrrBi5DO4MaFb
 YwXsL+QIGfRWJwnXeAkXMIYaYJQo7BWxf3T//TYocPQq5SG20u2m/zCUYfBr58bNcuzoon
 G87Wlp/OgGYIpxkKvJ7Dz0cPgB+KJT8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-OWoNFaZfPuu54RXdJxzDlw-1; Fri, 29 Apr 2022 11:48:22 -0400
X-MC-Unique: OWoNFaZfPuu54RXdJxzDlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 494C83834C02;
 Fri, 29 Apr 2022 15:48:22 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 328D4413707;
 Fri, 29 Apr 2022 15:48:19 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] qapi: Drop unnecessary empty lines outside of comments
Date: Fri, 29 Apr 2022 17:47:56 +0200
Message-Id: <20220429154758.354610-6-abologna@redhat.com>
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
 qapi/audio.json          |  1 -
 qapi/block-core.json     | 11 -----------
 qapi/block.json          |  3 ---
 qapi/char.json           |  1 -
 qapi/control.json        |  1 -
 qapi/crypto.json         | 12 ------------
 qapi/job.json            |  1 -
 qapi/machine-target.json |  1 -
 qapi/machine.json        |  1 -
 qapi/misc-target.json    |  4 ----
 qapi/run-state.json      |  1 -
 qapi/ui.json             |  1 -
 12 files changed, 38 deletions(-)

diff --git a/qapi/audio.json b/qapi/audio.json
index 0785e70a50..8099e3d7f1 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -352,7 +352,6 @@
     '*out':  'AudiodevPerDirectionOptions',
     '*path': 'str' } }
 
-
 ##
 # @AudioFormat:
 #
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 27832a1244..2bce5bb0ae 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -739,7 +739,6 @@
 ##
 { 'command': 'query-block', 'returns': ['BlockInfo'] }
 
-
 ##
 # @BlockDeviceTimedStats:
 #
@@ -1512,7 +1511,6 @@
 { 'command': 'blockdev-snapshot-sync',
   'data': 'BlockdevSnapshotSync' }
 
-
 ##
 # @blockdev-snapshot:
 #
@@ -1751,7 +1749,6 @@
 { 'command': 'blockdev-backup', 'boxed': true,
   'data': 'BlockdevBackup' }
 
-
 ##
 # @query-named-block-nodes:
 #
@@ -3067,7 +3064,6 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*key-secret': 'str' } }
 
-
 ##
 # @BlockdevOptionsGenericCOWFormat:
 #
@@ -3182,8 +3178,6 @@
   'base': 'BlockdevOptionsGenericCOWFormat',
   'data': { '*encrypt': 'BlockdevQcowEncryption' } }
 
-
-
 ##
 # @BlockdevQcow2EncryptionFormat:
 #
@@ -3357,7 +3351,6 @@
             '*user': 'str',
             '*host-key-check': 'SshHostKeyCheck' } }
 
-
 ##
 # @BlkdebugEvent:
 #
@@ -3721,7 +3714,6 @@
             '*header-digest': 'IscsiHeaderDigest',
             '*timeout': 'int' } }
 
-
 ##
 # @RbdAuthMode:
 #
@@ -4564,7 +4556,6 @@
 { 'enum': 'BlockdevQcow2Version',
   'data': [ 'v2', 'v3' ] }
 
-
 ##
 # @Qcow2CompressionType:
 #
@@ -4738,7 +4729,6 @@
             '*toolsversion':    'str',
             '*zeroed-grain':    'bool' } }
 
-
 ##
 # @BlockdevCreateOptionsSsh:
 #
@@ -4973,7 +4963,6 @@
 { 'enum': 'BlockErrorAction',
   'data': [ 'ignore', 'report', 'stop' ] }
 
-
 ##
 # @BLOCK_IMAGE_CORRUPTED:
 #
diff --git a/qapi/block.json b/qapi/block.json
index 5de15c6070..41b73c9934 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -286,7 +286,6 @@
   'data': { 'id': 'str',
             'node-name': 'str'} }
 
-
 ##
 # @BlockdevChangeReadOnlyMode:
 #
@@ -304,7 +303,6 @@
 { 'enum': 'BlockdevChangeReadOnlyMode',
   'data': ['retain', 'read-only', 'read-write'] }
 
-
 ##
 # @blockdev-change-medium:
 #
@@ -375,7 +373,6 @@
             '*force': 'bool',
             '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
 
-
 ##
 # @DEVICE_TRAY_MOVED:
 #
diff --git a/qapi/char.json b/qapi/char.json
index f0fd0d1c9f..8414ef2bc2 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -329,7 +329,6 @@
   'data': { '*signal': 'bool' },
   'base': 'ChardevCommon' }
 
-
 ##
 # @ChardevSpiceChannel:
 #
diff --git a/qapi/control.json b/qapi/control.json
index 8c9122ef7a..53461cec05 100644
--- a/qapi/control.json
+++ b/qapi/control.json
@@ -68,7 +68,6 @@
 { 'struct': 'VersionTriple',
   'data': {'major': 'int', 'minor': 'int', 'micro': 'int'} }
 
-
 ##
 # @VersionInfo:
 #
diff --git a/qapi/crypto.json b/qapi/crypto.json
index aebe390ab7..ff33e1fe1f 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -24,7 +24,6 @@
   'prefix': 'QCRYPTO_TLS_CREDS_ENDPOINT',
   'data': ['client', 'server']}
 
-
 ##
 # @QCryptoSecretFormat:
 #
@@ -39,7 +38,6 @@
   'prefix': 'QCRYPTO_SECRET_FORMAT',
   'data': ['raw', 'base64']}
 
-
 ##
 # @QCryptoHashAlgorithm:
 #
@@ -59,7 +57,6 @@
   'prefix': 'QCRYPTO_HASH_ALG',
   'data': ['md5', 'sha1', 'sha224', 'sha256', 'sha384', 'sha512', 'ripemd160']}
 
-
 ##
 # @QCryptoCipherAlgorithm:
 #
@@ -88,7 +85,6 @@
            'serpent-128', 'serpent-192', 'serpent-256',
            'twofish-128', 'twofish-192', 'twofish-256']}
 
-
 ##
 # @QCryptoCipherMode:
 #
@@ -105,7 +101,6 @@
   'prefix': 'QCRYPTO_CIPHER_MODE',
   'data': ['ecb', 'cbc', 'xts', 'ctr']}
 
-
 ##
 # @QCryptoIVGenAlgorithm:
 #
@@ -181,7 +176,6 @@
 { 'struct': 'QCryptoBlockOptionsLUKS',
   'data': { '*key-secret': 'str' }}
 
-
 ##
 # @QCryptoBlockCreateOptionsLUKS:
 #
@@ -212,7 +206,6 @@
             '*hash-alg': 'QCryptoHashAlgorithm',
             '*iter-time': 'int'}}
 
-
 ##
 # @QCryptoBlockOpenOptions:
 #
@@ -227,7 +220,6 @@
   'data': { 'qcow': 'QCryptoBlockOptionsQCow',
             'luks': 'QCryptoBlockOptionsLUKS' } }
 
-
 ##
 # @QCryptoBlockCreateOptions:
 #
@@ -242,7 +234,6 @@
   'data': { 'qcow': 'QCryptoBlockOptionsQCow',
             'luks': 'QCryptoBlockCreateOptionsLUKS' } }
 
-
 ##
 # @QCryptoBlockInfoBase:
 #
@@ -256,7 +247,6 @@
 { 'struct': 'QCryptoBlockInfoBase',
   'data': { 'format': 'QCryptoBlockFormat' }}
 
-
 ##
 # @QCryptoBlockInfoLUKSSlot:
 #
@@ -276,7 +266,6 @@
            '*stripes': 'int',
            'key-offset': 'int' } }
 
-
 ##
 # @QCryptoBlockInfoLUKS:
 #
@@ -330,7 +319,6 @@
 { 'enum': 'QCryptoBlockLUKSKeyslotState',
   'data': [ 'active', 'inactive' ] }
 
-
 ##
 # @QCryptoBlockAmendOptionsLUKS:
 #
diff --git a/qapi/job.json b/qapi/job.json
index 1a6ef03451..d5f84e9615 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -173,7 +173,6 @@
 ##
 { 'command': 'job-cancel', 'data': { 'id': 'str' } }
 
-
 ##
 # @job-complete:
 #
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index f5ec4bc172..06b0d2ca61 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -54,7 +54,6 @@
 { 'enum': 'CpuModelExpansionType',
   'data': [ 'static', 'full' ] }
 
-
 ##
 # @CpuModelCompareResult:
 #
diff --git a/qapi/machine.json b/qapi/machine.json
index 20b1f0c748..9f91e46e8b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1363,7 +1363,6 @@
 { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
   'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
 
-
 ##
 # @MEM_UNPLUG_ERROR:
 #
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index ae2c483a68..2fa68a6796 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -21,7 +21,6 @@
 { 'command': 'rtc-reset-reinjection',
   'if': 'TARGET_I386' }
 
-
 ##
 # @SevState:
 #
@@ -101,7 +100,6 @@
 { 'command': 'query-sev', 'returns': 'SevInfo',
   'if': 'TARGET_I386' }
 
-
 ##
 # @SevLaunchMeasureInfo:
 #
@@ -132,7 +130,6 @@
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
   'if': 'TARGET_I386' }
 
-
 ##
 # @SevCapability:
 #
@@ -304,7 +301,6 @@
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'TARGET_ARM' }
 
-
 ##
 # @SGXEPCSection:
 #
diff --git a/qapi/run-state.json b/qapi/run-state.json
index a5d2db3b91..30a2f5231d 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -597,7 +597,6 @@
   'data': [ 'hypervisor',
             'guest' ] }
 
-
 ##
 # @MemoryFailureAction:
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 0e903340fc..9f19beea6d 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -128,7 +128,6 @@
 #
 # Since: 7.0
 ##
-
 { 'struct': 'ExpirePasswordOptionsVnc',
   'data': { '*display': 'str' } }
 
-- 
2.35.1


