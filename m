Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755933A83DB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:23:58 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAuz-0003DE-I0
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtR-0001BF-Po
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtN-0006Ls-KX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:21 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FFDFHQ183419; Tue, 15 Jun 2021 11:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=F6I1aJEtu5u8E20fWQMo8CpGcUJV6NjFxJ78Y8UJS8M=;
 b=br3hiZNKoNCF5jXeEmztvvKCte3dwQgrDzZRy6G68EwbrTYGqeGqAYqymWK86HJL6RwQ
 Nehl/AhPclOr2DB3A1W3HISZ+b1RxT5FFRwqRCZOff9WSqU4YNay9w9+sVcUYvLBEgHZ
 pGaUw/Emhi1k5iClHx6J1Rh4UFh2ft7nK6a1jm+EMoiHnkUqlvlcoOEKLyPcgR9tWC4C
 k7hm3wqbLnygE4dcVIL13FmyXCzJFYHLxxdm0ycobkKhb90MaZrGslDLR5bw11TfVdKF
 FtzaTYv36U1jn6erqYNFnVl22GF/A+pp6wBvtLrN1RVAAA2O73unaeeGhvVJ2BBSjc6V JQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396xbx8sr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:22:13 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FFBwQ2024157;
 Tue, 15 Jun 2021 15:22:12 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9gxre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 15:22:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FFMBBb32571764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 15:22:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49B777805E;
 Tue, 15 Jun 2021 15:22:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 082327805C;
 Tue, 15 Jun 2021 15:22:10 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 15:22:10 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 0/5] Merge tpm 2021/06/15 v1
Date: Tue, 15 Jun 2021 11:21:47 -0400
Message-Id: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bLgH5EvBQGwrIIyoHBHdcoYyR8EZDobg
X-Proofpoint-GUID: bLgH5EvBQGwrIIyoHBHdcoYyR8EZDobg
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 mlxlogscore=874 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106150095
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hello!

The patches in this PR eliminate all TPM related code if CONFIG_TPM is
not set, thus reducing code size.

Regards,
   Stefan

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)

are available in the Git repository at:

  git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-06-15-1

for you to fetch changes up to caff255a546d12530cf7c28e60690cd0e65851fd:

  tpm: Return QMP error when TPM is disabled in build (2021-06-15 10:59:02 -0400)

----------------------------------------------------------------

Philippe Mathieu-Daudé (1):
  tpm: Return QMP error when TPM is disabled in build

Stefan Berger (4):
  i386: Eliminate all TPM related code if CONFIG_TPM is not set
  arm: Eliminate all TPM related code if CONFIG_TPM is not set
  acpi: Eliminate all TPM related code if CONFIG_TPM is not set
  sysemu: Make TPM structures inaccessible if CONFIG_TPM is not defined

 MAINTAINERS                  |  1 -
 hw/acpi/aml-build.c          |  2 ++
 hw/arm/sysbus-fdt.c          |  4 ++++
 hw/arm/virt-acpi-build.c     |  6 ++++++
 hw/arm/virt.c                |  2 ++
 hw/i386/acpi-build.c         | 20 ++++++++++++++++++
 include/hw/acpi/tpm.h        |  4 ++++
 include/sysemu/tpm.h         |  9 +++++++++
 include/sysemu/tpm_backend.h |  6 +++++-
 monitor/hmp-cmds.c           |  4 ++++
 qapi/tpm.json                | 28 +++++++++++++++++---------
 stubs/meson.build            |  1 -
 stubs/tpm.c                  | 39 ------------------------------------
 13 files changed, 75 insertions(+), 51 deletions(-)
 delete mode 100644 stubs/tpm.c

-- 
2.31.1


