Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9134C276
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 06:22:22 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQjPx-0000eB-30
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 00:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lQjNw-0007Jx-L2; Mon, 29 Mar 2021 00:20:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lQjNu-0008D1-Fd; Mon, 29 Mar 2021 00:20:16 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12T44MqS186987; Mon, 29 Mar 2021 00:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=IR07W5LIxpzREqRvvNBiQMSIF2pzsSh0D44KCLXQzvE=;
 b=KgB0LIDxMH2NfnuB0mEEJmpdC0HLU+DI0WXdvjDoWRLaOuaXB/euOk4QFLms2npqhazI
 AJfRaZyBfH1rI6+VxdxXLBkARdOCaaEQxBG9WgrYn3eMy0QRjPqkMlNAMI4kJJl67ccx
 tclGDmtPMmLODl4Dq8TungUV5KNecxpau31Vxh3TLNv3jXx3JTAsoPGltxj1T0ErMzhU
 VirzdJDaAKf8dEAu5YwqNuplQhJ+wtJw1aQHQL5WqVIXp4YRda0dAiDe+coPAsH4Sny/
 cLdRO5YcVrprvmtavSZt0pxF1ZntU1aTghDu84hwOYSHsupS6alFfGz5Ia3DK/R0iICP yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhm4b4xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 00:20:01 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12T48dcp000687;
 Mon, 29 Mar 2021 00:20:01 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhm4b4x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 00:20:01 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12T4HcLS013743;
 Mon, 29 Mar 2021 04:19:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37hvb88rqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 04:19:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12T4JuVe23855434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 04:19:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 357FB4C046;
 Mon, 29 Mar 2021 04:19:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF9974C050;
 Mon, 29 Mar 2021 04:19:52 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.34.103])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Mar 2021 04:19:52 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: paulus@samba.org, david@gibson.dropbear.id.au
Subject: [PATCH v2 0/3] ppc: Enable 2nd DAWR support on Power10
Date: Mon, 29 Mar 2021 09:49:03 +0530
Message-Id: <20210329041906.213991-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EyPXyix-vOAiCXaFRJQj6eMW92jyQKB3
X-Proofpoint-ORIG-GUID: mWY1CsqNmpM7uAnNDJHE2hqxBV5MI2bb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_02:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=964 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290029
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=ravi.bangoria@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, kvm@vger.kernel.org,
 mst@redhat.com, mpe@ellerman.id.au, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enables 2nd DAWR support on p10 qemu guest. 2nd
DAWR is new watchpoint added in Power10 processor. Kernel/kvm
patches are already in[1].

Patches apply fine on qemu/master branch (9e2e9fe3df9f).

v1: https://lore.kernel.org/r/20200723104220.314671-1-ravi.bangoria@linux.ibm.com
[Apologies for long gap]
v1->v2:
  - Introduce machine capability cap-dawr1 to enable/disable
    the feature. By default, 2nd DAWR is OFF for guests even
    when host kvm supports it. User has to manually enable it
    with -machine cap-dawr1=on if he wishes to use it.
  - Split the header file changes into separate patch. (Sync
    headers from v5.12-rc3)

[1] https://git.kernel.org/torvalds/c/bd1de1a0e6eff

Ravi Bangoria (3):
  Linux headers: update from 5.12-rc3
  ppc: Rename current DAWR macros and variables
  ppc: Enable 2nd DAWR support on p10

 hw/ppc/spapr.c                                 | 34 ++++++++++
 hw/ppc/spapr_caps.c                            | 32 +++++++++
 include/hw/ppc/spapr.h                         |  8 ++-
 include/standard-headers/drm/drm_fourcc.h      | 23 ++++++-
 include/standard-headers/linux/input.h         |  2 +-
 include/standard-headers/rdma/vmw_pvrdma-abi.h |  7 ++
 linux-headers/asm-generic/unistd.h             |  4 +-
 linux-headers/asm-mips/unistd_n32.h            |  1 +
 linux-headers/asm-mips/unistd_n64.h            |  1 +
 linux-headers/asm-mips/unistd_o32.h            |  1 +
 linux-headers/asm-powerpc/kvm.h                |  2 +
 linux-headers/asm-powerpc/unistd_32.h          |  1 +
 linux-headers/asm-powerpc/unistd_64.h          |  1 +
 linux-headers/asm-s390/unistd_32.h             |  1 +
 linux-headers/asm-s390/unistd_64.h             |  1 +
 linux-headers/asm-x86/kvm.h                    |  1 +
 linux-headers/asm-x86/unistd_32.h              |  1 +
 linux-headers/asm-x86/unistd_64.h              |  1 +
 linux-headers/asm-x86/unistd_x32.h             |  1 +
 linux-headers/linux/kvm.h                      | 89 ++++++++++++++++++++++++++
 linux-headers/linux/vfio.h                     | 27 ++++++++
 target/ppc/cpu.h                               |  6 +-
 target/ppc/kvm.c                               | 12 ++++
 target/ppc/kvm_ppc.h                           |  7 ++
 target/ppc/translate_init.c.inc                | 21 +++++-
 25 files changed, 274 insertions(+), 11 deletions(-)

-- 
2.7.4


