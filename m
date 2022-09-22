Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADA5E63E9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:42:10 +0200 (CEST)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMSt-0004BF-Pr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM27-0005Xf-T6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:27 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM23-0001Fw-Mg
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:27 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYFx16mx7zMp9Y;
 Thu, 22 Sep 2022 21:09:25 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:14:08 +0800
To: <mst@redhat.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH 4/4] tests: acpi: aarch64: add *.topology tables
Date: Thu, 22 Sep 2022 21:11:43 +0800
Message-ID: <20220922131143.58003-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyicong@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>

From: Yicong Yang <yangyicong@hisilicon.com>

Add *.topology tables for the aarch64's topology test.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
 tests/data/acpi/virt/DBG2.topology | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
 tests/data/acpi/virt/FACP.topology | Bin 0 -> 268 bytes
 tests/data/acpi/virt/GTDT.topology | Bin 0 -> 96 bytes
 tests/data/acpi/virt/IORT.topology | Bin 0 -> 128 bytes
 tests/data/acpi/virt/MCFG.topology | Bin 0 -> 60 bytes
 tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
 tests/data/acpi/virt/SPCR.topology | Bin 0 -> 80 bytes
 9 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/virt/APIC.topology
 create mode 100644 tests/data/acpi/virt/DBG2.topology
 create mode 100644 tests/data/acpi/virt/DSDT.topology
 create mode 100644 tests/data/acpi/virt/FACP.topology
 create mode 100644 tests/data/acpi/virt/GTDT.topology
 create mode 100644 tests/data/acpi/virt/IORT.topology
 create mode 100644 tests/data/acpi/virt/MCFG.topology
 create mode 100644 tests/data/acpi/virt/PPTT.topology
 create mode 100644 tests/data/acpi/virt/SPCR.topology

diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
new file mode 100644
index 0000000000000000000000000000000000000000..558a1856981531b0e18e6d4aa12569cd80aa0015
GIT binary patch
literal 700
zcmbV~OA5k35JW4P_<@+UE_0Na*(d}Y$i~BZHNk$8j<`%06xH*o$1LVr?)g<q={-L3
zZSKcs$-SwP#7w$Q7oT+W$*O86UrB!d{M)jrTJASXrnUcf%@(j=xH;d-@;AWZec1Q5
zvgjgM$r49dbP=q^5=U8d5v-jhj<V<?SbIwxWzj{j4wg8|qKmrq-__rL18-2#2XL1S
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DBG2.topology b/tests/data/acpi/virt/DBG2.topology
new file mode 100644
index 0000000000000000000000000000000000000000..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/virt/DSDT.topology
new file mode 100644
index 0000000000000000000000000000000000000000..501314c91be01d927fd125e0c72e919fdd85592e
GIT binary patch
literal 5398
zcmZvg%WoT16o>EFlh__VVmr?J;S@^6vl`n?la>}@kDbINPK+mQkX*@?5QvgZB`Ty+
zA*ERq=#EBW9i&M78%V6!v17rS4gUZ;%(-)ClHYO9NEy$Wd(SuX%^YWrr|CEMr>B&P
zoiz5mZGWZlN!MGU#ZpS?ZT*>lwrAZR_>DpTc;0heH#yjDH?wuG+ooVmB?ougO=ZR^
z(wNmhUZA|HH0H$2U`-s1o55@1plt?M#lbN%cwHPEH-l^9V4{C~)7$Grmc7ol>sBhE
zWpd#4{KC95^E{>WrAev0Qa_9<%eq9-6S@lPn+M*e0e{@;+@&j2rCfi%?xZQ%t6K(9
zaB>C_OU;Ivb^Bf~y0|;Ly*)}@y*TW7=EcDs6$=mUA|kv89H9^U3L>U15S0+o&}R|e
zDvoes62k^Y6&c|j9bv>J#yBu)$Ov!z2*Z{bNnl(<Mpz#sj4_Gf0Am#yVHu4u#wA7u
z7}t>zR@(?8Au)2mSVP9TDXbAjQexzRv5t%zA|oX+iom!5j7s?B7&#9|Vw8Y!6B%Ne
z@-InL>eIk@9~p9;W~B3&1;#C8$aR{P81ulmjSRU?a}r|_7#|=*uG0yLu?&n4ks;S<
zUSg~OV*?p-ofag<Yrv=@L$1@J#JCKM1~TM2os<|?fZ+k7D%WXAV!R2ACNktYost-D
z1EYluxlX4g#=F4SM21|aGZNz}Ft(5(*XgXpaDlOn47pC{Bt{h&ZDh!GIxjJ<0pkub
z<T_oD7}tUE5i;aDU6dH>z}P{CT&GJC<0ddVz^KV}x-2nn0b>^#a-EhX#s|RI3mLn=
zbiH<X9^KupTX)x~`S7UGGf_=<F|93HHyXR=ZHd3%E0mqZuJTk{eWq5FOMgw;`dU3y
zpVFt&kf8DC_Vy=tzH*L=X*)d}sx80mDzk0Tc10C4dcPB+pc(~n3TmpDwKKz^rF0I>
z3nQIH6LV%P$fK!Is56Nl%%v{L%nc)*8BL`YNFR}=2ALG<%;+fbATv6HxYC)?)VRr{
zsX-=%I+M;QIEo!)MrU9LnbA~gnL^7TlS1?yW1eF{X5=|$GNY5H5Ix74CpD#XKG9Ta
zvCxx3^h_|%1oKRAPYTg9$vl(HlUg$Lq!2w*%#+$_bM=BtlH#5eqNl?=9p*_b9C}iS
zo@wTpW}a#8Ng;Y>m}iE0Qp<;)6ryLAd1jesmU~i&o;l{3W1iF^q9=vuIl(+9nCArd
zq!2yn=ZvZGpo;U%lUhpjq!2v|%(K8e3*3`J^ei&ZBJ-pc6g??K&q?Mv$vh{yCxz%)
zVxA@DNi8dSQiz`PW0|f{^dDl1c}{Up3ej_#c}_D=YH`t%LiC(ro-@pIhI>+op7i4q
z?&mD?q?Q;xDMZgX<~hea=eQ?@=sC|k=b0z9(CA4adM+@}1?IWHJt;)bMdrE4JgMbI
zPYTg<iFqzD&n50jA$l$|&t>LGEjoHqh@NHUS!SMP?n$BX>>syneJjn+H~mod+|Ba`
zahG08<eYTyD&qCvkxtLuSN4_02Y%0|_b~w~>=+n|-V-3|vVb!C&QW*tS%nQQL+SSg
z$a+IynSGoUHoBZe?+uW3MPQkIA*+-hc#XO`qyM2Qzd<W=Ikpqd<L|R7M*q%f8S0hw
z9eukp)LjHiemMM3|16_rc$G%14D|qJp{9kFA&pw<#XFD_3?Jz+y#&$4O7DN7lK$Op
zS0%mu-i|75rUrYyXTLa9Uh|-Gx}7-rqA=;?`<=gP|CSdwemZzu|Mm8tpT9VCY?@G|
z&m?`;9_c`H^hQmip6ZoT*6Y*!%ae!Jw=_}-W>-$9U!Fws%<jA%e55Dq{bz?i=gfY6
zkjmL%>AgYI@7Sl8%-Q_0_WR%d>NlMqXa4ET{pNK}Qzu`lvqIdm^om||b?jctXVs`*
zbm^L_IqoahC%6Z6b;=tTmqu^V^Txb4Yb5Sp)$bU$TFrqear1()q8m?o!I-6ikZ<Zd
zZoOqvk6JzIOX-d#Q;yw#me!%y@>@GArKLgZ-hS$l4j!E5Po6$-bien!d(dk*NB!eD
My@B5+&m2qr5A>`*Jpcdz

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/FACP.topology b/tests/data/acpi/virt/FACP.topology
new file mode 100644
index 0000000000000000000000000000000000000000..1f764220f8533c427168e80ccf298604826a00b4
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/GTDT.topology b/tests/data/acpi/virt/GTDT.topology
new file mode 100644
index 0000000000000000000000000000000000000000..9408b71b59c0e0f2991c0053562280155b47bc0b
GIT binary patch
literal 96
zcmZ<{aS2IaU|?YCaq@Te2v%^42yj*a0!E-1hz+8Vfh?3G2c%hmSQ^Tgg3{;|04K!<
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.topology b/tests/data/acpi/virt/IORT.topology
new file mode 100644
index 0000000000000000000000000000000000000000..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/MCFG.topology b/tests/data/acpi/virt/MCFG.topology
new file mode 100644
index 0000000000000000000000000000000000000000..f4ae3203a4e9258a397c9912332178640209637b
GIT binary patch
literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/virt/PPTT.topology
new file mode 100644
index 0000000000000000000000000000000000000000..3fbcae5ff08aaf16fedf4da45e941661d79c1174
GIT binary patch
literal 336
zcmWFt2nh*bWME*baq@Te2v%^42yj*a0-z8Bhz+6{L>L&rG>8oYKrs+dflv?<DrSKu
z#s}p4;1GkGi=-D>45YUMh?!vef$Csl%t&G&Cde(wdO>1GKm-gx_1*yTS+Iz)B8h>R
aAic=uf$S9l3b27BK>%tVNQ@mK!T<mOd=3Es

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/SPCR.topology b/tests/data/acpi/virt/SPCR.topology
new file mode 100644
index 0000000000000000000000000000000000000000..24e0a579e7d73f432a614380e29aa95113344186
GIT binary patch
literal 80
zcmWFza1IJ!U|?W6?d0$55v<@85#X!<1dKp25F11@12F>!1Bl59VJZSCW(Gzk28RDY
I01|@%0RBM>0RR91

literal 0
HcmV?d00001

-- 
2.24.0


