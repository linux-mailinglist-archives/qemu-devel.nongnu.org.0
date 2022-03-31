Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4B4EDA69
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:22:24 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZukl-0006rI-DQ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:22:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZuiE-0005wH-3s
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:19:42 -0400
Received: from [2a00:1450:4864:20::22f] (port=38505
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZuiC-0006Wu-9Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:19:41 -0400
Received: by mail-lj1-x22f.google.com with SMTP id s13so14903957ljd.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abaz1n3hmIFx1rWNTeWJtvOyBllNP2/KqPNqYOreD8U=;
 b=D/hNfDKjqRgwFaqdyF7GOBOGc2z+5Qm2pf/TJWQ5WAZuv2NOF097eiHACOEfixVf36
 VaHe+th2JPXRFEgA0Bbacc2N1It83c9/Ftoqi933xHooy2LReKLwCA6VjdWWf68ulKKL
 QjqyuY6RoVqqX37EiwSiJEaSX4AMC9iAySvW9mKvXXCc26kwwp591Wkoms7pS5vgMKPk
 b6c/PCnPH6MhAn0DukTzDHkbfcOOpZZVu3nYsdGICbYcW1piRS6UH9Zb8oqbQ2gpBJ3C
 Oh5H+/YjtUDyqBLGtGS/fc9lvwP/HekhDrPKJ2D9LhmTGtMMRizDYMAvh4Ikcbd3kzq/
 vgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=abaz1n3hmIFx1rWNTeWJtvOyBllNP2/KqPNqYOreD8U=;
 b=DDsvCdSG5S5hzWjvA9zNkNmbeWA89uPkhFWyX3xL5JAbO6LHhiav5yRZSns5wtLcmq
 M81jZqAogT8WN1r+mOvUXbpsdDHp0nYPo3jyQMNSC7chfsP6VdZ5qKt7cxOyHArjUj+G
 i/Ow6WUmj4RqlqjOQ4TycH9U9S7DO+9E/2UNza7+atCUpWaHADTtXpljr2Et1URZ120f
 TxqvfhpusXV0tCiM5/jr4lSGQ3S8Nk9ZMow1PlSU5qPQwpDMcOHmhb/poxXffjX/hNnx
 lk6u059TyZnWQYQsrQSY5nKb9tEubVmLXRkhC13HIj4UAv1SDuqCcHednj8/gBrnNFHr
 zlFw==
X-Gm-Message-State: AOAM531MtF0it+IPZmBNNka9ZpoDj+3kZNVOmVi+Ucl4x8TbY2iSJEBh
 RvPV851IMxyC/Em2knjPJYOJsBzqginfC0kO/d8=
X-Google-Smtp-Source: ABdhPJxu207hXAkbpxBpJdDgAI5AWOYnes/b/QwxegNujmhQYZHMLbbJ6UU6AoQJ3yQpEje+ruQtQ5DT5rL3tNwvUOs=
X-Received: by 2002:a2e:81d8:0:b0:24a:f9bf:b560 with SMTP id
 s24-20020a2e81d8000000b0024af9bfb560mr1986237ljg.12.1648732775597; Thu, 31
 Mar 2022 06:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <CAB26zV2zZg3Nri9i4LcnCvYkX-T33Pbn2FwU6hP_LEKiab_tVA@mail.gmail.com>
 <CAFEAcA8fdebk3Z9bUbHuYKL5VCFqtu9gqbHdB4i_Umuaabqr7g@mail.gmail.com>
 <2350345.UNtK3Xum7i@silver>
In-Reply-To: <2350345.UNtK3Xum7i@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 31 Mar 2022 09:19:24 -0400
Message-ID: <CAB26zV2pqfXts8ug7bi+RHC3gY3nKgMZu0cG1DkNWNO0J1BzVw@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000006b496805db838346"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x22f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b496805db838346
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 7:07 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 31. M=C3=A4rz 2022 10:03:35 CEST Peter Maydell wrote:
> > On Wed, 30 Mar 2022 at 22:55, Will Cohen <wwcohen@gmail.com> wrote:
> > > On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <
> peter.maydell@linaro.org>
> wrote:
> > >> Is it possible to do this with a meson.build check for whatever
> > >> host property we're relying on here rather than with a
> > >> "which OS is this?" ifdef ?
> > >
> > > To confirm -- the game plan in this case would be to do a check for
> > > something along the lines of
> > > config_host_data.set('CONFIG_XATTR_SIZE_MAX',
> > > cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX')) and using
> that
> > > in the corresponding ifs, right?
> > >
> > > That makes sense -- if there's no objections, I'll go this route for
> v2,
> > > which I can submit tomorrow.
> > Yeah, something like that.
> >
> > Looking a bit closer at the code it looks like the handling of
> > XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided
> > value, whatever it is, on macos we use a hardcoded 64K, and on
> > any other host we fail to compile. The comment claims we only
> > need to impose a limit to avoid doing an overly large malloc,
> > but if that's the case this shouldn't be OS-specific. I suspect
> > the problem here is we're trying to impose a non-existent fixed
> > maximum size for something where the API on the host just doesn't
> > guarantee one.
> >
> > But that would be a 7.1 thing to look at improving.
>
> It's like this: macOS does not officially have a limit for xattr size in
> general. HPFS has a xattr size limit on filesystem level it seems up to
> INT32_MAX, whereas today's APFS's xattr size AFAIK is only limited by the
> max.
> APFS file size (8 EB).
>
> As 9p is only used for Linux guests so far, and Linux having a much
> smaller
> xattr size limit of 64k, and 9p server still using a very simple RAM only
> xattr implementation, the idea was to cap the xattr size for macOS hosts
> to
> hard coded 64k for that reason for now, at least until there are e.g.
> macOS 9p
> guests one day that would then actually start to profit from a streaming
> xattr
> implementation in 9p server.
>
> However right now 9p in QEMU only supports Linux hosts and macOS hosts,
> and
> the idea of
>
> #else
> #error Missing definition for P9_XATTR_SIZE_MAX for this host system
> #endif
>
> was to ensure that whoever adds support for another 9p host system in
> future,
> to check what's the limit on that host system, i.e. it might even be <64k=
.
> So
> I wouldn't just blindly use a default value here for all systems.
>

Christian, do you have thoughts on the meson.build check, then? For all the
reasons you state directly above, there's still some macOS-specific logic
inherent to this functionality. If I create a meson check for
CONFIG_XATTR_SIZE_MAX, the code becomes something like the following:

#if defined(CONFIG_XATTR_SIZE_MAX)
/* Currently, only Linux has XATTR_SIZE_MAX */
#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
#elif defined(CONFIG_DARWIN)
...

On the one hand, I can see how this makes the intent a little clearer --
there's some kind of conceptual pre-defined header symbol in "most" cases
(currently only one operating system), with some os-specific fallback logic=
.
On the other hand, this isn't really shortening anything, it's just
replacing CONFIG_LINUX with something which effectively resolves to
CONFIG_LINUX through redirection.

Will


>
> Best regards,
> Christian Schoenebeck
>
>
>

--0000000000006b496805db838346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 7:07 AM Chris=
tian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@cru=
debyte.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Donnerstag, 31. M=C3=A4rz 2022 10:03:35 CEST Peter Maydell wr=
ote:<br>
&gt; On Wed, 30 Mar 2022 at 22:55, Will Cohen &lt;<a href=3D"mailto:wwcohen=
@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell &lt;<a href=3D"mail=
to:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>=
&gt; <br>
wrote:<br>
&gt; &gt;&gt; Is it possible to do this with a meson.build check for whatev=
er<br>
&gt; &gt;&gt; host property we&#39;re relying on here rather than with a<br=
>
&gt; &gt;&gt; &quot;which OS is this?&quot; ifdef ?<br>
&gt; &gt; <br>
&gt; &gt; To confirm -- the game plan in this case would be to do a check f=
or<br>
&gt; &gt; something along the lines of<br>
&gt; &gt; config_host_data.set(&#39;CONFIG_XATTR_SIZE_MAX&#39;,<br>
&gt; &gt; cc.has_header_symbol(&#39;linux/limits.h&#39;, &#39;XATTR_SIZE_MA=
X&#39;)) and using that<br>
&gt; &gt; in the corresponding ifs, right?<br>
&gt; &gt; <br>
&gt; &gt; That makes sense -- if there&#39;s no objections, I&#39;ll go thi=
s route for v2,<br>
&gt; &gt; which I can submit tomorrow.<br>
&gt; Yeah, something like that.<br>
&gt; <br>
&gt; Looking a bit closer at the code it looks like the handling of<br>
&gt; XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided<br=
>
&gt; value, whatever it is, on macos we use a hardcoded 64K, and on<br>
&gt; any other host we fail to compile. The comment claims we only<br>
&gt; need to impose a limit to avoid doing an overly large malloc,<br>
&gt; but if that&#39;s the case this shouldn&#39;t be OS-specific. I suspec=
t<br>
&gt; the problem here is we&#39;re trying to impose a non-existent fixed<br=
>
&gt; maximum size for something where the API on the host just doesn&#39;t<=
br>
&gt; guarantee one.<br>
&gt; <br>
&gt; But that would be a 7.1 thing to look at improving.<br>
<br>
It&#39;s like this: macOS does not officially have a limit for xattr size i=
n <br>
general. HPFS has a xattr size limit on filesystem level it seems up to <br=
>
INT32_MAX, whereas today&#39;s APFS&#39;s xattr size AFAIK is only limited =
by the max. <br>
APFS file size (8 EB).<br>
<br>
As 9p is only used for Linux guests so far, and Linux having a much smaller=
 <br>
xattr size limit of 64k, and 9p server still using a very simple RAM only <=
br>
xattr implementation, the idea was to cap the xattr size for macOS hosts to=
 <br>
hard coded 64k for that reason for now, at least until there are e.g. macOS=
 9p <br>
guests one day that would then actually start to profit from a streaming xa=
ttr <br>
implementation in 9p server.<br>
<br>
However right now 9p in QEMU only supports Linux hosts and macOS hosts, and=
 <br>
the idea of<br>
<br>
#else<br>
#error Missing definition for P9_XATTR_SIZE_MAX for this host system<br>
#endif<br>
<br>
was to ensure that whoever adds support for another 9p host system in futur=
e, <br>
to check what&#39;s the limit on that host system, i.e. it might even be &l=
t;64k. So <br>
I wouldn&#39;t just blindly use a default value here for all systems.<br></=
blockquote><div><br></div><div>Christian, do you have thoughts on the meson=
.build check, then? For all the reasons you state directly above, there&#39=
;s still some macOS-specific logic inherent to this functionality. If I cre=
ate a meson check for CONFIG_XATTR_SIZE_MAX, the code becomes something lik=
e the following:<br></div><div><br></div><div>#if defined(CONFIG_XATTR_SIZE=
_MAX)<br>/* Currently, only Linux has XATTR_SIZE_MAX */<br>#define P9_XATTR=
_SIZE_MAX XATTR_SIZE_MAX<br>#elif defined(CONFIG_DARWIN)</div><div>...<br><=
/div><div><br></div><div>On the one hand, I can see how this makes the inte=
nt a little clearer -- there&#39;s some kind of conceptual pre-defined head=
er symbol in &quot;most&quot; cases (currently only one operating system), =
with some os-specific fallback logic.</div><div>On the other hand, this isn=
&#39;t really shortening anything, it&#39;s just replacing CONFIG_LINUX wit=
h something which effectively resolves to CONFIG_LINUX through redirection.=
</div><div><br></div><div>Will<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>

--0000000000006b496805db838346--

