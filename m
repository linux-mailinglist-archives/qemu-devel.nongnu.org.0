Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A097546F00
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 23:09:57 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzltD-0002x3-VD
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 17:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1nzhQM-0003RT-OM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:23:50 -0400
Received: from sonic313-19.consmr.mail.gq1.yahoo.com ([98.137.65.82]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1nzhQK-0001Ar-JH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1654878224; bh=wS7MFNjt6E7X8hDRkOvXUxjKzW3TZyG13P25/uoa8VE=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=iJyYVdX8pEq2c4Rho6ObrkSfOoL3zgjWe35ZSA+4U/mAMXUd7ZKihTJdwfsqZkLtBQcljlGCA79zWb5Zzr0I8JXIZN9g+v5UzWKzqbig+9kqOeYUpLDx0akoPR2G1A++X20zWc2g6g0mNIiOI3Y4iGPDDqwP7utDemsRmFetNQx1EONkOrMM7bvRi6JfjoXRp9CheQVoAoEJgBXI+DzZ4y7K1RYVcc6SdsfoVokFlo0K42+2+ed5dOro7giV2uKlCKLem3PBh7DoJrdtDNHIDEfNwrWbA0CBjwCK6fkAIrjFXJ3Jvi/AIXypnBH67B8ICdvalPtjer8LIB3ugX17Gw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1654878224; bh=5KetwCUyhbFVbPpH/7B8lhexTvQy/KMyhUEW5YXG8Sb=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=VoTHlo3lPvyiI8z6OpCwQGhGJ8FONqMumR7NsMWP4fEnjB8q6Tq7yJzQH33XLg3fP7hK7bNWo8fdWYL3YwwHaifmn4T4LtU19vpdchsr8YUJDaS1zj3XQeA4pnrM1HSuyMN5+bbpPfjmsDFkrEnrGWye7Ws0eV2Ifb2mT8VbNKsR32QzjQkgTL1T/2p+oaPs+7xPRGWl38NnKUBrwnOJ5a+mC13gYD9yf6v0QbsFz7mcKhsHW2oNAWiFPWRm5W4x4CQXby6C+XsPI5M2ww76Krcw5+EOMuFiGA9d6H6WK1+fL9sqWXgNT6I2SqLt22izTw48II2v8bU1kMDuoUVZYg==
X-YMail-OSG: SF7Gx.IVM1nzIDj9FsvDkDhBuMJq7cxJJ.v3Ht.10RQO2mQD2R0qMVIU51j6ckx
 uYdm9wJdx6ff1jsOcqSaqaUsW1PVsSeE5j_nJ3vX6P4Ahbq88EqlquPqNU_akIaP.6XUAXNdBj6b
 8ys123AmQ5Ulrbn.U3hzPQc4xgbhzPmzL_QMfn.BwUTbEWTycIV8VKnK0RTb.WSAQ2im1sqiSWV.
 w9Dbmo8d53OC5mG76gmp2N6L92eyV2QDnkaxqZB6KwOK8LzLJPogFSwS9yaAHxYbbrt6W8E0Y98.
 ipAEFcmuzPnq9wjcgMuq2cEr_EF0ehob.27cQzlTaSDxAeqBy.FYwD0WZCTrm.2omBO1gAhuQIKE
 rvebIHvleV1hnc.kGki9Ed8a.M12E1zn.KIICdCe82EqmAA.lmHgEIOlyqHPemNpyd99VjRmerF2
 spc5Zzw2GJqrp_.N00yfdaEvWq_xgBlhOucKvs7iQoniZ.SGhOUnGCRldO3LI1mzxiQS8paASg5p
 2fnaFF_Q1OROuvUiSvVnMgmLEo5nXucRw7tsFihlyGk0Dzo4RVytPEvJHQmhqFQ8q_YDKaNXpwHd
 XN817oETXOSOKnyn7MHX2JYZA8C1xL6mXgYDvDC2VgLgd48tU5.kC8umi46653DcO7j9BMWT4Vaw
 mfWrCSFyj0fSKokrCof6ioqmDtu0LMh19iFgxUsyBR.nrVZNF6PnRBeHxIuNWJjv5bmwqDDfW3w.
 lPsqH2dl8EYsVw3DOwNeBlW58gpxpoTsovGWMC0WDyOQ2WZctfbA3K.d32bfvDn6gkNo187.mKIi
 gLvvnjF2hTrMjMLZDpl5jUDuL6yb16y6e.PfiJosdaPAbLmaS5MasRVeNTrA3MkG9ReDe2_p3jiN
 .oOyq5t4PdB15uX6o2fuOyoZ1vMz7kXyyR2.IXy0oa6eSignGnwtrSQUwC8RaOfbukS4KeO4cnRz
 xlxf7yUXEjXSGlbFkjJPevXKize8SUVPM81rS6flsOwxi.BvsdMPWq.x3f.Yq6NOwbo7KwRpjPLR
 X9TMLbHTxvFoVWpgHJ74d6Rn8SVgidvkr7c7q_9NsoETl2119_AITZSNRPg7rTnDTRCS5JkNoq1o
 nn9ozPwMp_1zh4UpnKmvnxPNfDpv_naVMt4VWuVkjk4EnM80DklkgBi1V4_Mgrx3BwGkYs7vBsTf
 VmVbJSlmnsTJc5r2LsL57dpOz0odKv0Ipap_EyUXiVO_TWuUl94.NuZWreYAfF.w9ILpSNvJ27ue
 RKKoAlyO9zlZy2.zuX_N9.Tg2XBUqEBnLdGzukneH.3tJH_E0kz6k2ESgjHXJqe_1QG6NkcLbs2y
 HS6A0fOzQ76kfGGLfYjGZUUC1OxrNIOQ2Pl9wcRxBNcFaoQX2ZY2hcZPdna4Di3Kz2PetFHJ8xER
 CF8ha0YI1E1GtVhIRC9I8jOCEwVLvepyICww8blZ7T6HLzCC.eJlC_yEgGjK0llaickfL5W4KSnQ
 XR0bfg47LAoTtZnlnR9V26_qMGLwOqsIyXvAeN93KC4M7CI7ckq8NAcyQUuZ2zWLE8SZEM_I7rPr
 P8uv32qrblqN9hpdoRwr_QGyUqWBfZe.Wuf1dqaalIQ4TtSdp6O4VdZauMrOsdgbxmtcAXnDcG4Q
 MpMqNkJTj7oAFpC7zfhlaYWf0QB7Li72yjMhv2QWPu82QW07anHMwYUqCCxJZk2gFpcNs9PoxR1h
 zHi11YEFzuL2ANLOQBbELnw1K7YggRUlcpnzdqR3SLScUghOFTDKJ3YE3w6YxfQJcveXVPPSG.eY
 QHaT_rrpzYSya6ALvPaQjdUUKWiIbviWViWqxpzf6zOyr.FlzPAkWi8TpMgJkZ8y8znhHMGddpVR
 5.NJlqR1lvldx2MnHKMIMHPitmgVDvEbtogIBNYbEGZsx8vz8IfooRsl.dPZ9BYROLnyOmsqJhKR
 Axp71u8j.Z4qltk65k0OXNBC6qEQKKelErUhFhmPrjVqa1SNFqJ07ORbCiek7X.5sKTcS9SdYgV6
 6z63szCvqZj1JiyvmNO3nw88.gO1iMr0WdUUgHrvuuMkavILzaY.hAQVhfTfy9PLJkW_tNSz0FJt
 aNOdBmeV_SM0Jh2g8f4Qr5387iLEErQE5O_wXdmt.0.gLQPcefwHVbiVlE5HC9lpc2vcHPIBn4wf
 YOjQtED4HrzhCEi16aq6pyjASAx7ee2IhY89ho7zbqa.c6jLDlkx3_SHnploST0zsh33yvADPr6M
 M0wS_
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 10 Jun 2022 16:23:44 +0000
Received: by hermes--canary-production-ne1-799d7bd497-8kdwl (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID aae43f62744bd19876dbcf4383062a9e; 
 Fri, 10 Jun 2022 16:23:43 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH] xen/pass-through: don't create needless register group
Date: Fri, 10 Jun 2022 12:23:35 -0400
Message-Id: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.65.82; envelope-from=brchuckz@aim.com;
 helo=sonic313-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jun 2022 17:07:31 -0400
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
needs to be mapped into the guest's memory.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
 hw/xen/xen_pt_config_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..ffd915654c 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2037,6 +2037,10 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
          * therefore the size should be 0xff.
          */
         if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
+            if (!is_igd_vga_passthrough(&s->real_device) ||
+                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
+                continue;
+            }
             reg_grp_offset = XEN_PCI_INTEL_OPREGION;
         }
 
-- 
2.36.1


