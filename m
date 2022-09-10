Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4AF5B473F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 17:14:31 +0200 (CEST)
Received: from localhost ([::1]:37224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oX2Bi-0004Y7-CX
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 11:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oX29I-0001S4-LC; Sat, 10 Sep 2022 11:12:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oX29F-00047B-30; Sat, 10 Sep 2022 11:11:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id v16so10563634ejr.10;
 Sat, 10 Sep 2022 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=I+GXoMtsvnMhLgL7ULYr+soHxCdrKX4pcoCICaaAZxY=;
 b=fu1qhQkwUVq2N2o+Q8XHgxd349FeNdrrRJvG83oLq5mFBkWKp/FiVa0ho14lN3Emfx
 JhUKGZZP7doEZutFppP19QP6+VGZMbEvJpuu89xD+h0WQQyhRB1rUGvYhljfBVajDkwK
 rCdxu+X/cE7ld1R6SfKxeW6WdnQNJM41OCyrnwi+L8YpP7PvoTG4iQmZAeqiTBPkEcfU
 VZ7pWse460l2aasaNu0sksI7iuhNMzU8oPwBYDDWQ1jUN7iZUSy8DkkPutHRm763QA44
 F0u5bcYVwsGSUYTMwtZ/WlD62u7nGSZmb9BMgSoxqeraJodvfm4++8XdWwR7VSrYrGnt
 yyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=I+GXoMtsvnMhLgL7ULYr+soHxCdrKX4pcoCICaaAZxY=;
 b=W84t1FicMpij5UuNQnB5qJkOsshwoGknK7qU/QRXN7YM+6GZ7TbT11h3hPpw0Y6iUu
 Ha9GqptjsBpCxDNjhm7SySBko8iEqySqukcJJIhx1JQEerqTWaGxzswuujbBlHoFwvGe
 t80dB2yJTihd7FourAPMrckvdmzvZDbCbCfHiVtAj30zbgyIdHM1pFAvp9W2V7QQWyIE
 G5jE0abcMSs5TSQjuTHLEduLG294NXQv0zgtxKugduVnRDIJxpd2a2lkTY4s+P5XtGw0
 05TnJflPy4L1Nsb0m1XKX0CC9rHsRfKHCZns9LNkxMX4Qce3uH7wtd9kEbenVw/njHTe
 qcDw==
X-Gm-Message-State: ACgBeo11deZVIE9DBFbw1gyRHpgxrDUXNzuu49vUFmKk37rPcQvYiNyK
 3Q7NOC2yGHwVzuy4q8MALm7PU6sxcDk=
X-Google-Smtp-Source: AA6agR4p5d8qs+4UEBqPFApBAZh+Zc0TzC+izCinlGXFWzzy41u0GGZiNa/TPa2waZSQqTBlLxPHOg==
X-Received: by 2002:a17:907:2d23:b0:730:acf0:4907 with SMTP id
 gs35-20020a1709072d2300b00730acf04907mr13508906ejc.700.1662822713807; 
 Sat, 10 Sep 2022 08:11:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-012-029-149.89.12.pool.telefonica.de. [89.12.29.149])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170906768f00b0077826b92d99sm1858968ejm.12.2022.09.10.08.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 08:11:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Date: Sat, 10 Sep 2022 17:11:17 +0200
Message-Id: <20220910151117.6665-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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


