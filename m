Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B3400D39
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:52:25 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdaK-0003AD-Cp
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLl-0006TG-MQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLk-0001ZT-7r
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxjgw5K6TAq8wdnebl9wv86LxwojBdURJMXLYjBqW1M=;
 b=V6a+ZuH0d68yi5QptffbRHGMSmlHy4RwTxzkZI0Mg5t9WnVwb+8qwHZEMxtbW2hrSM6V/C
 xKjxv4A/RkJNvIBBIvPi/d8rFDTs8m3m6HqHoaSq6vYHOuMKve7EUmC1sXzsLyBZlobepb
 GFfchmf5/7m0LOqmh9nlm/0D7sM1G8A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-JHnE3mH7OLG3BSD_SVXITg-1; Sat, 04 Sep 2021 17:37:18 -0400
X-MC-Unique: JHnE3mH7OLG3BSD_SVXITg-1
Received: by mail-ed1-f71.google.com with SMTP id
 u2-20020aa7d982000000b003cda80fa659so251007eds.14
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gxjgw5K6TAq8wdnebl9wv86LxwojBdURJMXLYjBqW1M=;
 b=eX52qCpxRvhT+rdkEi3sHLSXG418AslD2KD3bvBl5KAIGhR3dfWX8pH1bUrUn0nhzj
 KU5UkBT6ZaEClQWG6BAcrxKeVhpynxSjtCQIuKG2bj1UPp0k13+Enr/gIo6ywhxrLCi4
 qrM/ZaiaBhfJhtE8H619V9PijW86O/YrSIpyYDZTdj9RJncMvPVXcvbK30nA/1z2OwgY
 UZTuYQqqen6t+jNqLSI0qMIa+0TJlen40th2YIA6O7DczpCn8Wh2AlSp7bjW4PqtjFLk
 jazDC7xP19AiGQ77N006mHPxmmIG2KwnPRT01+e1JJuweCu/gLhnqnlHwBjzuHMDcWtE
 X6Mw==
X-Gm-Message-State: AOAM533K+Mzoik1xiGJig41jaIkIT87krQ4YaSBTUBhH/q1ZMtNCqEir
 fvaenjyB36LVmN9CqaWalyMbOZrlm19DZuRBqayRRCX1Sq0V9+ln1SAwgkWt52qDzyQZ+diIpqB
 n/91N/vjER1AC+iUQhTIJOa0V6S24k9muWgr2sfAqpYuB+Ds1zkbpFkdBWM1f
X-Received: by 2002:a50:ec97:: with SMTP id e23mr6089889edr.25.1630791437059; 
 Sat, 04 Sep 2021 14:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBmtwHVmRuP4SiqjvxDWmkyMFy05bpBHPdR8LPUQdVtE83GXzLV773yCJq4d60HGaPuje+dg==
X-Received: by 2002:a50:ec97:: with SMTP id e23mr6089877edr.25.1630791436904; 
 Sat, 04 Sep 2021 14:37:16 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id e22sm1924333edu.35.2021.09.04.14.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:16 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/35] vhost-vdpa: correctly return err in
 vhost_vdpa_set_backend_cap()
Message-ID: <20210904213506.486886-27-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

We should return error code instead of zero, otherwise there's no way
for the caller to detect the failure.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-3-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ca1227e5dc..7633ea66d1 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -443,13 +443,13 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
-        return 0;
+        return -EFAULT;
     }
 
     features &= f;
     r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
     if (r) {
-        return 0;
+        return -EFAULT;
     }
 
     dev->backend_cap = features;
-- 
MST


