Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D954DD9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:54:06 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lGP-0005sG-JF
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvi-0001iF-Bh
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvf-0002rq-Ow
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcqfsdZcNariGGUMvLOfISWoXv8DGnhVbrRdvfEo1GE=;
 b=gJ3cwAkFXaMwWtZvzBdzirk/V/BbWUVW7VwEUK+MfyPSH00jTeakm+JojvmYTv8kR0uAjI
 qXjClogTHsOLwlsbpgv+zM9SROSgL+1qVix4cn6GxavOKE0f/iQiBmwdmVnqCPu8sSh4Bm
 33UoF3tLyDsoW6pLwII7/1fQpO2XHb8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-DTT5jApAMi2EDXgsalxZJg-1; Thu, 16 Jun 2022 04:32:37 -0400
X-MC-Unique: DTT5jApAMi2EDXgsalxZJg-1
Received: by mail-ej1-f69.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso309623ejc.16
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcqfsdZcNariGGUMvLOfISWoXv8DGnhVbrRdvfEo1GE=;
 b=eZrDzCNq5we8bHvR+ozrQN3EmnLbLo4ZaPYsKQYlPwlIaRBnT9fvS2bakvn0CKBmUb
 I1Pj2IPL2wL3MoQDArJH36qAR9g7QEedeKqQna6jpoCYE0XnomOpu0ZiZVxszbdrju5j
 8etu7J1dRiNVN8V1SeLO4t/QvYGljPOowMlMLAEGOFPu8JUMvTnCblJ7FPdbfJD7JXgY
 AjttUcpO1E0kjZ/1moJIBqQNulDpsYx/EkXesisqtAZeB3kdYZdeqEsmtuN6Lj8UP8in
 6vMEgVx2QJjWxPYzfd55ZrLNqwNzYwSk/xH24swwfEMVRW/KV2bITj5FZEmV8q7eRHei
 Lk1w==
X-Gm-Message-State: AJIora94IGow4zNPMGAicqLaSYRCZO8hniRMDu2W8Mw1Kmg/0ITPcAmt
 GCNyAWkd4ehjInVAcusKG2fXqjrwVaabCa24vkt6gGbQPqzFDVQqkRvIt+5Sb8dGR5gkKWaAqJs
 AaoBqVIkswqZPA1TXlJA1nnDJ2VmK505yVf7eG0SY6BwqAGdlXfXZD+yAyWWS8AtO5EI=
X-Received: by 2002:aa7:c846:0:b0:431:6c7b:26af with SMTP id
 g6-20020aa7c846000000b004316c7b26afmr4773125edt.123.1655368356296; 
 Thu, 16 Jun 2022 01:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u9PybE+vLquQPHg6pAgDx4Lqt5iTB2Jlhj9r/kHI5NNc1+5gePasdEf69zWyYXE7oZZ5a7Uw==
X-Received: by 2002:aa7:c846:0:b0:431:6c7b:26af with SMTP id
 g6-20020aa7c846000000b004316c7b26afmr4773064edt.123.1655368355432; 
 Thu, 16 Jun 2022 01:32:35 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a1709064dc500b00706287ba061sm467834ejw.180.2022.06.16.01.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 11/21] s390x: simplify virtio_ccw_reset_virtio
Date: Thu, 16 Jun 2022 10:31:59 +0200
Message-Id: <20220616083209.117397-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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



