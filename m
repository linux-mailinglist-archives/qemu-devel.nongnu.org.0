Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC4303196
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 03:09:27 +0100 (CET)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DnK-0007K1-Hw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 21:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l4DmM-0006uA-Cr
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 21:08:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l4DmJ-0003In-Mn
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 21:08:26 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10Q26wE1087035; Mon, 25 Jan 2021 21:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jFIqT3z6ZjheYukaZ2r3oFfc+2c7aiNvXqoiR99OLto=;
 b=Wt8DtCpoEhRT9aUpout/Yl4k/ttzXFt7WIuqAayAA4wDqolgUTGtxlLqxYRLL+iBCcs+
 utC8cJ/iWLybHemIbaIvW3ylk5qynQgp3ky00e4ZtQjQLZ09M77HCOgZgYbK2xKoS5Vt
 KK5L4kYHlKR2V3XHpYzodca+4C79oiEeEJpu2qvMk4XRlygJBvWnkGceVEGZ2Opijsjy
 wmo6nQURJlotCX2I9OvrkVqYbvo6nST6nwO2Zwbnbo9/HO3+6cmWSWzrezu1d7m/pEe9
 IreUMkhcQ3/MBV3Z0I4yFg6U2sB6VxYA8rubk4+1ZVOMJkrrCAAV+3q0guOvOywCZUPG EA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36a8j19n5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 21:08:20 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q21lJR027189;
 Tue, 26 Jan 2021 02:08:18 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 36a0t2bbf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 02:08:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10Q28Ik930933406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 02:08:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AD402805A;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6460628058;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 0/1] Merge tpm 2021/01/25 v1
Date: Mon, 25 Jan 2021 21:08:15 -0500
Message-Id: <20210126020816.352782-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_10:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=779 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260007
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

  this PR removes an unused tracepoint from tpm_spapr.

   Stefan

The following changes since commit 31ee895047bdcf7387e3570cbd2a473c6f744b08:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-01-25 15:56:13 +0000)

are available in the Git repository at:

  git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-01-25-1

for you to fetch changes up to 68a5b02a4684e6f9bbe5113499f88c0018469d08:

  tpm: tpm_spapr: Remove unused tracepoint (2021-01-25 20:56:38 -0500)

----------------------------------------------------------------

Roman Bolshakov (1):
  tpm: tpm_spapr: Remove unused tracepoint

 hw/tpm/tpm_spapr.c  | 8 ++------
 hw/tpm/trace-events | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.26.2


