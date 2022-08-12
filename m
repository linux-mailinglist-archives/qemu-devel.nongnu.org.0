Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02E590FE0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:11:23 +0200 (CEST)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMSZW-0006Nw-FX
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=216174f26=niklas.cassel@wdc.com>)
 id 1oMSQT-0008Ou-2G; Fri, 12 Aug 2022 07:02:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:45092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=216174f26=niklas.cassel@wdc.com>)
 id 1oMSQO-0003H3-PB; Fri, 12 Aug 2022 07:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660302115; x=1691838115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xLZpnKr6h0/cKLicI08oyMxSU61a1comCrhZaZi1070=;
 b=hpY+HmMsiCYkG4zpD72vO8wQBLHD2EtKhei4qTVZ5gkrcEM1ahH9pWPm
 GnFeJpFQlXAIrAkGbPakUDCWz+oylFNNikKNPv38ltpM7GshBiuWSu1xd
 e7/GlAIvZOY8vpfOtzQStgZ6ujNM/xidl3xqNm+VLcvgS2yrKvl7n8TBT
 g9vNGMm0AOfX9Jyt/djGTorESz5nLaOOYLTJ3shlekbjpF02UuGafLfmZ
 Q8EnVJBYxY99NCT3bnmubUwthy+/2WPlzeyjY2XMGa3RST90PUvWYOWU0
 NEnukJiW9RQA5FIUlsY3uQS49ntU5/tv62ub02xpPt73Mu0y0xu7VD4Ug Q==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654531200"; d="scan'208";a="213567982"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Aug 2022 19:01:45 +0800
IronPort-SDR: JkncinqVoT+4VJgYCdEF1E6F2rxec/z92mJZIUD6CAowhGpGGAucfS+6z0Zi0hcNlpsnNmrjto
 aTTYXYFy2+Zn1ZRJWVnDNpnNhbykxxznAkUcfTCS/qmQJazoly77cPo+gdrx2H0WJAEslvsbBV
 QQozHL0/MoCqeYC382hs80EpG8AzxQvUnhxRMg2KcE2gBs57WefYenWQPigRANs1qEvUQiOWod
 ykrLWLBN4LyWK6jPxTbxRa8PZp5oW/3eaeszpb9uuxT30BwzwXrI3caZbfdj8BdZyKDbmrHEhw
 XVIqYL/STg7SL/cvE2pUwLVO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Aug 2022 03:17:20 -0700
IronPort-SDR: K9tZAILyflEfmtDgvWwTr9ujXfgO/6VcZTRusRy6jCRXZrRI/6I6j3jH/o2VwYFRSKICUb8c95
 Z2GBPC0xqJdwOAm1JuEH6y7bhvOkohOto+zfGIZ+seHmKKwR76qay96FobUJfsdfPtx+82f2+B
 pvLdzB8j4+T8JNR48BA9TINFMKDJX97/qVjWo2CZ189hDae+RXuqWWb5M0GGHVIL0SMOv7m/UN
 Jg5Qd9raFl3lYtXiFrm/oWxYaxooX2/wH/mfiZQmB9sX5c0V7WO34e+94bWZW0zIpHbXgf/IL1
 jpc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.89])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Aug 2022 04:01:45 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH] hw/nvme: remove param zoned.auto_transition
Date: Fri, 12 Aug 2022 13:01:37 +0200
Message-Id: <20220812110137.1011659-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=216174f26=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

The intention of the Zoned Namespace Command Set Specification was
never to make an automatic zone transition optional.

Excerpt from the nvmexpress.org zns mailing list:
"""
A question came up internally on the differences between ZNS and ZAC/ZBC
that asked about when a controller should transitions a specific zone in
the Implicitly Opened state to Closed state.

For example, consider a ZNS SSD that supports a max of 20 active zones,
and a max of 10 open zones, which has the following actions occur:

First, the host writes to ten empty zones, thereby transitioning 10 zones
to the Implicitly Opened state.

Second, the host issues a write to an 11th empty zone.

Given that state, my understanding of the second part is that the ZNS SSD
chooses one of the previously 10 zones, and transition the chosen zone to
the Closed state, and then proceeds to write to the new zone which also
implicitly transition it from the Empty state to the Impl. Open state.
After this, there would be 11 active zones in total, 10 in impl. Open
state, and one in closed state.

The above assumes that a ZNS SSD will always transition an implicitly
opened zone to closed state when required to free up resources when
another zone is opened. However, it isn’t strictly said in the ZNS spec.

The paragraph that should cover it is defined in section
2.1.1.4.1 – Managing Resources:
The controller may transition zones in the ZSIO:Implicitly Opened state
to the ZSC:Closed state for resource management purposes.

However, it doesn’t say “when” it should occur. Thus, as the text stand,
it could be misinterpreted that the controller shouldn’t do close a zone
to make room for a new zone. The issue with this, is that it makes the
point of having implicitly managed zones moot.

The ZAC/ZBC specs is more specific and clarifies when a zone should be
closed. I think it would be natural to the same here.
"""

While the Zoned Namespace Command Set Specification hasn't received an
errata yet, it is quite clear that the intention was that an automatic
zone transition was never supposed to be optional, as then the whole
point of having implictly open zones would be pointless. Therefore,
remove the param zoned.auto_transition, as this was never supposed to
be controller implementation specific.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ctrl.c | 35 ++++++++++++-----------------------
 hw/nvme/nvme.h |  1 -
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..b8c8075301 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -34,7 +34,6 @@
  *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,vsl=<N[optional]>, \
  *              zoned.zasl=<N[optional]>, \
- *              zoned.auto_transition=<on|off[optional]>, \
  *              sriov_max_vfs=<N[optional]> \
  *              sriov_vq_flexible=<N[optional]> \
  *              sriov_vi_flexible=<N[optional]> \
@@ -106,11 +105,6 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
- * - `zoned.auto_transition`
- *   Indicates if zones in zone state implicitly opened can be automatically
- *   transitioned to zone state closed for resource management purposes.
- *   Defaults to 'on'.
- *
  * - `sriov_max_vfs`
  *   Indicates the maximum number of PCIe virtual functions supported
  *   by the controller. The default value is 0. Specifying a non-zero value
@@ -1867,8 +1861,8 @@ enum {
     NVME_ZRM_ZRWA = 1 << 1,
 };
 
-static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
-                                    NvmeZone *zone, int flags)
+static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
+                                    int flags)
 {
     int act = 0;
     uint16_t status;
@@ -1880,9 +1874,7 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
         /* fallthrough */
 
     case NVME_ZONE_STATE_CLOSED:
-        if (n->params.auto_transition_zones) {
-            nvme_zrm_auto_transition_zone(ns);
-        }
+        nvme_zrm_auto_transition_zone(ns);
         status = nvme_zns_check_resources(ns, act, 1,
                                           (flags & NVME_ZRM_ZRWA) ? 1 : 0);
         if (status) {
@@ -1925,10 +1917,9 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
     }
 }
 
-static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
-                                     NvmeZone *zone)
+static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
 {
-    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
+    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
 }
 
 static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
@@ -3065,7 +3056,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
             goto invalid;
         }
 
-        status = nvme_zrm_auto(n, ns, iocb->zone);
+        status = nvme_zrm_auto(ns, iocb->zone);
         if (status) {
             goto invalid;
         }
@@ -3471,7 +3462,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             goto invalid;
         }
 
-        status = nvme_zrm_auto(n, ns, zone);
+        status = nvme_zrm_auto(ns, zone);
         if (status) {
             goto invalid;
         }
@@ -3579,7 +3570,7 @@ static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
         flags = NVME_ZRM_ZRWA;
     }
 
-    return nvme_zrm_open_flags(nvme_ctrl(req), ns, zone, flags);
+    return nvme_zrm_open_flags(ns, zone, flags);
 }
 
 static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
@@ -3854,8 +3845,8 @@ done:
     }
 }
 
-static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
-                                               uint64_t elba, NvmeRequest *req)
+static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeZone *zone, uint64_t elba,
+                                               NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     uint16_t ozcs = le16_to_cpu(ns->id_ns_zoned->ozcs);
@@ -3880,7 +3871,7 @@ static uint16_t nvme_zone_mgmt_send_zrwa_flush(NvmeCtrl *n, NvmeZone *zone,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    status = nvme_zrm_auto(n, ns, zone);
+    status = nvme_zrm_auto(ns, zone);
     if (status) {
         return status;
     }
@@ -3999,7 +3990,7 @@ static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        return nvme_zone_mgmt_send_zrwa_flush(n, zone, slba, req);
+        return nvme_zone_mgmt_send_zrwa_flush(zone, slba, req);
 
     default:
         trace_pci_nvme_err_invalid_mgmt_action(action);
@@ -7672,8 +7663,6 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
-    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
-                     params.auto_transition_zones, true),
     DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
     DEFINE_PROP_UINT16("sriov_vq_flexible", NvmeCtrl,
                        params.sriov_vq_flexible, 0),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..93713817e1 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -419,7 +419,6 @@ typedef struct NvmeParams {
     uint8_t  vsl;
     bool     use_intel_id;
     uint8_t  zasl;
-    bool     auto_transition_zones;
     bool     legacy_cmb;
     bool     ioeventfd;
     uint8_t  sriov_max_vfs;
-- 
2.37.1


