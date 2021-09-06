Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58902401B78
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:56:51 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEB8-00023Q-EX
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNE9U-0001H2-U9
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:55:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mNE9S-00023e-GB
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:55:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so9754903wrb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kd4n65FgJ0S371RrhGzI8Q3Hicw1Ly6lDODxmnrTp58=;
 b=n2jGzhvjLSj/TrrnrVOmHNXNMyiiS6QXmoXqE5fiBq8RX+kJyPYHvtJxE+dQMY2fCD
 afxX3quJJCm2Rfd3lKSs1XlkXsdAaviADwKE9kVaya49dPkEBSIBOyhOM08Msu1a54uW
 x/+gE3Q28D7vk15gYdVCXQshzz90EWsw6RrlIxBQkwdHWg3s0OIHNiw7JCBAsSJOl+VQ
 vdfizfOL/jmJ9/DqoXs7AJZEHA+eAf0eNZkr6h9YK3qgOSksnorE700bwYyaPs6YGycD
 0KPVQmWQUIdTSYZWqe8cI9AIb1PPNrawgrgBF5JDEVdGeqqcnAh1eB+kgzhA78/4qEDi
 otFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kd4n65FgJ0S371RrhGzI8Q3Hicw1Ly6lDODxmnrTp58=;
 b=sfUaV0qQKb7XTBwpbEeuxrXjagwfWw7yFFOZBCEs0lcOf5SRdEnH9zk7Fg9fQGaBOz
 YrgFXXDOpESLrshEh4iRssxqUe8jg4DjhqYJp2ZUHS+AmYi1l6IJ43oTDKiYaqppXmwu
 ktVwl/QcqJ0YCpiUe3fzr+IkMJ9VM63PxsElS2ZMrK1fJJPvcAqyKBaM2uZwwfouiboC
 pthOLv/RYBfvAXnZXAwA2yw77Z2PQmQ0LuxubsTm0iH2XcN2BUFw5Fxw0f9frHirgXeL
 aglyh/DsxfWlAga5KWuSUkQmLjNgH0sbG5bp1smgo+H26m25UBZieEAlwG9rkuu0jZpb
 wY1Q==
X-Gm-Message-State: AOAM530pObv7iiK1NWzao6Elv+YmH4BZsH/+EcQGGQ2f+wJ1z9ow2d4D
 3MmilQaeJ/Ztu4Lgn8fcca5hhailjZomOfsNPdw=
X-Google-Smtp-Source: ABdhPJxqqrlQxetyNbcm1TQ3DICJ0tP0t2bvAXTwSvgWpp+3UKl500KTphSTjpp8iWPaNxPsn4+0qYZ3Cqhj2MzsNmo=
X-Received: by 2002:adf:b347:: with SMTP id k7mr12814132wrd.239.1630932904342; 
 Mon, 06 Sep 2021 05:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210906112945.88042-1-thuth@redhat.com>
 <20210906112945.88042-2-thuth@redhat.com>
 <CAFEAcA_kZp64PedHb_fFtbtTpV3RrRHaZC9qALZSXHB3+jh+eQ@mail.gmail.com>
 <e1db517b-5040-7549-5656-90450b98da2d@redhat.com>
In-Reply-To: <e1db517b-5040-7549-5656-90450b98da2d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Sep 2021 16:54:52 +0400
Message-ID: <CAJ+F1CL-nwU61qGPrgpmWv1F9XMhN7P4b-oiGkTweVGSWfo9eg@mail.gmail.com>
Subject: Re: configure / meson: Move the GBM handling to meson.build
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006a77d305cb53281a"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a77d305cb53281a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 6, 2021 at 4:49 PM Thomas Huth <thuth@redhat.com> wrote:

> On 06/09/2021 13.37, Peter Maydell wrote:
> > On Mon, 6 Sept 2021 at 12:30, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> The GBM library detection does not need to be in the configure script,
> >> since it does not have any user-facing options (there are no
> >> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
> >> instead, so we don't have to clutter config-host.mak with the related
> >> switches.
> >>
> >> Additionally, only check for GBM if it is really required, i.e. if we
> >> either compile with OpenGL or with virglrenderer support.
> >>
> >> Message-Id: <20210714085045.797168-1-thuth@redhat.com>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >
> > I assume this doesn't change behaviour here,
>
> Right.
>
> > so this is more of
> > a maybe-followup-improvement note, but the gbm checking (in the
> > old configure version) recently confused somebody on qemu-discuss:
> > https://lists.nongnu.org/archive/html/qemu-discuss/2021-09/msg00010.htm=
l
> > They didn't have libgbm installed, and because there's no
> > --enable-gbm there's no way to force configure to enable the egl-headle=
ss
> > UI frontend -- it is always silently falls back to "don't build that".
> > Ideally we ought to provide a means for distros and users to say
> > "make sure you build this feature or barf" the way we do with other
> > things, I guess.
>
> Marc-Andr=C3=A9, you've introduced the GBM library in commit d52c454aa as=
 far
> as
> I can see ... could you please comment on this? Was there a reason not to
> add --enable-gbm and --disable-gbm switches?
>

No, I agree we should have switches for it.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006a77d305cb53281a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 6, 2021 at 4:49 PM Thom=
as Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06/09/20=
21 13.37, Peter Maydell wrote:<br>
&gt; On Mon, 6 Sept 2021 at 12:30, Thomas Huth &lt;<a href=3D"mailto:thuth@=
redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; The GBM library detection does not need to be in the configure scr=
ipt,<br>
&gt;&gt; since it does not have any user-facing options (there are no<br>
&gt;&gt; --enable-gbm or --disable-gbm switches). Let&#39;s move it to meso=
n.build<br>
&gt;&gt; instead, so we don&#39;t have to clutter config-host.mak with the =
related<br>
&gt;&gt; switches.<br>
&gt;&gt;<br>
&gt;&gt; Additionally, only check for GBM if it is really required, i.e. if=
 we<br>
&gt;&gt; either compile with OpenGL or with virglrenderer support.<br>
&gt;&gt;<br>
&gt;&gt; Message-Id: &lt;<a href=3D"mailto:20210714085045.797168-1-thuth@re=
dhat.com" target=3D"_blank">20210714085045.797168-1-thuth@redhat.com</a>&gt=
;<br>
&gt;&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com"=
 target=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; <br>
&gt; I assume this doesn&#39;t change behaviour here,<br>
<br>
Right.<br>
<br>
&gt; so this is more of<br>
&gt; a maybe-followup-improvement note, but the gbm checking (in the<br>
&gt; old configure version) recently confused somebody on qemu-discuss:<br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-discuss/2021-09/=
msg00010.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.or=
g/archive/html/qemu-discuss/2021-09/msg00010.html</a><br>
&gt; They didn&#39;t have libgbm installed, and because there&#39;s no<br>
&gt; --enable-gbm there&#39;s no way to force configure to enable the egl-h=
eadless<br>
&gt; UI frontend -- it is always silently falls back to &quot;don&#39;t bui=
ld that&quot;.<br>
&gt; Ideally we ought to provide a means for distros and users to say<br>
&gt; &quot;make sure you build this feature or barf&quot; the way we do wit=
h other<br>
&gt; things, I guess.<br>
<br>
Marc-Andr=C3=A9, you&#39;ve introduced the GBM library in commit d52c454aa =
as far as <br>
I can see ... could you please comment on this? Was there a reason not to <=
br>
add --enable-gbm and --disable-gbm switches?<br></blockquote><div><br></div=
><div>No, I agree we should have switches for it. <br></div><div><br></div>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lur=
eau<br></div></div>

--0000000000006a77d305cb53281a--

