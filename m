Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344626C8909
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 00:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqYB-0002eH-4D; Fri, 24 Mar 2023 19:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uS0eZAgKCrQqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXl-0002T8-Ir
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:58 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uS0eZAgKCrQqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXf-000846-6x
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:57 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 d4-20020a056a00198400b00628000145bcso1651895pfl.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699385;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BPaOfu7m+eYd7o19NPhS9EwzZa/C/i3nEo2Kt/5u10g=;
 b=aHwjuNOGNUSZdWpQLxD+8j91dzv7fw3rVc/IKgrDZGCoh88AdLbW1d+wBjeLn5n58B
 cFuHrMkfQGtUUTDoMx/6hJYHnvzGJNEIjoXWyiI3+g9oQJifYVEhCTA49LX+dbGN55ZR
 mw0WNR20bXtMdWBv0SOxOyaX/wg8H+7kYabaJxc4JHreuF1XzIC4agnp4tImT13gamqj
 UNyM9cu8ztbDk1ccVIzYAsrk4h6h7S31YoW+7FtgryPCwBuD9BEEcKNL+yWHpcJ0TBwY
 +JF/ilrc2vNxWLy3MCdtC2zWVLKZY56ZkldjxMLsBdeErFWODkNx4hkKlTZRrAkkXjhy
 YqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699385;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BPaOfu7m+eYd7o19NPhS9EwzZa/C/i3nEo2Kt/5u10g=;
 b=GTnBirf1ulKC8iRCSEHJgBUpkaBEd12Vpw+2PTdAL8K7vBl/wPDmYZYhq/3IygcGtY
 gT8anzsy+6R7Ws3ynXk2kXP9di8UByO1kOSC/eyEvMiFnuSoH6swkj6SUNlBgex3ARQS
 CeC+D2nk5Uf9BrXEXkkmu/gS/pDVQ9ucRXPVwRkXIyX3YRgR6aUFzaKOJjAGxrkN2rWZ
 6s/WtZghV/MZQ4CyrR1TmkubNmVTfJe3XTYO42yb8G4gUPG350XFBNWlpKll/2aNypvn
 wwCfp2QiTOjQg03OEhnPMeIV/+4gSGLmp/8LBNdgP3tI749SIC5NmTUTMbJZbPNDy+ss
 7l2g==
X-Gm-Message-State: AAQBX9ccACLUavmcsHh2yJfVlrSjMSPUfCGGTCkST9eDbZ9zGjE0Y/IH
 Dhyu0snr7O3fEiZNTwARm0rFkd78nuzsZw==
X-Google-Smtp-Source: AKy350b6kHvUKXgfz/jm78WuAuC2b4ae1MZPnnFDhap9lNADuQZqoogUK4sN0Y4JLPsXtl5re9qp041rhWpseg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:2789:b0:233:c921:ab7e with SMTP
 id pw9-20020a17090b278900b00233c921ab7emr4458718pjb.4.1679699385312; Fri, 24
 Mar 2023 16:09:45 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:09:01 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-5-wuhaotsh@google.com>
Subject: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3uS0eZAgKCrQqobUinmbaiiafY.WigkYgo-XYpYfhihaho.ila@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This patch refactors the IPMI interface so that it can be used by both
the BMC side and core-side simulation.

Detail changes:
(1) Split IPMIInterface into IPMIInterfaceHost (for host side
    simulation) and IPMIInterfaceClient (for BMC side simulation).
(2) rename handle_rsp -> handle_msg so the name fits both BMC side and
    Core side.
(3) Add a new class IPMICore. This class represents a simulator/external
    connection for both BMC and Core side emulation.
(4) Change the original IPMIBmc to IPMIBmcHost, representing host side
    simulation.
(5) Add a new type IPMIBmcClient representing BMC side simulation.
(6) Appy the changes to  the entire IPMI library.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/acpi/ipmi.c             |   4 +-
 hw/ipmi/ipmi.c             |  60 +++++++++++++----
 hw/ipmi/ipmi_bmc_extern.c  |  67 ++++++++++--------
 hw/ipmi/ipmi_bmc_sim.c     |  78 ++++++++++++---------
 hw/ipmi/ipmi_bt.c          |  33 +++++----
 hw/ipmi/ipmi_kcs.c         |  31 +++++----
 hw/ipmi/isa_ipmi_bt.c      |  18 ++---
 hw/ipmi/isa_ipmi_kcs.c     |  13 ++--
 hw/ipmi/pci_ipmi_bt.c      |   8 +--
 hw/ipmi/pci_ipmi_kcs.c     |   8 +--
 hw/ipmi/smbus_ipmi.c       |  26 +++----
 hw/ppc/pnv.c               |   4 +-
 hw/ppc/pnv_bmc.c           |  22 +++---
 hw/smbios/smbios_type_38.c |  11 +--
 include/hw/ipmi/ipmi.h     | 135 ++++++++++++++++++++++++++-----------
 include/hw/ipmi/ipmi_bt.h  |   2 +-
 include/hw/ipmi/ipmi_kcs.h |   2 +-
 include/hw/ppc/pnv.h       |  12 ++--
 18 files changed, 332 insertions(+), 202 deletions(-)

diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c
index a20e57d465..e6d2cd790b 100644
--- a/hw/acpi/ipmi.c
+++ b/hw/acpi/ipmi.c
@@ -66,8 +66,8 @@ void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *dev;
     IPMIFwInfo info = {};
-    IPMIInterface *ii = IPMI_INTERFACE(adev);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *ii = IPMI_INTERFACE_HOST(adev);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
     uint16_t version;
 
     iic->get_fwinfo(ii, &info);
diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
index bbb07b151e..1be923ffb8 100644
--- a/hw/ipmi/ipmi.c
+++ b/hw/ipmi/ipmi.c
@@ -38,7 +38,7 @@ uint32_t ipmi_next_uuid(void)
     return ipmi_current_uuid++;
 }
 
-static int ipmi_do_hw_op(IPMIInterface *s, enum ipmi_op op, int checkonly)
+static int ipmi_do_hw_op(IPMIInterfaceHost *s, enum ipmi_op op, int checkonly)
 {
     switch (op) {
     case IPMI_RESET_CHASSIS:
@@ -78,9 +78,9 @@ static int ipmi_do_hw_op(IPMIInterface *s, enum ipmi_op op, int checkonly)
     }
 }
 
-static void ipmi_interface_class_init(ObjectClass *class, void *data)
+static void ipmi_interface_host_class_init(ObjectClass *class, void *data)
 {
-    IPMIInterfaceClass *ik = IPMI_INTERFACE_CLASS(class);
+    IPMIInterfaceHostClass *ik = IPMI_INTERFACE_HOST_CLASS(class);
 
     ik->do_hw_op = ipmi_do_hw_op;
 }
@@ -89,27 +89,48 @@ static const TypeInfo ipmi_interface_type_info = {
     .name = TYPE_IPMI_INTERFACE,
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(IPMIInterfaceClass),
-    .class_init = ipmi_interface_class_init,
+};
+
+static const TypeInfo ipmi_interface_host_type_info = {
+    .name = TYPE_IPMI_INTERFACE_HOST,
+    .parent = TYPE_IPMI_INTERFACE,
+    .class_size = sizeof(IPMIInterfaceHostClass),
+    .class_init = ipmi_interface_host_class_init,
+};
+
+static const TypeInfo ipmi_interface_client_type_info = {
+    .name = TYPE_IPMI_INTERFACE_CLIENT,
+    .parent = TYPE_IPMI_INTERFACE,
+    .class_size = sizeof(IPMIInterfaceClientClass),
+};
+
+static const TypeInfo ipmi_core_type_info = {
+    .name = TYPE_IPMI_CORE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(IPMICore),
+    .class_size = sizeof(IPMICoreClass),
+    .abstract = true,
 };
 
 static void isa_ipmi_bmc_check(const Object *obj, const char *name,
                                Object *val, Error **errp)
 {
-    IPMIBmc *bmc = IPMI_BMC(val);
+    IPMICore *ic = IPMI_CORE(val);
 
-    if (bmc->intf)
+    if (ic->intf) {
         error_setg(errp, "BMC object is already in use");
+    }
 }
 
 void ipmi_bmc_find_and_link(Object *obj, Object **bmc)
 {
-    object_property_add_link(obj, "bmc", TYPE_IPMI_BMC, bmc,
+    object_property_add_link(obj, "bmc", TYPE_IPMI_BMC_HOST, bmc,
                              isa_ipmi_bmc_check,
                              OBJ_PROP_LINK_STRONG);
 }
 
 static Property ipmi_bmc_properties[] = {
-    DEFINE_PROP_UINT8("slave_addr",  IPMIBmc, slave_addr, 0x20),
+    DEFINE_PROP_UINT8("slave_addr",  IPMIBmcHost, slave_addr, 0x20),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -120,19 +141,30 @@ static void bmc_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ipmi_bmc_properties);
 }
 
-static const TypeInfo ipmi_bmc_type_info = {
-    .name = TYPE_IPMI_BMC,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(IPMIBmc),
+static const TypeInfo ipmi_bmc_host_type_info = {
+    .name = TYPE_IPMI_BMC_HOST,
+    .parent = TYPE_IPMI_CORE,
+    .instance_size = sizeof(IPMIBmcHost),
     .abstract = true,
-    .class_size = sizeof(IPMIBmcClass),
+    .class_size = sizeof(IPMIBmcHostClass),
     .class_init = bmc_class_init,
 };
 
+static const TypeInfo ipmi_bmc_client_type_info = {
+    .name = TYPE_IPMI_BMC_CLIENT,
+    .parent = TYPE_IPMI_CORE,
+    .instance_size = sizeof(IPMIBmcClient),
+    .abstract = true,
+};
+
 static void ipmi_register_types(void)
 {
     type_register_static(&ipmi_interface_type_info);
-    type_register_static(&ipmi_bmc_type_info);
+    type_register_static(&ipmi_interface_host_type_info);
+    type_register_static(&ipmi_interface_client_type_info);
+    type_register_static(&ipmi_core_type_info);
+    type_register_static(&ipmi_bmc_host_type_info);
+    type_register_static(&ipmi_bmc_client_type_info);
 }
 
 type_init(ipmi_register_types)
diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index acf2bab35f..67f6a5d829 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -65,7 +65,7 @@
 #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
 OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)
 struct IPMIBmcExtern {
-    IPMIBmc parent;
+    IPMIBmcHost parent;
 
     CharBackend chr;
 
@@ -147,8 +147,9 @@ static void continue_send(IPMIBmcExtern *ibe)
 
 static void extern_timeout(void *opaque)
 {
+    IPMICore *ic = opaque;
     IPMIBmcExtern *ibe = opaque;
-    IPMIInterface *s = ibe->parent.intf;
+    IPMIInterface *s = ic->intf;
 
     if (ibe->connected) {
         if (ibe->waiting_rsp && (ibe->outlen == 0)) {
@@ -158,7 +159,7 @@ static void extern_timeout(void *opaque)
             ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
             ibe->inbuf[2] = ibe->outbuf[2];
             ibe->inbuf[3] = IPMI_CC_TIMEOUT;
-            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
+            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
         } else {
             continue_send(ibe);
         }
@@ -181,13 +182,13 @@ static void addchar(IPMIBmcExtern *ibe, unsigned char ch)
     }
 }
 
-static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
+static void ipmi_bmc_extern_handle_command(IPMICore *ic,
                                        uint8_t *cmd, unsigned int cmd_len,
                                        unsigned int max_cmd_len,
                                        uint8_t msg_id)
 {
-    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
-    IPMIInterface *s = ibe->parent.intf;
+    IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(ic);
+    IPMIInterface *s = ic->intf;
     uint8_t err = 0, csum;
     unsigned int i;
 
@@ -213,7 +214,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
         rsp[1] = cmd[1];
         rsp[2] = err;
         ibe->waiting_rsp = false;
-        k->handle_rsp(s, msg_id, rsp, 3);
+        k->handle_msg(s, msg_id, rsp, 3);
         goto out;
     }
 
@@ -236,8 +237,11 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
 
 static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
 {
-    IPMIInterface *s = ibe->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibe);
+    IPMIInterface *s = ic->intf;
+    IPMIInterfaceHost *hs = IPMI_INTERFACE_HOST(s);
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMIInterfaceHostClass *hk = IPMI_INTERFACE_HOST_GET_CLASS(s);
 
     switch (hw_op) {
     case VM_CMD_VERSION:
@@ -257,34 +261,36 @@ static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
         break;
 
     case VM_CMD_POWEROFF:
-        k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 0);
+        hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 0);
         break;
 
     case VM_CMD_RESET:
-        k->do_hw_op(s, IPMI_RESET_CHASSIS, 0);
+        hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 0);
         break;
 
     case VM_CMD_ENABLE_IRQ:
-        k->set_irq_enable(s, 1);
+        hk->set_irq_enable(hs, 1);
         break;
 
     case VM_CMD_DISABLE_IRQ:
-        k->set_irq_enable(s, 0);
+        hk->set_irq_enable(hs, 0);
         break;
 
     case VM_CMD_SEND_NMI:
-        k->do_hw_op(s, IPMI_SEND_NMI, 0);
+        hk->do_hw_op(hs, IPMI_SEND_NMI, 0);
         break;
 
     case VM_CMD_GRACEFUL_SHUTDOWN:
-        k->do_hw_op(s, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 0);
+        hk->do_hw_op(hs, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 0);
         break;
     }
 }
 
 static void handle_msg(IPMIBmcExtern *ibe)
 {
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(ibe->parent.intf);
+    IPMICore *ic = IPMI_CORE(ibe);
+    IPMIInterface *s = ic->intf;
+    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
 
     if (ibe->in_escape) {
         ipmi_debug("msg escape not ended\n");
@@ -306,7 +312,7 @@ static void handle_msg(IPMIBmcExtern *ibe)
 
     timer_del(ibe->extern_timer);
     ibe->waiting_rsp = false;
-    k->handle_rsp(ibe->parent.intf, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
+    k->handle_msg(s, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
 }
 
 static int can_receive(void *opaque)
@@ -382,9 +388,12 @@ static void receive(void *opaque, const uint8_t *buf, int size)
 
 static void chr_event(void *opaque, QEMUChrEvent event)
 {
+    IPMICore *ic = opaque;
     IPMIBmcExtern *ibe = opaque;
-    IPMIInterface *s = ibe->parent.intf;
+    IPMIInterface *s = ic->intf;
+    IPMIInterfaceHost *hs = IPMI_INTERFACE_HOST(s);
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMIInterfaceHostClass *hk = IPMI_INTERFACE_HOST_GET_CLASS(s);
     unsigned char v;
 
     switch (event) {
@@ -398,17 +407,17 @@ static void chr_event(void *opaque, QEMUChrEvent event)
         ibe->outlen++;
         addchar(ibe, VM_CMD_CAPABILITIES);
         v = VM_CAPABILITIES_IRQ | VM_CAPABILITIES_ATTN;
-        if (k->do_hw_op(ibe->parent.intf, IPMI_POWEROFF_CHASSIS, 1) == 0) {
+        if (hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 1) == 0) {
             v |= VM_CAPABILITIES_POWER;
         }
-        if (k->do_hw_op(ibe->parent.intf, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
+        if (hk->do_hw_op(hs, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
             == 0) {
             v |= VM_CAPABILITIES_GRACEFUL_SHUTDOWN;
         }
-        if (k->do_hw_op(ibe->parent.intf, IPMI_RESET_CHASSIS, 1) == 0) {
+        if (hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 1) == 0) {
             v |= VM_CAPABILITIES_RESET;
         }
-        if (k->do_hw_op(ibe->parent.intf, IPMI_SEND_NMI, 1) == 0) {
+        if (hk->do_hw_op(hs, IPMI_SEND_NMI, 1) == 0) {
             v |= VM_CAPABILITIES_NMI;
         }
         addchar(ibe, v);
@@ -433,7 +442,7 @@ static void chr_event(void *opaque, QEMUChrEvent event)
             ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
             ibe->inbuf[2] = ibe->outbuf[2];
             ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
-            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
+            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
         }
         break;
 
@@ -445,7 +454,7 @@ static void chr_event(void *opaque, QEMUChrEvent event)
     }
 }
 
-static void ipmi_bmc_extern_handle_reset(IPMIBmc *b)
+static void ipmi_bmc_extern_handle_reset(IPMIBmcHost *b)
 {
     IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(b);
 
@@ -475,14 +484,15 @@ static int ipmi_bmc_extern_post_migrate(void *opaque, int version_id)
      * error on the interface if a response was being waited for.
      */
     if (ibe->waiting_rsp) {
-        IPMIInterface *ii = ibe->parent.intf;
+        IPMICore *ic = opaque;
+        IPMIInterface *ii = ic->intf;
         IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
 
         ibe->waiting_rsp = false;
         ibe->inbuf[1] = ibe->outbuf[1] | 0x04;
         ibe->inbuf[2] = ibe->outbuf[2];
         ibe->inbuf[3] = IPMI_CC_BMC_INIT_IN_PROGRESS;
-        iic->handle_rsp(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
+        iic->handle_msg(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
     }
     return 0;
 }
@@ -522,9 +532,10 @@ static Property ipmi_bmc_extern_properties[] = {
 static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    IPMIBmcClass *bk = IPMI_BMC_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
+    IPMIBmcHostClass *bk = IPMI_BMC_HOST_CLASS(oc);
 
-    bk->handle_command = ipmi_bmc_extern_handle_command;
+    ck->handle_command = ipmi_bmc_extern_handle_command;
     bk->handle_reset = ipmi_bmc_extern_handle_reset;
     dc->hotpluggable = false;
     dc->realize = ipmi_bmc_extern_realize;
@@ -533,7 +544,7 @@ static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ipmi_bmc_extern_type = {
     .name          = TYPE_IPMI_BMC_EXTERN,
-    .parent        = TYPE_IPMI_BMC,
+    .parent        = TYPE_IPMI_BMC_HOST,
     .instance_size = sizeof(IPMIBmcExtern),
     .instance_init = ipmi_bmc_extern_init,
     .instance_finalize = ipmi_bmc_extern_finalize,
diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 905e091094..6296e5cfed 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -178,7 +178,7 @@ typedef struct IPMIRcvBufEntry {
 } IPMIRcvBufEntry;
 
 struct IPMIBmcSim {
-    IPMIBmc parent;
+    IPMIBmcHost parent;
 
     QEMUTimer *timer;
 
@@ -384,7 +384,7 @@ static int sdr_find_entry(IPMISdr *sdr, uint16_t recid,
     return 1;
 }
 
-int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
+int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,
                       const struct ipmi_sdr_compact **sdr, uint16_t *nextrec)
 
 {
@@ -448,10 +448,11 @@ static int attn_irq_enabled(IPMIBmcSim *ibs)
             IPMI_BMC_MSG_FLAG_EVT_BUF_FULL_SET(ibs));
 }
 
-void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
+void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log)
 {
     IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(b);
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
 
     if (!IPMI_BMC_EVENT_MSG_BUF_ENABLED(ibs)) {
@@ -475,7 +476,8 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
 static void gen_event(IPMIBmcSim *ibs, unsigned int sens_num, uint8_t deassert,
                       uint8_t evd1, uint8_t evd2, uint8_t evd3)
 {
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
     uint8_t evt[16];
     IPMISensor *sens = ibs->sensors + sens_num;
@@ -638,13 +640,14 @@ static void next_timeout(IPMIBmcSim *ibs)
     timer_mod_ns(ibs->timer, next);
 }
 
-static void ipmi_sim_handle_command(IPMIBmc *b,
+static void ipmi_sim_handle_command(IPMICore *b,
                                     uint8_t *cmd, unsigned int cmd_len,
                                     unsigned int max_cmd_len,
                                     uint8_t msg_id)
 {
     IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(b);
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
     const IPMICmdHandler *hdl;
     RspBuffer rsp = RSP_BUFFER_INITIALIZER;
@@ -690,15 +693,18 @@ static void ipmi_sim_handle_command(IPMIBmc *b,
     hdl->cmd_handler(ibs, cmd, cmd_len, &rsp);
 
  out:
-    k->handle_rsp(s, msg_id, rsp.buffer, rsp.len);
+    k->handle_msg(s, msg_id, rsp.buffer, rsp.len);
 
     next_timeout(ibs);
 }
 
 static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)
 {
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
+    IPMIInterfaceHost *hs = IPMI_INTERFACE_HOST(s);
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMIInterfaceHostClass *hk = IPMI_INTERFACE_HOST_CLASS(k);
 
     if (!ibs->watchdog_running) {
         goto out;
@@ -708,7 +714,7 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)
         switch (IPMI_BMC_WATCHDOG_GET_PRE_ACTION(ibs)) {
         case IPMI_BMC_WATCHDOG_PRE_NMI:
             ibs->msg_flags |= IPMI_BMC_MSG_FLAG_WATCHDOG_TIMEOUT_MASK;
-            k->do_hw_op(s, IPMI_SEND_NMI, 0);
+            hk->do_hw_op(hs, IPMI_SEND_NMI, 0);
             sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 8, 1,
                                     0xc8, (2 << 4) | 0xf, 0xff);
             break;
@@ -743,19 +749,19 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)
     case IPMI_BMC_WATCHDOG_ACTION_RESET:
         sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 1, 1,
                                 0xc1, ibs->watchdog_use & 0xf, 0xff);
-        k->do_hw_op(s, IPMI_RESET_CHASSIS, 0);
+        hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 0);
         break;
 
     case IPMI_BMC_WATCHDOG_ACTION_POWER_DOWN:
         sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 2, 1,
                                 0xc2, ibs->watchdog_use & 0xf, 0xff);
-        k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 0);
+        hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 0);
         break;
 
     case IPMI_BMC_WATCHDOG_ACTION_POWER_CYCLE:
         sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 2, 1,
                                 0xc3, ibs->watchdog_use & 0xf, 0xff);
-        k->do_hw_op(s, IPMI_POWERCYCLE_CHASSIS, 0);
+        hk->do_hw_op(hs, IPMI_POWERCYCLE_CHASSIS, 0);
         break;
     }
 
@@ -788,8 +794,9 @@ static void chassis_control(IPMIBmcSim *ibs,
                             uint8_t *cmd, unsigned int cmd_len,
                             RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterfaceHost *s = IPMI_INTERFACE_HOST(ic->intf);
+    IPMIInterfaceHostClass *k = IPMI_INTERFACE_HOST_GET_CLASS(s);
 
     switch (cmd[2] & 0xf) {
     case 0: /* power down */
@@ -845,8 +852,9 @@ static void get_device_id(IPMIBmcSim *ibs,
 
 static void set_global_enables(IPMIBmcSim *ibs, uint8_t val)
 {
-    IPMIInterface *s = ibs->parent.intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterfaceHost *s = IPMI_INTERFACE_HOST(ic->intf);
+    IPMIInterfaceHostClass *k = IPMI_INTERFACE_HOST_GET_CLASS(s);
     bool irqs_on;
 
     ibs->bmc_global_enables = val;
@@ -861,8 +869,9 @@ static void cold_reset(IPMIBmcSim *ibs,
                        uint8_t *cmd, unsigned int cmd_len,
                        RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterfaceHost *s = IPMI_INTERFACE_HOST(ic->intf);
+    IPMIInterfaceHostClass *k = IPMI_INTERFACE_HOST_GET_CLASS(s);
 
     /* Disable all interrupts */
     set_global_enables(ibs, 1 << IPMI_BMC_EVENT_LOG_BIT);
@@ -876,8 +885,9 @@ static void warm_reset(IPMIBmcSim *ibs,
                        uint8_t *cmd, unsigned int cmd_len,
                        RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterfaceHost *s = IPMI_INTERFACE_HOST(ic->intf);
+    IPMIInterfaceHostClass *k = IPMI_INTERFACE_HOST_GET_CLASS(s);
 
     if (k->reset) {
         k->reset(s, false);
@@ -939,7 +949,8 @@ static void clr_msg_flags(IPMIBmcSim *ibs,
                           uint8_t *cmd, unsigned int cmd_len,
                           RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
 
     ibs->msg_flags &= ~cmd[2];
@@ -957,7 +968,8 @@ static void read_evt_msg_buf(IPMIBmcSim *ibs,
                              uint8_t *cmd, unsigned int cmd_len,
                              RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
     unsigned int i;
 
@@ -989,7 +1001,8 @@ static void get_msg(IPMIBmcSim *ibs,
     g_free(msg);
 
     if (QTAILQ_EMPTY(&ibs->rcvbufs)) {
-        IPMIInterface *s = ibs->parent.intf;
+        IPMICore *ic = IPMI_CORE(ibs);
+        IPMIInterface *s = ic->intf;
         IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
 
         ibs->msg_flags &= ~IPMI_BMC_MSG_FLAG_RCV_MSG_QUEUE;
@@ -1014,7 +1027,8 @@ static void send_msg(IPMIBmcSim *ibs,
                      uint8_t *cmd, unsigned int cmd_len,
                      RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterface *s = ic->intf;
     IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
     IPMIRcvBufEntry *msg;
     uint8_t *buf;
@@ -1130,8 +1144,9 @@ static void set_watchdog_timer(IPMIBmcSim *ibs,
                                uint8_t *cmd, unsigned int cmd_len,
                                RspBuffer *rsp)
 {
-    IPMIInterface *s = ibs->parent.intf;
-    IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
+    IPMICore *ic = IPMI_CORE(ibs);
+    IPMIInterfaceHost *s = IPMI_INTERFACE_HOST(ic->intf);
+    IPMIInterfaceHostClass *k = IPMI_INTERFACE_HOST_GET_CLASS(s);
     unsigned int val;
 
     val = cmd[2] & 0x7; /* Validate use */
@@ -2159,9 +2174,8 @@ out:
 
 static void ipmi_sim_realize(DeviceState *dev, Error **errp)
 {
-    IPMIBmc *b = IPMI_BMC(dev);
     unsigned int i;
-    IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(b);
+    IPMIBmcSim *ibs = IPMI_BMC_SIMULATOR(dev);
 
     QTAILQ_INIT(&ibs->rcvbufs);
 
@@ -2209,17 +2223,17 @@ static Property ipmi_sim_properties[] = {
 static void ipmi_sim_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    IPMIBmcClass *bk = IPMI_BMC_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
 
     dc->hotpluggable = false;
     dc->realize = ipmi_sim_realize;
     device_class_set_props(dc, ipmi_sim_properties);
-    bk->handle_command = ipmi_sim_handle_command;
+    ck->handle_command = ipmi_sim_handle_command;
 }
 
 static const TypeInfo ipmi_sim_type = {
     .name          = TYPE_IPMI_BMC_SIMULATOR,
-    .parent        = TYPE_IPMI_BMC,
+    .parent        = TYPE_IPMI_BMC_HOST,
     .instance_size = sizeof(IPMIBmcSim),
     .class_init    = ipmi_sim_class_init,
 };
diff --git a/hw/ipmi/ipmi_bt.c b/hw/ipmi/ipmi_bt.c
index 22f94fb98d..1363098753 100644
--- a/hw/ipmi/ipmi_bt.c
+++ b/hw/ipmi/ipmi_bt.c
@@ -92,8 +92,9 @@ static void ipmi_bt_lower_irq(IPMIBT *ib)
     }
 }
 
-static void ipmi_bt_handle_event(IPMIInterface *ii)
+static void ipmi_bt_handle_event(IPMIInterfaceHost *iih)
 {
+    IPMIInterface *ii = IPMI_INTERFACE(iih);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
     IPMIBT *ib = iic->get_backend_data(ii);
 
@@ -141,8 +142,8 @@ static void ipmi_bt_handle_event(IPMIInterface *ii)
     ib->waiting_seq = ib->inmsg[2];
     ib->inmsg[2] = ib->inmsg[1];
     {
-        IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(ib->bmc);
-        bk->handle_command(ib->bmc, ib->inmsg + 2, ib->inlen - 2,
+        IPMICoreClass *ck = IPMI_CORE_GET_CLASS(ib->bmc);
+        ck->handle_command(IPMI_CORE(ib->bmc), ib->inmsg + 2, ib->inlen - 2,
                            sizeof(ib->inmsg), ib->waiting_rsp);
     }
  out:
@@ -215,9 +216,9 @@ static uint64_t ipmi_bt_ioport_read(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-static void ipmi_bt_signal(IPMIBT *ib, IPMIInterface *ii)
+static void ipmi_bt_signal(IPMIBT *ib, IPMIInterfaceHost *ii)
 {
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     ib->do_wake = 1;
     while (ib->do_wake) {
@@ -254,7 +255,7 @@ static void ipmi_bt_ioport_write(void *opaque, hwaddr addr, uint64_t val,
         }
         if (IPMI_BT_GET_H2B_ATN(val)) {
             IPMI_BT_SET_BBUSY(ib->control_reg, 1);
-            ipmi_bt_signal(ib, ii);
+            ipmi_bt_signal(ib, IPMI_INTERFACE_HOST(ii));
         }
         break;
 
@@ -329,10 +330,10 @@ static void ipmi_bt_set_atn(IPMIInterface *ii, int val, int irq)
     }
 }
 
-static void ipmi_bt_handle_reset(IPMIInterface *ii, bool is_cold)
+static void ipmi_bt_handle_reset(IPMIInterfaceHost *ii, bool is_cold)
 {
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
-    IPMIBT *ib = iic->get_backend_data(ii);
+    IPMIBT *ib = iic->get_backend_data(IPMI_INTERFACE(ii));
 
     if (is_cold) {
         /* Disable the BT interrupt on reset */
@@ -344,16 +345,18 @@ static void ipmi_bt_handle_reset(IPMIInterface *ii, bool is_cold)
     }
 }
 
-static void ipmi_bt_set_irq_enable(IPMIInterface *ii, int val)
+static void ipmi_bt_set_irq_enable(IPMIInterfaceHost *ii, int val)
 {
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
-    IPMIBT *ib = iic->get_backend_data(ii);
+    IPMIBT *ib = iic->get_backend_data(IPMI_INTERFACE(ii));
 
     ib->irqs_enabled = val;
 }
 
-static void ipmi_bt_init(IPMIInterface *ii, unsigned int min_size, Error **errp)
+static void ipmi_bt_init(IPMIInterfaceHost *iih, unsigned int min_size,
+                         Error **errp)
 {
+    IPMIInterface *ii = IPMI_INTERFACE(iih);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
     IPMIBT *ib = iic->get_backend_data(ii);
 
@@ -426,11 +429,13 @@ void ipmi_bt_get_fwinfo(struct IPMIBT *ib, IPMIFwInfo *info)
     info->irq_type = IPMI_LEVEL_IRQ;
 }
 
-void ipmi_bt_class_init(IPMIInterfaceClass *iic)
+void ipmi_bt_class_init(IPMIInterfaceClass *ic)
 {
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_CLASS(ic);
+
     iic->init = ipmi_bt_init;
-    iic->set_atn = ipmi_bt_set_atn;
-    iic->handle_rsp = ipmi_bt_handle_rsp;
+    ic->set_atn = ipmi_bt_set_atn;
+    ic->handle_msg = ipmi_bt_handle_rsp;
     iic->handle_if_event = ipmi_bt_handle_event;
     iic->set_irq_enable = ipmi_bt_set_irq_enable;
     iic->reset = ipmi_bt_handle_reset;
diff --git a/hw/ipmi/ipmi_kcs.c b/hw/ipmi/ipmi_kcs.c
index a77612946a..771f2bc0b2 100644
--- a/hw/ipmi/ipmi_kcs.c
+++ b/hw/ipmi/ipmi_kcs.c
@@ -94,18 +94,20 @@ static void ipmi_kcs_lower_irq(IPMIKCS *ik)
 
 static void ipmi_kcs_signal(IPMIKCS *ik, IPMIInterface *ii)
 {
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *iih = IPMI_INTERFACE_HOST(ii);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     ik->do_wake = 1;
     while (ik->do_wake) {
         ik->do_wake = 0;
-        iic->handle_if_event(ii);
+        iic->handle_if_event(iih);
     }
 }
 
-static void ipmi_kcs_handle_event(IPMIInterface *ii)
+static void ipmi_kcs_handle_event(IPMIInterfaceHost *iih)
 {
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterface *ii = IPMI_INTERFACE(iih);
+    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(iih);
     IPMIKCS *ik = iic->get_backend_data(ii);
 
     if (ik->cmd_reg == IPMI_KCS_ABORT_STATUS_CMD) {
@@ -162,12 +164,12 @@ static void ipmi_kcs_handle_event(IPMIInterface *ii)
             ik->inlen++;
         }
         if (ik->write_end) {
-            IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(ik->bmc);
+            IPMICoreClass *ck = IPMI_CORE_GET_CLASS(ik->bmc);
             ik->outlen = 0;
             ik->write_end = 0;
             ik->outpos = 0;
-            bk->handle_command(ik->bmc, ik->inmsg, ik->inlen, sizeof(ik->inmsg),
-                               ik->waiting_rsp);
+            ck->handle_command(IPMI_CORE(ik->bmc), ik->inmsg, ik->inlen,
+                               sizeof(ik->inmsg), ik->waiting_rsp);
             goto out_noibf;
         } else if (ik->cmd_reg == IPMI_KCS_WRITE_END_CMD) {
             ik->cmd_reg = -1;
@@ -321,18 +323,19 @@ static void ipmi_kcs_set_atn(IPMIInterface *ii, int val, int irq)
     }
 }
 
-static void ipmi_kcs_set_irq_enable(IPMIInterface *ii, int val)
+static void ipmi_kcs_set_irq_enable(IPMIInterfaceHost *ii, int val)
 {
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
-    IPMIKCS *ik = iic->get_backend_data(ii);
+    IPMIKCS *ik = iic->get_backend_data(IPMI_INTERFACE(ii));
 
     ik->irqs_enabled = val;
 }
 
 /* min_size must be a power of 2. */
-static void ipmi_kcs_init(IPMIInterface *ii, unsigned int min_size,
+static void ipmi_kcs_init(IPMIInterfaceHost *iih, unsigned int min_size,
                           Error **errp)
 {
+    IPMIInterface *ii = IPMI_INTERFACE(iih);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
     IPMIKCS *ik = iic->get_backend_data(ii);
 
@@ -413,11 +416,13 @@ void ipmi_kcs_get_fwinfo(IPMIKCS *ik, IPMIFwInfo *info)
     info->irq_type = IPMI_LEVEL_IRQ;
 }
 
-void ipmi_kcs_class_init(IPMIInterfaceClass *iic)
+void ipmi_kcs_class_init(IPMIInterfaceClass *ic)
 {
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_CLASS(ic);
+
     iic->init = ipmi_kcs_init;
-    iic->set_atn = ipmi_kcs_set_atn;
-    iic->handle_rsp = ipmi_kcs_handle_rsp;
+    ic->set_atn = ipmi_kcs_set_atn;
+    ic->handle_msg = ipmi_kcs_handle_rsp;
     iic->handle_if_event = ipmi_kcs_handle_event;
     iic->set_irq_enable = ipmi_kcs_set_irq_enable;
 }
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index a83e7243d6..a298f5f981 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -44,7 +44,8 @@ struct ISAIPMIBTDevice {
     uint32_t uuid;
 };
 
-static void isa_ipmi_bt_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
+static void isa_ipmi_bt_get_fwinfo(struct IPMIInterfaceHost *ii,
+                                   IPMIFwInfo *info)
 {
     ISAIPMIBTDevice *iib = ISA_IPMI_BT(ii);
 
@@ -73,8 +74,8 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     ISADevice *isadev = ISA_DEVICE(dev);
     ISAIPMIBTDevice *iib = ISA_IPMI_BT(dev);
-    IPMIInterface *ii = IPMI_INTERFACE(dev);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *ii = IPMI_INTERFACE_HOST(dev);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     if (!iib->bt.bmc) {
         error_setg(errp, "IPMI device requires a bmc attribute to be set");
@@ -83,7 +84,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
 
     iib->uuid = ipmi_next_uuid();
 
-    iib->bt.bmc->intf = ii;
+    IPMI_CORE(iib->bt.bmc)->intf = IPMI_INTERFACE(ii);
     iib->bt.opaque = iib;
 
     iic->init(ii, 0, &err);
@@ -144,14 +145,15 @@ static Property ipmi_isa_properties[] = {
 static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_CLASS(oc);
+    IPMIInterfaceClass *ic = IPMI_INTERFACE_CLASS(oc);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
     dc->realize = isa_ipmi_bt_realize;
     device_class_set_props(dc, ipmi_isa_properties);
 
-    iic->get_backend_data = isa_ipmi_bt_get_backend_data;
-    ipmi_bt_class_init(iic);
+    ic->get_backend_data = isa_ipmi_bt_get_backend_data;
+    ipmi_bt_class_init(ic);
     iic->get_fwinfo = isa_ipmi_bt_get_fwinfo;
     adevc->build_dev_aml = build_ipmi_dev_aml;
 }
@@ -163,7 +165,7 @@ static const TypeInfo isa_ipmi_bt_info = {
     .instance_init = isa_ipmi_bt_init,
     .class_init    = isa_ipmi_bt_class_init,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_IPMI_INTERFACE },
+        { TYPE_IPMI_INTERFACE_HOST },
         { TYPE_ACPI_DEV_AML_IF },
         { }
     }
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index b2ed70b9da..a1372ae448 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -44,7 +44,7 @@ struct ISAIPMIKCSDevice {
     uint32_t uuid;
 };
 
-static void isa_ipmi_kcs_get_fwinfo(IPMIInterface *ii, IPMIFwInfo *info)
+static void isa_ipmi_kcs_get_fwinfo(IPMIInterfaceHost *ii, IPMIFwInfo *info)
 {
     ISAIPMIKCSDevice *iik = ISA_IPMI_KCS(ii);
 
@@ -72,8 +72,8 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     ISADevice *isadev = ISA_DEVICE(dev);
     ISAIPMIKCSDevice *iik = ISA_IPMI_KCS(dev);
-    IPMIInterface *ii = IPMI_INTERFACE(dev);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *ii = IPMI_INTERFACE_HOST(dev);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     if (!iik->kcs.bmc) {
         error_setg(errp, "IPMI device requires a bmc attribute to be set");
@@ -82,7 +82,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
 
     iik->uuid = ipmi_next_uuid();
 
-    iik->kcs.bmc->intf = ii;
+    IPMI_CORE(iik->kcs.bmc)->intf = IPMI_INTERFACE(ii);
     iik->kcs.opaque = iik;
 
     iic->init(ii, 0, &err);
@@ -152,6 +152,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
+    IPMIInterfaceHostClass *iihc = IPMI_INTERFACE_HOST_CLASS(oc);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
     dc->realize = ipmi_isa_realize;
@@ -159,7 +160,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc, void *data)
 
     iic->get_backend_data = isa_ipmi_kcs_get_backend_data;
     ipmi_kcs_class_init(iic);
-    iic->get_fwinfo = isa_ipmi_kcs_get_fwinfo;
+    iihc->get_fwinfo = isa_ipmi_kcs_get_fwinfo;
     adevc->build_dev_aml = build_ipmi_dev_aml;
 }
 
@@ -170,7 +171,7 @@ static const TypeInfo isa_ipmi_kcs_info = {
     .instance_init = isa_ipmi_kcs_init,
     .class_init    = isa_ipmi_kcs_class_init,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_IPMI_INTERFACE },
+        { TYPE_IPMI_INTERFACE_HOST },
         { TYPE_ACPI_DEV_AML_IF },
         { }
     }
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index 633931b825..883bbda8f1 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -56,8 +56,8 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error **errp)
 {
     Error *err = NULL;
     PCIIPMIBTDevice *pik = PCI_IPMI_BT(pd);
-    IPMIInterface *ii = IPMI_INTERFACE(pd);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *ii = IPMI_INTERFACE_HOST(pd);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     if (!pik->bt.bmc) {
         error_setg(errp, "IPMI device requires a bmc attribute to be set");
@@ -66,7 +66,7 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error **errp)
 
     pik->uuid = ipmi_next_uuid();
 
-    pik->bt.bmc->intf = ii;
+    IPMI_CORE(pik->bt.bmc)->intf = IPMI_INTERFACE(ii);
     pik->bt.opaque = pik;
 
     pci_config_set_prog_interface(pd->config, 0x02); /* BT */
@@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_bt_info = {
     .instance_init = pci_ipmi_bt_instance_init,
     .class_init    = pci_ipmi_bt_class_init,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_IPMI_INTERFACE },
+        { TYPE_IPMI_INTERFACE_HOST },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { }
     }
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index 1a581413c2..40f8da95af 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -56,8 +56,8 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error **errp)
 {
     Error *err = NULL;
     PCIIPMIKCSDevice *pik = PCI_IPMI_KCS(pd);
-    IPMIInterface *ii = IPMI_INTERFACE(pd);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    IPMIInterfaceHost *ii = IPMI_INTERFACE_HOST(pd);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_GET_CLASS(ii);
 
     if (!pik->kcs.bmc) {
         error_setg(errp, "IPMI device requires a bmc attribute to be set");
@@ -66,7 +66,7 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error **errp)
 
     pik->uuid = ipmi_next_uuid();
 
-    pik->kcs.bmc->intf = ii;
+    IPMI_CORE(pik->kcs.bmc)->intf = IPMI_INTERFACE(ii);
     pik->kcs.opaque = pik;
 
     pci_config_set_prog_interface(pd->config, 0x01); /* KCS */
@@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_kcs_info = {
     .instance_init = pci_ipmi_kcs_instance_init,
     .class_init    = pci_ipmi_kcs_class_init,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_IPMI_INTERFACE },
+        { TYPE_IPMI_INTERFACE_HOST },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { }
     }
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index d0991ab7f9..f61b260f58 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -49,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(SMBusIPMIDevice, SMBUS_IPMI)
 struct SMBusIPMIDevice {
     SMBusDevice parent;
 
-    IPMIBmc *bmc;
+    IPMIBmcHost *bmc;
 
     uint8_t outmsg[MAX_SSIF_IPMI_MSG_SIZE];
     uint32_t outlen;
@@ -71,7 +71,7 @@ struct SMBusIPMIDevice {
     uint32_t uuid;
 };
 
-static void smbus_ipmi_handle_event(IPMIInterface *ii)
+static void smbus_ipmi_handle_event(IPMIInterfaceHost *ii)
 {
     /* No interrupts, so nothing to do here. */
 }
@@ -100,7 +100,7 @@ static void smbus_ipmi_set_atn(IPMIInterface *ii, int val, int irq)
     /* This is where PEC would go. */
 }
 
-static void smbus_ipmi_set_irq_enable(IPMIInterface *ii, int val)
+static void smbus_ipmi_set_irq_enable(IPMIInterfaceHost *ii, int val)
 {
 }
 
@@ -108,7 +108,7 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *sid)
 {
     uint8_t *msg = sid->inmsg;
     uint32_t len = sid->inlen;
-    IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(sid->bmc);
+    IPMICoreClass *ck = IPMI_CORE_GET_CLASS(sid->bmc);
 
     sid->outlen = 0;
     sid->outpos = 0;
@@ -136,8 +136,8 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *sid)
         return;
     }
 
-    bk->handle_command(sid->bmc, sid->inmsg, sid->inlen, sizeof(sid->inmsg),
-                       sid->waiting_rsp);
+    ck->handle_command(IPMI_CORE(sid->bmc), sid->inmsg, sid->inlen,
+                       sizeof(sid->inmsg), sid->waiting_rsp);
 }
 
 static uint8_t ipmi_receive_byte(SMBusDevice *dev)
@@ -326,7 +326,7 @@ static void smbus_ipmi_realize(DeviceState *dev, Error **errp)
 
     sid->uuid = ipmi_next_uuid();
 
-    sid->bmc->intf = ii;
+    IPMI_CORE(sid->bmc)->intf = ii;
 }
 
 static void smbus_ipmi_init(Object *obj)
@@ -336,7 +336,8 @@ static void smbus_ipmi_init(Object *obj)
     ipmi_bmc_find_and_link(obj, (Object **) &sid->bmc);
 }
 
-static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
+static void smbus_ipmi_get_fwinfo(struct IPMIInterfaceHost *ii,
+                                  IPMIFwInfo *info)
 {
     SMBusIPMIDevice *sid = SMBUS_IPMI(ii);
 
@@ -354,7 +355,8 @@ static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo *info)
 static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
+    IPMIInterfaceHostClass *iic = IPMI_INTERFACE_HOST_CLASS(oc);
+    IPMIInterfaceClass *ic = IPMI_INTERFACE_CLASS(oc);
     SMBusDeviceClass *sc = SMBUS_DEVICE_CLASS(oc);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
@@ -362,8 +364,8 @@ static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
     sc->write_data = ipmi_write_data;
     dc->vmsd = &vmstate_smbus_ipmi;
     dc->realize = smbus_ipmi_realize;
-    iic->set_atn = smbus_ipmi_set_atn;
-    iic->handle_rsp = smbus_ipmi_handle_rsp;
+    ic->set_atn = smbus_ipmi_set_atn;
+    ic->handle_msg = smbus_ipmi_handle_rsp;
     iic->handle_if_event = smbus_ipmi_handle_event;
     iic->set_irq_enable = smbus_ipmi_set_irq_enable;
     iic->get_fwinfo = smbus_ipmi_get_fwinfo;
@@ -377,7 +379,7 @@ static const TypeInfo smbus_ipmi_info = {
     .instance_init = smbus_ipmi_init,
     .class_init    = smbus_ipmi_class_init,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_IPMI_INTERFACE },
+        { TYPE_IPMI_INTERFACE_HOST },
         { TYPE_ACPI_DEV_AML_IF },
         { }
     }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 11cb48af2f..a39cbdaa38 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -595,7 +595,7 @@ static void pnv_powerdown_notify(Notifier *n, void *opaque)
 static void pnv_reset(MachineState *machine, ShutdownCause reason)
 {
     PnvMachineState *pnv = PNV_MACHINE(machine);
-    IPMIBmc *bmc;
+    IPMIBmcHost *bmc;
     void *fdt;
 
     qemu_devices_reset(reason);
@@ -746,7 +746,7 @@ static bool pnv_match_cpu(const char *default_type, const char *cpu_type)
     return ppc_default->pvr_match(ppc_default, ppc->pvr, false);
 }
 
-static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
+static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmcHost *bmc, uint32_t irq)
 {
     ISADevice *dev = isa_new("isa-ipmi-bt");
 
diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 99f1e8d7f9..6e8a6f545b 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -50,12 +50,12 @@ typedef struct OemSel {
 #define SOFT_OFF        0x00
 #define SOFT_REBOOT     0x01
 
-static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
+static bool pnv_bmc_is_simulator(IPMIBmcHost *bmc)
 {
     return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
 }
 
-static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
+static void pnv_gen_oem_sel(IPMIBmcHost *bmc, uint8_t reboot)
 {
     /* IPMI SEL Event are 16 bytes long */
     OemSel sel = {
@@ -71,12 +71,12 @@ static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
     ipmi_bmc_gen_event(bmc, (uint8_t *) &sel, 0 /* do not log the event */);
 }
 
-void pnv_bmc_powerdown(IPMIBmc *bmc)
+void pnv_bmc_powerdown(IPMIBmcHost *bmc)
 {
     pnv_gen_oem_sel(bmc, SOFT_OFF);
 }
 
-void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
+void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt)
 {
     int offset;
     int i;
@@ -249,7 +249,7 @@ static const IPMINetfn hiomap_netfn = {
 };
 
 
-void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
+void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor)
 {
     if (!pnv_bmc_is_simulator(bmc)) {
         return;
@@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
  * Instantiate the machine BMC. PowerNV uses the QEMU internal
  * simulator but it could also be external.
  */
-IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
+IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
 {
     Object *obj;
 
     obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
     qdev_realize(DEVICE(obj), NULL, &error_fatal);
-    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
+    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
 
-    return IPMI_BMC(obj);
+    return IPMI_BMC_HOST(obj);
 }
 
 typedef struct ForeachArgs {
@@ -296,9 +296,9 @@ static int bmc_find(Object *child, void *opaque)
     return 0;
 }
 
-IPMIBmc *pnv_bmc_find(Error **errp)
+IPMIBmcHost *pnv_bmc_find(Error **errp)
 {
-    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
+    ForeachArgs args = { TYPE_IPMI_BMC_HOST, NULL };
     int ret;
 
     ret = object_child_foreach_recursive(object_get_root(), bmc_find, &args);
@@ -308,5 +308,5 @@ IPMIBmc *pnv_bmc_find(Error **errp)
         return NULL;
     }
 
-    return args.obj ? IPMI_BMC(args.obj) : NULL;
+    return args.obj ? IPMI_BMC_HOST(args.obj) : NULL;
 }
diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
index 168b886647..81a1cf09ea 100644
--- a/hw/smbios/smbios_type_38.c
+++ b/hw/smbios/smbios_type_38.c
@@ -83,16 +83,17 @@ static void smbios_add_ipmi_devices(BusState *bus)
 
     QTAILQ_FOREACH(kid, &bus->children,  sibling) {
         DeviceState *dev = kid->child;
-        Object *obj = object_dynamic_cast(OBJECT(dev), TYPE_IPMI_INTERFACE);
+        Object *obj = object_dynamic_cast(OBJECT(dev),
+                                          TYPE_IPMI_INTERFACE_HOST);
         BusState *childbus;
 
         if (obj) {
-            IPMIInterface *ii;
-            IPMIInterfaceClass *iic;
+            IPMIInterfaceHost *ii;
+            IPMIInterfaceHostClass *iic;
             IPMIFwInfo info;
 
-            ii = IPMI_INTERFACE(obj);
-            iic = IPMI_INTERFACE_GET_CLASS(obj);
+            ii = IPMI_INTERFACE_HOST(obj);
+            iic = IPMI_INTERFACE_HOST_GET_CLASS(obj);
             memset(&info, 0, sizeof(info));
             if (!iic->get_fwinfo) {
                 continue;
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 77a7213ed9..5ead2467f5 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -109,99 +109,156 @@ uint32_t ipmi_next_uuid(void);
  * and the BMC.
  */
 #define TYPE_IPMI_INTERFACE "ipmi-interface"
-#define IPMI_INTERFACE(obj) \
-     INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
-typedef struct IPMIInterfaceClass IPMIInterfaceClass;
-DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
-                       TYPE_IPMI_INTERFACE)
+OBJECT_DECLARE_TYPE(IPMIInterface, IPMIInterfaceClass, IPMI_INTERFACE)
 
+typedef struct IPMIInterfaceClass IPMIInterfaceClass;
 typedef struct IPMIInterface IPMIInterface;
 
 struct IPMIInterfaceClass {
     InterfaceClass parent;
 
+    /*
+     * The interfaces use this to perform certain ops
+     */
+    void (*set_atn)(struct IPMIInterface *s, int val, int irq);
+
+    /*
+     * Set by the owner to hold the backend data for the interface.
+     */
+    void *(*get_backend_data)(struct IPMIInterface *s);
+
+    /*
+     * Handle a message between the host and the BMC.
+     */
+    void (*handle_msg)(struct IPMIInterface *s, uint8_t msg_id,
+                       unsigned char *msg, unsigned int msg_len);
+};
+
+/*
+ * An IPMI Interface representing host side communication to a
+ * remote BMC, either simulated or an IPMI BMC client.
+ */
+#define TYPE_IPMI_INTERFACE_HOST "ipmi-interface-host"
+OBJECT_DECLARE_TYPE(IPMIInterfaceHost, IPMIInterfaceHostClass, \
+                    IPMI_INTERFACE_HOST)
+
+typedef struct IPMIInterfaceHostClass IPMIInterfaceHostClass;
+typedef struct IPMIInterfaceHost IPMIInterfaceHost;
+
+struct IPMIInterfaceHostClass {
+    IPMIInterfaceClass parent;
+
     /*
      * min_size is the requested I/O size and must be a power of 2.
      * This is so PCI (or other busses) can request a bigger range.
      * Use 0 for the default.
      */
-    void (*init)(struct IPMIInterface *s, unsigned int min_size, Error **errp);
+    void (*init)(struct IPMIInterfaceHost *s, unsigned int min_size,
+                 Error **errp);
 
     /*
      * Perform various operations on the hardware.  If checkonly is
      * true, it will return if the operation can be performed, but it
      * will not do the operation.
      */
-    int (*do_hw_op)(struct IPMIInterface *s, enum ipmi_op op, int checkonly);
+    int (*do_hw_op)(struct IPMIInterfaceHost *s, enum ipmi_op op,
+                    int checkonly);
 
     /*
      * Enable/disable irqs on the interface when the BMC requests this.
      */
-    void (*set_irq_enable)(struct IPMIInterface *s, int val);
+    void (*set_irq_enable)(struct IPMIInterfaceHost *s, int val);
 
     /*
      * Handle an event that occurred on the interface, generally the.
      * target writing to a register.
      */
-    void (*handle_if_event)(struct IPMIInterface *s);
-
-    /*
-     * The interfaces use this to perform certain ops
-     */
-    void (*set_atn)(struct IPMIInterface *s, int val, int irq);
+    void (*handle_if_event)(struct IPMIInterfaceHost *s);
 
     /*
      * Got an IPMI warm/cold reset.
      */
-    void (*reset)(struct IPMIInterface *s, bool is_cold);
+    void (*reset)(struct IPMIInterfaceHost *s, bool is_cold);
 
     /*
-     * Handle a response from the bmc.
+     * Return the firmware info for a device.
      */
-    void (*handle_rsp)(struct IPMIInterface *s, uint8_t msg_id,
-                       unsigned char *rsp, unsigned int rsp_len);
+    void (*get_fwinfo)(struct IPMIInterfaceHost *s, IPMIFwInfo *info);
+};
 
-    /*
-     * Set by the owner to hold the backend data for the interface.
-     */
-    void *(*get_backend_data)(struct IPMIInterface *s);
+/*
+ * An IPMI Interface representing BMC side communication to a
+ * remote host running `ipmi-bmc-extern`.
+ */
+#define TYPE_IPMI_INTERFACE_CLIENT "ipmi-interface-client"
+OBJECT_DECLARE_TYPE(IPMIInterfaceClient, IPMIInterfaceClientClass,
+                    IPMI_INTERFACE_CLIENT)
 
-    /*
-     * Return the firmware info for a device.
-     */
-    void (*get_fwinfo)(struct IPMIInterface *s, IPMIFwInfo *info);
+typedef struct IPMIInterfaceClientClass IPMIInterfaceClientClass;
+typedef struct IPMIInterfaceClient IPMIInterfaceClient;
+
+struct IPMIInterfaceClientClass {
+    IPMIInterfaceClass parent;
 };
 
 /*
- * Define a BMC simulator (or perhaps a connection to a real BMC)
+ * Define an IPMI core (Either BMC or Host simulator.)
  */
-#define TYPE_IPMI_BMC "ipmi-bmc"
-OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,
-                    IPMI_BMC)
+#define TYPE_IPMI_CORE "ipmi-core"
+OBJECT_DECLARE_TYPE(IPMICore, IPMICoreClass, IPMI_CORE)
 
-struct IPMIBmc {
+struct IPMICore {
     DeviceState parent;
 
-    uint8_t slave_addr;
-
     IPMIInterface *intf;
 };
 
-struct IPMIBmcClass {
+struct IPMICoreClass {
     DeviceClass parent;
 
-    /* Called when the system resets to report to the bmc. */
-    void (*handle_reset)(struct IPMIBmc *s);
+    /*
+     * Handle a hardware command.
+     */
+    void (*handle_hw_op)(struct IPMICore *s, uint8_t hw_op, uint8_t operand);
 
     /*
      * Handle a command to the bmc.
      */
-    void (*handle_command)(struct IPMIBmc *s,
+    void (*handle_command)(struct IPMICore *s,
                            uint8_t *cmd, unsigned int cmd_len,
                            unsigned int max_cmd_len,
                            uint8_t msg_id);
 };
 
+/*
+ * Define a BMC simulator (or perhaps a connection to a real BMC)
+ */
+#define TYPE_IPMI_BMC_HOST "ipmi-bmc-host"
+OBJECT_DECLARE_TYPE(IPMIBmcHost, IPMIBmcHostClass, IPMI_BMC_HOST)
+
+struct IPMIBmcHost {
+    IPMICore parent;
+
+    uint8_t slave_addr;
+};
+
+struct IPMIBmcHostClass {
+    IPMICoreClass parent;
+
+    /* Called when the system resets to report to the bmc. */
+    void (*handle_reset)(struct IPMIBmcHost *s);
+
+};
+
+/*
+ * Define a BMC side client that responds to an `ipmi-bmc-extern`.
+ */
+#define TYPE_IPMI_BMC_CLIENT "ipmi-bmc-client"
+OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcClient, IPMI_BMC_CLIENT)
+struct IPMIBmcClient {
+    IPMICore parent;
+};
+
 /*
  * Add a link property to obj that points to a BMC.
  */
@@ -259,9 +316,9 @@ struct ipmi_sdr_compact {
 
 typedef uint8_t ipmi_sdr_compact_buffer[sizeof(struct ipmi_sdr_compact)];
 
-int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
+int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,
                       const struct ipmi_sdr_compact **sdr, uint16_t *nextrec);
-void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);
+void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log);
 
 #define TYPE_IPMI_BMC_SIMULATOR "ipmi-bmc-sim"
 OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcSim, IPMI_BMC_SIMULATOR)
diff --git a/include/hw/ipmi/ipmi_bt.h b/include/hw/ipmi/ipmi_bt.h
index 8a4316ea7c..237dbb4599 100644
--- a/include/hw/ipmi/ipmi_bt.h
+++ b/include/hw/ipmi/ipmi_bt.h
@@ -28,7 +28,7 @@
 #include "hw/ipmi/ipmi.h"
 
 typedef struct IPMIBT {
-    IPMIBmc *bmc;
+    IPMIBmcHost *bmc;
 
     bool do_wake;
 
diff --git a/include/hw/ipmi/ipmi_kcs.h b/include/hw/ipmi/ipmi_kcs.h
index 6e6ef4c539..1f491b7243 100644
--- a/include/hw/ipmi/ipmi_kcs.h
+++ b/include/hw/ipmi/ipmi_kcs.h
@@ -28,7 +28,7 @@
 #include "hw/ipmi/ipmi.h"
 
 typedef struct IPMIKCS {
-    IPMIBmc *bmc;
+    IPMIBmcHost *bmc;
 
     bool do_wake;
 
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 409f3bf763..b712a7e8d5 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -91,7 +91,7 @@ struct PnvMachineState {
     ISABus       *isa_bus;
     uint32_t     cpld_irqstate;
 
-    IPMIBmc      *bmc;
+    IPMIBmcHost  *bmc;
     Notifier     powerdown_notifier;
 
     PnvPnor      *pnor;
@@ -108,11 +108,11 @@ PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb);
 /*
  * BMC helpers
  */
-void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt);
-void pnv_bmc_powerdown(IPMIBmc *bmc);
-IPMIBmc *pnv_bmc_create(PnvPnor *pnor);
-IPMIBmc *pnv_bmc_find(Error **errp);
-void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
+void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt);
+void pnv_bmc_powerdown(IPMIBmcHost *bmc);
+IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor);
+IPMIBmcHost *pnv_bmc_find(Error **errp);
+void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor);
 
 /*
  * POWER8 MMIO base addresses
-- 
2.40.0.348.gf938b09366-goog


