Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2659AECF
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 17:11:35 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPQ8K-0004HH-VD
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 11:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKC-0005Fi-TL
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:44 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKA-0003lt-E4
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:44 -0400
X-IPAS-Result: =?us-ascii?q?A2ASBABk7ABj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pEPly6HUQsBAQEBAQEBAQEIAUIEAQGFAwICAoRiJjgTAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEchS9GhkMCAQMjDwFGECAFAiYCAlcGDgWCfYMjq?=
 =?us-ascii?q?RqBMYEBhHCFEgkBgQcsiBCCGoUrglCECHWEYTCDCYJlBJYogyYcOAMJBAcFL?=
 =?us-ascii?q?B5CAwsfDhYFCAkXEhAQAgQRGgsGAxY+CQIEDgNACA0DEQQDDxgJEggQBAYDM?=
 =?us-ascii?q?QwlCwMUDAEGAwYFAwEDGwMUAwUkBwMZDyMNDQQfDAMDBSUDAgIbBwICAwIGF?=
 =?us-ascii?q?QYCAjYYOQgECAQrIw8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAIIJxcHE?=
 =?us-ascii?q?zMZAQUyJxAJIRwOGhAFBhMDIG8FBz4PKDM1OSsdGwqBEiopFQMEBAMCBhMDA?=
 =?us-ascii?q?yICEC4xAxUGKRMSLQcrdQkCAyJpBQMDBCgsAwk+BwkiJj0FBVs6BQMDECI9B?=
 =?us-ascii?q?gMJAwIpFSebDYEOgXxcwXwHghahSUyWcQKSAS2HCY9Row+EJwIEAgQFAhaBe?=
 =?us-ascii?q?IF+cYM2URcCD5xyczsCBgEKAQEDCYpcAQE?=
IronPort-Data: A9a23:XzTpjqBdP1UtxxVW/5Thw5YqxClBgxIJ4kV8jS/XYbTApGsn0TUFz
 GFKXGnTb/qCM2ajLt5ya4uzoU8Hu8LdzNRlOVdlrnsFo1CmCCbmLYnDch2gb3v6wunrFh8PA
 xA2M4GYRCwMZiaA4E/ra9ANlFEkvU2ybuOU5NXsZ2YgHmeIdA970Ug5w75j2tYy6TSEK1rlV
 e3a8pW31GCNhmYc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMb
 7uZkOvprjuxEyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPqsTbJIhhUlrZzqhx8568
 edj76SLGQ4zJvHwn9gvDztEHHQrVUFG0OevzXmXi/Ov72D2NkC2ht8oFl4qPcgR9qB7DAmi9
 9RBc2xLN0vbwbjohuvmF4GAhex6RCXvFJ8YsHBp1nfDCvsmRJ3Ha7/V+d8d1T47hs1IW/rTD
 yYcQWMyN0ScOEYSZz/7DroTxfm6mCOgXwcJoXatu5YqyUPNxRBuhe2F3N39P4biqd9utl+Vo
 3+D82nnDxUyMtuZxjyYtHW2iYfnhS7nVZhUEbSp+vNuhHWXx2oaEhpQUkG0ycRVkWakRM5fJ
 lxR4XBrp+4o61CrC9DxGRG1yJKZgiMhtxNrO7VSwGmwJmD8um512kBsouZ9VeEb
IronPort-HdrOrdr: A9a23:uUyDgq6qc5fEoNtM+QPXwPnXdLJyesId70hD6qhwISY4TiX+rb
 HIoB17726RtN9/Yh8dcLy7UpVoBEmslqKdgrNhWItKPjOGhILAFugLhrcKgQeQeREWntQts5
 uIGJIQNDSfNzVHZZGQ2njBLz9Z+rm6GfeT9J7j80s=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="153843355"
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
Subject: [PATCH v3 1/9] target/arm: Add ARM_FEATURE_V8_R
Date: Sat, 20 Aug 2022 16:19:06 +0200
Message-ID: <20220820141914.217399-2-tobias.roehmel@rwth-aachen.de>
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

This flag is necessary to add features for the Cortex-R52.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df677b2d5d..86e06116a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2287,6 +2287,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_V8_R,
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
-- 
2.25.1


