Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED3529323
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:47:59 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiZK-0001C2-V9
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjV-0001JM-29
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjT-0006kZ-Ja
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=er6c1eR6RwDHZXwxcu4HK3IQCJPdNMZNebVVRQV+U8s=;
 b=F6plD1GHIqrsASq/GdLnqPtCupIqxINBKKlMy3Kw8I1r01urpsFRbsI/L+wABEV3eiB+94
 Qy/a7H93V7thUACaoXdFfZuRMmFfWJuXxv2WNBlXdOHhUcTGTP1KbBNOomRb3QYjvESnVe
 W39Tr0aqsYWIdmLEFDLnZhc/tEn67Vg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-5YS_7wdGNiaNsdD8nkJ4RQ-1; Mon, 16 May 2022 16:54:22 -0400
X-MC-Unique: 5YS_7wdGNiaNsdD8nkJ4RQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso6372699ejs.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=er6c1eR6RwDHZXwxcu4HK3IQCJPdNMZNebVVRQV+U8s=;
 b=caiY1K9n2T38t1+91o3IqpAzXG5r7gtGa40MEONxU9JvCddbFtHo/vkORCE9Y66+2Y
 EJwqJAPcDZeKKMh5yNCIQLmv7SNWkxi/rAbXbbk6WU/68tSGFIi/JQ2eVcgS3Cg3omYz
 c8u7MRzVKfLcVTgC2DvlL5AEl1muiIFwtCxUt9nu0HOPwaEoBZliAGDj9hSOjo4vrPmy
 51R5TnBQTUP4Iypt1cevIp5PSD5yTcHEBw2IdFS03Ya07RLLF6DIvnqhE9RLPPwELbsz
 geFDSHoZgEjgEeaJRqHXh+AdrCsZECmLx3nVufCwVV7qPwPsQOACFNL7xuxk5VXE2Rou
 eY/Q==
X-Gm-Message-State: AOAM532+czuBFrW9DjexqQblwpybzyo8M2P1Dgw6j+ITAaX0UJFC8uee
 Ybb2jb92yXT+3bAL5gA8GEc54SrIP6fLWycAmcs/Zk8Q5hWl3+ZAIanA9+J0H1QlZ8poQEzYek6
 Iq4wWZL5MZGuNn540+ZfYzPbo4mXSot9UJt5C1VC4pyPfikyFuxqQ2LyirouR
X-Received: by 2002:a17:907:3f8c:b0:6fa:8b15:66fe with SMTP id
 hr12-20020a1709073f8c00b006fa8b1566femr17400753ejc.142.1652734460717; 
 Mon, 16 May 2022 13:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/saW/9pCnU9Ge4IQejHCDVb1JtyoQS7p/4ZKlblWDkPMcrk2cMZ1kbd7ktESBSYTYn+ueog==
X-Received: by 2002:a17:907:3f8c:b0:6fa:8b15:66fe with SMTP id
 hr12-20020a1709073f8c00b006fa8b1566femr17400737ejc.142.1652734460378; 
 Mon, 16 May 2022 13:54:20 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 s10-20020a170906778a00b006f3ef214de3sm175276ejm.73.2022.05.16.13.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:19 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 60/86] hw/virtio: add vhost_user_[read|write] trace points
Message-ID: <20220516204913.542894-61-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

These are useful when trying to debug the initial vhost-user
negotiation, especially when it hard to get logging from the low level
library on the other side.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-4-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/virtio/vhost-user.c | 4 ++++
 hw/virtio/trace-events | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index afd51f79b3..6c8f722262 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -489,6 +489,8 @@ static int vhost_user_write(struct vhost_dev *dev, VhostUserMsg *msg,
         return ret < 0 ? -saved_errno : -EIO;
     }
 
+    trace_vhost_user_write(msg->hdr.request, msg->hdr.flags);
+
     return 0;
 }
 
@@ -542,6 +544,8 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         }
     }
 
+    trace_vhost_user_read(msg.hdr.request, msg.hdr.flags);
+
     return 0;
 }
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 7a6576d833..65e3b704ec 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -21,6 +21,8 @@ vhost_user_set_mem_table_withfd(int index, const char *name, uint64_t memory_siz
 vhost_user_postcopy_waker(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
+vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
+vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 
 # vhost-vdpa.c
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-- 
MST


