Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE102B39F5
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:42:50 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQjR-0005Tx-EI
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQVA-00011t-FE
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:28:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV8-0001b4-E2
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNBQehzeHZf620Wy5iH4Q5itvrw949b87YQTXO/Cb1Q=;
 b=YMwZLuXUxWbpvfuK1s4EF20+j8xQ1smv9G8H3nvmJ9gZAWS4ZCGFJVIKh+cUadVp+qnvSD
 y9f5pnkJVXTsbyqyfiHSHL6W6MzAnIFkCVQBTfzlLMv+SpLFroWmRCORCLYlO2FkQn5/Kq
 iiMBDm2XOsiU6gTtOngt7qf6IioQ0f8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-1aTfaOptMGiQCmTNfMb91Q-1; Sun, 15 Nov 2020 17:27:57 -0500
X-MC-Unique: 1aTfaOptMGiQCmTNfMb91Q-1
Received: by mail-wm1-f72.google.com with SMTP id g3so7739433wmh.9
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jNBQehzeHZf620Wy5iH4Q5itvrw949b87YQTXO/Cb1Q=;
 b=Bujb3wPSgGjTrQAvQGgABOTjnOXy6TQn29MYO4yu5WORRfaHPsJSHpaJpNaKqRu65Z
 7AYSslLQ4HaxmRWdDaZHXoZ690aOuDgO75nYt7mEVLtKEBMnK1pGpep2kWIXLQPlZA4A
 5G769zzSIz09Usmu3QEdyB1zCqVU3BPcyEsKRsjeOFNy/A9z9Undq6M9CPb9jmYBdQPg
 g+PB7BrDhy/ZBjbKPXT6HmqdvHq0s9ept664YXHTg/eS6aAOx0Dwq8qZGsteoX7GZKpe
 XG11oEaFwZX3ME2E4NJ5suGD0U+qL8BBnh/QrZyhTowOijDALCvBh45fTEfywfc+eHWp
 qWqQ==
X-Gm-Message-State: AOAM531P+oWODztdvYRC+dtoQ4ulUoVIoc1RZfOYLbAcImCfHcheMV2+
 ucQJVGrK5/jO/B/AxoEXa6trC+5wU23fNd3T3fDJ/GCyhS1Ml+9cTsNS0lsdm20vamWnfh18Xv7
 CYWZCQjH71/gWFQV6+n2Bi0yB559w135ojOz/lMup5msiKDyuPg0Vb/PEvlG0
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15863237wrt.218.1605479276185; 
 Sun, 15 Nov 2020 14:27:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpsgZiqiK1laYk3oa6PqbMLPx9gxEVcNdVQ/RxWq7EoSXmFX2yo1ZT5ZmwSC8nlvqK2CUDkA==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15863215wrt.218.1605479275970; 
 Sun, 15 Nov 2020 14:27:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id q5sm16382583wrf.41.2020.11.15.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:55 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] contrib/libvhost-user: Fix bad printf format specifiers
Message-ID: <20201115220740.488850-17-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, AlexChen <alex.chen@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <5FA28106.6000901@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index bfec8a881a..5c73ffdd6b 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -701,7 +701,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         return false;
     }
 
-    DPRINT("Adding region: %d\n", dev->nregions);
+    DPRINT("Adding region: %u\n", dev->nregions);
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
            msg_region->guest_phys_addr);
     DPRINT("    memory_size:     0x%016"PRIx64"\n",
@@ -848,7 +848,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
     VhostUserMemory m = vmsg->payload.memory, *memory = &m;
     dev->nregions = memory->nregions;
 
-    DPRINT("Nregions: %d\n", memory->nregions);
+    DPRINT("Nregions: %u\n", memory->nregions);
     for (i = 0; i < dev->nregions; i++) {
         void *mmap_addr;
         VhostUserMemoryRegion *msg_region = &memory->regions[i];
@@ -938,7 +938,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
         return vu_set_mem_table_exec_postcopy(dev, vmsg);
     }
 
-    DPRINT("Nregions: %d\n", memory->nregions);
+    DPRINT("Nregions: %u\n", memory->nregions);
     for (i = 0; i < dev->nregions; i++) {
         void *mmap_addr;
         VhostUserMemoryRegion *msg_region = &memory->regions[i];
@@ -1049,8 +1049,8 @@ vu_set_vring_num_exec(VuDev *dev, VhostUserMsg *vmsg)
     unsigned int index = vmsg->payload.state.index;
     unsigned int num = vmsg->payload.state.num;
 
-    DPRINT("State.index: %d\n", index);
-    DPRINT("State.num:   %d\n", num);
+    DPRINT("State.index: %u\n", index);
+    DPRINT("State.num:   %u\n", num);
     dev->vq[index].vring.num = num;
 
     return false;
@@ -1105,8 +1105,8 @@ vu_set_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
     unsigned int index = vmsg->payload.state.index;
     unsigned int num = vmsg->payload.state.num;
 
-    DPRINT("State.index: %d\n", index);
-    DPRINT("State.num:   %d\n", num);
+    DPRINT("State.index: %u\n", index);
+    DPRINT("State.num:   %u\n", num);
     dev->vq[index].shadow_avail_idx = dev->vq[index].last_avail_idx = num;
 
     return false;
@@ -1117,7 +1117,7 @@ vu_get_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
 {
     unsigned int index = vmsg->payload.state.index;
 
-    DPRINT("State.index: %d\n", index);
+    DPRINT("State.index: %u\n", index);
     vmsg->payload.state.num = dev->vq[index].last_avail_idx;
     vmsg->size = sizeof(vmsg->payload.state);
 
@@ -1478,8 +1478,8 @@ vu_set_vring_enable_exec(VuDev *dev, VhostUserMsg *vmsg)
     unsigned int index = vmsg->payload.state.index;
     unsigned int enable = vmsg->payload.state.num;
 
-    DPRINT("State.index: %d\n", index);
-    DPRINT("State.enable:   %d\n", enable);
+    DPRINT("State.index: %u\n", index);
+    DPRINT("State.enable:   %u\n", enable);
 
     if (index >= dev->max_queues) {
         vu_panic(dev, "Invalid vring_enable index: %u", index);
@@ -1728,7 +1728,7 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
         return false;
     }
 
-    DPRINT("Got kick message: handler:%p idx:%d\n",
+    DPRINT("Got kick message: handler:%p idx:%u\n",
            dev->vq[index].handler, index);
 
     if (!dev->vq[index].started) {
@@ -1772,7 +1772,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
     DPRINT("Request: %s (%d)\n", vu_request_to_string(vmsg->request),
            vmsg->request);
     DPRINT("Flags:   0x%x\n", vmsg->flags);
-    DPRINT("Size:    %d\n", vmsg->size);
+    DPRINT("Size:    %u\n", vmsg->size);
 
     if (vmsg->fd_num) {
         int i;
-- 
MST


