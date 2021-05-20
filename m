Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8033538A6BE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:31:10 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljfxN-00057K-Hs
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljfut-0004BH-E3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljfuq-000510-HB
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621506507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JrlLAe6nBxkVBR65Wf9lezvd2U0ROpbs621C1+5lu2g=;
 b=Oi4cvSR1CfMqzkJn+KFaML95dyqBSlPZuiWltfYMp3sK0NTKEUlZMhZJa9XRmLXz10TeET
 rCox1Puh+1ptuf4bryMrGLZFIGXCIRtz5JoS7KaaH78wdOvMsETN5RHk28E/VS67/8+6SN
 BZK9kTol6gpCtxebmZQ6p023/vKyuGo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-yNVGkN2kNs-jo69M0TkndQ-1; Thu, 20 May 2021 06:28:26 -0400
X-MC-Unique: yNVGkN2kNs-jo69M0TkndQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a50cc920000b029038cf491864cso9274629edi.14
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JrlLAe6nBxkVBR65Wf9lezvd2U0ROpbs621C1+5lu2g=;
 b=l5/w4IsmGuHDMYVcP8SucfWxOrxUd52aCSz7/1fgiFP3gPWkFGCgtpWcif4V67e8PC
 xULNzODkB6UzMdmr+lEmS+R1T+2ElrYSWUXlcnS8TNojJ4ahjvZfLZ7arrBUg4ymuNUS
 11pzldD8lvXwjUHqg7qndkERQ1Iy4Dvj4VfIHhtVCQ8fGqi5y1U1lCxdWjrG/ZFz5E4F
 yaMgo2osRTrYKEQMnmpvftIWNNMsQV4k6MxfYgUqB11KXGknfBu/bItiRGdy7vX4YJBs
 iH7STH0CnKRIuuxRS+J1yjIKQdV6Qpv1yJ5lTiTGFoiacgzR/H7WQM8YRpLsxbfdcI+U
 nXjA==
X-Gm-Message-State: AOAM5313mMBItjRqUShF8kbjhD9xYcPm6swQJjQf/Xlmko/D8zBLg36B
 2U1qb+OrOaZ1LOCtJEZ/RW7b31+gUPc2mXb42Xs+kwJjfUTaKcs6nVGRaLxZQ8kSbBUMHmNYJiH
 0c5L1rlRgAZML1+ZR0wpCuQ2Hbhyyc2EUE3cvb3zPtOjclrXpBAzaOEZwWQkpGgG+
X-Received: by 2002:a17:906:6549:: with SMTP id
 u9mr3880085ejn.506.1621506504784; 
 Thu, 20 May 2021 03:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlOVio4jzWoqi8Q77vA6zQEP50AmmaL5gfrZwdIZb6KpWqNkrafX1BEwINCANtb/iZzXOlww==
X-Received: by 2002:a17:906:6549:: with SMTP id
 u9mr3880061ejn.506.1621506504387; 
 Thu, 20 May 2021 03:28:24 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id gu16sm1128901ejb.88.2021.05.20.03.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 03:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio: Have virtio_bus_get_vdev_bad_features() return
 64-bit value
Date: Thu, 20 May 2021 12:28:22 +0200
Message-Id: <20210520102822.2471710-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Frederic Konrad <konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 019a3edbb25 ("virtio: make features 64bit wide") we
increased the 'features' field to 64-bit, but forgot to update
the virtio_bus_get_vdev_bad_features() helper. The 'bad features'
are truncated to 32-bit. The virtio_net_bad_features() handler
from the virtio-net devices is potentially affected.

Have the virtio_bus_get_vdev_bad_features() helper return the
full 64-bit value.

Cc: qemu-stable@nongnu.org
Fixes: 019a3edbb25 ("virtio: make features 64bit wide")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-bus.h | 2 +-
 hw/virtio/virtio-bus.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index ef8abe49c5a..f9955ff577a 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -122,7 +122,7 @@ uint16_t virtio_bus_get_vdev_id(VirtioBusState *bus);
 /* Get the config_len field of the plugged device. */
 size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus);
 /* Get bad features of the plugged device. */
-uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
+uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus);
 /* Get config of the plugged device. */
 void virtio_bus_get_vdev_config(VirtioBusState *bus, uint8_t *config);
 /* Set config of the plugged device. */
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 859978d2487..25a2b68a234 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -134,7 +134,7 @@ size_t virtio_bus_get_vdev_config_len(VirtioBusState *bus)
 }
 
 /* Get bad features of the plugged device. */
-uint32_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
+uint64_t virtio_bus_get_vdev_bad_features(VirtioBusState *bus)
 {
     VirtIODevice *vdev = virtio_bus_get_device(bus);
     VirtioDeviceClass *k;
-- 
2.26.3


