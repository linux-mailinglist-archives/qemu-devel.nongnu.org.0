Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27439375801
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:57:27 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legNS-0006bq-89
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1legKZ-0004e8-I4
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1legKX-0007NZ-AG
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620316464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1TYecO7OlDlBB+U30rsy2ZRK3knYqYrbi9pI+5ME4xM=;
 b=RsMjyvyw6Spvs40O/50WnVFVkRWn9Ns4Lu727N8HEDirFYfi4EwpQbEDKbJ6P0668uTHdI
 8u0IA8ISlYVqUN4/qSZp3Xd3lzN3yd4ZIsDQRY2FRQioz+HwqcfwAaCpHUzTdVO7VJEMg8
 Nqbhi3XIqpsf/UbllqfrN+PDv78+NUo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ISKmC6NLMim51eirRxzS9g-1; Thu, 06 May 2021 11:54:22 -0400
X-MC-Unique: ISKmC6NLMim51eirRxzS9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a7bcf040000b029014daf4d9d3aso1448040wmg.1
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1TYecO7OlDlBB+U30rsy2ZRK3knYqYrbi9pI+5ME4xM=;
 b=fj27k0JULa2BbOQ2EzVXbU72hHRidAtw+rd1MWSTz6fT+mTilyv3fdwl3VX9s6tw7y
 7x0YZpcS3bbpGKp1BnEjafftNJwEc5K1rhYKqTSdik7LthB2eXZuorZIHug19IIpSD/v
 dq+ZenWUX6askqz2JqhrAA1l1hxt8AP5/hnRzonymVLuwYYu6yUdC1feZ2DQCnQdCxCe
 Lhrr5y7jefy6Opvu9NSimdqqNl+fY1ufCT7gdFHuMLJfWV/ZTqQeQudst4KHCCSf0TM9
 08TRzli69lZlbX7/L0HkrNdbWw0Vr+387rPbWnaXa3TsY2IP2A9bR+q9/9DZ+WXVB0lB
 64Ew==
X-Gm-Message-State: AOAM532xZVDC/Bjltk25B/geqgUftDgLU5Oso6DdEhSCTe0v8T/pDh8B
 NkgOQQpQKQuC6iKSxlEFWzDRx0iy18DzAET0yLvBw5t5uF0gFLFQnfbaLiDmFqEXt/gkC6sHPDh
 8gc44BE+UBJQDYZYVETAW+rTk6/QGObb0jg9AKIODWlkGTaapA6VfNW7TP0Vcb8jX
X-Received: by 2002:adf:fed1:: with SMTP id q17mr6322578wrs.111.1620316461306; 
 Thu, 06 May 2021 08:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwblOR93VUE3EKRugH9m3cxfdLzGYwwEFPzvjJbO1xQfkojA9vPRBrzl3wPHlDwcOKNn5/Oxw==
X-Received: by 2002:adf:fed1:: with SMTP id q17mr6322532wrs.111.1620316461058; 
 Thu, 06 May 2021 08:54:21 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id q10sm3855273wmc.31.2021.05.06.08.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:54:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-blk: Convert QEMUBH callback to "bitops.h" API
Date: Thu,  6 May 2021 17:54:19 +0200
Message-Id: <20210506155419.1796056-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Xie Yongji <xieyongji@baidu.com>,
 Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Chai Wen <chaiwen@baidu.com>, Li Hangjing <lihangjing@baidu.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By directly using test_and_clear_bit() from the "bitops.h" API,
we can remove the bitmap[] variable-length array copy on the stack
and the complex manual bit testing/clearing logic.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987e..25d9b10c02b 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -59,23 +59,12 @@ void virtio_blk_data_plane_notify(VirtIOBlockDataPlane *s, VirtQueue *vq)
 static void notify_guest_bh(void *opaque)
 {
     VirtIOBlockDataPlane *s = opaque;
-    unsigned nvqs = s->conf->num_queues;
-    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
-    unsigned j;
 
-    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
-    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
-
-    for (j = 0; j < nvqs; j += BITS_PER_LONG) {
-        unsigned long bits = bitmap[j / BITS_PER_LONG];
-
-        while (bits != 0) {
-            unsigned i = j + ctzl(bits);
+    for (unsigned i = 0; i < s->conf->num_queues; i++) {
+        if (test_and_clear_bit(i, s->batch_notify_vqs)) {
             VirtQueue *vq = virtio_get_queue(s->vdev, i);
 
             virtio_notify_irqfd(s->vdev, vq);
-
-            bits &= bits - 1; /* clear right-most bit */
         }
     }
 }
-- 
2.26.3


