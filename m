Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAEB6675E3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBQ-0002MA-G8; Thu, 12 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBE-0002CV-O0
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-0005vu-AU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=71jBgKLGY3qam16z66+DEGohf+J+3tkn+2BoTBilfZU=;
 b=PU4QfTL6L8w/dzu7x9jx1KyYtNpTytPWB3KfSk6svViBNtl4RPvA0OY0XEufAjy6aUY8RH
 DXUcTO+huFbM+p8j8xxJFz2TdxstIoV+/yBI/r6qOo7FNblKrFjkmMBIM5TMS2ypD/DU6N
 RNiE8O9UkKVkU44mB3v/Qdths8quwYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-V8uXH8cTM7e9UCVN4ZVqFg-1; Thu, 12 Jan 2023 09:03:33 -0500
X-MC-Unique: V8uXH8cTM7e9UCVN4ZVqFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C536F8030DF;
 Thu, 12 Jan 2023 14:03:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 263234085720;
 Thu, 12 Jan 2023 14:03:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 23/40] tests: acpi: update expected blobs
Date: Thu, 12 Jan 2023 15:02:55 +0100
Message-Id: <20230112140312.3096331-24-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Expected changes:
 * pc/bridge testcase due to
   ("pcihp: compose PCNT callchain right before its user _GPE._E01")
  ...
  +    Scope (\_SB.PCI0)
  +    {
  +        Scope (S18)
  +        {
  +            Scope (S08)
  +            {
  +                Method (PCNT, 0, NotSerialized)
  +                {
  +                    BNUM = 0x02
  +                    DVNT (PCIU, One)
  +                    DVNT (PCID, 0x03)
  +                }
  +            }

               Method (PCNT, 0, NotSerialized)
               {
  -                BNUM = Zero
  +                BNUM = One
                   DVNT (PCIU, One)
                   DVNT (PCID, 0x03)
  -                ^S18.PCNT ()
  +                ^S08.PCNT ()
               }
           }
  +
  +        Method (PCNT, 0, NotSerialized)
  +        {
  +            BNUM = Zero
  +            DVNT (PCIU, One)
  +            DVNT (PCID, 0x03)
  +            ^S18.PCNT ()
  +        }
       }

     Scope (_GPE)

 * due to ("pcihp: do not put empty PCNT in DSDT") in the most Q35 tests
  ...
               {
                   Name (_ADR, 0x001F0003)  // _ADR: Address
               }
  -
  -            Method (PCNT, 0, NotSerialized)
  -            {
  -            }
           }
       }

  ...
       {
           Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
           {
  -            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
  -            \_SB.PCI0.PCNT ()
  -            Release (\_SB.PCI0.BLCK)
           }
       }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |  36 ------------------
 tests/data/acpi/pc/DSDT                       | Bin 6458 -> 6470 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6418 -> 6430 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7783 -> 7795 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 12608 -> 12634 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6922 -> 6934 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8112 -> 8124 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6418 -> 6430 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3071 -> 3064 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6530 -> 6542 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7817 -> 7829 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6316 -> 6328 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6464 -> 6476 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 9732 -> 9758 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8310 -> 8252 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8327 -> 8269 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9635 -> 9577 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8589 -> 8531 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8356 -> 8298 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11439 -> 11458 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32450 -> 32392 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8774 -> 8716 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9636 -> 9578 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9964 -> 9906 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8385 -> 8327 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8398 -> 8340 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8327 -> 8269 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9669 -> 9611 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9440 -> 9382 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12301 -> 12358 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8168 -> 8110 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8316 -> 8258 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8411 -> 8353 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8916 -> 8858 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8942 -> 8884 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9419 -> 9361 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35673 -> 35615 bytes
 37 files changed, 36 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4be20b2cd1..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,37 +1 @@
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
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.core-count2",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index b688686dc3614f56582991c0974f6ef1964ee6ce..c99179b35254725daeebb416400b1b6f9f1d74c4 100644
GIT binary patch
delta 51
zcmdmGbj*m$CD<jzO_G6u(R(9T1vlr_nD}6)cmc<&o4dLFd3gl1WAs1*0nVNVlW$2R
F004+X4|D(k

delta 38
ucmX?Rw9AOgCD<jzN|J$rv3w&}1vlsQnD}6)cmc=jo4dLFc_%-UNB{ui{|s~h

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 86259be9d1df3fcc89b780f3bae028a5ebd8bbe5..b0ae8c2cf52616836dae14c0a971f56fcfa7cdc8 100644
GIT binary patch
delta 51
zcmbPaG|!03CD<iIPLhFvv1cP!1vlsAnD}6)cmdB#o4dKyd3gl1WAs1*0nVNVlQ&5u
F004MJ4)6c~

delta 38
ucmbPdG|7m|CD<iINRokpamPlk3U1D;G4a7p@dBP#Hg|KY^G@C;kpKYLtqbq~

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index e2cc2a6fc9877380ef85c3540654e0691472f27c..a4c82f7222a8477aa6e9bbfbfcbc73c2867f7bfa 100644
GIT binary patch
delta 51
zcmaEE^Vx>WCD<jTSdM{#kz*s*QUT7ZG4a7p@dA!lH}4Se=j9R5j?n`N1UP#dOlFr$
F005+N4`=`Y

delta 38
ucmext^W28ZCD<h-U5<f)(PSgnQUT8EG4a7p@dA$5H}4Se=bbDpmjD3vVGL*h

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index d1b019754bb03fa7d815ab57304ddb2376a4c8af..783a9d7b2964612626268905837d108679603432 100644
GIT binary patch
delta 137
zcmX?*bSsI=CD<h-%8-G9aq>p4a&GRf0H&DuV5fM2#(>Q|+&N54-3^m}@wPKL9iDuK
z+i3GvzJJ`C!}#ktHwUX+WZdkh*1@GB;Kvc82htPZ>}eq2&KhiJ5ig(?Y+w;Dq7dNh
f7s61$#WeZ8fjFm#CWOlf<Vmpu<w4xZ*9@`%=qf5s

delta 87
zcmV-d0I2`kV!&bwL{mgmKrsLS0jRMGcMA)TR{~sLQ$k-5hF7zU3v2=chJ};*4Tl0l
t#gohnGPAV~{tJ_(Fd?&64}S@>G9=Lflg2PAv-l6)2(#cWs{xbnFltGUA!z^r

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 53eb0dd7d422e880a668cf3ea01b8b288004042a..659ad3d6b9026c090e0d8d8e21ece5df44249ec0 100644
GIT binary patch
delta 51
zcmeA&n`Xx466_KpCe6UWxPBv-2QTN<nD}6)cmc<&o1=OCd3gl1WAs1*0nVNVlUGS4
F0047;4#)ri

delta 38
ucmbPc)@8=!66_MfCC$LVczYw42QTOKnD}6)cmc=jo1=OCc_(j^N&o=Wp$o_W

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 9089d994e0324741190b48dfcfb4e6074ba102c1..77f42eecd40faac52e517e3c8e2528115d54ca1a 100644
GIT binary patch
delta 51
zcmdmBzsH`-CD<iok30hdWA#R^cY>T(W8#CI;sqS9Ze|qn=j9R5j?n`N1UP#dOb(Dw
F005}751ar1

delta 38
ucmdmEzrmi%CD<iogFFKR<MNGM?*uuo$HWIa#S1uI-^?iF&pSCrJ^=vxzzm!K

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 86259be9d1df3fcc89b780f3bae028a5ebd8bbe5..b0ae8c2cf52616836dae14c0a971f56fcfa7cdc8 100644
GIT binary patch
delta 51
zcmbPaG|!03CD<iIPLhFvv1cP!1vlsAnD}6)cmdB#o4dKyd3gl1WAs1*0nVNVlQ&5u
F004MJ4)6c~

delta 38
ucmbPdG|7m|CD<iINRokpamPlk3U1D;G4a7p@dBP#Hg|KY^G@C;kpKYLtqbq~

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 42d923ef3fcc17898955ff30a1dda1bfd7da0947..578468f4f00a9373366c92926b512c192dd6675b 100644
GIT binary patch
delta 34
qcmew_{zIJ0CD<k82R8!)qwYqodz_pOiZSuQPVoXBn?G{0GXVg?l?qt^

delta 42
ycmew%{$HHSCD<k8KQ{vd<H?O&_c%G-6=ULqo#F-jH-F@0XJQv&3vl)eVE_OvXAEEf

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 39427103aadb969721257feb9af66863b25b6ad9..474c2c2bc23315f0b003b6b9210883d7919426ce 100644
GIT binary patch
delta 51
zcmZoN?lb0c33dtTlVo6Eyta|6f}8VJOnk6YynyG;&E4G7d3gl1WAs1*0nVNVla(YB
E0GE{ydjJ3c

delta 38
tcmeA(ZZhU_33dr-l4M|DWZKA8!OeLmCO+6HUcmGA=5Frkyp#1L69Cbx3wr<n

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 987a263339225c2cb5ba71cd1aa183c651bb353e..b2a7c042a902d1bbac79961639e27d302ad8799f 100644
GIT binary patch
delta 51
zcmeCQoodVF66_K(RgQsy(RL%(aRJV&G4a7p@dA!lH{TNQ=j9R5j?n`N1UP#dOxBc3
F005N@4{HDb

delta 38
ucmbPg+iA<?66_MvDaXLTn7NVbxB%z%nD}6)cmc=jn{NsD^G-IEO8@}qj|^)7

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index fc7598b76287648f4b35273c91e46417a50b640b..b64da36b14edd13270dfd9db040a3b99219a36a0 100644
GIT binary patch
delta 51
zcmZ2uxWkakCD<iohXexyqv%GiS6rM|W8#CI;sqS9ZvM;V&&wmA9is;l2ypf^nCv5w
F005)K59I&=

delta 38
ucmdmCxW<snCD<iojRXS&qvJ-dS6rOeW8#CI;sqS9Z~n{W&pSCnA^`yMjtu1h

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 85af400cdb5d19c3515f5443f27e23a7813542e4..f554b0b09db33fa90d65267c2687e90d4ab7d92e 100644
GIT binary patch
delta 51
zcmX?LbjFCwCD<jzN0Nbo@#{veI&RLZG4a7p@dA!lH&5jD=j9R5j?n`N1UP#dOnxAd
F005<h5JCU|

delta 38
ucmX?ObijzqCD<jzL6U)iQE?+z9XIFonD}6)cmc=jn<sMn^G<#vkpKYS84N-I

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 14473ab4c91d68af88fff45e703f572c387d0af7..fe502ed97751950cc245d728c873065f062c76b2 100644
GIT binary patch
delta 99
zcmZqindigh66_Kpr^dj*_;e#zIX8F5JjR&#V5fM2{<)ibxPLG*wbo5;<4tBfJh_n1
zc(W|uAMVY2`06<~?@+$TC?(*+9-{|R9pLO~AmGLtY-kZLpc-so5kFZ{N?~%RYBc~+
CzaL=$

delta 101
zcmbQ|)8fPB66_MfqQ=0$_-!LsIX8Fn62_SLV5fM2uEm>sxPLG*^*2p!<4tBfI=PU~
zc(W|uA8rK^`2c6X5QYLqC%;f%moUGO0B6roMkvFDi+S@NzIx8hGn6kfPF}294FFm9
BAYA|e

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 2771bcea89b531549557a19538606219a8e222b1..d68c472b460e4609a64ea67de3c4cebfca76164d 100644
GIT binary patch
delta 49
zcmez7u*ZSRCD<jzMuCBWaq32{Mma7QshId+r+5J$$<0&cW-;;#@Wi_ZxQejFyBZiW
F003eN49EZg

delta 107
zcmdnv@XdkCCD<jTOo4%cv2-I>qa2sFR7`xZQ@nt))aI#jvl!h)*aDpWLKp<><J|*X
nMJ(f84GbBgm1FdoL8=0rJq?_EoW1}5M-l+3k5)$#0I2`~RCgW%

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index b45abca7c289d8ae38faeca1fcaf6370ed621cd4..de7ae27125f9667d7aa7a7cc0e8210773b61a2e2 100644
GIT binary patch
delta 49
zcmZp7JnO*a66_M<tH8j(Xu6TBQI5-1Iwn5YDPF)=YV%aN)r`CXJn`-Ut|Dylt_Fq-
E07n!IF#rGn

delta 107
zcmX@>(C*0P66_MvuE4;+D7ulWQI5+;Iwn5YDPF)udh=Ad)r{^UYyr-GAq)cc@$Lbx
nB9`&428ImL$}#%PAXNd*o(4`n&ffq3BME@iN2?<VfK&hg7)c##

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index d90fd4723a703df348c12a5a1c1c672b5af60a43..48e2862257ac614b5fd6391c4ec425106c48afb1 100644
GIT binary patch
delta 49
zcmZ4N{nCreCD<h-Q<Z^%F=!*#I%O^wshId+r+5J$$<2q9XEE{$@Wi_ZxQejFyBZiW
F003s94GI7N

delta 107
zcmaFqwb+}>CD<iou_^-tqtQmLb;?}cQZeztPVoZHQkxGc&th~JVGD5f3t<qjk9QAn
n6|szWH85m|R*unU2B`{g_B3$varXZIA4veDK3W|~0Hgu{X#pNY

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index 279fafa8219140687f1cdaab9739fc2f4c80ed6a..30a4aa2ec8feb6012a64d476ff37b14717d20eaf 100644
GIT binary patch
delta 49
zcmeBmzU;*166_KZtjNH?D7}$uhCG*xR7`xZQ@ntW<mNT<vlw{=c;ejyTt(R8T@4Hw
E07}&iNdN!<

delta 107
zcmccY)a%UU66_MvtH{8>_<JMQ40$eZshId+r+5Kpsm*KTXEC~qumw2#g)j)%$GZo(
nide?G8W=J}E63<FgH#1Ldm1?TID7y9k0bz6AFYlg08#+}etI5*

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index fdf6d144286860ff7f998df676ca9a50ce988d41..84e2b5cbc4483ae93634f223160253231dcc4932 100644
GIT binary patch
delta 49
zcmZ4D_{xFHCD<h-OM!ubv2`O?qa2r$Y)pKxQ@nte%;u?bCm4AJc;ejyTt(R8T@4Hw
E0AmIW^8f$<

delta 107
zcmaFmu*8weCD<ioi2?%yW9mk(Mma7|*_ilXr+5KJ+09esPB6NQumw2#g)j)%$GZo(
nide?G8W=J}E63<FgH#1Ldm1?TID7y9k0bz6AFYlg08#+}U@smm

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index b41a4dddc0b7bdeb2349d874a390858453c927f8..c38b121ad90ecb896a906a50340ad5bd7d5453f9 100644
GIT binary patch
delta 74
zcmZ1<c_@<0CD<k8kPZU_<CKkDjdEPhw`1aio#F+&Z%v*m=fHSi^EEkcp3RKfv5dk3
d&MYx{Ajtq{PXhtfU_*oW$q%&@CdcUn0sxLV7f%2H

delta 54
zcmV-60LlNtS+7|NL{mgmuPgun0VS~tfgTD(-dtZ(LSGO}-IJ9bKmo$D)*cHClTj=n
Mv*9XT0h4hoQT6;1pa1{>

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index 375aceed6b16528f7986fad46b045eba76af9760..0603db8cc63cfc562f83e55eaf5162e7c29bf4d1 100644
GIT binary patch
delta 51
zcmX@~m$Bn7BbQ6COGrl@0|VoRja+AIxLl-S;)9*y1$-noKdhO>$Sc4T?;hYP!WQpp
HV8{Rf*RK!t

delta 109
zcmeD9%XsK7BbQ6COUR)*1_s6n8@bNbaCu9`#0NXY3ph({epoY$(OrZsz}YW^LBKxV
pJ-}7OGTzm|kRe(*MxPm^D!|#(z{$ti`~QC=0g(D=btD0h3IKv5Auj*`

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index a0ecafc36c57c6d4791b511f3febe210713d253c..beeb83c33b385fc8b41d44f299b8d9ba7203d935 100644
GIT binary patch
delta 49
zcmX@+(&NJA66_Mfqr||#_;VvypaPeRR7`xZQ@ntW<mOa`S&X~_Jn`-Ut|Dylt_Fq-
E08ac2N&o-=

delta 107
zcmeBiIp)IU66_M<ro_O&cyl9HpaPe-R7`xZQ@nt))aF!$S&Z%?Yyr-GAq)cc@$Lbx
nB9`&428ImL$}#%PAXNd*o(4`n&ffq3BME@iN2?<VfK&hgB;6f^

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index f9c6dd4ee0502ca000509493411b421dfd23b96f..3d18b9672d124a0cf11a79e92c396a1b883d0589 100644
GIT binary patch
delta 49
zcmZ4D{mP5WCD<h-OO=6vv2P<+uQHdLOiX;RQ@ntm^yY=idl-2Ic;ejyTt(R8T@4Hw
E0Bg_<F#rGn

delta 107
zcmaFmwZxmtCD<ioi7EpFW8OxtUS%#{nV9%sr+5KZnavB8_b|GPumw2#g)j)%$GZo(
nide?G8W=J}E63<FgH#1Ldm1?TID7y9k0bz6AFYlg08#+}cLg46

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index f0659716e3cef916ed0d8f583175a2edbc07141b..99a93e12a7faac78e9524ad6758f42c5c0df18eb 100644
GIT binary patch
delta 49
zcmaFkyUCZ!CD<iolNtj9<I#;=-&MF=q+;TOo#F+2BsX)b&SK;h;E8t+a1~*TcQr6%
F004tG4RZhh

delta 107
zcmdnw`^J~cCD<k8jT!?3<I;^>-&MH0rDEcPo#F+Yr8aY`&SG>IVGD5f3t<qjk9QAn
n6|szWH85m|R*unU2B`{g_B3$varXZIA4veDK3W|~0Hgu{oMIlW

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 9c52529919d72a43034b1bbf4d3f1810ba9e22b2..7f7601dbff820044aa646048c0bfe0e6324b9d0d 100644
GIT binary patch
delta 48
zcmX@;*zU;X66_MvuE4;+xN9R<qa3HdTugkhQ@nut<|%T|7<mPF;@tyWMcCq94Gb9o
DTJ;SJ

delta 106
zcmZp7Jm|>f66_LkP=SGgan?qzMmbJ5`Iz`%r+5Ls%~Rx_F}jPe1vvYKFbLSky9c<6
mSjM{=7&1gF$LKSI6a_eY8aVkld;kBBBmhz$t&SuBQUL&4{~kpE

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 3f32dffdbf3cd7e3791155530cf89417d8f2ec90..6c5d1afe443d9261d3b93801711f8d5b267696f3 100644
GIT binary patch
delta 48
zcmX@-IK`36CD<ioiUI=zqt!;PMmbI&`Iz`%r+5LE%~Rw)Gx7@X#JdN$im=7I8W=JF
E08tSPx&QzG

delta 106
zcmbQ@c+Qc_CD<k8oB{&_qtr&OMmbJrg_!tYr+5MH%~Rw)GrEhg1vvYKFbLSky9c<6
mSjM{=7&1gF$LKSI6a_eY8aVkld;kBBBmhz$t&SuBQUL%z!5#Df

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index b45abca7c289d8ae38faeca1fcaf6370ed621cd4..de7ae27125f9667d7aa7a7cc0e8210773b61a2e2 100644
GIT binary patch
delta 49
zcmZp7JnO*a66_M<tH8j(Xu6TBQI5-1Iwn5YDPF)=YV%aN)r`CXJn`-Ut|Dylt_Fq-
E07n!IF#rGn

delta 107
zcmX@>(C*0P66_MvuE4;+D7ulWQI5+;Iwn5YDPF)udh=Ad)r{^UYyr-GAq)cc@$Lbx
nB9`&428ImL$}#%PAXNd*o(4`n&ffq3BME@iN2?<VfK&hg7)c##

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 28a192c69af3c6df8f003bf8edc9586f0dda35ad..79bce5c8f0132e72b8e700488ea56c7593737810 100644
GIT binary patch
delta 49
zcmX@=-R;fg66_Mvt;)c_*uIhLf-;wjR7`xZQ@ntW<mM;Jvlw{=c;ejyTt(R8T@4Hw
E0B=JLY5)KL

delta 107
zcmeD7KI+Zo66_LkRF#2&F?}P~1!XR8shId+r+5Kpsm)K6XEC~qumw2#g)j)%$GZo(
nide?G8W=J}E63<FgH#1Ldm1?TID7y9k0bz6AFYlg08#+}hGZV3

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 8fda921296e471f2b8dff8c195652841f95cbcf9..c249929add97439ceb9f891d44c425311517ad18 100644
GIT binary patch
delta 49
zcmaFhxy+NxCD<ionF<2~qw_|tTS{E6(lPPDPVoZ1Qk&l?t!CsE;E8t+a1~*TcQr6%
F004HP4VeG{

delta 107
zcmZ4H`M{IQCD<k8feHfyqw+?sTS{C$(lPPDPVoXR(wpBYt!8u=VGD5f3t<qjk9QAn
n6|szWH85m|R*unU2B`{g_B3$varXZIA4veDK3W|~0Hgu{m}wr<

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index f045438b4e794406316418074c6d319261bfcd9e..52c1d3102b59fe3c1d10fdcfca761722d54d2c40 100644
GIT binary patch
delta 242
zcmeB8IF`WW66_M<X28I}7`c(FQI5NTkufGd*ePD1oni7cIR_?J_Q^NoidmwYfQ$lp
z5W|IiGKWGDgfUN{NH)63??kYnWjsf`qe~DEBLg!7hf}bt4;M2~;@ISma{7~N6gimu
z4uP1Pw<`YQ=4EpU^9x}Tfl!;x^<o)?1-!&!^g#9oIC~lhs0JGv$4?eeRA2)!jp8R)
zDFB&j!G?zMlOM|~$_aRJfNT`-U=21fhzCjlNfCtrXTK1J0xs6cZ{@`&-_q5Y%&Vsb
Q)@2Ys*;`(5@)Z3_0AblekpKVy

delta 174
zcmX?>(3`;J66_MfYrw$3D7cZUQI5MwgfS*Q*ePD1Q+V<;IR_>;&dE3AiYKqpS7eE9
z0&@K2izolm194n9Cm)k9ntVl10m89SD4M)ZPeC@i$@N08p=CTryrWAH4<iFJ1BX+v
zs}C1*bd%TV$sgtPxxieYCjTQK?q*}ff83J|^cC6IT*CZ9m?j74>%f@R`r4cAbYmGO
IpVhAf00jg!7ytkO

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index b116947dacd4fe9b563ecc7e1510cdb2474011cb..9ff9983a80a7487470ccd02ce587200444675816 100644
GIT binary patch
delta 49
zcmaE1zs{b^CD<ioojd~rWBf+0&$3)DQZeztPVoXhlAGD(W-;;#@Wi_ZxQejFyBZiW
F003&(49EZg

delta 107
zcmZ2y|H7WjCD<k8g**cTqy0v%&$3+JQZeztPVoZHQk&W3W-+>pumw2#g)j)%$GZo(
nide?G8W=J}E63<FgH#1Ldm1?TID7y9k0bz6AFYlg08#+}T}2)O

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 5eb6159d5f6101c0f75a6de6c83ad95ccd2e6176..1e7c45ef3ccb000a06f64152622b4bd27916d181 100644
GIT binary patch
delta 49
zcmez4aL9qnCD<jzNr8cZ(S9RWyBwE`R7`xZQ@ntW<mTCOvlw{=c;ejyTt(R8T@4Hw
E09vFBkN^Mx

delta 107
zcmX@)@W+A6CD<jTMuCBWQGO#=yBwFdR7`xZQ@nt))aKc8vl!h)*aDpWLKp<><J|*X
nMJ(f84GbBgm1FdoL8=0rJq?_EoW1}5M-l+3k5)$#0I2`~Kw%xq

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 908e7b6606b6141556e9df4ffd3f88f97fe13d98..ed47451c44e3041e5b7fed55de7b6ef1aca54350 100644
GIT binary patch
delta 47
zcmccZxX_WyCD<iop#lQ~qsK<BMmbJTg_!tYr+5L!#Z%;%cm;Uk-2+@j*y3Fc3>g4F
Cg$w8a

delta 105
zcmZ4Jc-xW7CD<k8wgLkKqsB(AMmbIg#hCbDr+5L6#Z%;%+(p;|oc%%=1nlG816)Nc
l<6R958KRYA^qE0w0-QY!oP3<U|Nlo40I82wM-l+30091Z9U=e#

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index ce2c2c29c2c177071d6c1284b1c496e773942bec..efc2efc19f00ca7564467756616da44f5fd71cfe 100644
GIT binary patch
delta 49
zcmccOI?I*ICD<iomJ$O4<FSogy>eV`_A&9nPVoYMcAFQ<y<z4R;E8t+a1~*TcQr6%
F004Wt4cPzy

delta 107
zcmbQ`dc~E?CD<k8iV_0@<Fbuhy>eW>_A&9nPVoY+_L~>Vy<v72VGD5f3t<qjk9QAn
n6|szWH85m|R*unU2B`{g_B3$varXZIA4veDK3W|~0Hgu{tO6es

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index e9e4b7f6ed5094c5ca3635a59367eb1d88b12ad1..675339715f72b4400445ce8c0dd12f416aa0efb0 100644
GIT binary patch
delta 48
zcmaFoy2X{tCD<ioixL9^W5Y(SUO7$&$C&tFr+5L6%?sq%S$G9_;@tyWMcCq94Gb9o
DV+ahh

delta 106
zcmdnu`p%WhCD<k8oe~2BW8g-vUO7&8$C&tFr+5MX%?sq%S=>d~0-XIq7zFI&-2+@j
mEaP1b3>l)8WAvFpiUOQH4V-+Oz5oA55&)@>R!0&5sQ>^^$sO$g

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 6b436f9cd95776c26bec09066eb621bf97219dc6..eeb40b360f7c1de93501e1ddcd7dab306a51113b 100644
GIT binary patch
delta 48
zcmX@@Ink5LCD<ioq6z~8qtiyNNlKg^axwA2PVoW`o0lrxXXF*&iFXfh6=92aH85lV
E09EV^+5i9m

delta 106
zcmbQ}dD@f9CD<k8v<d?Qqwq$qNlKjlaxwA2PVoZno0lrxXLJ`~3vl)eVGyv7cMotC
mv5a>$Fl2~Uj?rfZDGG4*G;s29_Wu7LNdTliS{+FMqyhj-gB}zB

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index f47f09122287bdd20d7762d3d6dee6e05d944285..3aa86f07243f0449c7dc245650715d729744e3ee 100644
GIT binary patch
delta 51
zcmcaPjcNWgCN7s?mk{}G1_nm&ja(_6TrN^E@xe~<0zQ(PD>`Q}@(S?8y9c<6u*JI?
H7%~6=i=GYM

delta 109
zcmbO~jp^nzCN7s?mypPA1_nm$ja(_6T;5VK@xe~<0?tyKD>`Q}x{I&{IQxY#2-wHF
p2e^t@#=9CAGDIuK=re;<1vq;eIQckx|NoC908$^VjwAq50RX(s9~b}t

-- 
2.31.1


