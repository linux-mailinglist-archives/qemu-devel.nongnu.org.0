Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EAA4CF350
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:10:34 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Rt-0002Rn-42
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR8ND-0006W3-WF; Mon, 07 Mar 2022 03:05:45 -0500
Received: from [2a00:1450:4864:20::431] (port=36427
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nR8NC-0001kw-FH; Mon, 07 Mar 2022 03:05:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id r10so21830307wrp.3;
 Mon, 07 Mar 2022 00:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6vw0M+TOOS8/qdbjoqMVkbE+mUwsOgvMBbD0tw5XEY=;
 b=Y1FFBpgkqeH7WitxMInFpKIzhPzDAhX3Rp5exIbARbby8z97N2nQ/vqP4glynmPbCA
 /YxT7uyg9dY1+dOBYWyaebWfFaPCRXPp7AxNUFyf2KFsUL301pQTVIt2wtpTzEO/kuzv
 bd688m1WgsZakbLQ/sVUUv09Jr5ANHaFulFR9rFjP3MAQNvKSBbyzPpcZ2xO9wh4vmvr
 Tu5Hl8lukgBCSexrrOJKdYlEX6R1VcTYHrB3867Pj8Pd1ug1/MW79c1JlxKCYtnYqhlY
 /57SqichrttvzefEGeJWzaWX/IEbN1IUbmbCTO2CAGWRH2Vc7yfyS4tO9xkdnOTAPmOx
 yjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6vw0M+TOOS8/qdbjoqMVkbE+mUwsOgvMBbD0tw5XEY=;
 b=m2onhmWrCCsd0lMe0zSya9/++Pxv0QMC7lSt45g59A7BJ13oHDtMZplMSDvdkpFaJn
 DHGZ2khgBgmRkKmJQS4YNBtg5lb40gD9rOEg5dlSAyiSFb9LEFK1cNf17nLSM+jq54c4
 0bOaHOa1vdIlX8xWQMgJnIok1P+iZSkvsqMlH58yqCrqKAQLyfyKo+QNmtuGMaootCGV
 NmqXeBiGpL9pL5P5NUnQxwJ5PYlU8vGEJzktOta5S0V8clxE6pCDiO1Yy5719eyNdPbE
 atA2w/titg4LUCv2r30BEmhaKjOjbudvYeHB3ndrz1XAtkJsxxsWB4kVqTWHmd1k60Gw
 QU7w==
X-Gm-Message-State: AOAM532HyfC4GsEvUfifZLps6OaTusrWFESgVKv5XdU+uXzW77xFzpSB
 mVeVzOxxrBV4aPMxD1l0Gze0oiX+uMUziaWQ8Oo=
X-Google-Smtp-Source: ABdhPJyIgrJSjXlKS68Ss7gX7aDNS/m24vsDKgjyAaEN8gAvZvwgpWssp+oMdPrFWVfQ90D5eGqM249jKppiMbCz5Z4=
X-Received: by 2002:a5d:4704:0:b0:1fb:768d:7b6 with SMTP id
 y4-20020a5d4704000000b001fb768d07b6mr260024wrq.187.1646640339391; Mon, 07 Mar
 2022 00:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20220307070401.171986-1-marcandre.lureau@redhat.com>
 <20220307070401.171986-3-marcandre.lureau@redhat.com>
 <673b8beb-352a-df7e-27af-7f81022d5adc@redhat.com>
In-Reply-To: <673b8beb-352a-df7e-27af-7f81022d5adc@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 7 Mar 2022 12:05:26 +0400
Message-ID: <CAJ+F1CJgpC5JQ=Duw7vk8oF+fK9M0=ecqv+HVVaZS67FGY8C=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] qtest: replace gettimeofday with GTimer
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000080983005d99c54b1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000080983005d99c54b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 7, 2022 at 11:46 AM Thomas Huth <thuth@redhat.com> wrote:

> On 07/03/2022 08.03, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > glib provides a convenience helper to measure elapsed time. It isn't
> > subject to wall-clock time changes.
> >
> > Note that this changes the initial OPENED time, which used to print the
> > current time.
> [...]
> > @@ -846,21 +828,20 @@ static void qtest_event(void *opaque, QEMUChrEven=
t
> event)
> >           for (i =3D 0; i < ARRAY_SIZE(irq_levels); i++) {
> >               irq_levels[i] =3D 0;
> >           }
> > -        qemu_gettimeofday(&start_time);
> > +
> > +        g_clear_pointer(&timer, g_timer_destroy);
> > +        timer =3D g_timer_new();
> >           qtest_opened =3D true;
> >           if (qtest_log_fp) {
> > -            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
> > -                    (long) start_time.tv_sec, (long)
> start_time.tv_usec);
> > +            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
> g_timer_elapsed(timer, NULL));
> >           }
> >           break;
>
> The new timestamp here is quite unuseful now, of course ... could you
> replace it with g_get_current_time()  instead?
>

Eventually, but I wonder why this (and only this) particular timestamp
should be the current time.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000080983005d99c54b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 11:46 AM Tho=
mas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 07/03/2=
022 08.03, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank"=
>marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; glib provides a convenience helper to measure elapsed time. It isn&#39=
;t<br>
&gt; subject to wall-clock time changes.<br>
&gt; <br>
&gt; Note that this changes the initial OPENED time, which used to print th=
e<br>
&gt; current time.<br>
[...]<br>
&gt; @@ -846,21 +828,20 @@ static void qtest_event(void *opaque, QEMUChrEve=
nt event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZ=
E(irq_levels); i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_levels[i] =
=3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_gettimeofday(&amp;start_time);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;timer, g_timer_destr=
oy);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D g_timer_new();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_opened =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qtest_log_fp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(qtest_log_fp, &quot=
;[I &quot; FMT_timeval &quot;] OPENED\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (long) start_time.tv_sec, (long) start_time.tv_usec);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(qtest_log_fp, &quot=
;[I &quot; FMT_timeval &quot;] OPENED\n&quot;, g_timer_elapsed(timer, NULL)=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
The new timestamp here is quite unuseful now, of course ... could you <br>
replace it with g_get_current_time()=C2=A0 instead?<br>
</blockquote></div><div><br></div><div>Eventually, but I wonder why this (a=
nd only this) particular timestamp should be the current time.<br></div><di=
v><br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000080983005d99c54b1--

