Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF45A9387
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:47:22 +0200 (CEST)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgnB-0000Dz-GB
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2U-0000P2-9r
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2Q-0004vj-Rv
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q13/GHV+Xl8QBDunQf5t+2hX57RWEOLNs/wV+ka6jmc=;
 b=GsuRU+o6grOl1A87sRSG/IGnEwlrGEKj9on279lN8hZuhm2PzNQPWmjvsaT6MHieGJDzga
 hNqm5krDNWN0XZ3FJSjo3MrMNj4alwHXbdVwaSdC0BoSjx30VQQesUb/G+vo1JxzMzmnDk
 VpA3tViSB/oMfH4yXFkk96eLVpgDAdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-JMJyuIRoOJ-mYMy-vBLycA-1; Thu, 01 Sep 2022 04:58:58 -0400
X-MC-Unique: JMJyuIRoOJ-mYMy-vBLycA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87841C0690A;
 Thu,  1 Sep 2022 08:58:57 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E2272026D4C;
 Thu,  1 Sep 2022 08:58:56 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 08/10] qapi: fix examples of blockdev-add with qcow2
Date: Thu,  1 Sep 2022 10:58:38 +0200
Message-Id: <20220901085840.22520-9-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The examples use "qcow2" driver with the wrong member name for
BlockdevRef alternate type. This patch changes all wrong member names
from "file" to "data-file" which is the correct member name in
BlockdevOptionsQcow2 for the BlockdevRef field.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/block-core.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 882b266532..f21fa235f2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1541,8 +1541,8 @@
 # -> { "execute": "blockdev-add",
 #      "arguments": { "driver": "qcow2",
 #                     "node-name": "node1534",
-#                     "file": { "driver": "file",
-#                               "filename": "hd1.qcow2" },
+#                     "data-file": { "driver": "file",
+#                                    "filename": "hd1.qcow2" },
 #                     "backing": null } }
 #
 # <- { "return": {} }
@@ -4378,7 +4378,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "test1",
-#           "file": {
+#           "data-file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #            }
@@ -4395,7 +4395,7 @@
 #           "cache": {
 #              "direct": true
 #            },
-#            "file": {
+#           "data-file": {
 #              "driver": "file",
 #              "filename": "/tmp/test.qcow2"
 #            },
@@ -4477,7 +4477,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "node0",
-#           "file": {
+#           "data-file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #           }
-- 
2.37.2


