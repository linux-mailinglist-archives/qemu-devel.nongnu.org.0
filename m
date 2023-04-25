Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521E6EDD13
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMv-0007tr-J2; Tue, 25 Apr 2023 03:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMt-0007lF-JL
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMr-0006m0-TI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S/sucOaXOBUPGK9bWXP9UafBJ0BFNQr2ff/dyB9xOGE=;
 b=S1sq9qGx1Rx+hoIJDshriqXs/xZe0Wg4DoZvK+Hq9VuUqATbbGyhXTPFiGA/zAnttrctsr
 8m9BZQGreDywPf6/NVH6FLGeqSnqJrv5GdSXyaXCgfxgcGXhj0lD0qhYm8Op7nYLdomPNa
 5kPUnmQF2F9RnW/ybofEp9EIS0OdR4o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-4kqG95VIPeKuTSzlg9wugQ-1; Tue, 25 Apr 2023 03:45:37 -0400
X-MC-Unique: 4kqG95VIPeKuTSzlg9wugQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51460555e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408734; x=1685000734;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S/sucOaXOBUPGK9bWXP9UafBJ0BFNQr2ff/dyB9xOGE=;
 b=FCHqm8CVmDvHQIySMsa3QqkwZ9CMbYr5FlxjnlyXUpg9ihEIWH7ycFczG25m8llaze
 bHKlj9Oj7JKO5CVw96VXVgTwOhCvpEIlHxLTBa8Wg5B1Qc00jQOFDuW1vEg0AO8nkh5a
 I7GWwXvM78g+EpEYitbN1cMvMygD6Bt/U0bOWbHY/VkzAnwC7NLMEX1MtEjN4+JdrkuN
 dGKmj/Klhqpg81CsoXHNnQkc92RiWyvwWnFRRMTflLNSgvD2frWS6bV7exlDY02pxGYx
 YoP8pr3cmTlNze1zJcFjXBA62dwssk9xtdOPuIl2l+nAX+8k7VzJmkrnbVmThymeva8H
 w6sw==
X-Gm-Message-State: AAQBX9exe4UeEs2FplQoLKAMl77DWWHfq8ZybxDTyEq8uFGDiLctPcuF
 z0WVVREI/v/ysm3qh6I/95e1T/PPH6oF/pjB0sx7ISUm+rwu/eeHxTPqX94UOjaS+s2VABgJ5ui
 K31UaV8jaiNFgAmSU0qCvKLlSvsm/YzBz+p82xFiNHLBI3A5Wtmj5nw3dDCJd1fwbF55Y
X-Received: by 2002:adf:f604:0:b0:2cb:29eb:a35e with SMTP id
 t4-20020adff604000000b002cb29eba35emr14909585wrp.11.1682408734651; 
 Tue, 25 Apr 2023 00:45:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8tuMf3vAbkBJqc5CNuCJGfV9C+0bq+UMgxdUNNyI7XH1hG5iPh4kyghW1XodlnsuXin+pug==
X-Received: by 2002:adf:f604:0:b0:2cb:29eb:a35e with SMTP id
 t4-20020adff604000000b002cb29eba35emr14909571wrp.11.1682408734373; 
 Tue, 25 Apr 2023 00:45:34 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6dc6000000b002efb31d3c24sm12416494wrz.32.2023.04.25.00.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:33 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 13/31] hw/i386/amd_iommu: Set PCI static/const fields via
 PCIDeviceClass
Message-ID: <7f5a459dc8132bd15c28a0d2af1f0cf844ee19f4.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Set PCI static/const fields once in amdvi_pci_class_init.
They will be propagated via DeviceClassRealize handler via
pci_qdev_realize() -> do_pci_register_device() -> pci_config_set*().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-6-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9f6622e11f..8e4ce63f8e 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1511,9 +1511,7 @@ static void amdvi_init(AMDVIState *s)
     amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
 
     /* reset device ident */
-    pci_config_set_vendor_id(s->pci.dev.config, PCI_VENDOR_ID_AMD);
     pci_config_set_prog_interface(s->pci.dev.config, 00);
-    pci_config_set_class(s->pci.dev.config, 0x0806);
 
     /* reset AMDVI specific capabilities, all r/o */
     pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
@@ -1623,6 +1621,10 @@ static const TypeInfo amdvi_sysbus = {
 static void amdvi_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->vendor_id = PCI_VENDOR_ID_AMD;
+    k->class_id = 0x0806;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
-- 
MST


