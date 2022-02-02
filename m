Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE624A78B5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:28:50 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLJB-0002hQ-06
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:28:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nFKQP-0007Uf-No
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:32:13 -0500
Received: from [2a00:1450:4864:20::129] (port=38618
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nFKQN-00070U-Gy
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:32:13 -0500
Received: by mail-lf1-x129.google.com with SMTP id bu18so849821lfb.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 10:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xDKp6huHFfLilKT+KUWiuIxosIQTwsW5bWCUEwFtQU0=;
 b=pdus/+kjgdgrpdECx6I+T0PTmvqUD7d+vTXCc3ps+SzcZY+yxGvKoRDQyz85SFDsqe
 6ejYS0nSjtsDvbj4ogP9mMO65O9pbHz9GcvL9c2d0HORmbiu4R/wsOGJIk6v1UDNGU0f
 j+akg9dWnPN0lJ+P2CTpjSLbLsiLZgmaVUA5pe21ebKEunSEJZGH76t1b0g8QIxfsJm0
 8M/wj+CjmukaKCJIaB7Po9Oc7kzdMVP/f5ucV6Heozxx5CWpRJUwbn5osFF3veCdnQ+b
 heP96hGa6Hxy/EJp+8JOGaOTcYHYRw10LLMNxqbXR1oYkqibfX/DxRkAe6Ylz6hMYT5S
 j1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xDKp6huHFfLilKT+KUWiuIxosIQTwsW5bWCUEwFtQU0=;
 b=uUn3mlOrSem/8JBjEXCdD76CxLZXi5hXY96WyxPXpxgheeUWLg9YfgU+0KH32fYOT7
 xVjb8c85tcO0mxfr4TIdD0UB5g3QoXSCRa3iO28MWrTkTv/qUOOAXnaT+VBhUVxZRLJ2
 lZkyvhltfFgaB7H3kv2DqbULXmJoI8J3VOusfsqwjJLJHfX4uiiXZAQSKKEf3Rk06XeD
 Ve8b3lVtLnLKzq5B+U0ospmvHWA9Ik69zzxquQ2QPaKdLAulQElAHk2YZ6XEsB7K73Br
 ND/g3RQXLth5+IQSTDUItkNmE0SNxgX8qsrdA79UXl9+9uABUa7Q9kKFkAP/JBppu8rN
 P38A==
X-Gm-Message-State: AOAM5309aQOqjiE1i9zWNKdXUN72C0LAlXj2CixTr2iPpR2GwsnRSJR4
 uWn0fBNaAq5NTGJlN1DTtn+OiKjBEDCMR4KwbN4=
X-Google-Smtp-Source: ABdhPJw0KJvg5uOvGgdAtRO3HUMyC8OMn8j4yE3TMfOhKo9Agb+uE/rJ5N/IGcjFLjOenOh7wpEtAqyGWHpZM/+qCBQ=
X-Received: by 2002:a05:6512:368f:: with SMTP id
 d15mr22948956lfs.447.1643826728286; 
 Wed, 02 Feb 2022 10:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-5-wwcohen@gmail.com>
 <CAB26zV0zKNzQ-Fk-TAq-UzqyuThW_aubHR+5+iE+SNZonRALQA@mail.gmail.com>
 <4982610.5BtrrgmkuT@silver>
In-Reply-To: <4982610.5BtrrgmkuT@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 2 Feb 2022 13:31:56 -0500
Message-ID: <CAB26zV1nL2qQZt2UKYS0cuPrP80t7q40eBYfLg7nOhM-zOZ5Zw@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] 9p: darwin: Handle struct dirent differences
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000363db405d70d3cd0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000363db405d70d3cd0
Content-Type: text/plain; charset="UTF-8"

This makes sense! Much appreciated, will revise.

On Wed, Feb 2, 2022 at 12:37 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 2. Februar 2022 16:07:09 CET Will Cohen wrote:
> > Does the version proposed in v3 address the V9fsFidState issues? In 9p.c
> > for v2 to v3, we propose
> >
> > -    return telldir(fidp->fs.dir.stream);
> > +    return v9fs_co_telldir(pdu, fidp);
> >
> > and in codir.c from v2 to v3 we propose
> > -        saved_dir_pos = telldir(fidp->fs.dir.stream);
> > +        saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
> >
> > This removes the direct access to fidp->, and we hope this should be
> > sufficient to avoid the concurrency
> > and undefined behaviors you noted in the v2 review.
>
> I am not sure why you think that you are no longer accessing fidp, you
> still
> do, just in a slightly different way.
>
> Let me propose a different solution: on macOS there is 'd_seekoff' in
> struct
> dirent. As already discussed that dirent field is apparently unused (zero)
> by
> macOS. So what about filling this dirent field (early, on driver level,
> not on
> server/controller level [9p.c]) with telldir() for macOS, then you have
> the
> same info as other systems provide with dirent field 'd_off' later on.
>
> Then you can add an inline helper function or a macro to deal with macOS
> vs.
> RoW, e.g.:
>
> inline
> off_t qemu_dirent_off(struct dirent *dent)
> {
> #ifdef CONFIG_DARWIN
>     return dent->d_seekoff;
> #else
>     return dent->d_off;
> #endif
> }
>
> And in 9p.c at all locations where dent->d_off is currently accessed, you
> would just use that helper instead.
>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000363db405d70d3cd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This makes sense! Much appreciated, will revise.<br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Feb 2, 2022 at 12:37 PM Christian Schoenebeck &lt;<a href=3D"mailto:qemu_=
oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Mittwoch, 2. Februar 2022 16:07=
:09 CET Will Cohen wrote:<br>
&gt; Does the version proposed in v3 address the V9fsFidState issues? In 9p=
.c<br>
&gt; for v2 to v3, we propose<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 return telldir(fidp-&gt;fs.dir.stream);<br>
&gt; +=C2=A0 =C2=A0 return v9fs_co_telldir(pdu, fidp);<br>
&gt; <br>
&gt; and in codir.c from v2 to v3 we propose<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D telldir(fidp-&gt;fs.dir=
.stream);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D s-&gt;ops-&gt;telldir(&=
amp;s-&gt;ctx, &amp;fidp-&gt;fs);<br>
&gt; <br>
&gt; This removes the direct access to fidp-&gt;, and we hope this should b=
e<br>
&gt; sufficient to avoid the concurrency<br>
&gt; and undefined behaviors you noted in the v2 review.<br>
<br>
I am not sure why you think that you are no longer accessing fidp, you stil=
l <br>
do, just in a slightly different way.<br>
<br>
Let me propose a different solution: on macOS there is &#39;d_seekoff&#39; =
in struct <br>
dirent. As already discussed that dirent field is apparently unused (zero) =
by <br>
macOS. So what about filling this dirent field (early, on driver level, not=
 on <br>
server/controller level [9p.c]) with telldir() for macOS, then you have the=
 <br>
same info as other systems provide with dirent field &#39;d_off&#39; later =
on.<br>
<br>
Then you can add an inline helper function or a macro to deal with macOS vs=
. <br>
RoW, e.g.:<br>
<br>
inline<br>
off_t qemu_dirent_off(struct dirent *dent)<br>
{<br>
#ifdef CONFIG_DARWIN<br>
=C2=A0 =C2=A0 return dent-&gt;d_seekoff;<br>
#else<br>
=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
#endif<br>
}<br>
<br>
And in 9p.c at all locations where dent-&gt;d_off is currently accessed, yo=
u <br>
would just use that helper instead.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--000000000000363db405d70d3cd0--

