Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA455F6741
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:06:47 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQaM-0005eM-3R
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogQLt-0003E2-44
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:51:49 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:45804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogQLq-0005X8-IA
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:51:47 -0400
Received: by mail-lf1-x12d.google.com with SMTP id g1so2519108lfu.12
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4ZwDUrfGT0y8iVAEY1gFhln5ZMxXEsFSXQyDDhQcpl0=;
 b=GVi0wXCvVdF1DsSpFId3ksVFruK6MMALy24sn+57Xjou9q5ZHl61z4Gs0p1bi57lMW
 w7kpYX/5wfdul4Gj3dqffJTODJ/kMniuRE+9Yu1w5XoQiYwLBtIJDSAm+zhNHSxYTBeC
 oWhkzAsbTfg30FHVs0X4S7IOwaic4V2bRwU+/RBoYxJbOPvFOwS5PtSbSrCOHNVJ801u
 Vn1qJvz9ZNVbXJNlQBXCesCBs/bVMuEeXLyOLLnzhJeQL5SPjBXp2nZ62ENj9BbLgJLd
 3tnFcl169jw33QcURJGZr1Rv/hSdwMZsvELMZYyLylVAe3M7IlTXDIjMEpi+iQ4W3W0P
 aW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4ZwDUrfGT0y8iVAEY1gFhln5ZMxXEsFSXQyDDhQcpl0=;
 b=nMoUSUAvggPgujtQgqwmQRA2RdYy5MTreqQM+l8y+w87lzTCHSWwQunAnsQjUVGup/
 Y4hId0gjA4PhkcSXlzFzON4J7D3i66uYnmHTpiF9bVQY8mXMja2ynRxPGUtic7OPfOI2
 y+KaBHzoBAwQHAy4NqyGwDUIncj7OMokASrr3PDboQI5sN5cIr2iV4mKTdZLBsL6kqqA
 Sr6kNV/ZAFW/oTbafEy3DBwjte4xMwn8xTsx1Wn71DQ9Jw68hdiyHlnYr/FovL3DwCoX
 p+mrabyjtV6tVrs6xxYwuncqSJtk9jLVpvpgtBQAmwT+kifzm2gsr5KwkXvk5jiPacSs
 mU+Q==
X-Gm-Message-State: ACrzQf0KBENyveMP59wK6bt0Tu8FGYrnFJU1DCjQZ/2vR09G69pOWK/y
 0LW67ARh3EwzcMkFQs8IYRcbks3LOCLRyS78+wA=
X-Google-Smtp-Source: AMsMyM6vcm5EaOxQurTSUF9O6COUcIIGj/yLyyFUTTEI4ZvwEyNMZYiYvnzU6yfL8cYRedpSORQu4/1IKUzfwgGVYI4=
X-Received: by 2002:a05:6512:2102:b0:4a2:48a2:2cc1 with SMTP id
 q2-20020a056512210200b004a248a22cc1mr1990685lfr.167.1665060704762; Thu, 06
 Oct 2022 05:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
 <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
In-Reply-To: <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 Oct 2022 16:51:33 +0400
Message-ID: <CAJ+F1CK4jqCw-QOEdCT0yVRb7eMY9O1+C7fZfY_JHG9CsdM_kw@mail.gmail.com>
Subject: Re: [PATCH v3] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d63f6d05ea5d2765"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--000000000000d63f6d05ea5d2765
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, Oct 3, 2022 at 11:39 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> Hi
>
> On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 9/30/22 07:03, marcandre.lureau@redhat.com wrote:
> > > +static bool
> > > +set_thread_description(HANDLE h, const char *name)
> > > +{
> > > +  HRESULT hr;
> > > +  g_autofree wchar_t *namew =3D NULL;
> > > +
> > > +  if (!load_set_thread_description()) {
> > > +      return false;
> > > +  }
> >
> > I don't understand why you're retaining this.
> > What is your logic?
> >
>
> Also, if we change the "static bool name_threads" to be true by
> default, then set_thread_description() might be called without calling
> qemu_thread_naming()
>
> It really shouldn't hurt to keep it that way.
>
>
>
Let me know if the current form is ok for you, thanks

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d63f6d05ea5d2765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Richard<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 3, 2022 at 11:3=
9 AM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi<br>
<br>
On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson<br>
&lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richa=
rd.henderson@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 9/30/22 07:03, <a href=3D"mailto:marcandre.lureau@redhat.com" targe=
t=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; &gt; +static bool<br>
&gt; &gt; +set_thread_description(HANDLE h, const char *name)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 HRESULT hr;<br>
&gt; &gt; +=C2=A0 g_autofree wchar_t *namew =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 if (!load_set_thread_description()) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; +=C2=A0 }<br>
&gt;<br>
&gt; I don&#39;t understand why you&#39;re retaining this.<br>
&gt; What is your logic?<br>
&gt;<br>
<br>
Also, if we change the &quot;static bool name_threads&quot; to be true by<b=
r>
default, then set_thread_description() might be called without calling<br>
qemu_thread_naming()<br>
<br>
It really shouldn&#39;t hurt to keep it that way.<br>
<br>
<br>
</blockquote></div><div><br></div><div>Let me know if the current form is o=
k for you, thanks<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d63f6d05ea5d2765--

