Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B15F771F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:59:21 +0200 (CEST)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogl4Z-0003fJ-OJ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktj-0005NI-Lq
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkth-00034c-5v
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYk2jP3gwMWLWOqCMmqtTDNqJqGs7xLs74vG7fNqpB8=;
 b=UV+M45BeIySwV18n9SMO1SunbF94DqR3XReoTM5ev4HGwDiQ7u1DHKlL0GAS7kH6dDYpAt
 8brZlpmaW1GnLHdBScPTQtGaDI6/INFrQQ1Lh80z3JfHvQxATdHujCjEYOQJIBo6I5rumo
 itTbflXEst9Oz5iv6ueA+d2rVEob3ac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-eC_I1ShPPz2ysP5ehIsvPw-1; Fri, 07 Oct 2022 06:48:02 -0400
X-MC-Unique: eC_I1ShPPz2ysP5ehIsvPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC4AF862FE2;
 Fri,  7 Oct 2022 10:48:01 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8D572028DC1;
 Fri,  7 Oct 2022 10:48:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 01/50] Revert "qapi: fix examples of blockdev-add with qcow2"
Date: Fri,  7 Oct 2022 12:47:03 +0200
Message-Id: <20221007104752.141361-2-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Markus Armbruster <armbru@redhat.com>

This reverts commit b6522938327141235b97ab38e40c6c4512587373.

Kevin Wolf NAKed this patch, because:

    'file' is a required member (defined in BlockdevOptionsGenericFormat),
    removing it makes the example invalid. 'data-file' is only an additional
    optional member to be used for external data files (i.e. when the guest
    data is kept separate from the metadata in the .qcow2 file).

However, it had already been merged then.  Revert.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220930171908.846769-1-armbru@redhat.com>
Reviewed-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.37.3


