Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270842D32F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:02:13 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjBc-0006X2-6H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilp-0005qJ-JW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmili-0005DC-LJ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HmGkQSaM8Ns8AyuR8g7tRnebE3hC78fFmzSbnpEopQ=;
 b=UkIjoaVlyFneDRgjXcGrGrGmEo3D84b/eFItYi7E07DPT/Asx7rEJekVzStn5diIBdccIb
 WuhtwNygqrEoEexJA3AHRAq/K7oD5/O9vMgtu4SoahKnJDZ0XQ6ehh1baqAB9Z1Y7CpPDP
 BRcvr6UrtpNfl/Hm5qNckw7jSTC+3zY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-BB9QU6iCPSOq89SJy3wXEQ-1; Tue, 08 Dec 2020 14:35:13 -0500
X-MC-Unique: BB9QU6iCPSOq89SJy3wXEQ-1
Received: by mail-wr1-f70.google.com with SMTP id o12so1748817wrq.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1HmGkQSaM8Ns8AyuR8g7tRnebE3hC78fFmzSbnpEopQ=;
 b=aNq6Vs1gejN94XyzRWQE0ITTeFlSDGdh9ohy0WWKiLLkGVjY1vDbfOqPFbEdLt9d0b
 YcJVTeqRR7T0xQlTsVtIJ9rX/yqsGit3Ibkms4/oL4uLY0kAyaF7bbvXjBaoVsi/LGAu
 5xwSa1xht4uEwSjfGJZGD4OH6sUz9CD5ORFvhQjhvj5T8xNF40nYjTXw7ljMdaFaveh1
 48YlYKeF1tQ6dfH7ugde/26FQOBVk/XbqKy1C4wJ7c6fAhWqut5MqVBVfGC9uVuzVVx5
 uUQUCjc6BhTxSEiwz4NxsXsp22hpOHdE+9Um9OM/qVLnCA/XWOyK4T1qQtdIcP7tcsg/
 zF8g==
X-Gm-Message-State: AOAM533cIrEII/xeNbBskReCO07D92LIO7sLYtpGsZaRh83sfv9AWmA1
 64LaXYT5WlY0XrojNhmV3JiYhW7LmBSa3zqG0hbO4mLLAeIOGVh/niop8gNAbUz/oALnRVA4LRB
 XR6ScV/gYe6mQ9mX3Ujh+d0NJEre26m7T3lqJ5mLpWoWpqin84bVCM7CAIxBL
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr5189571wmb.70.1607456111636; 
 Tue, 08 Dec 2020 11:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb1wxdRJKbh5fvPuhuxCw5GWpKb5CDHjuwQ4Dj6ViXm5HUp6ZsTnydoAWBAfnVWiG/w8WpTA==
X-Received: by 2002:a1c:1bcd:: with SMTP id b196mr5189554wmb.70.1607456111347; 
 Tue, 08 Dec 2020 11:35:11 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d8sm5086018wmb.11.2020.12.08.11.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:09 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/66] failover: Remove memory leak
Message-ID: <20201208193307.646726-29-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Two things, at this point:

* n->primary_device_id has to be set, otherwise
  virtio_net_find_primary don't work.  So we have a leak here.

* it has to be exactly the same that prim_dev->id because what
  qdev_find_recursive() does is just compare this two values.

So remove the unneeded assignment and leaky bits.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-14-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6e5a56a230..70fa372c08 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -854,9 +854,7 @@ static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
     Error *err = NULL;
 
     prim_dev = virtio_net_find_primary(n, &err);
-    if (prim_dev) {
-        n->primary_device_id = g_strdup(prim_dev->id);
-    } else {
+    if (!prim_dev) {
         error_propagate(errp, err);
     }
 
-- 
MST


