Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB329146018
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 01:49:06 +0100 (CET)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuQgD-0001xo-9Y
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 19:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ianjiang.ict@gmail.com>) id 1iuQfR-0001Z2-Fp
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 19:48:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ianjiang.ict@gmail.com>) id 1iuQfQ-0004q7-AI
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 19:48:17 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44563)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ianjiang.ict@gmail.com>)
 id 1iuQfQ-0004pu-44
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 19:48:16 -0500
Received: by mail-io1-xd42.google.com with SMTP id e7so1212968iof.11
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MxUWzBP+Pv/aHUqVIBDWF0BWG9KKgneDL2Zp1fXyDIc=;
 b=Nnzvyuq0wssXAbmENSb2KKoU/z4W0lRNh0J2kS5syJEmjl9fb4jOQqJljsLayumkCp
 /q9KPluOe0aIhAg1WF83G57lq7Jk5MN2cOZbnVUY692c1Sts5taDSE5DSD/neT3VjYqv
 ImlywcKJayKK8pfzLs3K0n/qFr6UZFBnPJ6m2ejb0dYTC6Xxil2tfRdaZHIFmrehguy2
 KaB5zFYgGeGPZBTi9Gwm3TEW2JeA+Yt+DGcmXdEZjT/feZ3WuBtMX9A0WfiEWuzN6t2v
 Y7+M9u+fFPBcJAozuDLpUrM8Z/zhW/avUw4rzAf1uavbK0EN7cptbl+l+C1ZqsfRPaoA
 CRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MxUWzBP+Pv/aHUqVIBDWF0BWG9KKgneDL2Zp1fXyDIc=;
 b=gNO3Fa11wN+OIcLggPTYkVb/mvLSxLUWzvlTXGnpsvGho8FfMdk2tDd6crY9bfgq58
 v2HIaEbxVRNBFsq87HzsgDUk7PkR1OOnlpEwaTdfit176AkPzODLH7f3PxxCJdO3uZdd
 Pflf0kmazMEi0DN8enKbKaFtjzCXpTcptUCv8KCd9mrohIofmiMtfCVwmXuAR6Tkm5UP
 Z7PLzXZMDfXKzdRfjv3LBhmNCoVZ8+g8iKvYqgASEtdnI3oUlJSYoOntDQJ5PCm9TmsN
 gCpNvFSpcGZB9XdLqhmbk7PHNfm32o0wcSzBrVSDejC0JAmirNXHp38WFXGEJf3lOd0U
 icKA==
X-Gm-Message-State: APjAAAWdqwde+Bm2A1uuRhB76eNtrzisFIu0qwJtX5gTtvXzWEqiK1eg
 VOybpmNsLpinyrLbyC5OWxnb6Ss0zzjL8VpwbQU=
X-Google-Smtp-Source: APXvYqxy4OWazeKNvneXPWOBYjLzMS3RzqejC+gV3Xx7LMXbZIqqjqjxuTeeXlMvV4Z5YWcVMIIxPRlI+W+ebX/ZspI=
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr9010902ioc.75.1579740494552; 
 Wed, 22 Jan 2020 16:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20200122072448.18510-1-ianjiang.ict@gmail.com>
 <b9084f13-0836-7f74-a870-608bf3f8f6a9@linaro.org>
 <CAMAD20=RS=tt04db3NfiPfXJo2Cr5PfCF-39E8qeuehnVGMdKg@mail.gmail.com>
 <25fb635f-6d92-70d0-9bcd-7f5a5de1a97b@linaro.org>
In-Reply-To: <25fb635f-6d92-70d0-9bcd-7f5a5de1a97b@linaro.org>
From: Ian Jiang <ianjiang.ict@gmail.com>
Date: Thu, 23 Jan 2020 08:48:03 +0800
Message-ID: <CAMAD20mgs=wBbsXAa6KsPP7SjNu1xfcM3wnqsAVExps3oufrtw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Format Rd of FMV.W.X with NoN-boxing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> =E4=BA=8E2020=E5=B9=B41=E6=
=9C=8823=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=881:11=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On 1/21/20 11:53 PM, Ian Jiang wrote:
> > --
> > Ian Jiang
> >
> > Richard Henderson <richard.henderson@linaro.org> =E4=BA=8E2020=E5=B9=B4=
1=E6=9C=8822=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:53=E5=86=99=E9=
=81=93=EF=BC=9A
> >>
> >> On 1/21/20 9:24 PM, Ian Jiang wrote:
> >>> For FMV.W.X that moves the lower 32 bits of an integer register to a
> >>> floating-point register, Rd should encoded with NoN-boxing scheme.
> >>> Note: This applies to RV64 only.
> >>>
> >>> Signed-off-by: Ian Jiang <ianjiang.ict@gmail.com>
> >>> ---
> >>>  target/riscv/insn_trans/trans_rvf.inc.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/i=
nsn_trans/trans_rvf.inc.c
> >>> index 172dbfa919..62b7a36567 100644
> >>> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> >>> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> >>> @@ -368,6 +368,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_=
fmv_w_x *a)
> >>>
> >>>  #if defined(TARGET_RISCV64)
> >>>      tcg_gen_mov_i64(cpu_fpr[a->rd], t0);
> >>> +    tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], 0xffffffff000000=
00ULL);
> >>>  #else
> >>>      tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
> >>>  #endif
> >>>
> >>
> >> This doesn't look right.  There's nothing in the spec that says the na=
n-boxing
> >> is restricted to rv64.  NaN-boxing is all about FLEN, not XLEN.
> >>
> >
> > Why the translation of FLW has a NaN-boxing?
> >
> > file ./target/riscv/insn_trans/trans_rvf.inc.c
> >  26 static bool trans_flw(DisasContext *ctx, arg_flw *a)
> >  27 {
> > ...
> >  34     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
> >  35     /* RISC-V requires NaN-boxing of narrower width floating point =
values */
> >  36     tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], 0xffffffff00000=
000ULL);
> > ...
> >  41 }
>
> Eh?  Obviously because we're loading a 32-bit value into a FLEN=3D64 bit =
register.
FMV.W.X is the same with FLW at this point that filling a 64 bits
float register based on 32 bits value.
Besides, the RISCV simulator Spike makes NaN-boxing for FLW, FMV.W.W,
FADD.S, FSUB.S, and others.
It might be better that they have a coincident behavior? I am not sure
about this and just want a discussion.

> (Except when we've selected a cpu without RVD, I suppose, but in that cas=
e this
> nan-boxing is both harmless and invisible.)
>
>
> r~

