Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03D4DDB00
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:54:31 +0100 (CET)
Received: from localhost ([::1]:39436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD3m-0007lv-SF
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:54:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCey-00083h-17; Fri, 18 Mar 2022 09:28:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nVCeu-00031E-T2; Fri, 18 Mar 2022 09:28:51 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICntd2003688; 
 Fri, 18 Mar 2022 13:28:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s54bjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IDLhTW001924;
 Fri, 18 Mar 2022 13:28:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s54bhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDP8Ef015072;
 Fri, 18 Mar 2022 13:28:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk595m19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:28:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22IDSYhp46072230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:28:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10B594C046;
 Fri, 18 Mar 2022 13:28:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E734C050;
 Fri, 18 Mar 2022 13:28:31 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Mar 2022 13:28:31 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.93.169])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B44E02201E8;
 Fri, 18 Mar 2022 14:28:30 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 00/17] hw/sd: Rework models for eMMC support
Date: Fri, 18 Mar 2022 14:28:07 +0100
Message-Id: <20220318132824.1134400-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UVadVOyVuhzIORb_t5MWRwDdJUP_Q2UP
X-Proofpoint-GUID: q-AX57mNG6E1mmS6bnVkR5yKu8y7Y5uA
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=432 suspectscore=0
 malwarescore=0 clxscore=1034 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180074
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, Joel Stanley <joel@jms.id.au>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Philippe,

I am restarting the discussion we started in :=20

  http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D250563

This series adds an extension for a new eMMC device using the
framework you put in place. It's not perfect but we are getting close.
The SPI variant would need its own class I suppose and there are more
cleanups to be done in the set of commands. Please comment !

Thanks,

C.

C=C3=A9dric Le Goater (2):
  hw/sd: Add eMMC support
  hw/sd: Fix SET_BLOCK_COUNT command argument

Joel Stanley (3):
  hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
  hw/sd: Support boot area in emmc image
  hw/sd: Subtract bootarea size from blk

Philippe Mathieu-Daud=C3=A9 (9):
  hw/sd: When card is in wrong state, log which state it is
  hw/sd: Move proto_name to SDProto structure
  hw/sd: Introduce sd_cmd_handler type
  hw/sd: Add sd_cmd_illegal() handler
  hw/sd: Add sd_cmd_unimplemented() handler
  hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
  hw/sd: Add sd_cmd_SEND_OP_CMD() handler
  hw/sd: Add sd_cmd_ALL_SEND_CID() handler
  hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler

Sai Pavan Boddu (3):
  hw/sd: Update CMD1 definition for MMC
  hw/sd: Add CMD21 tuning sequence
  hw/sd: Add mmc switch function support

 hw/sd/sdmmc-internal.h |  97 +++++++
 include/hw/sd/sd.h     |  10 +
 hw/sd/sd.c             | 585 +++++++++++++++++++++++++++++++++--------
 hw/sd/sdmmc-internal.c |   2 +-
 4 files changed, 583 insertions(+), 111 deletions(-)

--=20
2.34.1


