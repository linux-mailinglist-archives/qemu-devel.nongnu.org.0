Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608DC3E41E4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:53:55 +0200 (CEST)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD12g-0008Rn-Fz
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD11c-0007Xk-GZ; Mon, 09 Aug 2021 04:52:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30714
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD11a-000461-1q; Mon, 09 Aug 2021 04:52:48 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1798ZRpt061981; Mon, 9 Aug 2021 04:52:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7qagy3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 04:52:34 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1798ZfCf063401;
 Mon, 9 Aug 2021 04:52:34 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7qagy35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 04:52:34 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1798mI8f002222;
 Mon, 9 Aug 2021 08:52:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3a9ht8u9mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 08:52:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1798qT5Z56426828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 08:52:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F38E11C04C;
 Mon,  9 Aug 2021 08:52:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30AD311C054;
 Mon,  9 Aug 2021 08:52:29 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 08:52:29 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 412E922003E;
 Mon,  9 Aug 2021 10:52:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH] xive: Remove extra '0x' prefix in trace events
Date: Mon,  9 Aug 2021 10:52:27 +0200
Message-Id: <20210809085227.288523-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f7BlRMenFRHS6IUCon1xm-g1Lk2_NtFQ
X-Proofpoint-ORIG-GUID: VAYib1zN5XCKP45raoIDv5QMnmkFXIlM
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1034 mlxlogscore=999 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090069
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: thuth@redhat.com
Fixes: 4e960974d4ee ("xive: Add trace events")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/trace-events | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e56e7dd3b667..6a17d38998d9 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
 xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, =
uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0x%=
02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
 xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, =
uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0x%=
02x CPPR=3D0x%02x NSR=3D0x%02x raise !"
 xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0=
x%02x new CPPR=3D0x%02x NSR=3D0x%02x"
-xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x=
%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
-xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0=
x%"PRIx64" IRQ 0x%x val=3D0x0x%"PRIx64
+xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"=
PRIx64" IRQ 0x%x val=3D0x%"PRIx64
+xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%=
"PRIx64" IRQ 0x%x val=3D0x%"PRIx64
 xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_dat=
a) "END 0x%02x/0x%04x -> enqueue 0x%08x"
 xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_bl=
k, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END =
0x%02x/0x%04x data 0x%08x"
-xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0=
x0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
-xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x=
0x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
+xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0=
x%"PRIx64" sz=3D%d val=3D0x%" PRIx64
+xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x=
%"PRIx64" sz=3D%d val=3D0x%" PRIx64
 xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "fo=
und NVT 0x%x/0x%x ring=3D0x%x"
-xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "EN=
D 0x%x/0x%x @0x0x%"PRIx64
+xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "EN=
D 0x%x/0x%x @0x%"PRIx64
=20
 # pnv_xive.c
 pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=3D0x=
%"PRIx64
--=20
2.31.1


