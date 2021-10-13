Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E842C139
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:17:48 +0200 (CEST)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mae8h-0001w1-6x
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mae4K-0005Ru-89
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:13:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mae4G-0000M5-U8
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:13:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y3so8340865wrl.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjSsddx42JvpLKPsOoHOa+/Evtm0gUER/Ru+Ucqd4es=;
 b=2zMc9YWz955RDteuxEMk/TBkAwjVX63CcXumjbD8Qc4hi6EDBEmzBAO3DXX6RkZ7aZ
 4BlVwbwwonEfWEHm7ESCUoPuez9Ky4QveTj1bXH2oDneeROn6n0lj/rTPkE0FldDzYAu
 Olug8KFqPrjrNaoHKpi/TxdwkcUhxqPtuvk1c9WjzCFRM5U8q9hpgkSuzuavqaxDGh5Z
 TPZxsx49TwmycBCxAYrHoIj6c4MLgZ0AmC7tbieF6D6D+4zuD5NJ5WCjdU2YknTHRFhY
 aW4v74yzKRIjn4Ftjt8axFHhhu7Ydt3OVN+aBjaOmLuaYjDQzqhHM0ZA7FUnP7JArhLB
 wezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjSsddx42JvpLKPsOoHOa+/Evtm0gUER/Ru+Ucqd4es=;
 b=RKwBZHtNWOHPNKpwWKL1R6MOzPIf9rtek2jn6EYUdFAK3uLz/w6uwVU6rt/HUSXvj/
 KKfvBWpW7a2TR0Ih2x/VSZ3T3Tb78lzNL3ZRb8JG1pWd2F0Za2F2f2DV93AIz0y7kxtH
 G/LMxk/6YbEFF2oz6MPbaaGKXuFuL+Vz9i43NIrk5JMRhMAZTsYFNYokF1DsGlIOszvE
 G1BVSN0Ch2I2fp/cDmkSnip4ziuvg4+X67oME3x0E0iKMUn8VS66yoxTfOwkcQgfJcCK
 mYTN2gJAp69wJfoDEoVTfGTCAP/U9Nj/sAJR4kHtcNMwj5Rl+SilSmHM4GkBOAaABYyH
 N13A==
X-Gm-Message-State: AOAM532GRIC3iKXEmhK44eRmDgN7d9E5qseVsF5MzCnwfhUaZ9vmKANd
 5wprlu2krvEyGKfjNN6N1pbBkQclttFgZpTshHX0nQ==
X-Google-Smtp-Source: ABdhPJwdBqPA6sNwbxnIOjL7TT5t7HcuIN+oi03KrHg+o1raYyA/ZfDV6SvHjrbgekG1QysnR/IwggXljQZO658FlUk=
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr12494489wmq.48.1634130790176; 
 Wed, 13 Oct 2021 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
 <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
In-Reply-To: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Oct 2021 15:12:59 +0200
Message-ID: <CAAeLtUBSZ-=+06SowthZds0r19w66S-ibn18st4=DU81SeJk6Q@mail.gmail.com>
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Vincent Palatin <vpalatin@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a much simpler version initially (using 3 x mask/shift/or, for
12 instructions after setup of constants), but took up the suggestion
to optimize based on haszero(v)...
Indeed this appears to not do what we expect, when there's only 0x01
set in a byte.

The less optimized form, with a single constant, that would still do
what we want is:
   /* set high-bit for non-zero bytes */
   constant = dup_const_tl(MO_8, 0x7f);
   tmp = v & constant;   // AND
   tmp += constant;       // ADD
   tmp |= v;                    // OR
   /* extract high-bit to low-bit, for each word */
   tmp &= ~constant;     // ANDC
   tmp >>= 7;                 // SHR
   /* multiply with 0xff to populate entire byte where the low-bit is set */
   tmp *= 0xff;                // MUL

I'll submit a patch with this one later today, once I had a chance to
pass this through a full test.

Thanks,
Philipp.


On Wed, 13 Oct 2021 at 11:36, Vincent Palatin <vpalatin@rivosinc.com> wrote:
>
> On Thu, Oct 7, 2021 at 8:58 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> > orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> > gorci from pre-0.93 draft-B) is available, mainly targeting
> > string-processing workloads.
> >
> > This commit adds the new orc.b instruction and removed gorc/gorci.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Message-id: 20210911140016.834071-12-philipp.tomsich@vrull.eu
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/helper.h                   |  2 --
> >  target/riscv/insn32.decode              |  6 +---
> >  target/riscv/bitmanip_helper.c          | 26 -----------------
> >  target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++--------------
> >  4 files changed, 18 insertions(+), 55 deletions(-)
> >
> > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > index 8a318a2dbc..a9bda2c8ac 100644
> > --- a/target/riscv/helper.h
> > +++ b/target/riscv/helper.h
> > @@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
> >  /* Bitmanip */
> >  DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> >  DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> > -DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> > -DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> >  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> >  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> >
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index a509cfee11..59202196dc 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -681,6 +681,7 @@ max        0000101 .......... 110 ..... 0110011 @r
> >  maxu       0000101 .......... 111 ..... 0110011 @r
> >  min        0000101 .......... 100 ..... 0110011 @r
> >  minu       0000101 .......... 101 ..... 0110011 @r
> > +orc_b      001010 000111 ..... 101 ..... 0010011 @r2
> >  orn        0100000 .......... 110 ..... 0110011 @r
> >  rol        0110000 .......... 001 ..... 0110011 @r
> >  ror        0110000 .......... 101 ..... 0110011 @r
> > @@ -702,19 +703,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
> >  packu      0100100 .......... 100 ..... 0110011 @r
> >  packh      0000100 .......... 111 ..... 0110011 @r
> >  grev       0110100 .......... 101 ..... 0110011 @r
> > -gorc       0010100 .......... 101 ..... 0110011 @r
> > -
> >  grevi      01101. ........... 101 ..... 0010011 @sh
> > -gorci      00101. ........... 101 ..... 0010011 @sh
> >
> >  # *** RV64B Standard Extension (in addition to RV32B) ***
> >  packw      0000100 .......... 100 ..... 0111011 @r
> >  packuw     0100100 .......... 100 ..... 0111011 @r
> >  grevw      0110100 .......... 101 ..... 0111011 @r
> > -gorcw      0010100 .......... 101 ..... 0111011 @r
> >
> >  greviw     0110100 .......... 101 ..... 0011011 @sh5
> > -gorciw     0010100 .......... 101 ..... 0011011 @sh5
> >
> >  # *** RV32 Zbc Standard Extension ***
> >  clmul      0000101 .......... 001 ..... 0110011 @r
> > diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> > index 73be5a81c7..bb48388fcd 100644
> > --- a/target/riscv/bitmanip_helper.c
> > +++ b/target/riscv/bitmanip_helper.c
> > @@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> >      return do_grev(rs1, rs2, 32);
> >  }
> >
> > -static target_ulong do_gorc(target_ulong rs1,
> > -                            target_ulong rs2,
> > -                            int bits)
> > -{
> > -    target_ulong x = rs1;
> > -    int i, shift;
> > -
> > -    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
> > -        if (rs2 & shift) {
> > -            x |= do_swap(x, adjacent_masks[i], shift);
> > -        }
> > -    }
> > -
> > -    return x;
> > -}
> > -
> > -target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
> > -{
> > -    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
> > -}
> > -
> > -target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
> > -{
> > -    return do_gorc(rs1, rs2, 32);
> > -}
> > -
> >  target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
> >  {
> >      target_ulong result = 0;
> > diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> > index bdfb495f24..d32af5915a 100644
> > --- a/target/riscv/insn_trans/trans_rvb.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> > @@ -295,16 +295,27 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
> >      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
> >  }
> >
> > -static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
> > +static void gen_orc_b(TCGv ret, TCGv source1)
> >  {
> > -    REQUIRE_EXT(ctx, RVB);
> > -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> > +    TCGv  tmp = tcg_temp_new();
> > +    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
> > +
> > +    /* Set lsb in each byte if the byte was zero. */
> > +    tcg_gen_sub_tl(tmp, source1, ones);
> > +    tcg_gen_andc_tl(tmp, tmp, source1);
> > +    tcg_gen_shri_tl(tmp, tmp, 7);
> > +    tcg_gen_andc_tl(tmp, ones, tmp);
> > +
> > +    /* Replicate the lsb of each byte across the byte. */
> > +    tcg_gen_muli_tl(ret, tmp, 0xff);
> > +
> > +    tcg_temp_free(tmp);
> >  }
>
> It seems there is a bug in the current orc.b implementation,
> the following 7 hexadecimal patterns return one wrong byte (0x00
> instead of 0xff):
> orc.b(0x............01..) = 0x............00.. (instead of 0x............ff..)
> orc.b(0x..........01....) = 0x..........00.... (instead of 0x..........ff....)
> orc.b(0x........01......) = 0x........00...... (instead of 0x........ff......)
> orc.b(0x......01........) = 0x......00........ (instead of 0x......ff........)
> orc.b(0x....01..........) = 0x....00.......... (instead of 0x....ff..........)
> orc.b(0x..01............) = 0x..00............ (instead of 0x..ff............)
> orc.b(0x01..............) = 0x00.............. (instead of 0xff..............)
> (see test cases below)
>
> The issue seems to be related to the propagation of the carry.
> I had a hard time fixing it. With some help, I have added a prolog
> which basically computes:
> (source1 | ((source1 << 1) & ~ones)) in order to avoid the carry.
> I will send the patch as a follow-up in this thread as 'Patch 1A'.
>
> But it's notably less optimized than the current code,  so feel free
> to come up with better options.
> Actually my initial stab at fixing it was implementing a more
> straightforward but less astute 'divide and conquer' method
> where bits are or'ed by pairs, then the pairs are or'ed by pair ...
> using the following formula:
> tmp = source1 | (source1 >> 1)
> tmp = tmp | (tmp >> 2)
> tmp = tmp | (tmp >> 4)
> ret = tmp & 0x0101010101010101
> ret = tmp * 0xff
> as it's notably less optimized than the current code when converted in
> tcg_gen_ primitives but de par with the fixed version.
> I'm also sending in this thread as 'Patch 1B' as I feel it's slightly
> easier to grasp.
>
>
> Test cases run on current implementation:
> orc.b(0x0000000000000000) = 0x0000000000000000   OK (expect 0x0000000000000000)
> orc.b(0x0000000000000001) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000002) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000004) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000008) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000010) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000020) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000040) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000080) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
> orc.b(0x0000000000000100) = 0x0000000000000000 FAIL (expect 0x000000000000ff00)
> orc.b(0x0000000000000200) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000000400) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000000800) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000001000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000002000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000004000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000008000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
> orc.b(0x0000000000010000) = 0x0000000000000000 FAIL (expect 0x0000000000ff0000)
> orc.b(0x0000000000020000) = 0x0000000000ff0000   OK (expect 0x0000000000ff0000)
> orc.b(0x0000000001000000) = 0x0000000000000000 FAIL (expect 0x00000000ff000000)
> orc.b(0x0000000002000000) = 0x00000000ff000000   OK (expect 0x00000000ff000000)
> orc.b(0x0000000100000000) = 0x0000000000000000 FAIL (expect 0x000000ff00000000)
> orc.b(0x0000000200000000) = 0x000000ff00000000   OK (expect 0x000000ff00000000)
> orc.b(0x0000010000000000) = 0x0000000000000000 FAIL (expect 0x0000ff0000000000)
> orc.b(0x0000020000000000) = 0x0000ff0000000000   OK (expect 0x0000ff0000000000)
> orc.b(0x0001000000000000) = 0x0000000000000000 FAIL (expect 0x00ff000000000000)
> orc.b(0x0002000000000000) = 0x00ff000000000000   OK (expect 0x00ff000000000000)
> orc.b(0x0100000000000000) = 0x0000000000000000 FAIL (expect 0xff00000000000000)
> orc.b(0x0200000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x0400000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x0800000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x1000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x2000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x4000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0x8000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
> orc.b(0xffffffffffffffff) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
> orc.b(0x00ff00ff00ff00ff) = 0x00ff00ff00ff00ff   OK (expect 0x00ff00ff00ff00ff)
> orc.b(0xff00ff00ff00ff00) = 0xff00ff00ff00ff00   OK (expect 0xff00ff00ff00ff00)
> orc.b(0x0001000100010001) = 0x00000000000000ff FAIL (expect 0x00ff00ff00ff00ff)
> orc.b(0x0100010001000100) = 0x0000000000000000 FAIL (expect 0xff00ff00ff00ff00)
> orc.b(0x8040201008040201) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
> orc.b(0x0804020180402010) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
> orc.b(0x010055aa00401100) = 0x0000ffff00ffff00 FAIL (expect 0xff00ffff00ffff00)
>
>
> >
> > -static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
> > +static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
> >  {
> > -    REQUIRE_EXT(ctx, RVB);
> > -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> > +    REQUIRE_ZBB(ctx);
> > +    return gen_unary(ctx, a, EXT_ZERO, gen_orc_b);
> >  }
> >
> >  #define GEN_SHADD(SHAMT)                                       \
> > @@ -476,22 +487,6 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
> >      return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
> >  }
> >
> > -static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
> > -{
> > -    REQUIRE_64BIT(ctx);
> > -    REQUIRE_EXT(ctx, RVB);
> > -    ctx->w = true;
> > -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> > -}
> > -
> > -static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
> > -{
> > -    REQUIRE_64BIT(ctx);
> > -    REQUIRE_EXT(ctx, RVB);
> > -    ctx->w = true;
> > -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> > -}
> > -
> >  #define GEN_SHADD_UW(SHAMT)                                       \
> >  static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
> >  {                                                                 \
> > --
> > 2.31.1
> >
> >

