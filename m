Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6A5F10AF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:22:26 +0200 (CEST)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJiT-0000pp-Lt
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeJfR-0006oK-Km
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oeJfO-0002EE-P2
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664558352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yJ52BDAzQVR2LH49wQwnGdqoJG6yjR+AiVz5LrXsbg8=;
 b=b+w1IYa489+5nkW+7bJSQjUq7P2l9Q8dZ1rxY4rZSJ5x9T6vxDtzth6CX4olcC0mnLWxAb
 2ISsm50KZnCKhb1tplFJHoSYgFKK9odNVaGv7Uw8MFPJvFk3JP2bv3skYv6gqlidEN/cv0
 zvQT9xeNC3GluEjZpvq6QB5sjmeuUYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-GLJuikC8PrasVLTgipgNWw-1; Fri, 30 Sep 2022 13:19:11 -0400
X-MC-Unique: GLJuikC8PrasVLTgipgNWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99050833948
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 17:19:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C41C207AD4C;
 Fri, 30 Sep 2022 17:19:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 92A9521E691D; Fri, 30 Sep 2022 19:19:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: victortoso@redhat.com,
	kwolf@redhat.com
Subject: [PATCH] Revert "qapi: fix examples of blockdev-add with qcow2"
Date: Fri, 30 Sep 2022 19:19:08 +0200
Message-Id: <20220930171908.846769-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This reverts commit b6522938327141235b97ab38e40c6c4512587373.

Kevin Wolf NAKed this patch, because:

    'file' is a required member (defined in BlockdevOptionsGenericFormat),
    removing it makes the example invalid. 'data-file' is only an additional
    optional member to be used for external data files (i.e. when the guest
    data is kept separate from the metadata in the .qcow2 file).

However, it had already been merged then.  Revert.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index f21fa235f2..882b266532 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1541,8 +1541,8 @@
 # -> { "execute": "blockdev-add",
 #      "arguments": { "driver": "qcow2",
 #                     "node-name": "node1534",
-#                     "data-file": { "driver": "file",
-#                                    "filename": "hd1.qcow2" },
+#                     "file": { "driver": "file",
+#                               "filename": "hd1.qcow2" },
 #                     "backing": null } }
 #
 # <- { "return": {} }
@@ -4378,7 +4378,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "test1",
-#           "data-file": {
+#           "file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #            }
@@ -4395,7 +4395,7 @@
 #           "cache": {
 #              "direct": true
 #            },
-#           "data-file": {
+#            "file": {
 #              "driver": "file",
 #              "filename": "/tmp/test.qcow2"
 #            },
@@ -4477,7 +4477,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "node0",
-#           "data-file": {
+#           "file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #           }
-- 
2.37.2


