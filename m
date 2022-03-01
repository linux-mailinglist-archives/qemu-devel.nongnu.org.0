Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6C4C87C2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:22:15 +0100 (CET)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyhy-0008VQ-EF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nOy9D-0002sr-A6
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:46:19 -0500
Received: from [2a00:1450:4864:20::429] (port=35401
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nOy97-0000nu-7h
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:46:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id b5so19300988wrr.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PzcaGox3UqCygkt+mR5hkso+/7bFnXjHu8TgRtf1/ug=;
 b=J85wfmVptpaHw3z/8RqqoJV5AuZMityDnE2U+nClzsNi7oMfC7tZ6Ylr2FV+7m6mtJ
 Pa0BXVYYi9xWKeB2Y7MUAKNoPbm8WDcH+6fvF/GNJ2giX3PsEwvmOpd1rsMk7GdLqYsF
 TDz0PKdQedIq5S1My5JKxU3cpTTefYDQLJt5Iqg9SZQVqC6GZlMw19LStsOBp4JiEXQV
 YHOv6hkQsrTfv8MPLsSYrw8aC0bMsD1wtuvCEMjqUu9+KYM3EI8Z9tidapCnBgcFCwAX
 ZmHG6/T3WK9I5xzL+uSWaYYCubUgwCeoSSxmmC7EAqvyeStv4gZYGYYrUOE/HwC6IA/w
 w9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzcaGox3UqCygkt+mR5hkso+/7bFnXjHu8TgRtf1/ug=;
 b=4UyfBlVEp7sJ1I26qPcl+8mM/u4q93zJ8rRuSgEIawq0M2z6ONiij0AuJKTIpM4pvA
 0emY1hGogQCqwFWLWEhTk1JitxD+jdcLdndnic6AUnTYUcb3z/aFBT0KhH6mQO1xHAl0
 xd+kApyep40Ek5khgU07Ss7Wj+wQnQSVk7wRQJUF6OOKv0ZhFOMHoIiQMq5/oPLHnQRT
 tNMJ7H0HZ2HG/VsfFCeZHFWijI/YsvRy0gZUJeG+aZpLB1by3VUGy4LjMmtGsdynWQET
 JhgsowglnvAIsgfGbXzpMeg3BuLh8htw1TL+Ecy7xACeWcBGA6Hq0AvTl+6Gn3Is6/kV
 jFog==
X-Gm-Message-State: AOAM532DmFTRxt21aOegYv5awSgxIPzCE9p9h6R/UEW241qB9sIcAyan
 S/0Re0dn/4/RD40kYePE0k3/hwkl1CUadVp+Pf+GCQ==
X-Google-Smtp-Source: ABdhPJwvS7Pt4VhSoRs7+tVdDmDx3DrWBtO2rvsSZFshmBwXNCWUWDhyHgHFuhs4vaMkVhIVlKjXpXPE59drjewlTuk=
X-Received: by 2002:a5d:6d86:0:b0:1ef:fe9e:7a5f with SMTP id
 l6-20020a5d6d86000000b001effe9e7a5fmr2927188wrs.312.1646124364845; Tue, 01
 Mar 2022 00:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
 <CAKmqyKOLO7VdSPsXmeqQN-z3a2bKZQ3yeQqCmjt-SBpT9MfcgA@mail.gmail.com>
 <b7676252-781d-a7c6-6172-09dd319ef744@linux.dev>
In-Reply-To: <b7676252-781d-a7c6-6172-09dd319ef744@linux.dev>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 1 Mar 2022 09:45:54 +0100
Message-ID: <CAAeLtUC6=kQzYXpheSG9_rLo51iNz0nHbbgh+5SyKreKNKz6gw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix inverted checks for ext_zb[abcs]
To: Vineet Gupta <vineet.gupta@linux.dev>
Content-Type: multipart/alternative; boundary="00000000000005e5d805d9243240"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 gnu-toolchain <gnu-toolchain@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005e5d805d9243240
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Mar 2022 at 02:28, Vineet Gupta <vineet.gupta@linux.dev> wrote:

> Hi Alistair,
>
> On 2/3/22 16:59, Alistair Francis wrote:
> > On Fri, Feb 4, 2022 at 1:42 AM Philipp Tomsich <philipp.tomsich@vrull.eu>
> wrote:
> >>
> >> While changing to the use of cfg_ptr, the conditions for
> REQUIRE_ZB[ABCS]
> >> inadvertently became inverted and slipped through the initial testing
> (which
> >> used RV64GC_XVentanaCondOps as a target).
> >> This fixes the regression.
> >>
> >> Tested against SPEC2017 w/ GCC 12 (prerelease) for
> RV64GC_zba_zbb_zbc_zbs.
> >>
> >> Fixes: 718143c126 ("target/riscv: add a MAINTAINERS entry for
> XVentanaCondOps")
> >>
> >> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> >>
> >> ---
> >> We may want to squash this onto the affected commit, if it hasn't made
> >> it beyond the next-tree, yet.
> >
> > Yeah, agreed. I'll squash it in
> >
> > Alistair
>
> Has this already been committed upstream. I was running into weird issue
> related to bitmanip and seems this was missing in my local tree.
>

After checking master now, this has not made it onto master yet.
Note that rc0 is planned for 2 weeks from now, so I am not overly concerned
yet.

Philipp.


> Also the "Fixes: " entry in changelog doesn't seem OK; the issue seems
> to have been introduced in f2a32bec8f0da99 ("target/riscv: access cfg
> structure through DisasContext")
>
> Thx,
> -Vineet
>
> >
> >>
> >>   target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc
> b/target/riscv/insn_trans/trans_rvb.c.inc
> >> index f9bd3b7ec4..e3c6b459d6 100644
> >> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> >> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> >> @@ -19,25 +19,25 @@
> >>    */
> >>
> >>   #define REQUIRE_ZBA(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zba) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zba) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBB(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbb) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbb) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBC(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbc) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbc) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBS(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbs) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbs) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >> --
> >> 2.34.1
> >>
> >>
> >
> >
>
>

--00000000000005e5d805d9243240
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Mar 2022 at 02:28, Vineet G=
upta &lt;<a href=3D"mailto:vineet.gupta@linux.dev">vineet.gupta@linux.dev</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
 Alistair,<br>
<br>
On 2/3/22 16:59, Alistair Francis wrote:<br>
&gt; On Fri, Feb 4, 2022 at 1:42 AM Philipp Tomsich &lt;<a href=3D"mailto:p=
hilipp.tomsich@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; While changing to the use of cfg_ptr, the conditions for REQUIRE_Z=
B[ABCS]<br>
&gt;&gt; inadvertently became inverted and slipped through the initial test=
ing (which<br>
&gt;&gt; used RV64GC_XVentanaCondOps as a target).<br>
&gt;&gt; This fixes the regression.<br>
&gt;&gt;<br>
&gt;&gt; Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_=
zbc_zbs.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 718143c126 (&quot;target/riscv: add a MAINTAINERS entry for=
 XVentanaCondOps&quot;)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsi=
ch@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; <br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; We may want to squash this onto the affected commit, if it hasn&#3=
9;t made<br>
&gt;&gt; it beyond the next-tree, yet.<br>
&gt; <br>
&gt; Yeah, agreed. I&#39;ll squash it in<br>
&gt; <br>
&gt; Alistair<br>
<br>
Has this already been committed upstream. I was running into weird issue <b=
r>
related to bitmanip and seems this was missing in my local tree.<br></block=
quote><div><br></div><div>After checking master now, this has not made it o=
nto master yet.</div><div>Note that rc0 is planned for 2 weeks from now, so=
 I am not overly concerned yet.</div><div><br></div><div>Philipp.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also the &quot;Fixes: &quot; entry in changelog doesn&#39;t seem OK; the is=
sue seems <br>
to have been introduced in f2a32bec8f0da99 (&quot;target/riscv: access cfg =
<br>
structure through DisasContext&quot;)<br>
<br>
Thx,<br>
-Vineet<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----<b=
r>
&gt;&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/risc=
v/insn_trans/trans_rvb.c.inc<br>
&gt;&gt; index f9bd3b7ec4..e3c6b459d6 100644<br>
&gt;&gt; --- a/target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt;&gt; +++ b/target/riscv/insn_trans/trans_rvb.c.inc<br>
&gt;&gt; @@ -19,25 +19,25 @@<br>
&gt;&gt;=C2=A0 =C2=A0 */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#define REQUIRE_ZBA(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zba) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zba) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0} while (0)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#define REQUIRE_ZBB(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zbb) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zbb) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0} while (0)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#define REQUIRE_ZBC(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zbc) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zbc) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0} while (0)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#define REQUIRE_ZBS(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 if (ctx-&gt;cfg_ptr-&gt;ext_zbs) {=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_zbs) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0} while (0)<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000005e5d805d9243240--

