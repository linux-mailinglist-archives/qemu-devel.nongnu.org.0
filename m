Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84621F7A4E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:05:10 +0200 (CEST)
Received: from localhost ([::1]:55164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlEz-0003y3-Nt
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2n-0007wy-3I
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46909
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2k-0001VW-P9
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPP6uVIK/72gmaaGLDDvftHafSRk3w6HEMlvs19A15A=;
 b=GjW6WUrwN5A+k0rIr7cxm2JoyVbCMhyZK+ucJsQfLe0EcNRItsZPiU04jSHTQjgmakbt/q
 P/dSEBBkdSXoVFKJsxG3GLqLEQGcB2v0hTZjNG7iT5XsR+f9LDuz36xhx/HzRZkI4GNru8
 TGroEfsiL2DVRil4TPZJcHHkuvEuzcQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-7_bIRhXmP7Sb27P70P2bVg-1; Fri, 12 Jun 2020 10:52:25 -0400
X-MC-Unique: 7_bIRhXmP7Sb27P70P2bVg-1
Received: by mail-wr1-f71.google.com with SMTP id n6so3999527wrv.6
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MPP6uVIK/72gmaaGLDDvftHafSRk3w6HEMlvs19A15A=;
 b=Qcz6qcsCuGO+94mcR22NxeyPHTwxBgiG0ZRMX9JcUxNCSqcMP94ZBJuY0kmpyjHJ3h
 h3MvYxojyKgQGKeH+4e7bMZQk6NEWnTpWJMla5wK2nF59sWwu/DhiVIY0ClWYHkdha8k
 Yanw2lACVLC0spF/7vqLHexSo1an2yKz+6SyKG84G062joXzVrE/mcX3WrxSo6PSM8K7
 pm+jW2v7FLpiN5d2V/VSAltVxXCI8TD4X4rvzGxg+iB5lwQMhiJfDMehg9V/F4gUtwvL
 08tbAAmDhTy4mUKkVTBavSzoCuENBbepiS3/btoWKhASnf1qby2Ou7iHSxuVsu6GOIkw
 sJ2g==
X-Gm-Message-State: AOAM530UeSGDGO+VLah8XXIMzCzsYy+0zk6LQ8dCJGUhYwaZQNX1CU1H
 kLllRouIayNBO7CzXSXJbCkvDLzLubtg0j6+K7JY/4KXpxuBubNQKz+zXI9HzU9eoKrjVg5J3LR
 mi91fRa9rko/Odq8=
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr14594303wma.83.1591973544077; 
 Fri, 12 Jun 2020 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkj06rbkNWZvdnA2dEzeo38FV6ISZCTjjnH8CLOkLLrDW96lYhASXA8vDJyOEftqXCMuhPIw==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr14594282wma.83.1591973543835; 
 Fri, 12 Jun 2020 07:52:23 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id 88sm11331100wre.45.2020.06.12.07.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:23 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/58] Add helper to populate vhost-user message regions
Message-ID: <20200612141917.9446-37-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:00:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

When setting vhost-user memory tables, memory region descriptors must be
copied from the vhost_dev struct to the vhost-user message. To avoid
duplicating code in setting the memory tables, we should use a helper to
populate this field. This change adds this helper.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <1588533678-23450-2-git-send-email-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/virtio/vhost-user.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ec21e8fbe8..2e0552dd74 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -407,6 +407,15 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
     return 0;
 }
 
+static void vhost_user_fill_msg_region(VhostUserMemoryRegion *dst,
+                                       struct vhost_memory_region *src)
+{
+    assert(src != NULL && dst != NULL);
+    dst->userspace_addr = src->userspace_addr;
+    dst->memory_size = src->memory_size;
+    dst->guest_phys_addr = src->guest_phys_addr;
+}
+
 static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
                                              struct vhost_dev *dev,
                                              VhostUserMsg *msg,
@@ -417,6 +426,7 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
     ram_addr_t offset;
     MemoryRegion *mr;
     struct vhost_memory_region *reg;
+    VhostUserMemoryRegion region_buffer;
 
     msg->hdr.request = VHOST_USER_SET_MEM_TABLE;
 
@@ -441,12 +451,8 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
                 error_report("Failed preparing vhost-user memory table msg");
                 return -1;
             }
-            msg->payload.memory.regions[*fd_num].userspace_addr =
-                reg->userspace_addr;
-            msg->payload.memory.regions[*fd_num].memory_size =
-                reg->memory_size;
-            msg->payload.memory.regions[*fd_num].guest_phys_addr =
-                reg->guest_phys_addr;
+            vhost_user_fill_msg_region(&region_buffer, reg);
+            msg->payload.memory.regions[*fd_num] = region_buffer;
             msg->payload.memory.regions[*fd_num].mmap_offset = offset;
             fds[(*fd_num)++] = fd;
         } else if (track_ramblocks) {
-- 
MST


