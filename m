Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B42EEB38
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 03:21:43 +0100 (CET)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxhPJ-0004lP-TM
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 21:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxhNx-0004HX-4C
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:20:17 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxhNt-0002iB-TI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:20:16 -0500
Received: by mail-pg1-x533.google.com with SMTP id n25so6687287pgb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 18:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KyyvKHC+BZV2Hza48F3WOIS2sCmjAAJf4TKFksUrC6I=;
 b=hZ7/dK7fpQO8k12xPVTcE3cvDfBBH4RBGyXYgx8LSLSvasPKVTtVobG7fPz6Tab31i
 Z/3pYGSzi958SMlF2YCmw/33H7NX0kslPV5cDTtXwIZpPvvboXoBSc3R+hSUHl+MF+ei
 Tn09Hargz1HkXG3CbVbP4OtfXkYSQ3oQVMVtEUVJTFGgwmbR9eyCOZitVYZ2A87gD+mt
 YhLbHlWVZHtJacnA17OkMbDb2LQdW0/28p1nnw35PbQGGBgxcySD30at3ppUd7q4dtae
 vtBITyIxVgGr1eVNbBKqulntbk3aDCGI54JXHlHqs1sbf7zWf7gThol4xHdwZfsZ/uEu
 hOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KyyvKHC+BZV2Hza48F3WOIS2sCmjAAJf4TKFksUrC6I=;
 b=JdQPlGgWoTaioW3PJZqNu2IJBjZ9Bmh2pE533sVg+aP75lpA9qcCxbQ56g8zhZ3HwY
 GHYyac1OS4o3q/eLmHTNYcRPVWblx2lH6yH8VmCJcPdDSsenuxOBY7vcBiekwQypSvmz
 ZZIZ7MxNavr41QfSYXByvco6SKAOij8pEd5yR524kMm6S34m1sw4OpJUqEWPD/LgirPg
 tBJ4M/0fuSdhehWe8HfpvQ6sdoOE9eKMhQMhSWgHKnuils3YcZILS+WC8jTD/Fqmn6B2
 l8t9uuJbgEl9tunt9ImfhXc3yjvGvWYWg3cwDWardBD1vL0IGFeYqByLMnM8CKZePZ3J
 Glbg==
X-Gm-Message-State: AOAM5313weUcqVQjnm91BLeLa/bbEe8Lul1BMwAbCkahf+nCLdGHQqpk
 ukTaWDv9VuCSnTY5mHMqxbJL0dmMMGdBlMWgRPnt5g==
X-Google-Smtp-Source: ABdhPJzl7Rk6i3h1+BgoaC1Q95M5W5sQFYvq9XuTyTKXxxg0t7PMEgTCU3YgXKlLoH2TJbZASV9/UHQkBpoOVwbcqeo=
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id
 144-20020a6218960000b0290197491cbe38mr4742511pfy.15.1610072411680; Thu, 07
 Jan 2021 18:20:11 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
 <B6050D16-4BD3-4355-878F-33E3E7C3A75D@redhat.com>
In-Reply-To: <B6050D16-4BD3-4355-878F-33E3E7C3A75D@redhat.com>
Date: Thu, 7 Jan 2021 18:20:00 -0800
Message-ID: <CAKwvOdn068fXosDhtF_o-DVY2tQs4pWj59+uJ59_=JPfOK2Hsg@mail.gmail.com>
Subject: Re: [PATCH v1] s390x/tcg: Fix RISBHG
To: David Hildenbrand <dhildenb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=ndesaulniers@google.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.382,
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
 Vasily Gorbik <gor@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Nick Desaulniers <ndesaulniers@google.com>
From: Nick Desaulniers via <qemu-devel@nongnu.org>

On Thu, Jan 7, 2021 at 3:27 PM David Hildenbrand <dhildenb@redhat.com> wrot=
e:
>
>
> > Am 08.01.2021 um 00:21 schrieb Nick Desaulniers <ndesaulniers@google.co=
m>:
> >
> > =EF=BB=BFOn Thu, Jan 7, 2021 at 3:13 PM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> RISBHG is broken and currently hinders clang builds of upstream kernel=
s
> >> from booting: the kernel crashes early, while decompressing the image.
> >>
> >>  [...]
> >>   Kernel fault: interruption code 0005 ilc:2
> >>   Kernel random base: 0000000000000000
> >>   PSW : 0000200180000000 0000000000017a1e
> >>         R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
> >>   GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000fff=
ffff0
> >>         0000000000000000 00000000fffffff4 000000000000000c 00000000fff=
ffff0
> >>         00000000fffffffc 0000000000000000 00000000fffffff8 00000000008=
e25a8
> >>         0000000000000009 0000000000000002 0000000000000008 00000000000=
0bce0
> >>
> >> One example of a buggy instruction is:
> >>
> >>    17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32
> >>
> >> With %r14 =3D 0x9 and %r1 =3D 0x7 should result in %r1 =3D 0x900000007=
, however,
> >> results in %r1 =3D 0.
> >>
> >> Let's interpret values of i3/i4 as documented in the PoP and make
> >> computation of "mask" only based on i3 and i4 and use "pmask" only at =
the
> >> very end to make sure wrapping is only applied to the high/low doublew=
ord.
> >>
> >> With this patch, I can successfully boot a v5.10 kernel built with
> >> clang, and gcc builds keep on working.
> >>
> >> Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
> >> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>
> >> This BUG was a nightmare to debug and the code a nightmare to understa=
nd.
> >>
> >> To make clang/gcc builds boot, the following fix is required as well o=
n
> >> top of current master: "[PATCH] target/s390x: Fix ALGSI"
> >> https://lkml.kernel.org/r/20210107202135.52379-1-david@redhat.com
> >
> > In that case, a huge thank you!!! for this work! ++beers_owed.
> >
>
> :) a kernel build for z13 should work with the (default) =E2=80=9E-cpu qe=
mu=E2=80=9C cpu type.

Hmm...so I don't think clang can build a Linux kernel image with
CONFIG_MARCH_Z13=3Dy just yet; just defconfig.  Otherwise looks like
clang barfs on some of the inline asm constraints.

It looks like with your patch applied we get further into the boot!
I'm not seeing any output with:
$ /android0/qemu/build/qemu-system-s390x -cpu qemu -append
'conmode=3Dsclp console=3DttyS0' -display none -initrd
/<path/to>/boot-utils/images/s390/rootfs.cpio -kernel
arch/s390/boot/bzImage -m 512m -nodefaults -serial mon:stdio

(Based on a quick skim through
https://www.ibm.com/support/knowledgecenter/en/linuxonibm/com.ibm.linux.z.l=
udd/ludd_r_lmtkernelparameter.html).
Do I have all of those right?

If I attach GDB to QEMU running that kernel image, I was able to view
the print banner once via `lx-dmesg` gdb macro in the kernel, but it
seems on subsequent runs control flow gets diverted unexpected post
entry to start_kernel() always to `s390_base_pgm_handler` ...errr..at
least when I try to single step in GDB.  Tried with linux-5.10.y,
mainline, and linux-next.

qemu: 470dd6bd360782f5137f7e3376af6a44658eb1d3 + your patch
llvm: 106e66f3f555c8f887e82c5f04c3e77bdaf345e8
linux-5.10.y: d1988041d19dc8b532579bdbb7c4a978391c0011
linux: 71c061d2443814de15e177489d5cc00a4a253ef3
linux-next: f87684f6470f5f02bd47d4afb900366e5d2f31b6


(gdb) hbreak setup_arch
Hardware assisted breakpoint 1 at 0x142229e: file
arch/s390/kernel/setup.c, line 1091.
(gdb) c
Continuing.

Program received signal SIGTRAP, Trace/breakpoint trap.
0x00000000014222a0 in setup_arch (cmdline_p=3D0x11d7ed8) at
arch/s390/kernel/setup.c:1091
1091            if (MACHINE_IS_VM)
(gdb) lx-dmesg
[    0.376351] Linux version 5.11.0-rc2-00157-ga2885c701c30
(ndesaulniers@ndesaulniers1.mtv.corp.google.com) (Nick Desaulniers
clang version 12.0.0 (git@github.com:llvm/llvm-project.git
e75fec2b238f0e26cfb7645f2208baebe3440d41), GNU ld (GNU Binutils for
Debian) 2.35.1) #81 SMP Thu Jan 7 17:57:34 PST 2021

>
> >>
> >> ---
> >> target/s390x/translate.c | 18 ++++++++----------
> >> 1 file changed, 8 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> >> index 3d5c0d6106..39e33eeb67 100644
> >> --- a/target/s390x/translate.c
> >> +++ b/target/s390x/translate.c
> >> @@ -3815,22 +3815,23 @@ static DisasJumpType op_risbg(DisasContext *s,=
 DisasOps *o)
> >>         pmask =3D 0xffffffff00000000ull;
> >>         break;
> >>     case 0x51: /* risblg */
> >> -        i3 &=3D 31;
> >> -        i4 &=3D 31;
> >> +        i3 =3D (i3 & 31) + 32;
> >> +        i4 =3D (i4 & 31) + 32;
> >>         pmask =3D 0x00000000ffffffffull;
> >>         break;
> >>     default:
> >>         g_assert_not_reached();
> >>     }
> >>
> >> -    /* MASK is the set of bits to be inserted from R2.
> >> -       Take care for I3/I4 wraparound.  */
> >> -    mask =3D pmask >> i3;
> >> +    /* MASK is the set of bits to be inserted from R2. */
> >>     if (i3 <=3D i4) {
> >> -        mask ^=3D pmask >> i4 >> 1;
> >> +        /* [0...i3---i4...63] */
> >> +        mask =3D (-1ull >> i3) & (-1ull << (63 - i4));
> >>     } else {
> >> -        mask |=3D ~(pmask >> i4 >> 1);
> >> +        /* [0---i4...i3---63] */
> >> +        mask =3D (-1ull >> i3) | (-1ull << (63 - i4));
> >>     }
> >
> > The expression evaluated looks the same to me for both sides of the
> > conditional, but the comments differ. Intentional?
>
> & vs |, so the result differs.

D'oh, I can never spot single character differences!
--=20
Thanks,
~Nick Desaulniers

