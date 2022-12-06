Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BF64413C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9M-0007JC-RL; Tue, 06 Dec 2022 05:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V98-0007FK-MD
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:26:00 -0500
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V95-00028p-V3
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:54 -0500
X-IPAS-Result: =?us-ascii?q?A2ATBADNF49j/5sagoZaHQEBAQEJARIBBQUBQIFPhQuET?=
 =?us-ascii?q?pEfgROeIA8BAQEBAQEBAQEIAUQEAQGFAQICAoUPJjgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEdhS9GhlYCAQMjDwFBBRAgBQImAgJXBg4Fgn6DI?=
 =?us-ascii?q?61KgTKBAYRxnE0JAYEKLIkIgk6FQoJQgRWCc3WEYTCDCoJnBJcVDm4cNwMJA?=
 =?us-ascii?q?wcFLB1AAwsYDRYyChMyNQsRTCscGweBDCooFQMEBAMCBhMDIAINKDEUBCkTD?=
 =?us-ascii?q?SsmbQkCAyFhBQMDBCgsAwlAByYmPAdWNwUDAg8gOAYDCQMCH1R0LxIUBQMLF?=
 =?us-ascii?q?SUIBUkECDcFBlMSAgoREg8sRQ5IPjkWBidBATAODhMDXUsdgQEEYDmBFS8um?=
 =?us-ascii?q?wwHgQ6BeTYRwy8Hgh+iDkyWfQKSHS2XE6MqhCgCBAIEBQIWgXmBfnGDNlIXA?=
 =?us-ascii?q?g+ccXQ7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:0A6KeqJVTRtkRH+RFE+RjpQlxSXFcZb7ZxGr2PjKsXjdYENSgzUPz
 WYcDTuFOayKYmTwKdEgPNm19hlQsMeDn9JnGgMd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vraP64xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvQ/
 4KsyyHjEAX9gWQtaDpKs/jrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0jnFojvxrZKJ0hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0aBuoNf6zXaDXcO78x2bfyXd0/9VU1xmPJADx/lwWnFh6
 qlNQNwNRkjra+Oe+o2HasRcw/95aeOtJpwDujRpwXfVAJ7KQ7iaGPmMvIQAmm1uwJkTQJ4yZ
 OJAAdZrRAjHaRxGIREND58+meqsrmPgbz0doVuepacxpWTepOB0+OGzbIeFK4LRFa25mG7Fp
 kb721jwMi0VNcSG7QKZznGil8rQyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQ84icyoLJ08UW6QtT5WzW8oXiNpBlaXMBfe9DW8ymX1bbU7hbcHTJBRHhbd8Am8cY6AzAnv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Yn2IdaP25YQvqsBcTvCjsMiBIKoaSvp037Eqv3ocdfUzSL3+qy
 nOpoV+6faaslgssR0b8+xofZPwIk80lqQFhLX5X43CYOCOggLBR72Kr7GSoQEIcxeOkNK1vp
 0OT0ERMrDN5Q8Qt7eD3ODBKbYdKY68gdmVuds=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="164589638"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:31 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 3/7] target/arm: Make stage_2_format for cache attributes
 optional
Date: Tue, 6 Dec 2022 11:25:00 +0100
Message-ID: <20221206102504.165775-4-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


