Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78065528359
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:36:09 +0200 (CEST)
Received: from localhost ([::1]:42520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZ1E-0004cp-D6
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6b-000755-Cf
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6Z-0005Oo-PZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Le7OIyHzO0FLOiKiXKDvYsiurDem4y4sL/jpgSqTauc=;
 b=F7D9ws0GA9WiATqvta1stt86Ga3wGQq92y81L0v0qVI9/tNrcJkOor8474G8ykMUk2nxJ7
 gCGJLhR0Qr2Q/jFSf8uAE8hS46bArGZLFDXB7GtbEBj+EXvEXVY8g9bRoIJGn/WEmRc2+l
 ze3FT9bx0dt0aTSVofmKYh71fuMzc/4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-ITEt79hIPQSCtl9MmXQvYw-1; Mon, 16 May 2022 06:37:33 -0400
X-MC-Unique: ITEt79hIPQSCtl9MmXQvYw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t9-20020a5d5349000000b0020d02cd51fbso468727wrv.13
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Le7OIyHzO0FLOiKiXKDvYsiurDem4y4sL/jpgSqTauc=;
 b=nPsXwnJb/DD5LhBVlO+eHAJSwBpAoq4WUyvTYk3YXZ+1iFkpFwHptCBd5jjottPGJn
 VKnthRJQMS+gl3d2d0FED+8O+eMHSjOpkFrFhNV7OuyfjJd8IKxNy8Dy+rH0ST6m/kLY
 RYO6Z+5lMEEN5lLAi+uQ1ek8IU192PzUaBIOtmeGrSn/LX6p0Rf6v9lOY6He+h0CN2M9
 mVTZGCnjDiL1Egon4m4A7GtD/ZV3I11MKFIjzTPKo6P2FJxNX9/eR/uczGVU+I6lghlZ
 PspLMrlYeElN2D8YhW7g18jpIYMaX058mgp7K8aoD6j7juO49ad28egxc0I5Hcypm5xg
 dZng==
X-Gm-Message-State: AOAM531L/6D9F3YoB/SfwQnTWK/ci+LByCfHqHvglsyjUfqm0pRcpT79
 vAND0qPZGP2J6DaHfs5kJ6QUHcxZIaJ3t2iDh9kiTwiqZuuN/aARRSWh2L6lblSidDvX4QMo0aZ
 hJ/bcZYZ2SFf/640ZnqXlyjkgTwOWt7QH47eVselaVfFYK7Pi8htjlP1cbO9t
X-Received: by 2002:adf:d1cd:0:b0:20c:51c6:5d9f with SMTP id
 b13-20020adfd1cd000000b0020c51c65d9fmr14028514wrd.244.1652697452495; 
 Mon, 16 May 2022 03:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxwhjLXJGJaXois6E0uY8t1q7Up5rRjcfsZJH1h05HGpUJfrm7t+1MoMhcy3m4naur705nqw==
X-Received: by 2002:adf:d1cd:0:b0:20c:51c6:5d9f with SMTP id
 b13-20020adfd1cd000000b0020c51c65d9fmr14028497wrd.244.1652697452229; 
 Mon, 16 May 2022 03:37:32 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c225500b00395b809dfd3sm10386069wmm.12.2022.05.16.03.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:31 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 32/91] pci/pcie_port: Add pci_find_port_by_pn()
Message-ID: <20220516095448.507876-33-mst@redhat.com>
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Simple function to search a PCIBus to find a port by
it's port number.

CXL interleave decoding uses the port number as a target
so it is necessary to locate the port when doing interleave
decoding.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-31-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_port.h |  2 ++
 hw/pci/pcie_port.c         | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index e25b289ce8..7b8193061a 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -39,6 +39,8 @@ struct PCIEPort {
 
 void pcie_port_init_reg(PCIDevice *d);
 
+PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn);
+
 #define TYPE_PCIE_SLOT "pcie-slot"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIESlot, PCIE_SLOT)
 
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index e95c1e5519..687e4e763a 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -136,6 +136,31 @@ static void pcie_port_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, pcie_port_props);
 }
 
+PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
+{
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+        PCIEPort *port;
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+
+        if (!object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            continue;
+        }
+
+        port = PCIE_PORT(d);
+        if (port->port == pn) {
+            return d;
+        }
+    }
+
+    return NULL;
+}
+
 static const TypeInfo pcie_port_type_info = {
     .name = TYPE_PCIE_PORT,
     .parent = TYPE_PCI_BRIDGE,
-- 
MST


