Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E227B379821
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 22:09:12 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgCDI-0002hz-0q
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 16:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCO-0001H7-7e
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCM-00066v-Ko
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620677294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZ/Rh00bbSJXCAJmQZlicOzVjHxFbE+L7BQwV2hTVDQ=;
 b=YyZ4qNGZSw+xZozR4GoLZ+C4OkDQOidh4FITOVfS6JoTg+xjBwC4aWGruULaH6YHMfVGcQ
 HqueLji4CBmnihWboIUKBerDpnzRyULb/1G+OXd4W69LkaaTExz5d9X9tkspJEPRnjSSQZ
 D1z0chWhv+sSVaV32nqzIDVXUia1iMA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-6e-OxYOVO62oFJHkVn_GPw-1; Mon, 10 May 2021 16:08:12 -0400
X-MC-Unique: 6e-OxYOVO62oFJHkVn_GPw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d6-20020a0564020786b0290387927a37e2so9597505edy.10
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZ/Rh00bbSJXCAJmQZlicOzVjHxFbE+L7BQwV2hTVDQ=;
 b=Ipx9n7jZ/k/mcyriucyLOl8nt9EtcTInPpkF811Cv3UNHI2A2B/RVnXOUqvZj9jn/e
 s8hf/yC8FiQ4XA08u8C7QJ517WMLjwq45zXgE9Gi9uykSY5HjMADD19jPXh4AsLfjJiy
 5HniUDT8dabrbq77GXu8WY2XLJnmAxuoYEH15iBQizT9g3coXTVNgFZQlBy7Kh74gkvp
 2g6Lw/L3ZtSTZAZD9bVgmsb0wo4GlK6rCk5MmybrQcsKEd6OVW3hLSCjhS/JXhw1n/MK
 yKMXvzSVA3901L1qR5NbicpSfupDid9yTzM8sNjgoh7M0DtZxIGT/cizoGEDFDcbvHU6
 7ZkA==
X-Gm-Message-State: AOAM5337dHKK02xWQfxGtuY3sC71fj02UAa8gF6KgEf/qLhtLqEy9c9D
 Z5iNCZyEZl80Z5fjrPISAYUQYms1taBVc/BFGnqDVdSa8CtJBc7ops1VZs/F4JTLpeia21/drc9
 b6FERw8f6UDaZFCOtA+bZEFohXUliMPeQy8U6/f5a7EWJEajBkV7f8kG0D6L/0e2q
X-Received: by 2002:aa7:d1d9:: with SMTP id g25mr32577760edp.30.1620677290673; 
 Mon, 10 May 2021 13:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy90ilun4fbJ6qxwkOV4ZaHv7fKHOsZzvLF0GVL1/6vt8Aki6QixpcYDoXD110pGM1ObTsVzg==
X-Received: by 2002:aa7:d1d9:: with SMTP id g25mr32577727edp.30.1620677290518; 
 Mon, 10 May 2021 13:08:10 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d18sm9900402eja.71.2021.05.10.13.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 13:08:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h" API
Date: Mon, 10 May 2021 22:07:58 +0200
Message-Id: <20210510200758.2623154-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510200758.2623154-1-philmd@redhat.com>
References: <20210510200758.2623154-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By directly using find_first_bit() and find_next_bit from the
"bitops.h" API to iterate over the bitmap, we can remove the
bitmap[] variable-length array copy on the stack and the complex
manual bit testing/clearing logic.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987e..a31fa94ca33 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -60,24 +60,14 @@ static void notify_guest_bh(void *opaque)
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
+    bitmap_clear(s->batch_notify_vqs, 0, nvqs);
 }
 
 /* Context: QEMU global mutex held */
-- 
2.26.3


