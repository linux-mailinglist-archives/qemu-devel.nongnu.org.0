Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB73B4B67
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 01:58:12 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvi6-0001yN-RF
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 19:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lwvhB-0001I1-7u
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 19:57:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lwvh8-0002mw-0Y
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 19:57:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6885062wmj.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sk/3rMptBhw76K5YL1UhKtJpUS4KU7DP0GpYJKfa8hw=;
 b=VuZ4eENnKGYmeny2sk15HyE1eryBJxJ6PlpFXj17CcKywPwy2MU9NPo1y06reMBJhQ
 7sGgRV8Tb11kfnADgVueh5kenr0CTBxha2dcvtH0hvYwjP+4bg5A9GDdm1c5QfwiTy04
 J0ycLm8SXgyClC4bcw+rV980eRed1ZPKgiJ91xLf0tMih9shS32wlILQ+oadoqOKdiG5
 OYUHegjhB/XH/twpP0JDiXVMUUYus3Jj40KowgDidigh9DTQmD6+p2moy+wbxLQF4GLi
 mLD8bNkSBKGixnpkkaOVMosZ/To9oF2YAPw0oyPpWegCXF8M2EhKiDBSC001IPFxmPu9
 k6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sk/3rMptBhw76K5YL1UhKtJpUS4KU7DP0GpYJKfa8hw=;
 b=ZOQJ4D0f0RRDHVyscQNTl+7nGIxF94L5vjVhyJ/MNRrcnpFSMXQAOHt2zF2N8vlUNA
 pkdNu3chb5qcqXJbuieSINia2hHBCQ6R2HPrVHbH8YqCDC9e4/9CuNGVfwpKMa4pRZ9N
 PpqEjJuLEkGIcyP8F8LkcNPqVUSl+Sag3BNoifq9ZVT4XvW2B4ZK4MEUanoPHHdcqdUB
 2UFFR/s8Tb4UToB2QCFlHvKrea1hZYaPn1wpGBztd937stpJkSiTio92KrZmmJ5Ka6wV
 epHsHTK6n5o+o397dPqdXrycJWl5WMpeCX8a25K1Z91PDwgJsEHmcD7uSELwr9RVmiVY
 qHCQ==
X-Gm-Message-State: AOAM530b6cyft7WObaFgcxxnk4NHjNziYD9DijcpAjb79RTK91QdCbHL
 d2MMRx2XF0RvNWFVASZ7wD0lmFkdvh3dVmfIuLs=
X-Google-Smtp-Source: ABdhPJyx9zdOuAu9qSVeZ1sndGt+QZ6DPuixm+ijmWXFPQWra0FUdw5XjqnToBCTwuDZJLBsMLnpFtp6mNBCa0tOrMI=
X-Received: by 2002:a05:600c:3794:: with SMTP id
 o20mr13537059wmr.106.1624665428439; 
 Fri, 25 Jun 2021 16:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-14-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-14-ale.qemu@rev.ng>
From: Taylor Simpson <taylor.qemu@gmail.com>
Date: Fri, 25 Jun 2021 18:56:57 -0500
Message-ID: <CANji28b-AWkJ0C-Co5dYop2ykKgjjR96bw6e+MoaYtukUXKWEg@mail.gmail.com>
Subject: Re: [PATCH v5 13/14] target/hexagon: import additional tests
To: Alessandro Di Federico <ale.qemu@rev.ng>
Content-Type: multipart/alternative; boundary="000000000000bdb6b405c59fe571"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=taylor.qemu@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bdb6b405c59fe571
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 19, 2021 at 4:49 AM Alessandro Di Federico via <
qemu-devel@nongnu.org> wrote:

> From: Niccol=C3=B2 Izzo <nizzo@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Niccol=C3=B2 Izzo <nizzo@rev.ng>
> ---
>


> diff --git a/tests/tcg/hexagon/crt.S b/tests/tcg/hexagon/crt.S
> new file mode 100644
> index 0000000000..2c10577470
> --- /dev/null
> +++ b/tests/tcg/hexagon/crt.S
> @@ -0,0 +1,28 @@
> +#define SYS_exit_group           94
> +
> +    .text
> +    .globl init
> +init:
> +    {
> +        allocframe(r29,#0):raw
> +    }
> +    {
> +        r0=3D#256
> +    }
> +    {
> +        dealloc_return
> +    }
>

You don't need to alloc/dealloc the frame, just a single packet { r0 =3D
#256; jumpr r31 }

Then again, why is this function needed at all?


+
> +    .space 240
>

Why is this space needed?

diff --git a/tests/tcg/hexagon/test_andp.S b/tests/tcg/hexagon/test_andp.S
> new file mode 100644
> index 0000000000..3c4aa8b2ae
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_andp.S
> @@ -0,0 +1,23 @@
> +/* Purpose: test a multiple predicate AND combination */
>

This is already tested in misc.c

+
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        r1+=3Dsub(r2,r3)
>

Remove this - r1, r2, and r3 are uninitialized.  Then, you overwrite r1 in
the next packet.


> +        call init
> +    }
> +    {
> +        r0=3D#0
> +        r1=3D#1
> +    }
> +    {
> +        p0=3Dcmp.gt(r0,r1)
> +        p0=3Dcmp.gt(r0,r1)
> +        p0=3Dcmp.gt(r1,r0)
> +    }
> +    {
> +        if (!p0) jump:t pass
> +        jump fail
> +    }
>
> diff --git a/tests/tcg/hexagon/test_call.S b/tests/tcg/hexagon/test_call.=
S
> new file mode 100644
> index 0000000000..53a2450522
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_call.S
> @@ -0,0 +1,63 @@
> +/* Purpose: test function calls and duplex instructions.
> + * The string "Hello there, I'm a test string!" with the first letter
> replaced
> + * with a capital L should be printed out.
> + */
> +
> +    .text
> +    .globl    test
> +test:
> +    {
> +        jumpr r31
> +        memb(r0+#0)=3D#76
> +    }
> +.Lfunc_end0:
> +.Ltmp0:
> +    .size    test, .Ltmp0-test
> +
> +    .globl    _start
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        call test
> +        r0=3D##dummy_buffer
> +        allocframe(#0)
> +    }
> +    {
> +        call write
> +    }
> +    {
> +        jump pass
> +    }
> +    {
> +        r31:30=3Ddeallocframe(r30):raw
> +    }
> +.Lfunc_end1:
> +.Ltmp1:
> +    .size    _start, .Ltmp1-_start
> +write:
> +    {
> +        r2=3D##dummy_buffer
> +    }
> +    { r0=3Dr2; }
>

Assign to r0 directly


> +    {
> +        r2=3D#256
> +    }
> +    { r1=3Dr2; }
>

Assign to r1 directly

+    { trap0(#7); }
>

This doesn't print anything - the syscall number goes in r6.  Is the intent
to invoke SYS_write?  If so, look at first.S to see how this is done.

+    {
> +        jumpr r31
> +    }
> +.Lfunc_end2:
> +.Ltmp2:
> +    .size    write, .Ltmp2-write
> +
> +    .type    dummy_buffer,@object
> +    .data
> +    .globl    dummy_buffer
> +    .p2align    3
> +dummy_buffer:
> +    .string    "Hello there, I'm a test string!\n"
> +    .space 223
> +    .size    dummy_buffer, 256
>



> diff --git a/tests/tcg/hexagon/test_djump.S
> b/tests/tcg/hexagon/test_djump.S
> new file mode 100644
> index 0000000000..dbad7eb0a1
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_djump.S
> @@ -0,0 +1,24 @@
> +/* Purpose: show dual jumps actually work. This program features a packe=
t
> where
> + * two jumps should (in theory) be performed if !P0. However, we correct=
ly
> + * handle the situation by performing only the first one and ignoring th=
e
> second
> + * one. This can be verified by checking that the CPU dump contains
> 0xDEADBEEF
> + * in R2.
> + */
>

How does 0xDEADBEEF get into r2?

Do we need this test given that every other test relies on this idiom to
check pass/fail?

+
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r1 =3D #255;
> +    }
> +    {
> +        p0 =3D r1;
> +    }
> +    {
> +        if (p0) jump:t pass
> +        jump fail
> +    }
> diff --git a/tests/tcg/hexagon/test_dotnew.S
> b/tests/tcg/hexagon/test_dotnew.S
> new file mode 100644
> index 0000000000..3897c6bc96
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_dotnew.S
> @@ -0,0 +1,39 @@
> +/* Purpose: test the .new operator while performing memory stores.
> + * In the final CPU dump R0 should contain 3, R1 should contain 2 and R2
> should
> + * contain 1.
> + */
>

CPU dump sounds like something you have locally.  The check-tcg tests
should not rely on this.

+    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r0=3D#1
> +        memw(sp+#0)=3Dr0.new
> +    }
>

You haven't set up the stack, so you shouldn't use sp.  Even if the stack
were set up, you should allocframe first.

+    {
> +        r1=3D#2
> +        memw(sp+#4)=3Dr1.new
> +    }
> +    {
> +        r2=3D#3
> +        memw(sp+#8)=3Dr2.new
> +    }
> +    {
> +        r0=3Dmemw(sp+#8)
> +    }
> +    {
> +        r1=3Dmemw(sp+#4)
> +    }
> +    {
> +        r2=3Dmemw(sp+#0)
> +    }
> +    {
> +        r3=3Dmpyi(r1,r2)
> +    }
> +    {
> +        p0 =3D cmp.eq(r3, #2); if (p0.new) jump:t pass
> +        jump fail
> +    }
> diff --git a/tests/tcg/hexagon/test_dstore.S
> b/tests/tcg/hexagon/test_dstore.S
> new file mode 100644
> index 0000000000..62c4301eb1
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_dstore.S
> @@ -0,0 +1,29 @@
> +/* Purpose: test dual stores correctness.
> + * In this example the values 1 and 2 are both written on the top of the
> stack
> + * in a single packet.
> + * The value is then read back in R3, which should contain only the
> latest value
> + * written (2).
> + */
>

 This is already tested in dual_stores.c

+
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r0=3D#1
> +        r1=3D#2
> +    }
> +    {
> +        memw(sp+#0)=3Dr0
> +        memw(sp+#0)=3Dr1
> +    }
>

Stack setup ...

+    {
> +        r3=3Dmemw(sp+#0)
> +    }
> +    {
> +        p0 =3D cmp.eq(r3, #2); if (p0.new) jump:t pass
> +        jump fail
> +    }
> diff --git a/tests/tcg/hexagon/test_ext.S b/tests/tcg/hexagon/test_ext.S
> new file mode 100644
> index 0000000000..0f6e21593a
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_ext.S
> @@ -0,0 +1,18 @@
> +/* Purpose: test immediate extender instructions.
> + * In the CPU dump R0 should contain 0xDEADBEEF.
>

The CPU dump comment doesn't apply


> + */
> +
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r2=3D##-559038737
> +    }
> +    {
> +        p0 =3D cmp.eq(r2, ##-559038737); if (p0.new) jump:t pass
> +        jump fail
> +    }
>


> +++ b/tests/tcg/hexagon/test_hello.S
> @@ -0,0 +1,21 @@
> +/* Purpose: simple hello world program. */
>

This is already tested in first.S

+
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    { r0=3D#4; }
> +    {
> +        r1=3D##.L.str
> +    }
> +    { trap0(#0); }
> +    {
> +        jump pass
> +    }
> +
> +.L.str:
> +    .string    "Hello world!\n"
> +    .size    .L.str, 14
>


> diff --git a/tests/tcg/hexagon/test_hwloops.S
> b/tests/tcg/hexagon/test_hwloops.S
> new file mode 100644
> index 0000000000..8337083d8e
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_hwloops.S
> @@ -0,0 +1,25 @@
> +/* Purpose: simple C Program to test hardware loops.
> + * It should print numbersfrom 0 to 9.
>

This doesn't actually print anything.


> + */
> +
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        loop0(.LBB0_1,#10)
> +        r2=3D#0
> +    }
> +.Ltmp0:
> +.LBB0_1:
> +    {
> +        r2=3Dadd(r2,#1)
> +        nop
> +    }:endloop0
> +    {
> +        p0 =3D cmp.eq(r2, #10); if (p0.new) jump:t pass
> +        jump fail
> +    }
>


> diff --git a/tests/tcg/hexagon/test_jmp.S b/tests/tcg/hexagon/test_jmp.S
> new file mode 100644
> index 0000000000..9bf6ea34e5
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_jmp.S
> @@ -0,0 +1,25 @@
> +/* Purpose: test example, verify the soundness of the add operation */
>

What value does this test have beyond the others in this set?

+
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r1=3D#0
> +        r2=3D#0
> +    }
> +    {
> +        r3=3Dadd(r1,r2)
> +    }
> +    {
> +        p0 =3D cmp.eq(r3, #0)
> +    }
> +    {
> +        if (p0) jump:t pass
> +    }
> +    {
> +        jump fail
> +    }
>

diff --git a/tests/tcg/hexagon/test_packet.S
b/tests/tcg/hexagon/test_packet.S

> new file mode 100644
> index 0000000000..d26e284be9
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_packet.S
> @@ -0,0 +1,26 @@
> +/* Purpose: test that writes of a register in a packet are performed onl=
y
> after
> + * that packet has finished its execution.
> + */
> +
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    {
> +        r2=3D#4
> +        r3=3D#6
> +    }
> +    {
> +        memw(sp+#0)=3Dr2
>

Stack problem

+    }
> +    {
> +        r3=3Dmemw(sp+#0)
> +        r0=3Dadd(r2,r3)
> +    }
> +    {
> +        p0 =3D cmp.eq(r0, #10); if (p0.new) jump:t pass
> +        jump fail
> +    }
> diff --git a/tests/tcg/hexagon/test_reorder.S
> b/tests/tcg/hexagon/test_reorder.S
> new file mode 100644
> index 0000000000..508d5302f9
> --- /dev/null
> +++ b/tests/tcg/hexagon/test_reorder.S
> @@ -0,0 +1,31 @@
> +/* Purpose: demonstrate handling of .new uses appearing before the
> associated
> + * definition.
> + * Here we perform a jump that skips the code resetting R2 from
> 0xDEADBEEF to 0,
> + * only if P0.new is true, but P0 is assigned to 1 (R4) in the next
> instruction
> + * in the packet.
> + * A successful run of the program will show R2 retaining the 0xDEADBEEF
> value
> + * in the CPU dump.
>

CPU dump ...

+ */
> +
> +    .text
> +    .globl _start
> +
> +_start:
> +    {
> +        call init
> +    }
> +    { r2=3D#-559038737 }
> +    { r4=3D#1 }
> +    {
> +        if (p0.new) jump:nt skip
> +        p0=3Dr4;
> +    }
> +
> +fallthrough:
> +    { r2=3D#0 }
> +
> +skip:
> +    {
> +        p0 =3D cmp.eq(r2, #-559038737); if (p0.new) jump:t pass
> +        jump fail
> +    }
>

Each of these are very small, so I recommend putting them into misc.c or
combine all the assembly into a small number of executables.

--000000000000bdb6b405c59fe571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 19, 2021 at 4:49 AM Aless=
andro Di Federico via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-dev=
el@nongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">From: Niccol=C3=B2 Izzo &lt;nizzo@rev.ng&gt;<br>
<br>
Signed-off-by: Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
Signed-off-by: Niccol=C3=B2 Izzo &lt;nizzo@rev.ng&gt;<br>
---<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">diff --git a/tests/tcg/hexagon/crt.S b/tests/tcg/hexagon/crt.S<=
br>
new file mode 100644<br>
index 0000000000..2c10577470<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/crt.S<br>
@@ -0,0 +1,28 @@<br>
+#define SYS_exit_group=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A094<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl init<br>
+init:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 allocframe(r29,#0):raw<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D#256<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dealloc_return<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>You don&#39;t need to =
alloc/dealloc the frame, just a single packet { r0 =3D #256; jumpr r31 }</d=
iv><div><br></div><div>Then again, why is this function needed at all?</div=
><div><br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
+=C2=A0 =C2=A0 .space 240<br></blockquote><div><br></div><div>Why is this s=
pace needed?</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">diff --git a/tests/tcg/hexagon/test_andp.S b/tests/tcg/hexagon/t=
est_andp.S<br>
new file mode 100644<br>
index 0000000000..3c4aa8b2ae<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_andp.S<br>
@@ -0,0 +1,23 @@<br>
+/* Purpose: test a multiple predicate AND combination */<br></blockquote><=
div><br></div><div>This is already tested in misc.c</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1+=3Dsub(r2,r3)<br></blockquote><div><br></di=
v><div>Remove this - r1, r2, and r3 are uninitialized.=C2=A0 Then, you over=
write r1 in the next packet.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D#0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3D#1<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0=3D<a href=3D"http://cmp.gt" rel=3D"noreferr=
er" target=3D"_blank">cmp.gt</a>(r0,r1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0=3D<a href=3D"http://cmp.gt" rel=3D"noreferr=
er" target=3D"_blank">cmp.gt</a>(r0,r1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0=3D<a href=3D"http://cmp.gt" rel=3D"noreferr=
er" target=3D"_blank">cmp.gt</a>(r1,r0)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p0) jump:t pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br><br>diff --git a/tests/tcg/hexagon/test_call.S b/tests/=
tcg/hexagon/test_call.S<br>
new file mode 100644<br>
index 0000000000..53a2450522<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_call.S<br>
@@ -0,0 +1,63 @@<br>
+/* Purpose: test function calls and duplex instructions.<br>
+ * The string &quot;Hello there, I&#39;m a test string!&quot; with the fir=
st letter replaced<br>
+ * with a capital L should be printed out.<br>
+ */<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl=C2=A0 =C2=A0 test<br>
+test:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jumpr r31<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memb(r0+#0)=3D#76<br>
+=C2=A0 =C2=A0 }<br>
+.Lfunc_end0:<br>
+.Ltmp0:<br>
+=C2=A0 =C2=A0 .size=C2=A0 =C2=A0 test, .Ltmp0-test<br>
+<br>
+=C2=A0 =C2=A0 .globl=C2=A0 =C2=A0 _start<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call test<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D##dummy_buffer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 allocframe(#0)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call write<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump pass<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r31:30=3Ddeallocframe(r30):raw<br>
+=C2=A0 =C2=A0 }<br>
+.Lfunc_end1:<br>
+.Ltmp1:<br>
+=C2=A0 =C2=A0 .size=C2=A0 =C2=A0 _start, .Ltmp1-_start<br>
+write:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D##dummy_buffer<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 { r0=3Dr2; }<br></blockquote><div><br></div><div>Assign to r=
0 directly<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D#256<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 { r1=3Dr2; }<br></blockquote><div><br></div><div>Assign to r=
1 directly<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 { trap0(#7); }<br></blockquote><div><br></div><div>This does=
n&#39;t print anything - the syscall number goes in r6.=C2=A0 Is the intent=
 to invoke SYS_write?=C2=A0 If so, look at first.S to see how this is done.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jumpr r31<br>
+=C2=A0 =C2=A0 }<br>
+.Lfunc_end2:<br>
+.Ltmp2:<br>
+=C2=A0 =C2=A0 .size=C2=A0 =C2=A0 write, .Ltmp2-write<br>
+<br>
+=C2=A0 =C2=A0 .type=C2=A0 =C2=A0 dummy_buffer,@object<br>
+=C2=A0 =C2=A0 .data<br>
+=C2=A0 =C2=A0 .globl=C2=A0 =C2=A0 dummy_buffer<br>
+=C2=A0 =C2=A0 .p2align=C2=A0 =C2=A0 3<br>
+dummy_buffer:<br>
+=C2=A0 =C2=A0 .string=C2=A0 =C2=A0 &quot;Hello there, I&#39;m a test strin=
g!\n&quot;<br>
+=C2=A0 =C2=A0 .space 223<br>
+=C2=A0 =C2=A0 .size=C2=A0 =C2=A0 dummy_buffer, 256<br></blockquote><div>=
=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">diff --git a/tests/tcg/hexagon/test_djump.S b/tests/tcg/hexagon/test_dj=
ump.S<br>
new file mode 100644<br>
index 0000000000..dbad7eb0a1<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_djump.S<br>
@@ -0,0 +1,24 @@<br>
+/* Purpose: show dual jumps actually work. This program features a packet =
where<br>
+ * two jumps should (in theory) be performed if !P0. However, we correctly=
<br>
+ * handle the situation by performing only the first one and ignoring the =
second<br>
+ * one. This can be verified by checking that the CPU dump contains 0xDEAD=
BEEF<br>
+ * in R2.<br>
+ */<br></blockquote><div><br></div><div>How does 0xDEADBEEF get into r2?</=
div><div><br></div><div>Do we need this test given that every other test re=
lies on this idiom to check pass/fail?<br></div><div> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D #255;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D r1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p0) jump:t pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br>
diff --git a/tests/tcg/hexagon/test_dotnew.S b/tests/tcg/hexagon/test_dotne=
w.S<br>
new file mode 100644<br>
index 0000000000..3897c6bc96<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_dotnew.S<br>
@@ -0,0 +1,39 @@<br>
+/* Purpose: test the .new operator while performing memory stores.<br>
+ * In the final CPU dump R0 should contain 3, R1 should contain 2 and R2 s=
hould<br>
+ * contain 1.<br>
+ */<br></blockquote><div><br></div><div>CPU dump sounds like something you=
 have locally.=C2=A0 The check-tcg tests should not rely on this.</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D#1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#0)=3Dr0.new<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>You haven&#39;t set up=
 the stack, so you shouldn&#39;t use sp.=C2=A0 Even if the stack were set u=
p, you should allocframe first.<br></div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3D#2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#4)=3Dr1.new<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D#3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#8)=3Dr2.new<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3Dmemw(sp+#8)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3Dmemw(sp+#4)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3Dmemw(sp+#0)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r3=3Dmpyi(r1,r2)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r3, #2); if (p0.new) jump:t pass=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br>
diff --git a/tests/tcg/hexagon/test_dstore.S b/tests/tcg/hexagon/test_dstor=
e.S<br>
new file mode 100644<br>
index 0000000000..62c4301eb1<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_dstore.S<br>
@@ -0,0 +1,29 @@<br>
+/* Purpose: test dual stores correctness.<br>
+ * In this example the values 1 and 2 are both written on the top of the s=
tack<br>
+ * in a single packet.<br>
+ * The value is then read back in R3, which should contain only the latest=
 value<br>
+ * written (2).<br>
+ */<br></blockquote><div><br></div><div>=C2=A0This is already tested in du=
al_stores.c</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3D#1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3D#2<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#0)=3Dr0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#0)=3Dr1<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Stack setup ...</div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r3=3Dmemw(sp+#0)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r3, #2); if (p0.new) jump:t pass=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br>
diff --git a/tests/tcg/hexagon/test_ext.S b/tests/tcg/hexagon/test_ext.S<br=
>
new file mode 100644<br>
index 0000000000..0f6e21593a<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_ext.S<br>
@@ -0,0 +1,18 @@<br>
+/* Purpose: test immediate extender instructions.<br>
+ * In the CPU dump R0 should contain 0xDEADBEEF.<br></blockquote><div><br>=
</div><div>The CPU dump comment doesn&#39;t apply <br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D##-559038737<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r2, ##-559038737); if (p0.new) j=
ump:t pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">+++ b/tests/tcg/hexagon/test_hello.S<br>
@@ -0,0 +1,21 @@<br>
+/* Purpose: simple hello world program. */<br></blockquote><div><br></div>=
<div>This is already tested in first.S</div><div> <br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 { r0=3D#4; }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3D##.L.str<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 { trap0(#0); }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump pass<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+.L.str:<br>
+=C2=A0 =C2=A0 .string=C2=A0 =C2=A0 &quot;Hello world!\n&quot;<br>
+=C2=A0 =C2=A0 .size=C2=A0 =C2=A0 .L.str, 14<br></blockquote><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">diff --git a/tests/tcg=
/hexagon/test_hwloops.S b/tests/tcg/hexagon/test_hwloops.S<br>
new file mode 100644<br>
index 0000000000..8337083d8e<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_hwloops.S<br>
@@ -0,0 +1,25 @@<br>
+/* Purpose: simple C Program to test hardware loops.<br>
+ * It should print numbersfrom 0 to 9.<br></blockquote><div><br></div><div=
>This doesn&#39;t actually print anything.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 loop0(.LBB0_1,#10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D#0<br>
+=C2=A0 =C2=A0 }<br>
+.Ltmp0:<br>
+.LBB0_1:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3Dadd(r2,#1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nop<br>
+=C2=A0 =C2=A0 }:endloop0<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r2, #10); if (p0.new) jump:t pas=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
diff --git a/tests/tcg/hexagon/test_jmp.S b/tests/tcg/hexagon/test_jmp.S<br=
>
new file mode 100644<br>
index 0000000000..9bf6ea34e5<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_jmp.S<br>
@@ -0,0 +1,25 @@<br>
+/* Purpose: test example, verify the soundness of the add operation */<br>=
</blockquote><div><br></div><div>What value does this test have beyond the =
others in this set?</div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1=3D#0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D#0<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r3=3Dadd(r1,r2)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r3, #0)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p0) jump:t pass<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br></blockquote><br></div><div class=3D"gmail_quote">diff =
--git a/tests/tcg/hexagon/test_packet.S b/tests/tcg/hexagon/test_packet.S<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
new file mode 100644<br>
index 0000000000..d26e284be9<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_packet.S<br>
@@ -0,0 +1,26 @@<br>
+/* Purpose: test that writes of a register in a packet are performed only =
after<br>
+ * that packet has finished its execution.<br>
+ */<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r2=3D#4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r3=3D#6<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memw(sp+#0)=3Dr2<br></blockquote><div><br></di=
v><div>Stack problem</div><div> <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r3=3Dmemw(sp+#0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r0=3Dadd(r2,r3)<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r0, #10); if (p0.new) jump:t pas=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br>
diff --git a/tests/tcg/hexagon/test_reorder.S b/tests/tcg/hexagon/test_reor=
der.S<br>
new file mode 100644<br>
index 0000000000..508d5302f9<br>
--- /dev/null<br>
+++ b/tests/tcg/hexagon/test_reorder.S<br>
@@ -0,0 +1,31 @@<br>
+/* Purpose: demonstrate handling of .new uses appearing before the associa=
ted<br>
+ * definition.<br>
+ * Here we perform a jump that skips the code resetting R2 from 0xDEADBEEF=
 to 0,<br>
+ * only if P0.new is true, but P0 is assigned to 1 (R4) in the next instru=
ction<br>
+ * in the packet.<br>
+ * A successful run of the program will show R2 retaining the 0xDEADBEEF v=
alue<br>
+ * in the CPU dump.<br></blockquote><div><br></div><div>CPU dump ...</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ */<br>
+<br>
+=C2=A0 =C2=A0 .text<br>
+=C2=A0 =C2=A0 .globl _start<br>
+<br>
+_start:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 call init<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 { r2=3D#-559038737 }<br>
+=C2=A0 =C2=A0 { r4=3D#1 }<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p0.new) jump:nt skip<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0=3Dr4;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+fallthrough:<br>
+=C2=A0 =C2=A0 { r2=3D#0 }<br>
+<br>
+skip:<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p0 =3D cmp.eq(r2, #-559038737); if (p0.new) ju=
mp:t pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jump fail<br>
+=C2=A0 =C2=A0 }<br></blockquote><div>=C2=A0<br></div>Each of these are ver=
y small, so I recommend putting them into misc.c or combine all the assembl=
y into a small number of executables.<br></div></div>

--000000000000bdb6b405c59fe571--

