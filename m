Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9542B0BCB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 11:46:13 +0200 (CEST)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Lg4-0006Hu-Gt
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 05:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bala24@linux.ibm.com>) id 1i8LRi-0000D9-Ur
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bala24@linux.ibm.com>) id 1i8LRh-0006mJ-BI
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:31:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34548
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bala24@linux.ibm.com>)
 id 1i8LRh-0006m4-6v
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:31:21 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8C9IY9X059410
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 05:31:19 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uyj88jssy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 05:31:18 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <bala24@linux.ibm.com>;
 Thu, 12 Sep 2019 10:31:16 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Sep 2019 10:31:13 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8C9VDkM45940848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 09:31:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC5FDAE045;
 Thu, 12 Sep 2019 09:31:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62772AE061;
 Thu, 12 Sep 2019 09:31:11 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.221])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 09:31:11 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:00:51 +0530
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091209-0012-0000-0000-0000034A5C83
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091209-0013-0000-0000-00002184C845
Message-Id: <20190912093056.4516-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=736 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v3 0/4] add Homer/OCC common area emulation for
 PowerNV
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
Cc: maddy@linux.vnet.ibm.com, groug@kaod.org,
 Balamuruhan S <bala24@linux.ibm.com>, anju@linux.vnet.ibm.com,
 qemu-ppc@nongnu.org, clg@kaod.org, hari@linux.vnet.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

This is follow-up patch that implements HOMER and OCC SRAM device
models to emulate homer memory and occ common area access for pstate
table, occ sensors, runtime data and slw.

Currently skiboot disables the homer/occ code path with `QUIRK_NO_PBA`,
this quirk have to be removed in skiboot for it to use HOMER and OCC
SRAM device models along with a bug fix,

https://github.com/balamuruhans/skiboot/commit/a655514d2a730e0372a2faee277d1cf01f71a524
https://github.com/balamuruhans/skiboot/commit/fd3d93d92ec66a7494346d6d24ced7b48264c9a0

This version fixes a review comment from Cedric in previous version,

changes in v3:
    * pass on PnvHomer *homer directly to core_max_array() function
      from the caller.

v2 patchset:
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg02231.html

changes in v2:
    * change to PnvHomer/PnvHomerClass instead of PnvHOMER/PnvHOMERClass
      for better code readabililty.
    * fabric link to chip to use `nr_cores` from PnvChip struct for
      core_max_array() as we need to consider active cores in chip and not
      whole machine.
    * declare variable well ahead instead in for() loop syntax to make
      all compilers happy.
    * change to shorter variable name to `hmrc` instead of `homer_class`.
    * remove `homer_` prefix for regs as it is not useful.
    * have separate commit for checkpatch.pl coding style warnings.

v1 patchset:
https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg01610.html

changes in v1:
    * breaks it to have separate patch series for Homer and OCC
      emulation.
    * reuse PnvOCC device model to implement SRAM device.
    * implement PnvHomer as separate device model.
    * have core max base address as part of PnvHOMERClass.
    * reuse PNV_CHIP_INDEX() instead of introducing new `chip_num`.
    * define all the memory ops access address as macros.
    * few coding style warnings given by checkpatch.pl.

rfc patchset:
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg00979.html

I request for review, comments and suggestions for the changes.

Balamuruhan S (4):
  hw/ppc/pnv_xscom: retrieve homer/occ base address from PBA BARs
  hw/ppc/pnv_occ: add sram device model for occ common area
  hw/ppc/pnv_homer: add PowerNV homer device model
  hw/ppc/pnv: fix checkpatch.pl coding style warnings

 hw/ppc/Makefile.objs       |   1 +
 hw/ppc/pnv.c               |  87 ++++++++++++---
 hw/ppc/pnv_homer.c         | 272 +++++++++++++++++++++++++++++++++++++++++++++
 hw/ppc/pnv_occ.c           |  78 +++++++++++++
 hw/ppc/pnv_xscom.c         |  34 +++++-
 include/hw/ppc/pnv.h       |  21 ++++
 include/hw/ppc/pnv_homer.h |  53 +++++++++
 include/hw/ppc/pnv_occ.h   |   3 +
 8 files changed, 528 insertions(+), 21 deletions(-)
 create mode 100644 hw/ppc/pnv_homer.c
 create mode 100644 include/hw/ppc/pnv_homer.h

-- 
2.14.5


