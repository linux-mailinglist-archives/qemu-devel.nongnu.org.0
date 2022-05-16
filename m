Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AC52838A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:51:18 +0200 (CEST)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZFt-00069n-Gt
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7L-0007sJ-Gs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7H-0005Tu-PT
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tohy24hQXy3l/ERp6tFxXEM8o15tUxcgJ5GGFOQVAmk=;
 b=XzV237yM4qRuuLOhxEeHHeos4XJBlJ0YVu8kAfVSfmo2LH9ITCHd+Ajci5AoACy2d5FPWg
 LlD8cjweV0nxW0Z0Bvpl5DuuwSsKCu7i7c33HWPJC7WiK20ZPfbijV5CWj7WW6JqS2ZZoQ
 xndO0dtZ3x/vY2dQGLgb9nh1ouJrByM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-vQnzf9S3OYe4QYGlud_b7g-1; Mon, 16 May 2022 06:38:17 -0400
X-MC-Unique: vQnzf9S3OYe4QYGlud_b7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6567378wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Tohy24hQXy3l/ERp6tFxXEM8o15tUxcgJ5GGFOQVAmk=;
 b=iYlhwPnoDZ4A1TtDLsEibUBQkfMjSLSmCqzh4xaCpOB0k9DK5eqLHY4pUhrkJRcr4I
 cQaJ+osjyzrEWNK/fEKmUP5hO67/+/qYrkUzfQ7lTOaqYiK1LlBNvGwH+C52zwjHPBcy
 2zNxMWw1s8qLwiD+Wo4EJxNwlsVWBosbpnZ5hjkReCrgtIzSpWbtXh38qEKQAOR/mzHL
 vJVog8o6UkKe5+EBJ2QFgZPjD60i3ujyn2seS6P8K5gf1MzhQFziK+mMSMklSnmvnyef
 13Y1Nenhn7xPj5hP8LM67S/7oZBGspRNoioI+QSo+ojcv1t1UtU+6Btq9/5zlwQXZXRk
 iXqQ==
X-Gm-Message-State: AOAM532SaVRTL5DjErIhysLgemem6NgKHhNL/2ST/SE7whfk6aNX/eEd
 zuTMkC2MM4pzC57rTEqasEnKExa2X4Wpha3nFAGRbxhVyQPO1RyrrvrvvV4G7ZMfgYfFNPiPvyk
 eeZaFBSsWCFur9X3AVrRfiT1+g/5uh+O0kxt3WKrV9jIr3R6Disp79oCwaz+L
X-Received: by 2002:a5d:53cb:0:b0:20a:d769:e14e with SMTP id
 a11-20020a5d53cb000000b0020ad769e14emr13983502wrw.603.1652697496273; 
 Mon, 16 May 2022 03:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfIl8aut5mMfSegPFLylsGyPx72KS+ILJYkYWQVJRHahmccoQSMmVx48feNMSUOoOMaXA3bg==
X-Received: by 2002:a5d:53cb:0:b0:20a:d769:e14e with SMTP id
 a11-20020a5d53cb000000b0020ad769e14emr13983484wrw.603.1652697496070; 
 Mon, 16 May 2022 03:38:16 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r14-20020adfa14e000000b0020c5253d8cesm9194417wrr.26.2022.05.16.03.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:15 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 45/91] vdpa: Fix bad index calculus at vhost_vdpa_get_vring_base
Message-ID: <20220516095448.507876-46-mst@redhat.com>
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


