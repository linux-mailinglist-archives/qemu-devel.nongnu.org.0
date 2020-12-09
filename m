Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9692D49FB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:21:09 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn51Q-0003zo-NW
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vX-0004jm-OY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vT-0000TW-00
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bOnIWc8QuS0vqpM39al5k9XO8qlC2v1q1F92knb7erU=;
 b=IlIBUaTldAxRjWtGYhEy8J2B5UzYuAXWiYFPWCExYCUQbLaIYB4OHxBX9OAKuTk5cmPXhi
 mXMvjx3dQXZTjp+j2pD3nLcOGQ5x1bcn1cy7ApwTkhulAR6Vs5PZF18Ygq6uVUk/JzFc3F
 /5edjAysO1NuGLI2Ipkd9kVCBk0IDKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-aX3PxII1MhC3hdJ_uUHGQw-1; Wed, 09 Dec 2020 13:10:52 -0500
X-MC-Unique: aX3PxII1MhC3hdJ_uUHGQw-1
Received: by mail-wm1-f69.google.com with SMTP id f12so872988wmf.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bOnIWc8QuS0vqpM39al5k9XO8qlC2v1q1F92knb7erU=;
 b=nX7fej8J/P5iXlTWpBWK1EG3mWR54EF8UNzKUA+6aldRNqWbQZLCFGod4nlGkSZcHd
 6HYFcvivZ2jDeOHLY8SMHKDJX3jedzuOfNZBQzKq7kTqGT+VockEmD2z0slAt0fExpyB
 PLEziDSR3f6nqqGoVhbMDs5tDF27W7dXAqhn4Hvcb2dSF5+FYq04yQDy28s24KUkyqqE
 8N2U+Qv7dP81wgUPwPO6xZ4t5ChQ9nw7v5RubDNYqkR2FMF4wmFGEyKJ73xinnyBFZn1
 6BP1vsOhtjCQ62Y1txmdzCb5LSnL4PkKkU9w9bE+Ec8i1KS+yFiWdQjgdLStmbKEEi+r
 QRSQ==
X-Gm-Message-State: AOAM531z8omu0tY+Ui54bXOj8MGukL7rt6i50ybbT2AUh+tFro7IQcln
 nXLtgXt8BOQiLXVVVYC2p9ihK7hTkMabcLUIRdN96kyruwyPZo3XFRBwq8xKWzNvzTwdZI0kp5J
 HS/ScbkdpNzRUMkAykRScqWT87/wseVSa96aNdAI/yGXCJZLSRpHSUq0ALwgN
X-Received: by 2002:a1c:2681:: with SMTP id m123mr4119190wmm.114.1607537450831; 
 Wed, 09 Dec 2020 10:10:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPmbw/vF4077o3bYmI9ZOil7aTalZqlOHh/WJcwZEGUBRcNXgjc4RGWBLujOS8p3nYS259yQ==
X-Received: by 2002:a1c:2681:: with SMTP id m123mr4119162wmm.114.1607537450629; 
 Wed, 09 Dec 2020 10:10:50 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a65sm4309631wmc.35.2020.12.09.10.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:50 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 54/65] block/export: avoid g_return_val_if() input validation
Message-ID: <20201209180546.721296-55-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-5-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 block/export/vhost-user-blk-server.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index a3d95ca012..ab2c4d44c4 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -267,7 +267,9 @@ vu_blk_get_config(VuDev *vu_dev, uint8_t *config, uint32_t len)
     VuServer *server = container_of(vu_dev, VuServer, vu_dev);
     VuBlkExport *vexp = container_of(server, VuBlkExport, vu_server);
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_blk_config), -1);
+    if (len > sizeof(struct virtio_blk_config)) {
+        return -1;
+    }
 
     memcpy(config, &vexp->blkcfg, len);
     return 0;
-- 
MST


