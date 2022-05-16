Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4ED528394
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:54:46 +0200 (CEST)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZJD-0003pz-H9
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7T-0007zr-MK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7S-0005VK-68
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Skj5Q61KBu+UaBgaFRO3QdTpADz+L1xKuIKXrOKnWq0=;
 b=OdlwIPoBqkF+jMr8sEaDpjH2ivrxf/dqKjM49x1LjdvYIgASnKo4RVTDhSmQ2EEoQC0uQp
 ZPSbX19HhoVRxjGHhTObxINjkX+xIBHV8tA4L7FPvKpY163lRLeWh0577IhgehxPQOdRtO
 Ws1doh1kc8TpalJLKle/1rIC3Z/otMU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-sfiZn893MpeKKsWP9DOIsA-1; Mon, 16 May 2022 06:38:21 -0400
X-MC-Unique: sfiZn893MpeKKsWP9DOIsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so6562884wmb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Skj5Q61KBu+UaBgaFRO3QdTpADz+L1xKuIKXrOKnWq0=;
 b=LvCBbMJN8msvVdBkD24xhs40nwfDDuMlZGL4qBvNn0dcmjWuqg/6bLm0fpJi7RNewh
 x7p3085YnoLR38EDsbQSyO4QL2aUIZgiwfq82P+j/jtOLyTqGfCwoUQbSifpVrqpo+sD
 xUb57U6Vs0YEPDPg3qKoXGkNwHL8Dj5vYIC4a0iet1NYp3bxuNGvT1c1aJvhDx3bW93j
 CknSSsvokCn7GFzcESyO6nT51klMuZSVXsLUxl9mErmXDEqAk+lCxTEroV/3A+hwM/9C
 CYzcJ9RlF4r9p8Z1lB6KBTKqL7QhE/86Kc3kLq5EAu7AXwBJssHRGexO1rQlJlhk/hv7
 cFOg==
X-Gm-Message-State: AOAM530ehHJywREXf24L5DVuaB+1CxJB+pP6nuoSp7BC7G3wAqiJmI8G
 hnCzwqipPOiF1eDDfyBbFLh8XpG+6hFcOqoJDX5kzTBltDdngY42sI3loIP638EIn6sqOjkK1r2
 q60VKXlvvrXOhzfb5q3/LXeSisoC7TZXkiscIvd04CB1whopTUg+PlfNmXL0b
X-Received: by 2002:a5d:58e5:0:b0:20a:e022:3f8c with SMTP id
 f5-20020a5d58e5000000b0020ae0223f8cmr13116597wrd.667.1652697499501; 
 Mon, 16 May 2022 03:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ9+Y9pQkNEks+qsm7UnQaY3QpkJ/w+DYcVRBTe/+KQ9p7aInhfDFEeUROEjfuAEVAtHlIvw==
X-Received: by 2002:a5d:58e5:0:b0:20a:e022:3f8c with SMTP id
 f5-20020a5d58e5000000b0020ae0223f8cmr13116582wrd.667.1652697499282; 
 Mon, 16 May 2022 03:38:19 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 f8-20020a7bcc08000000b003942a244f35sm13033922wmh.14.2022.05.16.03.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:18 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 46/91] vdpa: Fix index calculus at vhost_vdpa_svqs_start
Message-ID: <20220516095448.507876-47-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

With the introduction of MQ the index of the vq needs to be calculated
with the device model vq_index.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220512175747.142058-5-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 493269b0b5..ed106bff47 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1018,7 +1018,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
         VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
         struct vhost_vring_addr addr = {
-            .index = i,
+            .index = dev->vq_index + i,
         };
         int r;
         bool ok = vhost_vdpa_svq_setup(dev, svq, i, &err);
-- 
MST


