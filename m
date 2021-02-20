Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D138232055A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:37:39 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRVy-0000LZ-SR
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-00070D-E1; Sat, 20 Feb 2021 07:35:51 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUC-0003MJ-MS; Sat, 20 Feb 2021 07:35:50 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Miqzy-1ljV2i1uqa-00exXT; Sat, 20 Feb 2021 13:35:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] vmmouse: put it into the 'input' category
Date: Sat, 20 Feb 2021 13:35:19 +0100
Message-Id: <20210220123525.1353731-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H9EDVWpnCSs9ecR5x1Mujxt7elTnnL0JEQC7iBh9BT50gruihej
 gwRhWCuqMcpQlGA2HW1+DBEGWlkSKEhDdCpXbyE7IBw/Beja4XKxd7mm9ZhlOCU7MMfQfO8
 rAVU9WbU+DNzzYAgWyAbZhhJqd391uy9vYulwMMaCEav8Sic+PqMd6NkAmPBCa0euDpymyd
 qY50o0AVjvuKYROMdgUGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7r2APxRwze0=:IUyXa5Du5zAmD9m6/CGi51
 3eECKbJt56Iha56Uc+zxeB8rX1oBFLZj+830WDMO9g7KEvJMBulrxOcZeOtDx7M6ry4TYBPIY
 Vm9Jnhfubzgv3H2RsAyYIs3V+q2JegcURw6Re6735ndW0N4fmBwZNXEwBN5XjwCZL60SINtsj
 zjPFpIaVwYBnuDRYiETPR2WP+Scu/qgGwt62/90AgTWO+KSEJfcgkm6Fij+05J9eoEfdP5mJP
 iwEufB9bI3fHxE0jpIRX4dCVQ6D29Jtp7N5/6Y/7I5wJgMgetBK2tUd2O6hONmgVd62S1IziQ
 RgUGhazoK6SwhH2D/FLP48+FvFViI02yumcAoLr33Woy/zSz7ahMPKDQvTKrBHq8J4d4aE6Cl
 FMVKiG2PaVN6NWGDJtVbrX7RH5OJh62YSSLx9y9nPcv+2CuGvXAw1Q+E5jfIp
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

The category of the vmmouse device is not set, put it into the 'input'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201130083630.2520597-4-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/vmmouse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index a3556438f0ff..df4798f50284 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -308,6 +308,7 @@ static void vmmouse_class_initfn(ObjectClass *klass, void *data)
     dc->reset = vmmouse_reset;
     dc->vmsd = &vmstate_vmmouse;
     device_class_set_props(dc, vmmouse_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo vmmouse_info = {
-- 
2.29.2


