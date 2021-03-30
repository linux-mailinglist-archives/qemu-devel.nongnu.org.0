Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE334E185
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 08:50:40 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8D1-0006vW-89
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 02:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tetra2005@gmail.com>)
 id 1lR8Bp-0006WA-8V
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 02:49:25 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tetra2005@gmail.com>)
 id 1lR8Bk-0005nd-Q1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 02:49:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id l1so5643637plg.12
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cUhmhMNpknqZRRwJigcMQSyq3k5EJ5C4uoEKKyjbAMc=;
 b=qbWt6XurEA1HNYfFYONdiJecE9T30z4G9znw4hGLpnp1WDZehLpMB1lJnWtG8Gu5qA
 m+oai5guRugj1tG2rSFB2juQmmScJRck5CRRIgqX2PTih5G0CDVS470/jPOed8L8lt7f
 kl/Olfm5eG8dLYwZGy+kCHDYbc0fJJYhvsSmjEzz4VvdZmmhQBe2A5B2ZyRSEtiiZIGQ
 gkQSJqjlTmu6d9M8DKW72xIi1nmyOQ2YzlZ2EeGy/tjmJVGZeXypD2OS0TmXca5mFMEa
 H40LIBaGIql1Oat8uPcvc5Fn+18gj/GuNaIa7AnIwPJ+g9cMGITJBvAm5H/Ho4tVatIB
 R/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cUhmhMNpknqZRRwJigcMQSyq3k5EJ5C4uoEKKyjbAMc=;
 b=JL8hU1sx6/WC9d5GPWvigDeeWWhWYOlmxtdPGi4EkPPjTFmYipK11n/1qzHf9kKpfn
 MvOwN115ljOOkSeSl6svvwPvgyoIBAl4UgPJtf892OGzZ3CQfDMAYWCLxhfuvAaFs6MQ
 i+/tEmXBwTNrtWuCWsfuiMkDOxsQZxaaZNlSUyo8bzjGP96d0qg6YclOKBwr7HOBT3y5
 aY1FmKsx6JqDGoFLvCLz7B2d2qXNM1VsaaC5aFU5BlUji1R6zoeF7ZXxxg2eITlsR2q6
 P4IHLpjPs/kaqQq2yXb3VQqBi2/XmSo9qYoqmzaqfUfBa83bzN/Q3EPkXAvQgEk4laV9
 rUrA==
X-Gm-Message-State: AOAM532/cp4n1L0HLvHY/YD4ADC8a4EjmiuF9ytIcF37fj0A4SFWAgOP
 1TnalvLezzzBmfsf+ctYxDzXBpDOHwyKlIQLsWb4y1JbeKE=
X-Google-Smtp-Source: ABdhPJwX0vkPQ3BD8yxFKu56/5pxV8TiffRWCU/G+CVTlNd2kQWb/rqXNWRR9netVG4V/wSK17dvZuudl7oJPUT4jYk=
X-Received: by 2002:a17:902:7c06:b029:e6:adb4:7c19 with SMTP id
 x6-20020a1709027c06b02900e6adb47c19mr31913934pll.8.1617086958473; Mon, 29 Mar
 2021 23:49:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:b18:0:0:0:0 with HTTP; Mon, 29 Mar 2021 23:49:17
 -0700 (PDT)
In-Reply-To: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
From: Yuri Gribov <tetra2005@gmail.com>
Date: Tue, 30 Mar 2021 09:49:17 +0300
Message-ID: <CAJOtW+6S8bTZa-n33TpYoVJVge_6_Xm3=M6h=Sy+cYEe+GJ0DA@mail.gmail.com>
Subject: [PING] [PATCH] [NFC] Mark locally used symbols as static.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=tetra2005@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This patch makes locally used symbols static to enable more compiler
optimizations on them. Some of the symbols turned out to not be used
at all so I marked them with ATTRIBUTE_UNUSED (as I wasn't sure if
they were ok to delete).

The symbols have been identified with a pet project of mine:
https://github.com/yugr/Localizer

Link to patch: https://patchew.org/QEMU/CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkY=
buaRTynR_ngUxgHA@mail.gmail.com/

From 4e790fd06becfbbf6fb106ac52ae1e4515f1ac73 Mon Sep 17 00:00:00 2001
From: Yury Gribov <tetra2005@gmail.com>
Date: Sat, 20 Mar 2021 23:39:15 +0300
Subject: [PATCH] Mark locally used symbols as static.

Signed-off-by: Yury Gribov <tetra2005@gmail.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com> (xtensa)
Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc)
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com> (tracetool)
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com> (hexagon)
---
 disas/alpha.c                                 | 16 ++--
 disas/m68k.c                                  | 78 ++++++++---------
 disas/mips.c                                  | 14 ++--
 disas/nios2.c                                 | 84 +++++++++----------
 disas/ppc.c                                   | 26 +++---
 disas/riscv.c                                 |  2 +-
 pc-bios/optionrom/linuxboot_dma.c             |  4 +-
 scripts/tracetool/format/c.py                 |  2 +-
 target/hexagon/gen_dectree_import.c           |  2 +-
 target/hexagon/opcodes.c                      |  2 +-
 target/i386/cpu.c                             |  2 +-
 target/s390x/cpu_models.c                     |  2 +-
 .../xtensa/core-dc232b/xtensa-modules.c.inc   |  2 +-
 .../xtensa/core-dc233c/xtensa-modules.c.inc   |  2 +-
 target/xtensa/core-de212/xtensa-modules.c.inc |  2 +-
 .../core-de233_fpu/xtensa-modules.c.inc       |  2 +-
 .../xtensa/core-dsp3400/xtensa-modules.c.inc  |  2 +-
 target/xtensa/core-fsf/xtensa-modules.c.inc   |  2 +-
 .../xtensa-modules.c.inc                      |  2 +-
 .../core-test_kc705_be/xtensa-modules.c.inc   |  2 +-
 .../core-test_mmuhifi_c3/xtensa-modules.c.inc |  2 +-
 21 files changed, 125 insertions(+), 127 deletions(-)

diff --git a/disas/alpha.c b/disas/alpha.c
index 3db90fa665..361a4ed101 100644
--- a/disas/alpha.c
+++ b/disas/alpha.c
@@ -56,8 +56,8 @@ struct alpha_opcode
 /* The table itself is sorted by major opcode number, and is otherwise
    in the order in which the disassembler should consider
    instructions.  */
-extern const struct alpha_opcode alpha_opcodes[];
-extern const unsigned alpha_num_opcodes;
+static const struct alpha_opcode alpha_opcodes[];
+static const unsigned alpha_num_opcodes;

 /* Values defined for the flags field of a struct alpha_opcode.  */

@@ -137,8 +137,8 @@ struct alpha_operand
 /* Elements in the table are retrieved by indexing with values from
    the operands field of the alpha_opcodes table.  */

-extern const struct alpha_operand alpha_operands[];
-extern const unsigned alpha_num_operands;
+static const struct alpha_operand alpha_operands[];
+static const unsigned alpha_num_operands;

 /* Values defined for the flags field of a struct alpha_operand.  */

@@ -293,7 +293,7 @@ static int extract_ev6hwjhint (unsigned, int *);
 =0C
 /* The operands table  */

-const struct alpha_operand alpha_operands[] =3D
+static const struct alpha_operand alpha_operands[] =3D
 {
   /* The fields are bits, shift, insert, extract, flags */
   /* The zero index is used to indicate end-of-list */
@@ -424,7 +424,7 @@ const struct alpha_operand alpha_operands[] =3D
     insert_ev6hwjhint, extract_ev6hwjhint }
 };

-const unsigned alpha_num_operands =3D
sizeof(alpha_operands)/sizeof(*alpha_operands);
+static ATTRIBUTE_UNUSED const unsigned alpha_num_operands =3D
sizeof(alpha_operands)/sizeof(*alpha_operands);

 /* The RB field when it is the same as the RA field in the same insn.
    This operand is marked fake.  The insertion function just copies
@@ -706,7 +706,7 @@ extract_ev6hwjhint(unsigned insn, int *invalid
ATTRIBUTE_UNUSED)
 		that were not assigned to a particular extension.
 */

-const struct alpha_opcode alpha_opcodes[] =3D {
+static const struct alpha_opcode alpha_opcodes[] =3D {
   { "halt",		SPCD(0x00,0x0000), BASE, ARG_NONE },
   { "draina",		SPCD(0x00,0x0002), BASE, ARG_NONE },
   { "bpt",		SPCD(0x00,0x0080), BASE, ARG_NONE },
@@ -1732,7 +1732,7 @@ const struct alpha_opcode alpha_opcodes[] =3D {
   { "bgt",		BRA(0x3F), BASE, ARG_BRA },
 };

-const unsigned alpha_num_opcodes =3D
sizeof(alpha_opcodes)/sizeof(*alpha_opcodes);
+static ATTRIBUTE_UNUSED const unsigned alpha_num_opcodes =3D
sizeof(alpha_opcodes)/sizeof(*alpha_opcodes);

 /* OSF register names.  */

diff --git a/disas/m68k.c b/disas/m68k.c
index aefaecfbd6..903d5cfec4 100644
--- a/disas/m68k.c
+++ b/disas/m68k.c
@@ -95,29 +95,29 @@ struct floatformat

 /* floatformats for IEEE single and double, big and little endian.  */

-extern const struct floatformat floatformat_ieee_single_big;
-extern const struct floatformat floatformat_ieee_single_little;
-extern const struct floatformat floatformat_ieee_double_big;
-extern const struct floatformat floatformat_ieee_double_little;
+static const struct floatformat floatformat_ieee_single_big;
+static const struct floatformat floatformat_ieee_single_little;
+static const struct floatformat floatformat_ieee_double_big;
+static const struct floatformat floatformat_ieee_double_little;

 /* floatformat for ARM IEEE double, little endian bytes and big endian wor=
ds */

-extern const struct floatformat floatformat_ieee_double_littlebyte_bigword=
;
+static const struct floatformat floatformat_ieee_double_littlebyte_bigword=
;

 /* floatformats for various extendeds.  */

-extern const struct floatformat floatformat_i387_ext;
-extern const struct floatformat floatformat_m68881_ext;
-extern const struct floatformat floatformat_i960_ext;
-extern const struct floatformat floatformat_m88110_ext;
-extern const struct floatformat floatformat_m88110_harris_ext;
-extern const struct floatformat floatformat_arm_ext_big;
-extern const struct floatformat floatformat_arm_ext_littlebyte_bigword;
+static const struct floatformat floatformat_i387_ext;
+static const struct floatformat floatformat_m68881_ext;
+static const struct floatformat floatformat_i960_ext;
+static const struct floatformat floatformat_m88110_ext;
+static const struct floatformat floatformat_m88110_harris_ext;
+static const struct floatformat floatformat_arm_ext_big;
+static const struct floatformat floatformat_arm_ext_littlebyte_bigword;
 /* IA-64 Floating Point register spilt into memory.  */
-extern const struct floatformat floatformat_ia64_spill_big;
-extern const struct floatformat floatformat_ia64_spill_little;
-extern const struct floatformat floatformat_ia64_quad_big;
-extern const struct floatformat floatformat_ia64_quad_little;
+static const struct floatformat floatformat_ia64_spill_big;
+static const struct floatformat floatformat_ia64_spill_little;
+static const struct floatformat floatformat_ia64_quad_big;
+static const struct floatformat floatformat_ia64_quad_little;

 /* Convert from FMT to a double.
    FROM is the address of the extended float.
@@ -514,10 +514,10 @@ struct m68k_opcode_alias
    ]  first word, bit 10
 */

-extern const struct m68k_opcode m68k_opcodes[];
-extern const struct m68k_opcode_alias m68k_opcode_aliases[];
+static const struct m68k_opcode m68k_opcodes[];
+static const struct m68k_opcode_alias m68k_opcode_aliases[];

-extern const int m68k_numopcodes, m68k_numaliases;
+static const int m68k_numopcodes, m68k_numaliases;

 /* **** End of m68k-opcode.h */
 /* **** m68k-dis.c from sourceware.org CVS 2005-08-14.  */
@@ -2072,7 +2072,7 @@ print_insn_m68k (bfd_vma memaddr, disassemble_info *i=
nfo)
    be consecutive.  If they aren't, the assembler will bomb at
    runtime.  */

-const struct m68k_opcode m68k_opcodes[] =3D
+static const struct m68k_opcode m68k_opcodes[] =3D
 {
 {"abcd", 2,	one(0140400),	one(0170770), "DsDd", m68000up },
 {"abcd", 2,	one(0140410),	one(0170770), "-s-d", m68000up },
@@ -4212,7 +4212,7 @@ TBL("tblunb", "tblunw", "tblunl", 0, 0),
 {"wdebug", 4,	two(0175750, 03),	two(0177770, 0xffff), "ds", mcfisa_a },
 };

-const int m68k_numopcodes =3D sizeof m68k_opcodes / sizeof m68k_opcodes[0]=
;
+static const int m68k_numopcodes =3D sizeof m68k_opcodes / sizeof
m68k_opcodes[0];

 /* These aliases used to be in the above table, each one duplicating
    all of the entries for its primary exactly.  This table was
@@ -4221,7 +4221,7 @@ const int m68k_numopcodes =3D sizeof m68k_opcodes
/ sizeof m68k_opcodes[0];
    aliases above that could be moved down here, except for very minor
    differences.  */

-const struct m68k_opcode_alias m68k_opcode_aliases[] =3D
+static const struct m68k_opcode_alias m68k_opcode_aliases[] =3D
 {
   { "add",	"addw", },
   { "adda",	"addaw", },
@@ -4465,7 +4465,7 @@ const struct m68k_opcode_alias m68k_opcode_aliases[] =
=3D

 };

-const int m68k_numaliases =3D
+static ATTRIBUTE_UNUSED const int m68k_numaliases =3D
   sizeof m68k_opcode_aliases / sizeof m68k_opcode_aliases[0];
 /* **** End of m68k-opc.c */
 /* **** floatformat.c from sourceware.org CVS 2005-08-14.  */
@@ -4523,28 +4523,28 @@ floatformat_always_valid (const struct
floatformat *fmt ATTRIBUTE_UNUSED,
 #define FLOATFORMAT_CHAR_BIT 8

 /* floatformats for IEEE single and double, big and little endian.  */
-const struct floatformat floatformat_ieee_single_big =3D
+static const struct floatformat floatformat_ieee_single_big =3D
 {
   floatformat_big, 32, 0, 1, 8, 127, 255, 9, 23,
   floatformat_intbit_no,
   "floatformat_ieee_single_big",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ieee_single_little =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_ieee_single_little =3D
 {
   floatformat_little, 32, 0, 1, 8, 127, 255, 9, 23,
   floatformat_intbit_no,
   "floatformat_ieee_single_little",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ieee_double_big =3D
+static const struct floatformat floatformat_ieee_double_big =3D
 {
   floatformat_big, 64, 0, 1, 11, 1023, 2047, 12, 52,
   floatformat_intbit_no,
   "floatformat_ieee_double_big",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ieee_double_little =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_ieee_double_little =3D
 {
   floatformat_little, 64, 0, 1, 11, 1023, 2047, 12, 52,
   floatformat_intbit_no,
@@ -4555,7 +4555,7 @@ const struct floatformat floatformat_ieee_double_litt=
le =3D
 /* floatformat for IEEE double, little endian byte order, with big endian =
word
    ordering, as on the ARM.  */

-const struct floatformat floatformat_ieee_double_littlebyte_bigword =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_ieee_double_littlebyte_bigword =3D
 {
   floatformat_littlebyte_bigword, 64, 0, 1, 11, 1023, 2047, 12, 52,
   floatformat_intbit_no,
@@ -4586,14 +4586,14 @@ floatformat_i387_ext_is_valid (const struct
floatformat *fmt, const char *from)
     return 1;
 }

-const struct floatformat floatformat_i387_ext =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_i387_ext =3D
 {
   floatformat_little, 80, 0, 1, 15, 0x3fff, 0x7fff, 16, 64,
   floatformat_intbit_yes,
   "floatformat_i387_ext",
   floatformat_i387_ext_is_valid
 };
-const struct floatformat floatformat_m68881_ext =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_m68881_ext =
=3D
 {
   /* Note that the bits from 16 to 31 are unused.  */
   floatformat_big, 96, 0, 1, 15, 0x3fff, 0x7fff, 32, 64,
@@ -4601,7 +4601,7 @@ const struct floatformat floatformat_m68881_ext =3D
   "floatformat_m68881_ext",
   floatformat_always_valid
 };
-const struct floatformat floatformat_i960_ext =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_i960_ext =3D
 {
   /* Note that the bits from 0 to 15 are unused.  */
   floatformat_little, 96, 16, 17, 15, 0x3fff, 0x7fff, 32, 64,
@@ -4609,14 +4609,14 @@ const struct floatformat floatformat_i960_ext =3D
   "floatformat_i960_ext",
   floatformat_always_valid
 };
-const struct floatformat floatformat_m88110_ext =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_m88110_ext =
=3D
 {
   floatformat_big, 80, 0, 1, 15, 0x3fff, 0x7fff, 16, 64,
   floatformat_intbit_yes,
   "floatformat_m88110_ext",
   floatformat_always_valid
 };
-const struct floatformat floatformat_m88110_harris_ext =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_m88110_harris_ext =3D
 {
   /* Harris uses raw format 128 bytes long, but the number is just an ieee
      double, and the last 64 bits are wasted. */
@@ -4625,7 +4625,7 @@ const struct floatformat floatformat_m88110_harris_ex=
t =3D
   "floatformat_m88110_ext_harris",
   floatformat_always_valid
 };
-const struct floatformat floatformat_arm_ext_big =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_arm_ext_big =
=3D
 {
   /* Bits 1 to 16 are unused.  */
   floatformat_big, 96, 0, 17, 15, 0x3fff, 0x7fff, 32, 64,
@@ -4633,7 +4633,7 @@ const struct floatformat floatformat_arm_ext_big =3D
   "floatformat_arm_ext_big",
   floatformat_always_valid
 };
-const struct floatformat floatformat_arm_ext_littlebyte_bigword =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_arm_ext_littlebyte_bigword =3D
 {
   /* Bits 1 to 16 are unused.  */
   floatformat_littlebyte_bigword, 96, 0, 17, 15, 0x3fff, 0x7fff, 32, 64,
@@ -4641,28 +4641,28 @@ const struct floatformat
floatformat_arm_ext_littlebyte_bigword =3D
   "floatformat_arm_ext_littlebyte_bigword",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ia64_spill_big =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_ia64_spill_bi=
g =3D
 {
   floatformat_big, 128, 0, 1, 17, 65535, 0x1ffff, 18, 64,
   floatformat_intbit_yes,
   "floatformat_ia64_spill_big",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ia64_spill_little =3D
+static ATTRIBUTE_UNUSED const struct floatformat
floatformat_ia64_spill_little =3D
 {
   floatformat_little, 128, 0, 1, 17, 65535, 0x1ffff, 18, 64,
   floatformat_intbit_yes,
   "floatformat_ia64_spill_little",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ia64_quad_big =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_ia64_quad_big=
 =3D
 {
   floatformat_big, 128, 0, 1, 15, 16383, 0x7fff, 16, 112,
   floatformat_intbit_no,
   "floatformat_ia64_quad_big",
   floatformat_always_valid
 };
-const struct floatformat floatformat_ia64_quad_little =3D
+static ATTRIBUTE_UNUSED const struct floatformat floatformat_ia64_quad_lit=
tle =3D
 {
   floatformat_little, 128, 0, 1, 15, 16383, 0x7fff, 16, 112,
   floatformat_intbit_no,
diff --git a/disas/mips.c b/disas/mips.c
index b9a5204304..b43700be9c 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -931,10 +931,9 @@ enum
    Many instructions are short hand for other instructions (i.e., The
    jal <register> instruction is short for jalr <register>).  */

-extern const struct mips_opcode mips_builtin_opcodes[];
-extern const int bfd_mips_num_builtin_opcodes;
-extern struct mips_opcode *mips_opcodes;
-extern int bfd_mips_num_opcodes;
+static const struct mips_opcode mips_builtin_opcodes[];
+static struct mips_opcode *mips_opcodes;
+static int bfd_mips_num_opcodes;
 #define NUMOPCODES bfd_mips_num_opcodes

 =0C
@@ -1259,7 +1258,7 @@ extern const int bfd_mips16_num_opcodes;
    Many instructions are short hand for other instructions (i.e., The
    jal <register> instruction is short for jalr <register>).  */

-const struct mips_opcode mips_builtin_opcodes[] =3D
+static const struct mips_opcode mips_builtin_opcodes[] =3D
 {
 /* These instructions appear first so that the disassembler will find
    them first.  The assemblers uses a hash table based on the
@@ -3509,13 +3508,12 @@ const struct mips_opcode mips_builtin_opcodes[] =3D

 #define MIPS_NUM_OPCODES \
 	((sizeof mips_builtin_opcodes) / (sizeof (mips_builtin_opcodes[0])))
-const int bfd_mips_num_builtin_opcodes =3D MIPS_NUM_OPCODES;

 /* const removed from the following to allow for dynamic extensions to the
  * built-in instruction set. */
-struct mips_opcode *mips_opcodes =3D
+static struct mips_opcode *mips_opcodes =3D
   (struct mips_opcode *) mips_builtin_opcodes;
-int bfd_mips_num_opcodes =3D MIPS_NUM_OPCODES;
+static int bfd_mips_num_opcodes =3D MIPS_NUM_OPCODES;
 #undef MIPS_NUM_OPCODES

 /* Mips instructions are at maximum this many bytes long.  */
diff --git a/disas/nios2.c b/disas/nios2.c
index c3e82140c7..089ae6ef6f 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -1720,38 +1720,38 @@ struct nios2_reg


 /* These are the data structures used to hold the instruction information.=
  */
-extern const struct nios2_opcode nios2_r1_opcodes[];
-extern const int nios2_num_r1_opcodes;
-extern const struct nios2_opcode nios2_r2_opcodes[];
-extern const int nios2_num_r2_opcodes;
-extern struct nios2_opcode *nios2_opcodes;
-extern int nios2_num_opcodes;
+static const struct nios2_opcode nios2_r1_opcodes[];
+static const int nios2_num_r1_opcodes;
+static const struct nios2_opcode nios2_r2_opcodes[];
+static const int nios2_num_r2_opcodes;
+static struct nios2_opcode *nios2_opcodes;
+static int nios2_num_opcodes;

 /* These are the data structures used to hold the register information.  *=
/
-extern const struct nios2_reg nios2_builtin_regs[];
-extern struct nios2_reg *nios2_regs;
-extern const int nios2_num_builtin_regs;
-extern int nios2_num_regs;
+static const struct nios2_reg nios2_builtin_regs[];
+static struct nios2_reg *nios2_regs;
+static const int nios2_num_builtin_regs;
+static int nios2_num_regs;

 /* Return the opcode descriptor for a single instruction.  */
-extern const struct nios2_opcode *
+static const struct nios2_opcode *
 nios2_find_opcode_hash (unsigned long, unsigned long);

 /* Lookup tables for R2 immediate decodings.  */
-extern unsigned int nios2_r2_asi_n_mappings[];
-extern const int nios2_num_r2_asi_n_mappings;
-extern unsigned int nios2_r2_shi_n_mappings[];
-extern const int nios2_num_r2_shi_n_mappings;
-extern unsigned int nios2_r2_andi_n_mappings[];
-extern const int nios2_num_r2_andi_n_mappings;
+static unsigned int nios2_r2_asi_n_mappings[];
+static const int nios2_num_r2_asi_n_mappings;
+static unsigned int nios2_r2_shi_n_mappings[];
+static const int nios2_num_r2_shi_n_mappings;
+static unsigned int nios2_r2_andi_n_mappings[];
+static const int nios2_num_r2_andi_n_mappings;

 /* Lookup table for 3-bit register decodings.  */
-extern int nios2_r2_reg3_mappings[];
-extern const int nios2_num_r2_reg3_mappings;
+static int nios2_r2_reg3_mappings[];
+static const int nios2_num_r2_reg3_mappings;

 /* Lookup table for REG_RANGE value list decodings.  */
-extern unsigned long nios2_r2_reg_range_mappings[];
-extern const int nios2_num_r2_reg_range_mappings;
+static unsigned long nios2_r2_reg_range_mappings[];
+static const int nios2_num_r2_reg_range_mappings;

 #endif /* _NIOS2_H */

@@ -1760,7 +1760,7 @@ extern const int nios2_num_r2_reg_range_mappings;
 */
 /* Register string table */

-const struct nios2_reg nios2_builtin_regs[] =3D {
+static const struct nios2_reg nios2_builtin_regs[] =3D {
   /* Standard register names.  */
   {"zero", 0, REG_NORMAL},
   {"at", 1, REG_NORMAL},			/* assembler temporary */
@@ -1896,17 +1896,17 @@ const struct nios2_reg nios2_builtin_regs[] =3D {

 #define NIOS2_NUM_REGS \
        ((sizeof nios2_builtin_regs) / (sizeof (nios2_builtin_regs[0])))
-const int nios2_num_builtin_regs =3D NIOS2_NUM_REGS;
+static ATTRIBUTE_UNUSED const int nios2_num_builtin_regs =3D NIOS2_NUM_REG=
S;

 /* This is not const in order to allow for dynamic extensions to the
    built-in instruction set.  */
-struct nios2_reg *nios2_regs =3D (struct nios2_reg *) nios2_builtin_regs;
-int nios2_num_regs =3D NIOS2_NUM_REGS;
+static struct nios2_reg *nios2_regs =3D (struct nios2_reg *) nios2_builtin=
_regs;
+static int nios2_num_regs =3D NIOS2_NUM_REGS;
 #undef NIOS2_NUM_REGS

 /* This is the opcode table used by the Nios II GNU as, disassembler
    and GDB.  */
-const struct nios2_opcode nios2_r1_opcodes[] =3D
+static const struct nios2_opcode nios2_r1_opcodes[] =3D
 {
   /* { name, args, args_test, num_args, size, format,
        match, mask, pinfo, overflow } */
@@ -2134,10 +2134,10 @@ const struct nios2_opcode nios2_r1_opcodes[] =3D

 #define NIOS2_NUM_R1_OPCODES \
        ((sizeof nios2_r1_opcodes) / (sizeof (nios2_r1_opcodes[0])))
-const int nios2_num_r1_opcodes =3D NIOS2_NUM_R1_OPCODES;
+static const int nios2_num_r1_opcodes =3D NIOS2_NUM_R1_OPCODES;


-const struct nios2_opcode nios2_r2_opcodes[] =3D
+static const struct nios2_opcode nios2_r2_opcodes[] =3D
 {
   /* { name, args, args_test, num_args, size, format,
        match, mask, pinfo, overflow } */
@@ -2474,37 +2474,37 @@ const struct nios2_opcode nios2_r2_opcodes[] =3D

 #define NIOS2_NUM_R2_OPCODES \
        ((sizeof nios2_r2_opcodes) / (sizeof (nios2_r2_opcodes[0])))
-const int nios2_num_r2_opcodes =3D NIOS2_NUM_R2_OPCODES;
+static const int nios2_num_r2_opcodes =3D NIOS2_NUM_R2_OPCODES;

 /* Default to using the R1 instruction tables.  */
-struct nios2_opcode *nios2_opcodes =3D (struct nios2_opcode *) nios2_r1_op=
codes;
-int nios2_num_opcodes =3D NIOS2_NUM_R1_OPCODES;
+static ATTRIBUTE_UNUSED struct nios2_opcode *nios2_opcodes =3D (struct
nios2_opcode *) nios2_r1_opcodes;
+static ATTRIBUTE_UNUSED int nios2_num_opcodes =3D NIOS2_NUM_R1_OPCODES;
 #undef NIOS2_NUM_R1_OPCODES
 #undef NIOS2_NUM_R2_OPCODES

 /* Decodings for R2 asi.n (addi.n/subi.n) immediate values.  */
-unsigned int nios2_r2_asi_n_mappings[] =3D
+static unsigned int nios2_r2_asi_n_mappings[] =3D
   {1, 2, 4, 8, 16, 32, 64, 128};
-const int nios2_num_r2_asi_n_mappings =3D 8;
+static ATTRIBUTE_UNUSED const int nios2_num_r2_asi_n_mappings =3D 8;

 /* Decodings for R2 shi.n (slli.n/srli.n) immediate values.  */
-unsigned int nios2_r2_shi_n_mappings[] =3D
+static unsigned int nios2_r2_shi_n_mappings[] =3D
   {1, 2, 3, 8, 12, 16, 24, 31};
-const int nios2_num_r2_shi_n_mappings =3D 8;
+static ATTRIBUTE_UNUSED const int nios2_num_r2_shi_n_mappings =3D 8;

 /* Decodings for R2 andi.n immediate values.  */
-unsigned int nios2_r2_andi_n_mappings[] =3D
+static unsigned int nios2_r2_andi_n_mappings[] =3D
   {1, 2, 3, 4, 8, 0xf, 0x10, 0x1f,
    0x20, 0x3f, 0x7f, 0x80, 0xff, 0x7ff, 0xff00, 0xffff};
-const int nios2_num_r2_andi_n_mappings =3D 16;
+static ATTRIBUTE_UNUSED const int nios2_num_r2_andi_n_mappings =3D 16;

 /* Decodings for R2 3-bit register fields.  */
-int nios2_r2_reg3_mappings[] =3D
+static int nios2_r2_reg3_mappings[] =3D
   {16, 17, 2, 3, 4, 5, 6, 7};
-const int nios2_num_r2_reg3_mappings =3D 8;
+static ATTRIBUTE_UNUSED const int nios2_num_r2_reg3_mappings =3D 8;

 /* Decodings for R2 push.n/pop.n REG_RANGE value list.  */
-unsigned long nios2_r2_reg_range_mappings[] =3D {
+static unsigned long nios2_r2_reg_range_mappings[] =3D {
   0x00010000,
   0x00030000,
   0x00070000,
@@ -2514,7 +2514,7 @@ unsigned long nios2_r2_reg_range_mappings[] =3D {
   0x007f0000,
   0x00ff0000
 };
-const int nios2_num_r2_reg_range_mappings =3D 8;
+static ATTRIBUTE_UNUSED const int nios2_num_r2_reg_range_mappings =3D 8;

 /*#include "sysdep.h"
 #include "dis-asm.h"
@@ -2668,7 +2668,7 @@ nios2_init_opcode_hash (nios2_disassembler_state *sta=
te)

 /* Return a pointer to an nios2_opcode struct for a given instruction
    word OPCODE for bfd machine MACH, or NULL if there is an error.  */
-const struct nios2_opcode *
+static const struct nios2_opcode *
 nios2_find_opcode_hash (unsigned long opcode, unsigned long mach)
 {
   nios2_opcode_hash *entry;
diff --git a/disas/ppc.c b/disas/ppc.c
index 02be878198..30ca8acf53 100644
--- a/disas/ppc.c
+++ b/disas/ppc.c
@@ -74,8 +74,8 @@ struct powerpc_opcode
 /* The table itself is sorted by major opcode number, and is otherwise
    in the order in which the disassembler should consider
    instructions.  */
-extern const struct powerpc_opcode powerpc_opcodes[];
-extern const int powerpc_num_opcodes;
+static const struct powerpc_opcode powerpc_opcodes[];
+static const int powerpc_num_opcodes;

 /* Values defined for the flags field of a struct powerpc_opcode.  */

@@ -225,8 +225,8 @@ struct powerpc_operand
 /* Elements in the table are retrieved by indexing with values from
    the operands field of the powerpc_opcodes table.  */

-extern const struct powerpc_operand powerpc_operands[];
-extern const unsigned int num_powerpc_operands;
+static const struct powerpc_operand powerpc_operands[];
+static const unsigned int num_powerpc_operands;

 /* Values defined for the flags field of a struct powerpc_operand.  */

@@ -341,8 +341,8 @@ struct powerpc_macro
   const char *format;
 };

-extern const struct powerpc_macro powerpc_macros[];
-extern const int powerpc_num_macros;
+static const struct powerpc_macro powerpc_macros[];
+static const int powerpc_num_macros;

 /* ppc-opc.c -- PowerPC opcode list
    Copyright 1994, 1995, 1996, 1997, 1998, 2000, 2001, 2002, 2003, 2004,
@@ -425,7 +425,7 @@ static long extract_tbr (unsigned long, int, int *);
    omit the parens, since the macros are never used in a context where
    the addition will be ambiguous.  */

-const struct powerpc_operand powerpc_operands[] =3D
+static const struct powerpc_operand powerpc_operands[] =3D
 {
   /* The zero index is used to indicate the end of the list of
      operands.  */
@@ -893,8 +893,8 @@ const struct powerpc_operand powerpc_operands[] =3D
   { 0x1, 25, NULL, NULL, PPC_OPERAND_OPTIONAL},
 };

-const unsigned int num_powerpc_operands =3D (sizeof (powerpc_operands)
-					   / sizeof (powerpc_operands[0]));
+static ATTRIBUTE_UNUSED const unsigned int num_powerpc_operands =3D
+  sizeof (powerpc_operands) / sizeof (powerpc_operands[0]);

 /* The functions used to insert and extract complicated operands.  */

@@ -2011,7 +2011,7 @@ extract_tbr (unsigned long insn,
    specific instructions before more general instructions.  It is also
    sorted by major opcode.  */

-const struct powerpc_opcode powerpc_opcodes[] =3D {
+static const struct powerpc_opcode powerpc_opcodes[] =3D {
 { "attn",    X(0,256), X_MASK,		POWER4,		{ 0 } },
 { "tdlgti",  OPTO(2,TOLGT), OPTO_MASK,	PPC64,		{ RA, SI } },
 { "tdllti",  OPTO(2,TOLLT), OPTO_MASK,	PPC64,		{ RA, SI } },
@@ -5036,7 +5036,7 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {

 };

-const int powerpc_num_opcodes =3D
+static const int powerpc_num_opcodes =3D
   sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
 =0C
 /* The macro table.  This is only used by the assembler.  */
@@ -5051,7 +5051,7 @@ const int powerpc_num_opcodes =3D
    the underlying instructions don't support extracting 0 bits but do
    support extracting the whole word (32 bits in this case).  */

-const struct powerpc_macro powerpc_macros[] =3D {
+static const struct powerpc_macro powerpc_macros[] =3D {
 { "extldi",  4,   PPC64,	"rldicr %0,%1,%3,(%2)-1" },
 { "extldi.", 4,   PPC64,	"rldicr. %0,%1,%3,(%2)-1" },
 { "extrdi",  4,   PPC64,	"rldicl %0,%1,(%2)+(%3),64-(%2)" },
@@ -5093,7 +5093,7 @@ const struct powerpc_macro powerpc_macros[] =3D {
 { "clrlslwi.",4,  PPCCOM,	"rlwinm. %0,%1,%3,(%2)-(%3),31-(%3)" },
 };

-const int powerpc_num_macros =3D
+static ATTRIBUTE_UNUSED const int powerpc_num_macros =3D
   sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);


diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..0d124d8b61 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -789,7 +789,7 @@ static const rv_comp_data rvcp_fsgnjx_q[] =3D {

 /* instruction metadata */

-const rv_opcode_data opcode_data[] =3D {
+static const rv_opcode_data opcode_data[] =3D {
     { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
     { "lui", rv_codec_u, rv_fmt_rd_imm, NULL, 0, 0, 0 },
     { "auipc", rv_codec_u, rv_fmt_rd_offset, NULL, 0, 0, 0 },
diff --git a/pc-bios/optionrom/linuxboot_dma.c
b/pc-bios/optionrom/linuxboot_dma.c
index cbcf6679d9..a3d5cf76aa 100644
--- a/pc-bios/optionrom/linuxboot_dma.c
+++ b/pc-bios/optionrom/linuxboot_dma.c
@@ -132,9 +132,9 @@ static uint32_t get_e801_addr(void)
 }

 /* Force the asm name without leading underscore, even on Win32. */
-extern void load_kernel(void) asm("load_kernel");
+static void load_kernel(void) asm("load_kernel");

-void load_kernel(void)
+static __attribute__((used)) void load_kernel(void)
 {
     void *setup_addr;
     void *initrd_addr;
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index c390c1844a..7e89ba37f9 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -49,7 +49,7 @@ def generate(events, backend, group):
             sstate =3D "TRACE_%s_ENABLED" % e.name.upper(),
             dstate =3D e.api(e.QEMU_DSTATE))

-    out('TraceEvent *%(group)s_trace_events[] =3D {',
+    out('static TraceEvent *%(group)s_trace_events[] =3D {',
         group =3D group.lower())

     for e in events:
diff --git a/target/hexagon/gen_dectree_import.c
b/target/hexagon/gen_dectree_import.c
index 5b7ecfc6b3..20caee5a2f 100644
--- a/target/hexagon/gen_dectree_import.c
+++ b/target/hexagon/gen_dectree_import.c
@@ -41,7 +41,7 @@ const char * const opcode_names[] =3D {
  *         "Add 32-bit registers",
  *         { RdV=3DRsV+RtV;})
  */
-const char * const opcode_syntax[XX_LAST_OPCODE] =3D {
+static const char * const opcode_syntax[XX_LAST_OPCODE] =3D {
 #define Q6INSN(TAG, BEH, ATTRIBS, DESCR, SEM) \
    [TAG] =3D BEH,
 #define EXTINSN(TAG, BEH, ATTRIBS, DESCR, SEM) \
diff --git a/target/hexagon/opcodes.c b/target/hexagon/opcodes.c
index 35d790cdd5..586e70dd6a 100644
--- a/target/hexagon/opcodes.c
+++ b/target/hexagon/opcodes.c
@@ -65,7 +65,7 @@ const char * const opcode_wregs[] =3D {
 #undef IMMINFO
 };

-const char * const opcode_short_semantics[] =3D {
+static const char * const opcode_short_semantics[] =3D {
 #define DEF_SHORTCODE(TAG, SHORTCODE)              [TAG] =3D #SHORTCODE,
 #include "shortcode_generated.h.inc"
 #undef DEF_SHORTCODE
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f1..69d3bc2a9b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -78,7 +78,7 @@ struct CPUID2CacheDescriptorInfo {
  * Known CPUID 2 cache descriptors.
  * From Intel SDM Volume 2A, CPUID instruction
  */
-struct CPUID2CacheDescriptorInfo cpuid2_cache_descriptors[] =3D {
+static struct CPUID2CacheDescriptorInfo cpuid2_cache_descriptors[] =3D {
     [0x06] =3D { .level =3D 1, .type =3D INSTRUCTION_CACHE, .size =3D   8 =
* KiB,
                .associativity =3D 4,  .line_size =3D 32, },
     [0x08] =3D { .level =3D 1, .type =3D INSTRUCTION_CACHE, .size =3D  16 =
* KiB,
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 050dcf2d42..56c54227f7 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -97,7 +97,7 @@ static const S390FeatInit qemu_max_cpu_feat_init =3D {
S390_FEAT_LIST_QEMU_MAX };
 static S390FeatBitmap qemu_max_cpu_feat;

 /* features part of a base model but not relevant for finding a base model=
 */
-S390FeatBitmap ignored_base_feat;
+static S390FeatBitmap ignored_base_feat;

 void s390_cpudef_featoff(uint8_t gen, uint8_t ec_ga, S390Feat feat)
 {
diff --git a/target/xtensa/core-dc232b/xtensa-modules.c.inc
b/target/xtensa/core-dc232b/xtensa-modules.c.inc
index 164df3b1a4..8bef6535ba 100644
--- a/target/xtensa/core-dc232b/xtensa-modules.c.inc
+++ b/target/xtensa/core-dc232b/xtensa-modules.c.inc
@@ -14060,7 +14060,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-dc233c/xtensa-modules.c.inc
b/target/xtensa/core-dc233c/xtensa-modules.c.inc
index 0f32f0804a..24a63a4faf 100644
--- a/target/xtensa/core-dc233c/xtensa-modules.c.inc
+++ b/target/xtensa/core-dc233c/xtensa-modules.c.inc
@@ -15187,7 +15187,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-de212/xtensa-modules.c.inc
b/target/xtensa/core-de212/xtensa-modules.c.inc
index 480c68d3c6..19f0d7f5b6 100644
--- a/target/xtensa/core-de212/xtensa-modules.c.inc
+++ b/target/xtensa/core-de212/xtensa-modules.c.inc
@@ -14525,7 +14525,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-de233_fpu/xtensa-modules.c.inc
b/target/xtensa/core-de233_fpu/xtensa-modules.c.inc
index 129c023514..e35ca06243 100644
--- a/target/xtensa/core-de233_fpu/xtensa-modules.c.inc
+++ b/target/xtensa/core-de233_fpu/xtensa-modules.c.inc
@@ -20740,7 +20740,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-dsp3400/xtensa-modules.c.inc
b/target/xtensa/core-dsp3400/xtensa-modules.c.inc
index 28ea3d75fe..4adc52fec3 100644
--- a/target/xtensa/core-dsp3400/xtensa-modules.c.inc
+++ b/target/xtensa/core-dsp3400/xtensa-modules.c.inc
@@ -171888,7 +171888,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   8 /* insn_size */, 0,
   10, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-fsf/xtensa-modules.c.inc
b/target/xtensa/core-fsf/xtensa-modules.c.inc
index c32683ff77..7e7268a224 100644
--- a/target/xtensa/core-fsf/xtensa-modules.c.inc
+++ b/target/xtensa/core-fsf/xtensa-modules.c.inc
@@ -9808,7 +9808,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   1 /* big-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-sample_controller/xtensa-modules.c.inc
b/target/xtensa/core-sample_controller/xtensa-modules.c.inc
index 7e87d216bd..10d56e0118 100644
--- a/target/xtensa/core-sample_controller/xtensa-modules.c.inc
+++ b/target/xtensa/core-sample_controller/xtensa-modules.c.inc
@@ -11348,7 +11348,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   3 /* insn_size */, 0,
   3, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-test_kc705_be/xtensa-modules.c.inc
b/target/xtensa/core-test_kc705_be/xtensa-modules.c.inc
index bc7cf44828..9c0c78e250 100644
--- a/target/xtensa/core-test_kc705_be/xtensa-modules.c.inc
+++ b/target/xtensa/core-test_kc705_be/xtensa-modules.c.inc
@@ -45099,7 +45099,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   1 /* big-endian */,
   8 /* insn_size */, 0,
   4, formats, format_decoder, length_decoder,
diff --git a/target/xtensa/core-test_mmuhifi_c3/xtensa-modules.c.inc
b/target/xtensa/core-test_mmuhifi_c3/xtensa-modules.c.inc
index 28561147fc..863fcd5b4f 100644
--- a/target/xtensa/core-test_mmuhifi_c3/xtensa-modules.c.inc
+++ b/target/xtensa/core-test_mmuhifi_c3/xtensa-modules.c.inc
@@ -36369,7 +36369,7 @@ length_decoder (const unsigned char *insn)
 =0C
 /* Top-level ISA structure.  */

-xtensa_isa_internal xtensa_modules =3D {
+static xtensa_isa_internal xtensa_modules =3D {
   0 /* little-endian */,
   8 /* insn_size */, 0,
   4, formats, format_decoder, length_decoder,
--=20
2.17.1


--=20
Best regards,
Yuri Gribov

