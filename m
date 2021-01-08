Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA202EF80C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:23:59 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxMc-0001Eb-7c
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxxDk-00046K-OQ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:14:48 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxxDh-00007j-CZ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:14:48 -0500
Received: by mail-pj1-x102a.google.com with SMTP id p12so4147566pju.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IC1lX0U6wtOsAcvgqFahg9RcbQ7ickkEiflCtjsjzq8=;
 b=BcjwRJbaCVnFsFD5iNxvfvcKoNwcR0KYTmj5nRk4K9Fjo3+Nl3qMa8U70p1kFj6E0O
 u6fm/Sc55SgGEwSJcs/8bHergPemlVcCkWy9GbK3ZtQ1Qbf7xun+kSGfEmtGki4oFCWv
 ekj45DA6yNUfAkCxNhc+0V6dME8tUZ1b+0xb9gyFmu9x33NIvgMc6Xi1Rjd+fUnsOa9+
 WPJCnM3R5qD3BtdyLOD7eOQG/UNOXJpCT52eCiNvTezaKtep9bkD1AxQC6mb8CPjjwo2
 0IuvJ5yx6MipMDE8GCrKqo6yZ6LZdg/8jSOWHUWK8JDnnY2l+Psv5ENB0UNKZNQVmeAX
 RtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IC1lX0U6wtOsAcvgqFahg9RcbQ7ickkEiflCtjsjzq8=;
 b=hasWjO74vfnKzQ2ghIY/0leWdxGBk/rFKfVCQSGeNYQfEqZEVORpEtYG9EF1wgfDC+
 LbnD2I4Vek9ZhOro9Z6SMJafKdKPpJKMGYkLPal86JREgEurmMgvMJjLZ9KRRA97PMbR
 BsGVJIA0kL0h8AbDA1gnI9eivbc8t2qFCN12aUywbwLKTqAgNlkM3/qU9bGYn0NPs4uF
 RW3jI/v/mjDgK4RQKd9f41NZe280DsDFY4hPzzvSX4QVsTcHRoCfBIluX7Ux+jIb0hAq
 iWBxCMIg8ts/92ZWU8qD/dpZ58fwt40NA6UV81sH8rAdAZoWuENAdtLYZ6LV0KYOkSuC
 6cDQ==
X-Gm-Message-State: AOAM53057KpyFiC1tLfI2utFMDEd2Eef/xeQxmeCRjNnoSo27CZCf5MD
 0hhnJ6wzdlGulphNzUkkrkLZGXRNn2oPbamK/qAgRw==
X-Google-Smtp-Source: ABdhPJy2j0ZjaHZMu3nBVXBeaFvuH3+v5vPs5Md7Skzli8hK+gURdh7hlGICX2PLHahXim98wSbU+pYJbGjl8YRxjnE=
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id
 b20-20020a170902ed14b02900da9da43091mr5258157pld.29.1610133283456; Fri, 08
 Jan 2021 11:14:43 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
 <B6050D16-4BD3-4355-878F-33E3E7C3A75D@redhat.com>
 <CAKwvOdn068fXosDhtF_o-DVY2tQs4pWj59+uJ59_=JPfOK2Hsg@mail.gmail.com>
 <bbdd5d1b-6aa9-cd2c-eb9a-cf0345dbc999@redhat.com>
In-Reply-To: <bbdd5d1b-6aa9-cd2c-eb9a-cf0345dbc999@redhat.com>
Date: Fri, 8 Jan 2021 11:14:32 -0800
Message-ID: <CAKwvOd=JRRG1XTKKMdNFuuDb_58Q1Kbgi7F+fOsdwy+xpz0UGQ@mail.gmail.com>
Subject: Re: [PATCH v1] s390x/tcg: Fix RISBHG
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ndesaulniers@google.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Jonas Paulsson <paulsson@linux.vnet.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <dhildenb@redhat.com>, Fangrui Song <maskray@google.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Nick Desaulniers <ndesaulniers@google.com>
From: Nick Desaulniers via <qemu-devel@nongnu.org>

On Fri, Jan 8, 2021 at 1:45 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 08.01.21 03:20, Nick Desaulniers wrote:
> > On Thu, Jan 7, 2021 at 3:27 PM David Hildenbrand <dhildenb@redhat.com> =
wrote:
> >>
> >>
> >>> Am 08.01.2021 um 00:21 schrieb Nick Desaulniers <ndesaulniers@google.=
com>:
> >>>
> >>> =EF=BB=BFOn Thu, Jan 7, 2021 at 3:13 PM David Hildenbrand <david@redh=
at.com> wrote:
> >>>>
> >>>> RISBHG is broken and currently hinders clang builds of upstream kern=
els
> >>>> from booting: the kernel crashes early, while decompressing the imag=
e.
> >>>>
> >>>>  [...]
> >>>>   Kernel fault: interruption code 0005 ilc:2
> >>>>   Kernel random base: 0000000000000000
> >>>>   PSW : 0000200180000000 0000000000017a1e
> >>>>         R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
> >>>>   GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000f=
ffffff0
> >>>>         0000000000000000 00000000fffffff4 000000000000000c 00000000f=
ffffff0
> >>>>         00000000fffffffc 0000000000000000 00000000fffffff8 000000000=
08e25a8
> >>>>         0000000000000009 0000000000000002 0000000000000008 000000000=
000bce0
> >>>>
> >>>> One example of a buggy instruction is:
> >>>>
> >>>>    17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32
> >>>>
> >>>> With %r14 =3D 0x9 and %r1 =3D 0x7 should result in %r1 =3D 0x9000000=
07, however,
> >>>> results in %r1 =3D 0.
> >>>>
> >>>> Let's interpret values of i3/i4 as documented in the PoP and make
> >>>> computation of "mask" only based on i3 and i4 and use "pmask" only a=
t the
> >>>> very end to make sure wrapping is only applied to the high/low doubl=
eword.
> >>>>
> >>>> With this patch, I can successfully boot a v5.10 kernel built with
> >>>> clang, and gcc builds keep on working.
> >>>>
> >>>> Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
> >>>> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> >>>> Cc: Guenter Roeck <linux@roeck-us.net>
> >>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> >>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>> ---
> >>>>
> >>>> This BUG was a nightmare to debug and the code a nightmare to unders=
tand.
> >>>>
> >>>> To make clang/gcc builds boot, the following fix is required as well=
 on
> >>>> top of current master: "[PATCH] target/s390x: Fix ALGSI"
> >>>> https://lkml.kernel.org/r/20210107202135.52379-1-david@redhat.com
> >>>
> >>> In that case, a huge thank you!!! for this work! ++beers_owed.
> >>>
> >>
> >> :) a kernel build for z13 should work with the (default) =E2=80=9E-cpu=
 qemu=E2=80=9C cpu type.
> >
> > Hmm...so I don't think clang can build a Linux kernel image with
> > CONFIG_MARCH_Z13=3Dy just yet; just defconfig.  Otherwise looks like
> > clang barfs on some of the inline asm constraints.
> >
>
> Ah, right. I overwrote my manual config by a temporary defconfig :)
>
>
> So, I'm on x86-64 F33.
>
> clang version 11.0.0 (Fedora 11.0.0-2.fc33)
> LLVM version 11.0.0
>
> I cannot directly use "LLVM=3D1" for cross-compilation, as I keep getting
> "error: unknown emulation: elf64_s390" from ld.lld and "error: invalid
> output format: 'elf64-s390'" from llvm-objcopy. I assume that's fixed in
> llvm12?

Right, I suspect that even if ld.lld understood that emulation mode
target, it would still fail due to lack of big endian support.  We've
been building with simply `CC=3Dclang` for s390 linux kernels.
Via: https://www.kernel.org/doc/html/latest/kbuild/llvm.html#llvm-utilities
we usually start with `make CC=3Dclang` then work our way up to `make
LLVM=3D1`.  So you shouldn't need the below patching, just use
`CC=3Dclang`.

>
> 1. I patch around it (strange, I remember CC=3D .. used to work, but it n=
o
> longer does)
>
> ---
>
> index e30cf02da8b8..89c57062ed5d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -427,13 +427,13 @@ KBUILD_HOSTLDLIBS   :=3D $(HOST_LFS_LIBS) $(HOSTLDL=
IBS)
>  CPP            =3D $(CC) -E
>  ifneq ($(LLVM),)
>  CC             =3D clang
> -LD             =3D ld.lld
> -AR             =3D llvm-ar
> -NM             =3D llvm-nm
> -OBJCOPY                =3D llvm-objcopy
> -OBJDUMP                =3D llvm-objdump
> -READELF                =3D llvm-readelf
> -STRIP          =3D llvm-strip
> +LD             =3D $(CROSS_COMPILE)ld
> +AR             =3D $(CROSS_COMPILE)ar
> +NM             =3D $(CROSS_COMPILE)nm
> +OBJCOPY                =3D $(CROSS_COMPILE)objcopy
> +OBJDUMP                =3D $(CROSS_COMPILE)objdump
> +READELF                =3D $(CROSS_COMPILE)readelf
> +STRIP          =3D $(CROSS_COMPILE)strip
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
>
> ---

Pulling from your github branch, everything looks good; buildroot
support looks good. I'll wire this up to our CI so that we can help
report regressions!
--=20
Thanks,
~Nick Desaulniers

