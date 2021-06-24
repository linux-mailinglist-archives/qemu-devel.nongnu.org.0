Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F63B3829
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:49:48 +0200 (CEST)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWIG-0003On-0O
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBc-0004fk-SI
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBa-0003lF-OI
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624567374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WIO6kNFQ0f+A7WBHrBd8C89U6ptT/w0q/txT1i2LN7w=;
 b=i/mEElXwOeTW8csrAIi515krmO1m/vsQP4/catspgbEZVHkwFHlHvG8wkbi56ujLhvHfmA
 iqS3V4Wwm/vyH/G2UHAbojV1vPk4KcQefLaWrLKiOORdXPbN9olOnmyZJDUwaoKNqzszps
 YpEQMl/rkkX3Wt0mbg03mMgcADJ9deM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-gTPqEyZ4PHukjJYE7ZEpcA-1; Thu, 24 Jun 2021 16:42:50 -0400
X-MC-Unique: gTPqEyZ4PHukjJYE7ZEpcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B90801596;
 Thu, 24 Jun 2021 20:42:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC5C85D6AB;
 Thu, 24 Jun 2021 20:42:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests: acpi: pc: update expected DSDT blobs
Date: Thu, 24 Jun 2021 16:42:29 -0400
Message-Id: <20210624204229.998824-4-imammedo@redhat.com>
In-Reply-To: <20210624204229.998824-1-imammedo@redhat.com>
References: <20210624204229.998824-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, john.sucaet@ekinops.com, mst@redhat.com,
 stefanha@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@@ -930,20 +930,20 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
-                Name (_SUN, Zero)  // _SUN: Slot User Number
+                Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (_SUN, 0x02)  // _SUN: Slot User Number
+                Name (ASUN, 0x02)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }

                 Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State

with a hank per bridge:

@@ -965,10 +965,10 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Device (S18)
             {
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Name (_SUN, 0x03)  // _SUN: Slot User Number
+                Name (ASUN, 0x03)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  10 ----------
 tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7327 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8668 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6466 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7656 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5969 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6074 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7361 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5860 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6008 -> 6008 bytes
 11 files changed, 10 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 6c83a3ef76..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,11 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.hpbridge",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index b9dd9b38e4ef720636ba19ccbdf262de8a6439d5..cc1223773e9c459a8d2f20666c051a74338d40b7 100644
GIT binary patch
delta 61
zcmeyQ_eqb-CD<jTNSuLzao$F*B3?$v$+f%^5{|*4e$h={EWw5b@f`7vE<rpD3``6h
Rj+58&N-{cbKF+(E695!d5Lf^J

delta 59
zcmeyQ_eqb-CD<jTNSuLzQEekv5ie_eaHt={WI;YDAupC-LxXsZct@8Y9tH*`29Eg2
PYk4IZ<2N7YUCjvq#N-aK

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index cba5a1dcb0464e56753bc0b931a4dd2e3b209787..2d0678eb83277088b156d386067429b0f29f9338 100644
GIT binary patch
delta 100
zcmbPlIp31YCD<ioz6=8cWAsL@`9j`~!J&Q(BI5Bb!M;380)S*jW>&USu&WP9BD%?o
fCD_m)o+IATC5VTCfr)_wB+SKxRm0{lLaR9eXLTFp

delta 62
zcmbPlIp31YCD<ioz6=8c<KvB7^MzRBgG2ooCff;1iF>gG8yduO#5=kK@h~tjF>rvS
QxR@rdlak#0LuffC015RFTL1t6

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index a9b4d5659457f6de30b993962bce673c9413d81d..77778c3a69946efd501e7eff0a73af309b553f13 100644
GIT binary patch
delta 73
zcmccPe8-u~CD<k8jv@mCW6wse5?)5f$@RPv5{|*4e$h={EWw5b@f`7vE<rpD3``6h
Yj+58(N&=Of<TV76zd`KHqI}1N0R$Tq1poj5

delta 71
zcmccPe8-u~CD<k8jv@mC<Bg46CA^IBlk0gUCg0~{6Y^pSHZ+Lmh<9`e;$dK5V&I6M
Xyq;GQsNf{8A&~qHVs94ZJ1z_W`ZyF*

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 8d86155e275aa688f8767dd92c4b9df08b4a18ad..af046b40b0a150b4ab1e113bd9d77912c707074f 100644
GIT binary patch
delta 61
zcmX?PbjXOyCD<jzNs@tqk!d5B6F;NlWM6&>3CG}2zvw0}mS97Jc#e2SmmnSn1||j$
R$H}$)l8la<r}MAo1OUh?4t@Xt

delta 59
zcmX?PbjXOyCD<jzNs@tqv1=oj6F+NwaHt={<cIuHLS8Jvh6eE*@s2J*JPZs>3>@*3
PYxyM^<2O&|U(E>s%3KcC

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index e00a447f92b27f9a91be802eb11fe89dc0457e20..b56b2e089017f933f8a3089c4fd2389fb8ef1e40 100644
GIT binary patch
delta 100
zcmaE1{lc2dCD<k8g)9RD<C~3KFND1vgG2ooM8xA=f_-_G1OUm5%&csuU{@cIM0ArE
fOR%9qJV(5vOArqO0}}%WNSKQWtA@?CBC9z80jwPB

delta 62
zcmaE1{lc2dCD<k8g)9RDW64IY7s9OZ!J&Q(lleuZ#JyO84GrQs;vHRrco-O%7&t&u
OTueYYiOmioD>wlr;t!7i

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 5d8ba195055f2eda74223323baeb88390ea36739..bb0593eeb8730d51a6f0fe51a00a00df9c83c419 100644
GIT binary patch
delta 78
zcmcbpcTtbaCD<h-P@I8*aq32{B3?$v$+f%^5{|*4e$h={EWw5b@f`7vE<rpD3``6h
fj+58&N&=M}=QUshDdA$C+{i1!=(t&k&z=(iB>@v8

delta 74
zcmcbpcTtbaCD<h-P@I8*@!>|UB3{<`;7~t?$&P$dLS8Jvh6eE*@s2J*JPZs>3>@*3
b*YZj-#!o)ZYrqCl#>EU&C%0Le&x{iQ&x;Zm

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 01e53bd436698db6f6adfff584ec56cb99074a5f..2e618e49d357ae1d0ac20d822f71d676ea90f2fc 100644
GIT binary patch
delta 53
zcmdm`ze}IXCD<iompB6hqtQmLUA(N0!J&Q(lOOVlFgi}Y$1BDL;&U-U1UB>Yt>y#(
Dp7{>n

delta 49
zcmdm`ze}IXCD<iompB6h<F1WdyLegSgG2ooCO_npn*5kokPXD+Vghm{HVg5s-~<4L
CZ4W5`

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index b8103799b45224c08344369931b87cf3b7797d7e..c32d28575b967aff40afb9138822ecd3186dd4ce 100644
GIT binary patch
delta 65
zcmX?TdC-!}CD<k8pbP^8<AjY|2ZdN2gG2ooCNm0)NPt+;O<pX)h6eE*@s2J*JPZs>
T3>=P={|HGkI&KydUd;&rQ4bK$

delta 65
zcmX?TdC-!}CD<k8pbP^8qr^t8gF>wF!J&Q(lNp6YCOe3*33;&u8yduO#5=kK@h~tj
UF>u6B{v#v_lw#Q|DZGLc04$Uc4*&oF

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index d4f0050533f970128774f825274177096a46c3b8..623f06a900d12500d2197d101f76f6875e92ed64 100644
GIT binary patch
delta 61
zcmaE&`$U(^CD<k8i5LR|W5!0VCp?Ufli%}5NH_+E`b9T+u>>0$#B;<ux&-ksFfcK2
RI8K)5m1K0>Y{|Qt696|m5IX<>

delta 59
zcmaE&`$U(^CD<k8i5LR|<A;r0Pk0#PC%@;Bm@Lo7CgjBuY-kYA5%1^{#KXYA#J~|h
PS)NytF@Ccp?`lo}8wn4|

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 8632dfe8a8bdd991871a1e633162eb9a2e1497ea..f0a3fa92de94f55d5406f0fafce331776dbb0317 100644
GIT binary patch
delta 100
zcmeyN_d}1%CD<jTLY#qt(PJZ51+TYbaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&?
f2{tr{=ZJT73F2X3U}E3^33D-F)v)<2?`lo}e)Jpa

delta 62
zcmeyN_d}1%CD<jTLY#qt@xn%~3SQRu;7~t?$@BT7#JyO84GrQs;vHRrco-O%7&t&u
PTueYYiOm;yS8xIVCQlHc

-- 
2.27.0


