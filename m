Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0165F1396
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 22:23:36 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeMXn-0007SC-Ej
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 16:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oeMWG-0004bl-4W; Fri, 30 Sep 2022 16:22:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oeMWE-0004b3-8o; Fri, 30 Sep 2022 16:21:59 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiagL-1p7Njp4AAZ-00fn4b; Fri, 30
 Sep 2022 22:21:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/8] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Date: Fri, 30 Sep 2022 22:21:37 +0200
Message-Id: <20220930202144.1109310-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930202144.1109310-1-laurent@vivier.eu>
References: <20220930202144.1109310-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dXPxFCZRmDTaGVm2OSMLY4Jgdh7wB+4if6nrWq4Sls6m+hJajcs
 c0UNeMgthGX3gWu8yXgz8lQJb0qzPQPAYNCJuisTFTASU/eb2vKM/5ihdVRbdvQ1nhC9/PX
 ZerSSmo7vLV9rZzieVXeNNXNWQVDfwK+ZJk8AUBjZnKyuoBUjmWet+Ub4gwQim0Ttef0VS4
 z4Zg6y2YXIN/qdCR9hrxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DPRji3VTWFA=:xUGqjGcduMNuXZM8uocp/8
 XSivpZqeeO5nAXBMDRBB4ygnosdt43Fatd2Ht906zlVgxKQ7BxdpdAnhBfHBr2hRqjzUSlNfg
 oAKJxJT/oq8hpcqYW4l9o3nphG3uYZrr0uofpLiZLHeVW1Iu0TBxTYsFGk8v4Yx1np6NVLkO8
 UpubTi1YIm+q3EPg33imL9IefvYsKkUkeVYIXwFh1nYiQKNust21DZPlZxY7+RQg2oqSm2LSV
 F5MWgH1piBIO+h6vT0tHObBIPYAcQCezgn5SI+8dopsmfnwYHBvDAR0aSWlXNEwFqVdsi2/RH
 RnqK9j/O1ZbJfysiojaJEBkRz3f56DYkSSnm/gLUx6CrTF2rA+tUd6JF5mgVFOv1tp42qliJr
 9EafjTcHKDtSd5x9sJYGbwNjsZGZ+dsDUa6xgmcwyfKz4xt8brlL70WkL644A18RGA7dHoGlx
 O9gtmu/THmjPlE+p8ELD75nK9z4E9q3+GHSDlCn9RlDc3JyNJWOpSF9IhaRztiBqQb1RnZzZj
 SHYmeoN2drs+JQBMH0GoGxt4tk3f/JsLgBdulTaW3/3Qrrwf6LUFPfO8X2cSn9/OmL+W9nMjn
 vYjFPWajiVOud4TpdL7kMzJI/jJ5ApSddRAqFnpuB52BUwc5oj9p6azm6fpvfIKpGAB1Myriw
 TH38O2BNZlt2iqqi4kvXsy8rtdkj1CaMqGUVn0Mfc8LTHSdARbeBXfLNts2eABvOgJCyWorr6
 GU0xY6R6B/mJKE5MDi7iL8PLAL/j46qqzOcYdeKU7vsa9QZyQymnMreS9pxlsCfpfXTcV7Awu
 OJ13EE8
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

GCC issues a false positive warning, resulting in build failure with -Werror:

  In file included from /usr/include/glib-2.0/glib.h:114,
                   from src/include/glib-compat.h:32,
                   from src/include/qemu/osdep.h:144,
                   from ../src/hw/virtio/vhost-shadow-virtqueue.c:10:
  In function ‘g_autoptr_cleanup_generic_gfree’,
      inlined from ‘vhost_handle_guest_kick’ at ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘elem’ may be used uninitialized [-Werror=maybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_handle_guest_kick’:
  ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42: note: ‘elem’ was declared here
    292 |             g_autofree VirtQueueElement *elem;
        |                                          ^~~~
  cc1: all warnings being treated as errors

There is actually no problem since "elem" is initialized in both branches.
Silence the warning by initializig it with "NULL".

$ gcc --version
gcc (GCC) 12.2.0

Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer elem ownership in vhost_handle_guest_kick")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220910151117.6665-1-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e8e5bbc368dd..596d4434d289 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
         virtio_queue_set_notification(svq->vq, false);
 
         while (true) {
-            g_autofree VirtQueueElement *elem;
+            g_autofree VirtQueueElement *elem = NULL;
             int r;
 
             if (svq->next_guest_avail_elem) {
-- 
2.37.3


