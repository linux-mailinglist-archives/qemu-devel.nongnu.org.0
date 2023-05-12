Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F3700C39
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:45:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw5-0005Qc-Rx; Fri, 12 May 2023 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw3-0005OK-9A
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw0-0007k2-8I
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154352euoutp01a8a2855241beaea797cf2f4771c6e842~eb8wQzHS20546205462euoutp01Q
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230512154352euoutp01a8a2855241beaea797cf2f4771c6e842~eb8wQzHS20546205462euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906232;
 bh=Ynz/skC9Jzhq8J0h2QxYd6k1RgoOF0zcmKy7EC040b8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s446O+wF61eBuioUi/xXXOs1mukOq/ul++sSB0yS8s7DZ59nDGvEMafRj3JQsdOTL
 8yFpOMrM3NEKdzP/fPZ4F3aCmO+WjvwP2pet5BP1UhcQLMoI9vbY3bssKRbgIwg5lC
 V9IZEnvoV7s8p4ykY9o6vBRcHzTbefMcKShNsE1U=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512154352eucas1p1d930b9322edfe17384e34a300503bdb0~eb8v69e7V3053030530eucas1p1C;
 Fri, 12 May 2023 15:43:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BD.B0.37758.8BE5E546; Fri, 12
 May 2023 16:43:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230512154352eucas1p25e99e73c4eef05376602d1686ddddb6d~eb8vl_1hM3014130141eucas1p2l;
 Fri, 12 May 2023 15:43:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154352eusmtrp128d85822e185d0132bc9c89329de6f92~eb8vlgdxD1998019980eusmtrp13;
 Fri, 12 May 2023 15:43:52 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-fa-645e5eb8b7c2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C2.73.10549.8BE5E546; Fri, 12
 May 2023 16:43:52 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154351eusmtip1f9c2d80de58b2eea38059c53b27df115~eb8vHJLNy2547025470eusmtip1Q;
 Fri, 12 May 2023 15:43:51 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 7/7] e1000e: rename e1000e_ba_state
Date: Fri, 12 May 2023 17:43:35 +0200
Message-Id: <20230512154335.2536-8-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduznOd0dcXEpBov2Slt8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujF+Xgwtm8VVcWfWasYFxPmcXIyeHhICJxNl9vYxdjFwcQgIrGCXW3/jC
 DOF8YZR4dG0nK4TzmVHi669FzDAtjeteskAkljNK7Pu6GKqlnUni/4OvjCBVbAJmEo++zANq
 5+AQETCW+NguDhJmFkiVOPrnIAuILQxU8vPaXHYQm0VAVeLN7Y9MIDavgJPE6s7tUMvkJWZe
 +s4OMoZTwFli3gohiBJBiZMzn7BAjJSXaN46G+wECYG1HBI/J39lheh1kXjeMBdqjrDEq+Nb
 2CFsGYnTk3tYIOxyiZ9nt7FDNLcwSuyZOhmqyFri0tafYPczC2hKrN+lDxF2lHh8dB8TSFhC
 gE/ixltBiBv4JCZtm84MEeaV6GgTgqjWkfi2aSYbRFhKYuGNOoiwh8ScS02MExgVZyF5ZhaS
 Z2YhrF3AyLyKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMLmc/nf86w7GFa8+6h1iZOJg
 PMQowcGsJML7dkl0ihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFebduTyUIC6YklqdmpqQWpRTBZ
 Jg5OqQamgKMLlq3KeFYe8V1u9qfKe8HiK96cjw0S2nl2bdSW5aIvcvbedE8MOD0vPT5+9eX3
 mbu1WPcssD8a8draLLjqgGeCdPfMb+xHrlTYuC6/v+XAe9M5z70S3a+w1ntsS9ySt9VxBZue
 Xk2F9JGgmrmJb19VzVvapyx40oG9e+GEyISsJ/+er7xQIqRpU54W8W/T3q33Hzm+sdp3zPm3
 2wrt3c+s1prHBc6oyV195gz/70LWmc6dE1VcWLq2tcZpcOswiqSYc/XvePpsFutyHt07f0zu
 56/elFMVeDo/gGH3wxfWB5x6xLSapjM+mmM1udmmVSrv/9Lbq0rMly9i+/po/sX5rgwZDya8
 e3L/NyeXlRJLcUaioRZzUXEiAPWWAJudAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7o74uJSDCbu4LD4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gb8uBxfM
 4qu4suo1YwPjfM4uRk4OCQETicZ1L1m6GLk4hASWMkpMOf+VDSIhJbGv5z87hC0s8edaFxtE
 USuTxMv/J5lAEmwCZhKPvsxj7WLk4BARMJV4tlcSJMwskClx+tU+sDnCQCU/r80Fm8MioCrx
 5vZHsFZeASeJ1Z3bmSHmy0vMvPSdHWQMp4CzxLwVQiBhIaCSm30LoMoFJU7OfMICMV5eonnr
 bOYJjAKzkKRmIUktYGRaxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERgH24793LyDcd6rj3qH
 GJk4GA8xSnAwK4nwvl0SnSLEm5JYWZValB9fVJqTWnyI0RTo7InMUqLJ+cBIzCuJNzQzMDU0
 MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYDLudr5/2a+lTe2ah9O9zhSp5S+m
 s2rNq3uWff5J4pflL77++OuYfUbX6aS1hrQoS19X77UMjStvbhhxHHeq25C9ME7onU2u4RHW
 MrXFS/wlrp5dfU1SJiNqsbS7y4SbVo6fC0tEuW3C8o42XFnQUsH3ol1W/8Fsp+xoe6VP+Qde
 KTxamN69ojd97du64MS27w+cmpcuNnv13drOw+LhsvdJ7IWFMsve7DwaksSf/nmTzb1VdT90
 fThkvZUFVjKvDNB+eD9ju+elpPV7b8ZstPy8dbmAuVzX1IR5iVdvhwvrB1ifafmyk8v/3prv
 Llunhsxx4rkdsXxt5eek03IybCxfTYylbuZyVJ+4vnXDJyWW4oxEQy3mouJEAPsQ6kgMAwAA
X-CMS-MailID: 20230512154352eucas1p25e99e73c4eef05376602d1686ddddb6d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154352eucas1p25e99e73c4eef05376602d1686ddddb6d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154352eucas1p25e99e73c4eef05376602d1686ddddb6d
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154352eucas1p25e99e73c4eef05376602d1686ddddb6d@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rename e1000e_ba_state according to qemu typdefs guide.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/e1000e_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index f9ff31fd70..be0cf2f941 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1397,15 +1397,15 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
     }
 }
 
-typedef struct e1000e_ba_state_st {
+typedef struct E1000EBAState {
     uint16_t written[MAX_PS_BUFFERS];
     uint8_t cur_idx;
-} e1000e_ba_state;
+} E1000EBAState;
 
 static inline void
 e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
                                hwaddr ba[MAX_PS_BUFFERS],
-                               e1000e_ba_state *bastate,
+                               E1000EBAState *bastate,
                                const char *data,
                                dma_addr_t data_len)
 {
@@ -1420,7 +1420,7 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
 static void
 e1000e_write_payload_frag_to_rx_buffers(E1000ECore *core,
                                         hwaddr ba[MAX_PS_BUFFERS],
-                                        e1000e_ba_state *bastate,
+                                        E1000EBAState *bastate,
                                         const char *data,
                                         dma_addr_t data_len)
 {
@@ -1530,7 +1530,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
     do {
         hwaddr ba[MAX_PS_BUFFERS];
-        e1000e_ba_state bastate = { { 0 } };
+        E1000EBAState bastate = { { 0 } };
         bool is_last = false;
 
         desc_size = total_size - desc_offset;
-- 
2.25.1


