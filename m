Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C326615129
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opvVi-0005h5-R1; Tue, 01 Nov 2022 13:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1opvVf-0005fR-B8
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:57:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1opvVd-0000qv-Bn
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:57:11 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1yKk4mKnz67Hqp;
 Wed,  2 Nov 2022 01:52:58 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 18:56:51 +0100
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 17:56:51 +0000
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <linuxarm@huawei.com>
Subject: [PATCH 1/2] tests: q35: acpi: Fixup for tables in noinitiator test.
Date: Tue, 1 Nov 2022 17:56:49 +0000
Message-ID: <20221101175650.370-1-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101155505.000003fe@huawei.com>
References: <20221101155505.000003fe@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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
tests: acpi: q35: update expected blobs *.hmat-noinitiators expected HMAT

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8553 -> 8691 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index c767d11cb1d088f613c49e55a7139cccababf66c..8efa1c5ded52b8a9dfbb6945a3c75cdc6ef9b277 100644
GIT binary patch
delta 459
zcmaFq^x2uqCD<k8vmyfnW9>#RZ$>5`k;y-qcGNp@2Dk+K@-A>;o1Dc^Ajr(fkWj#o
zxIk*s<P1S!E`bZ?C!YqJR{2g8f8{HA*x7eU!UFcGnOsau5(*qWT_T!0au^tZ1S3Nd
zP)qIPB!<aJJpX}!p*E2*u{N=ik&B%nu^_P{fq?<2RdsR}7khyaD-#1R&>D~dnn)%T
zBtevM1b8~TF^KTQ18K&B3=mJCDQvSg%Syh@0>V4kCWkWi35&$L2e@*?dw9C=Iywh<
z8W<RuZGI%F%DOpR{s<$Nqhd^auv5H%r@~}aMO%gFCI{(YH;Z_Vct@8Y9tH+^hUkU>
z&!9jit^_Wg=thId4~6vW*#d$B9b@!B`amoY*9p#b0&$(;TxSs11<rK=ab4kDR}j|?
z&UFKE-Qiq!5Z43F^@wgV@pf{FpDe`mL@v6CKiJI)>P}{$J4M(6oc%%=1nfcHoh&17
F1px9@hSC54

delta 280
zcmezD{L+cbCD<h-Q;~szF=iu|H{)api9R7`LB053r}zM8PlM<tHv!LJ$H^b$#V2o6
zc*QK>CpbBraYu>^TYyWjFW&+m*2x)y!dwCu%uhZIHm&lVDE`V<^02dSfupBOL{4tP
z0_DkB3=1SDXL2zu5S~;!Ie}qv0?&USU|1r^%-9Gb7#4~z5S^UG#a<x9%EZ9SkXVq=
zk;uTXBysXWCK0B-$j#fCR`T&iH(Kd4gIol3P5fj|1^vwlf;-rxq>)_8AMER7z!C50
z62!yIAisI1get43KTEuOfGbD5ho=j#qjP|#fq{V;!{nWcR-5n29%bb6V~GLzRKSg8
Q@)~(tb`iD!XTJ~z0E?YeUH||9

-- 
2.25.1


