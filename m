Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594C6B65C9
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPY-0003Oh-VV; Sun, 12 Mar 2023 08:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPS-0003Ml-Pu
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPR-0000JN-0q
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:42 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g10so9252711eda.1
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IeEvGg++lFeh8k7cLusk/ewqgWO+0IihMJjULI+D8m0=;
 b=qcpoFIQ+HklRYXLIh6GPxiw1QBLKylV/h/epwSeIgXeIYsgzhFld/1jrTl4ToJk8nj
 amsn4w4tAi/0k5NoN0R+S4Ad9xbPurvtz099V7SwD3T8zg8uJsgiM1cy6l3KYVnOh6l6
 MZEreKMsK56ei5NEALPkXT0jKZG0b/eMDNSVgll5fU0uBn1z1UwHwdS+44xV2ylDDV7v
 rSHlYUEMLc75x8ezNSNwYDzIJyRuYg04bHSU//6HGu8TiIdi3mQ1uPri0dwvWBEaoi70
 ccc2eKvSCLY8k+suJMkrbhaI7HDGtyt5eFrq62yDUW3cY0BNf+rMFfOivEsua/+1+ye0
 YdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IeEvGg++lFeh8k7cLusk/ewqgWO+0IihMJjULI+D8m0=;
 b=GwTSsrYz/4J0rrljsg2Ro5XmgUYw4mbZO4eAgGPWIFmsZXs+ck48wc9SnQpqmX8iG6
 /mFwv1RHM3xwlYVfR13RYbZJZI3Lghy5fwC4Hka6f6OpXm1y33zATbl1XnSNbGetvlP7
 AcDrP2pGMOy6ZyPJl29nmbb8CeNeuXnioYKFQC0Bt/nDQZ1x/w+QnWo1Jg+JNLioWF/0
 qJyDZnqAprWRC44kUJOhTPmNdA2W0ooU9K81OLelTyrf5RRDsNqvK/Oh/RzQSHWVcMPD
 ti143A6aV2kvb2q3FmYEWG+BfWF5OSTvs/qU/Q49pi+x5tqEjiXyzrxRZ1Md8hWfaOOG
 9P9g==
X-Gm-Message-State: AO0yUKUtl/F5k3PgLqgTWw4ydNhDMSJtb5V7H0jarDtQwjlW9tx1f2fz
 3uxykkI2D8wssKw9NQrCzNjW2qhmzxY=
X-Google-Smtp-Source: AK7set98iz+H2osc7xMl+ULgZZLU6IRoBeyuhWbYGxcktAEzZ9GIUquNW3UPb5oD9vNj3FFNI/TtYw==
X-Received: by 2002:a17:907:608d:b0:88c:a43d:81bc with SMTP id
 ht13-20020a170907608d00b0088ca43d81bcmr37010919ejc.58.1678622559115; 
 Sun, 12 Mar 2023 05:02:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 5/6] hw/isa/piix3: Resolve redundant k->config_write
 assignments
Date: Sun, 12 Mar 2023 13:02:20 +0100
Message-Id: <20230312120221.99183-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The previous patch unified handling of piix3_write_config() accross the
PIIX3 device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 737f5c6a5d..418940139d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -308,6 +308,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix3_write_config;
     dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -356,7 +357,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
@@ -370,7 +370,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.2


