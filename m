Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6699D55F17
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 04:38:42 +0200 (CEST)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfxpZ-0005wX-KY
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 22:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <elohimes@gmail.com>) id 1hfxjP-0001Yq-Sg
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1hfxjN-00020v-Gl
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:19 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hfxjL-0001lP-C4
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 22:32:15 -0400
Received: by mail-pg1-x543.google.com with SMTP id f25so393657pgv.10
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IRZxfIBWQYVYbj7iYvlX3G7D8+JN2aZ0YIiAZvFz7kI=;
 b=ku+Uu4DY1q1G+NrrF4UG5WsLr7HSDTnS1CBnoHpdXnb/fLmjN+n5P6nALPs93ACScA
 8e7i8t/8rnwN/lm3psF1zJsL+UwgwMy3EuYgJbI28o0u/6cF/BCgmzRuv5NxQR2yc4dM
 NGtzUVfNaWE7zkyO7j6dqBFnVrjPtNRFYwl1M0J17YICXo+s4aRl2zJI6MQDc+r0extq
 ZRnrATH9q6q/9yOo4OP9V3VxTSqWnb2nY5f8bscD+rtivD3wfPqa7vf0H/Ie2Xmdvl0Y
 Pt0UqLtUGsfgFXf2vilh62MUNaQ02Wjc2n3hMMXABmex5hkQ22J3qoGTDqYmjPMr4gjy
 W6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IRZxfIBWQYVYbj7iYvlX3G7D8+JN2aZ0YIiAZvFz7kI=;
 b=qLHbRtaosvyJHaEH4B4OBB+bNdVqPO9K7c5L4FeoP1wv41XnLoknsQ6QVyIf9AnrgS
 6Ry7PU1DLjvvNiIsGHxmgBv8oyT0TEgcNpH3pHGd/OBE9Qd3SeJGDqCeEHuuUlgnnalp
 zA9OQJ1AS2Y0/L5JiX8qudBGTpWS2T+z/mAIkn14UIhEv1LzHVz8fJ3UNydBuUSSJU8c
 uy4InS2U59kyaT4vUXf4gIqpMOmCpHVRNnc0JGvTL04cuTRIaTgGVTn929GQh1RBtZBa
 vnNKULRyBCk3ocoGrdfxQwfOJbPaktRdazmKB5IhWU3rSAQKHeO84d3TqcFFoE8StxZB
 AH8Q==
X-Gm-Message-State: APjAAAVwG+WaPciFZm8cBhzjaJfkNLn1CNcR9jZjicJxRnnzRXtXjdux
 hfdGiPZLe5KoFO8kCrxerPc=
X-Google-Smtp-Source: APXvYqxh7ptZOf6BKv6W6talr2pQpF3kmDVD9d3OAyBG8JgePtIaA9nTC6D/pbgPx+p7WMFd2LtKgw==
X-Received: by 2002:a17:90a:3585:: with SMTP id
 r5mr1414694pjb.15.1561516325699; 
 Tue, 25 Jun 2019 19:32:05 -0700 (PDT)
Received: from localhost ([116.247.112.152])
 by smtp.gmail.com with ESMTPSA id 30sm341032pjk.17.2019.06.25.19.32.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 19:32:05 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org
Date: Wed, 26 Jun 2019 10:31:29 +0800
Message-Id: <20190626023130.31315-5-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626023130.31315-1-xieyongji@baidu.com>
References: <20190626023130.31315-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v4 4/5] virtio: Make sure we get correct state
 of device on handle_aio_output()
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
Cc: lvivier@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

We should set the flags: "start_on_kick" and "started" after we call
the kick functions (handle_aio_output() and handle_output()).

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5fd25d98a9..e098fc8ef0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1571,10 +1571,10 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
         event_notifier_set(&vq->host_notifier);
     } else if (vq->handle_output) {
         vq->handle_output(vdev, vq);
-    }
 
-    if (unlikely(vdev->start_on_kick)) {
-        virtio_set_started(vdev, true);
+        if (unlikely(vdev->start_on_kick)) {
+            virtio_set_started(vdev, true);
+        }
     }
 }
 
-- 
2.17.1


