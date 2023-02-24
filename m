Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369436A1EB9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9Y-0003sI-O7; Fri, 24 Feb 2023 10:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9W-0003qt-AD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9R-0007Br-BO
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FY2I24CTKiM3bZD8sU5JvOST8Zf6uXn6fIR151l6LnE=;
 b=AQhO3N9oS1/2LYSX3xrNWk3Yyc5rCpTA66jm4GX/dqcRRDl9E/sXWQY7jjwf6q5lbNII9K
 EzAW9oTfP5v1ORU0zMyjZ2zMSEibaRz0xlc/S7uHl954UgS9v9B6B/MHwErJmSKZaBbw4m
 XLI/vKeafR+fmIL7inQoNcFs35Q3oDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-Tl5TOfgXMBKcbK4evC-Vvw-1; Fri, 24 Feb 2023 10:38:23 -0500
X-MC-Unique: Tl5TOfgXMBKcbK4evC-Vvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86084811E9C;
 Fri, 24 Feb 2023 15:38:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB10A492B12;
 Fri, 24 Feb 2023 15:38:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 09/33] tests: acpi: update expected blobs
Date: Fri, 24 Feb 2023 16:37:48 +0100
Message-Id: <20230224153812.4176226-10-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

BNUM numbering changes across DSDT due to addition of new bridges.

Fixed missing PCI tree brunch (q35/DSDT.multi-bridge case):

  //  -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off
  +            Device (S50)
  +            {
  +                Name (_ADR, 0x000A0000)  // _ADR: Address
  //  -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp
  +                Device (S00)
  +                {
  +                    Name (_ADR, Zero)  // _ADR: Address
  +                    Name (BSEL, Zero)
  +                    Device (S00)
  +                    {
  +                        Name (_ADR, Zero)  // _ADR: Address
  +                        Name (ASUN, Zero)
  +                        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                        {
  +                            Local0 = Package (0x02)
  +                                {
  +                                    BSEL,
  +                                    ASUN
  +                                }
  +                            Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                        }
  +
  +                        Name (_SUN, Zero)  // _SUN: Slot User Number
  +                        Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
  +                        {
  +                            PCEJ (BSEL, _SUN)
  +                        }
  +                    }
  +
  +                    Method (DVNT, 2, NotSerialized)
  +                    {
  +                        If ((Arg0 & One))
  +                        {
  +                            Notify (S00, Arg1)
  +                        }
  +                    }
  +                }
  +            }

Fixed hotplug notification for leaf root port (hotplug=on) attached to
intermediate root port (hotplug=off) (q35/DSDT.multi-bridge case)

  //  -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off
  +        Scope (S50)
  +        {
  //  -device pcie-root-port,id=rp3,chassis=9,bus=rpnohp
  +            Scope (S00)
  +            {
  +                Method (PCNT, 0, NotSerialized)
  +                {
  +                    BNUM = Zero
  +                    DVNT (PCIU, One)
  +                    DVNT (PCID, 0x03)
  +                }
  +            }
  +
  +            Method (PCNT, 0, NotSerialized)
  +            {
  +                ^S00.PCNT ()
  +            }
  +        }
  ...
           Method (PCNT, 0, NotSerialized)
           {
  +            ^S50.PCNT ()
               ^S13.PCNT ()

Populated slots being described on coldplugged bridges even if
ACPI bridge hotplug is disabled.
(pc/DSDT.hpbridge and pc/DSDT.hpbrroot)
  ...
               Device (S18)
               {
                   Name (_ADR, 0x00030000)  // _ADR: Address
  +                Device (S08)
  +                {
  +                    Name (_ADR, 0x00010000)  // _ADR: Address
  +                }
  +
  +                Device (S10)
  +                {
  +                    Name (_ADR, 0x00020000)  // _ADR: Address
  +                }
               }
  ...
               Device (S18)
               {
                   Name (_ADR, 0x00030000)  // _ADR: Address
  +                Device (S00)
  +                {
  +                    Name (_ADR, Zero)  // _ADR: Address
  +                }
               }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6289 -> 6323 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3115 -> 3166 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12337 -> 12545 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 7932 -> 8022 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a0dbb28cde..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 834c27002edbd3e2298a71c9ff1b501e3a3314f7..5dea100bc9492bb2367aac8660522201785c1efb 100644
GIT binary patch
delta 89
zcmbPexY>})CD<iovjhVJqvb}fa&9iSGcobOPVoYMr#E+Ve`ho>3^ufg=ZJT73F2X3
bU}lJJ;tw`J2rz;L3=QBam^M$~W#k3`PB0c2

delta 55
zcmdmNIMI;HCD<ioq67m2qvA%ca&9h{Q!(+uPVoXhCpUL<e`n<54>q)j=ZJT73F2X3
LVBWlmmysI)zZnl0

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index d77752960285a5afa6d0c0a04e400842f6acd2ed..893ab221c2cca1829937a4c26152680313633df4 100644
GIT binary patch
delta 121
zcmZ22aZiHFCD<h-j)#GPaneSvdz@Tu>M`-bPVoYMYMVcCerGf=3^p=|=ZJT72?DBN
iVTf+x4>quX3owEO3=t}rCV%HvRZs{vMyO%O)C2%vb{qNt

delta 70
zcmca7v08%5CD<iIn}>mc@#99Wdz@U(DlzfFPVoZX%9}rNerM$44>mH0=ZJT72?DBN
SnJmep%FiEcYylTyX8-`NSP<#}

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 66b39be294a261a6bd991c6bcbd8e2a04a03403f..f2f60fdbb3b44ab9adb69bb36e4a80978536af9b 100644
GIT binary patch
delta 312
zcmdm((3r&K66_MfXvo08IA<eQqa05Y2V+cpuv5H1Cp+Whsd7n-?2|vrM@|luS7u}e
zu^7E4pO;shTr3|y*-t@k@(1~-$;T7|CV!W6-5jmBoSUCjgv}+)FNBH1DcIGAi)FH)
zu9T4zN3f|uJV(5vOArqO0~bSdlLLFO0aSzmtP&{Z$$}7@{9i6;v$k#wqqwtlj2_56
z0nVNV0yZFX1XO|QCeP4Q6cZ5$aP|vfh|>dU1Tle9hQ^ck>8bJ<#fvC_B@4KiCNI<%
zpL}1BALs!Pi%nm4@&bLy$u{~Nla=))CdcRtPj=B)5)e=eHZ(wJV+Sgh5OijNSpl>e
K#GJfezX$-13sfWk

delta 216
zcmZon+L*xQ66_LUXu!b0*uIggQI5;|e@uL^Q@nul|H;$kk{H=07brwdz97#sIb2?T
z@@M(D$yem%Cg&?eP4-n#Vq^fyu4H5dk}jL$6qj?Wvxu;{g!zRqaX1CL`fxErdC^V$
z!A2JG9Py4WK|Bl$tPGns=*BS$dWps8f$R!!_B0Ss4K_5Mtg5fb3St>ej?q`;F^m^c
z2ypfbVJP5YnyjxcKKZo1EYLE2eTm6B23nJ~4LB!n2C{t&BqzVnmt?a5tDW3$Py_&m
C13TgX

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index f35338db30a44638cc3a55d2870e0e377af4246f..4ea982de2df3cf7cd89cb3b4467a350eaf8f5d29 100644
GIT binary patch
delta 213
zcmexkd(Do^CD<h-OrC*(F=8Xv3mGmKwV3!|r+5J$)yaQk0_qiljSS*B;vHRrco-O1
z7^0i_gAFX;0*pWbpbCTlD>fA}!Nv$P*nldygAJepKn_qAp`RU1R<}tv*aV@O1FYTz
Op`H^({pNYHaf|>-)-eG9

delta 122
zcmca+_s5pYCD<k8j~oL7<Ase}FJ!p96k_6oo#F+Y6ej<X2?*j3HZq9kh<9`e;$dK5
jVTf)53Ru7eSiu6u2o-D)0fY*6uz(3d1;^$evT=+6@ys3p

-- 
2.39.1


