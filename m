Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB6545E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:16:55 +0200 (CEST)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZp7-0004pv-PF
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWR-0006Re-Jv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWP-0006Cd-Vt
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3YNKpaHVU6aZSU6CCGsDhinShLfgV49ZMxOmpgL2m8=;
 b=iTeVWvSw+HbxW+sFpMNMribpOXN1Y4ASshgJuk7ZwaBtdbyaOA+8ny8Y0gLi9UtzKFG72r
 hag5Opqw8n4YIfD2eSFuflUzoKrCyDD+5CZdCKE13/FVSyrNp8DMx6ZUbM6FyT9toHFCPy
 f1leziDPN6r6FE0x/ygXzDQHRABzJYc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-bA8vhfUYMtSgd0xpOklR1w-1; Fri, 10 Jun 2022 03:57:29 -0400
X-MC-Unique: bA8vhfUYMtSgd0xpOklR1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 v8-20020a7bcb48000000b0039c62488f77so3162417wmj.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n3YNKpaHVU6aZSU6CCGsDhinShLfgV49ZMxOmpgL2m8=;
 b=KJtRZjEiHc81iyZI+XZjVDVNZwuY2LVxoElG4CJ90v+VtfGGT2n8sB4KE6u77ytQn0
 m+JbcwMICKqyCNcWJ1/Y6L0h1vINkuDlgH0mwt78ot44TcCz+MrwC5ItKW3bssmg0oQJ
 7k9PTH6MkbV+eWvGJYWuHnPgtxpYu7H2cD8rvfy7TIENfZCsbykM0AUZzRu+V4m4qLnK
 EfKcRLNHwQT+1corKy0z8JYe3lmdiLEiyqxSHDyO/U4fcfFSmhhl5eS2JN5QvOajOpyG
 k2OliqSYa/oE06Q/ng7eDLjheQUMmLtSxgb7RA23lfAw9YggC+c97aIERm2Vjr/dYwnE
 JGWQ==
X-Gm-Message-State: AOAM532/0tD4Mga245+Ssntga9aeMz37whxanXJkhda4bnLgM0MYl4rB
 2XlEa+YIom9tphE4u8GD7yyveCf0WlZpWMhK21XU0lHiyz7JpnUu4pnYlOHV8NvQjGgCMNaw+Eb
 b0BXDWh9/T2ZngGS8Wtw5moUiaAK6xdkBCpsQGnylYcltrcVH2KDibtDSJJWo
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr36335157wrw.486.1654847848331; 
 Fri, 10 Jun 2022 00:57:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdN0HiWFHJUycji3w97PvFjOmwGRPynxaGRo+k5XZ6TSTs0RG+8zW2hG4mjnFP1JGyU/6EkA==
X-Received: by 2002:a5d:67c2:0:b0:215:7a0f:71f9 with SMTP id
 n2-20020a5d67c2000000b002157a0f71f9mr36335129wrw.486.1654847848069; 
 Fri, 10 Jun 2022 00:57:28 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b002102739add8sm32691430wrn.54.2022.06.10.00.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:27 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 08/54] isa-bus: drop no longer used ISADeviceClass::build_aml
Message-ID: <20220610075631.367501-9-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/isa/isa.h |  1 -
 hw/isa/isa-bus.c     | 12 +-----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..5c5a3d43a7 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -64,7 +64,6 @@ struct IsaDmaClass {
 
 struct ISADeviceClass {
     DeviceClass parent_class;
-    void (*build_aml)(ISADevice *dev, Aml *scope);
 };
 
 struct ISABus {
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 237e2cee12..1bee1a47f1 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -191,19 +191,9 @@ ISADevice *isa_vga_init(ISABus *bus)
 void isa_build_aml(ISABus *bus, Aml *scope)
 {
     BusChild *kid;
-    ISADevice *dev;
-    ISADeviceClass *dc;
 
     QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
-        dev = ISA_DEVICE(kid->child);
-        dc = ISA_DEVICE_GET_CLASS(dev);
-        bool has_build_dev_aml = !!object_dynamic_cast(OBJECT(dev),
-                                                       TYPE_ACPI_DEV_AML_IF);
-        if (dc->build_aml) {
-            dc->build_aml(dev, scope);
-        } else if (has_build_dev_aml) {
-            call_dev_aml_func(DEVICE(dev), scope);
-        }
+        call_dev_aml_func(DEVICE(kid->child), scope);
     }
 }
 
-- 
MST


