Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0D405FDE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:10:01 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTBA-0006k2-B8
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oJM6YQgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8W-0004XU-26
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:16 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:47795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oJM6YQgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8U-0003XF-4d
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:15 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 jz9-20020a0562140e6900b0037795ee01abso216255qvb.14
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NXWt55pjezy5dMEkLACY8sKG8zq8Wfg4Vr71HclTn7E=;
 b=RWmIO7eOIgVOZ39kBtCqu7cAEAv+i84BHiEgA2DOlusjey4Id95tq9k1gYnTqz8zyI
 geYKO2avf1QbQGZpgLI8bUqzFE/xcAeK90wqfZ5fWm/pXH8zKMMf3RnknmrKc8xzwc7w
 1Qws9q2VaUK4d8u0Qrnz4W8Lv2gTwts78Vxs6erijnGZd9J9fMNMaXH4x/4ToXvFSR65
 paHomHtTDE74u4aLHjzelyTgzk7Y9AZ5fM9B78ll+fHW1rW84Yue5Bi3dTulm7itomi3
 GTahm0kdhV4gzRGUcoUwBYNt8y57q2HiVZT/KPam5bhEgMX5HDin8PbKS91LMZtYkbqP
 GYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NXWt55pjezy5dMEkLACY8sKG8zq8Wfg4Vr71HclTn7E=;
 b=EZ0d453+K7Iv3FyFCMUhGcY51yrsHjogvqB8xJVxwkJkYdN2cZKrQjFb5CYiktUbXX
 bs8NVk+KTlmDT5SgyqoCearmmA4wf1FWTXrS7SKL9J5j/DwQLcclZ6X209V2jBOSNNdu
 c0RC/J6Gx4UGJe/eGns40n/dhfKDiLTmfqXDsDWVyathmw9RRcVLXXVhZXdnum21nGKz
 tgF2gpph0US+PngpBraKkhHDoP17Zfmbv9PtA5N3JH/HF8w6GCIWVZFjDw2xRWm0bZFL
 N+oCTPs5XDB2imX5W8EyHpboaH2+nMmdyiYJCbADYnaEKfW0b1Md39AXTZcd5pjhs+Kh
 yVNQ==
X-Gm-Message-State: AOAM531OHFzanHyPSWI4V/Vr7oTlj145xEbWgDPa74nhYHWKdePwmOA+
 yUM/G4W+hNM6VR0zfuCwRtIcM9sUFIulug==
X-Google-Smtp-Source: ABdhPJxr9c7YhOXnXGkwYFhugAu/ORgFmEKxeX1arpUaVFEJydESMzMMMLfWNsx24KaJF0fPXpecKhiLATNe5Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:e2d3:: with SMTP id
 t19mr5427565qvl.23.1631228832567; Thu, 09 Sep 2021 16:07:12 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:14 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 2/8] docs/specs: IPMI device emulation: main processor
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3oJM6YQgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Havard Skinnemoen <hskinnemoen@google.com>

This document is an attempt to briefly document the existing IPMI
emulation support on the main processor. It provides the necessary
background for the BMC-side IPMI emulation proposed by the next patch.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/specs/index.rst |   1 +
 docs/specs/ipmi.rst  | 100 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 docs/specs/ipmi.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 65e9663916..1b5d177d53 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -11,6 +11,7 @@ guest hardware that is specific to QEMU.
    ppc-spapr-xive
    ppc-spapr-numa
    acpi_hw_reduced_hotplug
+   ipmi
    tpm
    acpi_hest_ghes
    acpi_cpu_hotplug
diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
new file mode 100644
index 0000000000..adb098b53d
--- /dev/null
+++ b/docs/specs/ipmi.rst
@@ -0,0 +1,100 @@
+=====================
+IPMI device emulation
+=====================
+
+QEMU supports emulating many types of machines. This includes machines that may
+serve as the main processor in an IPMI system, e.g. x86 or POWER server
+processors, as well as machines emulating ARM-based Baseband Management
+Controllers (BMCs), e.g. AST2xxx or NPCM7xxx systems-on-chip.
+
+Main processor emulation
+========================
+
+A server platform may include one of the following system interfaces for
+communicating with a BMC:
+
+* A Keyboard Controller Style (KCS) Interface, accessible via ISA
+  (``isa-ipmi-kcs``) or PCI (``pci-ipmi-kcs``).
+* A Block Transfer (BT) Interface, accessible via ISA (``isa-ipmi-bt``) or PCI
+  (``pci-ipmi-bt``).
+* An SMBus System Interface (SSIF; ``smbus-ipmi``).
+
+These interfaces can all be emulated by QEMU. To emulate the behavior of the
+BMC, the messaging interface emulators use one of the following backends:
+
+* A BMC simulator running within the QEMU process (``ipmi-bmc-sim``).
+* An external BMC simulator or emulator, connected over a chardev
+  (``ipmi-bmc-extern``). `ipmi_sim
+  <https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.ipmi_sim>`_
+  from OpenIPMI is an example external BMC emulator.
+
+The following diagram shows how these entities relate to each other.
+
+.. blockdiag::
+
+    blockdiag main_processor_ipmi {
+        orientation = portrait
+        default_group_color = "none";
+        class msgif [color = lightblue];
+        class bmc [color = salmon];
+
+        ipmi_sim [color="aquamarine", label="External BMC"]
+        ipmi-bmc-extern <-> ipmi_sim [label="chardev"];
+
+        group {
+            orientation = portrait
+
+            ipmi-interface <-> ipmi-bmc;
+
+            group {
+                orientation = portrait
+
+                ipmi-interface [class = "msgif"];
+                isa-ipmi-kcs [class="msgif", stacked];
+
+                ipmi-interface <- isa-ipmi-kcs [hstyle = generalization];
+            }
+
+
+            group {
+                orientation = portrait
+
+                ipmi-bmc [class = "bmc"];
+                ipmi-bmc-sim [class="bmc"];
+                ipmi-bmc-extern [class="bmc"];
+
+                ipmi-bmc <- ipmi-bmc-sim [hstyle = generalization];
+                ipmi-bmc <- ipmi-bmc-extern [hstyle = generalization];
+            }
+
+        }
+    }
+
+IPMI System Interfaces
+----------------------
+
+The system software running on the main processor may use a *system interface*
+to communicate with the BMC. These are hardware devices attached to an ISA, PCI
+or i2c bus, and in QEMU, they all need to implement ``ipmi-interface``.
+This allows a BMC implementation to interact with the system interface in a
+standard way.
+
+IPMI BMC
+--------
+
+The system interface devices delegate emulation of BMC behavior to a BMC
+device, that is a subclass of ``ipmi-bmc``. This type of device is called
+a BMC because that's what it looks like to the main processor guest software.
+
+The BMC behavior may be simulated within the qemu process (``ipmi-bmc-sim``) or
+further delegated to an external emulator, or a real BMC. The
+``ipmi-bmc-extern`` device has a required ``chardev`` property which specifies
+the communications channel to the external BMC.
+
+Wire protocol
+=============
+
+The wire protocol used between ``ipmi-bmc-extern`` and the external BMC
+emulator is defined by `README.vm
+<https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.vm>`_ from
+the OpenIPMI project.
-- 
2.33.0.309.g3052b89438-goog


