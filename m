Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2F5F677A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:13:59 +0200 (CEST)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQhK-0005B8-PK
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogPxF-000295-LY
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogPxC-0000eB-5l
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665059177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RPgeTwt5K+tSnycxOOsbRPdcVnM5DagXLwyuPJAkb6E=;
 b=FZQg97Y+jtvbK0KNEiuZ3BjdANnnRpWOf7QaonE94Knyrc7KogT/wIrSSoEPF79uQF7g4Q
 PkJFx9z0SGmk4VM7WCI2mOMFKZBWEeGOzamOABLAt03miaEXV6uBEiHEcnZkaTV9ZPiVOR
 LWsTPKgHgHW+ETlJpvopjbcQY/17EWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-3wLeVNm-O8KBQ00Ny5Dugg-1; Thu, 06 Oct 2022 08:26:14 -0400
X-MC-Unique: 3wLeVNm-O8KBQ00Ny5Dugg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EC3F805AC5;
 Thu,  6 Oct 2022 12:26:14 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65EBB40315F;
 Thu,  6 Oct 2022 12:26:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] quorum: Remove unnecessary forward declaration
Date: Thu,  6 Oct 2022 14:26:07 +0200
Message-Id: <20221006122607.162769-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index 970f63d9f9..f9e6539ceb 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -232,8 +232,6 @@ static bool quorum_has_too_much_io_failed(QuorumAIOCB *acb)
     return false;
 }
 
-static int read_fifo_child(QuorumAIOCB *acb);
-
 static void quorum_copy_qiov(QEMUIOVector *dest, QEMUIOVector *source)
 {
     int i;
-- 
2.37.3


