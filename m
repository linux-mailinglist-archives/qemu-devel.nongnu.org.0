Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C406A4E325F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:44:32 +0100 (CET)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPpH-00078J-T9
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:44:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmk-00050j-9m
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmf-0006NQ-W9
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647898909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SgXAWFOWDLwA7FDLllMePxZxsyCzX/iGb5U8mOnV+4=;
 b=XgRkiGXth72mtBbk5iunhys4Gq/bx8LAC89qRFaZrjUIHiwcSpPnVZt3DFqMgbk/TSjZDJ
 fiqLw2lDnbMLIhrdiOauXWhWJ5nDgbYrZ9u5QWvwalotOcaklNzACHUViRKy3YeLrm2Fp1
 CkN0tRKWQQPaCyhGLuPP1LEU1uxSh1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-mM_FiFMsPXeN93rNeLjCaQ-1; Mon, 21 Mar 2022 17:41:38 -0400
X-MC-Unique: mM_FiFMsPXeN93rNeLjCaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2EF918E53C5;
 Mon, 21 Mar 2022 21:41:37 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8523644198E;
 Mon, 21 Mar 2022 21:41:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] MAINTAINERS: change Vladimir's email address
Date: Mon, 21 Mar 2022 16:41:32 -0500
Message-Id: <20220321214134.597006-2-eblake@redhat.com>
In-Reply-To: <20220321214134.597006-1-eblake@redhat.com>
References: <20220321214134.597006-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

Old vsementsov@virtuozzo.com is not accessible anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Message-Id: <20220316092702.426629-1-v.sementsov-og@mail.ru>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9aed5f3e04e4..cc364afef733 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2507,7 +2507,7 @@ F: scsi/*

 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2546,7 +2546,7 @@ T: git https://repo.or.cz/qemu/armbru.git block-next

 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2770,13 +2770,13 @@ F: scripts/*.py
 F: tests/*.py

 Benchmark util
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 S: Maintained
 F: scripts/simplebench/
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench

 Transactions helper
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 S: Maintained
 F: include/qemu/transactions.h
 F: util/transactions.c
@@ -3360,7 +3360,7 @@ F: block/iscsi-opts.c

 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3456,7 +3456,7 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-- 
2.35.1


