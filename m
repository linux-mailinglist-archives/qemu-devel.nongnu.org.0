Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55909663A08
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:33:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF97c-0007VN-Gs; Tue, 10 Jan 2023 02:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF97a-0007UP-V9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:32:34 -0500
Received: from sonic307-54.consmr.mail.gq1.yahoo.com ([98.137.64.30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF97Z-0007EY-6m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:32:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673335949; bh=IXWL0zBe+TGnnQx6f+FhHQ+rLQndNCxwY9B4xdroKxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=PNwFrlYzMqzEwT/E+oGS8Q3uNQiE/OwLQvqWhehSCNsxbDjavxCS2Sx8ioWWaFwUYqodd3doNUaSKpxANvRfBKu8kh5Zbfgr4KVEACUx2bt97TACZILrnvWl+ERevY7hkGQtPlr6wRnpAxmXcVqkSHDwUZNcv548y4ZowDS9k4bV0knixD185V9gY89QyzzvaGA2hwU9sf0fiGgpdUb18kkIw3C2tSD2Y98q3/PHf40hCTOoePRgx7yzME6wE8pDJ/0HnuKh6CntYEpgCOVJQRMVec2VDvXVRFOyM7r0P982BJI6wbXPu2tJ22h0N8ryoSZSqYA+QJ6z8ggtESDi+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673335949; bh=AcbauxwS4/wmmJiS90weiJNhYtz0Z33GTuCvWkIVR9N=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=R+0zo2IvCY4Wdqy39uABgWGBzxRkNsP/6w02TVt8zAAEAJ7qaxYix6aANJFwgSo9bs/3YvGyROciezOFt9kh4hauvB0kd/dcihnAmt+9uPQFfA3otKnUArLgypXRE9CCW9XiR51i56IS8MSOUjDlPClbnleiURDdHDUtVnPm2hZwpUY1dU8+1JnTJXESdxmE4hwqOSQjxXOVKKom+Q/fmWAY6oPM8famKfl7kmZQ12UluEuw1agvKsOylMxAlDaWWYeDkRESZIxOtLAC/uXrJikGcB+MXwAE+ijoi6iQghdV+ZCHLuOCBqgEL3Nhlfwc35XVXxb70P93FbhtsLa4JA==
X-YMail-OSG: RPsCyUQVM1k.LODvx.GNliRJADa_2tXrnOIqgPgucpoj5u6.CpSyWjRtcPImtju
 339tm95k_C7yv8umF6C71xfAWUd84RoLbc6nKjHQm7oHCkh_6njsVKVs_qSt2wwA1aPzbx8CFgG2
 zJ.agJbugSWvNtkov7LFHNe86z8fXnWdEAllAD3OwKDFVLq9lQ296y5G8B61ZeLMmrJ_v36XcGRR
 OWbxebwCkNmUUZ.RA09YkBG97TQ1nXfDGt7QQCU543EQuGe4cJMP2sZ.7eB1a2FHvdp3AWGR9JAc
 4.sGgwA22xa1rBuAPJ7TUK38k64iWJ8K1hGy5uVr9o4yQcBpw_E7plLwUY38fdX6CrT5QDC_Pt3U
 ahEljvRm34WeTm_vmH9cTF9l8ZV.oNXtBUtiGPt1lURtvx41uh35KYkW_9bEumxZfM7fEN3UaOtl
 phHDSNJREvg17vG851M9ZL_WkFslVK.RhZeNG0e85Fm9A3pHr0IwevJPd3GMG5C06Kegz_D8_XKm
 Xut4nGyC5I.Lmq8mrtfdHHeUDXIEO4izHBCFLDX5EImJoTsR70Jct8zUqe882WUlg.5FjtiU2Rk3
 gf7Wmr7DperFZ0DJHiF8vOPshIND3UeGxiGmdq0C7BVF7Z4N10IujB.QMKPC19X4omLZEvVtQl0V
 4LAV8l_88rrbE8elgun25dKvNzV3J5T1mVwxBInc._djySsUDklDq28dDTf8TOc4PT9liwaxmeWZ
 gCflHuVx6CgDhM6YQfBJQXBpDfdqJrlZYww902ziQykuqJ5ZyHQGBuxUJq6MuwyPTvd69G14vpk9
 1qxeb94lNfReWZjAzTeB0lz6wGFOfqgDDrnbeQ9rsMvd9mqhB7ZS_m6dN.5r1uoKqFoMZvkMHCrC
 tC2KYlaPwxLpSZjjbApkXiAdb5C2tYddx8jO8MMPdjgPOMR0vox14Qqsxi9oTWdYobYd6T2e.f85
 srZBVJPzHCbsaJyP655r7jmnvBSVmH1FwTnDrOKl51fXWS_3v1w1Ax_2fktc4uAKpayeztPgZsYl
 y8c8cwopkSEz23LS.NVlJBYlbdY0paxHJDUhCnQZWGlqjxgmlqJDpwaFHjYXosY2QBZc3gW4_Q05
 J9hezO0y82shqUdUxC2bFtq2thdd65Y73aWNFIo5LbPN0ltqdAgXSWuDK8OygZi2gEmLp2cAE4EW
 HL2gUYnie_iiLC94uA0O_BF37MjpBh_AtNaTc7eYUXZkdPyJ3T6QY1K14OUhKsIFqPbtJ08tlE2x
 C8g.aMBsaFJK3_khjKclTj7V4T_2S5hChdXUWnIHW62dmF_KBjfnJBSPor9U.9XiXuOT7I9n4poA
 I.aOXMaQuecUE96diL01U2Cfx70M5buWt2RfwVno5H.GBD3_JmCuOhjJMPPdEFGAn7jEc0MPbNoH
 .cds9poGCLn6wJ_..nGMl_axjUiX4AJqovtaVNczhiw4zU6Wru01tAtxDRX3BoNPMCkLn9BvcP8x
 YZnaxjCclwuDtrt13TrAIFHwQwGPERQyNfZsRVgXNepSmpWTNKTnskrB542Vyu61XuQAOPldhJFQ
 nmyGACKPtvnIob2kUw8PRz8IK2Q_eAPqq2q_5Q8T8oMK21TbZn5DT_GnXHkQh5CtRHBFSC01aTcX
 na7ok0e96Ocm39RqobRCeRXrbPaHOb4vTPds88eEN1FYYvWJBdmagzeO53SVpd4yPAj9q0_zxTa.
 9GrKIu.Hw.9SjsW_KVZqxNva9lQScce13CdQpWw8seKlvUHLlQZYUOJwBEJLgsovBbwwfz5Evk23
 eCdyO9xo1stpB952fx.Y57qR3hLRbi0HqMSk2LWfA9FF9mk.UepVv7i1cyKQ62RYT8L0817RKpJ4
 rxp.XDq9G3kkqHxoZ6DytIMoxi_e7Z3fYVhyXIqb7ms3HZIo5iCaLtGmB.6Xze.pPB6cBmYdgVuU
 OeypV.6piH64Onmwy7tN_N28ldOdHsvQ_kuON2I9s.oMprO4Ryw2oBgILQ1_tNfxVJjKJdQtxd_2
 vx3Vl3MI.XRnJfz2kii6_CirNVs1qPRZL5K7s4Y_SryUouAwLV77xuU9fW5hdVMn6YbbrpACscUV
 QJxcZ5JjX58rSZsS1dRi36MVCpmYKZm9s5jAWegD.V8l.VYVSAIK.avN_LtLfexcX3hZYnauiAMn
 qoDCQ08ni_riiw5jhegOlF41Q.mQJKPebCYe.hEzPnHhN7LxLJDDOyDbGpUQ3QftcAci4SKCErh8
 -
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 07:32:29 +0000
Received: by hermes--production-ne1-7b69748c4d-bxfkx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00995f78f0d4fd001b9b8f1699ee7ed7; 
 Tue, 10 Jan 2023 07:32:25 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, qemu-devel@nongnu.org
Subject: [XEN PATCH v2 3/3] libxl/dm: Assign slot 2 by default for Intel IGD
 passthrough
Date: Tue, 10 Jan 2023 02:32:04 -0500
Message-Id: <27bb3979f234c8de6b51be7bb8195e3cacb5181c.1673300848.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673300848.git.brchuckz@aol.com>
References: <cover.1673300848.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.64.30; envelope-from=brchuckz@aim.com;
 helo=sonic307-54.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.096,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It is possible for the administrator to manually specify the virtual
slot addresses of passed through pci devices on the guest's pci bus
using the @VSLOT parameter in xl.cfg. With this patch, libxl will by
default assign the Intel IGD to slot 2 when gfx_passthru is configured
for the Intel IGD so it will no longer be necessary to use the @VSLOT
setting to configure the IGD correctly. Also, with this patch, libxl
will not override explicit @VSLOT settings by the administrator so
in that case the patch will have no effect on guest behavior.

The default behavior of letting qemu manage the slot addresses of passed
through pci devices when gfx_passthru is disabled and the administrator
does not set @VSLOT for passed through pci devices is also preserved.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
v2: No changes to this patch since v1

 tools/libs/light/libxl_dm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 2720b5d4d0..b51ebae643 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1207,6 +1207,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     int rc;
     int next_slot;
     bool configure_pci_for_igd = false;
+    const int igd_slot = 2;
     /*
      * next_slot is only used when we need to configure the pci
      * slots for the Intel IGD. Slot 2 will be for the Intel IGD.
@@ -2173,6 +2174,27 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_append(dm_envs, NULL);
     if (envs)
         *envs = (char **) flexarray_contents(dm_envs);
+    if (configure_pci_for_igd) {
+        libxl_device_pci *pci = NULL;
+        for (i = 0; i < guest_config->num_pcidevs; i++) {
+            pci = &guest_config->pcidevs[i];
+            if (!pci->vdevfn) {
+                /*
+                 * Find the Intel IGD and configure it for slot 2.
+                 * Configure any other devices for slot next_slot.
+                 * Since the guest is configured for IGD passthrough,
+                 * assume the device on the host at slot 2 is the IGD.
+                 */
+                if (pci->domain == 0 && pci->bus == 0 &&
+                    pci->dev == igd_slot && pci->func == 0) {
+                    pci->vdevfn = PCI_DEVFN(igd_slot, 0);
+                } else {
+                    pci->vdevfn = PCI_DEVFN(next_slot, 0);
+                    next_slot++;
+                }
+            }
+        }
+    }
     return 0;
 }
 
-- 
2.39.0


