Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5B566FC2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:47:48 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iu2-00008T-VB
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isO-00076f-Uk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:46:04 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:6591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isJ-0005vu-VZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1657028759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WAaH1Hoy9an/j21GpNiS97JhuDSNqD7IvsL6S23dqts=;
 b=TyVlaNcPk0htvBWgqGKgg85LovTF/UWHXQHlAmnWADb+uHaNHJfwInWb
 qScylOky8o4AJH5b+qQPP7VGqIZTVLWAapWJjYoJ2enT8yYyXqa5nU84G
 eLfv7rjvJn/znhtXTmxAm5SY9FgV965gDs/OR1eV0YUUKXYUYvwFzoPI7 A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74420398
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EGOe7qzNGJJIUVDYnzp6t+eNxyrEfRIJ4+MujC+fZmUNrF6WrkUCz
 GcYUGHVb/+KZzOhL9hxad+z/R9Q6pfSyIQxG1ds+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY32YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7b6BUFggBJTwiOUXQicHMgZwY6MFweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BO
 5ZDMWE+PHwsZTVXNA87MaMQrd34uVXkUBxzmHiRhekOtj27IAtZj+G2bYu9lsaxbc9PlUaFr
 WHU123+BlcRM9n34SOI92/piuLRkCfTXoUUG7ulsPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQG9YoD7ROidODBTxyysUDbnzkSBdQTKrhvgO2S8ZY48zp1F0BdEGMfNod35Z5vLdA5/
 gTXxo20XFSDpJXQECvArenM8FteLABPdQc/iTk4oRzpCjUJiKU6lVrxQ9lqC8ZZZfWlSGirk
 1hmQMXT7oj/bPLnNI3hpDgrexr2+vD0ovcdv207pF6N4AJjf5KCbIe181Xd5vsoBN/HEwfQ4
 SlUwpnCtLlm4XSxeMulGbxlIV1Uz6zdbG20baBHRfHNCAhBC1b8JNsNsVmS1W9iM9oeeC+BX
 XI/TTh5vccJVFPzNPcfS9voV6wCkPm7ffy4B6+8Uza7SsUoHONx1Ho2NRD4MqGEuBVErJzTz
 r/CLpnzVy5EVv43pNd0Ls9EuYIWKukF7Tu7bfjGI96Pi9JyuFb9pW85DWaz
IronPort-HdrOrdr: A9a23:rl3IzKsr9trKjuh4JVGEuPt+7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.92,247,1650945600"; d="scan'208";a="74420398"
To: <qemu-devel@nongnu.org>
CC: Chuck Zmudzinski <brchuckz@aol.com>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 1/2] xen/pass-through: merge emulated bits correctly
Date: Tue, 5 Jul 2022 14:45:35 +0100
Message-ID: <20220705134536.11109-2-anthony.perard@citrix.com>
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

In xen_pt_config_reg_init(), there is an error in the merging of the
emulated data with the host value. With the current Qemu, instead of
merging the emulated bits with the host bits as defined by emu_mask,
the emulated bits are merged with the host bits as defined by the
inverse of emu_mask. In some cases, depending on the data in the
registers on the host, the way the registers are setup, and the
initial values of the emulated bits, the end result will be that
the register is initialized with the wrong value.

To correct this error, use the XEN_PT_MERGE_VALUE macro to help ensure
the merge is done correctly.

This correction is needed to resolve Qemu project issue #1061, which
describes the failure of Xen HVM Linux guests to boot in certain
configurations with passed through PCI devices, that is, when this error
disables instead of enables the PCI_STATUS_CAP_LIST bit of the
PCI_STATUS register of a passed through PCI device, which in turn
disables the MSI-X capability of the device in Linux guests with the end
result being that the Linux guest never completes the boot process.

Fixes: 2e87512eccf3 ("xen/pt: Sync up the dev.config and data values")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1061
Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988333

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <e4392535d8e5266063dc5461d0f1d301e3dd5951.1656522217.git.brchuckz@aol.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen_pt_config_init.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..bff0962795 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1965,11 +1965,12 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
 
         if ((data & host_mask) != (val & host_mask)) {
             uint32_t new_val;
-
-            /* Mask out host (including past size). */
-            new_val = val & host_mask;
-            /* Merge emulated ones (excluding the non-emulated ones). */
-            new_val |= data & host_mask;
+            /*
+             * Merge the emulated bits (data) with the host bits (val)
+             * and mask out the bits past size to enable restoration
+             * of the proper value for logging below.
+             */
+            new_val = XEN_PT_MERGE_VALUE(val, data, host_mask) & size_mask;
             /* Leave intact host and emulated values past the size - even though
              * we do not care as we write per reg->size granularity, but for the
              * logging below lets have the proper value. */
-- 
Anthony PERARD


