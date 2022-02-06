Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CE4AAEC0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:03:37 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeOO-0004RV-VU
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:03:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzu-0000DJ-QD
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzo-0003fa-5w
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMY8xR93DQQSXRTh9cIog6ZkSuUw4ea/EPUUeaxLWQ8=;
 b=GNPmD85euDZqyVlA8JfIv0ZkHLO313Y0K1XhmzFTP9Z+TzrUUQw9Z448YwF1Pwj71Ar+Yn
 A1o4/MI+Rjq8an1cmz+Tw+U8uQEVQfUcdzIBmaHiWU+tn3R366DzIW6zQjwy9TOYfVPJTn
 gvSQAVN57Cf7Wj7yr1ajlAKFuTW39ZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-IfAQe1qVOleG0EFg6GEiwg-1; Sun, 06 Feb 2022 04:38:10 -0500
X-MC-Unique: IfAQe1qVOleG0EFg6GEiwg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so10258187wms.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FMY8xR93DQQSXRTh9cIog6ZkSuUw4ea/EPUUeaxLWQ8=;
 b=k0qTRF7JyHNypIT973ndpjSA2SyKF0vwa0JXKaghVeZn8ZCsU6nmbmvOz/YJHK8EVj
 QLwR9Hv3kAIoMaj0cYYM4dlauVltz+nZt5q7hNllrHIAsgMFTBPO3kFkC+7wYKF4OQ9p
 opsAZijhDc9ePZQWTzrqAC08gQZjAm1Gjhe/4T3W2/0q+wI3Vc6ogUpj54/g2e4+rB5U
 LKDJRYuToTQ+Wvmx8UtWzP0N8d+vMAHAtU3sffDI1Em2fvvcYHcy24YCCMV5VtDQnN1y
 gXOni+Zk0EtaEID7qcmwlzfAaT2UN64UyL47zymTbfD25rnyg0qHw5gVPvSZVgifk9oo
 mlXw==
X-Gm-Message-State: AOAM531N+UVcTsBwVaiNQKKgUSDvqxwCU3AwadgLHeD67RhPDYOBTF05
 6jzPFb+gT4dlEL+mPM9t8RDHPr5oRB+dMFXDAUiS9pKTCB7aMZK7HIGS9mvjj+yR6/x45ZPQ4Ka
 UfSgtAwZjzWzXgFJKuRHmTybycIlzjt1URhRt5Jwqo3HbEZPwjJjH0xjsYZy5
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr5945702wry.585.1644140289318; 
 Sun, 06 Feb 2022 01:38:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQesS3uYwSKU85LrBMRrj8fTsTDlP1Fx2QS6RSYM8TH5nbtEO+qDz4/RtiZD+yT+1Mk/r4yQ==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr5945684wry.585.1644140289131; 
 Sun, 06 Feb 2022 01:38:09 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id q140sm3482835wme.16.2022.02.06.01.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:08 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/24] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <20220206093702.1282676-9-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Raphael Norwitz <raphael.norwitz@nutanix.com>

Today if multiple FDs are sent from the VMM to the backend in a
VHOST_USER_REM_MEM_REG message, one FD will be unmapped and the remaining
FDs will be leaked. Therefore if multiple FDs are sent we report an
error and fail the operation, closing all FDs in the message.

Likewise in case the VMM sends a message with a size less than that of a
memory region descriptor, we add a check to gracefully report an error
and fail the operation rather than crashing.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-2-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h |  2 ++
 subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 3d13dfadde..cde9f07bb3 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -129,6 +129,8 @@ typedef struct VhostUserMemoryRegion {
     uint64_t mmap_offset;
 } VhostUserMemoryRegion;
 
+#define VHOST_USER_MEM_REG_SIZE (sizeof(VhostUserMemoryRegion))
+
 typedef struct VhostUserMemory {
     uint32_t nregions;
     uint32_t padding;
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 787f4d2d4f..b09b1c269e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -801,6 +801,21 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
 
+    if (vmsg->fd_num != 1) {
+        vmsg_close_fds(vmsg);
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - only 1 fd "
+                      "should be sent for this message type", vmsg->fd_num);
+        return false;
+    }
+
+    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of at "
+                      "least %d bytes and only %d bytes were received",
+                      VHOST_USER_MEM_REG_SIZE, vmsg->size);
+        return false;
+    }
+
     DPRINT("Removing region:\n");
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
            msg_region->guest_phys_addr);
-- 
MST


