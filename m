Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315873E1509
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:48:51 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcnq-0007vQ-9M
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1mBcmI-0006nX-K3
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:47:14 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1mBcmG-0000jh-N6
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:47:14 -0400
Received: by mail-il1-x12a.google.com with SMTP id z3so4920118ile.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1I9vSVQhYS+zrijz1o0IiO59wAliHD2Ee52MLMVuJ0=;
 b=NQWVTjryV9XAZeg/DXSxRxO7t+4LoI1pbwrwCMYr9t+03qjBH6IbJZwf+/tSxqfgGa
 Af6Wai1aqOA/6yu3ALQRMKCE+03OX+4lIop3sSJ4E6tQJBqEhsEpYc/K0XP8Q8iefvjz
 hvDnrFKNjUvgbpTiykJZodE57wUBLG6yq687RbVuwPRhFuguzRGsegcItFla9FEN9516
 LT8wafqO/92vCKhb8xbDk3t8An6shSMLv9HoavMFn/+cvtVnRNANmNVa8oYYS6dL5sWk
 ljv1GFrBKqagONCpefDCBLgGk+K3lZj4Wtkulgie/SIwRLRIBX+sYjZD9sonAuX/Isa+
 W/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1I9vSVQhYS+zrijz1o0IiO59wAliHD2Ee52MLMVuJ0=;
 b=IB68phmoRPuAyKJA/L2StEeF52IuDs/WdWWnZ7EnJQZ0Ne/tqNxV1cBraB4JUlHIPm
 b1nK/zPlwZjGkte2Ucrd9oS4T8dPDNoQBTYz2KXswp+ga/EvD0Yhpm8pVRYKlxHIR5j/
 Ju0S2HP37GYHI94bJJ5ydrjIoy6NwYIo1nONI0UobffG9xqmlxB5OBkLdYjad/i/GltK
 F7isssyOcUx3ItHk2NFwC36nFlY4QvCEP+zbayYQRpRn4p2RZBZF8UJY/JyLzSmKJejG
 6TxwtSxiaox8ejZomhRcUks77XBAQl5eaxdMSuCZO91OYLyly8rHYkG3VlaBdgXEe4S1
 0SVA==
X-Gm-Message-State: AOAM530xSohzrRRzf2u23xe/x6v7qOmfAihZh8OI0jtfGpG1Bncw5RkV
 FAhxBK0hFDwF1Az8NtEFGELm9HBV3j2lEaQXvSk=
X-Google-Smtp-Source: ABdhPJyvg5qXXhPhKnnJQumFMCTIq2eYJjO17o5lCjYlOGcNE91M9Y5hL8LBZi1do7nDT5M/P46eelNOo/LN/BnfZl0=
X-Received: by 2002:a05:6e02:ccf:: with SMTP id
 c15mr285704ilj.238.1628167631480; 
 Thu, 05 Aug 2021 05:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADV2EAvr0Sb55TE=uffkb4Z17ZHNBCZGLm0nA94qKZrx1WM35A@mail.gmail.com>
 <0d982751-7dfe-9a45-df5b-fbe57d36ccef@redhat.com>
 <380cef7a-fe5c-9252-e791-400c44486c2c@redhat.com>
In-Reply-To: <380cef7a-fe5c-9252-e791-400c44486c2c@redhat.com>
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Thu, 5 Aug 2021 14:47:00 +0200
Message-ID: <CADV2EAufHABf-wM=qvc=Eg1teW8gQ4SfSb6c2g2Lw6v7ieP5PQ@mail.gmail.com>
Subject: Re: [Bug] x86 EFLAGS refresh is not happening correctly
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004f2cd005c8cf51df"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=stevie.lavern@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004f2cd005c8cf51df
Content-Type: text/plain; charset="UTF-8"

Thank for your reply!

It's still a bit cryptic for me.
I think i need to precise that I'm using a x86_64 custom user-mode,base on
linux user-mode, that i'm developing (unfortunately i cannot share the
code) with modifications in the translation loop (I've added cpu loop exits
on specific instructions which are not control flow instructions).
If my understanding is correct, in the user-mode case 'cpu_compute_eflags'
is called directly by 'x86_cpu_exec_exit' with the intention of
synchronizing the CPU env->eflags field with its real value (represented by
the CC_* fields).
I'm not sure how 'cpu_pre_save' and 'cpu_post_load' are involved in this
case.
 As you said in your first email, 'helper_read_eflags' seems to be the
correct way to go.

Here is some detail about my current experimentation/understanding of this
"issue":
With the current implementation
         eflags |= cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
if I exit the loop with a CC_OP different from CC_OP_EFLAGS, I found that
the resulting env->eflags may be invalid.
In my test case, the loop was exiting with eflags = 0x44 and CC_OP =
CC_OP_SUBL with CC_DST=1, CC_SRC=258, CC_SRC2=0.
While 'cpu_cc_compute_all' computes the correct flags (ZF:0, PF:0), the
result will still be 0x44 (ZF:1, PF:1) due to the 'or' operation, thus
leading to an incorrect eflags value loaded into the CPU env.
In my case, after loop reentry, it led to an invalid branch to be taken.


Thanks for your time!
Regards
Stevie


On Thu, Aug 5, 2021 at 1:33 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 05/08/21 13:24, Paolo Bonzini wrote:
> > On 05/08/21 11:51, Stevie Lavern wrote:
> >>
> >> Shouldn't it be:
> >> eflags = cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
> >> as eflags is entirely reevaluated by "cpu_cc_compute_all" ?
> >
> > No, both are wrong.  env->eflags contains flags other than the
> > arithmetic flags (OF/SF/ZF/AF/PF/CF) and those have to be preserved.
> >
> > The right code is in helper_read_eflags.  You can move it into
> > cpu_compute_eflags, and make helper_read_eflags use it.
>
> Ah, actually the two are really the same, the TF/VM bits do not apply to
> cpu_compute_eflags so it's correct.
>
> What seems wrong is migration of the EFLAGS register.  There should be
> code in cpu_pre_save and cpu_post_load to special-case it and setup
> CC_DST/CC_OP as done in cpu_load_eflags.
>
> Also, cpu_load_eflags should assert that update_mask does not include
> any of the arithmetic flags.
>
> Paolo
>

--0000000000004f2cd005c8cf51df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank for your reply!<div><br></div><div>=
It&#39;s still a bit cryptic for me.</div><div>I think i need to precise th=
at I&#39;m using a x86_64 custom user-mode,base on linux user-mode, that i&=
#39;m developing (unfortunately i cannot share the code) with modifications=
 in the translation loop (I&#39;ve added cpu loop exits on specific instruc=
tions which are not control flow instructions).</div><div>If my understandi=
ng is correct, in the user-mode case &#39;cpu_compute_eflags&#39; is called=
 directly by &#39;x86_cpu_exec_exit&#39; with the intention of synchronizin=
g the CPU env-&gt;eflags field with its real value (represented by the CC_*=
 fields).</div><div>I&#39;m not sure how &#39;cpu_pre_save&#39; and &#39;cp=
u_post_load&#39; are involved in this case.</div><div><span style=3D"color:=
rgb(80,0,80)">=C2=A0</span>As you said in your first email, &#39;helper_rea=
d_eflags&#39; seems to be the correct way to go.<br></div><div><br></div><d=
iv>Here is some detail about my current experimentation/understanding of th=
is &quot;issue&quot;:</div><div>With the current implementation=C2=A0</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span style=3D"color:rgb(80,0,80)">e=
flags |=3D cpu_cc_compute_all(env, CC_OP) | (env-&gt;df &amp; DF_MASK);</sp=
an></div><div>if I exit the loop with a CC_OP different from CC_OP_EFLAGS, =
I found that the resulting env-&gt;eflags may be invalid.</div><div>In my t=
est case, the loop was exiting with eflags =3D 0x44 and CC_OP =3D CC_OP_SUB=
L with CC_DST=3D1, CC_SRC=3D258, CC_SRC2=3D0.</div><div>While &#39;cpu_cc_c=
ompute_all&#39; computes the correct flags (ZF:0, PF:0), the result will st=
ill be 0x44 (ZF:1, PF:1) due to the &#39;or&#39; operation, thus leading to=
 an incorrect eflags value loaded into the CPU env.=C2=A0</div><div>In my c=
ase, after loop reentry, it led to an invalid branch to be taken.</div><div=
><br></div><div><br></div><div>Thanks for your time!</div><div>Regards</div=
><div>Stevie</div><div>=C2=A0</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 1:33 PM Paolo Bon=
zini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 05/08=
/21 13:24, Paolo Bonzini wrote:<br>
&gt; On 05/08/21 11:51, Stevie Lavern wrote:<br>
&gt;&gt;<br>
&gt;&gt; Shouldn&#39;t it be:<br>
&gt;&gt; eflags =3D cpu_cc_compute_all(env, CC_OP) | (env-&gt;df &amp; DF_M=
ASK);<br>
&gt;&gt; as eflags is entirely reevaluated by &quot;cpu_cc_compute_all&quot=
; ?<br>
&gt; <br>
&gt; No, both are wrong.=C2=A0 env-&gt;eflags contains flags other than the=
 <br>
&gt; arithmetic flags (OF/SF/ZF/AF/PF/CF) and those have to be preserved.<b=
r>
&gt; <br>
&gt; The right code is in helper_read_eflags.=C2=A0 You can move it into <b=
r>
&gt; cpu_compute_eflags, and make helper_read_eflags use it.<br>
<br>
Ah, actually the two are really the same, the TF/VM bits do not apply to <b=
r>
cpu_compute_eflags so it&#39;s correct.<br>
<br>
What seems wrong is migration of the EFLAGS register.=C2=A0 There should be=
 <br>
code in cpu_pre_save and cpu_post_load to special-case it and setup <br>
CC_DST/CC_OP as done in cpu_load_eflags.<br>
<br>
Also, cpu_load_eflags should assert that update_mask does not include <br>
any of the arithmetic flags.<br>
<br>
Paolo<br>
</blockquote></div></div>

--0000000000004f2cd005c8cf51df--

