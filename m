Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204A50BBDE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:42:54 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvQr-0007Ku-OI
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhvOi-0004v6-Tn
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:40:40 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nhvOh-0005kQ-7u
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:40:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id k4so106609plk.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ccgQFnfqRJneZq1t09fCfFjaH556PJxthxt44NnFudU=;
 b=f8a1J6neMWod4qYqRTEU7GE1dEpY+vvvZh5NL0DrNWOuPjsxXIZW0WNe0JFYGjlztv
 KElu5DrX1f1ZvYENNphZH3oqoAr78JDtKU0vG4we4tUKdBmhJdFs+rG5TmInWqiDhFd6
 dhzanHC+QQNMT9aXMUamCKbYSbjgtORSaI3HruhL0bHmCtkw89jdcE0xK2GPKW1js9wt
 FuD8L9hdowNldle3ZJnHV7GlA7CESCuhCndFH0BAxhYT7r49ZLTvhjBdgcKCBPR0ZJkQ
 CLu2z55ieWJNunC7fNlI6jbSjN6TB14wAHkxHlHCigK2g1OcF16mq+v42nlRhbBtaEgP
 mMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ccgQFnfqRJneZq1t09fCfFjaH556PJxthxt44NnFudU=;
 b=mQKSzCftgwxxV9JcoP3r/lskBIr5sZXXHjlnttZeSf8w8V3qyLEqUtXkAve6g8p0on
 9LeUAvzMm096GfHhtIqQyLWdXP/yknvkLyuCe1xGHrhHADyJ0FhVId/n3V+J6fh81gmx
 tqYVHPOMgJ4ULgrVwhwVQlHh+et+gFCLVPua9ZucdVj5TMsYMYj4N3My/DvpY97/3+0J
 q1ivK5f5yWT1YpbXqZqqZkKoMRlcGOJkKIz4hhnq3ZMBJVvOxsk5QaiJrCWIwmpOAWTy
 RCyxJmomACOVAZaRuw88qXJgywJ1O1lIuPiQ2vDmZUtA5WbtPhxXCJK3iSJ3erPwQ7+U
 qEQg==
X-Gm-Message-State: AOAM531en1ZHiSzfq/qIXfHw0INJOZHsQJ61m4SBnpPzOljV6F/LFF2S
 aHa09e/heur/0FzvnxRm0e6XT8PJgXZQ/O42yqc=
X-Google-Smtp-Source: ABdhPJzS0/5RCWkgb+wB3/cpcKHN3k4IUT7uca4gw+b7HTw0Rw5fFepuuZ9f4MhoVa6yMY5oikSZ5QMMQi80Zx2kE3Q=
X-Received: by 2002:a17:902:cf05:b0:156:8445:ce0f with SMTP id
 i5-20020a170902cf0500b001568445ce0fmr5063576plg.99.1650642037805; Fri, 22 Apr
 2022 08:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <YmLFSJwvToxgdlr7@stefanha-x1.localdomain>
In-Reply-To: <YmLFSJwvToxgdlr7@stefanha-x1.localdomain>
From: olc <faithilikerun@gmail.com>
Date: Fri, 22 Apr 2022 23:40:26 +0800
Message-ID: <CAAAx-8+wQGhpU_uNrSQqPAmgxYtPzZ5DrbnfheiUGVKP=w_zpQ@mail.gmail.com>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005096ec05dd400c78"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005096ec05dd400c78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,
I've tested the code and it behaves as you expected. Should I add this to a
new patch version or leave it as is?

Sam

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8822=E6=
=97=A5=E5=91=A8=E4=BA=94 23:10=E5=86=99=E9=81=93=EF=BC=9A

> On Fri, Apr 22, 2022 at 12:36:49AM +0800, Sam Li wrote:
> > Linux recently added a new io_uring(7) optimization API that QEMU
> > doesn't take advantage of yet. The liburing library that QEMU uses
> > has added a corresponding new API calling io_uring_register_ring_fd().
> > When this API is called after creating the ring, the io_uring_submit()
> > library function passes a flag to the io_uring_enter(2) syscall
> > allowing it to skip the ring file descriptor fdget()/fdput()
> > operations. This saves some CPU cycles.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/io_uring.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/io_uring.c b/block/io_uring.c
> > index 782afdb433..5247fb79e2 100644
> > --- a/block/io_uring.c
> > +++ b/block/io_uring.c
> > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> >      }
> >
> >      ioq_init(&s->io_q);
> > -    return s;
> > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
>
> What happens when QEMU is built against an older version of liburing
> that lacks the io_uring_register_ring_fd() API?
>
> I guess there will be a compiler error because the function prototype is
> missing in <liburing.h>.
>
> This can be addressed by checking for the presence of the function in
> meson.build:
>
> +config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD',
> cc.has_function('io_uring_register_ring_fd', prefix: '#include
> <liburing.h>'))
>
> Then block/io_uring.c can call the function only when available:
>
> +#ifdef CONFIG_LIBURING_REGISTER_RING_FD
> +    io_uring_register_ring_fd(&s->ring);
> +#endif
>
> (I haven't tested this code but it should be close.)
>
> Stefan
>

--0000000000005096ec05dd400c78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Stefan,</div>I&#39;ve tested the code and it behav=
es as you expected. Should I add this to a new patch version or leave it as=
 is?<div><br></div><div>Sam</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Stefan Hajnoczi &lt;<a href=3D"mailto:stef=
anha@gmail.com">stefanha@gmail.com</a>&gt; =E4=BA=8E2022=E5=B9=B44=E6=9C=88=
22=E6=97=A5=E5=91=A8=E4=BA=94 23:10=E5=86=99=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Apr 22, 2022 at 12:3=
6:49AM +0800, Sam Li wrote:<br>
&gt; Linux recently added a new io_uring(7) optimization API that QEMU<br>
&gt; doesn&#39;t take advantage of yet. The liburing library that QEMU uses=
<br>
&gt; has added a corresponding new API calling io_uring_register_ring_fd().=
<br>
&gt; When this API is called after creating the ring, the io_uring_submit()=
<br>
&gt; library function passes a flag to the io_uring_enter(2) syscall<br>
&gt; allowing it to skip the ring file descriptor fdget()/fdput()<br>
&gt; operations. This saves some CPU cycles.<br>
&gt; <br>
&gt; Signed-off-by: Sam Li &lt;<a href=3D"mailto:faithilikerun@gmail.com" t=
arget=3D"_blank">faithilikerun@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/io_uring.c | 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/block/io_uring.c b/block/io_uring.c<br>
&gt; index 782afdb433..5247fb79e2 100644<br>
&gt; --- a/block/io_uring.c<br>
&gt; +++ b/block/io_uring.c<br>
&gt; @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ioq_init(&amp;s-&gt;io_q);<br>
&gt; -=C2=A0 =C2=A0 return s;<br>
&gt; +=C2=A0 =C2=A0 if (io_uring_register_ring_fd(&amp;s-&gt;ring) &lt; 0) =
{<br>
<br>
What happens when QEMU is built against an older version of liburing<br>
that lacks the io_uring_register_ring_fd() API?<br>
<br>
I guess there will be a compiler error because the function prototype is<br=
>
missing in &lt;liburing.h&gt;.<br>
<br>
This can be addressed by checking for the presence of the function in<br>
meson.build:<br>
<br>
+config_host_data.set(&#39;CONFIG_LIBURING_REGISTER_RING_FD&#39;, cc.has_fu=
nction(&#39;io_uring_register_ring_fd&#39;, prefix: &#39;#include &lt;libur=
ing.h&gt;&#39;))<br>
<br>
Then block/io_uring.c can call the function only when available:<br>
<br>
+#ifdef CONFIG_LIBURING_REGISTER_RING_FD<br>
+=C2=A0 =C2=A0 io_uring_register_ring_fd(&amp;s-&gt;ring);<br>
+#endif<br>
<br>
(I haven&#39;t tested this code but it should be close.)<br>
<br>
Stefan<br>
</blockquote></div>

--0000000000005096ec05dd400c78--

