Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8190F14F1AE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:53:43 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixaUA-0000Sk-Ih
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ixaMT-0004Af-2c
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ixaMN-0005nT-DN
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:45:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:41812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ixaMN-0005lL-65
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:45:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ixaML-0005jg-Cf
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 17:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5A1682E80C0
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 17:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jan 2020 17:37:19 -0000
From: Aleksandar Markovic <1861404@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amarkovic stvlvrn
X-Launchpad-Bug-Reporter: Stevie Lavern (stvlvrn)
X-Launchpad-Bug-Modifier: Aleksandar Markovic (amarkovic)
References: <158038956597.5319.13308249814127344774.malonedeb@chaenomeles.canonical.com>
 <158049016711.20266.13259801440809425215.launchpad@wampee.canonical.com>
Message-Id: <CAL1e-=hQ=j2H3XiaJSG4XuutU_owjv1BF_Zhhg7STgLUm0bJdQ@mail.gmail.com>
Subject: Re: [Bug 1861404] [NEW] AVX instruction VMOVDQU implementation error
 for YMM registers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5669f5118272b7865f05a8867c9a814d4bf76a7f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1861404 <1861404@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, January 31, 2020, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

> ** Tags added: tcg testcase
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1861404
>
> Title:
>   AVX instruction VMOVDQU implementation error for YMM registers
>
>
If I remember well, there is no support for AVX instructions in linux-user
mode.

If that is true, how come handling of unsupported instruction went that
far?

Did you try other AVX instructions?

Aleksandar



> Status in QEMU:
>   New
>
> Bug description:
>   Hi,
>
>   Tested with Qemu 4.2.0, and with git version
>   bddff6f6787c916b0e9d63ef9e4d442114257739.
>
>   The x86 AVX instruction VMOVDQU doesn't work properly with YMM registers
> (32 bytes).
>   It works with XMM registers (16 bytes) though.
>
>   See the attached test case `ymm.c`: when copying from memory-to-ymm0
>   and then back from ymm0-to-memory using VMOVDQU, Qemu only copies the
>   first 16 of the total 32 bytes.
>
>   ```
>   user@ubuntu ~/Qemu % gcc -o ymm ymm.c -Wall -Wextra -Werror
>
>   user@ubuntu ~/Qemu % ./ymm
>   00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 10 11 12 13 14 15 16 17
> 18 19 1A 1B 1C 1D 1E 1F
>
>   user@ubuntu ~/Qemu % ./x86_64-linux-user/qemu-x86_64 -cpu max ymm
>   00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00
>   ```
>
>   This seems to be because in `translate.c > gen_sse()`, the case
>   handling the VMOVDQU instruction calls `gen_ldo_env_A0` which always
>   performs a 16 bytes copy using two 8 bytes load and store operations
>   (with `tcg_gen_qemu_ld_i64` and `tcg_gen_st_i64`).
>
>   Instead, the `gen_ldo_env_A0` function should generate a copy with a
>   size corresponding to the used register.
>
>
>   ```
>   static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>                       target_ulong pc_start, int rex_r)
>   {
>           [...]
>           case 0x26f: /* movdqu xmm, ea */
>               if (mod !=3D 3) {
>                   gen_lea_modrm(env, s, modrm);
>                   gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
>               } else {
>           [...]
>   ```
>
>   ```
>   static inline void gen_ldo_env_A0(DisasContext *s, int offset)
>   {
>       int mem_index =3D s->mem_index;
>       tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEQ);
>       tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg,
> ZMM_Q(0)));
>       tcg_gen_addi_tl(s->tmp0, s->A0, 8);
>       tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEQ);
>       tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg,
> ZMM_Q(1)));
>   }
>   ```
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1861404/+subscriptions
>
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861404

Title:
  AVX instruction VMOVDQU implementation error for YMM registers

Status in QEMU:
  New

Bug description:
  Hi,

  Tested with Qemu 4.2.0, and with git version
  bddff6f6787c916b0e9d63ef9e4d442114257739.

  The x86 AVX instruction VMOVDQU doesn't work properly with YMM registers =
(32 bytes).
  It works with XMM registers (16 bytes) though.

  See the attached test case `ymm.c`: when copying from memory-to-ymm0
  and then back from ymm0-to-memory using VMOVDQU, Qemu only copies the
  first 16 of the total 32 bytes.

  ```
  user@ubuntu ~/Qemu % gcc -o ymm ymm.c -Wall -Wextra -Werror

  user@ubuntu ~/Qemu % ./ymm
  00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 10 11 12 13 14 15 16 17 1=
8 19 1A 1B 1C 1D 1E 1F

  user@ubuntu ~/Qemu % ./x86_64-linux-user/qemu-x86_64 -cpu max ymm
  00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00
  ```

  This seems to be because in `translate.c > gen_sse()`, the case
  handling the VMOVDQU instruction calls `gen_ldo_env_A0` which always
  performs a 16 bytes copy using two 8 bytes load and store operations
  (with `tcg_gen_qemu_ld_i64` and `tcg_gen_st_i64`).

  Instead, the `gen_ldo_env_A0` function should generate a copy with a
  size corresponding to the used register.

  =

  ```
  static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                      target_ulong pc_start, int rex_r)
  {
          [...]
          case 0x26f: /* movdqu xmm, ea */
              if (mod !=3D 3) {
                  gen_lea_modrm(env, s, modrm);
                  gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
              } else { =

          [...]
  ```

  ```
  static inline void gen_ldo_env_A0(DisasContext *s, int offset)
  {
      int mem_index =3D s->mem_index;
      tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEQ);
      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(=
0)));
      tcg_gen_addi_tl(s->tmp0, s->A0, 8);
      tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEQ);
      tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(=
1)));
  }
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861404/+subscriptions

