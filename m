Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A63730E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:37:18 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le0r6-0001xN-Ih
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0pi-0000kx-Ar
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:35:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0pe-0002sP-Pi
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:35:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1le0pc-0003ki-70
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 19:35:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 33F012E8073
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 19:35:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 19:29:23 -0000
From: Thomas Huth <1861404@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amarkovic rth stvlvrn th-huth
X-Launchpad-Bug-Reporter: Stevie Lavern (stvlvrn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158038956597.5319.13308249814127344774.malonedeb@chaenomeles.canonical.com>
Message-Id: <162015656329.6782.5852969561223112236.malone@wampee.canonical.com>
Subject: [Bug 1861404] Re: AVX instruction VMOVDQU implementation error for
 YMM registers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: e6a461ccf95b81732785c231fac7abb3e93d32cf
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/132


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #132
   https://gitlab.com/qemu-project/qemu/-/issues/132

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861404

Title:
  AVX instruction VMOVDQU implementation error for YMM registers

Status in QEMU:
  Expired

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

