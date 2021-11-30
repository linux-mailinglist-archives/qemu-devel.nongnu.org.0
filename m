Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155E463047
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:51:28 +0100 (CET)
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrznL-0008Ck-5v
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrziu-0001v0-5u
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzis-0002ym-La
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638265609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCnNlqYMvB0OEr/twOqvyndqGkIfKjLtIkACfXb6y/I=;
 b=SEdNqrvnEkqlQg9PnUPaevBK87z3h++uJiBmbnmwz6KhCFKxLdaIQYVJjNUVSnJa9VBTPo
 TFznM+Pup5WGV0tLQXQjgNqyXY7AOiAoZMi5rSEL9sskKGCG9wV3eQzwSy6OCKAxuTzKsk
 nfFU3AVmCiZnGn5N5AbN4usGnU5mnQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-ynmoYN4NP6KXnaIt6PLIvA-1; Tue, 30 Nov 2021 04:46:45 -0500
X-MC-Unique: ynmoYN4NP6KXnaIt6PLIvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D090B100CCC3;
 Tue, 30 Nov 2021 09:46:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27C3A67842;
 Tue, 30 Nov 2021 09:46:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/4] include/sysemu/blockdev.h: remove drive_get_max_devs
Date: Tue, 30 Nov 2021 04:46:33 -0500
Message-Id: <20211130094633.277982-5-eesposit@redhat.com>
In-Reply-To: <20211130094633.277982-1-eesposit@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove drive_get_max_devs, as it is not used by anyone.

Last use was removed in commit 8f2d75e81d5
("hw: Drop superfluous special checks for orphaned -drive").

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 blockdev.c                | 17 -----------------
 include/sysemu/blockdev.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index e5cb3eb95f..0112f488a4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -173,23 +173,6 @@ void blockdev_auto_del(BlockBackend *blk)
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
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 21ae0b994a..430abdbdb8 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -49,7 +49,6 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
 void drive_check_orphaned(void);
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
 int drive_get_max_bus(BlockInterfaceType type);
-int drive_get_max_devs(BlockInterfaceType type);
 DriveInfo *drive_get_next(BlockInterfaceType type);
 
 DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
-- 
2.31.1


