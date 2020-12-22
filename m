Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713762E109F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:43:48 +0100 (CET)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krrJj-0002G7-GI
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGt-0000iK-Ff
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGc-0005V2-Q3
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608680428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFH0cwCqPCVgEcaMaptGyUomCN52+5h9kuiiYvyjfug=;
 b=NZNmdRzfGSUxrPU1YEI1w+0FKb4WYPe/jYgXW3cmrIcPWLkoRR2TBNeuqsSRg5riQ2YpmU
 DMOLuIFeKZiav0mOlxMSUQvmC3Ct2XjUuKJHcq9zd8B83ceB1tW7cjWm78dm1NqbO+OzGl
 IZE44To3OConqBDChFUzP+fnEYA9QgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-yh2pAKnPO8eSy7FqNODT5w-1; Tue, 22 Dec 2020 18:40:26 -0500
X-MC-Unique: yh2pAKnPO8eSy7FqNODT5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A1C59;
 Tue, 22 Dec 2020 23:40:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99CDF5D9CC;
 Tue, 22 Dec 2020 23:40:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 5/5] tests: acpi: update expected data files
Date: Tue, 22 Dec 2020 18:39:34 -0500
Message-Id: <20201222233934.451578-6-imammedo@redhat.com>
In-Reply-To: <20201222233934.451578-1-imammedo@redhat.com>
References: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expected change is addition of
   AIDX and PDSM methods at PCI0 scope and
   _DSM methods (+ _SUN field where it was missing) to each PCI device slot

@@ -277,6 +277,54 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
             Release (BLCK)
             Return (Zero)
         }
+
+        Method (AIDX, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            PCIU = (One << Arg1)
+            Local0 = B0EJ /* \_SB_.PCI0.B0EJ */
+            Release (BLCK)
+            Return (Local0)
+        }
+
+        Method (PDSM, 6, Serialized)
+        {
+            If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+            {
+                Local0 = AIDX (Arg4, Arg5)
+                If ((Arg2 == Zero))
+                {
+                    If ((Arg1 == 0x02))
+                    {
+                        If ((Local0 != Zero))
+                        {
+                            Return (Buffer (One)
+                            {
+                                 0x81                                             // .
+                            })
+                        }
+                    }
+
+                    Return (Buffer (One)
+                    {
+                         0x00                                             // .
+                    })
+                }
+                ElseIf ((Arg2 == 0x07))
+                {
+                    Concatenate ("PCI Device ", ToDecimalString (Local0), Local2)
+                    Local1 = Package (0x02)
+                        {
+                            Zero,
+                            "placeholder"
+                        }
+                    Local1 [Zero] = Local0
+                    Local1 [One] = Local2
+                    Return (Local1)
+                }
+            }
+        }
     }

     Scope (_SB)
@@ -883,11 +931,22 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
+                Name (_SUN, Zero)  // _SUN: Slot User Number
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                {
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                }
             }
[...]
@@ -912,6 +971,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
                 {
                     PCEJ (BSEL, _SUN)
                 }
+
+                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                {
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                }
             }
[...]

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/pc/DSDT           | Bin 5065 -> 6023 bytes
 tests/data/acpi/pc/DSDT.acpihmat  | Bin 6390 -> 7348 bytes
 tests/data/acpi/pc/DSDT.bridge    | Bin 6924 -> 8689 bytes
 tests/data/acpi/pc/DSDT.cphp      | Bin 5529 -> 6487 bytes
 tests/data/acpi/pc/DSDT.dimmpxm   | Bin 6719 -> 7677 bytes
 tests/data/acpi/pc/DSDT.hpbridge  | Bin 5026 -> 5990 bytes
 tests/data/acpi/pc/DSDT.hpbrroot  | Bin 3084 -> 3177 bytes
 tests/data/acpi/pc/DSDT.ipmikcs   | Bin 5137 -> 6095 bytes
 tests/data/acpi/pc/DSDT.memhp     | Bin 6424 -> 7382 bytes
 tests/data/acpi/pc/DSDT.numamem   | Bin 5071 -> 6029 bytes
 tests/data/acpi/pc/DSDT.roothp    | Bin 5261 -> 6324 bytes
 tests/data/acpi/q35/DSDT          | Bin 7801 -> 7863 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9188 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 7911 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8327 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9517 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 7938 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9222 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 9024 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 7869 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8468 bytes
 21 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index f6173df1d598767a79aa34ad7585ad7d45c5d4f3..b9afc0a458d77b7346fca9cd2d8797a4d4ed8302 100644
GIT binary patch
delta 1298
zcmX@9-mcH(66_MvF3!NfxMw5R9wsJd;mIeM+UiBL9X(wln4*=Pe4M@i|1ZdJ@(cAX
zsASA!2ypfcEpRe$^-73V2T3kT5b<LVa0&M1Tj0h%IYUsGOW=a}$)~}lRlXC&U-?QN
zcJ?g*nU#~9us~{Z7Q+I8$(dYC3%DjtPGDFf$jsOXA{Z80EwGrJ#l>FC3p8KBMJKf^
zGdWd(VR`~XQh|^F69aESPGWLuMt)98Y7s+XK|)6&14BVlM<OG`lElq^%w?SQ9t&gQ
zgPr0992NpiFyL?scJ*P1Zqf`kFo@@fcXSD2;D`?n^<xkbj|aMyX9>u~8JStxAax*#
z=q4|gU_+={9tH*`h<Yw2TpC1x<{7#$EMWjKj9dhuEMt&RbdwXyWD#Bs8C;sd3hW6f
z$Rea*Dj@|22q}0?NP!q10be*0QjkMP!E{0j4iQrDmXHDoegeL5CZr&bkb;?n6dWO>
z;5{J)QUU~g;YvtB0U-sm2`M;6NWn)!3S<Nc_`;o#f+9i+<`PnHLQs<*tsvO^LhvCY
E0E_>Hx&QzG

delta 321
zcmZqIKdH{;66_LkQka2(aluBeJxoj<9FtElwQc^%T*hhSS`ZT->=ZBHn;+opX~5wW
z?CQf1-NYSiU=Ys{@8}W)<Y)yOLODDP3``7@@AJwsYEJ&gtHB)Iq&eA%4??#==~Gae
zj~^l)1f{1z>03}*P5>gG1f`cj=~qx%PY@zs1f{n@>0eOVP6#631f`EbX)a-ixF3|B
h1f{P*X(<tid>oWs1f`!rX)RHRe4eQ0=JldC7y$$2T}A)^

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 67f3f7249eaaa9404ebf0f2d0a324b8c8e3bd445..806bcbee30dc38117fbb37f433bfbcec171ce34b 100644
GIT binary patch
delta 1298
zcmexnxW$soCD<ioiwpw;W93G!Jxol_!jn%hwbhGgJ9@fAFhwgn`8a$3|6h>d<QM8&
zP|29d5a8??THs{h>Xi_!4w77wAmYa!;1cZ1x4?~ka)zKVm%s({lTU+9t9&Plzw(tl
z?Ce_rGAk!HVS&`-EQSRFlQX%P7I00PoWQU|keRU&L@+G0T3|6bi;KOO7ihkMi%x1;
zW^$?m!}J7(qyixUCI;SuoW$hRjQpIG)FOt&f`pDl28M#9jzmU=C5fB;m>2Wadn}BJ
z4|a+da99X5!GOal*wu$2x=AzGz#yI@-q9t9fg?UR)Q>?#JRay)o+Tg`XJlq&gVcc}
zqMN)}f(@Z+c^DX&AnLi8aA^<$nrG<3u!I4`Fme%qvW!7O(M?V)lO2ULWN>K)E65?F
zU^*cMhX^TnOGtr)Fabw86H<^zNWn}(3XTv`@SczYDG>s`a3!RmfRKXOgcKYjq~IeV
z1u~)peBn+=K@lMZa|tOpK}f-8LJH)>2>8O2kb)9I3g#11aEg$EuVR|~Xa&J$QSpb2
E0B6*PDgXcg

delta 321
zcmdmD`OT2aCD<k8n*;*`W9&w*Jxoj<9FtElwQc^%yqM3(wIC)w*ePDXH$TAH(}2S%
z*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>C)^9ai_YEIS`)?kiq(wv+Rr8h(A?@-!W
z1R`G#r4K`Cc2S79H<a#&(wCvMxEMq}8cNTH(vP9Ex;R8W8%nQ-(x0KUxdcSM8cOen
g(#(<&ad#-)4W-XRX<;ddd^nVzEv32nj?@iC0Ji^J>Hq)$

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 643390f4c4138b37fc481656d3f555d0eeedcb02..fd0c98e8adacada8252ed74f887773feb275bfc8 100644
GIT binary patch
delta 2372
zcmeA%`{>N&66_N4QIUaxF>fQ+9wsJd;mIeM+UiBL9X(wln4*=Pe4M@i|1ZdJ@(cAX
zsASA!2ypfcEpRe$^-73V2T3kT5b<LVa0&M1Tj0h%IYUsGOW=a}$)~}lRlXC&U-?QN
zcJ?g*nU#~9us~{Z7Q+I8$(dYC3%DjtPGDFf$jsOXA{Z80EwGrJ#l>FC3p8KBMJKf^
zGdWd(VR`~XQh|^F69aESPGWLuMt)98Y7s+XK|)6&14BVlM<OG`lElq^%w?SQO&*Lf
z@xe~<0-f%RKr;+DoPu3_7^0grgAEMgIpQ5%f*3gBgG2ooM8xBPuH{(*a&tyzRyIf-
zNFut)izV0)s+Na=feE6XiwTzo5uka7E(}W;KnxEf7|R&Mh;H&-6>Mk$u^4C=Gt@9<
zT!w+2%NX5cGg*gMSq7J?=q5*&$w9p8coaCXOs?V8z^`CAAqA}>1WedKNWpDF3fM#m
zSYb#=K@1@U?SvHk=Of^TyM#>O5F=nh13v);afD3hB&2{*fPfYE37NnpPQV0HLJATH
zDd;AoU>hL?4+$yYks#m;b3zK%3lcD)myiiN2q`cSB47odq$WRF3AMReh?9v4n6XE*
bC9sqRhQnyKgoMLrwuFSk0A))($$N|d2}8v<

delta 595
zcmez9++)V&66_MfBhA3T_+lg19wsIaj>#vO+BW}WF5@)vcoGvI>=ZBH@Fc+5(}2S%
z*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>C)Kjf8_^e+oGw1B7p3NkZ*H8MswsZ2KG
zQ)Z5C(wJPzrw*hwC-30X0Mmb<v;#kc-vXsiKxrNUh<E^$o&u$BKxr94h<pN+UIL|G
zKxrKzh<pK*-U6k6KxrFch<pQ-J_4mVL?GfmP<jHCz5=BsL?QAqP<jEBegdU6#31rH
WVw#KBiZL;2P9DZS+$^JTl@S19fvV&H

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 1ddcf7d8812f5d8d4d38fe7e7b35fd5885806046..8f453a59f297be7a2afaa8b8d9dbd9a45dc20fdd 100644
GIT binary patch
delta 1298
zcmbQKecg!5CD<h-T#|u-QDGz39wsJd;mIeM+UiBL9X(wln4*=Pe4M@i|1ZdJ@(cAX
zsASA!2ypfcEpRe$^-73V2T3kT5b<LVa0&M1Tj0h%IYUsGOW=a}$)~}lRlXC&U-?QN
zcJ?g*nU#~9us~{Z7Q+I8$(dYC3%DjtPGDFf$jsOXA{Z80EwGrJ#l>FC3p8KBMJKf^
zGdWd(VR`~XQh|^F69aESPGWLuMt)98Y7s+XK|)6&14BVlM<OG`lElq^%x>KE9t&gQ
zgPr0992NpiFyL?scJ*P1Zqf`kFo@@fcXSD2;D`?n^<xkbj|aMyX9>u~8JStxAax*#
z=q4|gU_+={9tH*`h<Yw2TpC1x<{7#$EMWjKj9dhuEMt&RbdwXy<R^R@GPpE@74Y*D
zP+&z!K`J2y69_5TO-R8rLJ9;02>8N=kb-nV3MLU!u$Pd67lafD3li{!9U%pogcM96
zq+mZG1+NGx5EUZe3kO09vI!}eMo7UyLJHmxQXno&z!y%06yy?8Fhf|AAFUwRyhHdQ
FBLHotgn$45

delta 321
zcmca^G*g?)CD<iorYHjgBg;mvJxoj<9FtElwQc^%?8a^6S`ZT->=ZBHn;+opX~5wW
z?CQf1-NYSiU=Ys{@8}W)<Y)yOLODDP3``7@*YnFVYEC}KufZJMq&Zng078dB=~+<v
z9+XxRgvh5s=~Ynr9h5c_g2<Oa>0MCzACz_yhRC-;=~GaePXr<!1f{1z>03}*P81@a
g1f`cj=~qx%PYfbo1f{n@>0eOVPF!<yz4#4A0QJ*c-2eap

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index c44385cc01879324738ffb7f997b8cdd762cbf97..0dc9455c519a0a9116ba1f34026a9bdbabf6575e 100644
GIT binary patch
delta 1288
zcmdmQ^4FTnCD<k8uPg%tBiBZ*Jxol_!jn%hwbhGgJ9@fAFhwgn`8a$3|6h>d<QM8&
zP|29d5a8??THs{h>Xi_!4w77wAmYa!;1cZ1x4?~ka)zKVm%s({lTU+9t9&Plzw(tl
z?Ce_rGAk!HVS&`-EQSRFlQX%P7I00PoWQU|keRU&L@+G0T3|6bi;KOO7ihkMi%x1;
zW^$?m!}J7(qyixUCI;SuoW$hRjQpIG)FOt&f`pDl28M#9jzmU=C5fB;nBVZ%dn}BJ
z4|a+da99X5!GOal*wu$2x=AzGz#yI@-q9t9fg?UR)Q>?#JRay)o+Tg`XJlq&gVcc}
zqMN)}f(@Z+c^DX&AnLi8aA^<$nrG<3u!I4`Fmjn(EzHN{#4@={SVIPvmgpv+f~|xU
zJRqciTZDiWW`q<Z5>n7ZNWpeO3LX(sz$;3?7Z!vRBok85M@Yd=LJFP`Qot`pz!z48
z6r>VTFoBSQ-Gmf8Bcwo3oPaNE2q{P>q+k*u1$zl8ctJ>kumk~L*hy&eqh<fiaS{(1
E0q3lP(*OVf

delta 345
zcmexsz2Ah(CD<jzUW$Q%@$E*gJxoj<9FtElwQc^%{DwckwIC)w*ePDXH$TAH(}2S%
z*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>DDIO2m1T^N>t8AdRMF^Cb}q&c}nM1vVb
z?|{;OptOT1M7#w`pMcUlVi55FC_M#A-+<CG;t=@+D7^$qzkt#@5)k<UD7^(r|A5jq
qk`Va@D18J<b4WqNeW3IND18M=OGrcHW1#c`DE&lQbF-?<4MqTmFJrv`

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 4ecf1eb13bf49499f729b53a6d0114672a76e28d..78f97cbda1c17f3e09cc4332e87d473fe99646b2 100644
GIT binary patch
delta 1312
zcmZ3a{!EX{CD<h-O`L&&v3w)f9wsJd;mIeM+UiBL9X(wln4*=Pe4M@i|1ZdJ@(cAX
zsASA!2ypfcEpRe$^-73V2T3kT5b<LVa0&M1Tj0h%IYUsGOW=a}$)~}lRlXC&U-?QN
zcJ?g*nU#~9us~{Z7Q+I8$(dYC3%DjtPGDFf$jsOXA{Z80EwGrJ#l>FC3p8KBMJKf^
zGdWd(VR`~XQh|^F69aESPGWLuMt)98Y7s+XK|)6&14BVlM<OG`lElq^%w?SQ?(<{f
zgPr09{O18pFyL?scJ*P1Zqf`kFo@@fcXSD2;D`?n^<xkbj|aMyX9>u~8JStxAax*#
z=q4|gU_+={9tH*`h<Yw2TpC1x<{7#$EMWjKj9eU`EMt&Rbdz4Np#{WVpjpgNvzT$2
z72V{-GFg>ZLk6#c0743?2`N}cNWn!y3jPpMpw36Y7eRy+)Dlv#f{=pCgcSTEq(GCO
zfG<J_DX1r;U=<++R|zPXBtXE8+JqE@5mL}dNWmIH3a%4Uz$8e(7rKNLL=aNYOh~~x
PK}~+NVqx<+!7Gdaeocpj

delta 330
zcmaE+w@97KCD<iokuU=T<IRm+dzhF!I3}N9YTNvixs21uFE=JW*ePDXEjPf~(}2S%
z*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>C)-{+MT;tw{ofG7ZpF#{E8PS)eoU<T1e
zP<k7b{spD&_#yI5Q2H2@<`RI2`$6eRQ2H8_mJ)=>$3f{uQ2H5^))Ioq=RxUBQ2HB`
mwi1TO*Fot+P?}8yBJKsH`=InCC@m%mk&hD9+&o+KG$R1zbY0H?

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index a3046226ec1dcb234b726029b3790dfedb3b9221..4f930ed9644a4018da96ef3e5dbedcb89ef19ee0 100644
GIT binary patch
delta 177
zcmeB?cqzf<66_L^$-}_FsJfAB6?c{^cT9Y+Q@nsLSAespL3ER5uz^85N4%p;5Ccbi
zaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&?2{weP1)9eMQP0JMOT**`+_HLl!G;zP
O<AGY3p<0-6X#oHg0xpgK

delta 84
zcmaDU(Idg-66_Mf!^6P9*tn5v6}OHDYfOBwQ@nr!Yk;$-L39&$uz^85N4%p;5JPm6
cR<I$I1JuC8Fj<aAmY+Y^&;p_WD8|eH0A{ojZ~y=R

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index f1638c5d079a9442c09390426a913010df6efd8d..3231292e1ca1be6c6a5ac0297a886ab23a52ebb3 100644
GIT binary patch
delta 1288
zcmajeJxjx25C`x}QfLfqO<$lW4h07l1yiL|oit6wswu@-5F#dN8%S%#pdjc{?4T79
zsR3P6$QSSh5mzTC{Q@E)E`AA3&`FS69v-;g{ka>iJ@_=r2$Hb;6bB#*myC}hGf|7B
z4jQrHnVhgf%KiLeX5s70H28c`G<S(A6f(J@$#dCxRUYt)jvCAR3xXtu>{-8Mgrf}m
zoPPX}QhQ=M{wel6WJJ@;s&A-vuT=w^wW<thGiR0xPM9M0y$3o|_Jmbq{M$h{KOv0h
zJJqtDfD08$W`rdnXx6o|Zfw>o`W9%W+R^~bQcEMi(XP*_ovy}QXH}7Sg`MuW2^`H!
z*+r0>LlVa+v@#<s0j)^IJjCLPJ8Qu4CN`?Ib<cSPxjFBXlD{?pK>m1!{I4PA<|PGi
z!265|mKY3?yw6$<4)*=mA~#)dh=D5%ykLM1Av26)U=0ID7`VZ}D+ZWuWQ!CAR16$r
z;1&aK7znV)7HJHWFmQr_I}E&IAQVQnn8ZK@1E(0c$G`^$*vL@#pYy-wB5%Yu=FxzD

delta 321
zcmX@FKT(6rCD<iIP=tYj(Rd>l3p0}k$7BKKw#|+#Wt>K?1u^l#PVoZ1`2o(J1{_Yo
zu09OWP29l-2Jsy6jxIq!j#jWCl*7Zoz{D_FolllgbFv$s26J?i=HxCYeGW<s@k7MJ
zp!6&#eGf`22|(o2p!6yz{SHbS2}0z{p!6;%{SQhz2|?uBp!6vy%_j^I4}#Lup!6*$
gEhhqzPlD3Rp!6#!ttSeRFM`tBL^U^m7rns<094vp&j0`b

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 4c19e45e66918c61674785c99e4474e58866f125..df83eaf0cf87e29ae7a6bf6f6a2dac26015e8689 100644
GIT binary patch
delta 1298
zcmbPXbj^~>CD<k8nhXO2<GPJpdzhG<g(sh2YO5E~cJy?KV2W0D@^SY5|Gyx^$uHEm
zppr3@A;8%)w7|*0)hi)d9VEFVLBx+ez$Mt1Z-E>8<P1S!E`bZ?C!YqJR{2g8f8{HA
z*x9!LWL8dY!UCzuSquvVCTDUnE#R6oIe}q`ATwhlh+tS~wZLL>78iRlFVK7i7oF6y
z%;Z!BhUp0mNd-azObomQIf==s8TmOWsYMKl1qmIA3=9QH9f^z#OA<HxF(2it_gEMc
zAM6w_;II&Af&qt9u&WP4bdzSVfk8Y+yrWAH14n#ts2_ufcs$UpJWD_>&dAKl2B`x{
zL^pY{1RFxt@-Q$kLDX|G;nE-iG|$k5VF?3>VdNqJWf_BnqMMvpCMOGN$l%fpR?tUC
z!A?R7o)A*NFHFD<R)iF!5>haMkb>QW6g(rOKv0B$FKh@YNGGIV5+Mb92`P9%NP(~@
z0bke=QjkeV!4yIY_7hU@ijV?PF#^7DAfzChkb-H16dWX^;0+-K;^Lb8Xa&J$bMc3a
E0H>0MX#fBK

delta 321
zcmca+Im3v{CD<iILXv@japFd<Jxoj<9FtElwQc^%e3Z|~wIC)w*ePDXH$TAH(}2S%
z*wu$2x`{j3z#yI@-q9rp$k7TmgmQQo7?>C)>j}#;YEJeQ)?kiq(wsaIN?(Q2k|GfC
zSSY;^N<W3tnxYW-TqwN}N`HmYmSPb3S}1)GO0$YX#66*OFO<Frr9~wm@{v$_E|h)<
grBx*%@|jS2EtLKUrA?(E@|93}uaxHIe^NIX0Tp>&NdN!<

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 40cfd933259af05ac2aee07fca32f22122255211..dbb6b182fbd3b45a6ca38d8492892867f9000a4e 100644
GIT binary patch
delta 1288
zcmX@F-mA~$66_MvE6%{cn6{B?4-=EK@Z=LrZS^ABj-D<NOwr0tKF;3%{}*I9`Gxux
zR5E5V1UP$!7C0HWdL=}wgCv(Ei1@JwxCHz1EpTI>oFOR8C2+y~<kMi&D&L9XuY4sB
zJNp)Z%*x44SRgeyi(!Gl<V-H61zeLRCon7#WM*sx5ey5h7FbNq;$ko61)8tmqLW&d
znVhP?Fg<}GsX$18iGjBuCowrSBR?l4wTL0HAfY3XfuSI&Bax9|N#bTd<{Hj=kA*Su
z!A|i44hw-M7;rcRyZSIhH)#eN7{qhLJGulhaKs0P`Z0)z#{=EUvjpVgjLfWTkUEe=
zbdwiLupv|}4+8@eL_HT1E)60;^9)@WmN0-AMlO@NdHI-}SSCyHYRKTy65Rw;;7UkA
z0U-sm2`M;6NWn)!3S{^Q_`;o#f+9i+<`PnHf{=pGgcQi}6Yzy6Aq6Fb6wD{2;1nSR
zUkNEt5Fp?SZ$b*n2q{=dNWmFG3ceFkpd?7Z7rulPR1i|In2>^Vf|~qj*?;pp!H0|h
Dh4h1Q

delta 344
zcmeCxKd;W^66_LkUYLP_(Q6~u9wsIaj>#vO+BW}WuHg)DEr^K^c8VA9%@1()G~jRw
zcJ*P1ZsHC$Fo@@fcXSB?a<qaCp&T9t1||j(j`(0h7ltKZh7pWm3}Qq#X-;P0(_jYC
z9#FamN?(A|BK#2f2q--VN<V<oDgqGs3@E(@N`HXTCV~+83Mjn?LQfKc2)jV(4k&#F
qN(%@><U^qJ3@CjEN-Ky!<Wr#Z3Ml;sN*jnm<V!>~H*Xca!3Y41)nL;A

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 078fc8031b479cc77b6527a2b7b4bd576b6e6028..fccb574c38ef112aa5e415ddf9a049d12b1c142c 100644
GIT binary patch
delta 1420
zcmeCx++xV(66_MPMS_8Wap6X;Jxol_!jn%hwbhGgJ9@fAFhwgn`8a$3|6h>d<QM8&
zP|29d5a8??THs{h>Xi_!4w77wAmYa!;1cZ1x4?~ka)zKVm%s({lTU+9t9&Plzw(tl
z?Ce_rGAk!HVS&`-EQSRFlQX%P7I00PoWQU|keRU&L@+G0T3|6bi;KOO7ihkMi%x1;
zW^$?m!}J7(qyixUCI;SuoW$hRjQpIG)FOt&f`pDl28M#9jzmU=C5fB;n9De`T(`u;
z2Rp?J_-+Q8U=ZD;8Ejw>&k^tF62!m}9~|n(AR-<QbS2LckXth{v$CCnU41|j(M?_~
z!G=(^JPZs>5cOP4xHL@uz$0tnyDHew0%AT;4>ME`GcG+GAln$Cn`|bl@hZ#UQWf3g
z$THc7R~?T6Czi=&yc+lwEF`4h3?T*I2`NzGBj5&KLJBGfDOgNM!8t+-eiBlk!cV{#
z{)7}%5mK;}kb(<@6#OQnKuv&vF9HcEs3D|aIUxm?2r2kWNP&hR0bc|YQcy=o!Ae33
ct`Ji2pO6AAAp*V#71HEKD~L9i3P~^l09X{PMgRZ+

delta 362
zcmdmD*sICq66_MvE5g9Qcx)rr9wsIaj>#vO+BW}WF5}ektci&ac8V8ptO;=TG>C5E
z4mL1|=ZJT731WzD(h4?&a(EaRm>4GC<dv25FAFxbfT#cpGBa>E1-tqH)v8R^<5Omi
zZqk^X%cl;cH79T2(*V<7ptJ=)gkJ-t4?t-a0f@K<l<tAj7ofC=AVfX_O3#7P51_P)
z5JWx$O0R*^AE2~}FhsrrO7DTtlSClGE>OAyN}qw!0-_N45GXwZO5cIf3StoX6fw=s
IOU3w^0M)Q&D*ylh

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..9506b60117147fd8ebe30fc3bf9f124773e6a3c5 100644
GIT binary patch
delta 129
zcmexqv)z`<CD<ioyBq@p<Nl3YnsS*g95M01PVoXh>;cZ62GLEL!3GBL9Py4WK@1%6
y!J&Q(BI5Bb!M;380)S*jW>&USu&WP9BD%?wCD_0MqLv3}9z;DOF7=b+<fH)|#Up(H

delta 67
zcmdmP`_qQYCD<jTQjURv@!Li&O*w5hmYDcpr+5Lo0B28w=qB!91A};uct@8YhUg}(
RU;_&XhX<&hVe%X~X#j{75q$sv

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..ae51a89dc056a13f50bc515e05207e875c369a51 100644
GIT binary patch
delta 129
zcmZ4H{=}WjCD<k8i82ENW6egcFy%}aj+pphr+5J$_5f#3gXkvBU;~4Aj(A6xAO?>3
y;7~sX5%GAJU|*gk0YEY%Gb`IE*wqIl5#8j;5^P`rQOg4~52BtCm-@-w%F+NNZzI0|

delta 67
zcmaFjzRaD=CD<ionKA<d<K~TAVanQWEHUxHPVoYE0nVNV(M{aJ1_tpQ@s2J*4AD(m
R!3Gu(4i8X0!{n37(g2Iy5x)Qc

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..0cf9f067d25ae5d596f236cda3b1a495a527249b 100644
GIT binary patch
delta 176
zcmeCSeQwL;66_N4T#kW((Rm}6rd*~AcT9Y+Q@nr=SAespL3ER5uz^85N4%p;5Ccbi
zaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&^2{y2RsO15g2T{+6Oa0_{IaxiuU_+?s
OKpjjF9b8Pfv;Y7-elC;%

delta 84
zcmaEE+ilC`66_MvEyuvX*uRlWQ%=W&H6}jTDPF*VHNe@^Ai9Y=*uWs3Bi_*^h#|U3
cE7-sS!r=jGV3<5dPL`iP*bu4!D8|G90GZPhbpQYW

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..3d17ac851fe4a988006f49deccdffd426581b6a7 100644
GIT binary patch
delta 129
zcmX@<(C*0P66_MvuE4;+sJxNur+lUhM@)RMQ@nr=dw{d2L3ER5uz^85N4%p;5Ccbi
yaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&^2{y2RsO15g2T{+6OZ{X$1!(~A>mvRD

delta 67
zcmZp7Jn6vY66_M<sldR%7`2h>r@XcsOH6#QQ@ns(fU~DTbQ5>5fk8Y+yrWAHLv)i?
Ruz>}H!vj>$FgZs-8USwS5dHuF

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..acde6cb0a22f031c0f8743e5cceb3b707e3aab61 100644
GIT binary patch
delta 153
zcmaFwxz>xzCD<iISCxT*@!dwQ`6~4;95M01PVoXh>;cZ62GLEL!3GBL9Py4WK@1%6
z!J&Q(BI5Bb!M;380)S*jW>&USu&WP9BD%?wCD_0MqLv3}9z;DOF7+Zn;|yIGmN0-A
LMlc4eF^B~K#WN^W

delta 90
zcmZ4M_1=@qCD<k8y$S;ZquNHU`6_O1EHUxHPVoYE0nVNV(M{aJ1_tpQ@s2J*4AD(m
c!3Gu(4i8X0g9t}_u%QdX5-`IE#xMpk09m~j761SM

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..77dac3feb29b6769b0ccb6b29a16538a4ac31879 100644
GIT binary patch
delta 151
zcmX?N+hoV(66_MfB+tOW_-P|oiCn!4M@)RMQ@nr=dw{d2L3ER5uz^85N4%p;5Ccbi
zaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&^2{y2RsO15g2T{+6OT7rtI71hPB@7^j
L5sWc;zZ@$71t2Hg

delta 90
zcmZp&J7UY_66_LkM2>-hQEMYtiJY4oOH6#QQ@ns(fU~DTbQ5>5fk8Y+yrWAHLv)i?
cuz>}H!vj>$Ai@zJZ0N$U1k5mkF^oYB02f&mN&o-=

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..5e3c1a4b1a34a63edcf9394455dbbaa86a24b044 100644
GIT binary patch
delta 129
zcmX@%-sZvO66_MfrozC$xM3q#g>t3~M@)RMQ@nr=dw{d2L3ER5uz^85N4%p;5Ccbi
yaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&^2{y2RsO15g2T{+6Oa0`v%F+PFXCof~

delta 67
zcmZqkIN{Fa66_LkLYaYq@x?~23T16KmYDcpr+5Lo0B28w=qB!91A};uct@8YhUg}(
RU;_&XhX<&hVe)HbX#kbp5+48n

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..09faed2cd326d591b6c33203dd9c0504808a0952 100644
GIT binary patch
delta 198
zcmaFjdccj#CD<jzL79PpF<>KClTy74cT9Y+Q@nr=SAespL3ER5uz^85N4%p;5Ccbi
zaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&^2{y2RsO15g2T{+6OT7rtI71hPB@7^j
b5sWeUoD#d9Ua%q5PM|qV5OcVga2W&uZFw`V

delta 108
zcmX@$_QaLTCD<k8i4p??<J^s0O-d0StTFMyPVoW`tO3rR2GLF2!3GBL9Py4WK@8DN
oTEPYu5DpJe1A_=he6XPl!xAvV2*xl5F`}FJgAJh?foho;03~7>$N&HU

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..642a7b39cc8bb174daa098c4a377df8cd5938289 100644
GIT binary patch
delta 153
zcmexwv)7i(CD<iouN(sdW9CLKeYtuUj+pphr+5J$_5f#3gXkvBU;~4Aj(A6xAO?>3
z;7~sX5%GAJU|*gk0YEY%Gb`IE*wqIl5#8j;5^P`rQOg4~52BtCmwFMPafU7oOBg^5
LBN&6#7{meqj}s^8

delta 90
zcmdmM``?DkCD<jTUXFo*alu9|eK|KbmYDcpr+5Lo0B28w=qB!91A};uct@8YhUg}(
cU;_&XhX<&hL4+ed*wBSx37BC7V;F-N068@kssI20

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 30da3ec27958881801dacc954a343321ba26a2ae..bef6c030b8fa08abf538bfb4ac244d1567c83c2e 100644
GIT binary patch
delta 130
zcmccaIK_#}CD<iIM3I4kar#CsQ@Ko6-I(}br+5Khod9P~gXkvBU;~4Aj(A6xAO?>3
z;7~sX5%GAJU|*gk0YEY%Gb`IE*wqIl5#8j;5^P`rQOg4~52BtCm-@}wayd)@>z*T0

delta 69
zcmbQ@bls85CD<k8x&i|O<B5%2rgAzSnlbUgPVoW`ngPz92GLF2!3GBL9Py4WK@8DN
TTEPYu5DpJe1H<MOayd)@u>KNK

-- 
2.27.0


