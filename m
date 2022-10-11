Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DEF5FB2A8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:48:49 +0200 (CEST)
Received: from localhost ([::1]:54072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEgi-0001e5-5O
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIP-0002aR-9s
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1oiDIM-0008Ej-42
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vw2n54bTJL9IV7uLwX0KYJQQdp/PKYbJmoZ/fee80W0=;
 b=aQyQ3tBkcdhAyHHIjmqrULyLXkT8cugg1XaT1vvT1/hf0yrdwoKjhn2yFCw5Ke9TUVGYaE
 hub+PKXzJXXC68HXAD+D4dasC+qvKbUCbtrNxFWFNMHbzC4JWLduIbrWEfq/xtAcprpa1J
 +y8NLEIYBvZGTHI02IcknfhA2dmru1U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-c8UiT8ZwN_e_AZnAB1CucA-1; Tue, 11 Oct 2022 07:18:26 -0400
X-MC-Unique: c8UiT8ZwN_e_AZnAB1CucA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 289BE1C05AB2;
 Tue, 11 Oct 2022 11:18:26 +0000 (UTC)
Received: from ovpn-194-244.brq.redhat.com (ovpn-194-244.brq.redhat.com
 [10.40.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C51704B400F;
 Tue, 11 Oct 2022 11:18:24 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Julia Suvorova <jusual@redhat.com>
Subject: [PATCH v3 5/5] tests/acpi: update tables for new core count test
Date: Tue, 11 Oct 2022 13:17:31 +0200
Message-Id: <20221011111731.101412-6-jusual@redhat.com>
In-Reply-To: <20221011111731.101412-1-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
+            Processor (C001, 0x01, 0x00000000, 0x00)
+            {
+                Method (_STA, 0, Serialized)  // _STA: Status
+                {
+                    Return (CSTA (One))
+                }
+
+                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
+                {
+                     0x00, 0x08, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00   // ........
+                })
+                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                {
+                    CEJ0 (One)
+                }
+
+                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
+                {
+                    COST (One, Arg0, Arg1, Arg2)
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
+                    COST (0xFF, Arg0, Arg1, Arg2)
+                }
+            }
+
...

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20220731162141.178443-6-jusual@redhat.com>
---
 tests/data/acpi/q35/APIC.core-count2        | Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT.core-count2        | Bin 0 -> 32414 bytes
 tests/data/acpi/q35/FACP.core-count2        | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

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
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..aa1be16f4efe23711b776b16fe39b84086028bef 100644
GIT binary patch
literal 32414
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

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e81dc67a2e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.core-count2",
-"tests/data/acpi/q35/DSDT.core-count2",
-"tests/data/acpi/q35/FACP.core-count2",
-- 
2.37.3


