Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5C5AF218
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 19:13:50 +0200 (CEST)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVc8z-0007L3-0l
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVc79-0005Hy-Sq; Tue, 06 Sep 2022 13:11:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVc78-000767-8v; Tue, 06 Sep 2022 13:11:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id y3so24858582ejc.1;
 Tue, 06 Sep 2022 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=iCbl2Bo2GGqi8Q4D8vzanf/Dko4W88sy8tL+zZ0DhEg=;
 b=LaZ2A5AAicTwvocspPFRUF6axWFnT3zattyvbPJGsjtM0W1asDifOfgbBvNk1mQiB3
 utdzkmu+BwCbMwcRFkVvmGjgx4hosCM5OO6GCL3aZ+feNK/jeKxH/zqH0iFdRyY4oloG
 goHLuRa+0YLNT+5edJuE2J1wkgZKnSukLIoOigxczVRum59ca+HCq2WE9HG3ppfrh2av
 u8rTvvYB5DnrErwf4Xet/8WjndBIpxQ1GnuSg+lVAor1/ajCjeExmjuLiLi2pUVs+rtU
 KSw0robA6sMrKTCzodYM/eZyLAJFYYwq2z6hnguMKIG3kCr8xvINNp3Ewo72R075TzOn
 emyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=iCbl2Bo2GGqi8Q4D8vzanf/Dko4W88sy8tL+zZ0DhEg=;
 b=7y2ubecmAPHnDTQe+qPU+RXvwW38KXjOP/psGhUbP1nm8/EkiigFc1llpfTYWRkUAe
 d4UxNYRILjVG8AJxdI5KHnXFKYbWm1P0ksCUNiWwa6D6dfK/4DFP9e2REB3gF3BZEU9Q
 3pagBE/BId1d/RIvvawNaXL+5SNOnlyh8/6wSGtlfjvZEwoyvvRNuVHeU4woMinrfUJX
 YCQaLbZ1EfxpdeCDL8RuoPzm2lX+Z0QWBodvgKPUd8Tp/MQNfQVRDpUrFfAG35vjzLLm
 4TSLyNSPF5zvFBjNWdhqLC3uw80h29DJoVX3WCGDUXqTO6rHzzwotMwOtaygFvYdjeZ6
 V7MQ==
X-Gm-Message-State: ACgBeo2vzagvMEpwFtAqgxYZ/Azd5nMFfmysd2lknT4jlYMF76sPzObj
 KYwnh3yxkv4cGx3uZwTqosHp3mY5rL8=
X-Google-Smtp-Source: AA6agR5h2rlcKoFXUJbAmgDLfvF6XQWGarBh76l5l0gpfe5vJpwIYoL3WZicOYLyde+jJZQa2q8rlw==
X-Received: by 2002:a17:906:cc5d:b0:741:38a8:a50a with SMTP id
 mm29-20020a170906cc5d00b0074138a8a50amr34555160ejb.650.1662484311198; 
 Tue, 06 Sep 2022 10:11:51 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-188-175-122.77.188.pool.telefonica.de. [77.188.175.122])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906218100b0073a644ef803sm6979657eju.101.2022.09.06.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:11:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Date: Tue,  6 Sep 2022 19:11:14 +0200
Message-Id: <20220906171114.14839-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

GCC issues a false positive warning, resulting in build failure with -Werror:

  In file included from /usr/include/glib-2.0/glib.h:114,
                   from /home/zcone-pisint/Projects/qemu/src/include/glib-compat.h:32,
                   from /home/zcone-pisint/Projects/qemu/src/include/qemu/osdep.h:144,
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

Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer elem ownership in vhost_handle_guest_kick")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e8e5bbc368..596d4434d2 100644
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


