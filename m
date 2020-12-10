Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A452C2D639B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:33:55 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPpC-0003N5-76
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPkD-0001kI-1U
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knPkA-00045O-E6
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607621320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OnkF8Tn4lCrqBLKCn21DuDMmWVcEld5oTgeMIUmzvrM=;
 b=YEoxofkEr7+po1Pe80Pm8/ewvjYLijb4KDtZepcXSmmDn1kedNnogFiYYQy53ZrGVNDl1/
 IheBnhlvwEZU8a3wukc/4V+6bboiI9/Cy0196xfnwDKyoZjIZ0fgNstXEY56z+vMDd7X0B
 z76e7YQ7Og75/udY+TodkpPVRhfUND8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-IZ0Bfo90PmmZ-7zC32av4w-1; Thu, 10 Dec 2020 12:28:39 -0500
X-MC-Unique: IZ0Bfo90PmmZ-7zC32av4w-1
Received: by mail-wr1-f71.google.com with SMTP id p16so2195466wrx.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnkF8Tn4lCrqBLKCn21DuDMmWVcEld5oTgeMIUmzvrM=;
 b=ZK9qBsW3bijt/+ZlhpLtPK4ICcMY8g3DlcUgII2j1YZLJwRcThYITjYgQ+lRoyaTAu
 1LVWWlxLf5oeUr5wmWJWhPMFejQCDzNt2YA6qJ4yhx0gIaL3Oeqtg0GNs5KcbcufBd7M
 qQobXbzzDEM6G5KL2CQZ+PZ+TtIzPPOs27RFR4FWZBzYz2gGcMMw8h+A56rPOQKmHRU2
 Mu8kX4KUPeGFTZmhjnKinUXP4z+eWiDTFw+uMim/tGC/PZgUB+MldlK4QvG2AGdxzvja
 2nSqSwDffyJPcEZ7f/p/df4q693iTnZ7S9Cebii7YArnuSQJshkk0YaquVElUgZpUTLO
 mdNQ==
X-Gm-Message-State: AOAM532c47m0T5cgHmbklOcMOkDB27YnULvUBJSj21zHrOJhwoxeMg+C
 1EV4WcmSvBicLqxfKK8/iQqBEXVRWmXKUrrmIbbROMHa0OaOAYD/EqKiTN1G8VlANIHFf74RC5v
 aUV/xjoF8lOUqUVS1lQOt+GS6DYhEWVkbZXEy+fWstW0zES/FtmZ3c69mn+Lc+YzI
X-Received: by 2002:adf:8b8f:: with SMTP id o15mr9560619wra.311.1607621317036; 
 Thu, 10 Dec 2020 09:28:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9zFPfiITG2inh9BBvSevH3g6HsV2chB5pJXQWKTD/Ts0lUIWKFH46Wowf0PMMx4MwtX8fGg==
X-Received: by 2002:adf:8b8f:: with SMTP id o15mr9560596wra.311.1607621316768; 
 Thu, 10 Dec 2020 09:28:36 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id p19sm12765072wrg.18.2020.12.10.09.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:28:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Date: Thu, 10 Dec 2020 18:28:34 +0100
Message-Id: <20201210172834.178052-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace I/O write error reported with error_report() by
qemu_log_mask(GUEST_ERROR) which allow filtering.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index f863f69ede4..094c36aa3ea 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -27,6 +27,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
@@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
         break;
     default:
-        error_report("%s: unexpected address 0x%x value 0x%x",
-                     __func__, addr, val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unexpected address 0x%x value 0x%x\n",
+                      __func__, addr, val);
         break;
     }
 }
-- 
2.26.2


