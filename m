Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD93C3E4E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:23:33 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2dAy-0003eW-MW
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2d2z-0006gx-Tt
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:15:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2d2v-0006wu-F4
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:15:17 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16BH5JIc127259; Sun, 11 Jul 2021 13:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Gs4IYYf06Ksv38HdGLJg/HmcTVh6T5Amaod7L/xVaZM=;
 b=C2Bhl6mMgPvlYD/qg8d9KIUM8aT5XSx75EQmehYLh0aZ1FS7QrexJfcY3UnV2enFHgYp
 suXzuUFiwuwPPx7dB/2csVCSKZH+5fBQzgumT0sISFhwoZ4RhXujWnpa8xHOlrq4Ucaq
 TW9fDqchcbPKvnUAlkCRsvmi4inW5XlIoEhPazm8OSVeImk9CY0dM7P3xrDjiyF8+FkL
 6F2BLvkgNfsnKwvzVoJGbJFaga0VkyRt9VoCU3upgQV1dWPi3RnAL0+ltYZgvQ4t9h/S
 TacEBHqpsCApzshyI9N0jrTEigyYPtulnSYTtU1suYKXxIWGXrgk0vGWbnFht7SzByjQ 9g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmb3bqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 13:15:10 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16BHCCJW013349;
 Sun, 11 Jul 2021 17:15:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 39qt391mea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Jul 2021 17:15:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16BHF8Q114942646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Jul 2021 17:15:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72D96112061;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 662B9112064;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 11 Jul 2021 17:15:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Merge tpm 2021/07/11 v1
Date: Sun, 11 Jul 2021 13:14:57 -0400
Message-Id: <20210711171506.39375-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _2SUT4N-xQdAbaBAMRx3PcDu6R09OmTK
X-Proofpoint-GUID: _2SUT4N-xQdAbaBAMRx3PcDu6R09OmTK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-11_10:2021-07-09,
 2021-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107110141
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This series extends TPM-related ACPI test cases to also verify the TPM 1.2
ACPI table 'TCPA'.

   Stefan

The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)

are available in the Git repository at:

  git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-07-11-1

for you to fetch changes up to a1b5cc4a84164bc36d355853a11b706ed52bce15:

  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs (2021-07-09 09:13:16 -0400)

----------------------------------------------------------------
Stefan Berger (9):
      tests: Rename TestState to TPMTestState
      tests: Add tpm_version field to TPMTestState and fill it
      tests: acpi: Prepare for renaming of TPM2 related ACPI files
      tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
      tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
      tests: tpm: Create TPM 1.2 response in TPM emulator
      tests: acpi: prepare for new TPM 1.2 related tables
      tests: acpi: Add test cases for TPM 1.2 with TCPA table
      tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

 tests/data/acpi/q35/DSDT.tis.tpm12              | Bin 0 -> 8465 bytes
 tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12              | Bin 0 -> 50 bytes
 tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                  |  20 ++++++++++++++------
 tests/qtest/tpm-crb-test.c                      |   5 +++--
 tests/qtest/tpm-emu.c                           |  24 ++++++++++++++++++------
 tests/qtest/tpm-emu.h                           |  11 ++++++++---
 tests/qtest/tpm-tis-device-test.c               |   3 ++-
 tests/qtest/tpm-tis-test.c                      |   3 ++-
 tests/qtest/tpm-tis-util.c                      |   2 +-
 11 files changed, 48 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1


