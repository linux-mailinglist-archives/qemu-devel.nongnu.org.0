Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22B2B5BB3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:22:15 +0100 (CET)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexBm-00072P-E4
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex91-0002La-Id
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8z-0006Ts-LX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jNBQehzeHZf620Wy5iH4Q5itvrw949b87YQTXO/Cb1Q=;
 b=Qmk9oKfmZXtwjPGRlZ0ql2hsC8Ab/2jN3JceG8NGIRrhRh8oMulFaKPGLVr91fwDDz5tnU
 I1PGb3dFU888LQS0c+hfPY2FKCoXw0sUXrKj9MgHYg96GuxNzz/xl7FVR9NxV1m0gCdZez
 FQeEK9CZWK91pc9ud1CPS8Co4Uahgcw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-9RF2IJVROPOCSJGRV-_6VQ-1; Tue, 17 Nov 2020 04:19:18 -0500
X-MC-Unique: 9RF2IJVROPOCSJGRV-_6VQ-1
Received: by mail-wm1-f69.google.com with SMTP id a134so1235026wmd.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jNBQehzeHZf620Wy5iH4Q5itvrw949b87YQTXO/Cb1Q=;
 b=j2ao+idRQH9J1fnoi47WUltq4oZL3/Wwe7hDNa2Nl8LF2GV21U43k0xkYp1xLPDlqO
 raWQrWuzPRfImlY43o82Lh6x3pVHyVYdE0fqmjiq8uV91EezcTv6+FrjSmebiRnYtNrT
 /QoG/ms1FXq2kedgQZk2E6t/QLemFNSNbxpr/PPzBRXGxELUZgssmbe/MBJjW9dwLVje
 4OMeQzoZKUcFfgql4Y44zHhUQNup9GOjYHgOiSrGfEJts7LnUffsFVJzvfDFKHgwUI1p
 C3hU37f2nC7OHYJCIIy42tjZUybNzFA3dik29mBgz1o81vpvJoX5BMuPa+opxY1n3MdE
 bImA==
X-Gm-Message-State: AOAM53235gBLqAM5TNNu0fGirA4OYn7f9WB/TsovyZCXbdDz/SYtMBfh
 gcLa6+fW7S+2W4ozmaiTH6WELhqIKvIFIdifPc8XlNDC+KYR0nLQu4GiCUxv5Mg6+dLGEmWsUKU
 2ZBzO7dlJR9kfhP1ycG58MsT6+VJCo1NNTcvFsBlWrR/S/g6Q+8gCx9N+QZZc
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr3255843wmb.139.1605604757126; 
 Tue, 17 Nov 2020 01:19:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfzE6nH8wlOnuO82mxdNeFL9rfIzxsDp4G9ZFaT4cLGzHDYYJlVbnrHl7Qr2XSOqgsqWJ2Rg==
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr3255820wmb.139.1605604756884; 
 Tue, 17 Nov 2020 01:19:16 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id e3sm10105864wro.90.2020.11.17.01.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:19:16 -0800 (PST)
Date: Tue, 17 Nov 2020 04:19:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 6/7] contrib/libvhost-user: Fix bad printf format specifiers
Message-ID: <20201117091848.695370-7-mst@redhat.com>
References: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


