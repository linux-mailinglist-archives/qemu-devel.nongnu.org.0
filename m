Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBBF40FB73
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:13:50 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFYj-0004iK-Ub
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRFWD-0001qi-8V
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:11:14 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRFWB-0006al-KL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:11:13 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id c28so9693682vsh.11
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NS2LObVbBU7tQfz/wsIK/NF+M2XjKz7v99zi8d4RAvE=;
 b=P4dl+v/DqYD5px2Ge23WsKRRZfdwi/fHqqb6/7Lla5Si5Ak3NrhPi9ElyEdtqB6frY
 0Te08nsHplxg2bqMkpN5BbGJxaM5niVFnjt8/kKumMxPF0TdsF1ycdV8SpOiaNcUfTqb
 eWcMFeU6doPQV0roTSL0X88yMK30I+3z2h57hlydNTy+p3Kzs3C2tsnxM39PzJ0H129l
 RfDKjaMDzCBRxtT9YhhwBftifDK+Z3iWdSimhLqqyF+7Ex8zOorj3IRBkvDkSKXdHn9E
 mdaAOD0KqhmvJVdyNXxtJMM41BBLyFeWTZdiQv+cfSK19Pmt2bqz5AqSrkiU1fIt6q63
 2nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NS2LObVbBU7tQfz/wsIK/NF+M2XjKz7v99zi8d4RAvE=;
 b=Hd+r8CwKnJfCnRQ0X4THOxY0hIgfrqjDW/SfJhpFgo51a7jXskoKLe8pCF9SUMtPB+
 4nax64D+KxFdfOmgMuVoc7hL6cbKXxCGodugDvQysZ6Di7xeMyojAocizbcjqugUzgAi
 S1akgmm7rH7RZ4e89yt1ibO37afOf69LxENaiGFnoP/IH9NL3bkVxGM1aPEpTOJwJ85q
 YH4OuJGjwYrwB144qD7AufemSphlRqinoSqD77qYHgW+xmHnEsutcvKAGEvMeOoTV6uS
 FP+0ZMUj32wlXCAQJ5ATBPu1GAtXbIh+cr5J8pVRq5S5uYT2Cvkwaf8YFMidqlDGrlj0
 GfOw==
X-Gm-Message-State: AOAM531W22G27fIQdU82muV+2In1pbdODVhTBdRyy29yXeB/Bc0DrmRI
 vFosgM+j8e9CNFWfLlp7kBS10MZcxzaY02BB3MwFLw==
X-Google-Smtp-Source: ABdhPJzn0geJd3DyoK35UR2OzrFoze+U5FyzqqD9K2/OZmUXm3ZUoaNOc99His8o3GMwN2RF5KFD9lQ5g8HID2zwc+g=
X-Received: by 2002:a05:6102:1161:: with SMTP id
 k1mr9056393vsg.6.1631891470092; 
 Fri, 17 Sep 2021 08:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210917025635.32011-1-imp@bsdimp.com>
 <20210917025635.32011-2-imp@bsdimp.com>
 <d9ca1949-7c57-e805-8f94-00e09ff9cb48@amsat.org>
In-Reply-To: <d9ca1949-7c57-e805-8f94-00e09ff9cb48@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 09:10:59 -0600
Message-ID: <CANCZdfoucPxa7B4sWzxyAtmv6G7o0bstQOnixetdV7nHPRYkbg@mail.gmail.com>
Subject: Re: [PATCH 1/9] bsd-user: Apply e6deac9cf99 from linux-user (zero
 anonymous memory)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000063391505cc3257b9"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 Riku Voipio <riku.voipio@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063391505cc3257b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 9:02 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/17/21 4:56 AM, Warner Losh wrote:
> > From: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> >
> > linux-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()
>
> Please use it as subject, "bsd-user/mmap: Always zero MAP_ANONYMOUS
> memory in mmap_frag()"
>
> Then describe:
>
> Similar to the equivalent linux-user commit e6deac9cf99, ...
>

OK. I have three commits like this, so I'll go ahead and edit all three.


> >
> > When mapping MAP_ANONYMOUS memory fragments, still need notice about to
> > set it zero, or it will cause issues.
> >
> > Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> > Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>
> ^ These tags were for another file, not this one, please
> remove them.
>

Gotcha. I wasn't completely sure what to do in this case since they
describe that the work is able to be contributed so I could make a case
either way.

I'll remove them.

Warner


> > [ bsd-user merge by Mika=C3=ABl Urankar, updated for untagged by Warner=
 Losh ]
> > Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/mmap.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> > index b40ab9045f..fc3c1480f5 100644
> > --- a/bsd-user/mmap.c
> > +++ b/bsd-user/mmap.c
> > @@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
> >          if (prot_new !=3D (prot1 | PROT_WRITE))
> >              mprotect(host_start, qemu_host_page_size, prot_new);
> >      } else {
> > -        /* just update the protection */
> >          if (prot_new !=3D prot1) {
> >              mprotect(host_start, qemu_host_page_size, prot_new);
> >          }
> > +        if (prot_new & PROT_WRITE) {
> > +            memset(g2h_untagged(start), 0, end - start);
> > +        }
> >      }
> >      return 0;
> >  }
> >
>
>

--00000000000063391505cc3257b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 9:02 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 9/17/21 4:56 AM, Warner Losh wrote:<br>
&gt; From: Mika=C3=ABl Urankar &lt;<a href=3D"mailto:mikael.urankar@gmail.c=
om" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; <br>
&gt; linux-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()<br>
<br>
Please use it as subject, &quot;bsd-user/mmap: Always zero MAP_ANONYMOUS<br=
>
memory in mmap_frag()&quot;<br>
<br>
Then describe:<br>
<br>
Similar to the equivalent linux-user commit e6deac9cf99, ...<br></blockquot=
e><div><br></div><div>OK. I have three commits like this, so I&#39;ll go ah=
ead and edit all three.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; <br>
&gt; When mapping MAP_ANONYMOUS memory fragments, still need notice about t=
o<br>
&gt; set it zero, or it will cause issues.<br>
&gt; <br>
&gt; Signed-off-by: Chen Gang &lt;<a href=3D"mailto:gang.chen.5i5j@gmail.co=
m" target=3D"_blank">gang.chen.5i5j@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" t=
arget=3D"_blank">laurent@vivier.eu</a>&gt;<br>
&gt; Signed-off-by: Riku Voipio &lt;<a href=3D"mailto:riku.voipio@linaro.or=
g" target=3D"_blank">riku.voipio@linaro.org</a>&gt;<br>
<br>
^ These tags were for another file, not this one, please<br>
remove them.<br></blockquote><div><br></div><div>Gotcha. I wasn&#39;t compl=
etely sure what to do in this case since they</div><div>describe that the w=
ork is able to be contributed so I could make a case either way.</div><div>=
<br></div><div>I&#39;ll remove them.</div><div><br></div><div>Warner</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; [ bsd-user merge by Mika=C3=ABl Urankar, updated for untagged by Warne=
r Losh ]<br>
&gt; Signed-off-by: Mika=C3=ABl Urankar &lt;<a href=3D"mailto:mikael.uranka=
r@gmail.com" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/mmap.c | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c<br>
&gt; index b40ab9045f..fc3c1480f5 100644<br>
&gt; --- a/bsd-user/mmap.c<br>
&gt; +++ b/bsd-user/mmap.c<br>
&gt; @@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prot_new !=3D (prot1 | PROT_WRIT=
E))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mprotect(host_start, q=
emu_host_page_size, prot_new);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* just update the protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prot_new !=3D prot1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mprotect(host_start, q=
emu_host_page_size, prot_new);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prot_new &amp; PROT_WRITE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(g2h_untagged(start),=
 0, end - start);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000063391505cc3257b9--

