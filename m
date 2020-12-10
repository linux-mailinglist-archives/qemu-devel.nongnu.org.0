Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C726D2D5C33
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:48:57 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMJU-0001Ui-PJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knLpF-00062T-KQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:17:41 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knLov-0000dL-V0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:17:41 -0500
Received: by mail-ed1-x544.google.com with SMTP id b2so5461844edm.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vgP646BjppIrtZuL2LmPe7MH6kVfn7oQVv0szcW8Wf0=;
 b=dXMJ/lJryGCKqAmnog13pyUBxuWVTqCo8Tzssd7dcnmLhIeFm9pfHp2NFEESJvo7Y3
 0yrictv2ODsK9axChadpXRxW3LNDA/xxyrzAPaa5p8HfvoZlzmircrlDPLQ5QZeVTaQg
 Oy8/H6qSwqBGDnSsLH51xc9c6ToAKBU4p/diQnQqykQs8EZzUK1yNatwgqccPTC8Y9Fc
 9eM7RvSu/gksXJoGhqWByx9UrDkSTc0aD65izOkrYLDQ3axLXwQTYMobCpqlsnpC7GJP
 F0+HIBQL18GsvIpp+b6TvpKj3Ymxnk28JmhLp7FVFPvkBaLVgZQrg1qbbBfI8FwllNT1
 wZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vgP646BjppIrtZuL2LmPe7MH6kVfn7oQVv0szcW8Wf0=;
 b=Jx5HI8eib9VUeMJA8ZxRQ4AD2yJVhQ18hYe7rQH6oxk/JoqNCU4bIiJt/nAypBPMko
 L11L52naS4CPQfAZXswsVTvOJH0ZtliGnEm9htyrzqWcA0wlXuAR3cmaXiX3dzF5LTUk
 XsqrlsRNCkL6xJcysWS35wfWgk0gm5PyLMi4Hdsc1qpjHMl6AAXXqCVGv9totNQ81yiQ
 4fdiC2zNe2L4iKcpwaFtRjGEyHTwv44VzOPNqpZMEtfeurgcyImSB2JjeqPMD4vQsXpx
 VHSdBsm+EeL2VPqx4hETARZo2YIzbA5VIE3F5FIG7E4jZ2KHbRrTIXcFuaYpIxR1g5PJ
 PizQ==
X-Gm-Message-State: AOAM530KpbcXBtSgJxxL9hQl5xr2jLjPl8HfS289Pq/yAZpZGRAgdroZ
 m5/8bXyLkLtYhtlgvHSdKwN97pHIMvyHqBBkswY=
X-Google-Smtp-Source: ABdhPJzrSJrn2vMVCnpK2IU+jiOpdQBnkjHznvjrSUlNuxAkPb2xuA2+C1AanKCJP68j3oBD6FEHnlVkLGIIDYQkgfo=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr6884916edc.30.1607606239567; 
 Thu, 10 Dec 2020 05:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-3-marcandre.lureau@redhat.com>
 <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
 <20201126120624.GE1122957@redhat.com>
 <CAFEAcA-uE7-NjWQLHz2QWznjOhRExuTKWH-J9vz6=kQ4fvwdKA@mail.gmail.com>
In-Reply-To: <CAFEAcA-uE7-NjWQLHz2QWznjOhRExuTKWH-J9vz6=kQ4fvwdKA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Dec 2020 17:17:05 +0400
Message-ID: <CAJ+F1CLKyi6aDuf6w7kQRuyPa_xEXnRBM_gX8dCRzfvmrVjbDA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] qemu/atomic: Drop special case for unsupported
 compiler
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d9226e05b61bfeab"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x544.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d9226e05b61bfeab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 26, 2020 at 4:23 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 26 Nov 2020 at 12:06, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> >
> > On Thu, Nov 26, 2020 at 11:49:28AM +0000, Peter Maydell wrote:
> > > On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> > > >
> > > > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > >
> > > > Since commit efc6c070aca ("configure: Add a test for the
> > > > minimum compiler version") the minimum compiler version
> > > > required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
> > > >
> > > > We can safely remove the special case introduced in commit
> > > > a281ebc11a6 ("virtio: add missing mb() on notification").
> > > >
> > > > With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the
> chunk
> > > > to remove (which is x86-specific), isn't reached.
> > >
> > > The minimum clang version enforced by configure is 3.4, not 3.8.
> > > (Or Apple XCode clang 5.1 -- they use a different versioning scheme!)
> >
> > We picked clang 3.4 based on fact that is what ships in EPEL7, and
> > Debian Jessie 3.5.  We then picked the XCode version to match.
> >
> > Based on our platform support matrix we no longer support Debian
> > Jessie, and IMHO we also don't really need to consider 3rd party
> > add-on repos shipping non-default toolschains. So IMHO we could
> > entirely ignore clang in EPEL7 when picking min versions.
> >
> > IOW, we are likely justified in picking a new clang version if
> > someone wants to research what is a suitable min version across
> > our intended supported distros.
>
> Sure, but if we do that then the series should start with the
> "bump the minimum clang version" patch with accompanying
> justification.
>


With clang-3.4.2-9.el7.x86_64 (epel7), __ATOMIC_RELAXED is defined. I'll
update the commit message.

Some research on google suggests that it might be true also with XCode
clang 5.1, I could use some help to verify that:
clang -dM -E - < /dev/null | grep __ATOMIC_RELAXED


--=20
Marc-Andr=C3=A9 Lureau

--000000000000d9226e05b61bfeab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 26, 2020 at 4:23 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, 26 Nov 2020 at 12:06, Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Thu, Nov 26, 2020 at 11:49:28AM +0000, Peter Maydell wrote:<br>
&gt; &gt; On Thu, 26 Nov 2020 at 11:29, &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:phil=
md@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since commit efc6c070aca (&quot;configure: Add a test for th=
e<br>
&gt; &gt; &gt; minimum compiler version&quot;) the minimum compiler version=
<br>
&gt; &gt; &gt; required for GCC is 4.8, which has the GCC BZ#36793 bug fixe=
d.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We can safely remove the special case introduced in commit<b=
r>
&gt; &gt; &gt; a281ebc11a6 (&quot;virtio: add missing mb() on notification&=
quot;).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, s=
o the chunk<br>
&gt; &gt; &gt; to remove (which is x86-specific), isn&#39;t reached.<br>
&gt; &gt;<br>
&gt; &gt; The minimum clang version enforced by configure is 3.4, not 3.8.<=
br>
&gt; &gt; (Or Apple XCode clang 5.1 -- they use a different versioning sche=
me!)<br>
&gt;<br>
&gt; We picked clang 3.4 based on fact that is what ships in EPEL7, and<br>
&gt; Debian Jessie 3.5.=C2=A0 We then picked the XCode version to match.<br=
>
&gt;<br>
&gt; Based on our platform support matrix we no longer support Debian<br>
&gt; Jessie, and IMHO we also don&#39;t really need to consider 3rd party<b=
r>
&gt; add-on repos shipping non-default toolschains. So IMHO we could<br>
&gt; entirely ignore clang in EPEL7 when picking min versions.<br>
&gt;<br>
&gt; IOW, we are likely justified in picking a new clang version if<br>
&gt; someone wants to research what is a suitable min version across<br>
&gt; our intended supported distros.<br>
<br>
Sure, but if we do that then the series should start with the<br>
&quot;bump the minimum clang version&quot; patch with accompanying<br>
justification.<br></blockquote><div><br></div><div><br></div><div>With clan=
g-3.4.2-9.el7.x86_64 (epel7), __ATOMIC_RELAXED is defined. I&#39;ll update =
the commit message.<br></div><div><br></div>Some research on google suggest=
s that it might be true also with  XCode clang 5.1, I could use some help t=
o verify that:</div><div class=3D"gmail_quote">clang -dM -E - &lt; /dev/nul=
l | grep __ATOMIC_RELAXED</div><div class=3D"gmail_quote"><br><div><br></di=
v></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 L=
ureau<br></div></div>

--000000000000d9226e05b61bfeab--

