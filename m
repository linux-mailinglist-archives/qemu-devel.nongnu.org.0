Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96062525434
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:54:14 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD0v-0003JP-LJ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ8-0004vU-CF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ6-00056s-SF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMhlegU5X7v4zybSvupxv2MQWMoceupfsJnt/6J7Atw=;
 b=DUzhcZ+ZnP1kFXkv4OYWCuu88Zx8ne2VEmtb856n3WyszrZJ8SLGbLA9Hb+y2Mf6K5f+x/
 1YfmtG6TkBqszDLsX58JglRx7LoTIjhcj4JaH1V1Yfs3d1Y+F48NZ2x+DAFd+0/jTRO483
 pxCPd/vf8W/waVmJ6U/1MebPhCbbhzQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-PJvGUTC5PMWGE_yYsxhKYA-1; Thu, 12 May 2022 13:25:26 -0400
X-MC-Unique: PJvGUTC5PMWGE_yYsxhKYA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr42-20020a1709073faa00b006f4dc7f0be1so3153890ejc.22
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qMhlegU5X7v4zybSvupxv2MQWMoceupfsJnt/6J7Atw=;
 b=1tB2S8//Gh43tbKt4fXd2l14V3Gs3iCNPJGmc8yyxFjRmtJFtuAxcbaB92phvZgyrV
 x8ILyccWv8uxqPm0K2OdGQbaeln0ruULlaQYFOUGSaVAZ804sP9YVmd0iUEe2VNtFB7h
 DKfcZUJpqY6+9//O82n3/+hi1Ho2ytVJhknkJGs/3krVS/fZvP824xgNQkKLZgJF+5TB
 x+6umGye2PjkW88VBwdBKmZ7KBJWIZh2TfEJklSP0AcCeO3rrY8yR7VBlyP5N+Yt5zRQ
 45UMPKzaAMYm7oqnsqQK0S8WWo1dinliB9z4tQAz/YT5tSaXN9KAK2Kb6TLv9mZ/UUfl
 7+4A==
X-Gm-Message-State: AOAM532q3hAivnG6bsXVGnug8U8Ajysq4cEa3qUM/NITrhjIf+yBl20L
 G3B1ubeDjAmLr5/YVjqyRLcDFaNyf6dsox7ME2OWxi0DU/vI/jqWwT/bm3n71dM3BWY96NW28lF
 WkSSiunCmVylRmQSS9Q+KWn/k0x4kthnQv2FO/nTVtTad2EwsZ3Jxw9hlhqQuuAOy8eQ=
X-Received: by 2002:a50:ce14:0:b0:425:cb75:5322 with SMTP id
 y20-20020a50ce14000000b00425cb755322mr36850578edi.386.1652376324570; 
 Thu, 12 May 2022 10:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvk7bA6pGqSCVht/84tt/bvBx0VSS28vnfGT0OAYsBbFxzAUvxDHxY2jRT013qyX9CNAblQA==
X-Received: by 2002:a50:ce14:0:b0:425:cb75:5322 with SMTP id
 y20-20020a50ce14000000b00425cb755322mr36850543edi.386.1652376324246; 
 Thu, 12 May 2022 10:25:24 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056402138500b0042a2d9af0f8sm1678753edv.79.2022.05.12.10.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 07/27] hw/xen/xen_pt: Resolve
 igd_passthrough_isa_bridge_create() indirection
Date: Thu, 12 May 2022 19:24:45 +0200
Message-Id: <20220512172505.1065394-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Bernhard Beschow <shentey@gmail.com>

Now that igd_passthrough_isa_bridge_create() is implemented within the
xen context it may use Xen* data types directly and become
xen_igd_passthrough_isa_bridge_create(). This resolves an indirection.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20220326165825.30794-3-shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xen/xen_pt.c          | 11 -----------
 hw/xen/xen_pt.h          |  3 ++-
 hw/xen/xen_pt_graphics.c |  5 ++++-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 829ea9985f..0ec7e52183 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -701,17 +701,6 @@ static const MemoryListener xen_pt_io_listener = {
     .priority = 10,
 };
 
-static void
-xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                      XenHostPCIDevice *dev)
-{
-    uint16_t gpu_dev_id;
-    PCIDevice *d = &s->dev;
-
-    gpu_dev_id = dev->device_id;
-    igd_passthrough_isa_bridge_create(pci_get_bus(d), gpu_dev_id);
-}
-
 /* destroy. */
 static void xen_pt_destroy(PCIDevice *d) {
 
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 806d832c94..e7c4316a7d 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -43,7 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index f1fbb98912..f303f67c9c 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -375,10 +375,13 @@ static void pt_graphics_register_types(void)
 }
 type_init(pt_graphics_register_types)
 
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev)
 {
+    PCIBus *bus = pci_get_bus(&s->dev);
     struct PCIDevice *bridge_dev;
     int i, num;
+    const uint16_t gpu_dev_id = dev->device_id;
     uint16_t pch_dev_id = 0xffff;
     uint8_t pch_rev_id = 0;
 
-- 
2.36.0


