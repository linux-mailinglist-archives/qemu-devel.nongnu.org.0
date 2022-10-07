Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DD5F768E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:55:50 +0200 (CEST)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogk56-0000uO-FU
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogk2T-00070o-Vc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:53:11 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogk2S-0003LI-6C
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:53:05 -0400
Received: by mail-lf1-x131.google.com with SMTP id b1so1552977lfs.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Sqw0FS96Bv0jSDJu5gIq14YTAxjNAatIYj3QGmhuD0=;
 b=YtpkFQlta+Qj+k9Pf8MkgMCetNneIqPD+5hz6SxhNdqT7G8L4/am7jTqHBvd9BIGEd
 lcgjbTJIomdb5grJcUiHjgsovD4CX6gPKAtHjvHNTBEH9kN5FccUhiPAziaiFQlCPAlG
 sYkcv1D955H/1H/R5ScNdJvel8swqXdacYtWKNQ4c73SVAz6mb3hAUVrapVcdMeeWHZh
 fCjTM4BS0Is1JoQLSKJWDE8sN8MHu2BBRVDg5sf2YPEqKWt9FPfQLUQR5MgDngBlja+H
 gBB0urTwJCyqFpgAK/KXRi/bMKBdvP8dkRVScfUqGLnyzG7lXHasguc/x3QEc6gd2PCK
 v0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Sqw0FS96Bv0jSDJu5gIq14YTAxjNAatIYj3QGmhuD0=;
 b=HscuQ/XdxzEFYxwGpSOIp1jaL2srV6zI1QuvHxxrCVWziQAOVO8nDdMoO8SjySTx7H
 XxGQv49ug0Vm2X3+FB41Zcv9fej8GZlvI/4L5+3qB1Tk9ROD5frCqZcduludQsHf4IJy
 SmB/roRUWKAQ8tywyfsRnCOsDWm7f5EBEFGB05dHxj1NfSXTD6bcTzQ3n0RvJcWIMqw/
 kkcBrfEDgyrpQ2eOmReEl6WGMOdqjppxzOQe3lFre1/WB6SSt6yJOjs5C04NsBxa7m9I
 sM6SN5oFoxGmJW1hwjcHsckitVoEYDsvpUs9QHiUdU63ptX4+j6kf7j2B2S4UHL87Atb
 fiWQ==
X-Gm-Message-State: ACrzQf0067xBZf0HYllGSmCvHx3Gg2U+fbnZAzxf5Io6nKc4exyinYKZ
 F8T2HMtTRZVr6BVyxbL5f99fzQIkGsXJztt9XNA=
X-Google-Smtp-Source: AMsMyM7bYaYbol7AA4zYXeBkjKwqhr1Sv2SgmRGcdAM/EbMeTzT2e6MaXhsDQQObTpqWelnoVnR0ZNN0Yzjk7hyp7fA=
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id
 z13-20020a0565120c0d00b004a24129366emr1687629lfu.328.1665136380422; Fri, 07
 Oct 2022 02:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
 <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
 <CAJ+F1CK4jqCw-QOEdCT0yVRb7eMY9O1+C7fZfY_JHG9CsdM_kw@mail.gmail.com>
 <a810c149-7b4c-c289-e32a-c7b205705b0b@linaro.org>
In-Reply-To: <a810c149-7b4c-c289-e32a-c7b205705b0b@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 Oct 2022 13:52:48 +0400
Message-ID: <CAJ+F1CJ=FmFVNp1_DE9mg0r0duNBjHo5m2P3k3t4zRuSuV-w_g@mail.gmail.com>
Subject: Re: [PATCH v3] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000752fcc05ea6ec610"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000752fcc05ea6ec610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 7, 2022 at 1:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/6/22 05:51, Marc-Andr=C3=A9 Lureau wrote:
> > Hi Richard
> >
> > On Mon, Oct 3, 2022 at 11:39 AM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@redhat.com
> > <mailto:marcandre.lureau@redhat.com>> wrote:
> >
> >     Hi
> >
> >     On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
> >     <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>=
>
> wrote:
> >      >
> >      > On 9/30/22 07:03, marcandre.lureau@redhat.com <mailto:
> marcandre.lureau@redhat.com>
> >     wrote:
> >      > > +static bool
> >      > > +set_thread_description(HANDLE h, const char *name)
> >      > > +{
> >      > > +  HRESULT hr;
> >      > > +  g_autofree wchar_t *namew =3D NULL;
> >      > > +
> >      > > +  if (!load_set_thread_description()) {
> >      > > +      return false;
> >      > > +  }
> >      >
> >      > I don't understand why you're retaining this.
> >      > What is your logic?
> >      >
> >
> >     Also, if we change the "static bool name_threads" to be true by
> >     default, then set_thread_description() might be called without
> calling
> >     qemu_thread_naming()
> >
> >     It really shouldn't hurt to keep it that way.
> >
> >
> >
> > Let me know if the current form is ok for you, thanks
>
> I guess it's ok, sure.
>

Should I take that for an Ack?  :)

thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000752fcc05ea6ec610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 1:04 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/6/22 05:51, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi Richard<br>
&gt; <br>
&gt; On Mon, Oct 3, 2022 at 11:39 AM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redh=
at.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:richard.henderson@linaro.org"=
 target=3D"_blank">richard.henderson@linaro.org</a> &lt;mailto:<a href=3D"m=
ailto:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@lin=
aro.org</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 9/30/22 07:03, <a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> &lt;m=
ailto:<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marc=
andre.lureau@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +static bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +set_thread_description(HANDLE h, const =
char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 HRESULT hr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 g_autofree wchar_t *namew =3D NU=
LL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 if (!load_set_thread_description=
()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I don&#39;t understand why you&#39;re retaini=
ng this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; What is your logic?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, if we change the &quot;static bool name_threa=
ds&quot; to be true by<br>
&gt;=C2=A0 =C2=A0 =C2=A0default, then set_thread_description() might be cal=
led without calling<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_thread_naming()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It really shouldn&#39;t hurt to keep it that way.<b=
r>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Let me know if the current form is ok for you, thanks<br>
<br>
I guess it&#39;s ok, sure.<br></blockquote><div><br></div><div>Should I tak=
e that for an Ack?=C2=A0 :)</div><div><br></div><div>thanks<br></div></div>=
<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lurea=
u<br></div></div>

--000000000000752fcc05ea6ec610--

