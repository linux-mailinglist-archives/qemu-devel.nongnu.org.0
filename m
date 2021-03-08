Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A0330B09
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:25:41 +0100 (CET)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJD52-0007gk-7Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lJD3A-00078T-8m
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:23:45 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lJD38-0003DG-93
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:23:44 -0500
Received: by mail-ej1-x633.google.com with SMTP id bm21so19183899ejb.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Knx1fcFV18/CFF8fexvqRHkZHuaEy0KR0RN5xpSLkM=;
 b=kKK8bEKlRfoQQamoucks++Q1WFJcbK5kmAMVmjHpWDubZdWWTQLJuldFeeh6NbD0/A
 70oZR5J9XCd/cCxKI3Szh/A4XQNUMG2Vej6auqo5QRNsrjWjyTGpQ3TEW4/QTVNXDpyj
 NiJwEmclYRNohB94ieqFm2WtKSvMUVwaJqN7nuvgLs2hiXHoYFw3VBXuSguACDJQMqOD
 CyRHTl0Yfp9A/nzVPZP12fp8XbwguL9Sg8JpKYI17fYSsaTSxIytnjHFox+erhKJ521y
 gmzywephJ29u9JM8S1rzF0P2/K+eDxhv/SyX9rzyoR9S71YXmJIXzQPszTEcyh8fAeCH
 0QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Knx1fcFV18/CFF8fexvqRHkZHuaEy0KR0RN5xpSLkM=;
 b=Lq7FR4LvIV7gEXnm+wTtLp+KEigAz+UrAPf4196T0Q+g4DZ/V9LLJWnBoY2xxRp/6G
 enS5ZJa+VrmeCRqZrw3KfHQdFBBBCx5fYKisOXKl5dQmyslLFMZxOkfmZmPl1Bod67jz
 oN7BP9xeSEc8V2jpYOagnPSzuAxMTe31SVJnJIHTcNXJVYZZdgmb2R77ge6QI80V8ixw
 0btBXLryMlUE6fAUNQvWd4bVWsfaOXDuKebhJX2MNvzTVJ0Y2CCPkYpXjvK1H6YbWsD3
 zA4cNYuaxanyhQAH6lsHDzhLyf5Kcqv9GtKvxr0ZGOfkdScjaE6Z/xATFrP2pp3+7FqY
 aAdQ==
X-Gm-Message-State: AOAM5309z7ioB9efx+54Hv9hACqb8n9QcLrDrg/awMVRXnVdSv+TDKMI
 vgHdoUQ97l9dwrCbQrfPsBbm9tsIqgCgXMagCxg=
X-Google-Smtp-Source: ABdhPJzeF/njkafPn/DjkQ/EPwW3VvOw+KOuG6q5K70gtsM1P/JWG/j+2cuMEf34SqGRMJtyNQc3O4xmIU7yZ8OxC9I=
X-Received: by 2002:a17:906:2e08:: with SMTP id
 n8mr14016531eji.527.1615199020027; 
 Mon, 08 Mar 2021 02:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
 <cb8c7d87-1f1d-a262-c35a-00b34f8240f0@redhat.com>
In-Reply-To: <cb8c7d87-1f1d-a262-c35a-00b34f8240f0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 8 Mar 2021 14:23:28 +0400
Message-ID: <CAJ+F1CJb1tsjz=+8=rkB9Rm16Cn8JmA-SC3MSb53XxvXo2WM6g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Update libslirp & make it a subproject
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d49c6505bd03d3df"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d49c6505bd03d3df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 8, 2021 at 2:03 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Hi Marc-Andr=C3=A9,
>
> On 1/25/21 8:34 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Here is a few patches to update libslirp to git upstream.
> > Since it now supports meson subproject(), adapt the build
> > system to use it, and related fixes.
> >
> > v2:
> >  - fix unused variables on macos
> >  - fork_exec_child_setup: improve signal handling
> >
> > Marc-Andr=C3=A9 Lureau (2):
> >   slirp: update to git master
> >   build-sys: make libslirp a meson subproject
> >
> >  configure            |  2 +-
> >  meson.build          | 62 +++-----------------------------------------
> >  .gitmodules          |  4 +--
> >  slirp                |  1 -
> >  subprojects/libslirp |  1 +
> >  5 files changed, 8 insertions(+), 62 deletions(-)
> >  delete mode 160000 slirp
> >  create mode 160000 subprojects/libslirp
>
> Just out of curiosity, why "subprojects"? Should we move
> other submodules there (meson, dtc, keycodemapdb)?
>

It's required when you use meson subproject() :
https://mesonbuild.com/Subprojects.html#why-must-all-subprojects-be-inside-=
a-single-directory

(btw, the patch series has conflicts with the current git, I'll send a v3)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d49c6505bd03d3df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 2:03 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Marc-Andr=C3=A9,<br>
<br>
On 1/25/21 8:34 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; Here is a few patches to update libslirp to git upstream.<br>
&gt; Since it now supports meson subproject(), adapt the build<br>
&gt; system to use it, and related fixes.<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 - fix unused variables on macos<br>
&gt;=C2=A0 - fork_exec_child_setup: improve signal handling<br>
&gt; <br>
&gt; Marc-Andr=C3=A9 Lureau (2):<br>
&gt;=C2=A0 =C2=A0slirp: update to git master<br>
&gt;=C2=A0 =C2=A0build-sys: make libslirp a meson subproject<br>
&gt; <br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<=
br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 62 +++----------=
-------------------------------<br>
&gt;=C2=A0 .gitmodules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
&gt;=C2=A0 subprojects/libslirp |=C2=A0 1 +<br>
&gt;=C2=A0 5 files changed, 8 insertions(+), 62 deletions(-)<br>
&gt;=C2=A0 delete mode 160000 slirp<br>
&gt;=C2=A0 create mode 160000 subprojects/libslirp<br>
<br>
Just out of curiosity, why &quot;subprojects&quot;? Should we move<br>
other submodules there (meson, dtc, keycodemapdb)?<br></blockquote><div><br=
></div><div>It&#39;s required when you use meson subproject() :<br></div><d=
iv><a href=3D"https://mesonbuild.com/Subprojects.html#why-must-all-subproje=
cts-be-inside-a-single-directory">https://mesonbuild.com/Subprojects.html#w=
hy-must-all-subprojects-be-inside-a-single-directory</a> <br></div></div><d=
iv><br></div><div>(btw, the patch series has conflicts with the current git=
, I&#39;ll send a v3)<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d49c6505bd03d3df--

