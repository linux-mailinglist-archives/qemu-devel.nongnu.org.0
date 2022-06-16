Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447B54DD9C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:54:03 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lGM-0005YB-9b
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvh-0001hW-DG
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kve-0002rj-Qx
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGWtm3jQvEYYoTyPDWcuflR2G4aAwxob3w8JVaj9KgQ=;
 b=XM+j+oh7gmTt6v2zQdcq0NAJHjRt8JK8JGpSSi7XVpTm+SPWMQmUKBSePKJuhAz4Gb4XQZ
 hvFLYmZ86qyVQfsrS7nHLjTPpjzN49MKoPJk/CWvTSDMXDkJv4gK3a/LEL5zvbs8hl8PUh
 wYrI3TI4OE5dN6wA7vNYSTW+yvfkDzk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-ZKQf3Qy6ON6pPT03uFFvoA-1; Thu, 16 Jun 2022 04:32:35 -0400
X-MC-Unique: ZKQf3Qy6ON6pPT03uFFvoA-1
Received: by mail-ej1-f70.google.com with SMTP id
 p10-20020a170906b20a00b0070c21a6d378so316696ejz.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGWtm3jQvEYYoTyPDWcuflR2G4aAwxob3w8JVaj9KgQ=;
 b=oLd+A4G+V0KxYoS9dNcTKJXv+HpM7FD/diZlpVwZHwqykjoMta87WsV03mZU6rgzvL
 55bhu3i/d05CliuIgWsHdgUjkgPPs/5SaHh3HTwEFDWch4w6ZkgRB+t1Mr2durptHl10
 sPA/wUavdyfp/uGaAPZX71MGBFmMGj9BpBCyNzkO4yllVSj6qwmLfUrFiHDTqYlHx7pF
 nyKUz1ylmyJ5q2cOoSJcNjMSNi6F80pWmFqAJhidbDFZUFvyWLhtF224zTw94iuCbcqk
 GcBP7DdVyePfO1PVgT48mhTApmUHL1951HvH3D2nmE66oPKqgvc3c1sBJ6YwjvZLzMUo
 op3g==
X-Gm-Message-State: AJIora8nrHGPlspUoS3ssAYGAr/ZR1IyHfQRGZYy++/9zYrFFOTwXbDR
 F+onPQoYHlZtWYEPQ3+/hGDD0nOHN6vY2IShuQmIZxQ/+fadf0ESgWK1FC3jxAyIkb91LykwuWs
 kMbpJBcPEqJNGMlqixILwKajErRSHMPXKxCtjLWyu9XN53dZw+LJ7Xm/o6Vz4rKM1CyE=
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id
 s1-20020a17090699c100b006feb01d0134mr3493711ejn.598.1655368354033; 
 Thu, 16 Jun 2022 01:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vM89CzwZp/LOx8Ay+V3Df2hda9fRSpm/MXTAWEj7rpncZgcqzYvix8RDhKcI/41z91xmJYBA==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id
 s1-20020a17090699c100b006feb01d0134mr3493681ejn.598.1655368353511; 
 Thu, 16 Jun 2022 01:32:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 cd18-20020a170906b35200b0070a80f03a44sm479735ejb.119.2022.06.16.01.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 10/21] block: add more commands to preconfig mode
Date: Thu, 16 Jun 2022 10:31:58 +0200
Message-Id: <20220616083209.117397-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Of the block device commands, those that are available outside system
emulators do not require a fully constructed machine by definition.
Allow running them before machine initialization has concluded.

Of the ones that are available inside system emulation, allow querying
the PR managers, and setting up accounting and throttling.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx        |  14 +++++
 qapi/block-core.json   | 117 +++++++++++++++++++++++++++--------------
 qapi/block-export.json |  21 +++++---
 qapi/block.json        |   6 ++-
 4 files changed, 110 insertions(+), 48 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 564f1de364..c9d465735a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -78,6 +78,7 @@ ERST
         .help       = "resize a block image",
         .cmd        = hmp_block_resize,
         .coroutine  = true,
+        .flags      = "p",
     },
 
 SRST
@@ -94,6 +95,7 @@ ERST
         .params     = "device [speed [base]]",
         .help       = "copy data from a backing file into a block device",
         .cmd        = hmp_block_stream,
+        .flags      = "p",
     },
 
 SRST
@@ -107,6 +109,7 @@ ERST
         .params     = "device speed",
         .help       = "set maximum speed for a background block operation",
         .cmd        = hmp_block_job_set_speed,
+        .flags      = "p",
     },
 
 SRST
@@ -122,6 +125,7 @@ ERST
                       "\n\t\t\t if you want to abort the operation immediately"
                       "\n\t\t\t instead of keep running until data is in sync)",
         .cmd        = hmp_block_job_cancel,
+        .flags      = "p",
     },
 
 SRST
@@ -135,6 +139,7 @@ ERST
         .params     = "device",
         .help       = "stop an active background block operation",
         .cmd        = hmp_block_job_complete,
+        .flags      = "p",
     },
 
 SRST
@@ -149,6 +154,7 @@ ERST
         .params     = "device",
         .help       = "pause an active background block operation",
         .cmd        = hmp_block_job_pause,
+        .flags      = "p",
     },
 
 SRST
@@ -162,6 +168,7 @@ ERST
         .params     = "device",
         .help       = "resume a paused background block operation",
         .cmd        = hmp_block_job_resume,
+        .flags      = "p",
     },
 
 SRST
@@ -1406,6 +1413,7 @@ ERST
         .params     = "nbd_server_start [-a] [-w] host:port",
         .help       = "serve block devices on the given host and port",
         .cmd        = hmp_nbd_server_start,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_start`` *host*:*port*
@@ -1421,6 +1429,7 @@ ERST
         .params     = "nbd_server_add [-w] device [name]",
         .help       = "export a block device via NBD",
         .cmd        = hmp_nbd_server_add,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_add`` *device* [ *name* ]
@@ -1436,6 +1445,7 @@ ERST
         .params     = "nbd_server_remove [-f] name",
         .help       = "remove an export previously exposed via NBD",
         .cmd        = hmp_nbd_server_remove,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_remove [-f]`` *name*
@@ -1452,6 +1462,7 @@ ERST
         .params     = "nbd_server_stop",
         .help       = "stop serving block devices using the NBD protocol",
         .cmd        = hmp_nbd_server_stop,
+        .flags      = "p",
     },
 SRST
 ``nbd_server_stop``
@@ -1481,6 +1492,7 @@ ERST
         .params     = "getfd name",
         .help       = "receive a file descriptor via SCM rights and assign it a name",
         .cmd        = hmp_getfd,
+        .flags      = "p",
     },
 
 SRST
@@ -1496,6 +1508,7 @@ ERST
         .params     = "closefd name",
         .help       = "close a file descriptor previously passed via SCM rights",
         .cmd        = hmp_closefd,
+        .flags      = "p",
     },
 
 SRST
@@ -1511,6 +1524,7 @@ ERST
         .params     = "device bps bps_rd bps_wr iops iops_rd iops_wr",
         .help       = "change I/O throttle limits for a block drive",
         .cmd        = hmp_block_set_io_throttle,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/block-core.json b/qapi/block-core.json
index f0383c7925..457df16638 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -737,7 +737,8 @@
 #    }
 #
 ##
-{ 'command': 'query-block', 'returns': ['BlockInfo'] }
+{ 'command': 'query-block', 'returns': ['BlockInfo'],
+  'allow-preconfig': true }
 
 ##
 # @BlockDeviceTimedStats:
@@ -1113,7 +1114,8 @@
 ##
 { 'command': 'query-blockstats',
   'data': { '*query-nodes': 'bool' },
-  'returns': ['BlockStats'] }
+  'returns': ['BlockStats'],
+  'allow-preconfig': true }
 
 ##
 # @BlockdevOnError:
@@ -1262,7 +1264,8 @@
 #
 # Since: 1.1
 ##
-{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'] }
+{ 'command': 'query-block-jobs', 'returns': ['BlockJobInfo'],
+  'allow-preconfig': true }
 
 ##
 # @block_resize:
@@ -1293,7 +1296,8 @@
   'data': { '*device': 'str',
             '*node-name': 'str',
             'size': 'int' },
-  'coroutine': true }
+  'coroutine': true,
+  'allow-preconfig': true }
 
 ##
 # @NewImageMode:
@@ -1509,7 +1513,8 @@
 #
 ##
 { 'command': 'blockdev-snapshot-sync',
-  'data': 'BlockdevSnapshotSync' }
+  'data': 'BlockdevSnapshotSync',
+  'allow-preconfig': true }
 
 ##
 # @blockdev-snapshot:
@@ -1550,7 +1555,8 @@
 ##
 { 'command': 'blockdev-snapshot',
   'data': 'BlockdevSnapshot',
-  'features': [ 'allow-write-only-overlay' ] }
+  'features': [ 'allow-write-only-overlay' ],
+  'allow-preconfig': true }
 
 ##
 # @change-backing-file:
@@ -1582,7 +1588,8 @@
 ##
 { 'command': 'change-backing-file',
   'data': { 'device': 'str', 'image-node-name': 'str',
-            'backing-file': 'str' } }
+            'backing-file': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-commit:
@@ -1692,7 +1699,8 @@
             '*backing-file': 'str', '*speed': 'int',
             '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @drive-backup:
@@ -1721,7 +1729,8 @@
 #
 ##
 { 'command': 'drive-backup', 'boxed': true,
-  'data': 'DriveBackup', 'features': ['deprecated'] }
+  'data': 'DriveBackup', 'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @blockdev-backup:
@@ -1747,7 +1756,8 @@
 #
 ##
 { 'command': 'blockdev-backup', 'boxed': true,
-  'data': 'BlockdevBackup' }
+  'data': 'BlockdevBackup',
+  'allow-preconfig': true }
 
 ##
 # @query-named-block-nodes:
@@ -1813,7 +1823,8 @@
 ##
 { 'command': 'query-named-block-nodes',
   'returns': [ 'BlockDeviceInfo' ],
-  'data': { '*flat': 'bool' } }
+  'data': { '*flat': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @XDbgBlockGraphNodeType:
@@ -1922,7 +1933,8 @@
 # Since: 4.0
 ##
 { 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph',
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @drive-mirror:
@@ -1950,7 +1962,8 @@
 #
 ##
 { 'command': 'drive-mirror', 'boxed': true,
-  'data': 'DriveMirror' }
+  'data': 'DriveMirror',
+  'allow-preconfig': true }
 
 ##
 # @DriveMirror:
@@ -2123,7 +2136,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-add',
-  'data': 'BlockDirtyBitmapAdd' }
+  'data': 'BlockDirtyBitmapAdd',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-remove:
@@ -2147,7 +2161,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-remove',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-clear:
@@ -2170,7 +2185,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-clear',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-enable:
@@ -2191,7 +2207,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-enable',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-disable:
@@ -2212,7 +2229,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-disable',
-  'data': 'BlockDirtyBitmap' }
+  'data': 'BlockDirtyBitmap',
+  'allow-preconfig': true }
 
 ##
 # @block-dirty-bitmap-merge:
@@ -2244,7 +2262,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-merge',
-  'data': 'BlockDirtyBitmapMerge' }
+  'data': 'BlockDirtyBitmapMerge',
+  'allow-preconfig': true }
 
 ##
 # @BlockDirtyBitmapSha256:
@@ -2275,7 +2294,8 @@
 ##
 { 'command': 'x-debug-block-dirty-bitmap-sha256',
   'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256',
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @blockdev-mirror:
@@ -2361,7 +2381,8 @@
             '*on-target-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
             '*copy-mode': 'MirrorCopyMode',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @BlockIOThrottle:
@@ -2663,7 +2684,8 @@
             '*base-node': 'str', '*backing-file': 'str', '*bottom': 'str',
             '*speed': 'int', '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
-            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
+            '*auto-finalize': 'bool', '*auto-dismiss': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-set-speed:
@@ -2687,7 +2709,8 @@
 # Since: 1.1
 ##
 { 'command': 'block-job-set-speed',
-  'data': { 'device': 'str', 'speed': 'int' } }
+  'data': { 'device': 'str', 'speed': 'int' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-cancel:
@@ -2726,7 +2749,8 @@
 #
 # Since: 1.1
 ##
-{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' } }
+{ 'command': 'block-job-cancel', 'data': { 'device': 'str', '*force': 'bool' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-pause:
@@ -2750,7 +2774,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-pause', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-pause', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-resume:
@@ -2772,7 +2797,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-resume', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-resume', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-complete:
@@ -2800,7 +2826,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'block-job-complete', 'data': { 'device': 'str' } }
+{ 'command': 'block-job-complete', 'data': { 'device': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-dismiss:
@@ -2820,7 +2847,8 @@
 #
 # Since: 2.12
 ##
-{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' } }
+{ 'command': 'block-job-dismiss', 'data': { 'id': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @block-job-finalize:
@@ -2838,7 +2866,8 @@
 #
 # Since: 2.12
 ##
-{ 'command': 'block-job-finalize', 'data': { 'id': 'str' } }
+{ 'command': 'block-job-finalize', 'data': { 'id': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevDiscardOptions:
@@ -4354,7 +4383,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true }
+{ 'command': 'blockdev-add', 'data': 'BlockdevOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @blockdev-reopen:
@@ -4398,7 +4428,8 @@
 # Since: 6.1
 ##
 { 'command': 'blockdev-reopen',
-  'data': { 'options': ['BlockdevOptions'] } }
+  'data': { 'options': ['BlockdevOptions'] },
+  'allow-preconfig': true }
 
 ##
 # @blockdev-del:
@@ -4431,7 +4462,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' } }
+{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevCreateOptionsFile:
@@ -4872,7 +4904,8 @@
 ##
 { 'command': 'blockdev-create',
   'data': { 'job-id': 'str',
-            'options': 'BlockdevCreateOptions' } }
+            'options': 'BlockdevCreateOptions' },
+  'allow-preconfig': true }
 
 ##
 # @BlockdevAmendOptionsLUKS:
@@ -4944,7 +4977,8 @@
             'node-name': 'str',
             'options': 'BlockdevAmendOptions',
             '*force': 'bool' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @BlockErrorAction:
@@ -5294,7 +5328,8 @@
 #
 ##
 { 'command': 'block-set-write-threshold',
-  'data': { 'node-name': 'str', 'write-threshold': 'uint64' } }
+  'data': { 'node-name': 'str', 'write-threshold': 'uint64' },
+  'allow-preconfig': true }
 
 ##
 # @x-blockdev-change:
@@ -5355,7 +5390,8 @@
   'data' : { 'parent': 'str',
              '*child': 'str',
              '*node': 'str' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @x-blockdev-set-iothread:
@@ -5397,7 +5433,8 @@
   'data' : { 'node-name': 'str',
              'iothread': 'StrOrNull',
              '*force': 'bool' },
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'allow-preconfig': true }
 
 ##
 # @QuorumOpType:
@@ -5529,7 +5566,8 @@
 #
 ##
 { 'command': 'blockdev-snapshot-internal-sync',
-  'data': 'BlockdevSnapshotInternal' }
+  'data': 'BlockdevSnapshotInternal',
+  'allow-preconfig': true }
 
 ##
 # @blockdev-snapshot-delete-internal-sync:
@@ -5576,4 +5614,5 @@
 ##
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
-  'returns': 'SnapshotInfo' }
+  'returns': 'SnapshotInfo',
+  'allow-preconfig': true }
diff --git a/qapi/block-export.json b/qapi/block-export.json
index 0685cb8b9a..8afb1b65b3 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -65,7 +65,8 @@
   'data': { 'addr': 'SocketAddressLegacy',
             '*tls-creds': 'str',
             '*tls-authz': 'str',
-            '*max-connections': 'uint32' } }
+            '*max-connections': 'uint32' },
+  'allow-preconfig': true }
 
 ##
 # @BlockExportOptionsNbdBase:
@@ -215,7 +216,8 @@
 # Since: 1.3
 ##
 { 'command': 'nbd-server-add',
-  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'] }
+  'data': 'NbdServerAddOptions', 'boxed': true, 'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @BlockExportRemoveMode:
@@ -260,7 +262,8 @@
 ##
 { 'command': 'nbd-server-remove',
   'data': {'name': 'str', '*mode': 'BlockExportRemoveMode'},
-  'features': ['deprecated'] }
+  'features': ['deprecated'],
+  'allow-preconfig': true }
 
 ##
 # @nbd-server-stop:
@@ -270,7 +273,8 @@
 #
 # Since: 1.3
 ##
-{ 'command': 'nbd-server-stop' }
+{ 'command': 'nbd-server-stop',
+  'allow-preconfig': true }
 
 ##
 # @BlockExportType:
@@ -342,7 +346,8 @@
 # Since: 5.2
 ##
 { 'command': 'block-export-add',
-  'data': 'BlockExportOptions', 'boxed': true }
+  'data': 'BlockExportOptions', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @block-export-del:
@@ -362,7 +367,8 @@
 # Since: 5.2
 ##
 { 'command': 'block-export-del',
-  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' } }
+  'data': { 'id': 'str', '*mode': 'BlockExportRemoveMode' },
+  'allow-preconfig': true }
 
 ##
 # @BLOCK_EXPOR         '*boundaries': ['uint64'],
            '*boundaries-read': ['uint64'],
            '*boundaries-write': ['uint64'],
-           '*boundaries-flush': ['uint64'] } }
+           '*boundaries-flush': ['uint64'] },
+  'allow-preconfig': true }
-- 
2.36.1



