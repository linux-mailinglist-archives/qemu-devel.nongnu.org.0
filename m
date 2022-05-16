Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337E5292C9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:22:41 +0200 (CEST)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiAp-00068g-7Y
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiW-00080X-D9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiU-0006dA-Sw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Skj5Q61KBu+UaBgaFRO3QdTpADz+L1xKuIKXrOKnWq0=;
 b=eMT5oWCxtcBisuOR92k3z6kL2Vsajx3PD7Uwxh25cYoz/ruULZlEZGdIRBGDaCRL/4kusd
 9kH1Jnd0w4Fqkn+3EQXbj8kORT07xKc59xpYDoSbbPj6gY64Ez47Q4C1Wk4Prht9IDkJcX
 qiLvxfJB0xfC4GKU2oXvFroPbxNJ33s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-enlZBkYbOxSo7x43OY0okw-1; Mon, 16 May 2022 16:53:21 -0400
X-MC-Unique: enlZBkYbOxSo7x43OY0okw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso10516413edv.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Skj5Q61KBu+UaBgaFRO3QdTpADz+L1xKuIKXrOKnWq0=;
 b=IuKqrxU/UnnUp1kWlMixoFF0cQ15qjB7Yg9f5qKk95N+ZdEyOEo0L6bJESnZJnvM4O
 Sn1uXy9yvafV5ZH5IjaY310XRXn9LY0TOoXOZWzz/tBJ957/3MHlUCHt3sJWvbc1IALg
 wP2jpxf+j2jvWcD5J06EfAfbaZpaDcUtTm133VKVlW4gKtGbYPcfFsseWxJlglALjaj5
 iskEX/C5MjEDzBR/m9ye2ZUY4kyGgNCcXEM2VB+bbrdJn1HlfEQphd4fcIBZ9rSIGdk/
 lvegvvsYdwhQ9QSexK6d1+Sh88BsQQxx08aLsh3zwIiGGUpq89z+jCIiccNaIN9rAYRI
 7tjA==
X-Gm-Message-State: AOAM530l2dXnM/MUxwzCpEMFsy0ekun6fFvQdULCdRi8qIDXLnoNaf2M
 7wTHmf2KB2ehfMg9hPstMHOC9nGNn4gMJNGwkLKTZJ9dXPlRWFQ1/f/Tjd+hcbN0FQebxKswwGM
 9w2dF0IOM2PT0HVKOWe2bAcsVhfSufSgeWdXHK/6TV2PqVW2jF2jG/MZF899P
X-Received: by 2002:a17:907:97d5:b0:6f4:29cb:399c with SMTP id
 js21-20020a17090797d500b006f429cb399cmr16383013ejc.530.1652734399898; 
 Mon, 16 May 2022 13:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxigPFGAJCzOA+gKzOcy3jkQ740W4W9E4NV4rIw93jVCYCPKlF0txFdl0SyuxnBvX5nzvrlJg==
X-Received: by 2002:a17:907:97d5:b0:6f4:29cb:399c with SMTP id
 js21-20020a17090797d500b006f429cb399cmr16382999ejc.530.1652734399565; 
 Mon, 16 May 2022 13:53:19 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gz27-20020a170907a05b00b006f3ef214df8sm162212ejc.94.2022.05.16.13.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:19 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 46/86] vdpa: Fix index calculus at vhost_vdpa_svqs_start
Message-ID: <20220516204913.542894-47-mst@redhat.com>
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


