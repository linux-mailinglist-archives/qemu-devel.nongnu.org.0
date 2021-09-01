Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E83FD984
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:26:16 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPJn-0000r2-LY
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPFv-0003tb-I7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17074
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPFt-0002zc-Le
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:15 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181C2pQh004340; Wed, 1 Sep 2021 08:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=l+SlO+A75XHC3ejAq8vIFyp+vmprTmgzfWYr6ThR+i8=;
 b=GFuLLK1d7jarKFUyVDk/Wnt6F9DPVCRa4iQ7Z7n0OPZlnbB42bLkm+q9L2ytH9S+MrWW
 n4zhYoh+NIKcivN4TKK5S0DdUlHpyWN+vzKH9ZDIhZ0k/ng3HBGeUpzYsdpylvJFFhP+
 ne+rcEnsDC35Q+osUHZkjOrf/vHbG+XSVEzGauzamvLmohXnm+2E54/zTq3Gxis4xZ+i
 zSnZ+af5JJCiFxH4Gkft5C8yi2B+Hfqkcm6afsgTxRQ1QGq5TVcNIRzWFI007v1XII+1
 /o1rOSfRP9Gcqrmaw8jCbGqdbxhztW9V9wxxyM6iBk2QjUGdN08Exh3weiZansmCne3Z rw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at9520mgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 08:22:10 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181CBhkd021360;
 Wed, 1 Sep 2021 12:22:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3aqcscpkyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:22:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181CM8eo30343580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 12:22:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8FF9BE05A;
 Wed,  1 Sep 2021 12:22:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65B7DBE04F;
 Wed,  1 Sep 2021 12:22:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 12:22:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 00/10] Merge tpm 2021/09/01 v1
Date: Wed,  1 Sep 2021 08:21:33 -0400
Message-Id: <20210901122143.1867023-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AY8uqBz6lpwlmnSGCrB1f9d3c1BjJWey
X-Proofpoint-ORIG-GUID: AY8uqBz6lpwlmnSGCrB1f9d3c1BjJWey
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=976 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds an ACPI test case for TPM 1.2 support.

   Stefan

The following changes since commit d52dff5d8048d4982437db9606c27bb4127cf9d0:

  Merge remote-tracking branch 'remotes/marcandre/tags/clip-pull-request' into staging (2021-08-31 14:38:15 +0100)

are available in the Git repository at:

  git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-09-01-1

for you to fetch changes up to 75539b886ade79a30365badf95831bd5b3068342:

  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs (2021-08-31 17:33:12 -0400)

----------------------------------------------------------------
Stefan Berger (10):
      tests: Rename TestState to TPMTestState
      tests: Add tpm_version field to TPMTestState and fill it
      tests: acpi: Prepare for renaming of TPM2 related ACPI files
      tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
      tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
      tests: tpm: Create TPM 1.2 response in TPM emulator
      tests: acpi: prepare for new TPM 1.2 related tables
      tests: Use QMP to check whether a TPM device model is available
      tests: acpi: Add test cases for TPM 1.2 with TCPA table
      tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

 tests/data/acpi/q35/DSDT.tis.tpm12              | Bin 0 -> 8894 bytes
 tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12              | Bin 0 -> 50 bytes
 tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                  |  26 ++++++++++++++++----------
 tests/qtest/tpm-crb-test.c                      |   5 +++--
 tests/qtest/tpm-emu.c                           |  62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 tests/qtest/tpm-emu.h                           |  20 +++++++++++++++++---
 tests/qtest/tpm-tis-device-test.c               |   3 ++-
 tests/qtest/tpm-tis-test.c                      |   3 ++-
 tests/qtest/tpm-tis-util.c                      |   2 +-
 11 files changed, 97 insertions(+), 24 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1


