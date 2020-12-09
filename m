Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86C2D4A44
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:32:10 +0100 (CET)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5C4-0006X6-0T
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vJ-0004XH-LY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vD-0000Ip-MZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j9H1uI5lMJn6lpI26L/tMaP17cyPrnspRPrI7rHkTu4=;
 b=AWmb39hp+2oHYWbjB1BkbV15XIyEs72lF6Cf4cQGDoY71nTf1BeKSBlmOh2Hm6eEHQvLm9
 fGD4wsl0WMy23YXbL+9YT/A7MSOWYzijBeBPSSDEYBAA0Ty3dgCcmQtKw/rhqiMBWz+fuT
 Dg3LsSyEbwt8manzSZpjrf4CvK6vhCA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-KhjGhd-BPmOz4Fj-Ojfe_Q-1; Wed, 09 Dec 2020 13:10:34 -0500
X-MC-Unique: KhjGhd-BPmOz4Fj-Ojfe_Q-1
Received: by mail-wr1-f71.google.com with SMTP id 91so943936wrk.17
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j9H1uI5lMJn6lpI26L/tMaP17cyPrnspRPrI7rHkTu4=;
 b=qGZHIT6Joe0Q7aArsqJ9Ie90FZxe0Q2UsJ6Ls1oL1ToTgCJ7u/R87YQCMFy8UXFiLT
 TyPFDleSH6gyu4L63jTmJtEaU+onrLZyaWCH3zNn3nTc8E/ubDLswAiXfQ5dKHek7mrZ
 ufiwq2V7NxwZfsilUTp641uuNPh9nXziDt2WPVraHVHCCS1yaEA3sVc745DIsDKP7qOs
 fsWIYZFXXvAsJeUUZb9kMtDNRa9KzQRJi98zufhbZ+bFTBArAldf+nJGaD1/eX/Ey08O
 fjfqDPrz4wj5mwCvUjaIIxFzTsPZMdJEIYMVbjdiGEAFS8bpJDW/QxjZ/kOHd0SsLoU9
 HF6Q==
X-Gm-Message-State: AOAM533cXb9OMk2wfAvDawRzzmskYjK5cn+oQmalRQzZevGGLpXbsNWC
 AkBuOoYDqc+pIyczLjyzTwgajV7Ww3woOWirknLbsmmymGcAKaaPH/YpAu7Plw6Bz/oLFAvjC0J
 gTcTkxjB160ml6hR7seguJ/bO1Y4mFxX27DO41JqrBUCSY/GHSukIgknrSHCk
X-Received: by 2002:adf:fb90:: with SMTP id a16mr4084366wrr.192.1607537432914; 
 Wed, 09 Dec 2020 10:10:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw/pRfMq3/1LUEIqrYEIeddLspav2kvCZnjxI2Uq3wvOoFM9fYGPB4ST4yTDSyrWGtXzFtYg==
X-Received: by 2002:adf:fb90:: with SMTP id a16mr4084345wrr.192.1607537432690; 
 Wed, 09 Dec 2020 10:10:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id o83sm4751803wme.21.2020.12.09.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:32 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 51/65] contrib/vhost-user-blk: avoid g_return_val_if()
 input validation
Message-ID: <20201209180546.721296-52-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-2-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 6abd7835a8..d14b2896bf 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -403,7 +403,9 @@ vub_get_config(VuDev *vu_dev, uint8_t *config, uint32_t len)
     VugDev *gdev;
     VubDev *vdev_blk;
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_blk_config), -1);
+    if (len > sizeof(struct virtio_blk_config)) {
+        return -1;
+    }
 
     gdev = container_of(vu_dev, VugDev, parent);
     vdev_blk = container_of(gdev, VubDev, parent);
-- 
MST


