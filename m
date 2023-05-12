Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CC7003D0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 11:32:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxP7b-0006nP-Ny; Fri, 12 May 2023 05:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxP7V-0006io-PI; Fri, 12 May 2023 05:31:26 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pxP7S-0006YE-O3; Fri, 12 May 2023 05:31:25 -0400
X-UUID: e288b10992cb4de7a799da77a14ab584-20230512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:44b1e119-3b1a-41f9-9a88-54a68985f91c, IP:10,
 URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:21
X-CID-INFO: VERSION:1.1.22, REQID:44b1e119-3b1a-41f9-9a88-54a68985f91c, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:21
X-CID-META: VersionHash:120426c, CLOUDID:3d7cf83a-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230512173112RBIG3N3X,BulkQuantity:0,Recheck:0,SF:19|43|24|17|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e288b10992cb4de7a799da77a14ab584-20230512
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 506198866; Fri, 12 May 2023 17:31:11 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id DABA9E0084A4;
 Fri, 12 May 2023 17:31:10 +0800 (CST)
X-ns-mid: postfix-645E075E-67668141
Received: from zdzh5-QiTianM428-A376.. (unknown [172.20.12.253])
 by mail.kylinos.cn (NSMail) with ESMTPA id 5AB8DE0084A4;
 Fri, 12 May 2023 17:31:10 +0800 (CST)
From: Hao Zeng <zenghao@kylinos.cn>
To: pbonzini@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Zeng <zenghao@kylinos.cn>
Subject: [PATCH V2] hw/arm: enable qxl for aarch64
Date: Fri, 12 May 2023 17:31:08 +0800
Message-Id: <20230512093108.1180726-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0f42c556d7..d0bedf9347 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,6 +32,7 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select QXL
=20
 config CHEETAH
     bool
--=20
2.37.2


