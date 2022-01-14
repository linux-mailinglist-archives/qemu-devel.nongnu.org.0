Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1973F48EB1E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:55:43 +0100 (CET)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8N3O-0006Uq-5n
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0T-0002zJ-2q
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0R-0000JD-Ii
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgFY6FYWAmea9btfG53zrB8BGsroNsMyvdy9HMacuzY=;
 b=hOWdl3R68oWgU1o12OOIrGXNmG2eZVwt/6egp0x53IiFDZprbDc6RNGQ1RC8YFTgkDr1Bk
 b8puRH6To+wUmYjx3Rq9+nDyQo3K5rsLupNfgx2apWP6COwxWOD1Nm5wW1DlnouYuZ/wck
 xg2bm8IvGUTfuXvCdx+OdISGdLYPSRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-ACfSdj9nMk6M0PAqw0E8hg-1; Fri, 14 Jan 2022 08:52:35 -0500
X-MC-Unique: ACfSdj9nMk6M0PAqw0E8hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929CD1023F53;
 Fri, 14 Jan 2022 13:52:34 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 906FD105B213;
 Fri, 14 Jan 2022 13:52:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/16] include/sysemu/blockdev.h: remove drive_get_max_devs
Date: Fri, 14 Jan 2022 14:52:13 +0100
Message-Id: <20220114135226.185407-4-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Remove drive_get_max_devs, as it is not used by anyone.

Last use was removed in commit 8f2d75e81d5
("hw: Drop superfluous special checks for orphaned -drive").

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211215121140.456939-4-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/blockdev.h |  1 -
 blockdev.c                | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index ea35c42f5c..f9fb54d437 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -48,7 +48,6 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
-int drive_get_max_devs(BlockInterfaceType type);
 
 QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
                     const char *optstr);
diff --git a/blockdev.c b/blockdev.c
index 25b3b202e7..8197165bb5 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -168,23 +168,6 @@ void blockdev_auto_del(BlockBackend *blk)
     }
 }
 
-/**
- * Returns the current mapping of how many units per bus
- * a particular interface can support.
- *
- *  A positive integer indicates n units per bus.
- *  0 implies the mapping has not been established.
- * -1 indicates an invalid BlockInterfaceType was given.
- */
-int drive_get_max_devs(BlockInterfaceType type)
-{
-    if (type >= IF_IDE && type < IF_COUNT) {
-        return if_max_devs[type];
-    }
-
-    return -1;
-}
-
 static int drive_index_to_bus_id(BlockInterfaceType type, int index)
 {
     int max_devs = if_max_devs[type];
-- 
2.31.1


