Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A03510DC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:29:56 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsiB-0007ty-UE
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRsel-0004jB-FV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:23 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRseb-00072z-GB
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:23 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 934F42ED6;
 Thu,  1 Apr 2021 04:26:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 04:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JdtkIVPBvhkIE
 uyz1JC638JoIxQpOlMb7xwgVvokR1E=; b=rTpoUiZj8YrHrFkW98aoenwrKSsY5
 zack51P5GWcC0Y7WJ7WWSIcqRuIUuHJOOng1KU0R64LfnpGgR67BFuq+cZxB9PFk
 Y+/jOexpUglTOEbGZMFJ/QcomSwSryIHdmzy4qW8EwTPDcVgiHJl4HZYVheXA60v
 5oGj1BJfI6XHyNXxI25jUm4dytt6rl1i0TgzKPigWyfugssEkik01H5Wao+/9Y0d
 dthFxdqsi6Hb007H/RsyyVvtxlEKBZtK7CyQuOIzsz1SeonxL6brE5Eka8ENUVIG
 IBy8eJ2W67AP5uwE4mlBV1Y8Vy+m3JyaAQx6ua5Zl+bv9Vka7zwRdqopQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JdtkIVPBvhkIEuyz1JC638JoIxQpOlMb7xwgVvokR1E=; b=QkqybrZM
 Ec5aH72xHOc/nJIigpCVc3RCOvKy8Kruv3botdHREDTOO7al0TmORWfcJe7OwOXd
 rQGI+Zc38Xac+hHMuv5ox95wDOHyTcrLzggt1MPoQ4IOwTWL8gY0WRgJ2a+0aZ2j
 lYQMCNqBpcFMem+IFsZgFr86rqUhydgzItPrA3GJfGELA5zUWTzILHHxsyJQ02Ma
 GhPtJ7HT6MxPBfV7qk3m7p7oUREi5plHETXwAF5hO1x+eUgbgmbn1kTvhzDmfs5i
 h0dJcqqNiJO7NoTEtphOUKOSipBYM8jFcWLoFlo600ghqpslYWwlvHU831DISm0N
 v3GG5V3XVFwGow==
X-ME-Sender: <xms:o4NlYATZ8xpVG1fvSUi5b5JoUDduNJhO4-tzCOPUyvIjj3vm59Fplw>
 <xme:o4NlYNwac14Jln0fbJkfCXWs0ORmK0Oao5Vc_e6JwGoZ_9HEGq9ZJQCh0n_4zt4LT
 VCu0HCpTz6SOUsNcx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeifedgudeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepieefjeeuieeggeehkeettdeltdehffffjeehtdehlefhtdffteegleeg
 geduhfejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepsggvrhhnrghtsehluhhffhihrdgtgi
X-ME-Proxy: <xmx:o4NlYN1vVCMLkjwZUnUC-yCsN_kRjklpj72Avp4jT53utFj4LZcNBQ>
 <xmx:o4NlYECbE_I1Lc2Q-umWkudE5lOTMg28d3qUJnO3Xblp4mKoK_Az6A>
 <xmx:o4NlYJheGIsDAw4pse0qUQk9ILzl1rtXy1BocqMtz6HBw15zvSPfwg>
 <xmx:o4NlYMump-EbS1QHIFal9nOS0n96AJlkwXh6T02oxGbwmuKCeMvnIw>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04F4F108005F;
 Thu,  1 Apr 2021 04:26:11 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 21259A28; Thu,  1 Apr 2021 10:26:09 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified device
 for Type 41
Date: Thu,  1 Apr 2021 10:25:44 +0200
Message-Id: <20210401082544.16522-2-vincent@bernat.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210401082544.16522-1-vincent@bernat.ch>
References: <20210401082544.16522-1-vincent@bernat.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=bernat@luffy.cx;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of specifying the PCI address manually, the device can be
specified by ID:

    $QEMU -netdev user,id=internet
          -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
          -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev

The PCI segment is assumed to be 0. This should hold true for most
cases.

    $ dmidecode -t 41
    # dmidecode 3.3
    Getting SMBIOS data from sysfs.
    SMBIOS 2.8 present.

    Handle 0x2900, DMI type 41, 11 bytes
    Onboard Device
            Reference Designation: Onboard LAN
            Type: Ethernet
            Status: Enabled
            Type Instance: 1
            Bus Address: 0000:00:09.0

    $ ip -brief a
    lo               UNKNOWN        127.0.0.1/8 ::1/128
    eno1             UP             10.0.2.14/24 fec0::5254:ff:fe00:42/64 fe80::5254:ff:fe00:42/64

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
---
 hw/smbios/smbios.c | 47 +++++++++++++++++++++-------------------------
 qemu-options.hx    |  2 +-
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 46a08652dff4..0f390e03453c 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -27,6 +27,7 @@
 #include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/pci/pci.h"
 #include "smbios_build.h"
 
 /* legacy structures and constants for <= 2.0 machines */
@@ -134,12 +135,8 @@ static QEnumLookup type41_kind_lookup = {
     .size = 10
 };
 struct type41_instance {
-    const char *designation;
+    const char *designation, *pcidev;
     uint8_t instance, kind;
-    struct {
-        uint16_t segment;
-        uint8_t bus, device;
-    } pci;
     QTAILQ_ENTRY(type41_instance) next;
 };
 static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
@@ -403,10 +400,9 @@ static const QemuOptDesc qemu_smbios_type41_opts[] = {
         .type = QEMU_OPT_NUMBER,
         .help = "device type instance",
     },{
-        .name = "pci",
+        .name = "pcidev",
         .type = QEMU_OPT_STRING,
         .help = "PCI device",
-        .def_value_str = "0:0.0",
     },
     { /* end of list */ }
 };
@@ -837,9 +833,23 @@ static void smbios_build_type_41_table(void)
         SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
         t->device_type = t41->kind;
         t->device_type_instance = t41->instance;
-        t->segment_group_number = cpu_to_le16(t41->pci.segment);
-        t->bus_number = t41->pci.bus;
-        t->device_number = t41->pci.device;
+
+        if (t41->pcidev) {
+            PCIDevice *pdev = NULL;
+            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
+            if (rc == 0) {
+                /*
+                 * TODO: Extract the appropriate value. Most of the
+                 * time, this will be 0.
+                 */
+                t->segment_group_number = cpu_to_le16(0);
+                t->bus_number = pci_dev_bus_num(pdev);
+                t->device_number = pdev->devfn;
+            } else {
+                fprintf(stderr, "%s: cannot find PCI device %s\n",
+                        __func__, t41->pcidev);
+            }
+        }
 
         SMBIOS_BUILD_TABLE_POST;
         instance++;
@@ -1301,7 +1311,6 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
         case 41: {
             struct type41_instance *t;
             Error *local_err = NULL;
-            int pseg, pbus, pdevice, pfunction;
 
             if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
                 return;
@@ -1324,21 +1333,7 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
                 return;
             }
             t->instance = qemu_opt_get_number(opts, "instance", 1);
-            if (sscanf(qemu_opt_get(opts, "pci"), "%x:%x:%x.%x",
-                       &pseg,
-                       &pbus,
-                       &pdevice,
-                       &pfunction) != 4) {
-                error_setg(errp, "unable to parse %s: %s",
-                           qemu_opt_get(opts, "pci"),
-                           g_strerror(errno));
-                free(t);
-                return;
-            }
-            t->pci.segment = pseg;
-            t->pci.bus = pbus;
-            t->pci.device = ((uint8_t)pdevice << 3) +
-                ((uint8_t)pfunction & 0x7);
+            save_opt(&t->pcidev, opts, "pcidev");
 
             QTAILQ_INSERT_TAIL(&type41, t, next);
             return;
diff --git a/qemu-options.hx b/qemu-options.hx
index eb2de7c372c7..e6e54f9bd1f3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2371,7 +2371,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
     "               [,asset=str][,part=str][,speed=%d]\n"
     "                specify SMBIOS type 17 fields\n"
-    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pci=%x:%x:%x.%x]\n"
+    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
     "                specify SMBIOS type 41 fields\n",
     QEMU_ARCH_I386 | QEMU_ARCH_ARM)
 SRST
-- 
2.31.0


