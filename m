Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878432056D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:48:59 +0100 (CET)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRgw-0002nx-Gi
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUI-00079B-SB; Sat, 20 Feb 2021 07:35:54 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003Op-Fy; Sat, 20 Feb 2021 07:35:54 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MXpQA-1lLH8F3QoG-00Y7wN; Sat, 20 Feb 2021 13:35:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] virtio-pmem: put it into the 'storage' category
Date: Sat, 20 Feb 2021 13:35:18 +0100
Message-Id: <20210220123525.1353731-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GpFRtxIXeQJlu0VxI2izQDOY4JZLNGVAHQuadfLk9EOjpRZRXlU
 5Q3JXQN+RMnawQNUV4FuomM/dtMwuJ+K0TTTKREtp4zKBCR6A4SbvsFIFhLD/DKGmTWe1hc
 3+ztpFyuWMa/D1OXQwk7o32sFBc4S8jC4M+KtX6dazK6hW0drJDKrG+8J45/MYQ80wdHg3Q
 2EGqOXeDmTBn6HDctmtKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZxY6uF1c8FE=:mDBi2Z90HMLM1J9DSFpYrd
 UMx3GIZBIjg2gQDxKLqroUQSEW6ydzG85djNYclurA9AYHVycgrhKNEzYV6842VGhQSGLFTK4
 9FozRtjn0T7Si2PIAw3ZBfl0D/34APsUI5Sg0WkGOB41aIH5lJyHR7UvXuy65HK38PFued6+5
 FvHzH0kGNa0aoTrEES45IXb7wxBtXDaDFCut9IRWrRuKqgr5TTOxf6c1IaqlL/Xh0uyM1cMHH
 igcGSmKqmE/sbUjrmNaV/MjEalaDQmr3cYXXbX+5+MBmdpRwKw6c/52eU6PF0VPoRWjXagQ5b
 HYHXuOakNdym8YyVGsvceaf0hbauw7Z+g6RoRlf2Hu/xwQ6mCN6Q2Epk4drgRfmLWdF1ERJUf
 TaAqOPoGgr6k4RKEvK1BTJMNVAtFEBnkW6L8lgI2cDHKMhNUGVB44q4RTtjXf
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

The category of the virtio-pmem device is not set, put it into the 'storage'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Message-Id: <20201130083630.2520597-3-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio-pmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d83e973bf299..a3e0688a891b 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -179,6 +179,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
 
     vpc->fill_device_info = virtio_pmem_fill_device_info;
     vpc->get_memory_region = virtio_pmem_get_memory_region;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static TypeInfo virtio_pmem_info = {
-- 
2.29.2


