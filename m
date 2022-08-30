Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1045A6892
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:41:41 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4J2-0003L7-E1
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uQ-000294-Un
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uP-00025U-Bj
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9TT9mXqOT492bHunxoHuxiDteEPhFbutEVCGtMM5w8=;
 b=UmgdDeJvXxIvz1dpzdNRobq4cumHN2KwvKjOvHu5JTydIalQaL1kBMTAyYHsjX27VM/2Wi
 CAoDK5KSRptFTgkvVbreiywaSy0hH75fzdQhDGoVmRB4IMe93AA0socqYNUEePoZwwGOaQ
 C2VM5GikGCQYzvZPSVXyNM4jepQ3VOI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-LNr4OeDtPVCWYKVl5Kxy4A-1; Tue, 30 Aug 2022 12:16:08 -0400
X-MC-Unique: LNr4OeDtPVCWYKVl5Kxy4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F128380115E;
 Tue, 30 Aug 2022 16:16:08 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D752D141511A;
 Tue, 30 Aug 2022 16:16:06 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 11/16] qapi: fix examples of blockdev-add with qcow2
Date: Tue, 30 Aug 2022 18:15:40 +0200
Message-Id: <20220830161545.84198-12-victortoso@redhat.com>
In-Reply-To: <20220830161545.84198-1-victortoso@redhat.com>
References: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
index c038d9225d..dcc6d41494 100644
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


