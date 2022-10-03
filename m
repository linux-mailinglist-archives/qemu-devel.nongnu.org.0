Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34A5F393C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:42:10 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofU8X-0004R7-LZ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofThM-0003CH-4o; Mon, 03 Oct 2022 18:14:04 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofThB-00069t-AL; Mon, 03 Oct 2022 18:14:03 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4384-1ofTh52cYy-0000OB; Tue, 04
 Oct 2022 00:13:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/8] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Date: Tue,  4 Oct 2022 00:13:38 +0200
Message-Id: <20221003221345.1324140-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003221345.1324140-1-laurent@vivier.eu>
References: <20221003221345.1324140-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d6qcJAaRRXqlWlgF4rkO0jCOlH/xs9Vp+9OWhZsbKDKEXx/9wT4
 hQbynoNqhSozS39Cp5UzbGekCNLpv/jsaTN1n04qg7m7eHrv0CDLoPJGoIwHDrdZg7xVSkh
 NENk8FLxiWpid1IjP72k8ptulfHFPOq6r5fS7/fCMIKI4oryNA9w+Ip5S3WV8S5lOKHUOMh
 QyQGqvPGz6CjHWKSq9d5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MKXYLJFRk8A=:awj5qvlWYYUXbqRV9XuTjK
 QvXf0AZ0Ao3+tatlRldt78FkpqEjm1e3txhYadABkBqmHuV61yq9z1yOmaNljMzzezXyosT8B
 B1z0+bPslnsq/lDVAbT7MPashKUZmxaDrA/iP+OvPU/LuZoVh3ZCiYCUAah00pQSlUzfmFaUi
 A0QNz1r5I9zoosJ2h+ktS1NydVfsBYLJ9Yikf4lrN0k+l4jo+sxUqv38SYL91KyzhMJwJ1nk+
 nL8Zo75GnT3Nho3lv+/GJp6Zq8vTYnaf6Kh6FGJiz2L5zggMHhTBYXj37HD3fmyVzyzsUaClB
 n0MWkLnf1/5b9poq1cFdiCikoJY0I3mjzVEeZ805TQi2gIPfhVXGiDyO63bL6p1gX6o5bDKkv
 7AV+BLN9GH/mhgNohlivOQ/ZirU2t3KGrczoYMhbbVISyFnNC9300tl5QJOIVj5byLmaQrxBK
 L4iDPIe5E8cW5IMXhAKXzMEHxAnuXqVckY9EzieWD7/a0Wjrd/hIq9ixJcocz0PIBJOXxIKNj
 DOOeKDoekbOO/dLbfEwlY/khIX6l0bIt6TPnCbQu2NJGqqC7AowG9F6v/oWeErafv/+ro2Opk
 R3o/eTd1USZkwPggFh2e8wRgQqFcxFlGdpMWQ51gKAJ0d1yRbpX/4RRDUXd/mXlMOuSW5Kzj7
 lIyngeBnTF7GUiyU61jdmO9OYiAWJ0z4GO8RcLq/m74rr/t6Bt/+PacrAg3Ca4JyUC2ovMTtN
 ycwF4rCErKHrknawHbjV/Rkrvsh78b3BtLVuccolyVy1LL/tggHIiphDpej/6Xf2W6e+ff5E/
 lZnDlLa
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


