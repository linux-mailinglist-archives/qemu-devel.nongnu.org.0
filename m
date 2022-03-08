Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E744D1DC6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:51:12 +0100 (CET)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd3H-0001vS-Eb
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcym-0004X5-OH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:32 -0500
Received: from [2607:f8b0:4864:20::62d] (port=40631
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyl-0003XZ-2K
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z11so17576991pla.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QnH0u2mloT38DdZYDMhYJlsD1hmCTcvE54mpXM2UaYs=;
 b=laycV2cqUhWcF/WdTR0EjcMr049ljSsXZtpPYgqjPUKVUdLwEhB+X7x/qmVEPhM53F
 EZTtERAf5ZYTnB58ig8qXonVXBuivumCdEHUH8vqWEHk0qq8Q1FoTs4abCvdKkXsYOte
 DCoIyX8FEglja5WYSgwfvOVot3YI8ZGqEZo4MruEDCUSrsSPeFUQMiG0mR0gj/XQvtaw
 vIB9g47L/2mR5N2dTRiXJpAILPJ7gIViY1glWek1I1NTH3JXF802qzh6QunBsE2liitw
 BUmh/ooz/amvFQrDuQZYH1zuGFh4UA6yYgGxs69mY1IJ+nrqCriTjBxcYfbOY+SaiHkj
 Gn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QnH0u2mloT38DdZYDMhYJlsD1hmCTcvE54mpXM2UaYs=;
 b=hKjc08xdn8gu5Hmib0kDxzwJb3/EB/aee007UHo9mphQ7W+erS4lnf7rAZ2LQp6BSJ
 RTSqOJdNB0XZJsjHDB+eykF1eGdu3Qqnw6QNvhloCKZI/TJgKxOhe3XQSQyDDRaUXhWH
 70hePihJX4S8UgVzktdVTmjWDAemkXdjB5NRRktG3lAqhCU7rKpMrd/0v8scHD/A0rkL
 UWsLL76p1A6r+R+eRcG3cRsc/mXFwZcvMhAra+nJ0Bt0pimqj1ZAnijAqq0jamQKQNP0
 nsQAlawUA7DsD/45fUg57NZITIvXfbSsxMeAbpg//pESmJsuL8rULqPqfQ3ApsUpCq1h
 yE6A==
X-Gm-Message-State: AOAM531gkXD4ILe96UZQHOt9z9AuhVNUQnPlwf8qwvcXNdvadnioXx9g
 qBf6QM5E+beadVpK0R2Wdmhlyg==
X-Google-Smtp-Source: ABdhPJzFeF9W0p4KZqbkXuK/nio/Jnk2dYgaMI+/Ji1Y6TGt3YUl86tUDwaaQehbpZZxkW+o33BJTg==
X-Received: by 2002:a17:902:7043:b0:14f:47:a455 with SMTP id
 h3-20020a170902704300b0014f0047a455mr18291726plt.44.1646757989766; 
 Tue, 08 Mar 2022 08:46:29 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.121.168])
 by smtp.googlemail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm3566459pjb.0.2022.03.08.08.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:46:29 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: libvir-list@redhat.com
Subject: [libvirt] [PATCH RESEND v2 1/4] qemu: capablities: detect
 acpi-pci-hotplug-with-bridge-support
Date: Tue,  8 Mar 2022 22:15:50 +0530
Message-Id: <20220308164553.2312425-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164553.2312425-1-ani@anisinha.ca>
References: <20220308164553.2312425-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu added support for i440fx specific global boolean flag

PIIX4_PM.acpi-pci-hotplug-with-bridge-support

around version 2.1. This flag is enabled by default. When disabled, it
turns off acpi pci hotplug for cold plugged pci bridges in i440fx
machine types.

Very recently, in qemu version 6.1, the same global option was also
added for q35 machine types as well.

ICH9-LPC.acpi-pci-hotplug-with-bridge-support

This option turns on or off acpi based hotplug for cold plugged pcie
bridges like pcie root ports. This flag is also enabled by
default. Please refer to the following qemu changes:

c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
17858a16950860 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")

This patch adds the corresponding qemu capabilities in libvirt. For
i440fx, the capability is detected as
QEMU_CAPS_PIIX_ACPI_HOTPLUG_BRIDGE. For q35, the capability is
detected as QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE.

Please note that the test specific qemu capabilities .replies files
has already been updated as a part of regular refreshing them when a
new qemu version is released. Hence, no updates to those files are
required.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 src/qemu/qemu_capabilities.c                     | 4 ++++
 src/qemu/qemu_capabilities.h                     | 3 +++
 tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml | 1 +
 tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml | 1 +
 tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml | 1 +
 5 files changed, 10 insertions(+)

diff --git a/src/qemu/qemu_capabilities.c b/src/qemu/qemu_capabilities.c
index 529e9ceaf5..08d5d733ce 100644
--- a/src/qemu/qemu_capabilities.c
+++ b/src/qemu/qemu_capabilities.c
@@ -665,6 +665,9 @@ VIR_ENUM_IMPL(virQEMUCaps,
               "virtio-mem-pci.prealloc", /* QEMU_CAPS_DEVICE_VIRTIO_MEM_PCI_PREALLOC */
               "calc-dirty-rate", /* QEMU_CAPS_CALC_DIRTY_RATE */
               "dirtyrate-param.mode", /* QEMU_CAPS_DIRTYRATE_MODE */
+
+              /* 425 */
+              "ich9.acpi-hotplug-bridge", /* QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE */
     );
 
 
@@ -1551,6 +1554,7 @@ static struct virQEMUCapsDevicePropsFlags virQEMUCapsDevicePropsVirtioGpu[] = {
 static struct virQEMUCapsDevicePropsFlags virQEMUCapsDevicePropsICH9[] = {
     { "disable_s3", QEMU_CAPS_ICH9_DISABLE_S3, NULL },
     { "disable_s4", QEMU_CAPS_ICH9_DISABLE_S4, NULL },
+    { "acpi-pci-hotplug-with-bridge-support", QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE, NULL },
 };
 
 static struct virQEMUCapsDevicePropsFlags virQEMUCapsDevicePropsUSBNECXHCI[] = {
diff --git a/src/qemu/qemu_capabilities.h b/src/qemu/qemu_capabilities.h
index f6188b42de..51dc668913 100644
--- a/src/qemu/qemu_capabilities.h
+++ b/src/qemu/qemu_capabilities.h
@@ -641,6 +641,9 @@ typedef enum { /* virQEMUCapsFlags grouping marker for syntax-check */
     QEMU_CAPS_CALC_DIRTY_RATE, /* accepts calc-dirty-rate */
     QEMU_CAPS_DIRTYRATE_MODE , /* calc-dirty-rate accepts mode parameter */
 
+    /* 425 */
+    QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE, /* -M q35 ICH9-LPC.acpi-pci-hotplug-with-bridge-support */
+
     QEMU_CAPS_LAST /* this must always be the last item */
 } virQEMUCapsFlags;
 
diff --git a/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
index ba1aecc37e..51e1e07d2f 100644
--- a/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
+++ b/tests/qemucapabilitiesdata/caps_6.1.0.x86_64.xml
@@ -239,6 +239,7 @@
   <flag name='rbd-encryption'/>
   <flag name='sev-inject-launch-secret'/>
   <flag name='calc-dirty-rate'/>
+  <flag name='ich9.acpi-hotplug-bridge'/>
   <version>6001000</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>43100243</microcodeVersion>
diff --git a/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
index d77907af55..7b665c82e8 100644
--- a/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
+++ b/tests/qemucapabilitiesdata/caps_6.2.0.x86_64.xml
@@ -241,6 +241,7 @@
   <flag name='sev-inject-launch-secret'/>
   <flag name='calc-dirty-rate'/>
   <flag name='dirtyrate-param.mode'/>
+  <flag name='ich9.acpi-hotplug-bridge'/>
   <version>6002000</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>43100244</microcodeVersion>
diff --git a/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml b/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
index ae800abcc4..692e2f14da 100644
--- a/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
+++ b/tests/qemucapabilitiesdata/caps_7.0.0.x86_64.xml
@@ -243,6 +243,7 @@
   <flag name='virtio-mem-pci.prealloc'/>
   <flag name='calc-dirty-rate'/>
   <flag name='dirtyrate-param.mode'/>
+  <flag name='ich9.acpi-hotplug-bridge'/>
   <version>6002050</version>
   <kvmVersion>0</kvmVersion>
   <microcodeVersion>43100243</microcodeVersion>
-- 
2.25.1


