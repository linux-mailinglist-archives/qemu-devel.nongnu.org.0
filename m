Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2264AB308
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 02:09:32 +0100 (CET)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGsX5-0001wS-HM
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 20:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGsTo-0000kX-AG
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 20:06:08 -0500
Received: from [2a00:1450:4864:20::130] (port=38822
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGsTe-0008Fr-Jq
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 20:06:03 -0500
Received: by mail-lf1-x130.google.com with SMTP id z4so9019432lfg.5
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 17:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E0WfOmhTJSD0SpHnJ6/4AnGiljNx16zabzlg/z9kJus=;
 b=Io480FyMD3NvudGdGzKGEPoEOYMZztqPUCb3HW8MDCTK+8oA7qDh63jndk20ZxWgSP
 4GRsIFXEtVmHgvwOXXCZ6PAU45XVwiDLYefp/Siar0ZmhXKzYDg+rPJWKrn8vHurzZCu
 nWNGfnX6Z+7FKLy9POVtjZLNnlrC9RSriyRD+EgKfZZUO+SIGGWHTkQ+3NLYTQJV0JFE
 RY0PM0xxwYwN2Bxm+/J8FCeGvg38c6SD/lkG6FbCBaBsergb1WN9RWg0wKKpBJr/ZR8v
 LHvanP7O0qbLRN8bf7jGZiHhA8et0uA0QIq1IOnmTd9EMi8D6ZBD9shXhGsN8ONP1Okv
 4BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0WfOmhTJSD0SpHnJ6/4AnGiljNx16zabzlg/z9kJus=;
 b=Yx7JxKenabJs0puj+DbXvc3PSKPGBRznS5wjVyK9SLaJ3Z+FwViWI9d6SWnIQhYQyg
 LIRC7fczKUU3xnNT4F5aPyYyPA/EGkSEWUXqmZryImj2notZCsCvHrGDnYXf9ZFvlDV1
 gSvKIBD+NTgnsXUJibBkd6uytf4Zmacibe4zaVSC4PJ81E5l85grOkSxm4iGWCu45puG
 s5/IqJgUsPFW8g0syIaR3Y1riOqBuUHYSdkqeSgt4+JYFvoVxPsr8ilFrBh2Hweb7Yif
 svf/FBShDIi7/aX0wVj/yjB7LLixycooIpOg7HizNoc+Dw9/X0WOS3+BY1jUf6IHnhBj
 pkcA==
X-Gm-Message-State: AOAM530YwiKnrwMVsrY9aR/Yulqbl7z4fi/f3FXbLLBeWuREJG2Im2As
 xVq0rH2J4Z+p0DvaZEY4iB/i3oODkzWyhITM91g=
X-Google-Smtp-Source: ABdhPJxQOiH0Jjc0WMr8a/fsh/MZB6y/ewcBZ4P6Ji3YfPwDgscr4vBkawfuIkcrtwxU7YRGxGtLShT9iK6whkwb4O4=
X-Received: by 2002:a05:6512:33d4:: with SMTP id
 d20mr6720823lfg.108.1644195944085; 
 Sun, 06 Feb 2022 17:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-11-wwcohen@gmail.com>
 <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
In-Reply-To: <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
From: Will Cohen <wwcohen@gmail.com>
Date: Sun, 6 Feb 2022 20:05:32 -0500
Message-ID: <CAB26zV2sx-9PGhk5Rbz-q+sQJ8yxqOOO32J_k5vb7_sPNgFBnQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000303b3b05d7633391"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000303b3b05d7633391
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Only because porting the proxy-helper to macOS is outside the scope of this
particular patch. While some initial concepts around it have been
considered by some of the contributors to this patch, those implementations
weren't tested enough and the security implications weren't considered in
full. We assume that this could be an additional implementation later on,
if the functionality is considered important down the road.

On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 6/2/22 21:07, Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Rebase to master]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >   fsdev/meson.build |  1 +
> >   meson.build       | 14 ++++++++++----
> >   2 files changed, 11 insertions(+), 4 deletions(-)
>
> > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > +have_virtfs_proxy_helper =3D targetos =3D=3D 'linux' and have_virtfs a=
nd
> have_tools
>
> Why do you restrict the proxy-helper to Linux?
>

--000000000000303b3b05d7633391
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Only because porting the proxy-helper to macOS is outside =
the scope of this particular patch. While some initial concepts around it h=
ave been considered by some of the contributors to this patch, those implem=
entations weren&#39;t tested enough and the security implications weren&#39=
;t considered in full. We assume that this could be an additional implement=
ation later on, if the functionality is considered important down the road.=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 6/2/22 21:07, Will Cohen wrot=
e:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Rebase to master]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; [Will Cohen: - Add check for pthread_fchdir_np to virtfs]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0fsdev/meson.build |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++----<=
br>
&gt;=C2=A0 =C2=A02 files changed, 11 insertions(+), 4 deletions(-)<br>
<br>
&gt; -have_virtfs_proxy_helper =3D have_virtfs and have_tools<br>
&gt; +have_virtfs_proxy_helper =3D targetos =3D=3D &#39;linux&#39; and have=
_virtfs and have_tools<br>
<br>
Why do you restrict the proxy-helper to Linux?<br>
</blockquote></div>

--000000000000303b3b05d7633391--

