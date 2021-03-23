Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C03469A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:13:50 +0100 (CET)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnPQ-0003aq-Np
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lOnNa-0002iD-9G
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:11:54 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lOnNY-0006dg-B3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:11:54 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id o19so11209400qvu.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjkvcLWZCg3NSzPI4Vyelki4aQ31hC8MYa7dnJ1IxZg=;
 b=EUmsir8PP3g0hkTwJZPXnYhvNXYeHba8r/MuxJNfG4lAm/rW0TnJlKTwr/MAJU16oS
 oNyQWhvR66j1GcaCXGJYgR89kLe2fP45NP5ZMwzp47wxCi4+q90V3vUFQbqJslUevIAg
 6IbwDlGVHpLcAi0N+pkOR/hf5KLZlUsg90zTSjOcP5KGoivm/ZAwshMMRLRKq7q/l7VE
 sd7CX6BAnLMTr/0zrNcWOvXMUEw4Xoj4uPmB6TLoFujBwasVP/ZdVQrPUcjEDRi4yEuu
 CXHLJ5/Er17DzQG2eYTnCKNospr/DWHZplRQSMcwCIEJaVgsQvbg99bfgYBRqi6DLO0B
 qQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjkvcLWZCg3NSzPI4Vyelki4aQ31hC8MYa7dnJ1IxZg=;
 b=heHMrN2/S+IvC4YJQg8p7mfISnK8b1gn74xHFx9dijQ1fPYyVryQ3aNXMNXJdU2zqu
 lNhYnQ9bYugpewSVqhA4EMiG/Dc/kWtP28fNRld98oaZXIH+WpVTzYVnlMG1xrFqMCgM
 OLf/cNnovmD2wvNqpoxHBhXOe+0EsBAhPqup1z7SXCD8fIw8rjC3GyBO+yLix4SyGf3O
 tbw2PHsXL/awbqKHZlZKNWQewwW/QfL4Yjbc5n+faS6FI7UjLUUaqclpJITIaJO9CAQu
 td4dp03fbdM+o62RpRDGp4G0cQqWiY4zsYQYki8ZfyLUJj0nrYcsHOErSWgTe8zE63l3
 Q8kA==
X-Gm-Message-State: AOAM531Bh4GGwrrG+OFIM0wS/OnbD8PRcuSClVDDpx9SaXlS6SPyycuo
 lfbNFTXHVrXfbE+kqQryCUBb1uiZeTZ2iosJUBQ=
X-Google-Smtp-Source: ABdhPJwDwIBFOP53tZyHCL4ZMLkWhhxbE5kEeVT+AHsfOEd+Tx2u/gdVW5NMYb/cu0RsByGw1GsGWQ0u665TeoJPzGE=
X-Received: by 2002:ad4:52c2:: with SMTP id p2mr6450109qvs.45.1616530310591;
 Tue, 23 Mar 2021 13:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
 <YFnjLbU9+itpbvsf@work-vm>
In-Reply-To: <YFnjLbU9+itpbvsf@work-vm>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Tue, 23 Mar 2021 22:11:14 +0200
Message-ID: <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ee787105be39ca19"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=mrolnik@gmail.com; helo=mail-qv1-xf2e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ee787105be39ca19
Content-Type: text/plain; charset="UTF-8"

how long?

On Tue, Mar 23, 2021 at 2:46 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Michael Rolnik (mrolnik@gmail.com) wrote:
> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> > ---
> >  target/avr/cpu-param.h | 8 +-------
> >  target/avr/helper.c    | 2 --
> >  2 files changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
> > index 7ef4e7c679..9765a9d0db 100644
> > --- a/target/avr/cpu-param.h
> > +++ b/target/avr/cpu-param.h
> > @@ -22,13 +22,7 @@
> >  #define AVR_CPU_PARAM_H
> >
> >  #define TARGET_LONG_BITS 32
> > -/*
> > - * TARGET_PAGE_BITS cannot be more than 8 bits because
> > - * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and
> they
> > - *     should be implemented as a device and not memory
> > - * 2.  SRAM starts at the address 0x0100
>
> I don't know AVR; but that seems to say why you can't make it any larger
> - how do you solve that?
>
> Dave
>
> > -#define TARGET_PAGE_BITS 8
> > +#define TARGET_PAGE_BITS 10
> >  #define TARGET_PHYS_ADDR_SPACE_BITS 24
> >  #define TARGET_VIRT_ADDR_SPACE_BITS 24
> >  #define NB_MMU_MODES 2
> > diff --git a/target/avr/helper.c b/target/avr/helper.c
> > index 35e1019594..da658afed3 100644
> > --- a/target/avr/helper.c
> > +++ b/target/avr/helper.c
> > @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
> >      MemTxAttrs attrs = {};
> >      uint32_t paddr;
> >
> > -    address &= TARGET_PAGE_MASK;
> > -
> >      if (mmu_idx == MMU_CODE_IDX) {
> >          /* access to code in flash */
> >          paddr = OFFSET_CODE + address;
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000ee787105be39ca19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">how long?=C2=A0</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 2:46 PM Dr. David A=
lan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">*=
 Michael Rolnik (<a href=3D"mailto:mrolnik@gmail.com" target=3D"_blank">mro=
lnik@gmail.com</a>) wrote:<br>
&gt; Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com"=
 target=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/avr/cpu-param.h | 8 +-------<br>
&gt;=C2=A0 target/avr/helper.c=C2=A0 =C2=A0 | 2 --<br>
&gt;=C2=A0 2 files changed, 1 insertion(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h<br>
&gt; index 7ef4e7c679..9765a9d0db 100644<br>
&gt; --- a/target/avr/cpu-param.h<br>
&gt; +++ b/target/avr/cpu-param.h<br>
&gt; @@ -22,13 +22,7 @@<br>
&gt;=C2=A0 #define AVR_CPU_PARAM_H<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TARGET_LONG_BITS 32<br>
&gt; -/*<br>
&gt; - * TARGET_PAGE_BITS cannot be more than 8 bits because<br>
&gt; - * 1.=C2=A0 all IO registers occupy [0x0000 .. 0x00ff] address range,=
 and they<br>
&gt; - *=C2=A0 =C2=A0 =C2=A0should be implemented as a device and not memor=
y<br>
&gt; - * 2.=C2=A0 SRAM starts at the address 0x0100<br>
<br>
I don&#39;t know AVR; but that seems to say why you can&#39;t make it any l=
arger<br>
- how do you solve that?<br>
<br>
Dave<br>
<br>
&gt; -#define TARGET_PAGE_BITS 8<br>
&gt; +#define TARGET_PAGE_BITS 10<br>
&gt;=C2=A0 #define TARGET_PHYS_ADDR_SPACE_BITS 24<br>
&gt;=C2=A0 #define TARGET_VIRT_ADDR_SPACE_BITS 24<br>
&gt;=C2=A0 #define NB_MMU_MODES 2<br>
&gt; diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
&gt; index 35e1019594..da658afed3 100644<br>
&gt; --- a/target/avr/helper.c<br>
&gt; +++ b/target/avr/helper.c<br>
&gt; @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address,=
 int size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemTxAttrs attrs =3D {};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t paddr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 address &amp;=3D TARGET_PAGE_MASK;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (mmu_idx =3D=3D MMU_CODE_IDX) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* access to code in flash */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 paddr =3D OFFSET_CODE + address;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000ee787105be39ca19--

