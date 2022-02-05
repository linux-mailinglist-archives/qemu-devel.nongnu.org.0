Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258854AA583
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:02:16 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAP1-0007hq-8Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sl-LG
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003JG-EA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMY8xR93DQQSXRTh9cIog6ZkSuUw4ea/EPUUeaxLWQ8=;
 b=KPunbfBxY0o+pDFJa8pdrEmi5VGprLNGZ0SmYqnfzUqDU2e4OE8b2HLL13wgPozfavYPJi
 1GzGCDJyA+jOmi526aB4OSv6tH+SL33mwBo1EkwSncRawllebxfSTarQoig1y9mMmQH+h/
 vgDVT4VTsVHn/swhVtyS/VNzibpaXqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-h4U_40saNfW5Xl41zyLbLw-1; Fri, 04 Feb 2022 20:43:00 -0500
X-MC-Unique: h4U_40saNfW5Xl41zyLbLw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so2799838wrc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FMY8xR93DQQSXRTh9cIog6ZkSuUw4ea/EPUUeaxLWQ8=;
 b=tyTJG5yozzUyWp3MtzVcUBwARqL7J52AyOBFMu7cYBjt5fdOUlIAxfwfX7l02yBvPE
 LkB4BuXFE3Jzq07n9QeotkwvDmPT7YMSMQTeIeJ9O65o7h/Q5cq7StxRmWUtTW5Nu3Mc
 d8WFrZJU+zfT0ClYi9i7X8wDt+oahFjp/TpONHlsdjDn6ooh9VDWJ8T5cG0/n8ZWrozB
 mn7gfKgLvSxs+SGVszFoZAjs7/FPSChK4d0fxqdQlh11oyMSl7Jq3DdV7a9dSmHaJSUj
 MVDjOsZPujXM6DEmwyWw+VTJWlapUSRgiNnZDX9xfyj6NCBH6jG1xsjmtdtcOJHAQvF0
 mH4g==
X-Gm-Message-State: AOAM531otJ5JgZ81Gfxaong6Jg6GWlaL75SDPiyDM1a5OhvH7WoB53fl
 bxtx1ju+QhXrsbHfRlQR8sFo3UExHoFZXwtGcO6ba4YVCY1lLiUYHwHU5G1ypl1C75z0qlfr7Mk
 oZbjCd5NnrH8ImVw2zXcJcT9wXWjreqUVr0s2vAatYA/2ZZuCuX8SiTw9dWCd
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr4403607wmq.120.1644025378820; 
 Fri, 04 Feb 2022 17:42:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrfYEbaoiG95C5BLRbnE0gP+Kw9pwUzRpyl166yJtZJAUtD4mpZyBFjXy9FQXZyfotcidyeg==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr4403581wmq.120.1644025378482; 
 Fri, 04 Feb 2022 17:42:58 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id g7sm3316797wmq.3.2022.02.04.17.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:57 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/32] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <20220205014149.1189026-9-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
 David Hildenbrand <david@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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


