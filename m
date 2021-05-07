Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7970376951
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:12:23 +0200 (CEST)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf41W-0007Hd-T8
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3wS-0004D3-O9
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf3wR-00006e-99
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620407226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF0iLHO9qwO1+viQOX3X84axSRQvXosTSjRjqMFTfsA=;
 b=UXAyQBQw0QlorJq+FiX+tzvbZGyfRWjNMqBYmbhM23cMQ743Fyzb6vDObriF2Q/771Ybct
 GiwGaIoI6p5nNtJfA8/sTq4W3ztCfRREk2Pu+QH+tYAM3YYlGFYQvfYOD8aIaMdUir5dak
 EOTVIOwmfNwlXAaLB1IvecnMY2V84m8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-vsa4iV5fOQmUj75mNQTk_Q-1; Fri, 07 May 2021 13:06:48 -0400
X-MC-Unique: vsa4iV5fOQmUj75mNQTk_Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso3836831wrf.11
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TF0iLHO9qwO1+viQOX3X84axSRQvXosTSjRjqMFTfsA=;
 b=K63NRbkmi5okzIrD1i8VDM4fMcjeOzGAucYddimW0YNMhMYkxaXd6oQh0wtfAtBOQQ
 ZZqGSLI3LPpSGNb6789CoCceGHKuOhLNjc6xMr15yIt6AtYyaakL2wzwKn6939LuxIS2
 GeHIjVQ0PaqXs029trwwydJUPysMAMEYtG6c/QgGWoYi4OPRV59ghLLNhUbZiVXblqqr
 lOV3NuGbyfiwKH0sAy3RyVd2kb74HDuIMFEr3oebEn5pYs2l8fi+z24cMCIGMwAvozkk
 fGwduUUEUZqeR0D6SwOznkhB3w1Jbsgz2FpiP/VNYtlnbPsd2w5bYYLGXkM2yGdwpeiY
 3I2g==
X-Gm-Message-State: AOAM530+2QZ+XjlNmkMJuw2r1nLAoHEDurcoasDgQa/QR9K0j4E7xF8p
 RDSu69L2p16jRWBR0pjObPWBzq5f0jRMQCh6P8gQNKpoweJcv2kRJCrroCmsvw1QwdJNO7SfEx0
 J0tPUTXdDOUydejPyqJbFyO/ZjfcokGty2JMiHFrOn9OpLM69+T9LuOmaE1jdBVLN
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr13506915wry.155.1620407207402; 
 Fri, 07 May 2021 10:06:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbf9ADvINobrWZo84yL0kff1ES6G2m/29bDAW0KEuwQL1PbIpPAdj/kGaXO7JdC9CfRf1N6Q==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr13506869wry.155.1620407207018; 
 Fri, 07 May 2021 10:06:47 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id o13sm8369179wrf.91.2021.05.07.10.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 10:06:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h" API
Date: Fri,  7 May 2021 19:06:34 +0200
Message-Id: <20210507170634.2058801-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507170634.2058801-1-philmd@redhat.com>
References: <20210507170634.2058801-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By directly using find_first_bit() and find_next_bit from the
"bitops.h" API to iterate over the bitmap, we can remove the
bitmap[] variable-length array copy on the stack and the complex
manual bit testing/clearing logic.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987e..a7b5bda06fc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -60,23 +60,12 @@ static void notify_guest_bh(void *opaque)
 {
     VirtIOBlockDataPlane *s = opaque;
     unsigned nvqs = s->conf->num_queues;
-    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
-    unsigned j;
 
-    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
-    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
+    for (unsigned long i = find_first_bit(s->batch_notify_vqs, nvqs);
+             i < nvqs; i = find_next_bit(s->batch_notify_vqs, nvqs, i)) {
+        VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
-    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
-        unsigned long bits = bitmap[j / BITS_PER_LONG];
-
-        while (bits != 0) {
-            unsigned i = j + ctzl(bits);
-            VirtQueue *vq = virtio_get_queue(s->vdev, i);
-
-            virtio_notify_irqfd(s->vdev, vq);
-
-            bits &= bits - 1; /* clear right-most bit */
-        }
+        virtio_notify_irqfd(s->vdev, vq);
     }
 }
 
-- 
2.26.3


