Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3354FD7B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 21:26:17 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Hbk-0004qL-Cc
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 15:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o2Ha2-0003xq-7W
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:24:30 -0400
Received: from sonic306-20.consmr.mail.gq1.yahoo.com ([98.137.68.83]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o2HZw-0004Bz-4s
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1655493861; bh=WF5uiJ+8knZteM5nBC4zDmv2r5H6wr0fs8exKYDIyxI=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=hGLJokU0T4UMtNAL8yTbxZ+Gtqhd4DLUayxlF5Ac9aSh+yznPjVHeqLq9ozlpvGsqDB77+S+B+KltWQTifqQCpm0SRh+n0p9aHbfznfdR3vtujUIo6h2grbeGGk6AgxyeANxUF7KuVWcv25SDdaoTc69ZBT3ASL3Ws8MYfJL7Nb4VOxNref4Y4W9tUURtY42bAdhljbond5Wz9NC/MPK3vN/Qof4b744H+z2lwdNWi54pJqRzTzzfsn3YUAo5vLZz1oX/wgB3EXlB38bRc4HElfMSif3WN/nlqLXyYLPQO1oQ7xW9uu0VBxEzFarKsDSRbxUQXtdp+Pqwz857jcjxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1655493861; bh=LVJ27a+CLeDeENnqo6/aIFlDy3160hD400cv3pewsxB=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=NQ5aKkDyHGOxS9pjmACKBUxnRmaewWrSFZrWJGsRGjlJV+eueUQoaS68D0Hw14yX+JzOiguLmEv5fm58jIN4F3Z8YngSSiyLU4g2MrN8aRHRvFWsuL/P691Poz4GGqm2eODgzYdaw79dwgkab89PvSSblDi24QgPdOhUsiz5XJG8Zie4ywKHtNrpbWcKCdR5nd3jpOtRbiplmBANgxikkGY0Y8+cYpXj9vw3gKxNnv7U27UrjVjXETX6t4Q2p5KyDg9GlHgGMrl3a5iEqQi0SUnEj6eESx/CLOPO6WLkJ/GmVk7Z+InKYX/R7uxaohOynZVQkJy+9SIZA/FKNEaNCw==
X-YMail-OSG: wJz8EwAVM1k8OI7xhtX412g2HhPpI0kvnrWcFBT1CB1qD9oFuIl8uJOqoO1wvyx
 x.zCOpQhPIzD7i9cC23uf8F8omrVAO7WITc..PR6VvsWML_QL07ss1ENqn5OsQIp2zCXGCiMS8UM
 gCCv4_TWmrNR.CHirrNtj5hwNrbyYAAvksTLU8OFfwn.agJPg5ZDMiH3Y7LzTUCCmBw.s0YMH09G
 99FoQQwei9KdZ738OxdI.dnpBnwd4saDmJIFLH.L7zNDfsxp2tfVEYisyMjA3RScbDEPPJ4eo_pI
 oMf.Ijw7qFKUphSSgXpBepz8FdG8.SSmiFxhbL.d0ZEgkew9CYj9NogGDrl.rk0Wlu3C6UOpkEiy
 SeKSy.SR3usKGWungf0C96oUrGSKlVSkZsm02666EOmd9s1kcJXtZcDBHwR1xlR8WMZaixYMjWzD
 qlYjPLXDSTP7EK7EpUkFTNvO8qCpPRQ05Ic40gHw9kU17BPjz.EwjIE9Bf4ZmKuyTtpvfDUau5fL
 laTsDZJ7jSEvTmCw9Pe3MTKxKJoGadOAL7fhaKoNjxaRNB_GEow3tbvNWM0vz1sz2peHAAALebCp
 OnOfKZ0.4OoNoNu_Z3DzSlAl1FCWgZLlyknnbdQCFHWRQJBOymLKIbYirj.hJLgRQFnq.ziA9uJb
 p4kXcuun4VdY1qtuIR5cb6bYBujqdbgQACCLPC2_3Ii51sknS.B7GHwbuY735fe24eB6MtrCnp81
 2aA7J2Sq4OpHsndcXNAU7GMo2.0iaGrP6r.2EOYpqx2FhcP8sY.ikzbbBjnHfvNHDyNSh_fG5Cdm
 lNsaUyoNzPS2ObnAEqVgCSCV1CWPUUpURkkLJHjEufNTrhYqtMBG.GAjJFHCAR4z_FdVbEOS0uh_
 tNqaSJrfGPGTtY3T3.AlhLXrmjjNjzJ7mb_VvoDPce3naepL5FrsHdauBXt7kZ.cI1qaEvlVUGcu
 f99.Q.th80copPTMPCw7tpc7av5QtlZ01XKpoqsHEDP.E7M5SsDQcUbV0gsKJvmL6PnMyI73c1IE
 yj7Mc0AJpArdaFjJK3VLf19_XZLHFUAn88SEZGHp_IGGLJPu46eC6SDgDTGVrhfhHGmp6MDSAvwX
 A8l0knThJLvjyJG2VwzslvyPgTbGFdgN7AJvlmPsxFTNqRlgII0oxg3sHKHg31DUvPmO7lpTbyY0
 a2sc51ggCAFlbvUz1RRWEyEToZxcz_9YIlH20mdwQ5__bzewX0kcfGw9Uc6_jUIPzXq3S.DkAgKF
 rPoNbjMrzvTyPK642b2xjoGSe4rYQvargC0.oJSuTXakEAyWagX9qGQynx5IytiNP3AfbMwKgVdS
 BxAi8OS0XdjqBe6RfBXu2X13sgfWcl92H.q6qL7v7YICXEGkoaB1qbNWpberzLumTWnqqj45Ld2A
 K9_Qgpa2XGFL6VQB7UJcwfJeLGN3bDpXUEph4OQ06SG6J13T2CPSGKu08rPWzE0KJfolcVHLtfaN
 rTGUXDf..ka2.DCXF2ay7kdulGJaQaCDfiSdVVtXyFfL0Uy8064guVqy7lSV8vxZpt0M2KYJoW8I
 ZI8RntE9rhmiHHBm6xu5._DIUqV5xpXB83C0SjKuBKyEhWeojEujdcdRFipht1823GgcAF86Aar5
 bCZUR6UhqqJdaR0a6RXmvuTKTLH3OWPQKONjrg1urg..FzEFppC9DEoVD4QHkh8jIw8YwqsrujGD
 FbPc4Mm1wNBwTSKJDcfpZ1PTTMI8H.BV5Sce04DCtDawc4y3pUpzKpZLrzQIK5zBaJaniT.hMzdg
 5JEkRvE3aQ3WdLpv1z_CSUo0bAK4Z77ps5bfC1Zx4lV0fIk8FaDdniIOjzZd2u6G8o7zvsnaU.Nu
 S2gr1llaEBKTLMvtAcTZhwouvEZwM_YRwGAJdvFqB03pDDgTMvvwLUMQSHwQ3UkwAQCmL2OprHFv
 c65F_ahYyskMN5NbukbHFbYMYFIdBIKCO6oaJPPZCiWv7wILcv9VuhAaD3w7952.VRYBP4IcQ.0K
 71f3aNWpYQa18W1EFsrUUl06F5Y2hpmw0k0upuiDMgWOc1y32SdoljwmWcms4JoZw9XYct7XIBbF
 MCXsnvOtaGjTwRRhlBBmYJfiy.okodcQieDQT3aPwApCpivvNbQNZube1wXRyyLrxLJfOKgqS_O5
 hhyhmcFcEGl0dJC7YzjLlgga_9wgCyfuZLLIiQsAEx64wBRDFuXhggOowWLwisIh0Nmfwieej.fX
 Bfrwi
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Fri, 17 Jun 2022 19:24:21 +0000
Received: by hermes--canary-production-ne1-6b56569f5b-5gxzn (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID ea48c22c787e8e2f80b2bf48244f4fa4; 
 Fri, 17 Jun 2022 19:13:45 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2] xen/pass-through: don't create needless register group
Date: Fri, 17 Jun 2022 15:13:33 -0400
Message-Id: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <4d4b58473beb0565876687e9d8a53b76a7cf3fbb.1655490576.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.68.83; envelope-from=brchuckz@aim.com;
 helo=sonic306-20.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
---
v2: * Move the comment to an appropriate place after applying this patch
    * Mention that the comment is moved in the commit message

v2 addresses the comment by Anthony Perard on the original
version of this patch.

 hw/xen/xen_pt_config_init.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..cad4aeba84 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2031,12 +2031,16 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
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
2.36.1


