Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC934F1FA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 10:23:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLO3H-00080p-2a
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 04:23:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hLO1y-0007cn-SJ
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 04:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjie88@huawei.com>) id 1hLO1u-0002y8-W5
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 04:22:26 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2061 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wangjie88@huawei.com>)
	id 1hLO1u-0002dm-Kz
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 04:22:22 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id 64F8F883E29A8AE4F07E;
	Tue, 30 Apr 2019 16:22:12 +0800 (CST)
Received: from localhost.localdomain (10.175.104.211) by
	dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 30 Apr 2019 16:22:01 +0800
From: Jie Wang <wangjie88@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 30 Apr 2019 14:10:14 +0800
Message-ID: <1556604614-32081-1-git-send-email-wangjie88@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.211]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.189
Subject: [Qemu-devel] [PATCH] vhost: remove the dead code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eric.fangyi@huawei.com, wangjie88@huawei.com, wu.wubin@huawei.com,
	mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

remove the dead code

Signed-off-by: Jie Wang <wangjie88@huawei.com>
---
 hw/virtio/vhost.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7f61018f2a..2303a8c206 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1650,7 +1650,6 @@ fail_vq:
                              hdev->vqs + i,
                              hdev->vq_index + i);
     }
-    i = hdev->nvqs;
 
 fail_mem:
 fail_features:
-- 
2.16.2.windows.1


