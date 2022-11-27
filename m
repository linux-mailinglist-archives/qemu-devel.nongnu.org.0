Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE3639AFC
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:24:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHc2-0005Ct-HQ; Sun, 27 Nov 2022 08:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbT-0004zf-4g
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:59 -0500
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbI-0002QT-GE
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:41 -0500
X-IPAS-Result: =?us-ascii?q?A2DQAgBPY4Nj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+FCYROkR6BE54fDwEBAQEBAQEBAQgBRAQBAYUBAgIChQgmOBMBAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBgEBAQEBAQYEgR2FL0aGVAIBAyMPAUEFECAFAiYCAlcGD?=
 =?us-ascii?q?gWCfYMjrXGBMoEBhHCcTQkBgQosiQaCToVCglCBFYJzdYRhMIMKgmcEmEEcN?=
 =?us-ascii?q?wMJAwcFLB1AAwsYDRYyChMyGzEnDgkfHA4XDQUGEgMgbAUHOg8oL2QrHBsHg?=
 =?us-ascii?q?QwqKBUDBAQDAgYTAyICDSkxFAQpEw0rJ28JAgMiZQUDAwQoLAMJQAcnJDwHV?=
 =?us-ascii?q?joFAwIPIDgGAwkDAiJUci8SFAUDCxUlCAVLBAg5BQZSEgIKEQMSDyxFDkg+O?=
 =?us-ascii?q?RYGJ0IBMA4OEwNdSx2BAQRiOYEVMS+Za4MkB4EOgXk2wzQHgh+iCkyWewKSH?=
 =?us-ascii?q?C2XCqMnhCgCBAIEBQIWgXmBfnGDNlIXAg+ccXQ7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:5Aw3valDb3uu9XTL2L6OARPo5gzdJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaCziEParfazf0e9F1Ydy+9RwD6JGBxtYyHAZqq3pgRFtH+JHPbTi7wuYcHAvPdJGZHBI/h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/jgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5CZaQHNNwJcaDpOsfva8kw35ZwehRtB1rAATaET1LPhvyRNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiY+t5yZv/R3jndaPpATaaBAMxcH011lqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYrLFDn2fF/wXEqfFPy49xEI0IGD7EV2cVoBkQX/
 L8IOBskO0Xra+KemNpXS8FWufgDAfmuB9lakDd60i3ZSP8qB5zOK0nIzYYDgHFp3ZgIR6iYP
 pdEAdZsRE2ojxlnJlAdCZsl2v2vi3n6fjlwsk2Jpe8+6mPTwQo33LWF3N/9II3RHJ0OwhrwS
 mTu50X+JgwjLtik4wGb30uV3OnpsBjwYddHfFG/3rsw6LGJ/UQKBRgLEFe2v/S9oki5Xd1ZN
 goT4CVGhbA/6EGxCNz0ThG1pHqsuh8aUsBXVeog52mwJrH8+RmFBmUUCyUbLdZgrtAqRXkj2
 hmFkrsFGABSjVFcclrFnp/8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:ZFsxt6/X+n9+QzGwncVuk+DtI+orL9Y04lQ7vn2ZKCY6TiX8ra
 qTdZsguiMc9wxhPk3I9erwXZVoa0msjaKdmLNhRItKPzOGhILLFu1fBOLZqlXd8kvFltK1vp
 0QEJSWZuecMbCE5fyKgjVQGexQp+VvoJrCuQ92p00dKT1XVw==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="29310344"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 27 Nov 2022 14:21:31 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:e2b3:9876:72f1:5569)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Sun, 27 Nov 2022 14:21:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v5 3/7] target/arm: Make stage_2_format for cache attributes
 optional
Date: Sun, 27 Nov 2022 14:21:08 +0100
Message-ID: <20221127132112.300331-4-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e2b3:9876:72f1:5569]
X-ClientProxiedBy: rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

The v8R PMSAv8 has a two-stage MPU translation process, but, unlike
VMSAv8, the stage 2 attributes are in the same format as the stage 1
attributes (8-bit MAIR format). Rather than converting the MAIR
format to the format used for VMSA stage 2 (bits [5:2] of a VMSA
stage 2 descriptor) and then converting back to do the attribute
combination, allow combined_attrs_nofwb() to accept s2 attributes
that are already in the MAIR format.

We move the assert() to combined_attrs_fwb(), because that function
really does require a VMSA stage 2 attribute format. (We will never
get there for v8R, because PMSAv8 does not implement FEAT_S2FWB.)

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/ptw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f812734bfb..7d19829702 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2361,7 +2361,11 @@ static uint8_t combined_attrs_nofwb(uint64_t hcr,
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
+    if (s2.is_s2_format) {
+        s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
+    } else {
+        s2_mair_attrs = s2.attrs;
+    }
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2418,6 +2422,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  */
 static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
+    assert(s2.is_s2_format && !s1.is_s2_format);
+
     switch (s2.attrs) {
     case 7:
         /* Use stage 1 attributes */
@@ -2467,7 +2473,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
     ARMCacheAttrs ret;
     bool tagged = false;
 
-    assert(s2.is_s2_format && !s1.is_s2_format);
+    assert(!s1.is_s2_format);
     ret.is_s2_format = false;
 
     if (s1.attrs == 0xf0) {
-- 
2.34.1


