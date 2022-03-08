Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C64D1DC8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:52:36 +0100 (CET)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd4d-0003cj-4E
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyr-0004jl-QU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:37 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34716
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyo-0003Y3-TY
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s18so4352435plp.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7+dd7lleHcdSBykz0CoP15bE42Y+6fLlVwKCGX1IBo=;
 b=pWL4ENt9KI5nwSxajfAuVQvc0g76TDEA22nBr36ofouBpyEyPJ5wYQ2RXYu9kW3wbi
 NLlTz3Qhj1uqPUs6PMie7+vihzfpMpcTfUz1w99Taa3OtLSc//GeoQFTrcdl1mGP7CwG
 zFHj9pVhHmHHe9tzim5TO1e9xDvaBVJ2CCh6v06OsRKOfWOmTeEibVmFDcvHhbJsoGks
 XQPd3+UwPN40nx1d6/g80hMRM2/N4IoQwTcgp3b49S6Q7JohLwjIVQI5Y+Dv6Qxpk/qg
 4MplbdfqF7PuT9IFhs5oyZAQ66Ut5YIvDn8ZCL90h/YESt8yzjAySkDbRMrOlDPIKDrW
 R8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7+dd7lleHcdSBykz0CoP15bE42Y+6fLlVwKCGX1IBo=;
 b=SKE7EMuTuth0HGYpNUzG7pKlx3OcXrC8ad4C2eoQxVslFny8VaWzjeZYzDRyl0svUK
 d/Y+jGHwcFA2le75/tSf2I3kEHZZ3b3wZ3/SMG7wqHzUBBMnsAv6LDv0sbLUbbvTfPl4
 nLMBbIJg69RtfFp9WgoSvGVULsHDJw6IhFw4yJKvuy/Q0u7lvbZsegAczXrhbSMFg7hi
 nprxTLZ/BlYIaE0N6zNCGh4ZvlUgDZX+YIBSyKqrjzKTppzF8SyaWcG4rH/LAbgOB0Zz
 /bbAzvS2iI3wfvc4dmPY+6qBZJfFcbGnnYtG/b9vIlS9m+pN/WQYqvaEVJKNFgkK/940
 K9qA==
X-Gm-Message-State: AOAM533OGevhzkL21szAVu/69YAfMbtyXWlUQY4o2aqgvWw3aTRjXCTC
 8mQ9SWSnjzXayFGCGTJgnlqY6PilK5M3Rg==
X-Google-Smtp-Source: ABdhPJzYJp5mZ15ASVYARR/8xVggsPA80ZkXPIBKFdvPo6uZGKbiaX9hvYXFdjgp74XjeYrFcDGkHg==
X-Received: by 2002:a17:90b:240e:b0:1b9:2963:d5a1 with SMTP id
 nr14-20020a17090b240e00b001b92963d5a1mr5599743pjb.227.1646757993399; 
 Tue, 08 Mar 2022 08:46:33 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.121.168])
 by smtp.googlemail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm3566459pjb.0.2022.03.08.08.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:46:32 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: libvir-list@redhat.com
Subject: [libvirt] [PATCH RESEND v2 2/4] conf: introduce support for
 acpi-bridge-hotplug feature
Date: Tue,  8 Mar 2022 22:15:51 +0530
Message-Id: <20220308164553.2312425-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164553.2312425-1-ani@anisinha.ca>
References: <20220308164553.2312425-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62b.google.com
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

This change introduces a new libvirt sub-element <pci> under
<features> that can be used to configure all pci related features.
Currently the only sub-sub element supported by this sub-element is
'acpi-bridge-hotplug' as shown below:

<features>
  <pci>
    <acpi-bridge-hotplug state='on|off'/>
  </pci>
</features>

The above option is only available for the QEMU driver, for x86 guests
only. It is a global option, affecting all PCI bridge controllers on
the guest.

The 'acpi-bridge-hotplug' option enables or disables ACPI hotplug
support for cold-plugged pci bridges. Examples of bridges include the
PCI-PCI bridge (pci-bridge controller) for pc (i440fx) machinetypes,
or PCIe-PCI bridges and pcie-root-port controllers for q35
machinetypes.

For pc machinetypes in x86, this option has been available in QEMU
since version 2.1. Please see the following changes in qemu repo:

9e047b982452c6 ("piix4: add acpi pci hotplug support")
133a2da488062e ("pc: acpi: generate AML only for PCI0 devices if PCI
               bridge hotplug is disabled")

For q35 machinetypes, this was introduced in QEMU 6.1 with the
following changes in qemu repo:

(a) c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
(b) 17858a16950860 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
                   Q35")

The reasons for enabling ACPI based hotplug for PCIe (q35) based
machines (as opposed to native hotplug) are outlined in (b). There are
use cases where users would still want to use native
hotplug. Therefore, this config option enables users to choose either
ACPI based hotplug or native hotplug for bridges (for example for pcie
root port controller in q35 machines).

Qemu capability validation checks have also been added along with
related unit tests to exercise the new conf option.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/formatdomain.rst                         | 32 +++++++
 docs/schemas/domaincommon.rng                 | 15 ++++
 src/conf/domain_conf.c                        | 89 ++++++++++++++++++-
 src/conf/domain_conf.h                        |  9 ++
 src/qemu/qemu_validate.c                      | 42 +++++++++
 .../aarch64-acpi-hotplug-bridge-disable.xml   | 13 +++
 .../pc-i440fx-acpi-hotplug-bridge-disable.xml | 36 ++++++++
 .../pc-i440fx-acpi-hotplug-bridge-enable.xml  | 36 ++++++++
 .../q35-acpi-hotplug-bridge-disable.xml       | 53 +++++++++++
 .../q35-acpi-hotplug-bridge-enable.xml        | 53 +++++++++++
 ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
 ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
 ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
 ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
 tests/qemuxml2xmltest.c                       |  4 +
 15 files changed, 385 insertions(+), 1 deletion(-)
 create mode 100644 tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml
 create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
 create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
 create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
 create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
 create mode 120000 tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.xml
 create mode 120000 tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-latest.xml
 create mode 120000 tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xml
 create mode 120000 tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml

diff --git a/docs/formatdomain.rst b/docs/formatdomain.rst
index 9202cd3107..864dfd8bd8 100644
--- a/docs/formatdomain.rst
+++ b/docs/formatdomain.rst
@@ -1879,6 +1879,9 @@ Hypervisors may allow certain CPU / machine features to be toggled on/off.
        <e820_host state='on'/>
        <passthrough state='on' mode='share_pt'/>
      </xen>
+     <pci>
+       <acpi-bridge-hotplug state="on"/>
+     </pci>
      <pvspinlock state='on'/>
      <gic version='2'/>
      <ioapic driver='qemu'/>
@@ -1997,6 +2000,35 @@ are:
    passthrough Enable IOMMU mappings allowing PCI passthrough on, off; mode - optional string sync_pt or share_pt :since:`6.3.0`
    =========== ============================================== =================================================== ==============
 
+``pci``
+   Various PCI bus related features of the hypervisor.
+
+   ==================== ========================================================================================================= ======= ==============
+   Feature              Description                                                                                               Value   Since
+   ==================== ========================================================================================================= ======= ==============
+   acpi-bridge-hotplug  Enable ACPI based hotplug on the cold-plugged PCI bridges (pc) and pcie-root-ports (q35) (also see notes) on, off :since:`8.2.0`
+   ==================== ========================================================================================================= ======= ==============
+
+   Note:
+   pc machine types (i440fx) have ACPI hotplug enabled by
+   default on cold plugged bridges (bridges that were present in the
+   VM's domain definition before it was started). `acpi-bridge-hotplug`
+   xml option can be used to disable hotplug for these bridges.
+   Disabling ACPI hotplug leaves only SHPC hotplug enabled; many OSes don't
+   support SHPC hotplug, so this may have the effect of completely
+   disabling hotplug.
+
+   On q35 machinetypes earlier than pc-q35-6.1, ACPI hotplug for cold
+   plugged bridges is disabled by default, and native PCIe hotplug is
+   enabled instead. Starting with the pc-q35-6.1 machinetype, ACPI
+   hotplug is enabled on cold plugged bridges by default while native
+   PCIe hotplug is disabled or not advertized to the OS. From QEMU binary
+   version 6.1 and above, it is possible to revert this default behavior
+   using `acpi-bridge-hotplug` xml feature as described above. Enabling
+   ACPI hotplug will disable or suppress advertizing native PCIe hotplug.
+   Disabling ACPI hotplug will re-enable PCIe native hotplug or start
+   advertizing its availability to the OS once more.
+
 ``pmu``
    Depending on the ``state`` attribute (values ``on``, ``off``, default ``on``)
    enable or disable the performance monitoring unit for the guest.
diff --git a/docs/schemas/domaincommon.rng b/docs/schemas/domaincommon.rng
index 964b0c9e2f..5f00b3ab60 100644
--- a/docs/schemas/domaincommon.rng
+++ b/docs/schemas/domaincommon.rng
@@ -6198,6 +6198,9 @@
           <optional>
             <ref name="ioapic"/>
           </optional>
+          <optional>
+            <ref name="pci"/>
+          </optional>
           <optional>
             <ref name="hpt"/>
           </optional>
@@ -6432,6 +6435,18 @@
     </element>
   </define>
 
+  <define name="pci">
+    <element name="pci">
+      <interleave>
+        <optional>
+          <element name="acpi-bridge-hotplug">
+            <ref name="featurestate"/>
+          </element>
+        </optional>
+      </interleave>
+    </element>
+  </define>
+
   <define name="ioapic">
     <element name="ioapic">
       <attribute name="driver">
diff --git a/src/conf/domain_conf.c b/src/conf/domain_conf.c
index 34fec887a3..c9938f3cf1 100644
--- a/src/conf/domain_conf.c
+++ b/src/conf/domain_conf.c
@@ -181,6 +181,7 @@ VIR_ENUM_IMPL(virDomainFeature,
               "sbbc",
               "ibs",
               "tcg",
+              "pci",
 );
 
 VIR_ENUM_IMPL(virDomainCapabilitiesPolicy,
@@ -223,6 +224,11 @@ VIR_ENUM_IMPL(virDomainXen,
               "passthrough",
 );
 
+VIR_ENUM_IMPL(virDomainPCI,
+              VIR_DOMAIN_PCI_LAST,
+              "acpi-bridge-hotplug",
+);
+
 VIR_ENUM_IMPL(virDomainXenPassthroughMode,
               VIR_DOMAIN_XEN_PASSTHROUGH_MODE_LAST,
               "default",
@@ -17419,6 +17425,36 @@ virDomainFeaturesKVMDefParse(virDomainDef *def,
     return 0;
 }
 
+static int
+virDomainFeaturesPCIDefParse(virDomainDef *def,
+                             xmlNodePtr node)
+{
+    def->features[VIR_DOMAIN_FEATURE_PCI] = VIR_TRISTATE_SWITCH_ON;
+
+    node = xmlFirstElementChild(node);
+    while (node) {
+        int feature;
+        virTristateSwitch value;
+
+        feature = virDomainPCITypeFromString((const char *)node->name);
+        if (feature < 0) {
+            virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
+                           _("unsupported PCI feature: %s"),
+                           node->name);
+            return -1;
+        }
+
+        if (virXMLPropTristateSwitch(node, "state", VIR_XML_PROP_REQUIRED,
+                                     &value) < 0)
+            return -1;
+
+        def->pci_features[feature] = value;
+
+        node = xmlNextElementSibling(node);
+    }
+
+    return 0;
+}
 
 static int
 virDomainFeaturesXENDefParse(virDomainDef *def,
@@ -17747,6 +17783,10 @@ virDomainFeaturesDefParse(virDomainDef *def,
                 return -1;
             break;
 
+        case VIR_DOMAIN_FEATURE_PCI:
+            if (virDomainFeaturesPCIDefParse(def, nodes[i]) < 0)
+                return -1;
+
         case VIR_DOMAIN_FEATURE_LAST:
             break;
         }
@@ -17755,7 +17795,6 @@ virDomainFeaturesDefParse(virDomainDef *def,
     return 0;
 }
 
-
 static int
 virDomainDefMaybeAddHostdevSCSIcontroller(virDomainDef *def)
 {
@@ -21419,6 +21458,7 @@ virDomainDefFeaturesCheckABIStability(virDomainDef *src,
         case VIR_DOMAIN_FEATURE_HTM:
         case VIR_DOMAIN_FEATURE_NESTED_HV:
         case VIR_DOMAIN_FEATURE_CCF_ASSIST:
+        case VIR_DOMAIN_FEATURE_PCI:
             if (src->features[i] != dst->features[i]) {
                 virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
                                _("State of feature '%s' differs: "
@@ -21686,6 +21726,29 @@ virDomainDefFeaturesCheckABIStability(virDomainDef *src,
         }
     }
 
+    /* pci */
+    if (src->features[VIR_DOMAIN_FEATURE_PCI] == VIR_TRISTATE_SWITCH_ON) {
+        for (i = 0; i < VIR_DOMAIN_PCI_LAST; i++) {
+            switch ((virDomainPCI) i) {
+            case VIR_DOMAIN_PCI_ACPI_BRIDGE_HOTPLUG:
+                if (src->pci_features[i] != dst->pci_features[i]) {
+                    virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
+                                   _("State of PCI feature '%s' differs: "
+                                     "source: '%s', destination: '%s'"),
+                                   virDomainPCITypeToString(i),
+                                   virTristateSwitchTypeToString(src->pci_features[i]),
+                                   virTristateSwitchTypeToString(dst->pci_features[i]));
+                    return false;
+                }
+
+                break;
+
+            case VIR_DOMAIN_PCI_LAST:
+                break;
+            }
+        }
+    }
+
     /* smm */
     if (src->features[VIR_DOMAIN_FEATURE_SMM] == VIR_TRISTATE_SWITCH_ON) {
         if (src->tseg_specified != dst->tseg_specified) {
@@ -27912,6 +27975,30 @@ virDomainDefFormatFeatures(virBuffer *buf,
             virDomainFeatureTCGFormat(&childBuf, def);
             break;
 
+        case VIR_DOMAIN_FEATURE_PCI:
+            if (def->features[i] != VIR_TRISTATE_SWITCH_ON)
+                break;
+
+            virBufferAddLit(&childBuf, "<pci>\n");
+            virBufferAdjustIndent(&childBuf, 2);
+            for (j = 0; j < VIR_DOMAIN_PCI_LAST; j++) {
+                switch ((virDomainPCI) j) {
+                case VIR_DOMAIN_PCI_ACPI_BRIDGE_HOTPLUG:
+                    if (def->pci_features[j] != VIR_TRISTATE_SWITCH_ABSENT)
+                        virBufferAsprintf(&childBuf, "<%s state='%s'/>\n",
+                                          virDomainPCITypeToString(j),
+                                          virTristateSwitchTypeToString(
+                                              def->pci_features[j]));
+                    break;
+
+                case VIR_DOMAIN_PCI_LAST:
+                    break;
+                }
+            }
+            virBufferAdjustIndent(&childBuf, -2);
+            virBufferAddLit(&childBuf, "</pci>\n");
+            break;
+
         case VIR_DOMAIN_FEATURE_LAST:
             break;
         }
diff --git a/src/conf/domain_conf.h b/src/conf/domain_conf.h
index 9fcf842ee7..0cc97de7a8 100644
--- a/src/conf/domain_conf.h
+++ b/src/conf/domain_conf.h
@@ -2072,6 +2072,7 @@ typedef enum {
     VIR_DOMAIN_FEATURE_SBBC,
     VIR_DOMAIN_FEATURE_IBS,
     VIR_DOMAIN_FEATURE_TCG,
+    VIR_DOMAIN_FEATURE_PCI,
 
     VIR_DOMAIN_FEATURE_LAST
 } virDomainFeature;
@@ -2097,6 +2098,12 @@ typedef enum {
     VIR_DOMAIN_HYPERV_LAST
 } virDomainHyperv;
 
+typedef enum {
+    VIR_DOMAIN_PCI_ACPI_BRIDGE_HOTPLUG = 0,
+
+    VIR_DOMAIN_PCI_LAST
+} virDomainPCI;
+
 typedef enum {
     VIR_DOMAIN_KVM_HIDDEN = 0,
     VIR_DOMAIN_KVM_DEDICATED,
@@ -2848,6 +2855,7 @@ struct _virDomainDef {
     int caps_features[VIR_DOMAIN_PROCES_CAPS_FEATURE_LAST];
     int hyperv_features[VIR_DOMAIN_HYPERV_LAST];
     virDomainFeatureKVM *kvm_features;
+    int pci_features[VIR_DOMAIN_PCI_LAST];
     int msrs_features[VIR_DOMAIN_MSRS_LAST];
     int xen_features[VIR_DOMAIN_XEN_LAST];
     virDomainXenPassthroughMode xen_passthrough_mode;
@@ -3979,6 +3987,7 @@ VIR_ENUM_DECL(virDomainGraphicsSpiceStreamingMode);
 VIR_ENUM_DECL(virDomainGraphicsSpiceMouseMode);
 VIR_ENUM_DECL(virDomainGraphicsVNCSharePolicy);
 VIR_ENUM_DECL(virDomainHyperv);
+VIR_ENUM_DECL(virDomainPCI);
 VIR_ENUM_DECL(virDomainKVM);
 VIR_ENUM_DECL(virDomainXen);
 VIR_ENUM_DECL(virDomainXenPassthroughMode);
diff --git a/src/qemu/qemu_validate.c b/src/qemu/qemu_validate.c
index f27e480696..e7c992f9e9 100644
--- a/src/qemu/qemu_validate.c
+++ b/src/qemu/qemu_validate.c
@@ -173,6 +173,43 @@ qemuValidateDomainDefPSeriesFeature(const virDomainDef *def,
     return 0;
 }
 
+static int
+qemuValidateDomainDefPCIFeature(const virDomainDef *def,
+                                virQEMUCaps *qemuCaps,
+                                int feature)
+{
+    size_t i;
+
+    if (def->features[feature] == VIR_TRISTATE_SWITCH_ABSENT)
+        return 0;
+
+    for (i = 0; i < VIR_DOMAIN_PCI_LAST; i++) {
+        if (def->pci_features[i] == VIR_TRISTATE_SWITCH_ABSENT)
+            continue;
+
+        switch ((virDomainPCI) i) {
+            case VIR_DOMAIN_PCI_ACPI_BRIDGE_HOTPLUG:
+                if (!ARCH_IS_X86(def->os.arch)) {
+                    virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
+                                   _("acpi-bridge-hotplug is not available for architecture '%s'"),
+                                   virArchToString(def->os.arch));
+                    return -1;
+                }
+
+                if (qemuDomainIsQ35(def) &&
+                    !virQEMUCapsGet(qemuCaps, QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE)) {
+                    virReportError(VIR_ERR_CONFIG_UNSUPPORTED, "%s",
+                                   _("acpi-bridge-hotplug is not available with this QEMU binary"));
+                    return -1;
+                }
+                break;
+
+            case VIR_DOMAIN_PCI_LAST:
+                break;
+        }
+    }
+    return 0;
+}
 
 static int
 qemuValidateDomainDefFeatures(const virDomainDef *def,
@@ -311,6 +348,11 @@ qemuValidateDomainDefFeatures(const virDomainDef *def,
             }
             break;
 
+        case VIR_DOMAIN_FEATURE_PCI:
+            if (qemuValidateDomainDefPCIFeature(def, qemuCaps, i) < 0)
+                return -1;
+            break;
+
         case VIR_DOMAIN_FEATURE_SMM:
         case VIR_DOMAIN_FEATURE_KVM:
         case VIR_DOMAIN_FEATURE_XEN:
diff --git a/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml b/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml
new file mode 100644
index 0000000000..47107e93f3
--- /dev/null
+++ b/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml
@@ -0,0 +1,13 @@
+<domain type='qemu'>
+  <name>test</name>
+  <memory unit='KiB'>1048576</memory>
+  <vcpu placement='static'>1</vcpu>
+  <os>
+    <type arch='aarch64' machine='virt'>hvm</type>
+  </os>
+  <features>
+    <pci>
+      <acpi-bridge-hotplug state='off'/>
+    </pci>
+  </features>
+</domain>
diff --git a/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
new file mode 100644
index 0000000000..1b63ff9539
--- /dev/null
+++ b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
@@ -0,0 +1,36 @@
+<domain type='qemu'>
+  <name>i440fx</name>
+  <uuid>56f5055c-1b8d-490c-844a-ad646a1caaaa</uuid>
+  <memory unit='KiB'>1048576</memory>
+  <currentMemory unit='KiB'>1048576</currentMemory>
+  <vcpu placement='static'>1</vcpu>
+  <os>
+    <type arch='x86_64' machine='pc-i440fx-2.5'>hvm</type>
+    <boot dev='network'/>
+  </os>
+  <features>
+    <pci>
+      <acpi-bridge-hotplug state='off'/>
+    </pci>
+  </features>
+  <cpu mode='custom' match='exact' check='none'>
+    <model fallback='forbid'>qemu64</model>
+  </cpu>
+  <clock offset='utc'/>
+  <on_poweroff>destroy</on_poweroff>
+  <on_reboot>restart</on_reboot>
+  <on_crash>destroy</on_crash>
+  <devices>
+    <emulator>/usr/bin/qemu-system-x86_64</emulator>
+    <controller type='usb' index='0' model='piix3-uhci'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x2'/>
+    </controller>
+    <controller type='pci' index='0' model='pci-root'/>
+    <input type='mouse' bus='ps2'/>
+    <input type='keyboard' bus='ps2'/>
+    <audio id='1' type='none'/>
+    <memballoon model='virtio'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'/>
+    </memballoon>
+  </devices>
+</domain>
diff --git a/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
new file mode 100644
index 0000000000..f7b2cbb9ce
--- /dev/null
+++ b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
@@ -0,0 +1,36 @@
+<domain type='qemu'>
+  <name>i440fx</name>
+  <uuid>56f5055c-1b8d-490c-844a-ad646a1caaaa</uuid>
+  <memory unit='KiB'>1048576</memory>
+  <currentMemory unit='KiB'>1048576</currentMemory>
+  <vcpu placement='static'>1</vcpu>
+  <os>
+    <type arch='x86_64' machine='pc-i440fx-2.5'>hvm</type>
+    <boot dev='network'/>
+  </os>
+  <features>
+    <pci>
+      <acpi-bridge-hotplug state='on'/>
+    </pci>
+  </features>
+  <cpu mode='custom' match='exact' check='none'>
+    <model fallback='forbid'>qemu64</model>
+  </cpu>
+  <clock offset='utc'/>
+  <on_poweroff>destroy</on_poweroff>
+  <on_reboot>restart</on_reboot>
+  <on_crash>destroy</on_crash>
+  <devices>
+    <emulator>/usr/bin/qemu-system-x86_64</emulator>
+    <controller type='usb' index='0' model='piix3-uhci'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x2'/>
+    </controller>
+    <controller type='pci' index='0' model='pci-root'/>
+    <input type='mouse' bus='ps2'/>
+    <input type='keyboard' bus='ps2'/>
+    <audio id='1' type='none'/>
+    <memballoon model='virtio'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'/>
+    </memballoon>
+  </devices>
+</domain>
diff --git a/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
new file mode 100644
index 0000000000..87e61763fe
--- /dev/null
+++ b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
@@ -0,0 +1,53 @@
+<domain type='qemu'>
+  <name>q35</name>
+  <uuid>56f5055c-1b8d-490c-844a-ad646a1caaaa</uuid>
+  <memory unit='KiB'>1048576</memory>
+  <currentMemory unit='KiB'>1048576</currentMemory>
+  <vcpu placement='static'>1</vcpu>
+  <os>
+    <type arch='x86_64' machine='pc-q35-2.5'>hvm</type>
+    <boot dev='network'/>
+  </os>
+  <features>
+    <pci>
+      <acpi-bridge-hotplug state='off'/>
+    </pci>
+  </features>
+  <cpu mode='custom' match='exact' check='none'>
+    <model fallback='forbid'>qemu64</model>
+  </cpu>
+  <clock offset='utc'/>
+  <on_poweroff>destroy</on_poweroff>
+  <on_reboot>restart</on_reboot>
+  <on_crash>destroy</on_crash>
+  <devices>
+    <emulator>/usr/bin/qemu-system-x86_64</emulator>
+    <controller type='sata' index='0'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x1f' function='0x2'/>
+    </controller>
+    <controller type='pci' index='0' model='pcie-root'/>
+    <controller type='pci' index='1' model='dmi-to-pci-bridge'>
+      <model name='i82801b11-bridge'/>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x1e' function='0x0'/>
+    </controller>
+    <controller type='pci' index='2' model='pci-bridge'>
+      <model name='pci-bridge'/>
+      <target chassisNr='2'/>
+      <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
+    </controller>
+    <controller type='pci' index='3' model='pcie-root-port'>
+      <model name='ioh3420'/>
+      <target chassis='3' port='0x8'/>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0'/>
+    </controller>
+    <controller type='usb' index='0' model='qemu-xhci'>
+      <address type='pci' domain='0x0000' bus='0x03' slot='0x00' function='0x0'/>
+    </controller>
+    <input type='mouse' bus='ps2'/>
+    <input type='keyboard' bus='ps2'/>
+    <audio id='1' type='none'/>
+    <memballoon model='virtio'>
+      <address type='pci' domain='0x0000' bus='0x02' slot='0x01' function='0x0'/>
+    </memballoon>
+  </devices>
+</domain>
diff --git a/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
new file mode 100644
index 0000000000..9a8043849c
--- /dev/null
+++ b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
@@ -0,0 +1,53 @@
+<domain type='qemu'>
+  <name>q35</name>
+  <uuid>56f5055c-1b8d-490c-844a-ad646a1caaaa</uuid>
+  <memory unit='KiB'>1048576</memory>
+  <currentMemory unit='KiB'>1048576</currentMemory>
+  <vcpu placement='static'>1</vcpu>
+  <os>
+    <type arch='x86_64' machine='pc-q35-2.5'>hvm</type>
+    <boot dev='network'/>
+  </os>
+  <features>
+    <pci>
+      <acpi-bridge-hotplug state='on'/>
+    </pci>
+  </features>
+  <cpu mode='custom' match='exact' check='none'>
+    <model fallback='forbid'>qemu64</model>
+  </cpu>
+  <clock offset='utc'/>
+  <on_poweroff>destroy</on_poweroff>
+  <on_reboot>restart</on_reboot>
+  <on_crash>destroy</on_crash>
+  <devices>
+    <emulator>/usr/bin/qemu-system-x86_64</emulator>
+    <controller type='sata' index='0'>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x1f' function='0x2'/>
+    </controller>
+    <controller type='pci' index='0' model='pcie-root'/>
+    <controller type='pci' index='1' model='dmi-to-pci-bridge'>
+      <model name='i82801b11-bridge'/>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x1e' function='0x0'/>
+    </controller>
+    <controller type='pci' index='2' model='pci-bridge'>
+      <model name='pci-bridge'/>
+      <target chassisNr='2'/>
+      <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
+    </controller>
+    <controller type='pci' index='3' model='pcie-root-port'>
+      <model name='ioh3420'/>
+      <target chassis='3' port='0x8'/>
+      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0'/>
+    </controller>
+    <controller type='usb' index='0' model='qemu-xhci'>
+      <address type='pci' domain='0x0000' bus='0x03' slot='0x00' function='0x0'/>
+    </controller>
+    <input type='mouse' bus='ps2'/>
+    <input type='keyboard' bus='ps2'/>
+    <audio id='1' type='none'/>
+    <memballoon model='virtio'>
+      <address type='pci' domain='0x0000' bus='0x02' slot='0x01' function='0x0'/>
+    </memballoon>
+  </devices>
+</domain>
diff --git a/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.xml b/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.xml
new file mode 120000
index 0000000000..8154897401
--- /dev/null
+++ b/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.xml
@@ -0,0 +1 @@
+../qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
\ No newline at end of file
diff --git a/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-latest.xml b/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-latest.xml
new file mode 120000
index 0000000000..6b9e5492f8
--- /dev/null
+++ b/tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-latest.xml
@@ -0,0 +1 @@
+../qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
\ No newline at end of file
diff --git a/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xml b/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xml
new file mode 120000
index 0000000000..77719b1325
--- /dev/null
+++ b/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xml
@@ -0,0 +1 @@
+../qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
\ No newline at end of file
diff --git a/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml b/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml
new file mode 120000
index 0000000000..3cd8ee569e
--- /dev/null
+++ b/tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml
@@ -0,0 +1 @@
+../qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
\ No newline at end of file
diff --git a/tests/qemuxml2xmltest.c b/tests/qemuxml2xmltest.c
index 052950b86f..a8dc0747e2 100644
--- a/tests/qemuxml2xmltest.c
+++ b/tests/qemuxml2xmltest.c
@@ -436,6 +436,10 @@ mymain(void)
     DO_TEST("misc-disable-s3", QEMU_CAPS_PIIX_DISABLE_S3);
     DO_TEST_CAPS_LATEST("pc-i440fx-acpi-root-hotplug-disable");
     DO_TEST_CAPS_LATEST("pc-i440fx-acpi-root-hotplug-enable");
+    DO_TEST_CAPS_LATEST("pc-i440fx-acpi-hotplug-bridge-disable");
+    DO_TEST_CAPS_LATEST("pc-i440fx-acpi-hotplug-bridge-enable");
+    DO_TEST_CAPS_LATEST("q35-acpi-hotplug-bridge-disable");
+    DO_TEST_CAPS_LATEST("q35-acpi-hotplug-bridge-enable");
     DO_TEST("misc-disable-suspends",
             QEMU_CAPS_PIIX_DISABLE_S3,
             QEMU_CAPS_PIIX_DISABLE_S4);
-- 
2.25.1


