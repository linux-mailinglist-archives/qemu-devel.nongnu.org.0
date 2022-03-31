Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37664EE002
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:59:48 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZz5E-0004Sb-GB
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:59:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZz3M-0002Le-K9
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:57:48 -0400
Received: from [2a00:1450:4864:20::22c] (port=36604
 helo=mail-lj1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nZz3K-0005bG-CS
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:57:48 -0400
Received: by mail-lj1-x22c.google.com with SMTP id v12so821159ljd.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PHczv70fbjVPMSeyfalY62k/skMtNvdafJHEObSpv8o=;
 b=XFzBKwXPcj84Vq4f5VTIdheembT5jqgDsRyjlpURYGpSIS7Qh/4SV+0zBF38EuFe8D
 Yk2f2va0sOZl/qJGsqtsXtP4vWLSzWZ2FQNIMdVzkEZ5v9oT5onBiaCf4nw/LT2Zi54u
 fCrJPLhEpdh5xxA4HyizG/K/5/Ckqg8E8hpB475RIXX3YACp1VZku3Imyw7wxeYeAmRE
 9nD88jdK88RBGvTYsIHv2bN31PTnPlGEV1bwUdDfJNAZn6buOXd9eMhJTNwRCgXWuPUT
 S+WvwxOsjNVYWBQqEYETuucq3SH0ZcbXBdpxasPwQWF7B3O9ShdAQaW5KaGvEkMkFPll
 h0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHczv70fbjVPMSeyfalY62k/skMtNvdafJHEObSpv8o=;
 b=Z5PB4UuKi+JZjo9OaZx8l0h0KchSg9DoR9dRAjXOS2JGQ36+M8ynD0jQiguTioAQ+w
 nkAu+wkGIi23Vc/4BDmhm4G79hBxVpwsnfcajjPqDI+DmC0hgsZqNS+CIDCqXmsAzFvx
 4Df6ADsf2SPOlu+qZiEyHyEYk+QIdAV8ifTVFaMEnnAlbsVbB4Zb6v9A3N1cmM52f08U
 Z9Uv2NrBdFgcMdmg4SiSPfJjuReodJNnwv5UMWW2jex0c4m/tW+K+JMFh1ozB1o3N9xp
 jVAeH+V2bFvdhgvi72jBH/MnOtgYQ91DZA+hX67qLPnfCyUuaTp/K3guE9EkMdI5hJxF
 /8kQ==
X-Gm-Message-State: AOAM532eBUrb0ByfkYsq/t5xn5UK3KiLav26jcAWygWLyzvyHdyCc9l6
 W7xqvVn9snyIJ6ZgVcQLv1U5buSKu4E8X0w5inw=
X-Google-Smtp-Source: ABdhPJwKyMI7ddgv+z425utbgwjh00EbQjkGH/2rAhSalE7C61PDuv9uxKi2VmrLM5xST6VxKGwfVxG7ciadoYMPHRw=
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id
 a17-20020a05651c031100b0024612500d6fmr10943525ljp.455.1648749460117; Thu, 31
 Mar 2022 10:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <2350345.UNtK3Xum7i@silver>
 <CAB26zV2pqfXts8ug7bi+RHC3gY3nKgMZu0cG1DkNWNO0J1BzVw@mail.gmail.com>
 <9263917.cZLeS7QfZr@silver>
In-Reply-To: <9263917.cZLeS7QfZr@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 31 Mar 2022 13:57:28 -0400
Message-ID: <CAB26zV0s03raGavUDOdxpvq8aAUN51-BVyC2QJ6jecBXc60hWA@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000e4df8f05db876599"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x22c.google.com
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

--000000000000e4df8f05db876599
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 11:34 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 31. M=C3=A4rz 2022 15:19:24 CEST Will Cohen wrote:
> > On Thu, Mar 31, 2022 at 7:07 AM Christian Schoenebeck <
> >
> > qemu_oss@crudebyte.com> wrote:
> > > On Donnerstag, 31. M=C3=A4rz 2022 10:03:35 CEST Peter Maydell wrote:
> > > > On Wed, 30 Mar 2022 at 22:55, Will Cohen <wwcohen@gmail.com> wrote:
> > > > > On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell <
> > >
> > > peter.maydell@linaro.org>
> > >
> > > wrote:
> > > > >> Is it possible to do this with a meson.build check for whatever
> > > > >> host property we're relying on here rather than with a
> > > > >> "which OS is this?" ifdef ?
> > > > >
> > > > > To confirm -- the game plan in this case would be to do a check f=
or
> > > > > something along the lines of
> > > > > config_host_data.set('CONFIG_XATTR_SIZE_MAX',
> > > > > cc.has_header_symbol('linux/limits.h', 'XATTR_SIZE_MAX')) and usi=
ng
> > >
> > > that
> > >
> > > > > in the corresponding ifs, right?
> > > > >
> > > > > That makes sense -- if there's no objections, I'll go this route
> for
> > >
> > > v2,
> > >
> > > > > which I can submit tomorrow.
> > > >
> > > > Yeah, something like that.
> > > >
> > > > Looking a bit closer at the code it looks like the handling of
> > > > XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-provided
> > > > value, whatever it is, on macos we use a hardcoded 64K, and on
> > > > any other host we fail to compile. The comment claims we only
> > > > need to impose a limit to avoid doing an overly large malloc,
> > > > but if that's the case this shouldn't be OS-specific. I suspect
> > > > the problem here is we're trying to impose a non-existent fixed
> > > > maximum size for something where the API on the host just doesn't
> > > > guarantee one.
> > > >
> > > > But that would be a 7.1 thing to look at improving.
> > >
> > > It's like this: macOS does not officially have a limit for xattr size
> in
> > > general. HPFS has a xattr size limit on filesystem level it seems up =
to
> > > INT32_MAX, whereas today's APFS's xattr size AFAIK is only limited by
> the
> > > max.
> > > APFS file size (8 EB).
> > >
> > > As 9p is only used for Linux guests so far, and Linux having a much
> > > smaller
> > > xattr size limit of 64k, and 9p server still using a very simple RAM
> only
> > > xattr implementation, the idea was to cap the xattr size for macOS
> hosts
> > > to
> > > hard coded 64k for that reason for now, at least until there are e.g.
> > > macOS 9p
> > > guests one day that would then actually start to profit from a
> streaming
> > > xattr
> > > implementation in 9p server.
> > >
> > > However right now 9p in QEMU only supports Linux hosts and macOS host=
s,
> > > and
> > > the idea of
> > >
> > > #else
> > > #error Missing definition for P9_XATTR_SIZE_MAX for this host system
> > > #endif
> > >
> > > was to ensure that whoever adds support for another 9p host system in
> > > future,
> > > to check what's the limit on that host system, i.e. it might even be
> <64k.
> > > So
> > > I wouldn't just blindly use a default value here for all systems.
> >
> > Christian, do you have thoughts on the meson.build check, then? For all
> the
> > reasons you state directly above, there's still some macOS-specific log=
ic
> > inherent to this functionality. If I create a meson check for
> > CONFIG_XATTR_SIZE_MAX, the code becomes something like the following:
> >
> > #if defined(CONFIG_XATTR_SIZE_MAX)
> > /* Currently, only Linux has XATTR_SIZE_MAX */
> > #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> > #elif defined(CONFIG_DARWIN)
> > ...
> >
> > On the one hand, I can see how this makes the intent a little clearer -=
-
> > there's some kind of conceptual pre-defined header symbol in "most" cas=
es
> > (currently only one operating system), with some os-specific fallback
> logic.
> > On the other hand, this isn't really shortening anything, it's just
> > replacing CONFIG_LINUX with something which effectively resolves to
> > CONFIG_LINUX through redirection.
>
> Well, I don't see an advantage for a meson check in this case, because
> XATTR_SIZE_MAX is a definition that only exists on Linux. Other systems
> either
> have another macro name or none at all. A dedicated meson check makes
> sense
> for individual features/macros/symbols that may exist across multiple OSe=
s.
>

Understood. I'll resubmit v2 including all of these changes minus the meson
check.

Thanks,
Will


>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000e4df8f05db876599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 31, 2022 at 11:34 AM Christia=
n Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudeb=
yte.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Donnerstag, 31. M=C3=A4rz 2022 15:19:2=
4 CEST Will Cohen wrote:<br>
&gt; On Thu, Mar 31, 2022 at 7:07 AM Christian Schoenebeck &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_blank">qemu_oss@c=
rudebyte.com</a>&gt; wrote:<br>
&gt; &gt; On Donnerstag, 31. M=C3=A4rz 2022 10:03:35 CEST Peter Maydell wro=
te:<br>
&gt; &gt; &gt; On Wed, 30 Mar 2022 at 22:55, Will Cohen &lt;<a href=3D"mail=
to:wwcohen@gmail.com" target=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt; &gt; On Wed, Mar 30, 2022 at 5:31 PM Peter Maydell &lt;<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">pet=
er.maydell@linaro.org</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; Is it possible to do this with a meson.build check =
for whatever<br>
&gt; &gt; &gt; &gt;&gt; host property we&#39;re relying on here rather than=
 with a<br>
&gt; &gt; &gt; &gt;&gt; &quot;which OS is this?&quot; ifdef ?<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; To confirm -- the game plan in this case would be to do=
 a check for<br>
&gt; &gt; &gt; &gt; something along the lines of<br>
&gt; &gt; &gt; &gt; config_host_data.set(&#39;CONFIG_XATTR_SIZE_MAX&#39;,<b=
r>
&gt; &gt; &gt; &gt; cc.has_header_symbol(&#39;linux/limits.h&#39;, &#39;XAT=
TR_SIZE_MAX&#39;)) and using<br>
&gt; &gt; <br>
&gt; &gt; that<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; in the corresponding ifs, right?<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; That makes sense -- if there&#39;s no objections, I&#39=
;ll go this route for<br>
&gt; &gt; <br>
&gt; &gt; v2,<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; which I can submit tomorrow.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yeah, something like that.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Looking a bit closer at the code it looks like the handling =
of<br>
&gt; &gt; &gt; XATTR_SIZE_MAX is kind of odd: on Linux we use this kernel-p=
rovided<br>
&gt; &gt; &gt; value, whatever it is, on macos we use a hardcoded 64K, and =
on<br>
&gt; &gt; &gt; any other host we fail to compile. The comment claims we onl=
y<br>
&gt; &gt; &gt; need to impose a limit to avoid doing an overly large malloc=
,<br>
&gt; &gt; &gt; but if that&#39;s the case this shouldn&#39;t be OS-specific=
. I suspect<br>
&gt; &gt; &gt; the problem here is we&#39;re trying to impose a non-existen=
t fixed<br>
&gt; &gt; &gt; maximum size for something where the API on the host just do=
esn&#39;t<br>
&gt; &gt; &gt; guarantee one.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; But that would be a 7.1 thing to look at improving.<br>
&gt; &gt; <br>
&gt; &gt; It&#39;s like this: macOS does not officially have a limit for xa=
ttr size in<br>
&gt; &gt; general. HPFS has a xattr size limit on filesystem level it seems=
 up to<br>
&gt; &gt; INT32_MAX, whereas today&#39;s APFS&#39;s xattr size AFAIK is onl=
y limited by the<br>
&gt; &gt; max.<br>
&gt; &gt; APFS file size (8 EB).<br>
&gt; &gt; <br>
&gt; &gt; As 9p is only used for Linux guests so far, and Linux having a mu=
ch<br>
&gt; &gt; smaller<br>
&gt; &gt; xattr size limit of 64k, and 9p server still using a very simple =
RAM only<br>
&gt; &gt; xattr implementation, the idea was to cap the xattr size for macO=
S hosts<br>
&gt; &gt; to<br>
&gt; &gt; hard coded 64k for that reason for now, at least until there are =
e.g.<br>
&gt; &gt; macOS 9p<br>
&gt; &gt; guests one day that would then actually start to profit from a st=
reaming<br>
&gt; &gt; xattr<br>
&gt; &gt; implementation in 9p server.<br>
&gt; &gt; <br>
&gt; &gt; However right now 9p in QEMU only supports Linux hosts and macOS =
hosts,<br>
&gt; &gt; and<br>
&gt; &gt; the idea of<br>
&gt; &gt; <br>
&gt; &gt; #else<br>
&gt; &gt; #error Missing definition for P9_XATTR_SIZE_MAX for this host sys=
tem<br>
&gt; &gt; #endif<br>
&gt; &gt; <br>
&gt; &gt; was to ensure that whoever adds support for another 9p host syste=
m in<br>
&gt; &gt; future,<br>
&gt; &gt; to check what&#39;s the limit on that host system, i.e. it might =
even be &lt;64k.<br>
&gt; &gt; So<br>
&gt; &gt; I wouldn&#39;t just blindly use a default value here for all syst=
ems.<br>
&gt; <br>
&gt; Christian, do you have thoughts on the meson.build check, then? For al=
l the<br>
&gt; reasons you state directly above, there&#39;s still some macOS-specifi=
c logic<br>
&gt; inherent to this functionality. If I create a meson check for<br>
&gt; CONFIG_XATTR_SIZE_MAX, the code becomes something like the following:<=
br>
&gt; <br>
&gt; #if defined(CONFIG_XATTR_SIZE_MAX)<br>
&gt; /* Currently, only Linux has XATTR_SIZE_MAX */<br>
&gt; #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX<br>
&gt; #elif defined(CONFIG_DARWIN)<br>
&gt; ...<br>
&gt; <br>
&gt; On the one hand, I can see how this makes the intent a little clearer =
--<br>
&gt; there&#39;s some kind of conceptual pre-defined header symbol in &quot=
;most&quot; cases<br>
&gt; (currently only one operating system), with some os-specific fallback =
logic.<br>
&gt; On the other hand, this isn&#39;t really shortening anything, it&#39;s=
 just<br>
&gt; replacing CONFIG_LINUX with something which effectively resolves to<br=
>
&gt; CONFIG_LINUX through redirection.<br>
<br>
Well, I don&#39;t see an advantage for a meson check in this case, because =
<br>
XATTR_SIZE_MAX is a definition that only exists on Linux. Other systems eit=
her <br>
have another macro name or none at all. A dedicated meson check makes sense=
 <br>
for individual features/macros/symbols that may exist across multiple OSes.=
<br></blockquote><div><br></div><div>Understood. I&#39;ll resubmit v2 inclu=
ding all of these changes minus the meson check.</div><div><br></div><div>T=
hanks,</div><div>Will<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div></div>

--000000000000e4df8f05db876599--

