Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC275F0648
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 10:13:51 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeB9a-0006Qs-N8
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 04:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeB4y-0000ab-4M
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:09:04 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeB4w-0002mm-CL
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 04:09:03 -0400
Received: by mail-lf1-x12f.google.com with SMTP id u18so5710571lfo.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=otaVFW/N/1NzMDURFbdM6pur16gRgUC4MRj4Y4wP9lo=;
 b=E+6I8UEo5d8g5mvorxYLHk7TsUahuk6HLAeU0R0CKZ13o+zBvAWVWhTcivmNYJ64up
 w/uUhbMuUATeHMWyIyF5JNebUtCLVTiNNkJvkk43TnGDjeWgB95cxWAe508XhOQgY0DC
 rVXg80kE/mhkA3TLM0ca1UkbjOdSkAdCjTpZ9vdTj+MfCqo9PLqfob3IwFs8ravvuNSq
 IlJXODRa8b9lRxaYYjLa0mxtwMJ5dhn5HAiiVqqfSOceXMjD1lziMsPP7bz7CVRFf5TN
 E47Oc8kKwiIjSsaN56CjDQWl5F6hca7CmklNsIkiGN80MksZ7p4mz0z/JbGou0F8ooXg
 0cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=otaVFW/N/1NzMDURFbdM6pur16gRgUC4MRj4Y4wP9lo=;
 b=1qzV739CiXOlR1c1KftGx8y8m0oXMDpdQXM0p21eO+SszL2KnVihNhcGvp+8xd+4tQ
 FcYKZlWODJqQTX1B+I+sk3ZrGwWyt3z1ynZqZz8/rVIo9Cx6RMqQzX2JWavpLlM7I6o9
 wnSWvw9/rD4imR/d0Vme5BVRpUGjGuoNQoHy4i3zheRD7x5w1GTtoEXXWDkweF0JPMwG
 h7Z3Tx9dJBC8ivN5H2FdLXv1eBnTuLKP2iRQgKU8+nyq31nhXJvVbsA4QFsI7eg7ka94
 f0gPIjSVhks2Aq/y2wB8ue395Po0KreYLq+S5exy38W3KhXjN7arKEbJW/d9hJ/2TCgd
 75IQ==
X-Gm-Message-State: ACrzQf3oO/rqV5BmZa0Ib6MdfKi5yDJmc+OPyp2U7bLK+uNheR765X2t
 zgKwOSK7ZxlXY9soSOIB1WqGzxXfON5gtkYvFJE=
X-Google-Smtp-Source: AMsMyM6uAdHPLT6k2qP8j4LpZzmoTA1LtzSFjWWshwr36cdZeRagXWg4kkzs6KyAMkFGHlAizZ7+gX7as3SwgKfdIyI=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr3311830lfv.356.1664525339871; Fri, 30
 Sep 2022 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
 <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
In-Reply-To: <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Sep 2022 12:08:48 +0400
Message-ID: <CAJ+F1CLNzwTOB2-wxbnJw9VaCVBFUkgC5c-nYaczL14RLVwaCg@mail.gmail.com>
Subject: Re: [PATCH] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="0000000000009a511105e9e08119"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000009a511105e9e08119
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 29, 2022 at 9:53 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/29/22 06:41, marcandre.lureau@redhat.com wrote:
> >   void qemu_thread_naming(bool enable)
> >   {
> >       /* But note we don't actually name them on Windows yet */
> >       name_threads =3D enable;
> >
> > -    fprintf(stderr, "qemu: thread naming not supported on this host\n"=
);
> > +    if (enable && !load_set_thread_description()) {
> > +        fprintf(stderr, "qemu: thread naming not supported on this
> host\n");
> > +    }
> >   }
>
> Comment is out of date, and I think it would be better to *not* set
> name_threads if not
> supported, rather than...
>

Comment removed.


>
>
> > +static bool
> > +set_thread_description(HANDLE h, const char *name)
> > +{
> > +  HRESULT hr;
> > +  g_autofree wchar_t *namew =3D NULL;
> > +
> > +  if (!load_set_thread_description() || !name) {
> > +      return false;
> > +  }
>
> ... have to re-query load_set_thread_description later.
>

The load_set_thread_description() function is actually a "one-time"
function, it doesn't re-load.


>
> Also, unused return value; might as well be void.
>

Right, maybe it should warn if it failed to set the name?


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009a511105e9e08119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 9:53 PM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 9/29/22 06:41, <a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt;=C2=A0 =C2=A0void qemu_thread_naming(bool enable)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* But note we don&#39;t actually name them =
on Windows yet */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name_threads =3D enable;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: thread naming not supported=
 on this host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (enable &amp;&amp; !load_set_thread_description()) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: thread naming=
 not supported on this host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
Comment is out of date, and I think it would be better to *not* set name_th=
reads if not <br>
supported, rather than...<br></blockquote><div><br></div><div>Comment remov=
ed.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; +static bool<br>
&gt; +set_thread_description(HANDLE h, const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 HRESULT hr;<br>
&gt; +=C2=A0 g_autofree wchar_t *namew =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 if (!load_set_thread_description() || !name) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 }<br>
<br>
... have to re-query load_set_thread_description later.<br></blockquote><di=
v><br></div><div>The load_set_thread_description() function is actually a &=
quot;one-time&quot; function, it doesn&#39;t re-load.<br></div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, unused return value; might as well be void.<br></blockquote><div><br>=
</div><div>Right, maybe it should warn if it failed to set the name? <br></=
div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009a511105e9e08119--

