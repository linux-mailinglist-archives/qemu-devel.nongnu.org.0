Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE659AEB1
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:37:20 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPb8-0002uM-0X
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKA-0005E5-3D
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:42 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK7-0003lt-PX
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:41 -0400
X-IPAS-Result: =?us-ascii?q?A2ASBABk7ABj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pEPnn8LAQEBAQEBAQEBCAFCBAEBhQMCAgKEYiY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEGAQEBAQEBBgSBHIUvRoZDAgEDIw8BQQUQIAUCJgICVwYOBYJ9gyOpG?=
 =?us-ascii?q?oExgQGEcIUSCQGBByyIEIIahSuCUIQIdYRhMIMJgmUEmU4cOAMJBAcFLB5CA?=
 =?us-ascii?q?wsfDhYFCAkXEhAQAgQRGgsGAxY+CQIEDgNACA0DEQQDDxgJEggQBAYDMQwlC?=
 =?us-ascii?q?wMUDAEGAwYFAwEDGwMUAwUkBwMZDyMNDQQfDAMDBSUDAgIbBwICAwIGFQYCA?=
 =?us-ascii?q?jYYOQgECAQrIw8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAIIJxcHEzMZA?=
 =?us-ascii?q?QUyJxAJIRwOGhAFBhMDIG8FBz4PKDM1OSsdGwqBEiopFQMEBAMCBhMDAyICE?=
 =?us-ascii?q?C4xAxUGKRMSLQcrdQkCAyJpBQMDBCgsAwk+BwkiJj0FBVs6BQMDECI9BgMJA?=
 =?us-ascii?q?wIpFSebBgeBDoF5wlsHghahSUyWcQKSAS2WWqMPhCcCBAIEBQIWgXiBfnGDN?=
 =?us-ascii?q?lEXAg+ccnM7AgYBCgEBAwmKXAEB?=
IronPort-Data: A9a23:8fZjqKkEc5gIsQCEP59Np7vo5gw8JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWD+Bb6uDZGGjKtByPNu1pk4O78SDndVnSAM9/ns8EltH+JHPbTi7wuYcHAvPdJGZHBI/h
 yk6QoOdRCzhZiaE/n9BCpC48T8kk/jgqoPUUIYoAAgoLeNfYHpn2EkLd9IR2NYy24DpWVvV4
 7senuWGULOb828sWo4rw//bwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQHuG4KtWHq
 9Prl9lVyEuEpUt3WoP9+lrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKtao23hojx/9
 DlCncKecQQyDqPUor0iaAFhPjteOZx7oJaSdBBTseTLp6HHW0HT/9VDPAQNZ8gyvPxoHWEL/
 PBeJD1lghKr3rnqhuvgEq822IJ6cZSD0IA34xmMyRnFCvwnSIuFWaLH5dpV2B8qmdxOWP/Xb
 MoUb3xjYXwsZjUWZwxHVMllwbjAan/XSQ8Jrmqo5vcO3Efd7y5c7PvoDtbIU4nfLSlStgPCz
 o7cxEzgDxQHcdCS1zeB2nSrgODJgGX8Qo16PKW16vNwxlia12AeDBk+UVq9qOO+zEmkVLpix
 1c84DUyraUisVfxC9O7RQKkoDuNslgQVrK8DtEH1e1E8YKMiy7xO4TOZmQphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:FxhBlavTJlhFe/6IUU14p9Wm7skDptV00zEX/kB9WHVpm62j5q
 KTdZEgvnXJYVkqNU3I5urwRZVoLUmxyXde2/h0AV7aZnichILwFvAZ0WKA+UyCJ8SdzI9gPM
 5bGsBD4bvLYmSS5vyb3ODXKbgdKZa8gcaVbJ/lvg5QpR0BUdAG0y5JThyWFUB7X2B9dOIEPa
 vZ+s9fq1ObCBEqUvg=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="153843357"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:27 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:26 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 4/9] target/arm: Make stage_2_format for cache attributes
 optional
Date: Sat, 20 Aug 2022 16:19:09 +0200
Message-ID: <20220820141914.217399-5-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

The Cortex-R52 has a 2 stage MPU translation process but doesn't have the
FEAT_S2FWB feature. This makes it neccessary to allow for the old cache
attribut combination. This is facilitated by changing the control path
of combine_cacheattrs instead of failing if the second cache attributes
struct is not in that format.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/ptw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4d97a24808..8b037c1f55 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2108,7 +2108,11 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
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
@@ -2166,6 +2170,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
 static uint8_t combined_attrs_fwb(CPUARMState *env,
                                   ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
+    assert(s2.is_s2_format && !s1.is_s2_format);
+
     switch (s2.attrs) {
     case 7:
         /* Use stage 1 attributes */
@@ -2215,7 +2221,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     ARMCacheAttrs ret;
     bool tagged = false;
 
-    assert(s2.is_s2_format && !s1.is_s2_format);
     ret.is_s2_format = false;
 
     if (s1.attrs == 0xf0) {
-- 
2.25.1


