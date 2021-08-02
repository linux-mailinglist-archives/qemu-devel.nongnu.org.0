Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280AC3DE1FE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:55:15 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAftx-0004hQ-Ns
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfri-00020w-3Q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47066
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000gF-RK
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:53 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LXCcM071629
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dSHy/gp0WuBg0duGnw6SW4qAFwHu/ndJ38xJ8knKSS4=;
 b=ABrD97bGUj1VL9Z3w/8erd/ZF58DKKarmpvFycefnIe7HjVkmVpcCOne+5O5XjjoQNCF
 0ket3OP/9UNxMBg50K+BMGtc7fnFelQeg++NujU0SlxrA4Pi/rhAEMnWGv6UzMwwWanD
 OvWiqNmBVWmP7BObbH79JDGANppn4NILgjs+/hY+vYle5g7cqbz6fd3Mn0FRCqibuk7T
 7qP2gU6zI/dlmKftgBzbnE8Tmdprnt0FxeXIUni2hUX9VidhqhAASbSrdtkT54bsWIHf
 eA4ZoIGBpd2zVNz5d+X2HzsptmSC6gAo+AWNCOpshP/rjN+FJrX4+M8ibzNyn07gpzgn 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a6kea9mkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:49 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172LZEvr080518
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a6kea9mkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:49 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LhK7s006337;
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3a4x5ch889-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172LqlZl40763780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C89FFB2064;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0883B2067;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 05/10] tests: acpi: tpm2: Add the renamed ACPI
 files and drop old ones
Date: Mon,  2 Aug 2021 17:52:41 -0400
Message-Id: <20210802215246.1433175-6-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802215246.1433175-1-stefanb@linux.ibm.com>
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0nHp5Bs-x2P54jC2qSNjK6i3p-b9nn8k
X-Proofpoint-GUID: J1HueXoa_2x5yvTGhGDSMDAeUh4Q71pk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=864 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108020137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/q35/DSDT.tis                | Bin 8894 -> 0 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8894 bytes
 tests/data/acpi/q35/TPM2.tis                | Bin 76 -> 0 bytes
 tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 5 files changed, 2 deletions(-)
 delete mode 100644 tests/data/acpi/q35/DSDT.tis
 delete mode 100644 tests/data/acpi/q35/TPM2.tis

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
deleted file mode 100644
index d1433e3c14570bbd17b029a9aec6bc53134c3b7d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 8894
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
IX7<_t0lx)lc>n+a

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d1433e3c14570bbd17b029a9aec6bc53134c3b7d 100644
GIT binary patch
literal 8894
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
IX7<_t0lx)lc>n+a

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
deleted file mode 100644
index fe0f05987be40f1c1742ae189df7821adc522fc0..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fe0f05987be40f1c1742ae189df7821adc522fc0 100644
GIT binary patch
literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b301b8fa06..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/TPM2.tis.tpm2",
-- 
2.31.1


