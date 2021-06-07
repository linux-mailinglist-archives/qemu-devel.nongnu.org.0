Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9039E6F8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:00:20 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKTy-0007he-Mr
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRZ-0003st-Fr; Mon, 07 Jun 2021 14:57:50 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:54449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRX-0005r3-LT; Mon, 07 Jun 2021 14:57:49 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MkpOZ-1l4qnh0kSl-00mNJD; Mon, 07
 Jun 2021 20:57:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] vhost-vdpa: Remove redundant declaration of
 address_space_memory
Date: Mon,  7 Jun 2021 20:57:30 +0200
Message-Id: <20210607185730.346641-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+v8rA2j1TSMGgb5AoUeRwyrc0fkuy0oOkqepYIkULWKDgsrcfCY
 fh4kzddffD9rZxvXq39Qtrqto2uLpxCydLqex+UUEJXWfncTjormHPnAogFo+shlj17R1jB
 BnSsBAYBD/O/Dlg//YKeWy5P5NMMxmMxCoXW0bLrzkCqOyMB1zzrTEf6R7NJjHK/7t0iSs1
 eDgODFspXAPKJIhNAVR6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uFo91fTMo7g=:/RLajVqPBBEkob9siHuGtT
 52gphaI3vm9bMoP2YT0YPKGXkZTPhuTafu5b2jhOYebmoHmop8T6hENJobs78bGB874nZZPqj
 gMbTGiSP+e3Z06/6Alay04IzSEQlIuVT/eWykE4Dlc2eMcfWYlumyt5/2zHn4pH0/6rEYRMcJ
 w3kfwDMT15L2j1o1eIS5pwKsIohgeZWH/G2ISXUkmIqhCAqeAgjuwjV4pChMQYVZD4YkKGsHZ
 T+Rof553ykwacP0VW3dibeNtdoZCnGu6k03Lx1I7Jv2A4ot1IBG/rKjjk+lPfIP7wXa0CYfKq
 jVfWgy6/avDdHs3hwu4X5R1J3eqUDh94vFG6ehmDvz/v7Bokro67WeRdwuiJVcpoQvnvS0te6
 IUW/eVt7z57g8PJTgUGNpAJPpbg45PG5jknolTVRx+F2rdMgbqB59cq4gVICYoEnJJ5Dgwu7o
 OSh2kCCyBTWNtGIkREdbd7V+XVif9tp7dj+P46EHd6sUINLvTj9HbedbvKX4aHhcpRow3rbGE
 HD5OKZ4AsRUqIB51o6fMuQ=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Xie Yongji <xieyongji@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

The symbol address_space_memory are already declared in
include/exec/address-spaces.h. So let's add this header file
and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210517123246.999-1-xieyongji@bytedance.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost-vdpa.c         | 1 +
 include/hw/virtio/vhost-vdpa.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8f2fb9f10b2a..ee51863d280b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/vhost-backend.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/vhost-vdpa.h"
+#include "exec/address-spaces.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "trace.h"
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 28ca65018ed7..ae9ee7adb2d0 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
     struct vhost_dev *dev;
 } VhostVDPA;
 
-extern AddressSpace address_space_memory;
 #endif
-- 
2.31.1


