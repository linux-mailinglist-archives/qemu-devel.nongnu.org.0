Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F444E052
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:33:20 +0100 (CET)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMNT-0003Xl-5d
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:33:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlMLy-0001VO-Di; Thu, 11 Nov 2021 21:31:46 -0500
Received: from [2607:f8b0:4864:20::92d] (port=46912
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1mlMLv-0007le-GR; Thu, 11 Nov 2021 21:31:46 -0500
Received: by mail-ua1-x92d.google.com with SMTP id az37so15902086uab.13;
 Thu, 11 Nov 2021 18:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=h8hqWgSxiOyVQuIgEVInFGYrEc74065H7+LBeLGubwg=;
 b=TCIOcIwhUVPWC0ftT1zbCBoHoiKKXVWCuFY9aUlM6ITkUerNsj3pidj0l8AY0p5XKJ
 Bh8YaEL6Mp8CT+SChVe56B5pg8z/7exTMErW33ddz+XxbTlCxj25lPXl84su1FmypdS8
 UOIg9T3fx3BZJrjkyLf//mNdUpE/B2UawPmZWNYBpwbVkUeoXQMGF63Izk7+I6uBCN4e
 QzU72HnA4H5fdHYUDXgCPPmPc9Eol9eLGJX7uWfD+BSlepTY5X9Texf88BUa8mQ2ZI6Y
 ryMZiO54j3ZGX43i/AbcxO7vzzj7zCzo0h7/uMuIR3IQWeAzikAEbI9PNgAu0sQ6O/wU
 C0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=h8hqWgSxiOyVQuIgEVInFGYrEc74065H7+LBeLGubwg=;
 b=pMKgNK04UPob0O1ooqWzq6ufVBH+ChJJQ2lOO8au79OhvWLiBajJrqfcHWOZlcQGbW
 0SCR7jFc2y7elOUwxPk4Q0R1ENsv88Pqe79+am5d0p4t91IvDjSgqRU4/HuAxUL8rDof
 +Md23MsVMX62odQrU8jgpUrkgAOLjP8qIvKdJZZbGkFbZhHciVLXdryAOs3TS7J7K9Xw
 OkJuww7mDiQj1blXMOYb7TDPVkWJUXxC72U3c/h5kU9DuTEc9fgDt1+4d1wS4u4H4gkS
 3qE8DwbQjYsn1PyCPUTlFwn8gF8YHOS8GoJ5AKk0/zsp+Ujmyk4HAnc4UIDZ3Z1wAAb4
 qoOQ==
X-Gm-Message-State: AOAM5307OHvli0IvmDULyz5Kw947OUBzLjBbi2MqY/gu2Ey72lmXJA+m
 VSbjIdr58ema3sMyWJZKdCTizYNw4xCSmZW8Zjs=
X-Google-Smtp-Source: ABdhPJwfZtrfFHC6GINb16vgl+uV4v/YcluRzE0KqzivKk6p94bZD8KOPXLyD5VWP5kWY2HS1Cjbus5d/bAYSZL9C4M=
X-Received: by 2002:a05:6102:2924:: with SMTP id
 cz36mr5239510vsb.33.1636684301512; 
 Thu, 11 Nov 2021 18:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk>
 <b87bb52d-166f-0c1c-efe6-0747e1f08453@eldorado.org.br>
 <dfe12d85-7c76-f65f-fab0-3660e6d09a79@eik.bme.hu>
In-Reply-To: <dfe12d85-7c76-f65f-fab0-3660e6d09a79@eik.bme.hu>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 12 Nov 2021 10:31:31 +0800
Message-ID: <CAE2XoE_Hs0H8fu_dUAzkU-QucbsuLd97m+-dc2wkwc-4WkpGiQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="00000000000066b4b705d08e4273"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, danielhb413@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066b4b705d08e4273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 4:42 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Wed, 10 Nov 2021, Lucas Mateus Martins Araujo e Castro wrote:
> > On 10/11/2021 05:19, Mark Cave-Ayland wrote:
> >> On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:
> >>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> >>>
> >>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
> >>> after updating the value of FPSCR, but helper_float_check_status
> >>> checks fp_status and fp_status isn't updated based on FPSCR and
> >>> since the value of fp_status is reset earlier in the instruction,
> >>> it's always 0.
> >>>
> >>> Because of this helper_float_check_status would change the FI bit to =
0
> >>> as this bit checks if the last operation was inexact and
> >>> float_flag_inexact is always 0.
> >>>
> >>> These instructions also don't throw exceptions correctly since
> >>> helper_float_check_status throw exceptions based on fp_status.
> >>>
> >>> This commit created a new helper, helper_fpscr_check_status that
checks
> >>> FPSCR value instead of fp_status and checks for a larger variety of
> >>> exceptions than do_float_check_status.
> >>>
> >>> The hardware used to compare QEMU's behavior to, was a Power9.
> >>>
> >>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
> >>> Signed-off-by: Lucas Mateus Castro (alqotel)
> >>> <lucas.castro@eldorado.org.br>
> >>> ---
> >>>   target/ppc/fpu_helper.c            | 41
++++++++++++++++++++++++++++++
> >>>   target/ppc/helper.h                |  1 +
> >>>   target/ppc/translate/fp-impl.c.inc |  6 ++---
> >>>   3 files changed, 45 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> >>> index c4896cecc8..f086cb503f 100644
> >>> --- a/target/ppc/fpu_helper.c
> >>> +++ b/target/ppc/fpu_helper.c
> >>> @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env,
uint64_t
> >>> val, uint32_t nibbles)
> >>>       ppc_store_fpscr(env, val);
> >>>   }
> >>>
> >>> +void helper_fpscr_check_status(CPUPPCState *env)
> >>> +{
> >>> +    CPUState *cs =3D env_cpu(env);
> >>> +    target_ulong fpscr =3D env->fpscr;
> >>> +    int error =3D 0;
> >>> +
> >>> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXSOFT;
> >>> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> >>> +        error =3D POWERPC_EXCP_FP_OX;
> >>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> >>> +        error =3D POWERPC_EXCP_FP_UX;
> >>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> >>> +        error =3D POWERPC_EXCP_FP_XX;
> >>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
> >>> +        error =3D POWERPC_EXCP_FP_ZX;
> >>> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXSNAN;
> >>> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXISI;
> >>> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXIDI;
> >>> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXZDZ;
> >>> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXIMZ;
> >>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve !=3D 0)) {
> >>> +        error =3D POWERPC_EXCP_FP_VXVC;
> >>> +    }
> >>> +
> >>> +    if (error) {
> >>> +        cs->exception_index =3D POWERPC_EXCP_PROGRAM;
> >>> +        env->error_code =3D error | POWERPC_EXCP_FP;
> >>> +        /* Deferred floating-point exception after target FPSCR
update */
> >>> +        if (fp_exceptions_enabled(env)) {
> >>> +            raise_exception_err_ra(env, cs->exception_index,
> >>> +                                   env->error_code, GETPC());
> >>> +        }
> >>> +    }
> >>> +}
> >>> +
> >>>   static void do_float_check_status(CPUPPCState *env, uintptr_t raddr=
)
> >>>   {
> >>>       CPUState *cs =3D env_cpu(env);
> >>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> >>> index 4076aa281e..baa3715e73 100644
> >>> --- a/target/ppc/helper.h
> >>> +++ b/target/ppc/helper.h
> >>> @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE,
i32,
> >>> i32)
> >>>   DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> >>>
> >>>   DEF_HELPER_1(float_check_status, void, env)
> >>> +DEF_HELPER_1(fpscr_check_status, void, env)
> >>>   DEF_HELPER_1(reset_fpstatus, void, env)
> >>>   DEF_HELPER_2(compute_fprf_float64, void, env, i64)
> >>>   DEF_HELPER_3(store_fpscr, void, env, i64, i32)
> >>> diff --git a/target/ppc/translate/fp-impl.c.inc
> >>> b/target/ppc/translate/fp-impl.c.inc
> >>> index 9f7868ee28..0a9b1ecc60 100644
> >>> --- a/target/ppc/translate/fp-impl.c.inc
> >>> +++ b/target/ppc/translate/fp-impl.c.inc
> >>> @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
> >>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
> >>>       }
> >>>       /* We can raise a deferred exception */
> >>> -    gen_helper_float_check_status(cpu_env);
> >>> +    gen_helper_fpscr_check_status(cpu_env);
> >>>   }
> >>>
> >>>   /* mtfsf */
> >>> @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
> >>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
> >>>       }
> >>>       /* We can raise a deferred exception */
> >>> -    gen_helper_float_check_status(cpu_env);
> >>> +    gen_helper_fpscr_check_status(cpu_env);
> >>>       tcg_temp_free_i64(t1);
> >>>   }
> >>>
> >>> @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
> >>>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
> >>>       }
> >>>       /* We can raise a deferred exception */
> >>> -    gen_helper_float_check_status(cpu_env);
> >>> +    gen_helper_fpscr_check_status(cpu_env);
> >>>   }
> >>>
> >>>   /***                         Floating-point
> >>> load                           ***/
> >>
> >> FWIW the real issue here is that gen_helper_reset_fpstatus() even
exists at
> >> all: see
> >> the comments around enabling hardfloat in the PPC target by Emilio and
> >> Richard at
> >> https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html
and
> >> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html.
> >>
> >> I have tried a few informal experiments on my MacOS images by
completely
> >> removing all
> >> calls to gen_reset_fpstatus(), and whilst there were a few odd
behaviours I
> >> was
> >> surprised to find that the basic OS was usable. The main issue I had
was
> >> trying to
> >> come up with suitable test cases for the various instructions when my
only
> >> available
> >> hardware is a G4 Mac Mini.
> >>
> >> So yes this patch fixes one particular use case, but the real issue is
that
> >> the PPC
> >> target floating point flags need a bit of work: however once this is
done
> >> it should
> >> be possible for hardfloat to be enabled via a CPU option on suitable
hosts
> >> which will
> >> bring a noticeable improvement in floating point performance.
> >>
> > In this case I don't think gen_helper_reset_fpstatus() is the problem,
> > fp_status is not updated in the instruction but its value is used in
> > helper_float_check_status(), so if the values have not been reset since
the
> > last instruction it'll contain last instruction's information and if it
has
> > (either by calling gen_helper_reset_fpstatus(), by automatically doing
it
> > every instruction or by having every instruction reset it in the end)
it'll
> > have 0. So there are 3 alternatives to solve this that I can think of:
> >
> >     * Update FPSCR directly, then update fp_status based on FPSCR, for
this
> > you would either have to call a new helper to do this or update
> > helper_store_fpscr to do this, and then expand do_float_check_status to
throw
> > more exceptions (or create a new helper to do this if expanding
> > do_float_check_status could cause problems),
> >
> >     * Just don't use fp_status, update FPSCR directly and do the
deferred
> > exception using only information from FPSCR (the one I used this patch)=
,
> >
> >     * Update only fp_status directly and call either a modified
> > do_float_check_status or a new helper that would update FPSCR and throw
the
> > correct exception based on fp_status, this one I don't see how it would
> > feasible in the current implementation as FPSCR has many bits without a=
n
> > equivalent in fp_status.
> >
> > So with this I can see how to implement the 1st and 2nd option, I chose
not
> > to use the 1st one as do_float_check_status updates the FPSCR then
throw the
> > exception, which seemed unnecessary. Also looking back I should've
removed
> > gen_reset_fpstatus() as in the way it ended implemented these
instructions
> > don't interact with fp_status anywhere else, so I'll remove it in the
next
> > version.
> >
> > And looking at the suggestions the current implementation could be
changed to
> > take advantage of the optimization suggested in the discussion you
linked,
> > specially the parts about checking when exception bits aren't set (but
in
> > this case it would've to be the MSR exception bits) and the part about
> > skipping calculating a flag when marked to 1.
>
> I haven't followed the discussion but here's another message with some
> links I've collected when FPU came up that may be relevant to the topic:
>
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-04/msg00387.html
>
> among those is a long thread on patchwork that has some info on the
> current situation. As far as I remember the oddity in handling FPU
> exceptions is partly because of two bits FI and FR in FPSCR that should

That's correct, the most hard part is to simulate FI and FR bits in FPSCR a=
s
that was not provided on other CPU.

> reflect the result of the previous FPU op so has to be updated after ever=
y
> op which makes it hard to emulate as other CPUs usually don't do this. (W=
e
> could easily improve it if we did not emulate those bits, most guest code
> don't use them anyway, but QEMU prefers accuracy so that way was ruled
> out.) Other than that the current code maybe also can be simplified and
> maybe optimised via some other ways which were discussed in those threads
> but nobody implemented any of the ideas so far. May worth reading through
> what was said before as there might be sume useful ideas in there.
>
> Regards,
> BALATON Zoltan



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000066b4b705d08e4273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Nov 11, 2021 at 4:42 AM BALATON Zoltan &lt=
;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; wrote:<br=
>&gt;<br>&gt; On Wed, 10 Nov 2021, Lucas Mateus Martins Araujo e Castro wro=
te:<br>&gt; &gt; On 10/11/2021 05:19, Mark Cave-Ayland wrote:<br>&gt; &gt;&=
gt; On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:<br>&gt; &gt;&=
gt;&gt; From: &quot;Lucas Mateus Castro (alqotel)&quot; &lt;<a href=3D"mail=
to:lucas.castro@eldorado.org.br">lucas.castro@eldorado.org.br</a>&gt;<br>&g=
t; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; mtfsf, mtfsfi and mtfsb1 instructions =
call helper_float_check_status<br>&gt; &gt;&gt;&gt; after updating the valu=
e of FPSCR, but helper_float_check_status<br>&gt; &gt;&gt;&gt; checks fp_st=
atus and fp_status isn&#39;t updated based on FPSCR and<br>&gt; &gt;&gt;&gt=
; since the value of fp_status is reset earlier in the instruction,<br>&gt;=
 &gt;&gt;&gt; it&#39;s always 0.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; =
Because of this helper_float_check_status would change the FI bit to 0<br>&=
gt; &gt;&gt;&gt; as this bit checks if the last operation was inexact and<b=
r>&gt; &gt;&gt;&gt; float_flag_inexact is always 0.<br>&gt; &gt;&gt;&gt;<br=
>&gt; &gt;&gt;&gt; These instructions also don&#39;t throw exceptions corre=
ctly since<br>&gt; &gt;&gt;&gt; helper_float_check_status throw exceptions =
based on fp_status.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; This commit c=
reated a new helper, helper_fpscr_check_status that checks<br>&gt; &gt;&gt;=
&gt; FPSCR value instead of fp_status and checks for a larger variety of<br=
>&gt; &gt;&gt;&gt; exceptions than do_float_check_status.<br>&gt; &gt;&gt;&=
gt;<br>&gt; &gt;&gt;&gt; The hardware used to compare QEMU&#39;s behavior t=
o, was a Power9.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Resolves: <a hre=
f=3D"https://gitlab.com/qemu-project/qemu/-/issues/266">https://gitlab.com/=
qemu-project/qemu/-/issues/266</a><br>&gt; &gt;&gt;&gt; Signed-off-by: Luca=
s Mateus Castro (alqotel)<br>&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:lucas.=
castro@eldorado.org.br">lucas.castro@eldorado.org.br</a>&gt;<br>&gt; &gt;&g=
t;&gt; ---<br>&gt; &gt;&gt;&gt; =C2=A0 target/ppc/fpu_helper.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 ++++++++++++++++++++++++++++++<br>&gt; =
&gt;&gt;&gt; =C2=A0 target/ppc/helper.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>&gt; &gt;&gt;&gt; =C2=A0 target/ppc/tran=
slate/fp-impl.c.inc | =C2=A06 ++---<br>&gt; &gt;&gt;&gt; =C2=A0 3 files cha=
nged, 45 insertions(+), 3 deletions(-)<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt=
;&gt; diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c<br>&gt=
; &gt;&gt;&gt; index c4896cecc8..f086cb503f 100644<br>&gt; &gt;&gt;&gt; ---=
 a/target/ppc/fpu_helper.c<br>&gt; &gt;&gt;&gt; +++ b/target/ppc/fpu_helper=
.c<br>&gt; &gt;&gt;&gt; @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPC=
State *env, uint64_t<br>&gt; &gt;&gt;&gt; val, uint32_t nibbles)<br>&gt; &g=
t;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 ppc_store_fpscr(env, val);<br>&gt; &gt;&gt;=
&gt; =C2=A0 }<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; +void helper_fpscr_=
check_status(CPUPPCState *env)<br>&gt; &gt;&gt;&gt; +{<br>&gt; &gt;&gt;&gt;=
 + =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>&gt; &gt;&gt;&gt; + =C2=
=A0 =C2=A0target_ulong fpscr =3D env-&gt;fpscr;<br>&gt; &gt;&gt;&gt; + =C2=
=A0 =C2=A0int error =3D 0;<br>&gt; &gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt; + =
=C2=A0 =C2=A0if ((fpscr &amp; FP_VXSOFT) &amp;&amp; (fpscr_ve !=3D 0)) {<br=
>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_V=
XSOFT;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if ((fpscr &amp; FP_OX) &=
amp;&amp; (fpscr &amp; FP_OE)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error =3D POWERPC_EXCP_FP_OX;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=
=A0} else if ((fpscr &amp; FP_UX) &amp;&amp; (fpscr &amp; FP_UE)) {<br>&gt;=
 &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_UX;<br=
>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if ((fpscr &amp; FP_XX) &amp;&amp;=
 (fpscr &amp; FP_XE)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
rror =3D POWERPC_EXCP_FP_XX;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if =
((fpscr &amp; FP_ZX) &amp;&amp; (fpscr &amp; FP_ZE)) {<br>&gt; &gt;&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_ZX;<br>&gt; &gt;&gt=
;&gt; + =C2=A0 =C2=A0} else if ((fpscr &amp; FP_VXSNAN) &amp;&amp; (fpscr_v=
e !=3D 0)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PO=
WERPC_EXCP_FP_VXSNAN;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if ((fpscr=
 &amp; FP_VXISI) &amp;&amp; (fpscr_ve !=3D 0)) {<br>&gt; &gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_VXISI;<br>&gt; &gt;&gt;&g=
t; + =C2=A0 =C2=A0} else if ((fpscr &amp; FP_VXIDI) &amp;&amp; (fpscr_ve !=
=3D 0)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWER=
PC_EXCP_FP_VXIDI;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if ((fpscr &am=
p; FP_VXZDZ) &amp;&amp; (fpscr_ve !=3D 0)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_VXZDZ;<br>&gt; &gt;&gt;&gt; +=
 =C2=A0 =C2=A0} else if ((fpscr &amp; FP_VXIMZ) &amp;&amp; (fpscr_ve !=3D 0=
)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D POWERPC_EX=
CP_FP_VXIMZ;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0} else if ((fpscr &amp; FP=
_VXVC) &amp;&amp; (fpscr_ve !=3D 0)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0error =3D POWERPC_EXCP_FP_VXVC;<br>&gt; &gt;&gt;&gt; + =C2=A0=
 =C2=A0}<br>&gt; &gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0if (err=
or) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-&gt;exception_in=
dex =3D POWERPC_EXCP_PROGRAM;<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0env-&gt;error_code =3D error | POWERPC_EXCP_FP;<br>&gt; &gt;&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Deferred floating-point exception after tar=
get FPSCR update */<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (f=
p_exceptions_enabled(env)) {<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0raise_exception_err_ra(env, cs-&gt;exception_index,<br>=
&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;err=
or_code, GETPC());<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&=
gt; &gt;&gt;&gt; + =C2=A0 =C2=A0}<br>&gt; &gt;&gt;&gt; +}<br>&gt; &gt;&gt;&=
gt; +<br>&gt; &gt;&gt;&gt; =C2=A0 static void do_float_check_status(CPUPPCS=
tate *env, uintptr_t raddr)<br>&gt; &gt;&gt;&gt; =C2=A0 {<br>&gt; &gt;&gt;&=
gt; =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>&gt; &gt;&gt;&gt=
; diff --git a/target/ppc/helper.h b/target/ppc/helper.h<br>&gt; &gt;&gt;&g=
t; index 4076aa281e..baa3715e73 100644<br>&gt; &gt;&gt;&gt; --- a/target/pp=
c/helper.h<br>&gt; &gt;&gt;&gt; +++ b/target/ppc/helper.h<br>&gt; &gt;&gt;&=
gt; @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32,=
<br>&gt; &gt;&gt;&gt; i32)<br>&gt; &gt;&gt;&gt; =C2=A0 DEF_HELPER_FLAGS_2(b=
rinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;=
&gt; =C2=A0 DEF_HELPER_1(float_check_status, void, env)<br>&gt; &gt;&gt;&gt=
; +DEF_HELPER_1(fpscr_check_status, void, env)<br>&gt; &gt;&gt;&gt; =C2=A0 =
DEF_HELPER_1(reset_fpstatus, void, env)<br>&gt; &gt;&gt;&gt; =C2=A0 DEF_HEL=
PER_2(compute_fprf_float64, void, env, i64)<br>&gt; &gt;&gt;&gt; =C2=A0 DEF=
_HELPER_3(store_fpscr, void, env, i64, i32)<br>&gt; &gt;&gt;&gt; diff --git=
 a/target/ppc/translate/fp-impl.c.inc<br>&gt; &gt;&gt;&gt; b/target/ppc/tra=
nslate/fp-impl.c.inc<br>&gt; &gt;&gt;&gt; index 9f7868ee28..0a9b1ecc60 1006=
44<br>&gt; &gt;&gt;&gt; --- a/target/ppc/translate/fp-impl.c.inc<br>&gt; &g=
t;&gt;&gt; +++ b/target/ppc/translate/fp-impl.c.inc<br>&gt; &gt;&gt;&gt; @@=
 -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)<br>&gt; &gt;&gt=
;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shri_i32(cpu_crf[1], cpu_c=
rf[1], FPSCR_OX);<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt;&=
gt;&gt; =C2=A0 =C2=A0 =C2=A0 /* We can raise a deferred exception */<br>&gt=
; &gt;&gt;&gt; - =C2=A0 =C2=A0gen_helper_float_check_status(cpu_env);<br>&g=
t; &gt;&gt;&gt; + =C2=A0 =C2=A0gen_helper_fpscr_check_status(cpu_env);<br>&=
gt; &gt;&gt;&gt; =C2=A0 }<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; =C2=A0 =
/* mtfsf */<br>&gt; &gt;&gt;&gt; @@ -818,7 +818,7 @@ static void gen_mtfsf(=
DisasContext *ctx)<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);<br>&gt; &gt;&gt;&gt; =
=C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 /* We can =
raise a deferred exception */<br>&gt; &gt;&gt;&gt; - =C2=A0 =C2=A0gen_helpe=
r_float_check_status(cpu_env);<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0gen_help=
er_fpscr_check_status(cpu_env);<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 t=
cg_temp_free_i64(t1);<br>&gt; &gt;&gt;&gt; =C2=A0 }<br>&gt; &gt;&gt;&gt;<br=
>&gt; &gt;&gt;&gt; @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext =
*ctx)<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shri_=
i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; &gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 /* We can raise a deferr=
ed exception */<br>&gt; &gt;&gt;&gt; - =C2=A0 =C2=A0gen_helper_float_check_=
status(cpu_env);<br>&gt; &gt;&gt;&gt; + =C2=A0 =C2=A0gen_helper_fpscr_check=
_status(cpu_env);<br>&gt; &gt;&gt;&gt; =C2=A0 }<br>&gt; &gt;&gt;&gt;<br>&gt=
; &gt;&gt;&gt; =C2=A0 /*** =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Floating-point<br>&gt; &gt;&gt;&gt; loa=
d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ***/<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; FWIW the real issu=
e here is that gen_helper_reset_fpstatus() even exists at<br>&gt; &gt;&gt; =
all: see<br>&gt; &gt;&gt; the comments around enabling hardfloat in the PPC=
 target by Emilio and<br>&gt; &gt;&gt; Richard at<br>&gt; &gt;&gt; <a href=
=3D"https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html"=
>https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html</a>=
 and<br>&gt; &gt;&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-de=
vel/2020-05/msg00064.html">https://lists.gnu.org/archive/html/qemu-devel/20=
20-05/msg00064.html</a>.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; I have tried a f=
ew informal experiments on my MacOS images by completely<br>&gt; &gt;&gt; r=
emoving all<br>&gt; &gt;&gt; calls to gen_reset_fpstatus(), and whilst ther=
e were a few odd behaviours I<br>&gt; &gt;&gt; was<br>&gt; &gt;&gt; surpris=
ed to find that the basic OS was usable. The main issue I had was<br>&gt; &=
gt;&gt; trying to<br>&gt; &gt;&gt; come up with suitable test cases for the=
 various instructions when my only<br>&gt; &gt;&gt; available<br>&gt; &gt;&=
gt; hardware is a G4 Mac Mini.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; So yes thi=
s patch fixes one particular use case, but the real issue is that<br>&gt; &=
gt;&gt; the PPC<br>&gt; &gt;&gt; target floating point flags need a bit of =
work: however once this is done<br>&gt; &gt;&gt; it should<br>&gt; &gt;&gt;=
 be possible for hardfloat to be enabled via a CPU option on suitable hosts=
<br>&gt; &gt;&gt; which will<br>&gt; &gt;&gt; bring a noticeable improvemen=
t in floating point performance.<br>&gt; &gt;&gt;<br>&gt; &gt; In this case=
 I don&#39;t think gen_helper_reset_fpstatus() is the problem,<br>&gt; &gt;=
 fp_status is not updated in the instruction but its value is used in<br>&g=
t; &gt; helper_float_check_status(), so if the values have not been reset s=
ince the<br>&gt; &gt; last instruction it&#39;ll contain last instruction&#=
39;s information and if it has<br>&gt; &gt; (either by calling gen_helper_r=
eset_fpstatus(), by automatically doing it<br>&gt; &gt; every instruction o=
r by having every instruction reset it in the end) it&#39;ll<br>&gt; &gt; h=
ave 0. So there are 3 alternatives to solve this that I can think of:<br>&g=
t; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 * Update FPSCR directly, then update fp_=
status based on FPSCR, for this<br>&gt; &gt; you would either have to call =
a new helper to do this or update<br>&gt; &gt; helper_store_fpscr to do thi=
s, and then expand do_float_check_status to throw<br>&gt; &gt; more excepti=
ons (or create a new helper to do this if expanding<br>&gt; &gt; do_float_c=
heck_status could cause problems),<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 =
* Just don&#39;t use fp_status, update FPSCR directly and do the deferred<b=
r>&gt; &gt; exception using only information from FPSCR (the one I used thi=
s patch),<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 * Update only fp_status d=
irectly and call either a modified<br>&gt; &gt; do_float_check_status or a =
new helper that would update FPSCR and throw the<br>&gt; &gt; correct excep=
tion based on fp_status, this one I don&#39;t see how it would<br>&gt; &gt;=
 feasible in the current implementation as FPSCR has many bits without an<b=
r>&gt; &gt; equivalent in fp_status.<br>&gt; &gt;<br>&gt; &gt; So with this=
 I can see how to implement the 1st and 2nd option, I chose not<br>&gt; &gt=
; to use the 1st one as do_float_check_status updates the FPSCR then throw =
the<br>&gt; &gt; exception, which seemed unnecessary. Also looking back I s=
hould&#39;ve removed<br>&gt; &gt; gen_reset_fpstatus() as in the way it end=
ed implemented these instructions<br>&gt; &gt; don&#39;t interact with fp_s=
tatus anywhere else, so I&#39;ll remove it in the next<br>&gt; &gt; version=
.<br>&gt; &gt;<br>&gt; &gt; And looking at the suggestions the current impl=
ementation could be changed to<br>&gt; &gt; take advantage of the optimizat=
ion suggested in the discussion you linked,<br>&gt; &gt; specially the part=
s about checking when exception bits aren&#39;t set (but in<br>&gt; &gt; th=
is case it would&#39;ve to be the MSR exception bits) and the part about<br=
>&gt; &gt; skipping calculating a flag when marked to 1.<br>&gt;<br>&gt; I =
haven&#39;t followed the discussion but here&#39;s another message with som=
e<br>&gt; links I&#39;ve collected when FPU came up that may be relevant to=
 the topic:<br>&gt;<br>&gt; <a href=3D"https://lists.nongnu.org/archive/htm=
l/qemu-ppc/2020-04/msg00387.html">https://lists.nongnu.org/archive/html/qem=
u-ppc/2020-04/msg00387.html</a><br>&gt;<br>&gt; among those is a long threa=
d on patchwork that has some info on the<br>&gt; current situation. As far =
as I remember the oddity in handling FPU<br>&gt; exceptions is partly becau=
se of two bits FI and FR in FPSCR that should<div><br></div><div>That&#39;s=
 correct, the most hard part is to simulate FI and FR bits in FPSCR as</div=
><div>that was not provided on other CPU.</div><div><br>&gt; reflect the re=
sult of the previous FPU op so has to be updated after every<br>&gt; op whi=
ch makes it hard to emulate as other CPUs usually don&#39;t do this. (We<br=
>&gt; could easily improve it if we did not emulate those bits, most guest =
code<br>&gt; don&#39;t use them anyway, but QEMU prefers accuracy so that w=
ay was ruled<br>&gt; out.) Other than that the current code maybe also can =
be simplified and<br>&gt; maybe optimised via some other ways which were di=
scussed in those threads<br>&gt; but nobody implemented any of the ideas so=
 far. May worth reading through<br>&gt; what was said before as there might=
 be sume useful ideas in there.<br>&gt;<br>&gt; Regards,<br>&gt; BALATON Zo=
ltan<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=
=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 s=
incerely,<br>Yonggang Luo</div></div>

--00000000000066b4b705d08e4273--

