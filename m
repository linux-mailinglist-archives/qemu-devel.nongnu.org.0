Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F95E35D579
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 04:53:45 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW9BQ-0008Gv-EL
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 22:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1lW98b-0006ic-Pd
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 22:50:49 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1lW98Z-0004YV-Kj
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 22:50:49 -0400
Received: by mail-il1-x134.google.com with SMTP id c18so12862643iln.7
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbJWxXR2mnMjX4AE5oWYodcHUPCOUl1ukjY5XJrzwpw=;
 b=UB8kE5T7+SLD0vb3Vx85mhrj2ZmBzymRPvigcaQVeV1JcsejITyA9F0piOgH3d1j4i
 raTygXERETGKFkiCOmU6yyyVQp16hpM160uzBfHFhNwdtcFIwm6w2pIrGu8IoT268JiP
 LNY9icRMnmyv9Q61Te+ErWRHi3gbrmJlSz/BuAEzSdhFQ3dSbRBiBhQfQ2tNEuKdDcaz
 8BQSWokm8usBP+k/1FIXbNyvTsx1TGIgKPZS7olPItFt7A1wO1YU87gGkrcajGb37Eba
 oPdQ65boTDWLo20z4bkICZNoNHTkTdL2xIekrHcI9UxsAzpLugv/svMPeQgTmvHtJSMX
 j0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbJWxXR2mnMjX4AE5oWYodcHUPCOUl1ukjY5XJrzwpw=;
 b=PPZJYvqpKHkDQFVXKcRyGulL97Df4iGGKfD1TE2tfKIeBN1wpuzEaLsLLQIHMm2efv
 TAmcQZPHoNql9kbACeKDaS9p4I8VAksavzcbQoKnC8/r4PWy9Uixs4juYNEbdA7wQhXF
 n+yjVzveGowXhMTdjvGkHqskZdZjb/iNkc5/URfKlU3VU4G1P1gx6CGjpyJpIYz3gt8N
 kmENhaTptKKhVD418TnVXloTr8QkRAyRY234sgQ/wA5PNBOXMRN2UZR9bQBF2LxigHBx
 DrMBSs1vxjlgR56FZUC5akcZL2Nk228lkRhQXsN5ml/bSSa2r0jfY3KJFpY/hIxmPVWR
 eacg==
X-Gm-Message-State: AOAM531PAW4CtIt1+ulhWf+mTsMXBvscj0AIcivSpkc3jCMYDucI7Qny
 RsnraNKuHhhAcTiI84QELMhY9WD1msrVjZh7QrT8zWh5yj69Ww==
X-Google-Smtp-Source: ABdhPJwOPREX+sTdYSAaaxrJ4YPhxaH4HoGujqjiukaQ/xt1E2NAj3ol9swItGNO3vo5bmwq9hhKTiPUJg59o21DfKY=
X-Received: by 2002:a92:8e52:: with SMTP id k18mr24453021ilh.123.1618282245450; 
 Mon, 12 Apr 2021 19:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPPKfOGwK7JDfHaTT-e4Z7bFkYoWu=dHvF-fT+QdqJhnwCLvOw@mail.gmail.com>
 <CAFEAcA_8ZsHwa+vxz99q52FUP4n7QDTLWpEEh2n_v-Ujiwdu_g@mail.gmail.com>
In-Reply-To: <CAFEAcA_8ZsHwa+vxz99q52FUP4n7QDTLWpEEh2n_v-Ujiwdu_g@mail.gmail.com>
From: Chetan <chetan4windows@gmail.com>
Date: Tue, 13 Apr 2021 08:20:34 +0530
Message-ID: <CAPPKfOHOb9C+GceJFSKZwnw+1UCPkDYoL_1eGizQ6JH3GpJRiQ@mail.gmail.com>
Subject: Re: Better alternative to strncpy in QEMU.
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000062f33c05bfd1b20c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=chetan4windows@gmail.com; helo=mail-il1-x134.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062f33c05bfd1b20c
Content-Type: text/plain; charset="UTF-8"

Hello All,

> I'm not sure what's the improvement over strncpy() here? Paolo, could you
> elaborate?
> (Note that we also have some functions like strpadcpy() in QEMU already,
> which can be used in similar ways)

Ok Thanks, I'll wait for Paolo to clarify if the functions are needed, if
yes then whether my understanding
is correct. If not, then I'll drop this and pick another one.

> Please use "*destination" and "*source" instead of "destination[]" and
> "source[]" here.

@Thomas Thanks for the input, I'll change it accordingly.

> This implementation is "accidentally quadratic", because it
> calls strlen(source) every time through the loop, and thus
> copying an N byte string will read N*N bytes of memory. (The
> compiler can't pull the "strlen(source)" call up out of the loop
> because it can't guarantee that source and destination don't
> overlap.)

@Peter Thanks for the input, I'll be using a while loop instead, as Bruno
suggested. Also, I will only continue with this task after Paolo's input.

> One other optimization that could be done (but is a bigger headache to
implement correctly) would be to cast the char* into uint64_t* (or
uint32_t* for 32-bit >systems) and copy more bytes at a time. The headache
comes from finding a 0 in this longer variable, but you can probably use a
similar strategy to freebsd's > strlen (
https://github.com/freebsd/freebsd-src/blob/main/lib/libc/string/strlen.c).

@Bruno Thanks I'll check out freebsd code.

Thanks and Regards,
Chetan P.

On Mon, Apr 12, 2021 at 6:50 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 11 Apr 2021 at 14:52, Chetan <chetan4windows@gmail.com> wrote:
> > char *qemu_strncpy(char destination[], char source[], size_t
> destination_size)
> > {
> >     /* Looping through the array and copying the characters from
> >      * source to destination.
> >      */
> >     for (int i = 0; i < strlen(source); i++) {
> >         destination[i] = source[i];
> >
> >         /* Check if value of i is equal to the second last index
> >          * of destination array and if condition is true, mark last
> >          * index as NULL and break from the loop.
> >          */
> >         if (i == (destination_size - 2)) {
> >             destination[destination_size - 1] = '\0';
> >             break;
> >         }
> >     }
> >     return destination;
> > }
>
> This implementation is "accidentally quadratic", because it
> calls strlen(source) every time through the loop, and thus
> copying an N byte string will read N*N bytes of memory. (The
> compiler can't pull the "strlen(source)" call up out of the loop
> because it can't guarantee that source and destination don't
> overlap.)
>
> I think this is a good illustration of why we probably don't want
> to roll our own string operation functions if we can avoid it
> (ie without having a clear view of why we are improving on either
> what libc or glib offer us).
>
> thanks
> -- PMM
>

--00000000000062f33c05bfd1b20c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,</div><div><br></div><div>
&gt; I&#39;m not sure what&#39;s the improvement over <span>strncpy</span>(=
) here? Paolo, could you <br>
&gt; elaborate?<br>
&gt; (Note that we also have some functions like strpadcpy() in <span>QEMU<=
/span> already, <br>&gt; which can be used in similar ways)<font color=3D"#=
888888"><br></font>

</div><div><br></div><div>Ok Thanks, I&#39;ll wait for Paolo to clarify if =
the functions are needed, if yes then whether my understanding <br></div><d=
iv>is correct. If not, then I&#39;ll drop this and pick another one.<br></d=
iv><div><br></div><div>
<div>&gt; Please use &quot;*destination&quot; and &quot;*source&quot; inste=
ad of &quot;destination[]&quot; and <br>
&gt; &quot;source[]&quot; here.<span><br></span></div><div><span><br></span=
></div><div><span>@Thomas Thanks for the input, I&#39;ll change it accordin=
gly.=C2=A0 </span></div>

</div><div><br></div><div>
&gt; This implementation is &quot;accidentally quadratic&quot;, because it<=
br>
&gt; calls strlen(source) every time through the loop, and thus<br>
&gt; copying an N byte string will read N*N bytes of memory. (The<br>
&gt; compiler can&#39;t pull the &quot;strlen(source)&quot; call up out of =
the loop<br>
&gt; because it can&#39;t guarantee that source and destination don&#39;t<b=
r>
&gt; overlap.)<br><br></div><div>@Peter Thanks for the input, I&#39;ll be u=
sing a while loop instead, as Bruno suggested. Also, I will only continue w=
ith this task after Paolo&#39;s input.<br></div><div><br></div><div>
&gt; One other optimization that could be done (but is a bigger headache to=
=20
implement correctly) would be to cast the char* into uint64_t* (or=20
uint32_t* for 32-bit &gt;systems) and copy more bytes at a time. The=20
headache comes from finding a 0 in this longer variable,
 but you can probably use a similar strategy to freebsd&#39;s &gt; strlen (=
<a href=3D"https://github.com/freebsd/freebsd-src/blob/main/lib/libc/string=
/strlen.c" id=3D"m_4942893335699796004gmail-m_1386563371306196915LPlnk20646=
4" target=3D"_blank">https://github.com/freebsd/freebsd-src/blob/main/lib/l=
ibc/string/strlen.c</a>). <br></div><div><br></div><div>@Bruno Thanks I&#39=
;ll check out freebsd code.<br></div><div><br></div><div>Thanks and Regards=
,</div><div>Chetan P.<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Apr 12, 2021 at 6:50 PM Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Sun, 11 Apr 2021 at 14:52, Chetan &lt;<a href=3D"mailto=
:chetan4windows@gmail.com" target=3D"_blank">chetan4windows@gmail.com</a>&g=
t; wrote:<br>
&gt; char *qemu_strncpy(char destination[], char source[], size_t destinati=
on_size)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Looping through the array and copying the charac=
ters from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * source to destination.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; strlen(source); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destination[i] =3D source[i];<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if value of i is equal to th=
e second last index<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * of destination array and if condit=
ion is true, mark last<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * index as NULL and break from the l=
oop.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D (destination_size - 2)) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destination[destination=
_size - 1] =3D &#39;\0&#39;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0return destination;<br>
&gt; }<br>
<br>
This implementation is &quot;accidentally quadratic&quot;, because it<br>
calls strlen(source) every time through the loop, and thus<br>
copying an N byte string will read N*N bytes of memory. (The<br>
compiler can&#39;t pull the &quot;strlen(source)&quot; call up out of the l=
oop<br>
because it can&#39;t guarantee that source and destination don&#39;t<br>
overlap.)<br>
<br>
I think this is a good illustration of why we probably don&#39;t want<br>
to roll our own string operation functions if we can avoid it<br>
(ie without having a clear view of why we are improving on either<br>
what libc or glib offer us).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000062f33c05bfd1b20c--

