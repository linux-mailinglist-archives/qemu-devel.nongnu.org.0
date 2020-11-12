Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B392D2B0C23
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:02:05 +0100 (CET)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGv6-0002xr-Lk
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsc-0000w4-1S
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsa-0000hC-7c
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7O4/C63N+lM0owXek/SW3yejcRRJjOniSEc/vUtMRQ=;
 b=D9Rc0jTnHeQzvJJiIiGlzOtlx2LnHIcGm645GC/DhuDSflVDzx5vHowfVptCLIipmm55eA
 nvrjEC/VBhmlI0tEqUpswswhnOaxqFOJ3WsEA/ys7jHMUWBw/iRmNbicCOvPLrjYXswu8n
 XZcawRTSWtlDN62wtG0s//x6P6rJ/NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-9iK_nbz4O4mgYavr501b5g-1; Thu, 12 Nov 2020 12:59:25 -0500
X-MC-Unique: 9iK_nbz4O4mgYavr501b5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C84FB108597E
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FA591002C25;
 Thu, 12 Nov 2020 17:59:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/13] char: Some QAPI aliases for CLI compatibility
Date: Thu, 12 Nov 2020 18:58:55 +0100
Message-Id: <20201112175905.404472-4-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For all chardev backend types where this is enough to achieve
compatibility with the old QemuOpts based command line parser, add
aliases to the QAPI schema.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 14ee06a52d..91c0dbfa1e 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -227,7 +227,8 @@
   'data': { '*in': 'str',
             'out': 'str',
             '*append': 'bool' },
-  'base': 'ChardevCommon' }
+  'base': 'ChardevCommon',
+  'aliases': [ {'alias': 'path', 'source': ['out'] } ] }
 
 ##
 # @ChardevHostdev:
@@ -241,7 +242,8 @@
 ##
 { 'struct': 'ChardevHostdev',
   'data': { 'device': 'str' },
-  'base': 'ChardevCommon' }
+  'base': 'ChardevCommon',
+  'aliases': [ {'alias': 'path', 'source': ['device'] } ] }
 
 ##
 # @ChardevSocket:
@@ -342,7 +344,8 @@
 { 'struct': 'ChardevSpiceChannel',
   'data': { 'type': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'defined(CONFIG_SPICE)',
+  'aliases': [ {'alias': 'name', 'source': ['type'] } ] }
 
 ##
 # @ChardevSpicePort:
@@ -356,7 +359,8 @@
 { 'struct': 'ChardevSpicePort',
   'data': { 'fqdn': 'str' },
   'base': 'ChardevCommon',
-  'if': 'defined(CONFIG_SPICE)' }
+  'if': 'defined(CONFIG_SPICE)',
+  'aliases': [ {'alias': 'name', 'source': ['fqdn'] } ] }
 
 ##
 # @ChardevVC:
@@ -420,7 +424,8 @@
             'vc': 'ChardevVC',
             'ringbuf': 'ChardevRingbuf',
             # next one is just for compatibility
-            'memory': 'ChardevRingbuf' } }
+            'memory': 'ChardevRingbuf' },
+  'aliases': [ { 'source': ['data'] } ] }
 
 ##
 # @ChardevReturn:
-- 
2.28.0


