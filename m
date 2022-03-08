Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFD4D1DBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:49:02 +0100 (CET)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd1B-0006Qy-H6
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcyt-0004pa-Vk
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:40 -0500
Received: from [2607:f8b0:4864:20::62a] (port=39536
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcys-0003YJ-4d
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:46:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 9so17580875pll.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3cBHL0YGvGYNGrZAMhf3iMSpg+KwX8sZ+gzm+fmtG0=;
 b=BEEaf6+5U6HAGBWSxiNo61yDAtFQeqAzgfTENHWKBQSwAXEaQ+hLK6FwEO6Iaeuufu
 KjFCejSv5kTouiLJFEKtvmHaNNQXx0MI084IyGV/DgTYtUex8EPrDIOxCHabezdxSNRk
 zmjOd2u/bE9N3U940kSdsPea5HZIsY+EDv7YRwGQFgGCXMBThgCJ3VwRcB8lA1SkoWxN
 xX2in7DFhD3n4CH1qOzxsqFFYJJUsoPs8zAeq6l1zcPxwUKFRpqF5dLh0iNy5y6LKxHy
 yXl4ENdQyHZy4yFmRHyo6h6g9fttk2o6HNl5yTeFJ0YexE/xnVfb9Lg7D043fIal3hvH
 I7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3cBHL0YGvGYNGrZAMhf3iMSpg+KwX8sZ+gzm+fmtG0=;
 b=WxFIAnlzvsfDDrUnVd4SLne2PxCd9sW28DgBOyhLkn1DUVT4cou7kFt0oS9+chqhKy
 Vvo1x3WQORRUEQxfFwIpXl9xFzyISNaAPK5gU/9qhga69jX0sTWBhmWAadUCEvg+8o++
 uAWcWUt3e0mgJX9A+D0lHdmRa/pl/3lCs+14bHjZG0GJhovZ/4tqMNWL+4gGkQGuEdKy
 aSVL0BNvJ8AekSI2Vr9ptkLDsmmCIVGJYupVukHo0ohORvA7ra1H6Z1lGnap8tVUvlo5
 yvqYX4u/obY8mL4rAgBbCZygT2Bjxn/LrwVfnyu452ZuZOp8VTq9fqAQNmJl+EdqfYjR
 304w==
X-Gm-Message-State: AOAM5304wcCo4WhKBq/92m7BNC9l1vdg1ltdQfzCehWORqDy7YARxmgM
 CrXUuUGSJ0fFBLnjbC1FANINzg==
X-Google-Smtp-Source: ABdhPJwrGF60Oj6ED5D2Rg9zgiVxxsoNCx81rTZaF+0n5nXpTYA8P/hSAIQhCsvDRSouPpCGC/X63w==
X-Received: by 2002:a17:90b:3910:b0:1bf:2972:ccea with SMTP id
 ob16-20020a17090b391000b001bf2972cceamr5546191pjb.221.1646757996619; 
 Tue, 08 Mar 2022 08:46:36 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.121.168])
 by smtp.googlemail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm3566459pjb.0.2022.03.08.08.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:46:36 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: libvir-list@redhat.com
Subject: [libvirt] [PATCH RESEND v2 3/4] qemu: command: add support for
 acpi-bridge-hotplug feature
Date: Tue,  8 Mar 2022 22:15:52 +0530
Message-Id: <20220308164553.2312425-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164553.2312425-1-ani@anisinha.ca>
References: <20220308164553.2312425-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
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

This change adds backend qemu command line support for new libvirt
global feature 'acpi-bridge-hotplug'. This option can be used as
following:

<feature>
  <pci>
    <acpi-bridge-hotplug state='off|on'/>
  </pci>
</feature>

The '<pci>' sub-element under '<feature>' is also newly introduced.

'acpi-bridge-hotplug' turns on the following command line option to
qemu for x86 guests:

(pc): -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=<off|on>

(q35): -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=<off|on>

This change also adds the required qemuxml2argv unit tests in order to
test correct qemu arguments. Unit tests have also been added to test
qemu capability validation checks as well as checks for using this
option with the right architecture.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 src/qemu/qemu_command.c                       | 19 ++++++++++
 ...-hotplug-bridge-disable.aarch64-latest.err |  1 +
 ...-hotplug-bridge-disable.x86_64-latest.args | 35 +++++++++++++++++
 ...pi-hotplug-bridge-disable.x86_64-6.0.0.err |  1 +
 ...-hotplug-bridge-disable.x86_64-latest.args | 38 +++++++++++++++++++
 tests/qemuxml2argvtest.c                      |  7 ++++
 6 files changed, 101 insertions(+)
 create mode 100644 tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest.err
 create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.args
 create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.err
 create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args

diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c
index c836799888..206a9794cb 100644
--- a/src/qemu/qemu_command.c
+++ b/src/qemu/qemu_command.c
@@ -6280,6 +6280,7 @@ qemuBuildPMCommandLine(virCommand *cmd,
                        qemuDomainObjPrivate *priv)
 {
     virQEMUCaps *qemuCaps = priv->qemuCaps;
+    int acpihp_br = def->pci_features[VIR_DOMAIN_PCI_ACPI_BRIDGE_HOTPLUG];
 
     if (virQEMUCapsGet(priv->qemuCaps, QEMU_CAPS_SET_ACTION)) {
         /* with new qemu we always want '-no-shutdown' on startup and we set
@@ -6325,6 +6326,24 @@ qemuBuildPMCommandLine(virCommand *cmd,
                                pm_object, def->pm.s4 == VIR_TRISTATE_BOOL_NO);
     }
 
+    if (acpihp_br != VIR_TRISTATE_SWITCH_ABSENT) {
+        const char *pm_object = NULL;
+
+        if (!qemuDomainIsQ35(def))
+            pm_object = "PIIX4_PM";
+
+        if (qemuDomainIsQ35(def) &&
+            virQEMUCapsGet(qemuCaps, QEMU_CAPS_ICH9_ACPI_HOTPLUG_BRIDGE))
+            pm_object = "ICH9-LPC";
+
+        if (pm_object != NULL) {
+            virCommandAddArg(cmd, "-global");
+            virCommandAddArgFormat(cmd, "%s.acpi-pci-hotplug-with-bridge-support=%s",
+                                   pm_object,
+                                   virTristateSwitchTypeToString(acpihp_br));
+        }
+    }
+
     return 0;
 }
 
diff --git a/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest.err b/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest.err
new file mode 100644
index 0000000000..9f0a88b826
--- /dev/null
+++ b/tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest.err
@@ -0,0 +1 @@
+unsupported configuration: acpi-bridge-hotplug is not available for architecture 'aarch64'
diff --git a/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.args b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.args
new file mode 100644
index 0000000000..90527dfefd
--- /dev/null
+++ b/tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.args
@@ -0,0 +1,35 @@
+LC_ALL=C \
+PATH=/bin \
+HOME=/tmp/lib/domain--1-i440fx \
+USER=test \
+LOGNAME=test \
+XDG_DATA_HOME=/tmp/lib/domain--1-i440fx/.local/share \
+XDG_CACHE_HOME=/tmp/lib/domain--1-i440fx/.cache \
+XDG_CONFIG_HOME=/tmp/lib/domain--1-i440fx/.config \
+/usr/bin/qemu-system-x86_64 \
+-name guest=i440fx,debug-threads=on \
+-S \
+-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/tmp/lib/domain--1-i440fx/master-key.aes"}' \
+-machine pc-i440fx-2.5,usb=off,dump-guest-core=off,memory-backend=pc.ram \
+-accel tcg \
+-cpu qemu64 \
+-m 1024 \
+-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":1073741824}' \
+-overcommit mem-lock=off \
+-smp 1,sockets=1,cores=1,threads=1 \
+-uuid 56f5055c-1b8d-490c-844a-ad646a1caaaa \
+-display none \
+-no-user-config \
+-nodefaults \
+-chardev socket,id=charmonitor,fd=1729,server=on,wait=off \
+-mon chardev=charmonitor,id=monitor,mode=control \
+-rtc base=utc \
+-no-shutdown \
+-no-acpi \
+-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off \
+-boot strict=on \
+-device '{"driver":"piix3-usb-uhci","id":"usb","bus":"pci.0","addr":"0x1.0x2"}' \
+-audiodev '{"id":"audio1","driver":"none"}' \
+-device '{"driver":"virtio-balloon-pci","id":"balloon0","bus":"pci.0","addr":"0x2"}' \
+-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
+-msg timestamp=on
diff --git a/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.err b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.err
new file mode 100644
index 0000000000..8c09a3cd76
--- /dev/null
+++ b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.err
@@ -0,0 +1 @@
+unsupported configuration: acpi-bridge-hotplug is not available with this QEMU binary
diff --git a/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args
new file mode 100644
index 0000000000..6e3aeb1f30
--- /dev/null
+++ b/tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args
@@ -0,0 +1,38 @@
+LC_ALL=C \
+PATH=/bin \
+HOME=/tmp/lib/domain--1-q35 \
+USER=test \
+LOGNAME=test \
+XDG_DATA_HOME=/tmp/lib/domain--1-q35/.local/share \
+XDG_CACHE_HOME=/tmp/lib/domain--1-q35/.cache \
+XDG_CONFIG_HOME=/tmp/lib/domain--1-q35/.config \
+/usr/bin/qemu-system-x86_64 \
+-name guest=q35,debug-threads=on \
+-S \
+-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/tmp/lib/domain--1-q35/master-key.aes"}' \
+-machine pc-q35-2.5,usb=off,dump-guest-core=off,memory-backend=pc.ram \
+-accel tcg \
+-cpu qemu64 \
+-m 1024 \
+-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":1073741824}' \
+-overcommit mem-lock=off \
+-smp 1,sockets=1,cores=1,threads=1 \
+-uuid 56f5055c-1b8d-490c-844a-ad646a1caaaa \
+-display none \
+-no-user-config \
+-nodefaults \
+-chardev socket,id=charmonitor,fd=1729,server=on,wait=off \
+-mon chardev=charmonitor,id=monitor,mode=control \
+-rtc base=utc \
+-no-shutdown \
+-no-acpi \
+-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \
+-boot strict=on \
+-device '{"driver":"i82801b11-bridge","id":"pci.1","bus":"pcie.0","addr":"0x1e"}' \
+-device '{"driver":"pci-bridge","chassis_nr":2,"id":"pci.2","bus":"pci.1","addr":"0x0"}' \
+-device '{"driver":"ioh3420","port":8,"chassis":3,"id":"pci.3","bus":"pcie.0","addr":"0x1"}' \
+-device '{"driver":"qemu-xhci","id":"usb","bus":"pci.3","addr":"0x0"}' \
+-audiodev '{"id":"audio1","driver":"none"}' \
+-device '{"driver":"virtio-balloon-pci","id":"balloon0","bus":"pci.2","addr":"0x1"}' \
+-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
+-msg timestamp=on
diff --git a/tests/qemuxml2argvtest.c b/tests/qemuxml2argvtest.c
index ce475df466..bc4f9cbcf1 100644
--- a/tests/qemuxml2argvtest.c
+++ b/tests/qemuxml2argvtest.c
@@ -2592,6 +2592,13 @@ mymain(void)
     DO_TEST_CAPS_LATEST("pc-i440fx-acpi-root-hotplug-enable");
     DO_TEST_CAPS_VER_PARSE_ERROR("pc-i440fx-acpi-root-hotplug-disable", "5.1.0");
     DO_TEST_CAPS_VER_PARSE_ERROR("pc-i440fx-acpi-root-hotplug-enable", "5.1.0");
+    DO_TEST_CAPS_LATEST("q35-acpi-hotplug-bridge-disable");
+    DO_TEST_CAPS_LATEST("pc-i440fx-acpi-hotplug-bridge-disable");
+    DO_TEST_CAPS_VER_PARSE_ERROR("q35-acpi-hotplug-bridge-disable", "6.0.0");
+    /* verify that we fail when acpi-bridge-hotplug option is specified for
+     * archs other than x86
+     */
+    DO_TEST_CAPS_ARCH_LATEST_PARSE_ERROR("aarch64-acpi-hotplug-bridge-disable", "aarch64");
     DO_TEST("q35-usb2",
             QEMU_CAPS_DEVICE_PCI_BRIDGE,
             QEMU_CAPS_DEVICE_DMI_TO_PCI_BRIDGE,
-- 
2.25.1


