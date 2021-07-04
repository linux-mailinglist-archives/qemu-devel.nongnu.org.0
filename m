Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6423BAE50
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:30:39 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m06t4-0006xk-On
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m06s0-0006Gm-GX
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:29:32 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m06ry-00010T-Ml
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:29:32 -0400
Received: by mail-ua1-x929.google.com with SMTP id y20so2547237uap.10
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Vd8yDVm4n6jm2F1gH7pN6MB7HEhF3DXorR93Hgx0s4=;
 b=GAv8wSfbgtJpgGCKdhgrc/u/0YlI/z26hcEHFrmV/dGC6V2Lp4XVUimtJmSYTpLD9r
 o8H2lHuJkpFpYhZKKaPNJDTTdWW6CAl/MLkEVv3hQlzlku1wGRNej5NuIKNW0Zv9deVc
 Is6ZPU8l4/JqU4bpd+WcinpmSBXepI6yzIqlJUYymYOsu0JISGpeGJgAjCTJf7yN11rR
 VgsTOvhneLNQvGwjy1Rqa5/YHhKhTVNGGOOJUiJ7Tet/eILv56SGhdbnTrB/OCv/b+iU
 3r4QdteiYoSMI7Iub5rWHRr3KFT9H4YfTgyW8/bTf3XqhV4k71o67To8PZK0+K0DxEmZ
 SdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Vd8yDVm4n6jm2F1gH7pN6MB7HEhF3DXorR93Hgx0s4=;
 b=FQ/9eyJFJQSW6jVoZatflyGEN/UxO4lfubqf+8qUppT2rEOnVUmYz1zIxqjHMqXPl5
 h9Qw5p93WfSVtHO7TWqy4Vk0rqf4eAPyJmgmPmzN+WWcEHDC6NFEE4p1tG8s0kj6efzS
 YUSj1qlsxNJc56okO8nZqFsiN9U650UTd2ZjMLDWWBo15AmMbQrAbZeyxQzUs9Tqosx9
 sTxifoxsNNJm3tLUgatnZFR+QZSEBXLCAUYyzmpgKI54LFPqO+SqULM+kxqQ41LmSfU2
 RZU0b7HOhiA3i2oOQzuLihNyD/qZ6c7N8wRH6E4NoymJBMP0Gs2nH5pjrUvnkRdjxQAd
 YfGg==
X-Gm-Message-State: AOAM5302oJxs75ZnWPDjbD4Ko3I6VD4bA+pyBLsfTSymFwoYKVg0sH5T
 zY0VpT1fxR3iMS4cAIMOC+vqhaKyWNYogaUf4Ro=
X-Google-Smtp-Source: ABdhPJxfkzyNWlR7lK+SoZzpWon3qnkCHIgK29XcONDyr5vMxkImhUX9QyamjTji5P5MgZBu0/MWAWKJrodjGjOT6HA=
X-Received: by 2002:ab0:2a42:: with SMTP id p2mr8032917uar.39.1625423369663;
 Sun, 04 Jul 2021 11:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
 <CAFEAcA9rAAuzCh3MVSnfrBWZSvHVrmMqgqJ8OX0=nQKDXoVPpg@mail.gmail.com>
In-Reply-To: <CAFEAcA9rAAuzCh3MVSnfrBWZSvHVrmMqgqJ8OX0=nQKDXoVPpg@mail.gmail.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 14:29:18 -0400
Message-ID: <CAOakUfMYsaPCWdTWodJX2c1oSV-z3+A7cQ_TAJ1a0OLSXt5nAg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] Configure script for Haiku
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008ef87405c6505ef4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=richard.j.zak@gmail.com; helo=mail-ua1-x929.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008ef87405c6505ef4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=8En dum., 4 iul. 2021 la 13:11, Peter Maydell <peter.maydell@linaro.org=
> a
scris:

> On Sun, 4 Jul 2021 at 17:44, Richard Zak <richard.j.zak@gmail.com> wrote:
> >
> > Use system capstone, for which a port is maintained by Haiku. Disable
> TPM which isn't supported.
> >
> > Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
> > ---
> >  configure | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/configure b/configure
> > index e799d908a3..c928071f69 100755
> > --- a/configure
> > +++ b/configure
> > @@ -358,6 +358,7 @@ oss_lib=3D""
> >  bsd=3D"no"
> >  linux=3D"no"
> >  solaris=3D"no"
> > +haiku=3D"no"
> >  profiler=3D"no"
> >  cocoa=3D"auto"
> >  softmmu=3D"yes"
> > @@ -769,6 +770,8 @@ SunOS)
> >  ;;
> >  Haiku)
> >    haiku=3D"yes"
> > +  tpm=3D"no"
>
> If the autodetect for tpm doesn't get this right, we should fix
> the autodetect.
>
> As a general principle we prefer to avoid "do this specific thing
> for this specific host OS" whenever we can, in favour of "test
> whether we have whatever feature/function/library is required".
>
> thanks
> -- PMM
>

Totally makes sense, and I'll be mindful of that. In this case, the
configure script is enabling TPM support on Haiku, but I don't think it
breaks anything, but I haven't tested it yet.

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000008ef87405c6505ef4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4 iul. 2021 la 13:11, Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; a scris:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Sun, 4 Jul 2021 at 17:44, Richard Zak &lt;<a href=3D"mailto:rich=
ard.j.zak@gmail.com" target=3D"_blank">richard.j.zak@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Use system capstone, for which a port is maintained by Haiku. Disable =
TPM which isn&#39;t supported.<br>
&gt;<br>
&gt; Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.c=
om" target=3D"_blank">richard.j.zak@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 configure | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/configure b/configure<br>
&gt; index e799d908a3..c928071f69 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -358,6 +358,7 @@ oss_lib=3D&quot;&quot;<br>
&gt;=C2=A0 bsd=3D&quot;no&quot;<br>
&gt;=C2=A0 linux=3D&quot;no&quot;<br>
&gt;=C2=A0 solaris=3D&quot;no&quot;<br>
&gt; +haiku=3D&quot;no&quot;<br>
&gt;=C2=A0 profiler=3D&quot;no&quot;<br>
&gt;=C2=A0 cocoa=3D&quot;auto&quot;<br>
&gt;=C2=A0 softmmu=3D&quot;yes&quot;<br>
&gt; @@ -769,6 +770,8 @@ SunOS)<br>
&gt;=C2=A0 ;;<br>
&gt;=C2=A0 Haiku)<br>
&gt;=C2=A0 =C2=A0 haiku=3D&quot;yes&quot;<br>
&gt; +=C2=A0 tpm=3D&quot;no&quot;<br>
<br>
If the autodetect for tpm doesn&#39;t get this right, we should fix<br>
the autodetect.<br>
<br>
As a general principle we prefer to avoid &quot;do this specific thing<br>
for this specific host OS&quot; whenever we can, in favour of &quot;test<br=
>
whether we have whatever feature/function/library is required&quot;.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div>Totally makes sense, and I&#39;ll=
 be mindful of that. In this case, the configure script is enabling TPM sup=
port on Haiku, but I don&#39;t think it breaks anything, but I haven&#39;t =
tested it yet.<br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP Ke=
y:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">http=
s://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div><=
/div>

--0000000000008ef87405c6505ef4--

