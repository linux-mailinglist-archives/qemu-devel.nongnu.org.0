Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546042D643
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsye-0004F3-E4
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:26:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <elohimes@gmail.com>) id 1hVsjn-0000c8-A5
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <elohimes@gmail.com>) id 1hVsjm-0006SS-9J
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:11:03 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33772)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1hVsjm-0006Rm-4Z
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:11:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id g21so673082plq.0
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U0Mx+YreHQRLB91RmN0bCzlScT5GPJ9gYEH0yygk22I=;
	b=Yh8u7qAa+gm1IgAdJvgF+dQVqowHj+EIH/1ZcE6ssV/lKulMZ0mWCuoGD1iX/3F1OQ
	w1uxWPtvrPIC1HRk6yidkJyJk+xK3NPVQGar2qqQ8GqYOPDnm+Xuvo/OO/ESmwObCwqB
	ksLvdUD5bx213A2uy0NSJ1R0EMB223Dultb2IKtks97LNPsOVp/aGFEZl/zb0rWcHqC+
	ybIpuVpbxmODClIGSBVjXTX+nvdVEjg8Q//EVlPVwmnccdkBGCDbw+6yKPgcK9riuYG1
	RdjM9J9axFDqEmM6sJXuz15FNU5ZSewlWvqrthABshy0x01lvlKOS/usC3ayveg2m5ni
	Ir3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U0Mx+YreHQRLB91RmN0bCzlScT5GPJ9gYEH0yygk22I=;
	b=HKUNHvlHOWfg1C8N6eRcK/h5uSRISTRyCzHHJxZwNHtPpfMnsQ+7ZqZrXWhJI6b0o0
	B0+HZhsK9SDsU2mcYHxcBy0YJnztujzjsMoeURtcPL4BBPeEZhDwkPEPe9bODkf4O7VZ
	Dqf3cmtP9HS0oB3F5qIK6YfErKr9DpT1laSE5YDSWZ9QQLn9EM7v5Yyq/dZ261AVVrOA
	oBkskwGuBvXvHLp2kwqVN8eUdu/I1NycNAGZZEzWTG5xrejsapa5tgovcu1OOI9pdftB
	khhUo3AddxVc+/B7iF2sEoncHudGqQJbTYwxOdJMLsHU3rlQTjZB1Zgdycw+qoknzxYm
	Nz3g==
X-Gm-Message-State: APjAAAXI7nG/4d4MetR9zDwojSmAiQcBwSYkUAbyrC+Q23VqEW09CpdY
	WGtuIkADA5dKCnANLWABG9G6DQQW
X-Google-Smtp-Source: APXvYqzKOGBL90ccywgTotQmecQj/JHDq3LGi8Lm9hVJuY0jvjyQhbz1wxtW1n5kCc41CQHHLcto2g==
X-Received: by 2002:a17:902:2947:: with SMTP id
	g65mr118403751plb.115.1559113861345; 
	Wed, 29 May 2019 00:11:01 -0700 (PDT)
Received: from localhost ([116.247.112.152]) by smtp.gmail.com with ESMTPSA id
	n12sm15493682pgq.54.2019.05.29.00.11.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 29 May 2019 00:11:00 -0700 (PDT)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	groug@kaod.org,
	dgilbert@redhat.com
Date: Wed, 29 May 2019 15:09:53 +0800
Message-Id: <20190529070955.25565-4-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529070955.25565-1-xieyongji@baidu.com>
References: <20190529070955.25565-1-xieyongji@baidu.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH 3/5] virtio: Make sure we get correct state of
 device on handle_aio_output()
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
Cc: Xie Yongji <xieyongji@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

We should set the flags: "start_on_kick" and "started" after we call
the kick functions (handle_aio_output() and handle_output()).

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 hw/virtio/virtio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 4d4ff67791..8a81374492 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1575,11 +1575,11 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
         event_notifier_set(&vq->host_notifier);
     } else if (vq->handle_output) {
         vq->handle_output(vdev, vq);
-    }
 
-    if (unlikely(vdev->start_on_kick)) {
-        vdev->started = true;
-        vdev->start_on_kick = false;
+        if (unlikely(vdev->start_on_kick)) {
+            vdev->started = true;
+            vdev->start_on_kick = false;
+        }
     }
 }
 
-- 
2.17.1


