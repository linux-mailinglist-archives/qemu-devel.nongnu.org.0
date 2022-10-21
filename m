Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4936099C8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:27:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omkKR-0000tk-5U
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 19:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1omRPp-0008UT-FA; Sat, 22 Oct 2022 23:12:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1omRPn-0001md-NM; Sat, 22 Oct 2022 23:12:45 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29N32aEV006270;
 Sun, 23 Oct 2022 03:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=mqNKx9EOZOwNOpbZ70ssiGwhbr9TjejI4qFljTpkUyo=;
 b=UD5fFWRg2WxID8NFN6A9uedFqofWSyEFTiKhRJoa+jnoK+rcSmBh2Qbzk3OAZ5UqG8mX
 t32gNgdBKPr3Ig9UomkM6R3+4JrxvehpnL0mhSdg26bhyi87DlTa7voyplNe9trMU29r
 9hAwwlTdmkgKXnviePvch5yhUB7o/n24N9PqEjTjrNzYQ/wjgDgP8A2Ek2YGqjNZ3K2m
 SrogFpOkA9oH8Z2n1quyNqLreFV9VidWrjhwLwjoEKEV5iWCw9rcJYnWbEUtTai8o2Rz
 pBerUHblykntOa/vPyTAGaQNTICZJjSZzaTkgEOlyOh+gEkMLxoHGvDHjIla8SRP+abQ Pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc99qsk6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 03:12:39 +0000
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29N3Cc2T022545
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 03:12:38 GMT
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 600373BB; Fri, 21 Oct 2022 14:36:08 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] accel/tcg/tcg-accel-ops-rr: fix trivial typo
Date: Fri, 21 Oct 2022 14:36:06 -0300
Message-Id: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YIozH9cmKc1sX8ow_U_XJFe-TXC7fNs3
X-Proofpoint-ORIG-GUID: YIozH9cmKc1sX8ow_U_XJFe-TXC7fNs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=661
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210230019
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 accel/tcg/tcg-accel-ops-rr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index cc8adc2380..cc912df108 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -51,7 +51,7 @@ void rr_kick_vcpu_thread(CPUState *unused)
  *
  * The kick timer is responsible for moving single threaded vCPU
  * emulation on to the next vCPU. If more than one vCPU is running a
- * timer event with force a cpu->exit so the next vCPU can get
+ * timer event we force a cpu->exit so the next vCPU can get
  * scheduled.
  *
  * The timer is removed if all vCPUs are idle and restarted again once
-- 
2.37.2


