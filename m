Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBF6DEC64
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 09:18:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUiw-0005Fj-Md; Wed, 12 Apr 2023 03:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmUis-0005FL-P6
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:16:54 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmUim-0002d5-7r
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:16:54 -0400
X-UUID: 7a76ec31e85c4e31bdb79b233a487171-20230412
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:5641016e-5408-472c-80a6-5d919d5c2067, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.22, REQID:5641016e-5408-472c-80a6-5d919d5c2067, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:120426c, CLOUDID:65eb0fa1-8fcb-430b-954a-ba3f00fa94a5,
 B
 ulkID:2304121516368OEA056G,BulkQuantity:0,Recheck:0,SF:19|44|38|24|17|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7a76ec31e85c4e31bdb79b233a487171-20230412
X-User: zenghao@kylinos.cn
Received: from zdzh5-qitianm428-a376.. [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 2032947273; Wed, 12 Apr 2023 15:16:35 +0800
From: Hao Zeng <zenghao@kylinos.cn>
To: jonathan.cameron@huawei.com, fan.ni@samsung.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Cc: Hao Zeng <zenghao@kylinos.cn>
Subject: [PATCH v2 0/2] cxl-cdat:Fix two problems of ct3_load_cdat
Date: Wed, 12 Apr 2023 15:16:31 +0800
Message-Id: <20230412071633.2660412-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

This v2 contains a change suggested by Peter Maydell in patch v1.
v1 link:https://lore.kernel.org/all/20230403084245.54861-1-zenghao@kylinos.cn/

ChangeLog:
    v1->v2:
    - Patch 1: No change in patch v1
    - Patch 2: Fix the check on the return value of fread() in ct3_load_cdat

Hao Zeng (2):
  cxl-cdat:Fix open file not closed in ct3_load_cdat
  cxl-cdat:Fix the check on the return value of fread()

 hw/cxl/cxl-cdat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.37.2


No virus found
		Checked by Hillstone Network AntiVirus

