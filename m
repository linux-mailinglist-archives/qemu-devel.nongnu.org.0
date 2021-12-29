Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEF481585
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:03:17 +0100 (CET)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2cM8-00068s-7r
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHK-0003gO-31; Wed, 29 Dec 2021 11:58:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHI-00045n-9P; Wed, 29 Dec 2021 11:58:17 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGB12u005075; 
 Wed, 29 Dec 2021 16:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=wIW9PUeL7A31BC91OFX2iax8hWAT8pqPlNGP7oEiB+o=;
 b=MmnehyCTI6+1cmnJutL5TbpQeQ289WsF4PjuHHDLtD+BQO9C75Bob7R0NX46HC8kyGFY
 RnE1Gii8tnmzFCn1J/e7CcFDRA+WSvhrCJ2d39q/nqRJfEIC9fwxcd3eFJ6RmAGwqnX1
 Hytg1PX2/R5JERQg+ge17F7dNAtc+Jk2/PHnX40hx4y+dxUTBGFb/8b+pvJg/7v1LRDi
 C9eGWKIZoAZs3I+42BLEaSirEN1amFOomBz3iOa4w7N/espNNgSQdLus8Wd+LlHT7uGw
 4Op2z0TW1HA6a0iASbC91iGCHULHBR4sSPnOEKdz8PNip34atVV8PRoNMql13gC3y7z9 ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu9k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BTGiNiX007483;
 Wed, 29 Dec 2021 16:58:01 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu9jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:01 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGm8qX005590;
 Wed, 29 Dec 2021 16:58:00 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3d5txauffg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGvxVe30802226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:57:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F3CFAC059;
 Wed, 29 Dec 2021 16:57:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 715E8AC05E;
 Wed, 29 Dec 2021 16:57:57 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.90.107])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:57:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] target/ppc: powerpc_excp improvements (1/n)
Date: Wed, 29 Dec 2021 13:57:46 -0300
Message-Id: <20211229165751.3774248-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mzI0-1iz61fujyJxjTi4vCq6wEyfDetv
X-Proofpoint-ORIG-GUID: 2dBhvtfDkv0jNL-a8Z8ZzASq6tbMnRkE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=884
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112290088
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series comprises of the first 4 patches from the RFC v2 plus an
extra patch addressing review comments.

Patch 1,3,4,5 have been reviewed.

Patch 2 addresses prior comments from patch 3 and has not been
reviewed.

RFC v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

RFC v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html

Fabiano Rosas (5):
  target/ppc: powerpc_excp: Set alternate SRRs directly
  target/ppc: powerpc_excp: Add excp_vectors bounds check
  target/ppc: powerpc_excp: Set vector earlier
  target/ppc: powerpc_excp: Move system call vectored code together
  target/ppc: powerpc_excp: Stop passing excp_model around

 target/ppc/excp_helper.c | 102 ++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 56 deletions(-)

-- 
2.33.1


