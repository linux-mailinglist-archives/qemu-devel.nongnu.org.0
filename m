Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694245B491
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:52:13 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpm8a-0000vp-G2
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:52:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpltq-0008KF-VA
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mplto-0007ds-OI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637735816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSTJ65kgKATH0lAhEJQAGEbeqmMHtqLDGOaBYo+Mdvw=;
 b=LjPFqRMvosQ3LwOIozbp5Q9+TnbVLXwknMsmDcP+DROK6GRJTWf9Jj312XwgC3oUGrB0RB
 7eIcu7/dBuQFry04KWO0ANwatInxnIafkDyjAKKZ41Ah8L76JfIF8riwLZ964VnKxAeOPg
 0o6SyKMpSVjwrg2DM8DYyzRfy3WobF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-P71pKk-tMs2Lz0-Hb0HPHA-1; Wed, 24 Nov 2021 01:36:53 -0500
X-MC-Unique: P71pKk-tMs2Lz0-Hb0HPHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EFC8100C669;
 Wed, 24 Nov 2021 06:36:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 546781001F50;
 Wed, 24 Nov 2021 06:36:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/4] include/sysemu/blockdev.h: remove drive_get_max_devs
Date: Wed, 24 Nov 2021 01:36:40 -0500
Message-Id: <20211124063640.3118897-5-eesposit@redhat.com>
In-Reply-To: <20211124063640.3118897-1-eesposit@redhat.com>
References: <20211124063640.3118897-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove drive_get_max_devs, as it is not used by anyone.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/sysemu/blockdev.h |  1 -
 blockdev.c                | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index aacc587a33..c4b7b8b54e 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -50,7 +50,6 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
-int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
 DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
diff --git a/blockdev.c b/blockdev.c
index 928bb743a1..84897f9d70 100644
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
2.27.0


