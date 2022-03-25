Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0254E757F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:56:51 +0100 (CET)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlMw-0002Yq-QJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:56:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGo-0005ql-Uy
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:32 -0400
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205]:37344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGk-0003ED-Tv
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219818; bh=1ylJPZ+GOVnhJabmDjoLu2f3XSqU9cA4kEKGlxeL3Bs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=tltWaP3s9a0l/b+2EFBnhhHH4xU0/h+nVvHVsidzA0lQWV9viVWEU0dHeTg+VdMzg/ZVu3sxtTGUdN2C9V6lg4pTKdRsK0BEhZ/0COsWMXTFzNXT/9IkntFISeTRaCficOE1cz+PTmz9pGXaSP1/9MPGhgiTWTljMUNOTNlzTfWE8rHTxgtozSkq2vC9wuGTqX/TbsO+5T0u0q5Jh+/WAYSLzqp3UxlxHrsPMyrHVzs5Y/mIARDMsBCK3a694OuhhqrozxRHb9bAcMa9hxvnDxJdG6P+Dpb7J3UDaG+juM/UQAGC7YtdmHiq8GCEiF9M2q45eR5rAO4VFTZww03A+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219818; bh=dy9dfoj0H5femrC84BvHTmOPyTFN9Rptezjhg+jaX/A=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ahYw5L74+wyQTcnXn1mdu07SvyJMEGnNBUhERek4ecUt89SMvC/uZZG0maeR2xvhwcKbD5pK+4lanSyH2OF2v2K7e9Y/nixmRnMxhBBsR9tQUV8VoqLZqy0NCdGax6DjnsecwMGJVvg5Neoz/55pkWFrAg1lL4hof0HB6hDAy0g/elHM+N210icwk/ox8cQ9wlfUUVMu3NqYaWZZE+XgbnvoHlIxhAbssCh42VW/64lcQ7hvY6w3z6NF3OW45AUB/NfuKDAQKlLDKUBoEI8trGxOEn8JyJqb0zwdVo30HFeTXmpisI3nWInpKxMCcwM/6saO/Z2Nl4BtRLSi7vCokQ==
X-YMail-OSG: Njt22Y0VM1kFM0WdkIgfcW3pGR2bLQt8dAQ7BUE9ckxVB3W84iwhVJlT8qxaB5z
 11OXIQzbslYLE5n9JqzxgZ4mf9EUlZem17lmnVPSwoqfi_0ysYCDwPCvuYYDJAEiSYhn1sySAGgW
 YB4sG9qElSSXaCFZEsXp9LQDKcbbcM5sqULMhN9idvUZaYILp0aNMVMGbAtMQE3aGOjue864YGxw
 _begfkyrHTA__M2BVjU.tCVT4DADlj9eVvv37LgUpJ9OkuZ49AUrxjx1Qm322QRgWuvi7DbHmjpc
 Qxyipw30cP1cU4FIY9kU8Wq9PXkbcFpKaqaF9pNjTLaKLJ_GxPB9SA_6Y3grGa4zVX76YC5iLUpH
 .IKTeXA6AB4tkCGSeACdLpRc4Th7Frz96nzeeSq22PjrvABMD4TdTBkyonWHDfugZR9qzuom6F4r
 5lT.CeU_8LxvLXyOKiy7lgWfNsq0h79W0jP.lKDVenBy.5U2GVdyqEDg2y5bUG.Srf4W5bVGwY_Y
 cceXQWW8nzC0L_s2NGNgqe9YxbJMykPyb1WxjK.APABHFvT.8SzyhG0P5zP0xe0bOZOWqK8CNnI2
 RH8ueqcVjxj_Cwig072OyglIhkJbY08acDs_qIlqpuVn5ofETu5kRukO9vaGmXVLgIXWnwZQIRQG
 sARfQHj8as_yyiPnd_rhlMRiLxRVbBlws6HbeVDyC2sId26XdxL.ePbj4Sd3T0.qKN8wx3dnhhLH
 tn2kE4Qx_340Jz.Hb9lWOFUzeRj6CHOgYg.0Eb6OSP1GfzSWO0F35XVPN9j6QpjqwIhV8RFNQFwr
 w7.Eyou87gXliHnDc2r8R6WrYgmxChBNQ.f2SZ9hT7XPfUKbeFYOHG0lpqcr.6sl0cRUn4IqRrKM
 lvF4iY7Hv3mYyUg1s.3Taql4tN0xVho35lzLTTdEPqya9Wa9jVxKtbX2VXoPaMth9hHASjqGKPfh
 voQ2sCDsQzp_hNdTWuxVMFx1tENQOICTu_sTJeyKtGo0iVgmMXdPvk1zwAJcCwmEjROOv4QBTXH1
 1nvpqmk6oZYhLFOH2Aex9lWe9rLUcU2uRK5G2hFWjRSJ29c.foBGgSZg6UgSGrvFvkkE5tikiw9u
 kUD9EZxIEX3NurkNqVQEXNApJ_YrESW96Mtp5sNP8RvXc3W4f7Dkt_JJ3oB1.uSAnpI_OtBQJ4zR
 kKtZ1xd_3NEBCeoRdYRuJl7WOb6xNAuATg1t4.co0kF0MbC9M0ToKjNTvN2kfmaiI7HoY1RMVuAe
 TX5w664udmyrErWyK3NP2sk9_DBXht5S18K1o1nI6pLqiIxDTz9qXUCCvWk8tMQnuVDkNSjs9tVu
 RNq12zbRR_lPbyeEUooKcCFt180Wr8mClNNTlcbFAPpXOWEMAiBJbVZXHXFvIgylJ9DGTvD5B0Du
 WN6kiMob0_2T8Obi..Gzz0aqmA6kpNA0hofxaIpDq8vd8aaNtnTPXIyUqxAhgadBzdNk.Pg72kXw
 QqgvJUSK1Dz3FlSM4jtzuEPVqU1OR1x3G5sDFfn8WRE11ZWlhfhJ112pDuVmjhvmFEfgAyA3GNFH
 wgj.Y_idVO8xmPcSQkVX5oJgqhq0zroWCEl4cCv03k2u6rywWRRpFpSh.7bTGCQiqlVRT1tkz5aG
 poeXZ33JUPapdEI5oQwj4bKqkhrbLTEFB0OXN1oWIg6xM9Wcg5N3lxeBaW0BumQFMBq2LhPjlwzz
 IoZSFMcSpaqzw5aNEly9vzWxNQqtCKWapCdEzx6fomNW7FDRJ9cOfIl0bu7AN3jQoLdhh0UVHkDb
 HsQGxcb7ncAqpBipzrvI2aOylTES7NDWNe7ZN70g6NRNgi30YvXN9a72pnADVlhXb2sukBwlhq8l
 DWqcDYGwl4Oz9SEGlarmbJDPxMIKF_y8cPMkW689yUfLbrDHDiZAtewGhKbuaBej8OKMLJZx7ete
 kRQFJjPPf7ShLcCYOe80s23Br_j9SxzAdQlN1S4GcLjUfXHUwWVHcCxh447X7UfzFaMFrarM1jCf
 8l..0VabX82yfzspGBfyjxyAY3mJ1.9hbKKufoKkbgNXdql5LjjaOAVQ_thvWRSEd8M9l0PjmVmM
 yV7vBwRAWfSXNfHL2V0TBnGHjrLaI_z3cgKuslRkSA91enydpPLPgz9dH9gUWyrEJ_I.BrJDTZu8
 D1I2JISGPoB.eYpgGs6KMNn6gphqV4oWvm3YeE9RWuZsU70bbDc8gWEDTxQgohTp2d7BjipXjt1U
 uB5iAEbRJoYwah1ZvNT4IqCSyAw3zcMddYzhMD3S7LYWpVfNgah6j0msyfrXRa6aTCEzhIY9Vkt.
 cXrjwZrt4DeU-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Fri, 25 Mar 2022 14:50:18 +0000
Received: by kubenode516.mail-prod1.omega.sg3.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ee9c67d9044eb9cc3a7d6349bbd1d60e; 
 Fri, 25 Mar 2022 14:50:14 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Move EMMS and FEMMS instructions out of gen_sse
Date: Fri, 25 Mar 2022 22:50:06 +0800
Message-Id: <20220325145007.448948-2-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325145007.448948-1-lw945lw945@yahoo.com>
References: <20220325145007.448948-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.205; envelope-from=lw945lw945@yahoo.com;
 helo=sonic304-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move EMMS and FEMMS instructions out of gen_sse to avoid the requirement
of CR0.TS and get a better code readability.

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..fe9fcdae96 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3154,20 +3154,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         && (b != 0x38 && b != 0x3a)) {
         goto unknown_op;
     }
-    if (b == 0x0e) {
-        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-            /* If we were fully decoding this we might use illegal_op.  */
-            goto unknown_op;
-        }
-        /* femms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
-    if (b == 0x77) {
-        /* emms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
     /* prepare MMX state (XXX: optimize by storing fptt and fptags in
        the static cpu state) */
     if (!is_xmm) {
@@ -8451,14 +8437,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         set_cc_op(s, CC_OP_POPCNT);
         break;
-    case 0x10e ... 0x10f:
+    case 0x10e: /* femms */
+        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+            /* If we were fully decoding this we might use illegal_op.  */
+            goto unknown_op;
+        }
+        /* fall through */
+    case 0x177: /* emms */
+        gen_helper_emms(cpu_env);
+        break;
+    case 0x10f:
         /* 3DNow! instructions, ignore prefixes */
         s->prefix &= ~(PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
         /* fall through */
     case 0x110 ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
-    case 0x150 ... 0x179:
+    case 0x150 ... 0x176:
+    case 0x178 ... 0x179:
     case 0x17c ... 0x17f:
     case 0x1c2:
     case 0x1c4 ... 0x1c6:
-- 
2.30.2


