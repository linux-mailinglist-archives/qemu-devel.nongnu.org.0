Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFB2D8FF0
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 20:20:33 +0100 (CET)
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koWv1-0001qN-Fx
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 14:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1koWtp-0001Ou-3E
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:19:17 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1koWtm-0000Gi-VN
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 14:19:16 -0500
Received: by mail-lf1-x141.google.com with SMTP id m25so24732499lfc.11
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 11:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=FUES5u6OgACZUkQAD6/eR1hGHQ8Qr4LW1ZSDTyozc8A=;
 b=MVazmmrJYeHhQw5y5wX9qZ6Pm1urEyhPIdnuGOdmHgJahl/Uq4d98u0POWkRPhxyqT
 t9ga3YR1Zmgdt5x3/vHe6xhNuKs4VzbVcoDNLSJgpM5vtMRRiDbN8D/bhxdjhvnpXDdS
 TrNL/7GpUheiJkH9vAd/nodDQHzLkB6iDPiTS/ImJEi1v7zicSCcl5EqEr/mo3wgzRiX
 Qu3E6v607wxN8Od9J4lhgb3wwFGQTlqDIlpq0ZHKN+1OgNrdA3DUFC+xe4WnXVhxXsC4
 VmeKca+H2mdwJ4o8oXIebeeyzdvreY06Q9elHlqVJmS7IztTXtiffzsJuwoYQdYYuNTo
 YO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=FUES5u6OgACZUkQAD6/eR1hGHQ8Qr4LW1ZSDTyozc8A=;
 b=Rr3o9NHGJb1UjTpvjdiZ1sS5cHmcgemUh9zua2RUiSY+aFmk7QO1CRIpV92lJnuPIT
 T5BXxevuRWnwTKItvjyMNf/ebAoSs5a68gXysekie/rXEPyCIFBQfSZ0nlpa4M0TzOrd
 PQSle4BO9f/lUnKAPmR1K/VmaCMf5hN96fuaYbKG5vw4+uFaq9sORGtqxSVX2jah5GJA
 SDFkgxj7whY9vNKXNMGNzPzkWLIajsP6Hwf8jlGMjjTq/3dmE/+XksdZtSrLlEQ/Of8J
 yS78vqW3Lyz4RQcxtYLhmywbKdXZ31fbxbr7w0QyFrUYZEhfMB5SXyBp1kfW4nLVJ/FM
 ws+w==
X-Gm-Message-State: AOAM530zdtQs3WfJEtycguXVblns2hmoJSm9P1m71DNBU2Mu8XMJXt/8
 yIQ3I1diHY4qhduewCxB6T50z2ePS5MrV3VLI7U=
X-Google-Smtp-Source: ABdhPJzTXDI/4YbGnqu9OtHZ1rIADeMhBXd1uFHsGAy8AIex+ZzFp9H+P5BF6eS87PcHlkxTuI7xToB+kKdq30mDFG4=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr6999449ljg.45.1607887151400; 
 Sun, 13 Dec 2020 11:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20201118140739.18377-1-alex.bennee@linaro.org>
 <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
 <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
In-Reply-To: <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 14 Dec 2020 03:18:58 +0800
Message-ID: <CAE2XoE938Ut+5NAB+4qgWMK4O4rGz8ORwWMsUC90J9NwF0Fs2A@mail.gmail.com>
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007f8be005b65d66ce"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x141.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f8be005b65d66ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 2:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:
>
> On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth <thuth@redhat.com> wrote:
> > On 18/11/2020 15.07, Alex Benn=C3=A9e wrote:
> > > These seem to trigger timeouts with some regularity.
> > >
> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > > ---
> > >  .cirrus.yml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/.cirrus.yml b/.cirrus.yml
> > > index f0209b7a3e..08db7c419f 100644
> > > --- a/.cirrus.yml
> > > +++ b/.cirrus.yml
> > > @@ -18,6 +18,7 @@ freebsd_12_task:
> > >      - gmake -j$(sysctl -n hw.ncpu) check V=3D1
> > >
> > >  macos_task:
> > > +  timeout_in: 90m
> > >    osx_instance:
> > >      image: catalina-base
> > >    install_script:
> > > @@ -32,6 +33,7 @@ macos_task:
> > >      - gmake check V=3D1
> > >
> > >  macos_xcode_task:
> > > +  timeout_in: 90m
> > >    osx_instance:
> > >      # this is an alias for the latest Xcode
> > >      image: catalina-xcode
> > >
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> > ... we could maybe also split the --target-list between the two jobs if
they
> > take too long...
>
> Maybe it's time, 90min reached:
> https://cirrus-ci.com/task/5774549872541696
>
Even two hour doesn't working, don't know why

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000007f8be005b65d66ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Dec 14, 2020 at 2:36 AM Philippe Mathieu-D=
aud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wr=
ote:<br>&gt;<br>&gt; On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth &lt;<a hre=
f=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt; &gt; =
On 18/11/2020 15.07, Alex Benn=C3=A9e wrote:<br>&gt; &gt; &gt; These seem t=
o trigger timeouts with some regularity.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt=
; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.=
org">alex.bennee@linaro.org</a>&gt;<br>&gt; &gt; &gt; ---<br>&gt; &gt; &gt;=
 =C2=A0.cirrus.yml | 2 ++<br>&gt; &gt; &gt; =C2=A01 file changed, 2 inserti=
ons(+)<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; diff --git a/.cirrus.yml b/.cirr=
us.yml<br>&gt; &gt; &gt; index f0209b7a3e..08db7c419f 100644<br>&gt; &gt; &=
gt; --- a/.cirrus.yml<br>&gt; &gt; &gt; +++ b/.cirrus.yml<br>&gt; &gt; &gt;=
 @@ -18,6 +18,7 @@ freebsd_12_task:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0-=
 gmake -j$(sysctl -n hw.ncpu) check V=3D1<br>&gt; &gt; &gt;<br>&gt; &gt; &g=
t; =C2=A0macos_task:<br>&gt; &gt; &gt; + =C2=A0timeout_in: 90m<br>&gt; &gt;=
 &gt; =C2=A0 =C2=A0osx_instance:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0imag=
e: catalina-base<br>&gt; &gt; &gt; =C2=A0 =C2=A0install_script:<br>&gt; &gt=
; &gt; @@ -32,6 +33,7 @@ macos_task:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0=
- gmake check V=3D1<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =C2=A0macos_xcode_t=
ask:<br>&gt; &gt; &gt; + =C2=A0timeout_in: 90m<br>&gt; &gt; &gt; =C2=A0 =C2=
=A0osx_instance:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0# this is an alias f=
or the latest Xcode<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0image: catalina-x=
code<br>&gt; &gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Reviewed-by: Thomas Huth &=
lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt;<br>&gt; &gt=
;<br>&gt; &gt; ... we could maybe also split the --target-list between the =
two jobs if they<br>&gt; &gt; take too long...<br>&gt;<br>&gt; Maybe it&#39=
;s time, 90min reached:<br>&gt; <a href=3D"https://cirrus-ci.com/task/57745=
49872541696">https://cirrus-ci.com/task/5774549872541696</a><br>&gt;<br>Eve=
n two hour doesn&#39;t working, don&#39;t know why<br><br>--<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=
=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--0000000000007f8be005b65d66ce--

