Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA55253C1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:35:11 +0200 (CEST)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCiU-0006aA-EM
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZC-0004w1-4U
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZA-00057P-BT
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oe4KepM/03JL/WoswzvpslbfbDvx5+MlZZIKuN0XaDI=;
 b=K7LyPnsvLBnY8AFvIzyI5EutY/qimxRwcJnPBgiKIHlOjq9mXLMcmCNddLCyNDUDpUXE6X
 DOvYVqICoP2cufv2FNsDsQMtqwdsr+FqlQkvReQ7iwghP6scSKq+q1etti7S9inVZQP/LC
 7PKBCzvj3UE0qhf17SbWlwTV4NOC8zw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-tdVSbLGQOKWtCRur-UZQTA-1; Thu, 12 May 2022 13:25:30 -0400
X-MC-Unique: tdVSbLGQOKWtCRur-UZQTA-1
Received: by mail-ed1-f71.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso3489641edv.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oe4KepM/03JL/WoswzvpslbfbDvx5+MlZZIKuN0XaDI=;
 b=nfU06GoJTN6tBI6r3xVW2CeVK2zs0GKyqg92w16UM38+PKlbdsFfFvVFhIIU4PlNT4
 jQb1kqaj+lt6A6gsmATq2Jq8c1Xt8FPAPnh5omjWRFU0/NiQnOW8DBoNVrV4XA3StBWk
 9omMYoyJXBbyngZm4nEOkwbnEv3x+DlTiSny972X8voMiHov4w1GLxTjoRXMgQ+Mey4D
 IAC+TLanU8dv78pb0IlsXLIIlRokMAUdzfQIuzn0LHJV+jEhUQavgVHKoIT0PFiOA4+v
 ++lZg8fhrwhQknZ+3h0o5mSwsDLsayvi8t8+9NJkgEeZxlPbu2w53Dkugh1wJuW2585P
 DTbQ==
X-Gm-Message-State: AOAM532rUrPGcOsgbszgHJ899M+AGXIkHbNVW09VyXr7V79SjqLL1act
 JRwFN2ZfR2JnUtQwrEdFYJbGubz0ON5YmP/rE0NEHsKeqvBgIyE1Mr1qHdIU7Fz3h0Nhko33Yqw
 PqmIafyaDDfYsQclWsaXlmZBIB4glRN1CT67qyVb5s05NYjogmbN3cgYFBVdILC2hcfQ=
X-Received: by 2002:a17:907:60cf:b0:6f4:4240:849 with SMTP id
 hv15-20020a17090760cf00b006f442400849mr855739ejc.566.1652376328425; 
 Thu, 12 May 2022 10:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqvc3fjzOolikfFWs/UMrxgjByKT+gF/3KqXwOhenC/irIDLJXk+U3AmY00fMpIozAJQSK9A==
X-Received: by 2002:a17:907:60cf:b0:6f4:4240:849 with SMTP id
 hv15-20020a17090760cf00b006f442400849mr855708ejc.566.1652376328109; 
 Thu, 12 May 2022 10:25:28 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a1709066d0300b006f3ef214deasm2294243ejr.80.2022.05.12.10.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/27] tests/qtest/libqos: Skip hotplug tests if pci root bus
 is not hotpluggable
Date: Thu, 12 May 2022 19:24:47 +0200
Message-Id: <20220512172505.1065394-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

ARM does not not support hotplug on pcie.0. Add a flag on the bus
which tells if devices can be hotplugged and skip hotplug tests
if the bus cannot be hotplugged. This is a temporary solution to
enable the other pci tests on aarch64.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220504152025.1785704-3-eric.auger@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/e1000e-test.c         |  6 ++++++
 tests/qtest/libqos/pci.h          |  1 +
 tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
 tests/qtest/virtio-blk-test.c     |  5 +++++
 tests/qtest/virtio-net-test.c     |  5 +++++
 tests/qtest/virtio-rng-test.c     |  5 +++++
 6 files changed, 32 insertions(+)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index ddd6983ede..c98779c7c0 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -233,6 +233,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
 static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
 {
     QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
 
     qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
     qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index a3c657d962..8389614523 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -52,6 +52,7 @@ struct QPCIBus {
     uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
+    bool not_hotpluggable; /* TRUE if devices cannot be hotplugged */
 
 };
 
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 659b5050d8..a81c2a2715 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -676,6 +676,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
                          "{'addr': %s, 'chardev': 'char2'}",
@@ -703,6 +708,11 @@ static void multiqueue(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t features;
     uint16_t num_queues;
 
+    if (pdev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("bus pci.0 does not support hotplug");
+        return;
+    }
+
     /*
      * The primary device has 1 queue and VIRTIO_BLK_F_MQ is not enabled. The
      * VIRTIO specification allows VIRTIO_BLK_F_MQ to be enabled when there is
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index f22594a1a8..dc5eed31c8 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -701,6 +701,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "virtio-blk-pci", "drv1",
                          "{'addr': %s, 'drive': 'drive1'}",
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index fc9f2b9498..6ded252901 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -173,6 +173,11 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QTestState *qts = dev->pdev->bus->qts;
     const char *arch = qtest_get_arch();
 
+    if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     qtest_qmp_device_add(qts, "virtio-net-pci", "net1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index 092ba13068..64e131cd8c 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -20,6 +20,11 @@ static void rng_hotplug(void *obj, void *data, QGuestAllocator *alloc)
     QVirtioPCIDevice *dev = obj;
     QTestState *qts = dev->pdev->bus->qts;
 
+   if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     const char *arch = qtest_get_arch();
 
     qtest_qmp_device_add(qts, "virtio-rng-pci", "rng1",
-- 
2.36.0


