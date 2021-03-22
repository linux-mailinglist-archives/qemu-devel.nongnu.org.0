Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3423934505A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:57:34 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQg8-0005yf-Rd
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tetra2005@gmail.com>)
 id 1lOQeT-0004o2-Tk
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:55:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tetra2005@gmail.com>)
 id 1lOQeO-0003le-OF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:55:49 -0400
Received: by mail-pf1-x433.google.com with SMTP id l3so11825801pfc.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=hFRQH7E1lZeH2p5BNSJr/yYIZzdrbitpgM29otwY0mY=;
 b=LOeT/UYrGkTu5zfRM3w0BiPdoQlLyDMYQw7QIAlj3ndoiTqpIRHXe0Asla4c2ELBaI
 hjslo2bfeZBHm0EpOJSmW0vz+CICJ807GMjRqBW/MZnmLdQIq1XUwKernTrZF+icFjA5
 L6P7B7KC0spPyfF3kGbHQCpS3+7hwhUe5AZ0BOsv5BT7LNAtQelndLwgzQ5J0FLwZjdC
 hZzmPq7YqgrN7ZTVDwCY+HUpRV6mp3gcVMX2c1V91zyA5xw1J5hJOQP2lBepM4P/tmqv
 qINXhvZDLihUaILeMcPL7l1wfBFGA5g6U39WC1DzyV3ozS0ABHAGRFRsjGvc2ix31QO1
 F11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=hFRQH7E1lZeH2p5BNSJr/yYIZzdrbitpgM29otwY0mY=;
 b=GIpEkH1Yo29MlLZhtzyLay4fSG9JTNMYreJhpSb+iTO7SWLCwNonai+uL/ZBjM8ujy
 BNTPAEw/0yHn4u7h91VWCnCDJrplxDTUYsBFtRQaRgoP5rQcPUzHEsEM/wHGs6jpkCYf
 t5aK0AV7+RSI5PA2fKnhsep1L+C09oppCeo5USpOBGhNRI/HpzX5hFGSTXO70RV7MRSH
 DqTRODljoCywMSKBYBz179aLnijNrS2PEiBVTwGVe+yhP7OC4S9NIb9Z1eP/nUlkDh8z
 zhRrtheYopW1pQvYyXUPDNR9meaQ3381RaB4fRApEbc63zX98mwVeeUtOO7gSMg7XHbR
 GGNw==
X-Gm-Message-State: AOAM531t9b2/QND8dDUAwZtBEnsg9s1e1DWvVnFJO26rzgn0m4cFG+OF
 mrYRd/DYiadnyoX9uwN2p7olLzKG2tFl/8ImCvSpv1ko
X-Google-Smtp-Source: ABdhPJzOEWl6wC+7XPMWVzIbwoCNOV3z8XSpM2+wD5iRld/oBBFtvrdnAo7N3NbS3NI+WFqaKKNvQm/KL7FQ8qprHTk=
X-Received: by 2002:aa7:8d04:0:b029:1ed:2328:f677 with SMTP id
 j4-20020aa78d040000b02901ed2328f677mr1396673pfe.26.1616442942618; Mon, 22 Mar
 2021 12:55:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:b18:0:0:0:0 with HTTP; Mon, 22 Mar 2021 12:55:42
 -0700 (PDT)
From: Yuri Gribov <tetra2005@gmail.com>
Date: Mon, 22 Mar 2021 22:55:42 +0300
Message-ID: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
Subject: [PATCH] [NFC] Mark locally used symbols as static.
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=tetra2005@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Cornelia Huck <cohuck@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This patch makes locally used symbols static to enable more compiler
optimizations on them. Some of the symbols turned out to not be used
at all so I marked them with ATTRIBUTE_UNUSED (as I wasn't sure if
they were ok to delete).

The symbols have been identified with a pet project of mine:
https://github.com/yugr/Localizer

From 07b4f05893b7037e68e5d7bdec5ba8e74e509999 Mon Sep 17 00:00:00 2001
From: Yury Gribov <tetra2005@gmail.com>
Date: Sat, 20 Mar 2021 23:39:15 +0300
Subject: [PATCH] [NFC] Mark locally used symbols as static.

Signed-off-by: Yury Gribov <tetra2005@gmail.com>
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
index 3db90fa..361a4ed 100644
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
index aefaecf..903d5cf 100644
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
index b9a5204..b43700b 100644
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
index c3e8214..089ae6e 100644
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
index 02be878..30ca8ac 100644
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
index 278d9be..0d124d8 100644
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
index cbcf667..a3d5cf7 100644
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
index c390c18..7e89ba3 100644
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
index 5b7ecfc..20caee5 100644
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
index 35d790c..586e70d 100644
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
index ae9fd9f..58b8abf 100644
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
index 050dcf2..56c5422 100644
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
index 164df3b..8bef653 100644
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
index 0f32f08..24a63a4 100644
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
index 480c68d..19f0d7f 100644
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
index 129c023..e35ca06 100644
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
index 28ea3d7..4adc52f 100644
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
index c32683f..7e7268a 100644
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
index 7e87d21..10d56e0 100644
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
index bc7cf44..9c0c78e 100644
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
index 2856114..863fcd5 100644
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

