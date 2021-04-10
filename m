Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6D35AF37
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 19:26:58 +0200 (CEST)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVHNo-0004dz-Rb
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 13:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lVHMY-00048G-V0
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 13:25:38 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lVHMW-0002QZ-5D
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 13:25:38 -0400
Received: by mail-qt1-x830.google.com with SMTP id y2so6704071qtw.13
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhWdJcUvYArl4ufemnrHLSWp2ykYKM3EriEj7kdojIs=;
 b=b6j5JrJIOUyDq5Sr40A5cdisYzoHJw0nUaxa1RYPok1SO4v1REq7UlGD6MFG4h/Tka
 Yi4djvW8Vwl2yGRF+a5ornT2TZBhqNXgPXUJbM8+3X8B7OtLlUL0AAXKholmFZdfN/rP
 2OU7+zTvXxlQEJl741qvPW1jUKBF0KbXiu45E4cgx/lqpqRKBYWUXThRjV1H3tpwnL8O
 INW4oPakDFZ9IHZZla5Px4Z4kpVBRS0VSOaxYECijeBpzi+6acJMJf0B7cDEIoqOD3k/
 RD+Md0y4hA81AR57pd6CGYYX0++xnJfwKOH6J2Cb8rmk20CNQiKITZaNk8NRKT50yZi5
 klZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhWdJcUvYArl4ufemnrHLSWp2ykYKM3EriEj7kdojIs=;
 b=WhR6297UddtTABqVPCn7Hl1WSxZLVkrChQZksgt0flSziSOhcCiBAZ+T+rhmFoAFBe
 TCOTz/Ni6sCZGtMcr4yKJHQWP+BOurmbLMC82jj/J9iYQ5fvQtOTjJSaYKfshyHdgP5I
 W1aIkXX8yPwcEM8d8iBO7rKl9Zh/gFYdH0Tdo0t3IC6F0Y/yTCgmuJMh6zvq8Yfr1nh4
 NgrP1FXwj/4WSuIMxZqGUouX8EM0bdp8TZB17skXcA5hAIzYSVDC4L7JDF4iLlPgr0b3
 uS3ZhvkrE3GaLWv/naCJMOQnTYHiCAmv9PwjBKBldlAAPbuetuxz5g4BD6UJLM8D6vI8
 h9ig==
X-Gm-Message-State: AOAM533EA5TxGkSPQKYzW0i3TxthK6i/ta6ISQZa1bqwLWPEz0/duVfA
 lgWAVJ2EcB6A7oIn4XpLthVMvIUMo7b+df3237c=
X-Google-Smtp-Source: ABdhPJyVsBKSXr0X56t8Bd1kBDBcJn7/r9V4BPBBYblVVQ7Tlba0Y/Igeuqmhp6CDZYrhhuwDYGHLQE1pnvXn9NfNMQ=
X-Received: by 2002:ac8:7a63:: with SMTP id w3mr11862130qtt.371.1618075534199; 
 Sat, 10 Apr 2021 10:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
 <YFnjLbU9+itpbvsf@work-vm>
 <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
 <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
In-Reply-To: <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 10 Apr 2021 20:24:56 +0300
Message-ID: <CAK4993iPwu2ESggMx05C0USrnSigHJq=-iP=BU-FhDXDcRH5gw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006f900805bfa19133"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x830.google.com
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

--0000000000006f900805bfa19133
Content-Type: text/plain; charset="UTF-8"

Please review.

On Tue, Mar 23, 2021 at 10:28 PM Michael Rolnik <mrolnik@gmail.com> wrote:

> If I set TARGET_PAGE_BITS to 12 this *assert assert(v_l2_levels >= 0);*
> will fail (page_table_config_init function) because
> TARGET_PHYS_ADDR_SPACE_BITS is 24 bits, because AVR has 24 is the longest
> pointer AVR has. I can set TARGET_PHYS_ADDR_SPACE_BITS to 32 and
> TARGET_PAGE_BITS to 12 and everything will work fine.
> What do you think?
>
> btw, wrote the original comment, you David referred to, when I did not
> know that QEMU could map several regions to the same page, which is not
> true. That's why I could change 8 to 10.
>
> On Tue, Mar 23, 2021 at 10:11 PM Michael Rolnik <mrolnik@gmail.com> wrote:
>
>> how long?
>>
>> On Tue, Mar 23, 2021 at 2:46 PM Dr. David Alan Gilbert <
>> dgilbert@redhat.com> wrote:
>>
>>> * Michael Rolnik (mrolnik@gmail.com) wrote:
>>> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>>> > ---
>>> >  target/avr/cpu-param.h | 8 +-------
>>> >  target/avr/helper.c    | 2 --
>>> >  2 files changed, 1 insertion(+), 9 deletions(-)
>>> >
>>> > diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
>>> > index 7ef4e7c679..9765a9d0db 100644
>>> > --- a/target/avr/cpu-param.h
>>> > +++ b/target/avr/cpu-param.h
>>> > @@ -22,13 +22,7 @@
>>> >  #define AVR_CPU_PARAM_H
>>> >
>>> >  #define TARGET_LONG_BITS 32
>>> > -/*
>>> > - * TARGET_PAGE_BITS cannot be more than 8 bits because
>>> > - * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and
>>> they
>>> > - *     should be implemented as a device and not memory
>>> > - * 2.  SRAM starts at the address 0x0100
>>>
>>> I don't know AVR; but that seems to say why you can't make it any larger
>>> - how do you solve that?
>>>
>>> Dave
>>>
>>> > -#define TARGET_PAGE_BITS 8
>>> > +#define TARGET_PAGE_BITS 10
>>> >  #define TARGET_PHYS_ADDR_SPACE_BITS 24
>>> >  #define TARGET_VIRT_ADDR_SPACE_BITS 24
>>> >  #define NB_MMU_MODES 2
>>> > diff --git a/target/avr/helper.c b/target/avr/helper.c
>>> > index 35e1019594..da658afed3 100644
>>> > --- a/target/avr/helper.c
>>> > +++ b/target/avr/helper.c
>>> > @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address,
>>> int size,
>>> >      MemTxAttrs attrs = {};
>>> >      uint32_t paddr;
>>> >
>>> > -    address &= TARGET_PAGE_MASK;
>>> > -
>>> >      if (mmu_idx == MMU_CODE_IDX) {
>>> >          /* access to code in flash */
>>> >          paddr = OFFSET_CODE + address;
>>> > --
>>> > 2.25.1
>>> >
>>> --
>>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>>
>>>
>>
>> --
>> Best Regards,
>> Michael Rolnik
>>
>
>
> --
> Best Regards,
> Michael Rolnik
>


-- 
Best Regards,
Michael Rolnik

--0000000000006f900805bfa19133
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please review.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 10:28 PM Michael Rol=
nik &lt;<a href=3D"mailto:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr">If I set <font face=3D"monospace">TARGET_PAGE_BITS</fo=
nt> to 12 this=C2=A0<font face=3D"monospace"><b>assert=C2=A0assert(v_l2_lev=
els &gt;=3D 0);</b></font> will fail (page_table_config_init function) beca=
use=C2=A0<font face=3D"monospace">TARGET_PHYS_ADDR_SPACE_BITS</font> is 24 =
bits, because AVR has 24 is the longest pointer AVR has. I can set <font fa=
ce=3D"monospace">TARGET_PHYS_ADDR_SPACE_BITS</font> to 32 and=C2=A0<font fa=
ce=3D"monospace">TARGET_PAGE_BITS</font> to 12 and everything will work fin=
e.=C2=A0</div><div>What do=C2=A0you think?</div><div><br></div><div>btw, wr=
ote the original comment, you David referred=C2=A0to, when I did not know t=
hat QEMU could map several regions to the same page, which is not true. Tha=
t&#39;s why I could change 8 to 10.</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 10:11 PM M=
ichael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=3D"_blank">mr=
olnik@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr">how long?=C2=A0</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 2:46=
 PM Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com" targe=
t=3D"_blank">dgilbert@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">* Michael Rolnik (<a href=3D"mailto:mrolni=
k@gmail.com" target=3D"_blank">mrolnik@gmail.com</a>) wrote:<br>
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
>Best Regards,<br>Michael Rolnik</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000006f900805bfa19133--

