Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE9E4880AE
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:49:18 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60r7-0007CA-Eb
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:49:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Af-0004iE-De
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AO-0002am-5y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=Zk6pGgITjxapkycE9QoL2vxbk77pBHyO0hm4iXGaZALAilBdWRGnZf/AVIp8hjvLh3FDrS
 FddeGPNwPdPcPka/deugrQwHChLaY3CQCUYq1BLiwEzQ2580rg1VODX4qGmZLwJ0kcsB7p
 BBR6eNp40wWiCCigWeZQaBqqziV/OHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-eYXsFJGuPIaIjNI-FGawbA-1; Fri, 07 Jan 2022 20:05:05 -0500
X-MC-Unique: eYXsFJGuPIaIjNI-FGawbA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso5246943wma.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0yWWiwVH77KlZ9OPEUiCyLgKjq9lYAjmwlptCwnsdb0=;
 b=F2XWzMxqXjIPl/EfqZX2r4eg1belAaNfZi1S7MH7kezNLZT2QxyImuVkmYQtK2YUSY
 1WTMXWdctAdYmUxGGebr9thgVAERBBizRwGgFuGxGPe4kgWLCxyBGv3HwmzFRK70eEtY
 6OEHgIj9o4IfvOu8XCeyQdeAowoYsH+7cXeQpIyLEI8SjFK3CF4hLYo8I85Ztirf+8mF
 rd/nlEZcQxatXRyd6Ddh39zqK1ycxLGOKwr5qdcxCN20qt/nOJjb6KkIzfzwV1q8bf/V
 +dUt0+hlaBiREsgsdwNmwt/K4h207AvSBRAC/K/1kZ3I6NNOasCDqTLF1oMJlBHEUFMi
 WIjQ==
X-Gm-Message-State: AOAM5323cfsmisglFemiqXjJ4pm+d9TJlHABnsMV3qGFCn2YYbqF4Bkc
 b9SftOAypwM5xQUdUGJbLPNts/cFzjycSnue19iRB6iNXPHQrBQiTLIIVg0Qbgb/bHRvZcwGWNA
 Wk+bHNwu8H9NKMzvujLajx7DmJXCl94I6Sf2FqFWDCTwjVZJBBZRR2wVbWKHe
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr55952178wrc.686.1641603904195; 
 Fri, 07 Jan 2022 17:05:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtRfq868kL7IlvevxdR8GgcgGkym94qEP/Gkur8wdqBumDJwT71+BBfvLbrb9kZiDJsBpBPQ==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr55952165wrc.686.1641603904007; 
 Fri, 07 Jan 2022 17:05:04 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id w8sm218933wrs.41.2022.01.07.17.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:03 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 28/55] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX
 feature for virtio blk device
Message-ID: <20220108003423.15830-29-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


