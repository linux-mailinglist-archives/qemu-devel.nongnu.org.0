Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8560FFC9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7D2-0002dH-L9; Thu, 27 Oct 2022 14:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7Cy-0002Rr-Ul
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:02:24 -0400
Received: from resqmta-c1p-023465.sys.comcast.net ([2001:558:fd00:56::5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7Cv-0005sX-NA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:02:24 -0400
Received: from resomta-c1p-023266.sys.comcast.net ([96.102.18.234])
 by resqmta-c1p-023465.sys.comcast.net with ESMTP
 id o3goos7Lcq2C4o7CvoHwG8; Thu, 27 Oct 2022 18:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1666893741;
 bh=rziYTYinIhVEwE/s4LSd6GoYFKM6qWjGhNOnddqSKk4=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version:
 Xfinity-Spam-Result;
 b=kk5hSGVy7TMhfxdq53Qv7uUsk03Tet857Xh/talW4hkXymNpO/nJvQASsqgnObrD7
 qxQvKCFav0wlrL6WlBY6CWlhybsypfiqkaH1VUwaXwz/TCFl3HfKcPz6IK3Wl8itTn
 goVrVC2cn1hS4gb6v2cyVWaPLHcU8KWZJ993fvFaMQiu014pAKUPPR6Qx8FQoqpb61
 ddnNVE1fzF5XrA5lD1LEuWj+imAQCRhw525a3/iKmcYjsTN/+ZOlyTVck5q1zIaKG9
 u0B8KC8ka0eRepLSkJ7oveA2HGzkf5GFPyV4DNdwysox7bbRnwH+AfP9JxM8par9vJ
 myTH36vHNS0qg==
Received: from jderrick-mobl4.Home ([75.163.75.236])
 by resomta-c1p-023266.sys.comcast.net with ESMTPA
 id o7BQo587p62udo7CEodDFQ; Thu, 27 Oct 2022 18:01:57 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhonhgrthhhrghnucffvghrrhhitghkuceojhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvqeenucggtffrrghtthgvrhhnpedtteeljeffgfffveehhfetveefuedvheevffffhedtjeeuvdevgfeftddtheeftdenucfkphepjeehrdduieefrdejhedrvdefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhephhgvlhhopehjuggvrhhrihgtkhdqmhhosghlgedrjfhomhgvpdhinhgvthepjeehrdduieefrdejhedrvdefiedpmhgrihhlfhhrohhmpehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvpdhrtghpthhtohepmhhitghhrggvlhdrkhhrohhprggtiigvkhesshholhhiughighhmrdgtohhmpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomhdprhgtphhtthhopehhrhgvihhtiiesrhgvughhrghtrdgtohhm
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: qemu-devel@nongnu.org
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v3 2/2] hw/nvme: Support for Namespaces Management from guest
 OS - delete-ns
Date: Thu, 27 Oct 2022 13:00:46 -0500
Message-Id: <20221027180046.250-3-jonathan.derrick@linux.dev>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027180046.250-1-jonathan.derrick@linux.dev>
References: <20221027180046.250-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:558:fd00:56::5;
 envelope-from=jonathan.derrick@linux.dev;
 helo=resqmta-c1p-023465.sys.comcast.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Kropaczek <michael.kropaczek@solidigm.com>

Added support for NVMEe NameSpaces Mangement allowing the guest OS to
delete namespaces by issuing nvme delete-ns command.
It is an extension to currently implemented Qemu nvme virtual device.
Virtual devices representing namespaces will be created and/or deleted
during Qemu's running session, at anytime.

Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
---
 docs/system/devices/nvme.rst |  9 ++--
 hw/nvme/ctrl.c               | 86 ++++++++++++++++++++++++++++++++++--
 hw/nvme/ns-backend.c         |  5 +++
 hw/nvme/ns.c                 | 74 +++++++++++++++++++++++++++++++
 hw/nvme/nvme.h               |  2 +
 hw/nvme/trace-events         |  1 +
 include/block/nvme.h         |  1 +
 7 files changed, 170 insertions(+), 8 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 13e2fbc0d6..97b2453a00 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -103,12 +103,12 @@ Parameters:
 
 ``auto-ns-path=<path to nvme storage location>``
   If specified indicates a support for dynamic management of nvme namespaces
-  by means of nvme create-ns command. This path points
+  by means of nvme create-ns and nvme delete-ns commands. This path points
   to the storage area for backend images must exist. Additionally it requires
   that parameter `ns-subsys` must be specified whereas parameter `drive`
   must not. The legacy namespace backend is disabled, instead, a pair of
   files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
-  will refer to respective namespaces. The create-ns, attach-ns
+  will refer to respective namespaces. The create-ns, delete-ns, attach-ns
   and detach-ns commands, issued at the guest side, will make changes to
   those files accordingly.
   For each namespace exists an image file in raw format and a config file
@@ -140,8 +140,9 @@ Please note that ``nvme-ns`` device is not required to support of dynamic
 namespaces management feature. It is not prohibited to assign a such device to
 ``nvme`` device specified to support dynamic namespace management if one has
 an use case to do so, however, it will only coexist and be out of the scope of
-Namespaces Management. NsIds will be consistently managed, creation (create-ns)
-of a namespace will not allocate the NsId already being taken. If ``nvme-ns``
+Namespaces Management. Deletion (delete-ns) will render an error for this
+namespace. NsIds will be consistently managed, creation (create-ns) of
+a namespace will not allocate the NsId already being taken. If ``nvme-ns``
 device conflicts with previously created one by create-ns (the same NsId),
 it will break QEMU's start up.
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d2b9d65eb9..87eb88486a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -144,12 +144,12 @@
  *
  * - `auto-ns-path`
  *   If specified indicates a support for dynamic management of nvme namespaces
- *   by means of nvme create-ns command. This path pointing
+ *   by means of nvme create-ns and nvme delete-ns commands. This path pointing
  *   to a storage area for backend images must exist. Additionally it requires
  *   that parameter `ns-subsys` must be specified whereas parameter `drive`
  *   must not. The legacy namespace backend is disabled, instead, a pair of
  *   files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
- *   will refer to respective namespaces. The create-ns, attach-ns
+ *   will refer to respective namespaces. The create-ns, delete-ns, attach-ns
  *   and detach-ns commands, issued at the guest side, will make changes to
  *   those files accordingly.
  *   For each namespace exists an image file in raw format and a config file
@@ -5738,6 +5738,23 @@ static NvmeNamespace *nvme_ns_mgmt_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMg
     return ns;
 }
 
+static void nvme_ns_mgmt_delete(NvmeCtrl *n, uint32_t nsid, Error **errp)
+{
+    Error *local_err = NULL;
+
+    if (!n->params.ns_directory) {
+        error_setg(&local_err, "delete-ns not supported if 'auto-ns-path' is not specified");
+    } else if (n->namespace.blkconf.blk) {
+        error_setg(&local_err, "delete-ns not supported if 'drive' is specified");
+    } else {
+        nvme_ns_delete(n, nsid, &local_err);
+    }
+
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
 static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
@@ -5750,6 +5767,7 @@ static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
     uint8_t sel = dw10 & 0xf;
     uint8_t csi = (dw11 >> 24) & 0xf;
     uint16_t i;
+    uint64_t image_size;
     uint16_t ret;
     Error *local_err = NULL;
 
@@ -5807,14 +5825,15 @@ static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_INVALID_FIELD | NVME_DNR;
             }
 
+            /* ns->size is the real image size after creation */
             if (nvme_cfg_update(n, ns->size, NVME_NS_ALLOC_CHK)) {
-                /* place for delete-ns */
+                nvme_ns_mgmt_delete(n, nsid, NULL);
                 return NVME_NS_INSUFFICIENT_CAPAC | NVME_DNR;
             }
             (void)nvme_cfg_update(n, ns->size, NVME_NS_ALLOC);
             if (nvme_cfg_save(n)) {
                 (void)nvme_cfg_update(n, ns->size, NVME_NS_DEALLOC);
-                /* place for delete-ns */
+                nvme_ns_mgmt_delete(n, nsid, NULL);
                 return NVME_INVALID_FIELD | NVME_DNR;
             }
             req->cqe.result = cpu_to_le32(nsid);
@@ -5825,6 +5844,65 @@ static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
 	    }
         break;
+    case NVME_NS_MANAGEMENT_DELETE:
+        switch (csi) {
+        case NVME_CSI_NVM:
+            if (!nsid) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            if (nsid != NVME_NSID_BROADCAST) {
+                ns = nvme_subsys_ns(n->subsys, nsid);
+                if (n->params.ns_directory && ns && ns_auto_check(n, ns, nsid)) {
+                    error_setg(&local_err, "ns[%"PRIu32"] cannot be deleted, configured via '-device nvme-ns...'", nsid);
+                } else if (ns) {
+                    image_size = ns->size;
+                    nvme_ns_mgmt_delete(n, nsid, &local_err);
+                    if (!local_err) {
+                        (void)nvme_cfg_update(n, image_size, NVME_NS_DEALLOC);
+                        if (nvme_cfg_save(n)) {
+                            error_setg(&local_err, "Could not save nvme-cfg");
+                        }
+                    }
+                } else {
+                    return NVME_INVALID_FIELD | NVME_DNR;
+                }
+            } else {
+                for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+                    ns = nvme_subsys_ns(n->subsys, (uint32_t)i);
+                    if (n->params.ns_directory && ns && ns_auto_check(n, ns, (uint32_t)i)) {
+                        error_setg(&local_err, "ns[%"PRIu32"] cannot be deleted, configured via '-device nvme-ns...'", i);
+                        error_report_err(local_err);
+                        local_err = NULL;       /* we are skipping */
+                    } else if (ns) {
+                        image_size = ns->size;
+                        nvme_ns_mgmt_delete(n, (uint16_t)i, &local_err);
+                        if (!local_err) {
+                            (void)nvme_cfg_update(n, image_size, NVME_NS_DEALLOC);
+                            if (nvme_cfg_save(n)) {
+                                error_setg(&local_err, "Could not save nvme-cfg");
+                            }
+                        }
+                    }
+                    if (local_err) {
+                        break;
+                    }
+                }
+            }
+
+            if (local_err) {
+                error_report_err(local_err);
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            nvme_update_dmrsl(n);
+            break;
+        case NVME_CSI_ZONED:
+            /* fall through for now */
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+	    }
+        break;
     default:
         return NVME_INVALID_FIELD | NVME_DNR;
     }
diff --git a/hw/nvme/ns-backend.c b/hw/nvme/ns-backend.c
index 82f9fcd5d9..8b9c1e5a3d 100644
--- a/hw/nvme/ns-backend.c
+++ b/hw/nvme/ns-backend.c
@@ -76,6 +76,11 @@ void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp)
                        errp);
 }
 
+void ns_blockdev_deactivate(BlockBackend *blk, Error **errp)
+{
+    ns_blockdev_activate(blk,  0, errp);
+}
+
 int ns_storage_path_check(NvmeCtrl *n, Error **errp)
 {
     return storage_path_check(n->params.ns_directory,  n->params.serial, errp);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 2aa7b01c3d..73630c27c3 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -592,6 +592,8 @@ NvmeNamespace * nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns,
                 blk = NULL;
             }
             object_unref(OBJECT(dev));
+        } else if (ns) {                /* in a very rare case when ns_cfg_save() failed */
+            nvme_ns_delete(n, nsid, NULL);
         }
         error_propagate(errp, local_err);
         ns = NULL;
@@ -600,6 +602,78 @@ NvmeNamespace * nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns,
     return ns;
 }
 
+static void nvme_ns_unrealize(DeviceState *dev);
+
+void nvme_ns_delete(NvmeCtrl *n, uint32_t nsid, Error **errp)
+{
+    NvmeNamespace *ns = NULL;
+    NvmeSubsystem *subsys = n->subsys;
+    int i;
+    int ret = 0;
+    Error *local_err = NULL;
+
+    trace_pci_nvme_ns_delete(nsid);
+
+    if (subsys) {
+        ns = nvme_subsys_ns(subsys, (uint32_t)nsid);
+        if (ns) {
+            if (ns->params.shared) {
+                for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+                    NvmeCtrl *ctrl = subsys->ctrls[i];
+
+                    if (ctrl && ctrl->namespaces[nsid]) {
+                        ctrl->namespaces[nsid] = NULL;
+                        ns->attached--;
+                    }
+                }
+            }
+            subsys->namespaces[nsid] = NULL;
+        }
+    }
+
+    if (!ns) {
+        ns = nvme_ns(n, (uint32_t)nsid);
+    }
+
+    if (!ns) {
+        error_setg(&local_err, "Namespace %d does not exist", nsid);
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    n->namespaces[nsid] = NULL;
+    if (ns->attached > 0) {
+        error_setg(&local_err, "Could not detach all ns references for ns[%d], still %d left", nsid, ns->attached);
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* here is actual deletion */
+    nvme_ns_unrealize(&ns->parent_obj);
+    qdev_unrealize(&ns->parent_obj);
+    ns_blockdev_deactivate(ns->blkconf.blk, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    ns->params.detached = true;
+    ns_cfg_clear(ns);
+    ret = ns_cfg_save(n, ns, nsid);
+    if (ret == -1) {
+        error_setg(&local_err, "Unable to save ns-cnf");
+        error_propagate(errp, local_err);
+        return;
+    } else if (ret == 1) {  /* should not occur here, check and error message prior to call to nvme_ns_delete() */
+        return;
+    }
+
+    /* disassociating refernces to the back-end and keeping it as preloaded */
+    n->preloaded_blk[nsid] = ns->blkconf.blk;
+    ns->blkconf.blk = NULL;
+
+}
+
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c6194773e6..56cfb99b39 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -280,6 +280,7 @@ void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
 void nvme_validate_flbas(uint8_t flbas,  Error **errp);
 NvmeNamespace * nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns, Error **errp);
+void nvme_ns_delete(NvmeCtrl *n, uint32_t nsid, Error **errp);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -582,6 +583,7 @@ static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
 
 BlockBackend *ns_blockdev_init(const char *file, Error **errp);
 void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp);
+void ns_blockdev_deactivate(BlockBackend *blk, Error **errp);
 int nvme_ns_backend_setup(NvmeCtrl *n, Error **errp);
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 28b025ac42..0dd0c23208 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -79,6 +79,7 @@ pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8"
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_ns_mgmt(uint16_t cid, uint32_t nsid, uint8_t sel, uint8_t csi, uint8_t psdt) "cid %"PRIu16", nsid=%"PRIu32", sel=0x%"PRIx8", csi=0x%"PRIx8", psdt=0x%"PRIx8""
 pci_nvme_ns_create(uint16_t nsid, uint64_t nsze, uint64_t ncap, uint8_t flbas) "nsid %"PRIu16", nsze=%"PRIu64", ncap=%"PRIu64", flbas=%"PRIu8""
+pci_nvme_ns_delete(uint16_t nsid) "nsid %"PRIu16""
 pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
 pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9d2e121f1a..0fe7fe9bb1 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1191,6 +1191,7 @@ enum NvmeIdCtrlCmic {
 
 enum NvmeNsManagementOperation {
     NVME_NS_MANAGEMENT_CREATE = 0x0,
+    NVME_NS_MANAGEMENT_DELETE = 0x1,
 };
 
 enum NvmeNsAttachmentOperation {
-- 
2.37.3


