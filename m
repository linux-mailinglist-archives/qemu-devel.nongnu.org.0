Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AE5A68B8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:48:43 +0200 (CEST)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4Pq-00013N-3f
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uS-0002Bd-3u
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uQ-00025i-GC
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ft9K8D2pXy0xHSEn9t5dIakZC1c0XnsOnDr5wdUaOqc=;
 b=GHBGGS2DH853mm9G5Rv3TLd8B8iHvLt8G+kPmSAg6x0bhRaf3a+aUXGExYXRun6Qcy25uU
 vMZ5jQP5Wo3bUDhwJy1ITVCimfuyLl6oy7NFQlInS69tcmZMmDPCV11ejE7w6e4+H0d0wD
 prUos9G9Syv3+isN+zHwHG4VQija+aU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-OYCenqcoNIiLFovg8ftlyQ-1; Tue, 30 Aug 2022 12:16:10 -0400
X-MC-Unique: OYCenqcoNIiLFovg8ftlyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B6E51C1A941;
 Tue, 30 Aug 2022 16:16:10 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF171415117;
 Tue, 30 Aug 2022 16:16:08 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 12/16] qapi: fix example of blockdev-add command
Date: Tue, 30 Aug 2022 18:15:41 +0200
Message-Id: <20220830161545.84198-13-victortoso@redhat.com>
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

The example output is setting optional member "backing" with null.
This has no runtime impact. Remove it.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/block-core.json | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index dcc6d41494..302164d575 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1542,9 +1542,7 @@
 #      "arguments": { "driver": "qcow2",
 #                     "node-name": "node1534",
 #                     "data-file": { "driver": "file",
-#                                    "filename": "hd1.qcow2" },
-#                     "backing": null } }
-#
+#                                    "filename": "hd1.qcow2" } } }
 # <- { "return": {} }
 #
 # -> { "execute": "blockdev-snapshot",
-- 
2.37.2


