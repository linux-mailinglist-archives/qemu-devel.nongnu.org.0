Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2C575D8A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:38:31 +0200 (CEST)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGqE-0007gW-PN
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGn6-0004qK-D2; Fri, 15 Jul 2022 04:35:16 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGmz-00035z-0r; Fri, 15 Jul 2022 04:35:16 -0400
Received: by mail-lf1-x132.google.com with SMTP id e28so6724545lfj.4;
 Fri, 15 Jul 2022 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j/6vGhmmjwnJ1SiDIgYj2pB33bfsE8e35ejVWndkCXc=;
 b=TH4yLuLfR7eT1EgMhNVjCLm02hOHpYQSBr7nH+JQXZLk5A1Ij50TzDZcLUlScxulQd
 Axr2sfyvLTRjrZTffGP9g2wa2gWMj0uh3M8GnqKfYIb++lNvw1cYSCeuf/iip7ouxUd3
 o6GECi9vzmtQK0hJzMHvyslFC7u/9vfwVxNJ2WMj4W4TnKn4L3r8CzhFLovnZOn+6g/U
 3mt435pEU6SM8VHmr0Pugl38BtbbLyDks2zKlEPIwGhO0dPmcf6jNLfabyAU6maNA+0V
 nbd4qkBc7L3yTIn9yXaHYgCOEmZuWSo2hIsabRRDMZOfh9dDJmonPR1Hx7HtTcws+eHc
 6n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j/6vGhmmjwnJ1SiDIgYj2pB33bfsE8e35ejVWndkCXc=;
 b=PJ59qm3ifGb/3L5Y/BaRSggEGlT6kc4SWIhbEw8ahGS0rPKW8tK+aQusdcCjPj2rBu
 9ek42Yo4nGly3v/pe+/lw0mRmodQaxrCQo09GlP4zgPUD9akXC2aV7gLH71vXccxH7f5
 wsbmB3h1kuccamFJTui0ydipO4JM3Ptb/fA5ALItl3fcXuT39ZFr4YxIbfVLHVHIhnKa
 QVsVg4CQEDgoVnDPMMRkxYxxt8h+cj531K6wn0C6DZmuqB8zKn1uPXWCC9VrL91H32J8
 dz/JYP/a9QYjKtRzBgQryerKazC3VpggXAdJc9q4xmosRzAkiaPEOgWf3vx/+TrIIli1
 haMg==
X-Gm-Message-State: AJIora/0VpWfHy2+Z9cPEf47WCgg1h62Zv45Dxlz3ZAlSDZ1FmoCx/RJ
 oBKZujZ0yTUtMqtuipzIWG+9e0mSO0aBpD0vIeM=
X-Google-Smtp-Source: AGRyM1t3qYpuEzsdbYQy919pIJP4RiNlaQtlnAcMzG+FXWD3N67dzr+SR9TvBxyVS9oJqQu/dFiAuXPgCM/m8p6ANpU=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr6957022lfb.121.1657874106254; Fri, 15
 Jul 2022 01:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-2-frankja@linux.ibm.com>
 <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
 <fd62d8e8-a9f0-1e19-c8da-c8f31248983e@linux.ibm.com>
 <CAMxuvaxJ7e6A4n-UOiUKWwh9-9k-yP-rUR47PYER3RT=vzLBCg@mail.gmail.com>
 <77707836-f835-39e6-858c-297990ae9b0c@linux.ibm.com>
In-Reply-To: <77707836-f835-39e6-858c-297990ae9b0c@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Jul 2022 12:34:54 +0400
Message-ID: <CAJ+F1CJhX1frZAPmwpXbVns=PYWSja=USSv8TgH_9+TqS1Bi_g@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dump: Cleanup memblock usage
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002f8a5205e3d3e50b"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002f8a5205e3d3e50b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 14, 2022 at 1:46 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 7/13/22 17:35, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 13, 2022 at 7:30 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> On 7/13/22 17:09, Marc-Andr=C3=A9 Lureau wrote:
> >>> Hi
> >>>
> >>> On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>>>
> >>>> The iteration over the memblocks is hard to understand so it's about
> >>>> time to clean it up.
> >>>>
> >>>> struct DumpState's next_block and start members can and should be
> >>>> local variables within the iterator.
> >>>>
> >>>> Instead of manually grabbing the next memblock we can use
> >>>> QTAILQ_FOREACH to iterate over all memblocks.
> >>>>
> >>>> The begin and length fields in the DumpState have been left untouche=
d
> >>>> since the qmp arguments share their names.
> >>>>
> >>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >>>
> >>> After this patch:
> >>> ./qemu-system-x86_64 -monitor stdio -S
> >>> (qemu) dump-guest-memory foo
> >>> Error: dump: failed to save memory: Bad address
> >>
> >> If you have more ways to check for dump errors then please send them t=
o
> >> me. I'm aware that this might not have been a 100% conversion and I'm =
a
> >> bit terrified about the fact that this will affect all architectures.
> >
> > Same feeling here. Maybe it's about time to write real dump tests!
>
> We have tests for s390 and I've prompted for tests with filtering so we
> can also cover that. Unfortunately s390 differs in the use of memory
> because we only have one large block which hid this error from me.
>
>
> >>>
> >>>> +        if (block->target_start >=3D filter_area_start +
> filter_area_length ||
> >>>> +            block->target_end <=3D filter_area_start) {
> >>>> +            return -1;
> >>>> +        }
> >>>> +        if (filter_area_start > block->target_start) {
> >>>> +            return filter_area_start - block->target_start;
> >>>> +        }
> >>>> +    }
> >>>> +    return block->target_start;
> >>>
> >>> This used to be 0. Changing that, I think the patch looks good.
> >>> Although it could perhaps be splitted to introduce the two functions.
> >>
> >> Yes but the 0 was used to indicate that we would have needed continue
> >> iterating and the iteration is done via other means in this patch.
> >>
> >> Or am I missing something?
>
> Had a look, turns out I missed something.
>
> >
> > Well, you changed the way the loop used to work. it used to return 1/0
> > to indicate stop/continue and rely on s->start / s->next_block. Now
> > you return memblock_start.
>
> Maybe we should call this "dump_get_memblock_start_offset()" to make it
> clearer that we don't return block->target_start i.e. a start address
> but rather an offset that we tack on the host address to read the memory?
>
>
Not a big difference to me. You would need to adjust write_memory() "start"
argument name as well then.


> >
> >>
> >>>
> >>>> +}
> >>>>    #endif
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>>
> >>
> >
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002f8a5205e3d3e50b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 14, 2022 at 1:46 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 7/13/22 17:35, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Jul 13, 2022 at 7:30 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On 7/13/22 17:09, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt;&gt;&gt; Hi<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank &lt;<a href=3D"m=
ailto:frankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt=
; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The iteration over the memblocks is hard to understand so =
it&#39;s about<br>
&gt;&gt;&gt;&gt; time to clean it up.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; struct DumpState&#39;s next_block and start members can an=
d should be<br>
&gt;&gt;&gt;&gt; local variables within the iterator.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Instead of manually grabbing the next memblock we can use<=
br>
&gt;&gt;&gt;&gt; QTAILQ_FOREACH to iterate over all memblocks.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The begin and length fields in the DumpState have been lef=
t untouched<br>
&gt;&gt;&gt;&gt; since the qmp arguments share their names.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja=
@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; After this patch:<br>
&gt;&gt;&gt; ./qemu-system-x86_64 -monitor stdio -S<br>
&gt;&gt;&gt; (qemu) dump-guest-memory foo<br>
&gt;&gt;&gt; Error: dump: failed to save memory: Bad address<br>
&gt;&gt;<br>
&gt;&gt; If you have more ways to check for dump errors then please send th=
em to<br>
&gt;&gt; me. I&#39;m aware that this might not have been a 100% conversion =
and I&#39;m a<br>
&gt;&gt; bit terrified about the fact that this will affect all architectur=
es.<br>
&gt; <br>
&gt; Same feeling here. Maybe it&#39;s about time to write real dump tests!=
<br>
<br>
We have tests for s390 and I&#39;ve prompted for tests with filtering so we=
 <br>
can also cover that. Unfortunately s390 differs in the use of memory <br>
because we only have one large block which hid this error from me.<br>
<br>
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (block-&gt;target_start &g=
t;=3D filter_area_start + filter_area_length ||<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block-&gt;targe=
t_end &lt;=3D filter_area_start) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (filter_area_start &gt; bl=
ock-&gt;target_start) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return filter_a=
rea_start - block-&gt;target_start;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return block-&gt;target_start;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This used to be 0. Changing that, I think the patch looks good=
.<br>
&gt;&gt;&gt; Although it could perhaps be splitted to introduce the two fun=
ctions.<br>
&gt;&gt;<br>
&gt;&gt; Yes but the 0 was used to indicate that we would have needed conti=
nue<br>
&gt;&gt; iterating and the iteration is done via other means in this patch.=
<br>
&gt;&gt;<br>
&gt;&gt; Or am I missing something?<br>
<br>
Had a look, turns out I missed something.<br>
<br>
&gt; <br>
&gt; Well, you changed the way the loop used to work. it used to return 1/0=
<br>
&gt; to indicate stop/continue and rely on s-&gt;start / s-&gt;next_block. =
Now<br>
&gt; you return memblock_start.<br>
<br>
Maybe we should call this &quot;dump_get_memblock_start_offset()&quot; to m=
ake it <br>
clearer that we don&#39;t return block-&gt;target_start i.e. a start addres=
s <br>
but rather an offset that we tack on the host address to read the memory?<b=
r>
<br></blockquote><div><br></div><div>Not a big difference to me. You would =
need to adjust write_memory() &quot;start&quot; argument name as well then.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #endif<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.34.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002f8a5205e3d3e50b--

