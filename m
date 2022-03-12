Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BA4D6DC5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:37:54 +0100 (CET)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSyC9-0001Xn-R3
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0Y-0002Zr-SQ; Sat, 12 Mar 2022 04:25:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0X-0007KP-2D; Sat, 12 Mar 2022 04:25:54 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22C4V1Yb010719; 
 Sat, 12 Mar 2022 09:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=GoBu0QJSzfUmdBKJbCpyw2H5xKfQiBZ7+GZr3AOa/OA=;
 b=YrjU1Q4czTvpG3zXd8mBo8X5DqGaOwVW2Vo3Zw83ODkwmTxO6ylKPgmZ5SCLS/ZUMc5K
 Y55V7su9JDxL5Zc+QXowKO4LOxoVOae00q7ZV3ZRNeLMZxhG6HWZJc0gHWAZka91WfT4
 MJdfkkxBlPlp20UaKUabfO2oJ3zxosD8XloPj3V5UbBMH25JqYIlHwcALePNUbIqGHyP
 etefSB2ABa1WtZZ2D+L6WodFIYpWAlaBshdGU6TMcdfaiUcNVDW/NnJuH6PIo2Mxd+Cw
 KPAdCUm+eFPEQbEBEutgtT3k5GE4ETRHN5wMjwBKuyDhEZFRCBSYgXuLSAL0B4TcNEp7 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erm30ke4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:50 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22C9PniK019175;
 Sat, 12 Mar 2022 09:25:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erm30ke45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22C9DsO7024340;
 Sat, 12 Mar 2022 09:25:47 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58ge3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22C9Piac45744588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Mar 2022 09:25:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 948BA42041;
 Sat, 12 Mar 2022 09:25:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29E6C42042;
 Sat, 12 Mar 2022 09:25:43 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Mar 2022 09:25:43 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 0/3] Fix BRASL and BRCL with large negative offsets
Date: Sat, 12 Mar 2022 10:25:38 +0100
Message-Id: <20220312092541.585282-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qajPUHtKPo_mSiJ5qeOiUu6EOWh7cZrk
X-Proofpoint-ORIG-GUID: 3tdP3kx1T3FsTPSayTtFZ9lu-Fc36L91
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-12_03,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203120053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I noticed that sometimes jumping backwards leads to crashes or hangs.
The problem is a missing cast.
Patches 1 and 2 fix the problem, patch 3 adds a test.


v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03356.html
v1 -> v2:
- Skip the test if mmap() fails (Richard).
- Replace test opcodes with inline asm (David). Since we now want to
  skip the test if the code cannot be mapped (e.g. on a 31-bit host),
  we shouldn't be asking the loader to map the code right away. So
  the mmap() approach stays.

Best regards,
Ilya

Ilya Leoshkevich (3):
  s390x/tcg: Fix BRASL with a large negative offset
  s390x/tcg: Fix BRCL with a large negative offset
  tests/tcg/s390x: Test BRASL and BRCL with large negative offsets

 target/s390x/tcg/translate.c           |  4 +-
 tests/tcg/s390x/Makefile.target        |  1 +
 tests/tcg/s390x/branch-relative-long.c | 60 ++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/branch-relative-long.c

-- 
2.35.1


