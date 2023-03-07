Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EC46AD806
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRRk-0007XI-Q1; Tue, 07 Mar 2023 02:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRg-0007X7-GI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRe-0005Ny-NM
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MVjW4PBypmUtD8vE3syEuiPghW7sFYR+cgZ6lCuGUY=;
 b=ckoktFDbQ5BXd1wNpJufzgiHxyBX3Tp8r6WHEvaqUa908EJ9iJUL6YJxJTeTVlMeKMv276
 hi52BJyUgqcWBmqI4OBD4FDAsea2Yq2rE/bqo94/DV14NBwHRroNDoV9vpLaFNaeLTMSu1
 UQPN17EAGf+H9M1mSNZIvQn1FJ99OK4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-G6UucWd6MfWV6BQtExq1iA-1; Tue, 07 Mar 2023 02:09:04 -0500
X-MC-Unique: G6UucWd6MfWV6BQtExq1iA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDA97101A521;
 Tue,  7 Mar 2023 07:09:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10A8A4014D1B;
 Tue,  7 Mar 2023 07:09:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/51] hw/net: Add more MII definitions
Date: Tue,  7 Mar 2023 15:07:27 +0800
Message-Id: <20230307070816.34833-3-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The definitions will be used by igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/net/mii.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
index 4ae4dcc..c6a767a 100644
--- a/include/hw/net/mii.h
+++ b/include/hw/net/mii.h
@@ -81,20 +81,31 @@
 #define MII_ANLPAR_ACK      (1 << 14)
 #define MII_ANLPAR_PAUSEASY (1 << 11) /* can pause asymmetrically */
 #define MII_ANLPAR_PAUSE    (1 << 10) /* can pause */
+#define MII_ANLPAR_T4       (1 << 9)
 #define MII_ANLPAR_TXFD     (1 << 8)
 #define MII_ANLPAR_TX       (1 << 7)
 #define MII_ANLPAR_10FD     (1 << 6)
 #define MII_ANLPAR_10       (1 << 5)
 #define MII_ANLPAR_CSMACD   (1 << 0)
 
-#define MII_ANER_NWAY       (1 << 0) /* Can do N-way auto-nego */
+#define MII_ANER_NP         (1 << 2)  /* Next Page Able */
+#define MII_ANER_NWAY       (1 << 0)  /* Can do N-way auto-nego */
 
+#define MII_ANNP_MP         (1 << 13) /* Message Page */
+
+#define MII_CTRL1000_MASTER (1 << 11) /* MASTER-SLAVE Manual Configuration Value */
+#define MII_CTRL1000_PORT   (1 << 10) /* T2_Repeater/DTE bit */
 #define MII_CTRL1000_FULL   (1 << 9)  /* 1000BASE-T full duplex */
 #define MII_CTRL1000_HALF   (1 << 8)  /* 1000BASE-T half duplex */
 
+#define MII_STAT1000_LOK    (1 << 13) /* Local Receiver Status */
+#define MII_STAT1000_ROK    (1 << 12) /* Remote Receiver Status */
 #define MII_STAT1000_FULL   (1 << 11) /* 1000BASE-T full duplex */
 #define MII_STAT1000_HALF   (1 << 10) /* 1000BASE-T half duplex */
 
+#define MII_EXTSTAT_1000T_FD (1 << 13) /* 1000BASE-T Full Duplex */
+#define MII_EXTSTAT_1000T_HD (1 << 12) /* 1000BASE-T Half Duplex */
+
 /* List of vendor identifiers */
 /* RealTek 8201 */
 #define RTL8201CP_PHYID1    0x0000
-- 
2.7.4


