Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD71232F65
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 11:18:35 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k14ht-0008DG-QG
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k14gY-0007mh-3b
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 05:17:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54463
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k14gU-0004LY-TT
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 05:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596100624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=49tipXkcwxaHpVTKsSw5f2iaOJOX/yyznvwNFF7VBGs=;
 b=ByTOyw4jVD8F+nI1JH7vTYu04LDK7x12kDr6V/OMjeBIKmYmlslvxpX4SPQbvyf5TCePxi
 k5pyoIYpcKW3S115U9UeQ/CONSiFusj4pknR0MfXWxhGxCclzhapuel0RjwFSUDio7VABk
 Q0zZQtpmR9+KajDmyh0hnAH5mbpoV1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-iN5v3wU2O_KOOxrTHw9zWg-1; Thu, 30 Jul 2020 05:17:02 -0400
X-MC-Unique: iN5v3wU2O_KOOxrTHw9zWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BE1E91271;
 Thu, 30 Jul 2020 09:17:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7053D756A0;
 Thu, 30 Jul 2020 09:16:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5C391132FD2; Thu, 30 Jul 2020 11:16:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Delete unwanted indentation of top-level expressions
Date: Thu, 30 Jul 2020 11:16:56 +0200
Message-Id: <20200730091656.2633334-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:59:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, kraxel@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 24 ++++++++++++------------
 qapi/ui.json         |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ab7bf3c612..bdcc8e5f9f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1847,8 +1847,8 @@
 #
 # Since: 4.0
 ##
-  { 'enum': 'BlockPermission',
-    'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
+{ 'enum': 'BlockPermission',
+  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
               'graph-mod' ] }
 ##
 # @XDbgBlockGraphEdge:
@@ -2155,8 +2155,8 @@
 # <- { "return": {} }
 #
 ##
-  { 'command': 'block-dirty-bitmap-enable',
-    'data': 'BlockDirtyBitmap' }
+{ 'command': 'block-dirty-bitmap-enable',
+  'data': 'BlockDirtyBitmap' }
 
 ##
 # @block-dirty-bitmap-disable:
@@ -2176,8 +2176,8 @@
 # <- { "return": {} }
 #
 ##
-    { 'command': 'block-dirty-bitmap-disable',
-      'data': 'BlockDirtyBitmap' }
+{ 'command': 'block-dirty-bitmap-disable',
+  'data': 'BlockDirtyBitmap' }
 
 ##
 # @block-dirty-bitmap-merge:
@@ -2208,8 +2208,8 @@
 # <- { "return": {} }
 #
 ##
-      { 'command': 'block-dirty-bitmap-merge',
-        'data': 'BlockDirtyBitmapMerge' }
+{ 'command': 'block-dirty-bitmap-merge',
+  'data': 'BlockDirtyBitmapMerge' }
 
 ##
 # @BlockDirtyBitmapSha256:
@@ -2220,8 +2220,8 @@
 #
 # Since: 2.10
 ##
-  { 'struct': 'BlockDirtyBitmapSha256',
-    'data': {'sha256': 'str'} }
+{ 'struct': 'BlockDirtyBitmapSha256',
+  'data': {'sha256': 'str'} }
 
 ##
 # @x-debug-block-dirty-bitmap-sha256:
@@ -2235,8 +2235,8 @@
 #
 # Since: 2.10
 ##
-  { 'command': 'x-debug-block-dirty-bitmap-sha256',
-    'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256' }
+{ 'command': 'x-debug-block-dirty-bitmap-sha256',
+  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256' }
 
 ##
 # @blockdev-mirror:
diff --git a/qapi/ui.json b/qapi/ui.json
index e16e98a060..1568cfeaad 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1081,8 +1081,8 @@
  # Since: 3.0
  #
  ##
- { 'enum'    : 'DisplayGLMode',
-   'data'    : [ 'off', 'on', 'core', 'es' ] }
+{ 'enum'    : 'DisplayGLMode',
+  'data'    : [ 'off', 'on', 'core', 'es' ] }
 
 ##
 # @DisplayCurses:
-- 
2.26.2


