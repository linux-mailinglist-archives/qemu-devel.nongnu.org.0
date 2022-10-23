Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB0609856
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:52:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omg6x-0006Bj-3Z
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 14:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2V-00062F-MP
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2T-0006NF-GF
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
X-IPAS-Result: =?us-ascii?q?A2DQAgC8Q0Vj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+EfoROkRiBE54ACwEBAQEBAQEBAQgBQgQBAYUBAgIChHUmOBMBAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBgEBAQEBAQYEgRyFL0aGQwIBAyMPAUEFECAFAiYCAlcGD?=
 =?us-ascii?q?gWCfYMhrRSBMoEBhHCJcQkBgQcsiFGCK4U0glCBFYJzdYRhMIMKgmYEmjkcO?=
 =?us-ascii?q?AMJAwcFLB1AAwsfDRY1GAMUAwUhBwMZDyMNDQQdDAMDBSUDAgIbBwICAwIGE?=
 =?us-ascii?q?wUCAjUYNAgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAIIJhcHE?=
 =?us-ascii?q?zMZAQUyJw4JIRwOGg0FBhMDIG8FBzsPKC9pKx0bB4EMKigVAwQEAwIGEwMgA?=
 =?us-ascii?q?g0pMRQEKRMPLQcpcQkCAyJlBQMDBCgsAwlABygkPAdYOgUDAhAiPAYDCQMCJ?=
 =?us-ascii?q?BNGdDASFAUDDRcmCAU3GwQIPAIFBlITAgoSAxIPLUkPSj47FwicUQeBDoF5N?=
 =?us-ascii?q?sJdB4IboWpMlnQCkhYtlmSjHoQoAgQCBAUCFoF4gX5xgzZRFwIPnHJzOwIGA?=
 =?us-ascii?q?QoBAQMJiwoBAQ?=
IronPort-Data: A9a23:0PWucarctJaZNGGQEqfyHiDTHJ5eBmJHZBIvgKrLsJaIsI4StFCzt
 garIBmEPq2KNmv0Kd4kPY+xpk5X6MDVnNdiGVY9rH1jEXlG8uPIVI+TRqvS04J+DeWeFh49v
 5VGAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCmthg
 /uryyHkEALjimMc3l48sfrZ8ko35a2q4lv0g3RnDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/TKbix5m8AH+v1T2Mw0NB0L0WXZx7id/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN13A2I/ELUjpdwrLlNM+
 u4BCBoNdQ660rfeLLKTEoGAh+wZE/XLEbNagSsl53fDEuomBJnPBanHjTNa9G5r2oYXRq6YP
 ZRfMGcyBPjDS0Qn1lM/FJU0ne6zwGP4fj1dpVa9v7Ur4y3axQdx3b6rPNe9ltmiHJsNxBnE9
 zidl4j/Ki9EOt2UwGecziK93qz/xTHkd6wfNrLto5aGh3XWnAT/EiY+TFa+vLy1h1CzX/pZL
 Eob/DdoqrI9nGSzQ8XwRVu9qW+IsxoYc95RFeQg70eK0KW83uqCLnIbUj5MeJk97oo8AyY1y
 l/Mlt+vCTEHXKCpdE9xP4y89VuaURX550dYDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:98O7Ga2kTrup3Bnm093kEQqjBIMkLtp133Aq2lEZdPRUGvb1qy
 nIpoV96faUskd0ZJhOo7690cW7K080sKQFgrX5Xo3SOTUO2lHIEGgK1+KLqAEIWReOlNK1vZ
 0QFZSWY+eeMbEVt6vHCF7SKadZ/DD+ysCVbLDlvg5QcT0=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="160274923"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:12 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:12 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 3/7] target/arm: Make stage_2_format for cache attributes
 optional
Date: Sun, 23 Oct 2022 17:36:55 +0200
Message-ID: <20221023153659.121138-4-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/arm/ptw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028ab..db50715fa7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2105,7 +2105,11 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    if (s2.is_s2_format) {
+        s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    } else {
+        s2_mair_attrs = s2.attrs;
+    }
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2163,6 +2167,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
 static uint8_t combined_attrs_fwb(CPUARMState *env,
                                   ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
+    assert(s2.is_s2_format && !s1.is_s2_format);
+
     switch (s2.attrs) {
     case 7:
         /* Use stage 1 attributes */
@@ -2212,7 +2218,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     ARMCacheAttrs ret;
     bool tagged = false;
 
-    assert(s2.is_s2_format && !s1.is_s2_format);
     ret.is_s2_format = false;
 
     if (s1.attrs == 0xf0) {
-- 
2.34.1


