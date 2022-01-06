Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE01486594
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:52:46 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TC9-0002Nl-VV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SeE-00057v-6g
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SeB-0000ws-EC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=gG1BvchU0Sd+D1TNMUsEOsKCcQuhOWjG9TSlQf8yJQdnR+BOv1ZX2dhifcqckashm+yXye
 BhAmjTdhwnsn5nDtIBCdjEg0g9OwPRjRTbRT7W++Ru8gJq8zGfG6pAO1/c5qMH7P3Otk/I
 SWE7zjN5n9w17y+c3qjGi16I89oSA38=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-cE_Z2cH1O7W63tThW1Btlw-1; Thu, 06 Jan 2022 08:17:38 -0500
X-MC-Unique: cE_Z2cH1O7W63tThW1Btlw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r8-20020a05640251c800b003f9a52daa3fso1892354edd.22
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=Aa+3VWfRH7KlB28jVc3lOQPn8lvaKXsb++Icg+nVP13vxRqpDnH3FF3B6AdR7/HsvY
 bGIZC0wmai0vo/y1ww/LRDuhAxdOHC7xO4dcqqX13EVCab5x4WeytjDh/Wul8vl24OSV
 OjDL+LyueADSGeHRXKtTTwxcDmNU4HXkgS9aaEqqu46yxtp0OIgFZgZd7qbhzkWGWYbR
 eryeo7+PwyDtmVLcUise11BXxJ5RB4DH9nZiXgDYDrrkJBKeEHSMWfQWXR22mVUiMuYH
 WeuD0Hn4+r8JbJKJ5moVJHx7m3iTo9FKFdbhe6hkbnJNA7Pgn0DzrqpNWjjqqYBo89g+
 5ZBg==
X-Gm-Message-State: AOAM531MRgUVHDXz+F6AB4SqcXEeVKM8Pf6qqXMh8qV5kVMNdvOp9r2T
 EbsHEgmVpknSZpVbS7PNj5/CqS0WDrVIrVGjk12skTi5qERQ1s6l17wnzPMo5DMmFyvydc9+PiA
 KNvjT30MaqDP71SIS2T6zUIwjl0IP/oQp79Oi8Wrm16Wtu7a7w5nFhILdQ3wI
X-Received: by 2002:a17:907:3e0f:: with SMTP id
 hp15mr46818892ejc.432.1641475056459; 
 Thu, 06 Jan 2022 05:17:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvlZDcCfBMW1I4RXynka/sjQCnouy/j+LHjpZ+DLjFSPuNP0HOr1FxdhOGq4VFBJ6uNK8BjA==
X-Received: by 2002:a17:907:3e0f:: with SMTP id
 hp15mr46818869ejc.432.1641475056191; 
 Thu, 06 Jan 2022 05:17:36 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id r8sm714058edd.39.2022.01.06.05.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:35 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/52] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX
 feature for virtio blk device
Message-ID: <20220106131534.423671-29-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Andy Pei <andy.pei@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andy Pei <andy.pei@intel.com>

Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX for virtio blk device to
avoid guest DMA request sizes which are too large for hardware spec.

Signed-off-by: Andy Pei <andy.pei@intel.com>
Message-Id: <1641202092-149677-1-git-send-email-andy.pei@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ab11ce8252..1a42ae9187 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     /* Turn on pre-defined features */
+    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
-- 
MST


