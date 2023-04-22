Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BB6EBAFC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 21:23:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqIpe-0005d0-MY; Sat, 22 Apr 2023 15:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pqIpd-0005cp-2B
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 15:23:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pqIpb-0003pr-1J
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 15:23:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-24704a7bf34so2813273a91.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682191413; x=1684783413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SHY91bCFXOuj8PSjcuYByjSjR8nBqWEah6qQt6r+Tmk=;
 b=eOPl57UfVUW1yoD+Wodlt8cY3/zydEkidYiNJtJIYE5Me+zXPm+NTbCtZcDHWKTL0o
 ymFJy1N764OkIGOMrKu0zVtNDSvL+TyXKGTNgsGfp9FP+UZ4pI0PW0P6fqkVGDCB3zEm
 kBTnI+lk9jvp8M7A/xMD9zZmNtFGnQPQ7No/L7zP3TYKY2bT/+XuV7aACzLrKRu77vfQ
 430OeeXqaFE4tPTWjBnRDNBM551M7Xw34ZALfEtSTInRTDUdKYgZx+4A1l6Q2mNGp5/e
 KN8eN3NTf8sHTmmOOw+bHhz9F/Eh1yIBn7zjxshpwfwBD0jWSpeJeLiPdTovsry366nu
 Z5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682191413; x=1684783413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHY91bCFXOuj8PSjcuYByjSjR8nBqWEah6qQt6r+Tmk=;
 b=PChEfJcPItPFDvD9MjOKwmemxaG/AZq5g8P3Wb6D6FgXHKil+WuT0skChzyDJxOG0u
 LyDNdnYXNkRugIwF9kE3B9/snhyMi03RGX/rU842U5q1jKb/cdVfqPEb8MKJckW/8b/6
 bxT/k9Osyat1LAtfGOiGdOexI53Hry1bAbmc8m1CMHcWuh9tVfLh6NJPD2WENEtsy2Oo
 0NBNJYc/Y3QutlWATFXDmOgq14/f5G2Zzqa0e028FFE9EJkasawY/1jMk8mogIkylx0o
 2RREjBp2cAqEv6ykzMJV5DCXu20hsXJnJsxQ5PzLzci8DITp07Gc517/Egu39K+0tVxR
 C8aQ==
X-Gm-Message-State: AAQBX9e3m6crbQpr/bAxAw2cH6L53/UJIoQWTMLSgao+QAi6foh7TJgW
 9waVelc+N/Xtz+v7z/rfKyinuW5NUQhy4ez3Xlg=
X-Google-Smtp-Source: AKy350bGlEDw87sejs88wViKAQLp6EoLKWhMfliczxu/Tyz+wwdULWC446+cmV7HzgrzURe553CzHj1vU7yqET+8+uk=
X-Received: by 2002:a17:90b:38c4:b0:249:64d2:4122 with SMTP id
 nn4-20020a17090b38c400b0024964d24122mr9071133pjb.21.1682191412685; Sat, 22
 Apr 2023 12:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com>
 <ZEI4jQvHfU+JGFH9@redhat.com>
 <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
 <87sfct9mm6.fsf@linaro.org>
 <CAHNti2d5JH9EupsOLs0e2o-2ifeEumR5XUqPkbG1u2x6QtOCqg@mail.gmail.com>
 <CANCZdfr=32YFV0mHJxJn0F3aNUQT5YccQdRYdtq1au6BFF8WHw@mail.gmail.com>
In-Reply-To: <CANCZdfr=32YFV0mHJxJn0F3aNUQT5YccQdRYdtq1au6BFF8WHw@mail.gmail.com>
From: Karim Taha <kariem.taha2.7@gmail.com>
Date: Sat, 22 Apr 2023 21:23:02 +0200
Message-ID: <CAHNti2d1ZEsop_YDJ40ymwayieK2vbkA5rPnX3VT_8a=6igksg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000098f0cf05f9f1b5fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000098f0cf05f9f1b5fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made a fork on gitlab and pushed a branch at
https://gitlab.com/Kariiem/qemu/-/tree/gsoc23-task3/ .

On Sat, Apr 22, 2023 at 1:18=E2=80=AFAM Warner Losh <imp@bsdimp.com> wrote:

> Usually this means pushing a branch off of mastar to a service like githu=
b
> or gitlab, and then
> posting a URL with where to get it.
>
> Warner
>
> On Fri, Apr 21, 2023 at 4:40=E2=80=AFPM Karim Taha <kariem.taha2.7@gmail.=
com>
> wrote:
>
>> It was sent with git-publish, what do you mean by pointing to a branch?
>>
>> On Fri, Apr 21, 2023 at 7:22=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org>
>> wrote:
>>
>>>
>>> Karim Taha <kariem.taha2.7@gmail.com> writes:
>>>
>>> > On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 <
>>> berrange@redhat.com> wrote:
>>> >
>>> >  On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
>>> >  > From: Warner Losh <imp@bsdimp.com>
>>> >  >
>>> >  > Allow guest_base to be initialized on 64-bit hosts, the initial
>>> value is used by g2h_untagged function
>>> >  defined in include/exec/cpu_ldst.h
>>> >
>>> >  This commit message is all incorrectly structured I'm afraid.
>>> >
>>> >  There needs to a short 1 line summary, then a blank line,
>>> >  then the full commit description text, then a blank line,
>>> >  then the Signed-off-by tag(s).
>>> >
>>> >  Also if you're sending work done by Warner (as the From
>>> >  tag suggests), then we would expect to see Warner's own
>>> >  Signed-off-by tag, in addition to your own Signed-off-by.
>>> <snip>
>>> >
>>> > Alright, thanks for the commit formatting tips, I resent the patch
>>> series, with my signed off by tag and the
>>> > author signed off by tags as well.
>>>
>>> Hmm something has gone wrong. Was this sent with a plain git-send-email
>>> or using a tool like git-publish?
>>>
>>> Can you point to a branch?
>>>
>>> >
>>> > Best regards,
>>> > Karim
>>>
>>>
>>> --
>>> Alex Benn=C3=A9e
>>> Virtualisation Tech Lead @ Linaro
>>>
>>

--00000000000098f0cf05f9f1b5fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I made a fork on gitlab and pushed a branch at=C2=A0<a hre=
f=3D"https://gitlab.com/Kariiem/qemu/-/tree/gsoc23-task3/">https://gitlab.c=
om/Kariiem/qemu/-/tree/gsoc23-task3/</a>=C2=A0.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 22, 2023 at 1:18=
=E2=80=AFAM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr"><div>Usually this means pushing a branch=
 off of mastar to a service like github or gitlab, and then</div><div>posti=
ng a URL with where to get it.<br></div><div><br></div><div>Warner<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Apr 21, 2023 at 4:40=E2=80=AFPM Karim Taha &lt;<a href=3D"mailto:k=
ariem.taha2.7@gmail.com" target=3D"_blank">kariem.taha2.7@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">It was sent with git-publish, what do you mean by pointing to a br=
anch?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Apr 21, 2023 at 7:22=E2=80=AFPM Alex Benn=C3=A9e &lt;<a hr=
ef=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com" target=3D"_blank=
">kariem.taha2.7@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:<br>
&gt;=C2=A0 &gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;=C2=A0 &gt; <br>
&gt;=C2=A0 &gt; Allow guest_base to be initialized on 64-bit hosts, the ini=
tial value is used by g2h_untagged function<br>
&gt;=C2=A0 defined in include/exec/cpu_ldst.h<br>
&gt;<br>
&gt;=C2=A0 This commit message is all incorrectly structured I&#39;m afraid=
.<br>
&gt;<br>
&gt;=C2=A0 There needs to a short 1 line summary, then a blank line,<br>
&gt;=C2=A0 then the full commit description text, then a blank line,<br>
&gt;=C2=A0 then the Signed-off-by tag(s).<br>
&gt;<br>
&gt;=C2=A0 Also if you&#39;re sending work done by Warner (as the From<br>
&gt;=C2=A0 tag suggests), then we would expect to see Warner&#39;s own<br>
&gt;=C2=A0 Signed-off-by tag, in addition to your own Signed-off-by.<br>
&lt;snip&gt;<br>
&gt;<br>
&gt; Alright, thanks for the commit formatting tips, I resent the patch ser=
ies, with my signed off by tag and the<br>
&gt; author signed off by tags as well.<br>
<br>
Hmm something has gone wrong. Was this sent with a plain git-send-email<br>
or using a tool like git-publish?<br>
<br>
Can you point to a branch?<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Karim<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--00000000000098f0cf05f9f1b5fb--

