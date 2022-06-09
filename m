Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0F54496C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:47:29 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFhI-0006Li-8A
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGZ-0006Hd-7C
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGT-0007Nk-UC
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXJ0/cLEQnTW9mvlDJ25ozxlPwQBkigpFPaXrqS8/ec=;
 b=VP2apdMIgYkzTEv1NecQa86ORnj2fMRgUsbdQgHpFeSbHIm7wJ+WicDoXiFRVC4ISSEzho
 5DcLZZCy2GdASwXbmR5joNIDxLgG5fqWcexiBHICE8J9NSJu6a/w9JX2NzTUt0BMT+sa9y
 6i7yzTdtd1GAu6Q8EVniIleONKcmHhQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-_cOhTVGwMW6uTA2ewQiVEw-1; Thu, 09 Jun 2022 05:15:39 -0400
X-MC-Unique: _cOhTVGwMW6uTA2ewQiVEw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hy20-20020a1709068a7400b00703779e6f2fso10735408ejc.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXJ0/cLEQnTW9mvlDJ25ozxlPwQBkigpFPaXrqS8/ec=;
 b=jLtpDJMAmSC4zX5BjHsMdD/pRAgb6uHjBgozEF1+BSvokY9pRfArT54ghMX9B5A3v0
 CV9StBO+2CAC0NMIIbRcQBESovp1en4b6Pb7x+Dclxt8NspSRp+N6YEXTeCqfcnywYYS
 kv3JYPDlZgGidUfwZE9ivtOIne5JUHIxd3ibkKBCblVSACJ6wrHwMmeu4EgMKtcJdfUL
 dBaF/6By0TE3Bh0mh0651uBOq/IDICqCnHI87KhY+3YjzA7z/MxR3HEbo1KXAvhVI7tA
 xkJhY7b77VjYKLvG5XQsUWlWB2eFHmDKGfJ97eF+CUpCpHAdxA+4alTgjoshMUuZ20Bn
 QNcQ==
X-Gm-Message-State: AOAM530uMMKDofQmb32DNcK5MT64m88uIu909q9mfpIdZAGMo1BX42PF
 C4V2MtFe1fL3UWGRGQT1XHdF+kByKIzkZj4IDWHeMRc/QHa/pwpSeLU9eMG0TeX7u70/RFeCs+Q
 C+iQzmhGbFYXCC0H3YhrsC4J3/yJE8QZFwbEgWQYkL5O5+fSXZAH56jOKW6mmghWvCWM=
X-Received: by 2002:a50:ed12:0:b0:42d:d1d3:493c with SMTP id
 j18-20020a50ed12000000b0042dd1d3493cmr43122084eds.174.1654766138554; 
 Thu, 09 Jun 2022 02:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoF7/3lz2RNhyTkJ8Y2rTnlpEFGEIbS5xRaalLNOFYZamXu+29esOdLG+czVZ9+jnumF2b3g==
X-Received: by 2002:a50:ed12:0:b0:42d:d1d3:493c with SMTP id
 j18-20020a50ed12000000b0042dd1d3493cmr43122060eds.174.1654766138308; 
 Thu, 09 Jun 2022 02:15:38 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a170906470c00b00711d0b41bcfsm5212190ejq.0.2022.06.09.02.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:15:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	thuth@redhat.com
Subject: [PATCH 1/4] s390x: simplify virtio_ccw_reset_virtio
Date: Thu,  9 Jun 2022 11:15:31 +0200
Message-Id: <20220609091534.1416909-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609091534.1416909-1-pbonzini@redhat.com>
References: <20220609091534.1416909-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Call virtio_bus_reset instead of virtio_reset, so that the function
need not receive the VirtIODevice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/virtio-ccw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 15b458527e..066a387802 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -249,12 +249,12 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
     return 0;
 }
 
-static void virtio_ccw_reset_virtio(VirtioCcwDevice *dev, VirtIODevice *vdev)
+static void virtio_ccw_reset_virtio(VirtioCcwDevice *dev)
 {
     CcwDevice *ccw_dev = CCW_DEVICE(dev);
 
     virtio_ccw_stop_ioeventfd(dev);
-    virtio_reset(vdev);
+    virtio_bus_reset(&dev->bus);
     if (dev->indicators) {
         release_indicator(&dev->routes.adapter, dev->indicators);
         dev->indicators = NULL;
@@ -359,7 +359,7 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         ret = virtio_ccw_handle_set_vq(sch, ccw, check_len, dev->revision < 1);
         break;
     case CCW_CMD_VDEV_RESET:
-        virtio_ccw_reset_virtio(dev, vdev);
+        virtio_ccw_reset_virtio(dev);
         ret = 0;
         break;
     case CCW_CMD_READ_FEAT:
@@ -536,7 +536,7 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
             }
             if (virtio_set_status(vdev, status) == 0) {
                 if (vdev->status == 0) {
-                    virtio_ccw_reset_virtio(dev, vdev);
+                    virtio_ccw_reset_virtio(dev);
                 }
                 if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
                     virtio_ccw_start_ioeventfd(dev);
@@ -921,10 +921,9 @@ static void virtio_ccw_notify(DeviceState *d, uint16_t vector)
 static void virtio_ccw_reset(DeviceState *d)
 {
     VirtioCcwDevice *dev = VIRTIO_CCW_DEVICE(d);
-    VirtIODevice *vdev = virtio_bus_get_device(&dev->bus);
     VirtIOCCWDeviceClass *vdc = VIRTIO_CCW_DEVICE_GET_CLASS(dev);
 
-    virtio_ccw_reset_virtio(dev, vdev);
+    virtio_ccw_reset_virtio(dev);
     if (vdc->parent_reset) {
         vdc->parent_reset(d);
     }
-- 
2.36.1



