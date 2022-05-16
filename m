Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A3F52930E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:42:46 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiUH-0006W1-6n
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiT-0007w6-2k
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiR-0006ck-Gx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tohy24hQXy3l/ERp6tFxXEM8o15tUxcgJ5GGFOQVAmk=;
 b=M8G4HJn71ZXOE4Cv4W341AfZ9F0IzpWH03dRDDz24qeA5ts3tIvZ4yP4VaiJNimDBcH48i
 yw53KSVxnkzZ3yt4HVHDohaKSROccum5rnyDO9w9+Si6370h19FCG2qqRU+leFg/DRHNA+
 pO+3fnYOk0ELH5tPv/Ncqtb7AQtZ6WE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-SzIE79XJOfOWT5-tPWBPYg-1; Mon, 16 May 2022 16:53:17 -0400
X-MC-Unique: SzIE79XJOfOWT5-tPWBPYg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y1-20020a056402170100b0042aa8f679fdso3610234edu.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tohy24hQXy3l/ERp6tFxXEM8o15tUxcgJ5GGFOQVAmk=;
 b=1Zy70aIdbAppT/CqCa7elPr7hOEMn4Wgb549pYrKeXSOgraXa4ReUsQIs7jNoQzEKk
 vV0dRR9DCa/+/yfvGlXJNKM7pRVrUwj5x8iTJaH9SGeIsNlCQwyW8OSibWDNqGBK6v3j
 EYEQrZf5GG+73buEry6A1j767xhlobNT2x68/fzUUQcB+4HJbaVG1BSyWGfYUplxgDhF
 4nF5XZ4KIKf5GyOu8WC2BybHYr+kyj3fjUA+0SSMVLjnCObBSihvpYHBjPExLvHshelE
 B/qcuJTdGGSsS8HdMEiEjxvUSX8YPkFUPdis8gh1zJbFYTNy4cCBQFwyHf1RI5jGkW5/
 4Tlw==
X-Gm-Message-State: AOAM5318zipgwU/fL2GJ6fVyg8kn+b0OY2JU42dZBUh9QJxRaSYwiYDl
 FNlGAXAJA/Vg5c4TbUoFj17+qOSdOQkSYwVFP7faapW3GApOqEjwac4i6iGDz3HedNGw9jI/ff+
 PZBFH2RKpWLYgi2esI8aemMIfBIz1+vP/BOQ4YhHz7DzFyBCRghwY+XY3bU1V
X-Received: by 2002:a05:6402:51d2:b0:428:48d0:5d05 with SMTP id
 r18-20020a05640251d200b0042848d05d05mr15412485edd.28.1652734395640; 
 Mon, 16 May 2022 13:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Ar5Tp7We+1tKVRoE7w2Nt05DRSHAh/FAI2ccrErU5VRImmFnbNmjV7AZiIsE176Y/5ttMA==
X-Received: by 2002:a05:6402:51d2:b0:428:48d0:5d05 with SMTP id
 r18-20020a05640251d200b0042848d05d05mr15412468edd.28.1652734395447; 
 Mon, 16 May 2022 13:53:15 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006fa9820b4a2sm159773ejc.165.2022.05.16.13.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:14 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 45/86] vdpa: Fix bad index calculus at
 vhost_vdpa_get_vring_base
Message-ID: <20220516204913.542894-46-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Fixes: 6d0b222666 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-4-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index a30510ed17..493269b0b5 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1172,11 +1172,11 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
+    int vdpa_idx = ring->index - dev->vq_index;
     int ret;
 
     if (v->shadow_vqs_enabled) {
-        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
-                                                      ring->index);
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
 
         /*
          * Setting base as last used idx, so destination will see as available
-- 
MST


