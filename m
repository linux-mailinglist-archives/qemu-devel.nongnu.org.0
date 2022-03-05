Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F24CE459
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:02:51 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSBW-0003eP-J5
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9H-0000zl-EC; Sat, 05 Mar 2022 06:00:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9F-0002zo-FC; Sat, 05 Mar 2022 06:00:30 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2255HOf6028435; 
 Sat, 5 Mar 2022 11:00:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em1k7kh0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225Arsve022869;
 Sat, 5 Mar 2022 11:00:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ekyg90qbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 225B0HGn38928872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB61611C050;
 Sat,  5 Mar 2022 11:00:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E4511C05B;
 Sat,  5 Mar 2022 11:00:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:17 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 980E422027F;
 Sat,  5 Mar 2022 12:00:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/13] ppc queue
Date: Sat,  5 Mar 2022 11:59:57 +0100
Message-Id: <20220305110010.1283654-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tESnjRFx1brCwhoXSYM78TXV6AMkSuY0
X-Proofpoint-ORIG-GUID: tESnjRFx1brCwhoXSYM78TXV6AMkSuY0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=842 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1034 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203050057
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3d1fbc59665ff8a5d74b0fd30583044fe99e1117:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' i=
nto staging (2022-03-04 15:31:23 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220305

for you to fetch changes up to a9eb50376ffb27a3f348b0bccf70a34b26be2a3c:

  target/ppc: Add missing helper_reset_fpstatus to helper_XVCVSPBF16 (2022-=
03-05 07:16:48 +0100)

----------------------------------------------------------------
ppc-7.0 queue :

* Clang fixes
* Vector/VSX instruction batch fixes

----------------------------------------------------------------
Lucas Mateus Castro (alqotel) (1):
      target/ppc: Fix vmul[eo]* instructions marked 2.07

Matheus Ferst (9):
      tests/tcg/ppc64le: use inline asm instead of __builtin_mtfsf
      target/ppc: change xs[n]madd[am]sp to use float64r32_muladd
      tests/tcg/ppc64le: drop __int128 usage in bcdsub
      tests/tcg/ppc64le: emit bcdsub with .long when needed
      tests/tcg/ppc64le: Use Altivec register names in clobber list
      target/ppc: use ext32u and deposit in do_vx_vmulhw_i64
      target/ppc: use extract/extract2 to create vrlqnm mask
      target/ppc: use andc in vrlqmi
      target/ppc: split XXGENPCV macros for readability

Miroslav Rezanina (1):
      Use long endian options for ppc64

V=C3=ADctor Colombo (2):
      target/ppc: Add missing helper_reset_fpstatus to VSX_MAX_MINC
      target/ppc: Add missing helper_reset_fpstatus to helper_XVCVSPBF16

 configure                               |   4 +-
 target/ppc/fpu_helper.c                 |  58 +++++--------
 target/ppc/int_helper.c                 |  28 +++++--
 tests/tcg/ppc64le/bcdsub.c              | 144 ++++++++++++++++------------=
----
 tests/tcg/ppc64le/mtfsf.c               |  19 ++---
 tests/tcg/ppc64le/non_signalling_xscv.c |  16 ++--
 target/ppc/translate/vmx-impl.c.inc     |  42 ++++------
 target/ppc/translate/vsx-impl.c.inc     |  71 ++++++++--------
 tests/tcg/configure.sh                  |   4 +-
 9 files changed, 190 insertions(+), 196 deletions(-)

