Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F459775E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:10:54 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPNN-00019c-Q0
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIk-0002wh-V7
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIj-0000FC-He
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciBt2hYDKhvoSd8DxUzT64ugCS+WT394gSsu02mKQvA=;
 b=PmmGa4UKa6cXwpfvuOA5MjWz0AzNt9a9JzO0L+1sxmHNpswhQ8fyuSpz0a1RPeCrx/FYWn
 rhTisiFVqqh5uFoMyFCfjXqgZhARXyCTI5QMj0Bln9nI2ynxV5D6jYiMC8vDWMdUdlPJAV
 X+o3c70gmcJjQ8cQasnKY7scJ8oW/BY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-adLoEtLSPf2rIJ3Lp-ETaA-1; Wed, 17 Aug 2022 16:06:03 -0400
X-MC-Unique: adLoEtLSPf2rIJ3Lp-ETaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f5-20020a1cc905000000b003a60ef7ec71so601491wmb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ciBt2hYDKhvoSd8DxUzT64ugCS+WT394gSsu02mKQvA=;
 b=g9Mi6+Nl8sbGS3tZYK3i11mGyje6qFBLQdLlyCZTtcqrdXtsAz3zRHk8KJ5VxdKO3U
 DMFjyL8qk+3clIDvbwJFBvzlOQjsN1Xhdf3b05xDchhgoLUH2RxO3W4BMdpQDUAtU0/E
 yYSlExMDY6mWJro/MP2LcUkhe1VCho3Urw7V/8JtiLqGFKQJ7aH20biNUyRj7JUwAreZ
 PcQq0HtM2kSfsZaoW6QlBoTQ2+NFEUgl6iznj0y6NMsqe0cIdfzZ32dvEvMxneAGKiMi
 6O4o+8kmkzbDKU7Hfp3TZcZF2qW24zvUJbTsTCWHDaiuWP7vnL3lNrjI4AOHaNdyJlnb
 6JpQ==
X-Gm-Message-State: ACgBeo3kq5AELIZfYuhn7aGZY1QlnGlL6dGv2WbJVBgvhoW/gzCRdZdi
 0eAzPHbcl6kZF840y2+5P+jWml5g/4E0TFE0GK+isuJNhEemguQVe6gLHRdAV1xtqJmktvmii2d
 Rb1tlm8LRjV0Ou37vxNxFIrILd25o31QzdNiKttaDh5GuoSwl/qr4cvw0wJqg
X-Received: by 2002:a5d:5a96:0:b0:223:8131:e4f2 with SMTP id
 bp22-20020a5d5a96000000b002238131e4f2mr15289068wrb.345.1660766761602; 
 Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5CGzl8WmmNjsKvtpc3kBTR5Y09SMCahs8R1AGsp6Hidz/WOXrOmCDQ/BAMeTjIUsHYr0UT7g==
X-Received: by 2002:a5d:5a96:0:b0:223:8131:e4f2 with SMTP id
 bp22-20020a5d5a96000000b002238131e4f2mr15289050wrb.345.1660766761329; 
 Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c3b8400b003a54fffa809sm2829643wms.17.2022.08.17.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:00 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:05:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 03/12] hw/virtio: handle un-configured shutdown in virtio-pci
Message-ID: <20220817200536.350795-4-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
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


