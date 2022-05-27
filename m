Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52CD53665C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:08:49 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudSD-0005HU-1T
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudHG-0006b0-8K
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1nudHB-00072V-Ac
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653670644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XobTkmrESnCB/oSSwgsTD63tUg8ZNcUBUPM1K/KDJeY=;
 b=Crw0JCM4FK5xbc2Gr8d+F/At0Io6zXwLxAhNUlZ4FB/2VHJY17zH9WCpPRUBdQao9Z00y1
 RdrSOZghhspNnZ/3EvMUf2mS19kjujj7UHCJvGtHBlGWC9HfP6jTPma2ycv5sdenxEtarg
 b7OgYlj0o1TsbOUnAqPU/04GBD2f/hw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-K4MyqKGFPg-lChctXaOxKg-1; Fri, 27 May 2022 12:57:23 -0400
X-MC-Unique: K4MyqKGFPg-lChctXaOxKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F88801E6B;
 Fri, 27 May 2022 16:57:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F09042026D64;
 Fri, 27 May 2022 16:57:20 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH 5/5] tests/acpi: update tables for new core count test
Date: Fri, 27 May 2022 18:56:51 +0200
Message-Id: <20220527165651.28092-6-jusual@redhat.com>
In-Reply-To: <20220527165651.28092-1-jusual@redhat.com>
References: <20220527165651.28092-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes in the tables (for 275 cores):
FACP:
+                 Use APIC Cluster Model (V4) : 1

APIC:
+[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
+[02Dh 0045   1]                       Length : 08
+[02Eh 0046   1]                 Processor ID : 00
+[02Fh 0047   1]                Local Apic ID : 00
+[030h 0048   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
...
+
+[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
+[81Dh 2077   1]                       Length : 08
+[81Eh 2078   1]                 Processor ID : FE
+[81Fh 2079   1]                Local Apic ID : FE
+[820h 2080   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
+                      Runtime Online Capable : 0
+
+[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
+[825h 2085   1]                       Length : 10
+[826h 2086   2]                     Reserved : 0000
+[828h 2088   4]          Processor x2Apic ID : 000000FF
+[82Ch 2092   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
+[830h 2096   4]                Processor UID : 000000FF
...

DSDT:
+            Processor (C000, 0x00, 0x00000000, 0x00)
+            {
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (Zero))
+                }
+
+                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
+                {
+                     0x00, 0x08, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (Zero, Arg0, Arg1, Arg2)
+                }
+            }
...
+            Processor (C0FE, 0xFE, 0x00000000, 0x00)
+            {
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (0xFE))
+                }
+
+                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
+                {
+                     0x00, 0x08, 0xFE, 0xFE, 0x01, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (0xFE)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (0xFE, Arg0, Arg1, Arg2)
+                }
+            }
+
+            Device (C0FF)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0xFF)  // _UID: Unique ID
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (0xFF))
+                }
+
+                Name (_MAT, Buffer (0x10)  // _MAT: Multiple APIC Table Entry
+                {
+                    /* 0000 */  0x09, 0x10, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00,  // ........
+                    /* 0008 */  0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (0xFF)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                   COST (0x0101, Arg0, Arg1, Arg2)
+                }
+            }
...

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/q35/APIC.core-count2        | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2        | Bin 0 -> 32429 bytes
 tests/data/acpi/q35/FACP.core-count2        | Bin 0 -> 244 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e81dc67a2e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.core-count2",
-"tests/data/acpi/q35/DSDT.core-count2",
-"tests/data/acpi/q35/FACP.core-count2",
diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a255082ef5bc39f0d92d3e372b91f09dd6d0d9a1 100644
GIT binary patch
literal 2478
zcmXZeWl$AS7=Youz=a#M-K}6ZwgLuNAQ;$~*xjvQcY@uCVs{~Sf`WpLVt2Rbe!ORA
z_B`J^b9R56*&pj2=<ge2)-*$cPk^sqaDJbVK;QiOWzaNDW>M2p(=#;b`y@>U1KQZ2
ztu5Nwq0xx;_UPb%CKH;?XtAKxijI!x<b=-7=;DH|uIT25?(Uc=6K2kgS+Zc(te7nu
zX3vf}a$wG!m@60N&W(BUVBWl#FCTI)nyEkmx?n*pR0s<f#v(<qXi+Ry3_U#1(-Vsq
z#}Xy5WJxSl3QL#9GG(xASu9r$%a_Lr6|iDOtW*grS4J-{tWpK5R>f-7uzGc@Q3Gq%
z#9Fnmc5SRv2fe+~#|M4+PE2*{()H?L{rcFT0s8r&zdtr?h>aRy<Hp#e2{vtt0Rb2o
zh|QW|P!I+OWAo<Nq6M~WiLF{;NC>uWjcwXs+qT%Q9ky?e9Xepgju;w>ojPIX&e)|3
zcI}GYx?%V37#4;-dSK6<*sB-z?u~u=VBfyjuOIgBj{^qaz=1eu5Dp%ULx$kcp*U<9
z4j+yqM&QViIBFD*9*twh;MlP^ZXAvuj}s=~#ECd*5{8FkL<CNrj8mrI)Tuaa8cv^%
zGiKn-nK)|}&Yq2P=HT49IBy=#pN|U`;KGHtXb~=6j7yeaWF$sK;nJnJY#A<Jjw@E+
z%9Xfk6|P>5Yu4b}wYY8_u3wKEHsHpMxM>q^-i%we;MT3UZ5u{M<M!>iV+Y2>;Le@6
zYZva`jeGXs-o3bQAMW3e2M*xDgLvo=9zKjmj^NRwc<dM+KaM9(;K`F18;hq-VO$)Z
zK8<J2;Mucy?i`*!j~6cB#fy095?;QHSFYgIt9b1i#>Znq0$#t4H*R2JA|@r_&6{}Z
z7A7ZSN($b-jd$+g-Me`29^Su?4<6vdhnSj*j~?OU$C#FePoCh@r}*p{K7WocUf|1@
z`05qDevNP5;M=$O?j62=j~_nZ$B+2w6Mp`TU%ueiulVg7e*ca?e&Ela`0E$`{*8bB
z;NQQPo-UeQHSM3S%%ZeJ#vXl<HmDY*ZB&cWwyH&GJJq7JQMD*-uUeFLP%TQEREyGP
z)uOaTwJ2>>ElNA87Nwn3i_*@jMQIn+qO_}OQQA$lDDAE~Lr49*wAgf6Z7ljNgG@%F
cu9Hk={TGbMqHkcbS~Dh#{`5cn(qE|k2lzA_5C8xG

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..2cd0febc7486b9cb22ba92312f70262a2a0e7baa 100644
GIT binary patch
literal 32429
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

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~*~#D8BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD92VqjR>!otAF!NBm72O<iWged~jj0!*k$y^{03>bk1
YBHITON2VDSAnpK(F*YFF1LDH~0O^Si0RR91

literal 0
HcmV?d00001

-- 
2.35.1


