Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21632420AC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 11:26:53 +0200 (CEST)
Received: from localhost ([::1]:57952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hazWt-0002xH-Lc
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 05:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39116)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hazRI-00019Q-IR
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hazRH-0007di-Hj
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:21:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52569
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
 id 1hazRH-0007YO-Cg
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 05:21:03 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5C9DhU7068995
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 05:20:55 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t2w9nuu37-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 05:20:55 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
 Wed, 12 Jun 2019 10:20:54 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 10:20:51 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5C9KoF526345772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 09:20:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3B3AC6057;
 Wed, 12 Jun 2019 09:20:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8228CC6055;
 Wed, 12 Jun 2019 09:20:48 +0000 (GMT)
Received: from [127.0.1.1] (unknown [9.124.31.35])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 09:20:48 +0000 (GMT)
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
To: aik@au1.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Date: Wed, 12 Jun 2019 14:50:47 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061209-8235-0000-0000-00000EA6D0D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011250; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216839; UDB=6.00639831; IPR=6.00997939; 
 MB=3.00027275; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-12 09:20:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061209-8236-0000-0000-000045FD0C96
Message-Id: <156033104292.26635.15759339817253067370.stgit@aravinda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=512 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120064
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v10 0/6] target-ppc/spapr: Add FWNMI support in
 QEMU for PowerKVM guests
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
Cc: paulus@ozlabs.org, aravinda@linux.vnet.ibm.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set adds support for FWNMI in PowerKVM guests.

System errors such as SLB multihit and memory errors
that cannot be corrected by hardware is passed on to
the kernel for handling by raising machine check
exception (an NMI). Upon such machine check exceptions,
if the address in error belongs to guest then KVM
invokes guests' 0x200 interrupt vector if the guest
is not FWNMI capable. For FWNMI capable guest
KVM passes the control to QEMU by exiting the guest.

This patch series adds functionality to QEMU to pass
on such machine check exceptions to the FWNMI capable
guest kernel by building an error log and invoking
the guest registered machine check handling routine.

The KVM changes are now part of the upstream kernel
(commit e20bbd3d). This series contain QEMU changes.

Change Log v10:
  - Reshuffled the patch sequence + minor fixes

Change Log v9:
  - Fixed kvm cap and spapr cap issues

Change Log v8:
  - Added functionality to check FWNMI capability during
    VM migration
---

Aravinda Prasad (6):
      Wrapper function to wait on condition for the main loop mutex
      ppc: spapr: Introduce FWNMI capability
      target/ppc: Handle NMI guest exit
      target/ppc: Build rtas error log upon an MCE
      migration: Include migration support for machine check handling
      ppc: spapr: Handle "ibm,nmi-register" and "ibm,nmi-interlock" RTAS calls


 cpus.c                   |    5 +
 hw/ppc/spapr.c           |   53 +++++++++
 hw/ppc/spapr_caps.c      |   26 ++++
 hw/ppc/spapr_events.c    |  273 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c      |   89 +++++++++++++++
 include/hw/ppc/spapr.h   |   25 ++++
 include/qemu/main-loop.h |    8 +
 target/ppc/kvm.c         |   35 ++++++
 target/ppc/kvm_ppc.h     |   14 ++
 target/ppc/trace-events  |    1 
 10 files changed, 527 insertions(+), 2 deletions(-)

--
Aravinda Prasad


