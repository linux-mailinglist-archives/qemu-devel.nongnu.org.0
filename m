Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B23469D9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:31:01 +0100 (CET)
Received: from localhost ([::1]:59186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOng4-0001Ul-77
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lOneS-0000TZ-Nh
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:29:20 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lOneR-0005p4-2H
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:29:20 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 7so15821531qka.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L+Xsht7BBaqh4YBgYLfk/bIkPnvrCJTI9iG72x7NomA=;
 b=Z8mju41ucfL8Xg0l24Zge0d/93w9Usqji0NHK9TRzdk0N9j0Zao81TyDgzFYgXo+6U
 CvizRrYqLXHKcSyrAKzLLhG5L+zfdUY7e3oDxPTCxhYyopA1cLRNjytTaw4fA3k/h8RV
 pXHScKE/yJtaM5p+v/Uh2UPDJuxp6HqKOT7eEdnlZdldcgSyK3M+mY4gOHW08cx2gjn3
 pLp6+1MMgWVK/2tjkQ76hOzK9gF5Un3na3cXL1cj4mx7OJ7cGQOZoTmsFPsu+8/cO47U
 7JKt4p+wM5/6HHwQKz+uBfPQReC+zz4XelH2mfIE/jtpM6pnouui0hg1fc2NurLwvajl
 K99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L+Xsht7BBaqh4YBgYLfk/bIkPnvrCJTI9iG72x7NomA=;
 b=pqnXEJRvR+cmZhT4LU703+qIDt2mis5sHVPZlvHdnCOvR3BMWsHleSlhZdrR0itGB0
 0i2Yvqa9WHlVsWvlZEdMaFRO5gex4mX1zBdk8WXeYmm/nzdZMmPnacWJk1EzzYXnHcPd
 sJPDG5O0dIlO/rWpbj2u0xtiPJzKQhBNvU7OJVRNiP/KM4yOeyOmxDNJtuIR4Bq03Tqv
 nFWtYyZPi9Dtjt+URm28nm2duj9E5XWMiY9jCZ1kNXd8QIGqfUy9ZnM8SVZ3ezttMJOK
 3daDC88DrrVhdQxvU2tNr1UTf70n7wMt/NoDV3eUme7iMM+rzxuJBKvuJ3nqu/yTitUk
 WOKg==
X-Gm-Message-State: AOAM531mM955niLAw+bM+hJqHrHw1e/MP9Q15CrFMsBjhEBZrt7T3Umv
 Owjou1jcKlawedHsUGHdWDr+/EGUC+RI2yVVfTI=
X-Google-Smtp-Source: ABdhPJy3o3BFFvb6fwHL4z8lLuwfnv+C7lV+SlFkTAMoLKd6PBmaK8OcJJR3A634Qt/aNsQ5PPi0iV/+965cib5xlrk=
X-Received: by 2002:a37:9b82:: with SMTP id d124mr7217095qke.489.1616531358185; 
 Tue, 23 Mar 2021 13:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210320220949.40965-1-mrolnik@gmail.com>
 <20210320220949.40965-2-mrolnik@gmail.com>
 <YFnjLbU9+itpbvsf@work-vm>
 <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
In-Reply-To: <CAK4993iuteYNiM3acyGPNb5guwkfr3fKxJDecqcwKRdFTgG0sw@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Tue, 23 Mar 2021 22:28:42 +0200
Message-ID: <CAK4993gND7R1RBfimMdJXpJDvFdZiULdE2WKPKH+UnNaFm0iww@mail.gmail.com>
Subject: Re: [PATCH 1/1] Set TARGET_PAGE_BITS to be 10 instead of 8 bits
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005f7b7e05be3a094a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x72c.google.com
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

--0000000000005f7b7e05be3a094a
Content-Type: text/plain; charset="UTF-8"

If I set TARGET_PAGE_BITS to 12 this *assert assert(v_l2_levels >= 0);*
will fail (page_table_config_init function) because
TARGET_PHYS_ADDR_SPACE_BITS is 24 bits, because AVR has 24 is the longest
pointer AVR has. I can set TARGET_PHYS_ADDR_SPACE_BITS to 32 and
TARGET_PAGE_BITS to 12 and everything will work fine.
What do you think?

btw, wrote the original comment, you David referred to, when I did not know
that QEMU could map several regions to the same page, which is not true.
That's why I could change 8 to 10.

On Tue, Mar 23, 2021 at 10:11 PM Michael Rolnik <mrolnik@gmail.com> wrote:

> how long?
>
> On Tue, Mar 23, 2021 at 2:46 PM Dr. David Alan Gilbert <
> dgilbert@redhat.com> wrote:
>
>> * Michael Rolnik (mrolnik@gmail.com) wrote:
>> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> > ---
>> >  target/avr/cpu-param.h | 8 +-------
>> >  target/avr/helper.c    | 2 --
>> >  2 files changed, 1 insertion(+), 9 deletions(-)
>> >
>> > diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
>> > index 7ef4e7c679..9765a9d0db 100644
>> > --- a/target/avr/cpu-param.h
>> > +++ b/target/avr/cpu-param.h
>> > @@ -22,13 +22,7 @@
>> >  #define AVR_CPU_PARAM_H
>> >
>> >  #define TARGET_LONG_BITS 32
>> > -/*
>> > - * TARGET_PAGE_BITS cannot be more than 8 bits because
>> > - * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and
>> they
>> > - *     should be implemented as a device and not memory
>> > - * 2.  SRAM starts at the address 0x0100
>>
>> I don't know AVR; but that seems to say why you can't make it any larger
>> - how do you solve that?
>>
>> Dave
>>
>> > -#define TARGET_PAGE_BITS 8
>> > +#define TARGET_PAGE_BITS 10
>> >  #define TARGET_PHYS_ADDR_SPACE_BITS 24
>> >  #define TARGET_VIRT_ADDR_SPACE_BITS 24
>> >  #define NB_MMU_MODES 2
>> > diff --git a/target/avr/helper.c b/target/avr/helper.c
>> > index 35e1019594..da658afed3 100644
>> > --- a/target/avr/helper.c
>> > +++ b/target/avr/helper.c
>> > @@ -111,8 +111,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address,
>> int size,
>> >      MemTxAttrs attrs = {};
>> >      uint32_t paddr;
>> >
>> > -    address &= TARGET_PAGE_MASK;
>> > -
>> >      if (mmu_idx == MMU_CODE_IDX) {
>> >          /* access to code in flash */
>> >          paddr = OFFSET_CODE + address;
>> > --
>> > 2.25.1
>> >
>> --
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>
>>
>
> --
> Best Regards,
> Michael Rolnik
>


-- 
Best Regards,
Michael Rolnik

--0000000000005f7b7e05be3a094a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">If I set <font face=3D"monospace">TARGET_=
PAGE_BITS</font> to 12 this=C2=A0<font face=3D"monospace"><b>assert=C2=A0as=
sert(v_l2_levels &gt;=3D 0);</b></font> will fail (page_table_config_init f=
unction) because=C2=A0<font face=3D"monospace">TARGET_PHYS_ADDR_SPACE_BITS<=
/font> is 24 bits, because AVR has 24 is the longest pointer AVR has. I can=
 set <font face=3D"monospace">TARGET_PHYS_ADDR_SPACE_BITS</font> to 32 and=
=C2=A0<font face=3D"monospace">TARGET_PAGE_BITS</font> to 12 and everything=
 will work fine.=C2=A0</div><div>What do=C2=A0you think?</div><div><br></di=
v><div>btw, wrote the original comment, you David referred=C2=A0to, when I =
did not know that QEMU could map several regions to the same page, which is=
 not true. That&#39;s why I could change 8 to 10.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021=
 at 10:11 PM Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com">mrolni=
k@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">how long?=C2=A0</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 2:46 PM =
Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com" target=3D=
"_blank">dgilbert@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">* Michael Rolnik (<a href=3D"mailto:mrolnik@gma=
il.com" target=3D"_blank">mrolnik@gmail.com</a>) wrote:<br>
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
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--0000000000005f7b7e05be3a094a--

