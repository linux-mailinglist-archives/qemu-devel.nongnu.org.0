Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD035935D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:46:33 +0200 (CEST)
Received: from localhost ([::1]:46312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUi6K-0007gz-DN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2S-0002zb-2P
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:32 -0400
Received: from mga05.intel.com ([192.55.52.43]:12397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2P-0007Ip-DP
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:31 -0400
IronPort-SDR: z40Z3hcN69QzkGqmmYn7v8Spc2txo0Mxm/UJKo38/0CknJQTtxnkl3jZQqpKaQv//L5+MDwVRg
 BjgNl8Bt+5/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278957315"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278957315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:42:26 -0700
IronPort-SDR: 9cFeHY+ajijbdYbPlK67UgHI5j8HlxhEQQ8BNYLRsb9ODA5wbBbg/+zE2WaLxcuuEtPw744mg+
 rZmT4hVdQT8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="416080999"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2021 20:42:24 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v6 01/10] Remove some duplicate trace code.
Date: Thu,  8 Apr 2021 23:20:47 -0400
Message-Id: <1617938456-315058-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

There is the same trace code in the colo_compare_packet_payload.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 net/colo-compare.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 9d1ad99..c142c08 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -590,19 +590,6 @@ static int colo_packet_compare_other(Packet *spkt, Packet *ppkt)
     uint16_t offset = ppkt->vnet_hdr_len;
 
     trace_colo_compare_main("compare other");
-    if (trace_event_get_state_backends(TRACE_COLO_COMPARE_IP_INFO)) {
-        char pri_ip_src[20], pri_ip_dst[20], sec_ip_src[20], sec_ip_dst[20];
-
-        strcpy(pri_ip_src, inet_ntoa(ppkt->ip->ip_src));
-        strcpy(pri_ip_dst, inet_ntoa(ppkt->ip->ip_dst));
-        strcpy(sec_ip_src, inet_ntoa(spkt->ip->ip_src));
-        strcpy(sec_ip_dst, inet_ntoa(spkt->ip->ip_dst));
-
-        trace_colo_compare_ip_info(ppkt->size, pri_ip_src,
-                                   pri_ip_dst, spkt->size,
-                                   sec_ip_src, sec_ip_dst);
-    }
-
     if (ppkt->size != spkt->size) {
         trace_colo_compare_main("Other: payload size of packets are different");
         return -1;
-- 
1.8.3.1


