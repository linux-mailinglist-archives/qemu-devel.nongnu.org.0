Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0396485211
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:53:52 +0100 (CET)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54rX-0002rZ-8z
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n54qc-0002CN-6h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n54qZ-0007zQ-6P
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641383570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PYxb/8laq2WUPNaSxft5hdb2F0GKFJ36jM61o3YZpVc=;
 b=Lf1GfLkMSVTiDigDlewZkmjDNgCcM9x9OI9HrER1vWXDUFkFcL8/gOjWJARcjXVbbDJING
 ysqwTTkT/kQxlpT6OKZ1hlbW8cK+pnscpGYRXvJCGxiGvQs0o08SqHrgrkmgdiMZ/2PC5t
 FhhC1gY9Fx8tk4IPz0VIObVlUw9mnt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-GSWHEa23PwKQoF30b9k7sA-1; Wed, 05 Jan 2022 06:52:49 -0500
X-MC-Unique: GSWHEa23PwKQoF30b9k7sA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5166E801B2A
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 11:52:48 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B3B74E89;
 Wed,  5 Jan 2022 11:52:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH] docs: reSTify virtio-balloon-stats documentation and move to
 docs/interop
Date: Wed,  5 Jan 2022 12:52:45 +0100
Message-Id: <20220105115245.420945-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The virtio-balloon-stats documentation might be useful for people that
are implementing software that talks to QEMU via QMP, so this should
reside in the docs/interop/ directory. While we're at it, also convert
the file to restructured text and mention it in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                                   |  1 +
 docs/interop/index.rst                        |  1 +
 .../virtio-balloon-stats.rst}                 | 58 ++++++++++---------
 3 files changed, 32 insertions(+), 28 deletions(-)
 rename docs/{virtio-balloon-stats.txt => interop/virtio-balloon-stats.rst} (66%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53cf0fdc00..3c587410f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1929,6 +1929,7 @@ virtio-balloon
 M: Michael S. Tsirkin <mst@redhat.com>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
+F: docs/interop/virtio-balloon-stats.rst
 F: hw/virtio/virtio-balloon*.c
 F: include/hw/virtio/virtio-balloon.h
 F: softmmu/balloon.c
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index c59bac9834..b7632acb7b 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -22,3 +22,4 @@ are useful for making QEMU interoperate with other software.
    vhost-user
    vhost-user-gpu
    vhost-vdpa
+   virtio-balloon-stats
diff --git a/docs/virtio-balloon-stats.txt b/docs/interop/virtio-balloon-stats.rst
similarity index 66%
rename from docs/virtio-balloon-stats.txt
rename to docs/interop/virtio-balloon-stats.rst
index 1732cc8c8a..b9a6a6edb2 100644
--- a/docs/virtio-balloon-stats.txt
+++ b/docs/interop/virtio-balloon-stats.rst
@@ -1,4 +1,4 @@
-virtio balloon memory statistics
+Virtio balloon memory statistics
 ================================
 
 The virtio balloon driver supports guest memory statistics reporting. These
@@ -9,10 +9,12 @@ Before querying the available stats, clients first have to enable polling.
 This is done by writing a time interval value (in seconds) to the
 guest-stats-polling-interval property. This value can be:
 
-  > 0  enables polling in the specified interval. If polling is already
+  > 0
+       enables polling in the specified interval. If polling is already
        enabled, the polling time interval is changed to the new value
 
-  0    disables polling. Previous polled statistics are still valid and
+  0
+       disables polling. Previous polled statistics are still valid and
        can be queried.
 
 Once polling is enabled, the virtio-balloon device in QEMU will start
@@ -22,7 +24,7 @@ interval.
 To retrieve those stats, clients have to query the guest-stats property,
 which will return a dictionary containing:
 
-  o A key named 'stats', containing all available stats. If the guest
+  * A key named 'stats', containing all available stats. If the guest
     doesn't support a particular stat, or if it couldn't be retrieved,
     its value will be -1. Currently, the following stats are supported:
 
@@ -37,7 +39,7 @@ which will return a dictionary containing:
       - stat-htlb-pgalloc
       - stat-htlb-pgfail
 
-  o A key named last-update, which contains the last stats update
+  * A key named last-update, which contains the last stats update
     timestamp in seconds. Since this timestamp is generated by the host,
     a buggy guest can't influence its value. The value is 0 if the guest
     has not updated the stats (yet).
@@ -61,32 +63,32 @@ It's also important to note the following:
    respond to the request the timer will never be re-armed, which has
    the same effect as disabling polling
 
-Here are a few examples. QEMU is started with '-device virtio-balloon',
-which generates '/machine/peripheral-anon/device[1]' as the QOM path for
+Here are a few examples. QEMU is started with ``-device virtio-balloon``,
+which generates ``/machine/peripheral-anon/device[1]`` as the QOM path for
 the balloon device.
 
-Enable polling with 2 seconds interval:
+Enable polling with 2 seconds interval::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "guest-stats-polling-interval", "value": 2 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats-polling-interval", "value": 2 } }
 
-{ "return": {} }
+  { "return": {} }
 
-Change polling to 10 seconds:
+Change polling to 10 seconds::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "guest-stats-polling-interval", "value": 10 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats-polling-interval", "value": 10 } }
 
-{ "return": {} }
+  { "return": {} }
 
-Get stats:
+Get stats::
 
-{ "execute": "qom-get",
-  "arguments": { "path": "/machine/peripheral-anon/device[1]",
-  "property": "guest-stats" } }
-{
+  { "execute": "qom-get",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "guest-stats" } }
+  {
     "return": {
         "stats": {
             "stat-swap-out": 0,
@@ -98,12 +100,12 @@ Get stats:
         },
         "last-update": 1358529861
     }
-}
+  }
 
-Disable polling:
+Disable polling::
 
-{ "execute": "qom-set",
-             "arguments": { "path": "/machine/peripheral-anon/device[1]",
-			 "property": "stats-polling-interval", "value": 0 } }
+  { "execute": "qom-set",
+               "arguments": { "path": "/machine/peripheral-anon/device[1]",
+               "property": "stats-polling-interval", "value": 0 } }
 
-{ "return": {} }
+  { "return": {} }
-- 
2.27.0


