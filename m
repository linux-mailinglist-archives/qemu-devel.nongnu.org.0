Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D86BEEFE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDNj-0006nK-5w; Fri, 17 Mar 2023 12:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDNh-0006lz-Ld
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:56:41 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDNf-000201-Oo
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:56:41 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdVdY5kvsz689W8;
 Sat, 18 Mar 2023 00:56:17 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:56:37 +0000
To: Michael Tsirkin <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, <ani@anisinha.ca>, <berrange@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [RFC PATCH 4/4] tests/acpi: Updated DSDT and SSDT due to move of PXB
 info to SSDT
Date: Fri, 17 Mar 2023 16:54:40 +0000
Message-ID: <20230317165440.24846-5-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/q35/DSDT.cxl                | Bin 9673 -> 8474 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9470 -> 8429 bytes
 tests/data/acpi/q35/SSDT.cxl                | Bin 0 -> 1235 bytes
 tests/data/acpi/q35/SSDT.viot               | Bin 0 -> 1077 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index f049f414f0e789324e82916cfd0aa955211408c4..88783c368d3afeea2fd20e9e72e4807436aeb78d 100644
GIT binary patch
delta 24
gcmX@<J<Ey9CD<iIN|Awq@$W`1N!iVp6u&bA0AK?L^Z)<=

delta 1139
zcmeH{v2W8r6vm(JsJK@*a!LdO5fwoZYeHL?P-EXA5yc5noT^AcIy>=Dl*K|~C{g8#
zg(yr>fPsayct?mCv9NSQLQF`7zkvk?TJz3sBM@Qhh==#yec!uxmhPu}Ztj)|vsq*J
z5`gshH93<D*uoudo4on3e34r0hRRn<jO?l0G^--rEU{UG)=K$&;VP({me`yoYsLqn
zilC_6V0BRK)mjZy+NfJ`P2-wE)=KkRHcj<AK-pShRMiH<^~_14H!GhPzt5j5K3f~S
zo60BJ%%^Ybci;CbZ?8W&tFL_g+3%1P?z)0m#k}Z?;B*}_KlpMv5RN!CR>i@-Bm5Cd
z{d1az4NEvp$Gj}|E#Uwvie(%?H$@?d5O%iHVpWKLpb&Pl#c5uvH^85hw;UhbooaC6
zsY|x}2QHDJ<#+G7Eg%ZCNBXdhUDGK5t6FB@2|*eQ1`3&Bo5*9uJXDmiLc#MlH(Er8
znJ9vu2jF*IoZa&z@V%bn!hJV%0=$a4onceNd2|{;lOXx_qiAJ6DU0yCbN(QT_`xLS
zB|71uBSUW%WDVQ);44N2HbDP_kUWhEX%a0#1k-UNGI(|BKN4+nOh^<FiC`iU4qp6=
riAZdtv-1}c8l;bqSV*3X9KCH-jsVc(N8%b}Rc<#72&Fd{azB(`uhcHS

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 3ad4d26b7f5c183fd3e146b67ebb23662b5108eb..cf9d844c065fc1eeebf6dedd9883f58b917cf0ac 100644
GIT binary patch
delta 24
fcmez8`PPxkCD<k8tpWoBqu)j@N!iUNil>+XZh;5U

delta 717
zcmaFs_|KEeCD<k8p9%v5<Km56lCp+gqA~HoPVv!Aj-mn1#s(bmp`I>WK+4I<4@7x*
zy6`w&;NswjcZRT-C(d<bl%IItrrv=wJ|HNBp+JbKA)$aFagiVU)I_d^f~rI=CWfSf
z>Y~IX1}<iX<OKqglYxpjSr{06{JdQlQa}QXZ~;f4fZ*h0E+)8$6I6s5F5=9PQczo&
z#3jJM{r^8hM+yT&L3Lsr(D05FMuvivj)X*p(!?bRKsN>j3yN|Hb?`DU@h~tj7yu#A
zqYRY{0w~@zf_hT{;!Pkmq`j%Ypn%nzhEQ(`K)ea02Cp}D2*;)Xg8<Z<o0ViwGXns!
CTCXku

diff --git a/tests/data/acpi/q35/SSDT.cxl b/tests/data/acpi/q35/SSDT.cxl
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..598c4751f629eb7766d978566a906701b7ca5acb 100644
GIT binary patch
literal 1235
zcmeHHU2D@|6h29dX793+ZUsS<4crfCx7A&ZHF;lQWoZ|hjuj>(X@hL^Cdj;)WjOT0
z(mNOR)@<f)2wwODgdtuC!{6YIH*WEqW)?r{9}r*2Ifv&tUvM5`+oE}z1(2Q?8+^^4
zvswnwlkhWI7ALQX`MZv7INOicZ*f!HQJl@HU}uVB7<F=MRWYS=t6D6UZiC|Rs+d+~
zRe#SEG8x6uMFSLj)3QL}&4xLQ`7q{CFmuj^&9j3paIsa2>guy_CqKiq?b@fsud_EQ
zFSqvew<{m-rRd~`FFU*M2DLXU&#!B%r{4x$mc_aS^a}dLfQ;L7*{mCBN8zq?KwXDi
zDVjM7hjfZ*#8CbMtu`#A?E;r_B9Z;;Kot{~a3D1(Q{56a;1rax0jKU|iA>x*&ZV<x
z$5PxaR3;p&(S%@HK6C@{PU=@*c<eBE=rI}ELGQlT29|+Nq=g+!n!v-D^>qP00n!N2
z5y*!fCXW!~63L7Z4t{X3-)0(2CJFR?fS~7L@4hcV;P+h*9(b{f*J{{#afP{0uK}oZ
zZF=WPvU;9|75JH%yGRn}VjS}tnfQ{Cp+5z(ifL!?8Eppke-lxWry^2Q5uy7pqJK<8
u6%^5<u_AI&DzC<h=op!kKSZQL?uUrx)Bn&--ZE>yXl5A-ieoo*h^6n_kVX&y

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SSDT.viot b/tests/data/acpi/q35/SSDT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6a746d34b01b87bc054093cd38801fddadb2daad 100644
GIT binary patch
literal 1077
zcmeH@KWoB37>D0Pi}7mV{I?a%M=(mEOTk<+Xlr9I76l7QG?W&XqqKt!f^-UwhIUSi
zAEY0lTZev-j`q$3htkE}JMMnR^S*a*k7en-lQe*EN;+E8lFb1DJ_NSNz|?r+^YXQA
z5qtQomd#eZD%n>p9kC$9;L&X9IrS4slC8z3RH>b@JC>GSOhD87N@N^_xA`K%!^`jb
zPvyAr+J8_#&c1FI6O?8RHI@>~I^~<=JE-DBcp2UaGk$$jQ=;NB+>~R6d4)QhyyarV
zpHfznQX^}d-5$__ICm(x??&duMRWS(A`wQ^zjsG~QZSBiIA%>*_WQPRp@YYPumvgu
z`EZQHEg=a>ZHWdRolQpw!{K@jfd@c+m%SZ$0#Gk-TzGU>4)fBr@?}&AjzG*Yp;b1y
m;^`l?wM4BPt7WlQyQ5ke<bTyFiCP@1WwBSgqgo6&QTq#m&k+y+

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 0307b25f93..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/SSDT.cxl",
-"tests/data/acpi/q35/SSDT.viot",
-- 
2.37.2


