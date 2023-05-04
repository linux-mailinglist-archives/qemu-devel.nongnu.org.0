Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A96F722B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:54:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pue57-0003mi-NQ; Thu, 04 May 2023 14:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue4y-0003jR-DF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue4s-0004eD-4Z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:53:23 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344Id32d031914
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=V4fLi6OTbvQyRLN5gUBU9iOBU9oxBL+/OC0hncOd9g4=;
 b=GKgMT1xFT1nPOJu9tVndoTPaFVKUlUNZ5hBevsic6rpySU43ULKAt5hxgas/V6TXdCB0
 OKBkRXQW/0hgWjaiO4Mcp2UoAZC4qtzkQIXmIOQ76SsbiS7up7VlIbePQNxkRXfigNUb
 yQCv+iIQEEFs3Iv9qBdKtGIy60K7JA5palVyRc/ZjzYJWJm+U5nJuCyMXwt+AvOSCcc6
 JRgrac5MKljm8SJI6R4CdVAOsmAONAn6n7Zk9Avb8CvOnI0RF7+SGbKds5dolB5s5u73
 fpxA/C6/UgXzJCcGhLQQuoiP6PIfvYGAXhMgaDJr1g+BN7hs575+5a3E1a5N/gN0MWWN jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qca1j9fgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:53:15 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344IrEEP021212
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qbe38us9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:53:14 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344IrDaV021201
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:53:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 344IrDwc021196
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:53:13 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 7316670ED; Thu,  4 May 2023 15:53:13 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: bcain@quicinc.com, tsimpson@quicinc.com
Subject: [PATCH 0/2] Hexagon: improve output for arch version debugging
Date: Thu,  4 May 2023 15:53:10 -0300
Message-Id: <cover.1683225804.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 1ZIdkte2hyBP5RgIrGoWZiBn6G2rVv6Z
X-Proofpoint-GUID: 1ZIdkte2hyBP5RgIrGoWZiBn6G2rVv6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_12,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=324 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040150
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

If we run qemu with an Hexagon binary compiled to an arch version that
is higher than the threshold modeled by qemu, we will get the following
error:

    qemu-hexagon: unable to find CPU model 'unknown'

This can be confusing ("Was qemu unable to read the arch version from
this binary? Or did it read but does not know such version?").

And running `qemu-hexagon -cpu help` doesn't help either, as it just
errors out with no output. This patchset tries to improve this process.

https://lore.kernel.org/qemu-devel/cover.1673616964.git.quic_mathbern@quicinc.com/

Matheus Tavares Bernardino (2):
  Hexagon: list available CPUs with `-cpu help`
  Hexagon: append eflags to unknown cpu model string

 linux-user/hexagon/target_elf.h |  7 ++++++-
 target/hexagon/cpu.h            |  3 +++
 target/hexagon/cpu.c            | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.37.2


