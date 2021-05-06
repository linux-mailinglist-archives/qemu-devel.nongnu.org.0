Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B419C3757F4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:53:33 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legJg-0002Wg-QO
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBO-0002MG-Um
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBE-0002ve-IJ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ofjjs3WMd4oy2q+JSRlN+UhQQ4Li9+ZQQfxkjpTcZC0=;
 b=c9OpckvTLUt2ENB2e7U+FBxR00fgLIU7q4oRQmCITRa9PjxTCwJE7tvI/hhAMdhwCOLX9H
 4AkmXQAWSzemLv03epsQkZpIJJbcSKc6onStG52e11b8eXN7D0hXyvz3BhJTE3t82i5TK4
 p5pVfJFoVVfSo3w2pm9XEMeXP6hnd3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-cL6eCgxiPsC9rtiFnxcllg-1; Thu, 06 May 2021 11:44:43 -0400
X-MC-Unique: cL6eCgxiPsC9rtiFnxcllg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B348107ACCA;
 Thu,  6 May 2021 15:44:42 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEDCA620DE;
 Thu,  6 May 2021 15:44:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] hw/s390x/ccw: Register qbus type in abstract
 TYPE_CCW_DEVICE parent
Date: Thu,  6 May 2021 17:44:22 +0200
Message-Id: <20210506154423.459930-7-cohuck@redhat.com>
In-Reply-To: <20210506154423.459930-1-cohuck@redhat.com>
References: <20210506154423.459930-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Instead of having all TYPE_CCW_DEVICE children set the bus type to
TYPE_VIRTUAL_CSS_BUS, do it once in the abstract parent.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20210424145313.3287400-1-f4bug@amsat.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/3270-ccw.c   | 1 -
 hw/s390x/ccw-device.c | 1 +
 hw/s390x/ccw-device.h | 1 +
 hw/s390x/s390-ccw.c   | 2 --
 hw/s390x/virtio-ccw.c | 1 -
 5 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index 25e628f57573..13e93d8d8f61 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -158,7 +158,6 @@ static void emulated_ccw_3270_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, emulated_ccw_3270_properties);
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     dc->realize = emulated_ccw_3270_realize;
     dc->hotpluggable = false;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
diff --git a/hw/s390x/ccw-device.c b/hw/s390x/ccw-device.c
index c9707110e9c8..95f269ab441e 100644
--- a/hw/s390x/ccw-device.c
+++ b/hw/s390x/ccw-device.c
@@ -59,6 +59,7 @@ static void ccw_device_class_init(ObjectClass *klass, void *data)
     k->refill_ids = ccw_device_refill_ids;
     device_class_set_props(dc, ccw_device_properties);
     dc->reset = ccw_device_reset;
+    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
 }
 
 const VMStateDescription vmstate_ccw_dev = {
diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
index 832c78cd4213..6dff95225df1 100644
--- a/hw/s390x/ccw-device.h
+++ b/hw/s390x/ccw-device.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/qdev-core.h"
 #include "hw/s390x/css.h"
+#include "hw/s390x/css-bridge.h"
 
 struct CcwDevice {
     DeviceState parent_obj;
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index 242491a1aea0..c227c77984ce 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -176,10 +176,8 @@ static void s390_ccw_instance_init(Object *obj)
 
 static void s390_ccw_class_init(ObjectClass *klass, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_CLASS(klass);
 
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     cdc->realize = s390_ccw_realize;
     cdc->unrealize = s390_ccw_unrealize;
 }
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 92b950e09a13..220b9efcf945 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1234,7 +1234,6 @@ static void virtio_ccw_device_class_init(ObjectClass *klass, void *data)
     k->unplug = virtio_ccw_busdev_unplug;
     dc->realize = virtio_ccw_busdev_realize;
     dc->unrealize = virtio_ccw_busdev_unrealize;
-    dc->bus_type = TYPE_VIRTUAL_CSS_BUS;
     device_class_set_parent_reset(dc, virtio_ccw_reset, &vdc->parent_reset);
 }
 
-- 
2.30.2


