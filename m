Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D03BEA6D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:10:06 +0200 (CEST)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Bd-0000aY-8D
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195S-0001OG-H8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195Q-0006jE-5j
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pFTVTujNQpdEdgDou9qsJXXUf6vIKP2GI2FiHwKr+24=;
 b=bAu5N5SAB92DYAZiA+6GlYbSdyeAIEXzUIa4ipJVypH+91FlihazxWX0syr3DOfTRrIHvK
 5ZIcJcN9bgITyxGFYjwvznSGkw5m+TvdX2pYTINS291ycLfkVicOcH7L2dsWH3SlfeAzrH
 0G4XSRbz7oShTu9nwXYvuBK5pWG8ooQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-L2rw_o_UNkSxnJq1MNaTaw-1; Wed, 07 Jul 2021 11:03:38 -0400
X-MC-Unique: L2rw_o_UNkSxnJq1MNaTaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x8-20020a5d54c80000b029012583535285so879923wrv.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pFTVTujNQpdEdgDou9qsJXXUf6vIKP2GI2FiHwKr+24=;
 b=Vm2oGefHqr3hBFnwzkDVjRQ7ON0aUP0DAhI7jqvabLdXXzOX+qs9vCfHF10zLhrv76
 o8DJ+bextUJsmNDmeqKI2jfkdUCq+8y95Hgk26VccG5Q5CNqgmGiKHJhfhnONboT8yf0
 LKy7UEyV93zG4HGt2ZJovQQE0fhkc77/z8TnrkKrQDiIT+HGTw7+hHdtzkSLSk0XtxUq
 62bRuNa4QDaDtyyrjPnT/7RVO63BtnuNTMXkeDj+cOXMFa07ndf1jGKM9nYbZhFCOruf
 +oRfAo9Znq0V3V+3ADZT3/kMPRIvrEbEHsuaAIql+L5rfS0FJzaoGt3jHOK8rt66Ghhc
 /3rg==
X-Gm-Message-State: AOAM5315GOBzWSxRHvBIOmMMZKzz5BNhxMUKxMT4w8PocEYJSBxphacz
 q3WMMpL4YEK1Sv8ksbSVy5H0R3EXeso9zuWVeJtUG/Tk0ixRKix66pgoFSgICS3B4lMXf6pwy6v
 ic/eR6V46Wj63soAgN1i2mAjnWYyiA8+aOSK0uCunbWDT21mYRzb6Wzg8upwk
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr36003wmq.121.1625670216618; 
 Wed, 07 Jul 2021 08:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3jU9Jlm+H5v4S978CI4HD496z/uKhW3V5K0tLSx9QXDHaRFmlRfkZWCmkv9B0JipteRwkkg==
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr35973wmq.121.1625670216401; 
 Wed, 07 Jul 2021 08:03:36 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id w1sm19535476wmi.13.2021.07.07.08.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:35 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] tests: acpi: pc: update expected DSDT blobs
Message-ID: <20210707150157.52328-11-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Sucaet <john.sucaet@ekinops.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20210624204229.998824-4-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


