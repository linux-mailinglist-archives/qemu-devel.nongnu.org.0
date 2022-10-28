Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271B6111C9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:44:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOhS-0001g8-Lb; Fri, 28 Oct 2022 08:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOhF-0001dR-LE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:49 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ooOh8-00064d-71
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:42:44 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SCUwTU018145;
 Fri, 28 Oct 2022 12:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=zBDg4jEgM/loWdOwcJ+QlAuBC6exGtYKkc2IQoy/+ZU=;
 b=YBivj1dye7y3g31nBHeivJwiSxbg+1eQXMBG+j4RK3szThUYaR/u3mD3GdZzvmuZTUfg
 C6BSGqCS0Bfc/oF1zB7+Wu9vexvw6JCPwxf03YiEnooIJgmuV9HoZHqjRcTlk4Oz4rP4
 73qhWRjBPxGbt9R2IOaKgDU6nL0bOIAmEvmlbxKClxd4kgzPmbAyxmaxeO+PADoKPmgg
 WcKU1xYLcTYN0PRblaybTbz2+FK7IxsshE81sQjZr5YcJ4RLMKwN9UZRW7li84rimt5e
 UzW79CHY9SXcoXPKPBJCQMFa+9C8Nf67BFrGR4C8BMi6h5chID7g5JJsf8m0mji5EfN0 Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf5cgq3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SCWPoc023378;
 Fri, 28 Oct 2022 12:42:37 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgf5cgq2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SCaFQv000975;
 Fri, 28 Oct 2022 12:42:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3kftf1speb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 12:42:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SCgWrP3998354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 12:42:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45F1AA404D;
 Fri, 28 Oct 2022 12:42:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E568BA4040;
 Fri, 28 Oct 2022 12:42:31 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 12:42:31 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] accel/tcg: Fix concurrent pthread_create() and munmap()
Date: Fri, 28 Oct 2022 14:42:25 +0200
Message-Id: <20221028124227.2354792-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rNugH6IuZWALqQwIKbEeKqKx_xuN7I1E
X-Proofpoint-GUID: PuUZX10gkmG0iw2fOm1FEeTVhgPiAgAe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This is a fix for the issue reported in [1].
Patch 1 is the fix itself, patch 2 is the test/reproducer.

By the way, I noticed that there is no code to free tb_jmp_cache, and
object_finalize(CPUState) is never called - in case of system emulation
this is fine, but what about linux-user?

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05181.html

Best regards,
Ilya

Ilya Leoshkevich (2):
  accel/tcg: Fix concurrent pthread_create() and munmap()
  tests/tcg/multiarch: Add munmap-pthread.c

 accel/tcg/tb-maint.c                 |  5 ++
 tests/tcg/multiarch/Makefile.target  |  3 ++
 tests/tcg/multiarch/munmap-pthread.c | 71 ++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 tests/tcg/multiarch/munmap-pthread.c

-- 
2.37.2


