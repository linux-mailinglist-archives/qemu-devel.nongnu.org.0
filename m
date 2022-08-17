Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8F597407
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:20:44 +0200 (CEST)
Received: from localhost ([::1]:46710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLmc-0005Td-RT
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgs-0007p9-Rt
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgr-0001QM-Cz
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciBt2hYDKhvoSd8DxUzT64ugCS+WT394gSsu02mKQvA=;
 b=JkGI0SIzf/7z5qMaVRKEM6fWysxmW44+ZQQJ7SeVHnGqMyqzkWzdbvxKvCYXPIxkLleT6o
 0aNDU4hPRXHxJN+wCElqT2lb7DKc3+R+4lzg1FrDeUGT+Yl9egl1sGtRq/VpUy8u/28/4u
 ZbvrwWVwQs/V8Hlp17K8JzpO/qI8Nsg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-yWomPahsPSq-epQI6Oy1Bw-1; Wed, 17 Aug 2022 12:14:43 -0400
X-MC-Unique: yWomPahsPSq-epQI6Oy1Bw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m7-20020adfa3c7000000b002251ddd0e05so1023417wrb.10
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ciBt2hYDKhvoSd8DxUzT64ugCS+WT394gSsu02mKQvA=;
 b=dZi+v9a3jzY8WRxjA8H6Z1qYAbIghTm3IBjLVX0pyRVvdR/jUCUzPLQbV70Cqe5Kpl
 rIbQGM1dJhqhREb33zjqM2CjD7Rq3N7k0AyFuGj16p0+7Ts1jZ7PDU53A3uZX8s69V+X
 PE1Iu3U1ovDgk+RdRZLyxJVC0Hh0hdgye6G8zTuC0kyRK+NGdQPbeDJlNGB5lISaKxxv
 L5siGU/A/ia95W7y+i3nZou3yeTNruLf16mFt7ChJAGFbjznHizW1oSIlvZ0HrINYIMg
 Ngzz1DQTUvBnCsW1OTd17cW06YyDpz8mEl0FJiqh8BsC7Ob3GJhwv4TqsA20V0M+Zr9V
 W93A==
X-Gm-Message-State: ACgBeo3L41Feg8WsUsy2mwIoVvmfWI9Ybzy6bxe4SWRLMXMIWv6p6VVe
 0xYahgfdAMiSSO553xGtQJcrOzCB0l3bXjC/pTdmUz/S/RGWuO1fa7qoGJ/Zy2LNCGUSFyewwUF
 IUS5iFidc15lqSDPwJ7K8D2mDyg2BiWWyEyGuF4g8A9zv7a2lg27H+Anqqdsh
X-Received: by 2002:adf:fc88:0:b0:220:61dc:d297 with SMTP id
 g8-20020adffc88000000b0022061dcd297mr14235067wrr.660.1660752882239; 
 Wed, 17 Aug 2022 09:14:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6I970uUIeB6Cn59nmyl+31nqJzE7HbTxOcOOvg+1AeaEKx7YiFeAkbP3xKVrLdWMP1RDsF1w==
X-Received: by 2002:adf:fc88:0:b0:220:61dc:d297 with SMTP id
 g8-20020adffc88000000b0022061dcd297mr14235047wrr.660.1660752881921; 
 Wed, 17 Aug 2022 09:14:41 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 f16-20020adfb610000000b002237fd66585sm13148998wre.92.2022.08.17.09.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:41 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 03/10] hw/virtio: handle un-configured shutdown in virtio-pci
Message-ID: <20220817161342.240674-4-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

The assert() protecting against leakage is a little aggressive and
causes needless crashes if a device is shutdown without having been
configured. In this case no descriptors are lost because none have
been assigned.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220728135503.1060062-4-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..5ce61f9b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 
     nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
 
-    /* When deassigning, pass a consistent nvqs value
-     * to avoid leaking notifiers.
+    /*
+     * When deassigning, pass a consistent nvqs value to avoid leaking
+     * notifiers. But first check we've actually been configured, exit
+     * early if we haven't.
      */
+    if (!assign && !proxy->nvqs_with_notifiers) {
+        return 0;
+    }
     assert(assign || nvqs == proxy->nvqs_with_notifiers);
 
     proxy->nvqs_with_notifiers = nvqs;
-- 
MST


