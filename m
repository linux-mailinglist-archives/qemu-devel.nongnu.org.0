Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A92697F77
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:23:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJcR-0008JN-Mp; Wed, 15 Feb 2023 10:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSJcL-0008J0-9P
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:22:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSJcI-0002fY-2N
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676474560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=m9zJ7SKM0O5qupfAnN6HPv6VpT7eI/lifcK9QXvjYok=;
 b=aOAyMFEmDFs+3EMrO86lvb8U587ybzRO5QvTb0YBi3OiFhS/SkALbVX/aatmDLtjHIBji9
 ETJUzhKxBD5UAreu5JRWDoA+uQhPBmj8OSTfDLKpvegmz4zXhjK+8/5ZOusiwf116f7FVT
 OOrFz4NjqOGmk301CR8p93rqrVNdKpQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-9qVihy_5NxitQ-opSEI9tA-1; Wed, 15 Feb 2023 10:22:37 -0500
X-MC-Unique: 9qVihy_5NxitQ-opSEI9tA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 499C93815F7D;
 Wed, 15 Feb 2023 15:22:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAD940C10FA;
 Wed, 15 Feb 2023 15:22:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous includes
 from the header
Date: Wed, 15 Feb 2023 16:22:33 +0100
Message-Id: <20230215152233.210024-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

pci_device.h is not needed at all in allwinner-a10.h, and serial.h
is only needed by the corresponding .c file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/allwinner-a10.h | 2 --
 hw/arm/allwinner-a10.c         | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 79e0c80568..095afb225d 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,9 +1,7 @@
 #ifndef HW_ARM_ALLWINNER_A10_H
 #define HW_ARM_ALLWINNER_A10_H
 
-#include "hw/char/serial.h"
 #include "hw/arm/boot.h"
-#include "hw/pci/pci_device.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index dc1966ff7a..b7ca795c71 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/char/serial.h"
 #include "hw/sysbus.h"
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
-- 
2.31.1


