Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C525283E0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:09:30 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZXV-00014w-NH
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9K-0002dI-Pp
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9J-0005mL-1F
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwK/p5+FmU17Oa8SJM6EBBCm87cG2gPVSdHa2qFFojk=;
 b=Oqi0UVCV7WylyLfb2XzSAOXcNLE86jRxHvbGADvPk0ebr4VjK91KbffTKHxZG/6O0m73u0
 6QQbjYWpjnHQ4b3SlowsnwOMz4LH0ztVvD/jUwDVRbCje0/ttQnvbdSKNE1hVQRGfjdsuU
 MLXobF2igAkZkFzgD374c95RXHgWHxA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-mLVulz0CNaC73zZZGlMUZw-1; Mon, 16 May 2022 06:40:23 -0400
X-MC-Unique: mLVulz0CNaC73zZZGlMUZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso5448414wmb.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PwK/p5+FmU17Oa8SJM6EBBCm87cG2gPVSdHa2qFFojk=;
 b=R9WDs2p6mmmuXiOPLDuzev1hpNfG1O8zC73EqDVBm865rckr3KlvJhwtYc123uWO8c
 tAKngR50rASTnOjlynzJS+Q0LMgeB36Q27Eh5RZSsLnYUCGweDui4kIh8Nl0JHZAiKIY
 0neBo5eAj++zcC6BTqM5dQviQIbXDS+AqMa3Itzg/IALa8pYS+VRoEZp3x9Dq4wPutQb
 TwkLTQbtvYnrf5VxKwlG9BdZjL+DpJqSjuJynkZIfN62fJeSr9nXeJ5PHCH+r61sJb6I
 iCGzLvFm1enMSSwwYsiAnGvrw64RQDdUNiVsj21iDG+vRJT5gyLq83JipBYWtx3dsM+q
 f0Yg==
X-Gm-Message-State: AOAM531zDtt9TqCIav3T48v9ujT8zZn6b7msjk0XA2ae4flUv/YHb/p3
 GuJ+OAE4ws+w6KZfSf0MSzjHw/O1m3t2DM4ZLzk72aGlesyQyIQ86Yo29/zR9C32s6eezGtIyWe
 gP2IAM5ni6FGJLEapiGTuFz1v8t/Gh7bnwyahaeP1qXxddkNxSRwkTx0Zs9w4
X-Received: by 2002:adf:f102:0:b0:20d:8d:870e with SMTP id
 r2-20020adff102000000b0020d008d870emr7525442wro.292.1652697621767; 
 Mon, 16 May 2022 03:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW3/D1o1IZUOJi9OhOoPrtGavm5AHLoRRqX513r5Ka+MPZkhYSHyWPgKRVk7jELPRm295rmg==
X-Received: by 2002:adf:f102:0:b0:20d:8d:870e with SMTP id
 r2-20020adff102000000b0020d008d870emr7525426wro.292.1652697621544; 
 Mon, 16 May 2022 03:40:21 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 p5-20020a7bcc85000000b003942a244f33sm12840809wma.12.2022.05.16.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:21 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 80/91] include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
Message-ID: <20220516095448.507876-81-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Francisco Iglesias <frasse.iglesias@gmail.com>

According to [1] address bits 27 - 20 are mapped to the bus number (the
TLPs bus number field is 8 bits). Below is the formula taken from Table
7-1 in [1].

"
Memory Address | PCI Express Configuration Space
A[(20+n-1):20] | Bus Number, 1 ≤ n ≤ 8
"

[1] PCI Express® Base Specification Revision 5.0 Version 1.0

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220411221836.17699-2-frasse.iglesias@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_host.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 076457b270..b3c8ce973c 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -60,7 +60,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 /*
  * PCI express ECAM (Enhanced Configuration Address Mapping) format.
  * AKA mmcfg address
- * bit 20 - 28: bus number
+ * bit 20 - 27: bus number
  * bit 15 - 19: device number
  * bit 12 - 14: function number
  * bit  0 - 11: offset in configuration space of a given device
@@ -68,7 +68,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 #define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
 #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
 #define PCIE_MMCFG_BUS_BIT              20
-#define PCIE_MMCFG_BUS_MASK             0x1ff
+#define PCIE_MMCFG_BUS_MASK             0xff
 #define PCIE_MMCFG_DEVFN_BIT            12
 #define PCIE_MMCFG_DEVFN_MASK           0xff
 #define PCIE_MMCFG_CONFOFFSET_MASK      0xfff
-- 
MST


