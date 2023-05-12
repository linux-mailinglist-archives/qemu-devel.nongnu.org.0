Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C91700364
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 11:10:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxOla-0001vY-EK; Fri, 12 May 2023 05:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxOlU-0001ur-Vm; Fri, 12 May 2023 05:08:40 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxOlF-00016R-5R; Fri, 12 May 2023 05:08:40 -0400
X-UUID: fc41cbe72f17487ba46bf498eebecf95-20230512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:7fc97de6-0594-49d7-b6fd-bb75101263cf, IP:10,
 URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:21
X-CID-INFO: VERSION:1.1.22, REQID:7fc97de6-0594-49d7-b6fd-bb75101263cf, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:21
X-CID-META: VersionHash:120426c, CLOUDID:f2a4f73a-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230512170809A5N0KE0H,BulkQuantity:0,Recheck:0,SF:24|17|19|43|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fc41cbe72f17487ba46bf498eebecf95-20230512
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1852617730; Fri, 12 May 2023 17:08:06 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 5CBBEE0084A4;
 Fri, 12 May 2023 17:08:06 +0800 (CST)
X-ns-mid: postfix-645E01F6-154027667
Received: from zdzh5-QiTianM428-A376.. (unknown [172.20.12.253])
 by mail.kylinos.cn (NSMail) with ESMTPA id E572EE0084A4;
 Fri, 12 May 2023 17:08:04 +0800 (CST)
From: Hao Zeng <zenghao@kylinos.cn>
To: pbonzini@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Zeng <zenghao@kylinos.cn>
Subject: [PATCH] hw/arm: enable qxl for aarch64
Date: Fri, 12 May 2023 17:08:03 +0800
Message-Id: <20230512090803.1170154-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_TEMPERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Qemu does not support qxl graphics cards in arm, it is recommended to ena=
ble

Signed-off-by: Hao Zeng <zenghao@kylinos.cn>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..0305a4f4f3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,7 +32,7 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-
+    select QXL
 config CHEETAH
     bool
     default y if TCG && ARM
--=20
2.37.2


