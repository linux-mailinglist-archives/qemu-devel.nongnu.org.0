Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671C4876CB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:50:42 +0100 (CET)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nlZ-00034k-Ix
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n44-0001bT-I6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n40-0002Wd-KY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=f0TRW0QRyn0Q4sA7ITNmnwY63vUlpz03PdI9xGC0NZp4//Oa8VanW7Ldq2W0nS+ymWXhbg
 NiaOw4kAu2atAAmE8Y9KQ4QCUCTk+JnfBHcLW1FnOQOBHkFH+/ingqdHRcXJOq7YxGDjLW
 oHt1X9VZaX/bS8X+Kn8Y5dNb+l4Y14Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-EksNA1cONGWDZVyBZlgGIw-1; Fri, 07 Jan 2022 06:05:39 -0500
X-MC-Unique: EksNA1cONGWDZVyBZlgGIw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r10-20020adfa14a000000b001a375e65e60so2120272wrr.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=QknO+VUfJMVvV9NMDjfpN3r4XdizAHvBiYkHfiLgNb7MyDNfSUQErpmV4rxnmxP5xQ
 HC5rqBcOLNIqd2wbyUUxF9xlXQGboX9R6ucCuoB0P5r1kJhIa6LDVyfVKjp5+FVSmEkL
 FCwfhKHWgQ1OMPcSDwmOs0xmsTG7dO52M9ZkAEsWTiIyDOvIl0CQwzBEsW4Wr/YzZG9f
 eqHq+v/znviyOzgdMZdqdEMGKaV8ZWbMAQ1sYFYveAcKNHdTEbzP0irtqy5nDOZoGQOS
 iqWntyELmDQPCnSYFQvE55omCw6b04S06Qejpjo6gQGdcNxYSv4r+agkggMeKZdxMZJe
 DREQ==
X-Gm-Message-State: AOAM531wN0Lw+oCswptDPfeAAdLbdkd7rBWFyv/ZFKzyYNEjBacPksbY
 j9eB33aMf27zd39Xfe+/9OROXDbgLovVYuTqWxeGbFL3X0w2OGmZmpTePUpB6A6xs+4rFD3Dlpv
 Fr5zRR20bR9Jdbukw0VrQp4kRNEvQg1CnTY7SL+c7T1lDG4IdK9SHnAD5Fgkx
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr10586629wmb.175.1641553537373; 
 Fri, 07 Jan 2022 03:05:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcIY6ytk7OovWYiAEnqm2sN0NfFnkUesACw6vIUvkhAiEDPlJ5N2cDWqplwobYUPf8UySa3g==
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr10586610wmb.175.1641553537095; 
 Fri, 07 Jan 2022 03:05:37 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id n7sm4146621wms.46.2022.01.07.03.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:36 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 50/55] hw/scsi/vhost-scsi: don't leak vqs on error
Message-ID: <20220107102526.39238-51-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

vhost_dev_init calls vhost_dev_cleanup in case of an error during
initialization, which zeroes out the entire vsc->dev as well as the
vsc->dev.vqs pointer. This prevents us from properly freeing it in free_vqs.
Keep a local copy of the pointer so we can free it later.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129132358.1110372-1-d-tatianin@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2614..efb3e14d9e 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -170,6 +170,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     int vhostfd = -1;
     int ret;
+    struct vhost_virtqueue *vqs = NULL;
 
     if (!vs->conf.wwpn) {
         error_setg(errp, "vhost-scsi: missing wwpn");
@@ -213,7 +214,8 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     }
 
     vsc->dev.nvqs = VHOST_SCSI_VQ_NUM_FIXED + vs->conf.num_queues;
-    vsc->dev.vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vsc->dev.vqs = vqs;
     vsc->dev.vq_index = 0;
     vsc->dev.backend_features = 0;
 
@@ -232,7 +234,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     return;
 
  free_vqs:
-    g_free(vsc->dev.vqs);
+    g_free(vqs);
     if (!vsc->migratable) {
         migrate_del_blocker(vsc->migration_blocker);
     }
-- 
MST


