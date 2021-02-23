Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB3322E4F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:07:16 +0100 (CET)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaDS-0007Lv-Vy
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaBe-00062i-4G
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaBa-0004Fu-FN
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGUvhmdG6O5IIMoBZ5cpMOKjDi8vDKXNdkm4Y1e5d6k=;
 b=ZPiqOYX3n1+/r3LZrg1VM4gQbgi5T8wQDTEde2394hhrN9h5ANvWhhCOFCsW/RLRnwdaWT
 EebLPqYB9ePnQSZBcpLLl16ePZ3e5l6IS67UrtMuxljBkw9q0gRZRcrSrGfvBLQd1b4nLB
 f9gJ2rO4Gnb2N6VB4865VMISveGYCDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-pcD6x91hOcOQ3dC9mLSoUQ-1; Tue, 23 Feb 2021 11:04:09 -0500
X-MC-Unique: pcD6x91hOcOQ3dC9mLSoUQ-1
Received: by mail-wm1-f71.google.com with SMTP id p8so1371739wmq.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QGUvhmdG6O5IIMoBZ5cpMOKjDi8vDKXNdkm4Y1e5d6k=;
 b=CuNyVVsQdyYPWL5n8LeY2KgPsQxKEFzksqyaE1geZ9iUg8GWQbBWO7PeryXMahV+IG
 44uMi5DPqI3OBDmcaQzV8tpcln3pEZdgV0DCUsVNl6Z+JUmytu6LorJIep8/8fstM6j8
 AWwPeq+Omf164kyTqKijFDtoKsDROg8G4/bR2dW37j/SCwqhRHbWpY9y7FlRcUjivPg1
 xfPuFKTQEuuzWNC2KEoogEuHBXkT9ojoBmLaASRojw5uB3O2wVTxUu9eGDx1E4xFiHS0
 8WjvRBnVxV1Kh2qgPU4q7MQTHlkegiobJNVAUovFQ+NiUVZZOg2dnAHpE6vHzHFKKieQ
 vqKQ==
X-Gm-Message-State: AOAM5339Qi8H/n+d3iR8uYMbp7aRxz/4bhhYX8ee3sZz4LwQOcDhHPvT
 fyqaL3TJe+u2u5hEdi5xZWVSijYbbFBaRTxRSuIhF3q/ttoMnNLr0TpezmkHwjysRJFwBLSgwT+
 XKOKiHHbdD6XD5fs+21E4VxkqlCxni7B3jvMqubFlP36QqluRHNKtzDU181BM
X-Received: by 2002:adf:d229:: with SMTP id k9mr21117312wrh.112.1614096246737; 
 Tue, 23 Feb 2021 08:04:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuE9AeAYCRhReD5wNTvH0LWXs9T9PkaaLenvvJh9sIHG5yTD9SjbMHQ8UM6e/nLTRoMJ9WGQ==
X-Received: by 2002:adf:d229:: with SMTP id k9mr21117292wrh.112.1614096246601; 
 Tue, 23 Feb 2021 08:04:06 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id c9sm3120606wmb.33.2021.02.23.08.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:06 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] ich9, piix4: add property, smm-compat, to keep
 compatibility of SMM
Message-ID: <20210223160144.1507082-11-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

The following patch will introduce incompatible behavior of SMM.
Introduce a property to keep the old behavior for compatibility.
To enable smm compat, use "-global ICH9-LPC.smm-compat=on" or
"-global PIIX4_PM.smm-compat=on"

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <47254ae0b8c6cc6945422978b6b2af2d213ef891.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/ich9.h | 1 +
 hw/acpi/piix4.c        | 2 ++
 hw/isa/lpc_ich9.c      | 1 +
 3 files changed, 4 insertions(+)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 54571c77e0..df519e40b5 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -59,6 +59,7 @@ typedef struct ICH9LPCPMRegs {
     uint8_t disable_s4;
     uint8_t s4_val;
     uint8_t smm_enabled;
+    bool smm_compat;
     bool enable_tco;
     TCOIORegs tco_regs;
 } ICH9LPCPMRegs;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 669be5bbf6..30dd9b2309 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -74,6 +74,7 @@ struct PIIX4PMState {
     qemu_irq irq;
     qemu_irq smi_irq;
     int smm_enabled;
+    bool smm_compat;
     Notifier machine_ready;
     Notifier powerdown_notifier;
 
@@ -642,6 +643,7 @@ static Property piix4_pm_properties[] = {
                      use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
+    DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index d3145bf014..3963b73520 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -775,6 +775,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 
 static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, true),
+    DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
-- 
MST


