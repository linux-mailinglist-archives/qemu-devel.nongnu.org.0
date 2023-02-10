Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF5691E46
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 12:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQRaE-0003v8-HH; Fri, 10 Feb 2023 06:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQRaD-0003us-5a
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:28:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQRaB-0003LQ-Q0
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 06:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676028527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDbZlrbJ/utXp3myhk3LBSwncrLko7ExuWpjzcEFVJo=;
 b=BbaKieuzpny8ZRz9y4JuPA5lkGGpufv98xyRYq/G3QVAO1Pp81xK9iyCl3L3mPlWlfzIEY
 MImEpSdhlnfe/VE0FgRocmA92b4dvKJ0c6lyAmk1tZ3HPnP2R34Lzaai0pT8kalk1doyI0
 gltFI9y17ONeIC4rKEvsqKeY6gWOLdY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-Wj8STmPJNrqFH4MFy4KWMA-1; Fri, 10 Feb 2023 06:28:44 -0500
X-MC-Unique: Wj8STmPJNrqFH4MFy4KWMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 837243C0D1AA;
 Fri, 10 Feb 2023 11:28:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 547E4140EBF4;
 Fri, 10 Feb 2023 11:28:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] include/hw: Do not include hw.h from headers
Date: Fri, 10 Feb 2023 12:28:35 +0100
Message-Id: <20230210112835.1117966-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

This include is not needed here, so drop that line.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/ssi/ibex_spi_host.h          | 1 -
 include/hw/tricore/tricore_testdevice.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
index 8089cc1c31..5bd5557b9a 100644
--- a/include/hw/ssi/ibex_spi_host.h
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -28,7 +28,6 @@
 #define IBEX_SPI_HOST_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/fifo8.h"
 #include "qom/object.h"
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 1e2b8942ac..8b4fe15f24 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -19,7 +19,6 @@
 #define HW_TRICORE_TESTDEVICE_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
 #define TRICORE_TESTDEVICE(obj) \
-- 
2.31.1


