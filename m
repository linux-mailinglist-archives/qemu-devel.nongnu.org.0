Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D62615128
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opvVy-0005wS-7U; Tue, 01 Nov 2022 13:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1opvVv-0005sj-Kp
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:57:27 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1opvVt-0000vt-UQ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:57:27 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1yNR0vj0z686wr;
 Wed,  2 Nov 2022 01:55:19 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 18:57:22 +0100
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 17:57:22 +0000
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <linuxarm@huawei.com>
Subject: [PATCH 2/2] tests: acpi: Fixup for tables in Arm HMAT series
Date: Tue, 1 Nov 2022 17:56:50 +0000
Message-ID: <20221101175650.370-2-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101175650.370-1-hesham.almatary@huawei.com>
References: <20221101155505.000003fe@huawei.com>
 <20221101175650.370-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Updates to issues with earlier patches in the pull request:
tests: virt: Update expected *.acpihmatvirt tables

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/APIC.acpihmatvirt | Bin 396 -> 412 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
index 873e12f67c3838351a3ab4b7a43ee76e7730849a..68200204c6f8f2706c9896dbbccc5ecbec130d26 100644
GIT binary patch
delta 90
zcmeBSp2N)L7~ttVhmnDSrF$ZmHAesg1WYz$v=)W3!4x-82B?aG5hTM0V!;4+z{GoA
RY#<(Yz+^2(ugL|BG5{#E3(f!l

delta 46
wcmbQk+{4V}7~tvL!^ptEyk;VoHKWf&H!mh`pNZ4J<TDUC*^JR^atosb02x#aR{#J2

-- 
2.25.1


