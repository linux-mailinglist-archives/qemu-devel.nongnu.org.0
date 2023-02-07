Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092568CFBC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHkO-0007L5-RJ; Tue, 07 Feb 2023 01:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjU-00077R-Q4
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPHjS-00041K-0N
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675752333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eco68rI8qqvAIllmmgXKJXzNTpHnt91BwAWjJ+y8vKo=;
 b=Ab/AXwXDqMqxzMVwLZMxMqMTpOtuQIxTAnxLRmqLoKnaL3DtE9zw9TGnCc5iwBko6g69W3
 y/ub1mmQZQdNIZj/Galxpf1Nhzt/XSTqGzTa6kwSwpmOW7iB1io396rqU9hZoOzCdmZMKm
 zEwIAL8K2gumnCo3dZmGXN2seWPA8Yk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-r9ewHpAzP-W0KwZURLmyNg-1; Tue, 07 Feb 2023 01:45:28 -0500
X-MC-Unique: r9ewHpAzP-W0KwZURLmyNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06971183B3C3;
 Tue,  7 Feb 2023 06:45:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7EE01121314;
 Tue,  7 Feb 2023 06:45:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 107FC21E6916; Tue,  7 Feb 2023 07:45:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 15/20] block: Clean up includes
Date: Tue,  7 Feb 2023 07:45:18 +0100
Message-Id: <20230207064523.3968603-16-armbru@redhat.com>
In-Reply-To: <20230207064523.3968603-1-armbru@redhat.com>
References: <20230207064523.3968603-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20230202133830.2152150-16-armbru@redhat.com>
---
 include/block/graph-lock.h      | 1 -
 include/block/write-threshold.h | 2 --
 block/qapi.c                    | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 3ab924d5e2..18cc14de22 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -20,7 +20,6 @@
 #ifndef GRAPH_LOCK_H
 #define GRAPH_LOCK_H
 
-#include "qemu/osdep.h"
 #include "qemu/clang-tsa.h"
 
 /**
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index f50f923e7e..63d1583887 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -13,8 +13,6 @@
 #ifndef BLOCK_WRITE_THRESHOLD_H
 #define BLOCK_WRITE_THRESHOLD_H
 
-#include "qemu/typedefs.h"
-
 /*
  * bdrv_write_threshold_set:
  *
diff --git a/block/qapi.c b/block/qapi.c
index d52f1ab614..c84147849d 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -40,7 +40,6 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/block-backend.h"
-#include "qemu/cutils.h"
 
 BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         BlockDriverState *bs,
-- 
2.39.0


