Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC45FA332
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:14:01 +0200 (CEST)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxHs-0001gs-7h
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbj-0002Mo-LL
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbf-0006xJ-6R
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwQqJJKVMasq8hTvkgVk+GPfDm74v8D53BZJ0ZT5e8E=;
 b=eCjqeRVd67qxiCgkZd0Mrp2lX+yKbMjHwEKMbQcGMXLFJI4SXUM6if/JJQlpEbdPvsX5h+
 ltNoLM0HznO25iigc1Vde854ExM/Jez64itShXuUHDkLJA4P7OrhdwhrMwmpzEKfW7FHS4
 Y21Jiq/9N+CANYlsluJj7pwwdDdkl30=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-KZDAiW3jOUWsrk6VhxQDFw-1; Mon, 10 Oct 2022 13:30:21 -0400
X-MC-Unique: KZDAiW3jOUWsrk6VhxQDFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso3261638wmj.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nwQqJJKVMasq8hTvkgVk+GPfDm74v8D53BZJ0ZT5e8E=;
 b=wRG70aVul1f2FakGZd+VB7/eS9jhVbz6uDZ6+Rrqqj66k2NaevGoisfgjhHPmenSxI
 USjWnKzgP+9nz3vf/X6J8fdBmhM4eqVAJGNdl4tHmc2bkM4mYL3RYgT6WPWXWSOVQ+m9
 erJRbph6kTR1oJWiNKHh2FDSPLzF/DQbapl16IOlBUgy/IZtR7QSLrK06OsfrJ2pv+SO
 87N3NlXA51cclNlMx04nKyS4m+lY58LBtadQ8iKx5RHrnFfs38A/BJKNqAZUUZRneva7
 /ahrFsrbk78DeMMpsp24LyYhdO5nReLyTd3QOuDhqxm+GtarV5jKVeoZ0mb7vmSqGpwX
 jPkg==
X-Gm-Message-State: ACrzQf1dZgSe039J+84SajoLgLLm6pjpjJi3HnPUZW4HeFfFrht7oWg/
 k9kb3QSw1W6YdrgwyjQVFdPEx0g8xD84tNIQzFzMoYdVt0zFbrsjnpplfcvLI0245E/FsVMjedJ
 kPP02dZKZ9VX1Ei/cUeZYjeSugPOgIsu8ysFIZsmod8W64S1ngxHP78lYAZNX
X-Received: by 2002:a05:6000:5ca:b0:22e:5477:1296 with SMTP id
 bh10-20020a05600005ca00b0022e54771296mr12578569wrb.377.1665423019806; 
 Mon, 10 Oct 2022 10:30:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SK3e3T9Zo2LqcB5MLF9e+7vHQWcVKl8ALLPvt139uI/AmpZ4CHrtuTHvVPGK+Mb1DVB0kPQ==
X-Received: by 2002:a05:6000:5ca:b0:22e:5477:1296 with SMTP id
 bh10-20020a05600005ca00b0022e54771296mr12578553wrb.377.1665423019575; 
 Mon, 10 Oct 2022 10:30:19 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 w9-20020a1cf609000000b003b332a7b898sm10474980wmc.45.2022.10.10.10.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:19 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PULL 22/55] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Message-ID: <20221010172813.204597-23-mst@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It is useful to have the ability to disable these features for
compatibility with older VMs that don't have these implemented.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220906073111.353245-4-d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 2bba42478d..92bfe56b45 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -259,8 +259,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
     virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
     virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
     virtio_add_feature(&features, VIRTIO_BLK_F_RO);
-    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
-    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
 
     if (s->config_wce) {
         virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
@@ -598,6 +596,10 @@ static Property vhost_user_blk_properties[] = {
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
     DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
     DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
+    DEFINE_PROP_BIT64("discard", VHostUserBlk, parent_obj.host_features,
+                      VIRTIO_BLK_F_DISCARD, true),
+    DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, parent_obj.host_features,
+                      VIRTIO_BLK_F_WRITE_ZEROES, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


