Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC7473DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 08:46:55 +0100 (CET)
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2WU-0007ak-DP
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 02:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0975287001=zhanghailiang@xfusion.com>)
 id 1mx2Ti-0006tq-Qi
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 02:44:02 -0500
Received: from wxsgout01.xfusion.com ([36.138.119.38]:50296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0975287001=zhanghailiang@xfusion.com>)
 id 1mx2Tf-0005zD-Ok
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 02:44:02 -0500
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
 by wxsgout01.xfusion.com (SkyGuard) with ESMTPS id 4JCr0Y4DpczCqtv;
 Tue, 14 Dec 2021 15:41:17 +0800 (CST)
Received: from localhost (10.99.3.112) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 14 Dec
 2021 15:44:23 +0800
From: Hailiang Zhang <zhanghailiang@xfusion.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] MAINTAINERS: Change my email address
Date: Tue, 14 Dec 2021 15:40:21 +0800
Message-ID: <20211214074021.6840-1-zhanghailiang@xfusion.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.99.3.112]
X-ClientProxiedBy: wuxshcsitd00601.xfusion.com (10.32.135.241) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
Received-SPF: pass client-ip=36.138.119.38;
 envelope-from=prvs=0975287001=zhanghailiang@xfusion.com;
 helo=wxsgout01.xfusion.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The zhang.zhanghailiang@huawei.com email address has been
stopped. Change it to my new email address.

Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..5d9c4243b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2967,7 +2967,7 @@ F: include/qemu/yank.h
 F: qapi/yank.json
 
 COLO Framework
-M: zhanghailiang <zhang.zhanghailiang@huawei.com>
+M: Hailiang Zhang <zhanghailiang@xfusion.com>
 S: Maintained
 F: migration/colo*
 F: include/migration/colo.h
-- 
2.34.1


