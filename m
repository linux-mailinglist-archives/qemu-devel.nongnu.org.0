Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32FD5FA346
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:17:11 +0200 (CEST)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxKt-0004sR-8q
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbq-0002Zv-A8
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbk-0006z8-Tn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRj4VYmR6ExoX4uKQoRfOBfhkySi+nf7yI8Vb5MpRTo=;
 b=PWyLpo+mcefIWweJg7/BRDW0YKrC+HaXVuqZWFBMRvm9QSyN8p48RtSVK1+nVOFWhxr9W5
 M3ekobAfsJwvit+YbZHYn9L8S3zSIbNKVFU48usc1aJbB8gPjtKWA57SJg976Q3rYYPKqs
 JGwyhNhwpHfBgk66Axo/iCXPBrSPAgM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-Fim9x-p_NwKf3ABgNrrU1Q-1; Mon, 10 Oct 2022 13:30:27 -0400
X-MC-Unique: Fim9x-p_NwKf3ABgNrrU1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 n19-20020a7bcbd3000000b003c4a72334e7so1433175wmi.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRj4VYmR6ExoX4uKQoRfOBfhkySi+nf7yI8Vb5MpRTo=;
 b=C4f7qtnYQck057+Gd+CE4nd5cb51MgQ2wlTsNlWiW7qyeWr/R23k7NGzEgII5hB/Dx
 IosyTY9MJhWom5WabGt6s/mmIpJpmSXVwWqn3if2R8vKTKp8ISKJQKHjHTIK1zZcr71s
 lF7rmKihZKU9qQjd6Oa5YEwJ3Qy4KMPgpK87ucibln3dbiNFUxXpQNEOrqGOmH/5oOGc
 ZwygNmXeo8wOwHpv9b1LAZuIGtBwmchLzHZV/wLdYoVPzgXCHLmABkSo8N3Mm/gPyBUj
 P8Iso1za8jfRhxM0aucVF5jTw9CQ7vYkIESskmtaS+0eFp34hMHljCS1F+H/N98aXKWl
 KzvQ==
X-Gm-Message-State: ACrzQf34adRZ3Kr/QjPPjYu7+pCbvLcgiaVGvWENFGMyW9BZy8UkRgUK
 bcWGiU0RfZcVI0eaO3Up6eifqw/yzrdOY1QPREBhvXqv5AlFbAAnHvD6F4PV+pCrMwwCIEmSjDB
 LRXcesTo7r3Ce3rTxcK1lgxHOlqRt4KT5nSvQhEGpiNFb/zzV24O/Tl8ibT9R
X-Received: by 2002:adf:d224:0:b0:22e:6578:ed57 with SMTP id
 k4-20020adfd224000000b0022e6578ed57mr12237417wrh.512.1665423024305; 
 Mon, 10 Oct 2022 10:30:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Dicd1mAKBqqxLUJA1tNDTsOpZBgO/Y/+5/B2LR9Kk0fyEmSsfxaYmR7EH7Rw2lppijTs1uA==
X-Received: by 2002:adf:d224:0:b0:22e:6578:ed57 with SMTP id
 k4-20020adfd224000000b0022e6578ed57mr12237395wrh.512.1665423023929; 
 Mon, 10 Oct 2022 10:30:23 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9374010wro.59.2022.10.10.10.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:23 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PULL 23/55] vhost-user-blk: make 'config_wce' part of 'host_features'
Message-ID: <20221010172813.204597-24-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

No reason to have this be a separate field. This also makes it more akin
to what the virtio-blk device does.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220906073111.353245-5-d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-blk.h | 1 -
 hw/block/vhost-user-blk.c          | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index 7c91f15040..ea085ee1ed 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -34,7 +34,6 @@ struct VHostUserBlk {
     struct virtio_blk_config blkcfg;
     uint16_t num_queues;
     uint32_t queue_size;
-    uint32_t config_wce;
     struct vhost_dev dev;
     struct vhost_inflight *inflight;
     VhostUserState vhost_user;
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 92bfe56b45..aa4831f27a 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -260,9 +260,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
     virtio_add_feature(&features, VIRTIO_BLK_F_RO);
 
-    if (s->config_wce) {
-        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
-    }
     if (s->num_queues > 1) {
         virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
     }
@@ -595,7 +592,8 @@ static Property vhost_user_blk_properties[] = {
     DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
-    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_BIT64("config-wce", VHostUserBlk, parent_obj.host_features,
+                      VIRTIO_BLK_F_CONFIG_WCE, true),
     DEFINE_PROP_BIT64("discard", VHostUserBlk, parent_obj.host_features,
                       VIRTIO_BLK_F_DISCARD, true),
     DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, parent_obj.host_features,
-- 
MST


