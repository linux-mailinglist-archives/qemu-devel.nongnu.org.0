Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A24A4912
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:12:28 +0100 (CET)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXPv-0008JZ-0y
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEWEu-0002as-Cw
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:57:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEWER-0005JS-7f
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643633782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1JEWyhY+r0hOMjVtuXtN9Q22acIEvtKQ7yVWg2CH7iI=;
 b=KrHMoFOjGM4PDYg1hmJM/X38odpOz1IYgXieFXabIDRyI4hxWxqHwMx2UAVFe5UtzxNfV5
 YpT+tUYh0cu5NbAeMZkliP/ljzGjOyYW1NMsGnDKlcvNdpVLW+ThMAE0pP4Hs2oiHQq9mf
 ix7+7CKvgDflJfNtLDaXkR1Ff1RIiv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-wFQ6IsBbMZmmSAStlknjeQ-1; Mon, 31 Jan 2022 07:56:19 -0500
X-MC-Unique: wFQ6IsBbMZmmSAStlknjeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E77B51081;
 Mon, 31 Jan 2022 12:56:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B501A7AB79;
 Mon, 31 Jan 2022 12:56:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block.h: remove outdated comment
Date: Mon, 31 Jan 2022 07:56:15 -0500
Message-Id: <20220131125615.74612-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment "disk I/O throttling" doesn't make any sense at all
any more. It was added in commit 0563e191516 to describe
bdrv_io_limits_enable()/disable(), which were removed in commit
97148076, so the comment is just a forgotten leftover.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/block/block.h b/include/block/block.h
index 9d4050220b..e1713ee306 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -344,7 +344,6 @@ typedef unsigned int BdrvChildRole;
 char *bdrv_perm_names(uint64_t perm);
 uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm);
 
-/* disk I/O throttling */
 void bdrv_init(void);
 void bdrv_init_with_whitelist(void);
 bool bdrv_uses_whitelist(void);
-- 
2.31.1


