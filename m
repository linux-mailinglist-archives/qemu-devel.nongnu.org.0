Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87BC607770
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:01:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olreZ-0000Tg-Ib
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:01:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrdD-000823-EP
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wagi@monom.org>)
 id 1olrd3-0007sH-LB; Fri, 21 Oct 2022 09:00:01 -0400
Received: from mail.nearlyone.de ([46.163.114.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wagi@monom.org>)
 id 1olrd1-0006fm-FS; Fri, 21 Oct 2022 09:00:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 957A160F65; Fri, 21 Oct 2022 14:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monom.org; s=dkim;
 t=1666357191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gdZVlsQTJ9rUTLQDgJKiBFr5QZLtD/crzAeeJKMcPLA=;
 b=xmAg2dCZcCiXSQy1OD/15FigGMeG4Vkjb/VFV9gDh/yn4EwhVvp+PaHe/6khq8hAE1ho7T
 oMS3TFlIoL5fNcGdZIpSoDnL6ci9H80zVWclKf0zZikvP0UWu7W69WPi9uVQnJnjhH7Pq9
 3FDec4amqg9iMC6KLvqL7Q9480J4U8weswwdTJ25JLyfDm4z8i5KJV1cLXCITqh3CNpLcH
 oqzTYBDeIK06LgWM/JudDaP9dOxNYGxiLmU+7LGCJ4tSceyZc2fweuNm2EqT350GUxNv62
 unisHkZfZRoLNbRRoJTbSt7y7o6I4yqf/DQKvz2jz59Kej5BS+RdfYI+0TGGdQ==
Date: Fri, 21 Oct 2022 14:59:48 +0200
From: Daniel Wagner <wagi@monom.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <20221021125948.g2vuxkcvmflm3ruu@carbon.lan>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
 <Y0RTHArVOWN2Tg2K@cormorant.local>
 <20221018081546.mzziix5ymjmpus56@carbon.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018081546.mzziix5ymjmpus56@carbon.lan>
X-Last-TLS-Session-Version: TLSv1.3
Received-SPF: pass client-ip=46.163.114.145; envelope-from=wagi@monom.org;
 helo=mail.nearlyone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 10:15:57AM +0200, Daniel Wagner wrote:
> On Mon, Oct 10, 2022 at 07:15:08PM +0200, Klaus Jensen wrote:
> > This is all upstream. Namespaces with 'shared=on' *should* all be
> > automatically attached to any hotplugged controller devices.
> > 
> > With what setup is this not working for you?
> 
> Ah okay, I missed the 'shared=on' bit. Let me try again.

Nope, that's not enough. Maybe my setup is not okay?

  <qemu:commandline>
    <qemu:arg value='-device'/>
    <qemu:arg value='pcie-root-port,id=root,slot=1'/>
  </qemu:commandline>

  qemu-monitor-command tw0 --hmp drive_add 0 if=none,file=/tmp/nvme1.qcow2,format=qcow2,id=nvme1
  qemu-monitor-command tw0 --hmp device_add nvme,id=nvme1,serial=nvme-1,bus=root
  qemu-monitor-command tw0 --hmp device_add nvme-ns,drive=nvme1,nsid=1,shared=on
  Error: Bus 'nvme1' does not support hotplugging

With the patch below the hotplugging works.


diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..a09a698873 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5711,8 +5711,6 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_attach_ns(ctrl, ns);
-            nvme_select_iocs_ns(ctrl, ns);
-
             break;
 
         case NVME_NS_ATTACHMENT_DETACH:
@@ -5720,26 +5718,12 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
-            ctrl->namespaces[nsid] = NULL;
-            ns->attached--;
-
-            nvme_update_dmrsl(ctrl);
-
+            nvme_detach_ns(ctrl, ns);
             break;
 
         default:
             return NVME_INVALID_FIELD | NVME_DNR;
         }
-
-        /*
-         * Add namespace id to the changed namespace id list for event clearing
-         * via Get Log Page command.
-         */
-        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
-            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
-                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
-                               NVME_LOG_CHANGED_NSLIST);
-        }
     }
 
     return NVME_SUCCESS;
@@ -7564,6 +7548,34 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+    if (NVME_CC_EN(n->bar.cc)) {
+        /* Ctrl is live */
+        nvme_select_iocs_ns(n, ns);
+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
+    }
+}
+
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    uint32_t nsid = ns->params.nsid;
+
+    if (ns->attached) {
+        n->namespaces[nsid - 1] = NULL;
+        ns->attached--;
+    }
+    nvme_update_dmrsl(n);
+    if (NVME_CC_EN(n->bar.cc)) {
+        /* Ctrl is live */
+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -7600,6 +7612,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
     nvme_init_ctrl(n, pci_dev);
+    qbus_set_bus_hotplug_handler(BUS(&n->bus));
 
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
@@ -7817,10 +7830,22 @@ static const TypeInfo nvme_info = {
     },
 };
 
+static void nvme_bus_class_init(ObjectClass *klass, void *data)
+{
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+}
+
 static const TypeInfo nvme_bus_info = {
     .name = TYPE_NVME_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(NvmeBus),
+    .class_init = nvme_bus_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void nvme_register_types(void)
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 62a1f97be0..69ba08b0e7 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -530,10 +530,31 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
 static void nvme_ns_unrealize(DeviceState *dev)
 {
     NvmeNamespace *ns = NVME_NS(dev);
+    BusState *s = qdev_get_parent_bus(dev);
+    NvmeCtrl *n = NVME(s->parent);
+    NvmeSubsystem *subsys = n->subsys;
+    uint32_t nsid = ns->params.nsid;
+    int i;
 
     nvme_ns_drain(ns);
     nvme_ns_shutdown(ns);
     nvme_ns_cleanup(ns);
+
+    if (subsys) {
+        subsys->namespaces[nsid] = NULL;
+
+        if (ns->params.shared) {
+            for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+                NvmeCtrl *ctrl = subsys->ctrls[i];
+
+                if (ctrl) {
+                    nvme_detach_ns(ctrl, ns);
+                }
+            }
+            return;
+        }
+    }
+    nvme_detach_ns(n, ns);
 }
 
 static void nvme_ns_realize(DeviceState *dev, Error **errp)
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..7d9fc2ab28 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -576,6 +576,7 @@ static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
 }
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,

