Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B27566FC4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:49:05 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ivI-0002LG-EL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isP-00076Z-OR
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:46:05 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:6624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isJ-0005wz-Vy
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1657028759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yT6KNIJQJEoqKl4wrtQzwF8LV9QhT3QxrgguEPH6E7Y=;
 b=Ptm7+r0YdO102kBFyjLnvSWyzMbXScIokJAEAVJSijtzISTez80UII/y
 7+oSmsfH739Sq3VqQmutTRojJjerLRB+MZzxx5znN+uNm5TEstGUzMP1q
 Dww0hQezzbva+5nMXm2l1zhGdP9YiElZb/BnOp3N/wA612qPIxGnBCDFE 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74420399
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tMJl46y3mW+yCi3o0p96t+eNxyrEfRIJ4+MujC+fZmUNrF6WrkVRn
 2MYWjjQP/uNNDT1fNxzPIyw9BlXu8PdzoRgT1Fv/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY32YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplr7iZYjY2brz2ofkwbyRbTyJ1IZRo9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BO
 5ZDMWE+PXwsZTVJIFxIT4Ixgt6yi2vvdAMAhFGUgbU4tj27IAtZj+G2bYu9lsaxbc9PlUaFr
 WHU123+BlcRM9n34SOI92/piuLRkCfTXoUUG7ulsPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGt4wb3320HsjHZgCVnEOH4h0XR+N+HLhvgO2S8ZY48zp1F0BdEGMfNod35Z5vLdA5/
 gTXxo20XFSDpJXQECvArenM8FteLABPdQc/iTk4oRzpCjUJiKU6lVrxQ9lqC8ZZZfWlSGirk
 1hmQMXT7oj/bPLnNI3hpDgrexr2+vD0ovcdv207pF6N4AJjf5KCbIe181Xd5vsoBN/HEwfQ4
 SlUwpnCtLlm4XSxeMulGbxlIV1Uz6zdbG20baBHRfHNCAhBC1b8JNsNsVmS1W9iM9oeeC+BX
 XI/TTh5vccJVFPzNPcfS9voV6wCkPm7ffy4B6+8Uza7SsUoHONx1Ho2NRD4MqGEuBVErJzTz
 r/CLpnzVy5EVv43pNd0Ls9EuYIWKukF7Tu7bfjGI96PiNJyuFb9pW85DWaz
IronPort-HdrOrdr: A9a23:E0W2h6i9V1Dtztc4Wm8aBwvKiXBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.92,247,1650945600"; d="scan'208";a="74420399"
To: <qemu-devel@nongnu.org>
CC: Chuck Zmudzinski <brchuckz@aol.com>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 2/2] xen/pass-through: don't create needless register group
Date: Tue, 5 Jul 2022 14:45:36 +0100
Message-ID: <20220705134536.11109-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705134536.11109-1-anthony.perard@citrix.com>
References: <20220705134536.11109-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=1787b3430=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Chuck Zmudzinski <brchuckz@aol.com>

Currently we are creating a register group for the Intel IGD OpRegion
for every device we pass through, but the XEN_PCI_INTEL_OPREGION
register group is only valid for an Intel IGD. Add a check to make
sure the device is an Intel IGD and a check that the administrator has
enabled gfx_passthru in the xl domain configuration. Require both checks
to be true before creating the register group. Use the existing
is_igd_vga_passthrough() function to check for a graphics device from
any vendor and that the administrator enabled gfx_passthru in the xl
domain configuration, but further require that the vendor be Intel,
because only Intel IGD devices have an Intel OpRegion. These are the
same checks hvmloader and libxl do to determine if the Intel OpRegion
needs to be mapped into the guest's memory. Also, move the comment
about trapping 0xfc for the Intel OpRegion where it belongs after
applying this patch.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <c76dff6369ccf2256bd9eed5141da1db767293d2.1656480662.git.brchuckz@aol.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen_pt_config_init.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index bff0962795..4758514ddf 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2032,12 +2032,16 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
             }
         }
 
-        /*
-         * By default we will trap up to 0x40 in the cfg space.
-         * If an intel device is pass through we need to trap 0xfc,
-         * therefore the size should be 0xff.
-         */
         if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
+            if (!is_igd_vga_passthrough(&s->real_device) ||
+                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
+                continue;
+            }
+            /*
+             * By default we will trap up to 0x40 in the cfg space.
+             * If an intel device is pass through we need to trap 0xfc,
+             * therefore the size should be 0xff.
+             */
             reg_grp_offset = XEN_PCI_INTEL_OPREGION;
         }
 
-- 
Anthony PERARD


