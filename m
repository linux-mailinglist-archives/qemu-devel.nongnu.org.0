Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092F621639
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPWZ-0002io-Nc; Tue, 08 Nov 2022 09:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osPWW-0002eE-QV
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1osPWV-0004AV-5Z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667917458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bydDDK9MH3KqL1XsWzyHtj4XoCBAET0emCVBntaIOCo=;
 b=HlskOWVlOMcDPAu2nGdq1ZztJ1GH5Sab3KUvGW1PFHpj1j++8ouTuaKEhL7Xvh19liQ0qP
 oK76sQV8YeJjObgite6LPCnXlXkfB9Hfm3LmTXzzl2ECPbWK2MRQEgGnUgZpi6ojV684Ah
 0JbvEp0M01UFYno7UyoVhxkVu6ufdZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344--3JC1JzMN9S5PBrxH9mLhg-1; Tue, 08 Nov 2022 09:24:00 -0500
X-MC-Unique: -3JC1JzMN9S5PBrxH9mLhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83D2101AA46;
 Tue,  8 Nov 2022 14:23:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 399547AE5;
 Tue,  8 Nov 2022 14:23:58 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Alberto Faria <afaria@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH] qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path
 description
Date: Tue,  8 Nov 2022 14:23:47 +0000
Message-Id: <20221108142347.1322674-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The nvme-io_uring BlockDriver's path option must point at the character
device of an NVMe namespace, not at an image file.

Fixes: fd66dbd424f5 ("blkio: add libblkio block driver")
Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d904004f8..95ac4fa634 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3704,7 +3704,7 @@
 #
 # Driver specific block device options for the nvme-io_uring backend.
 #
-# @path: path to the image file
+# @path: path to the NVMe namespace's character device (e.g. /dev/ng0n1).
 #
 # Since: 7.2
 ##
-- 
2.38.1


