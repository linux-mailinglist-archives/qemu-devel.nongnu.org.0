Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495EB74ABA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:58:25 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqaW0-00056V-Gy
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaVm-0004UI-Hh
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqaVl-0002dg-8S
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:58:10 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.235]:1120)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqaVa-0002Rn-2Q; Thu, 25 Jul 2019 05:57:58 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 25 Jul 2019 11:03:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Thu, 25 Jul 2019 10:57:55 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Thu, 25 Jul
 2019 10:57:55 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v4 15/15] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVQs9uLEMqUZ3ld0+bhrlLpSjQYw==
Date: Thu, 25 Jul 2019 09:57:55 +0000
Message-ID: <1564048675499.36136@bt.com>
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.235
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v4 15/15] target/sparc: sun4u Invert Endian TTE
 bit
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 arikalo@wavecomp.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 rth@twiddle.net, atar4qemu@gmail.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 shorne@gmail.com, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bit configures endianness of PCI MMIO devices. It is used by
Solaris and OpenBSD sunhme drivers.

Tested working on OpenBSD.

Unfortunately Solaris 10 had a unrelated keyboard issue blocking
testing... another inch towards Solaris 10 on SPARC64 =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/sparc/cpu.h        | 2 ++
 target/sparc/mmu_helper.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 8ed2250..77e8e07 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -277,6 +277,7 @@ enum {

 #define TTE_VALID_BIT       (1ULL << 63)
 #define TTE_NFO_BIT         (1ULL << 60)
+#define TTE_IE_BIT          (1ULL << 59)
 #define TTE_USED_BIT        (1ULL << 41)
 #define TTE_LOCKED_BIT      (1ULL <<  6)
 #define TTE_SIDEEFFECT_BIT  (1ULL <<  3)
@@ -293,6 +294,7 @@ enum {

 #define TTE_IS_VALID(tte)   ((tte) & TTE_VALID_BIT)
 #define TTE_IS_NFO(tte)     ((tte) & TTE_NFO_BIT)
+#define TTE_IS_IE(tte)      ((tte) & TTE_IE_BIT)
 #define TTE_IS_USED(tte)    ((tte) & TTE_USED_BIT)
 #define TTE_IS_LOCKED(tte)  ((tte) & TTE_LOCKED_BIT)
 #define TTE_IS_SIDEEFFECT(tte) ((tte) & TTE_SIDEEFFECT_BIT)
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 826e14b..77dc86a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -537,6 +537,10 @@ static int get_physical_address_data(CPUSPARCState *en=
v, hwaddr *physical,
         if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical=
)) {
             int do_fault =3D 0;

+            if (TTE_IS_IE(env->dtlb[i].tte)) {
+                attrs->byte_swap =3D true;
+            }
+
             /* access ok? */
             /* multiple bits in SFSR.FT may be set on TT_DFAULT */
             if (TTE_IS_PRIV(env->dtlb[i].tte) && is_user) {
@@ -792,7 +796,7 @@ void dump_mmu(CPUSPARCState *env)
             }
             if (TTE_IS_VALID(env->dtlb[i].tte)) {
                 qemu_printf("[%02u] VA: %" PRIx64 ", PA: %llx"
-                            ", %s, %s, %s, %s, ctx %" PRId64 " %s\n",
+                            ", %s, %s, %s, %s, ie %s, ctx %" PRId64 " %s\n=
",
                             i,
                             env->dtlb[i].tag & (uint64_t)~0x1fffULL,
                             TTE_PA(env->dtlb[i].tte),
@@ -801,6 +805,8 @@ void dump_mmu(CPUSPARCState *env)
                             TTE_IS_W_OK(env->dtlb[i].tte) ? "RW" : "RO",
                             TTE_IS_LOCKED(env->dtlb[i].tte) ?
                             "locked" : "unlocked",
+                            TTE_IS_IE(env->dtlb[i].tte) ?
+                            "yes" : "no",
                             env->dtlb[i].tag & (uint64_t)0x1fffULL,
                             TTE_IS_GLOBAL(env->dtlb[i].tte) ?
                             "global" : "local");
--
1.8.3.1



