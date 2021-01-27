Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8000305040
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 04:53:48 +0100 (CET)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4btr-0003oH-Ck
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 22:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l4bss-0003Mw-JC
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 22:52:46 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l4bsq-0007Pr-Ch
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 22:52:46 -0500
Received: by mail-ed1-x52d.google.com with SMTP id a14so711673edu.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 19:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=BJ2UxAbQsuWuu1XfPpKQqRx6ej41GPGfyftp/1czovM=;
 b=toOwiqBGz/AJUkj8fwNLM6+1OWIaAtqflm3vMLzGqcp1QLuc/IWpbUS0pfVusXCHou
 bjn3gTP902VFt6b2CMdqGfBEYoc/IfGqBz/MuTEf8D1x0I0HdbxbFWBhVYoN7O/C1rFb
 UpJZ7JkigVOVQsC1U3kOE7lH3WPp4KARgcx7xBtjY5Dfk19zZcY3HChRr0lfGdu+yBFE
 Evr+OnAGzZnw2MM2tTNy+v+3Ij6NQYbCPas02gQ9jCzvyf8zGpRI5MXCjXuYPxBs3TYh
 zVtByuzcDp/BNznX/2f7bV2TJsvXUbRVhoc4IxChbICVwocUqg0K78Cx8MjVibNp4Z3c
 ehtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=BJ2UxAbQsuWuu1XfPpKQqRx6ej41GPGfyftp/1czovM=;
 b=fjOzOe7x6W6qy+WReirFRTfI7AyuibubBdiaVblWxCsCt/ieYr1tGZ+fB2ek8M+Sjo
 p+xv/D7XyPY72EoQ8dHRFNCfVdOXcNvACgSmua3bpK2ynufdRew+IwnDSgw1n+RgJBCZ
 fT3HUUeeqBytXqYu4YG/4DBcrCEgF3qtrcx6nigVoOWAK6eRvSKeqIZoPbKIyl+S+O7l
 zwZWx/jjFJnyD7x+/OyRZZd+DOKerRtbDImUvnYg/3h7b8g562RAYK3k7Aq2ZZm+sBpp
 gGJ8FS8IoZoh1XKl0+3keCGKJY6RGf1Tn/R3j0o314lfkd2ojS4usLQKkGZUVcO9mOew
 bifg==
X-Gm-Message-State: AOAM530+x26C8Z0EWhRgd4Ra/Pdk9GnE4vnlssvJViL939q6knCsfE4g
 vsSeGECjWunVqYWMka/0HGdz9a2lmlvln4XdQg8=
X-Google-Smtp-Source: ABdhPJypusp/BQWUoBTiYIDlHovXbDek6g+oXXuRZ1y/f0hXZHRexMd+XfbU0WGI8qQAk875C9oS4tsgresUgCBRdBY=
X-Received: by 2002:a05:6402:4382:: with SMTP id
 o2mr7311115edc.371.1611719562198; 
 Tue, 26 Jan 2021 19:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20201001163429.1348-1-luoyonggang@gmail.com>
 <87pn5v1tag.fsf@linaro.org>
In-Reply-To: <87pn5v1tag.fsf@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 27 Jan 2021 11:52:29 +0800
Message-ID: <CAE2XoE9CgA3MvV9MJnM8bx6JQ0+DU69mqSD0jOFLCvAu5kwwcg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Enable plugin support on msys2/mingw
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fb82c805b9d9b343"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fb82c805b9d9b343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi alex, when does plugins/next getting PR

On Tue, Oct 6, 2020 at 7:35 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > V2-V3
> > Split following patches out
> >
> > V1-V2
> > 1. Fixes review comments
> > 2. Increase QEMU_PLUGIN_VERSION to 1 for compat  QEMU_PLUGIN_VERSION 0
> > 3. Revise the loader to support for version 0 and 1
> > 4. By export function qemu_plugin_initialize in plugin, and call it in
> loader=3D
> > , so
> >   we have no need call it in every plugin. And also provide a standard
> implem=3D
> > entation,
> >   anyway, use can also override it.
> >
> > Add this feature on msys2/mingw by using glib provided cross-platform
> dlsym f=3D
> > unctional.
>
> I've grabbed the first two fixes into plugins/next for now. Aside from
> fixing the review comments I'd like to have an indication that the
> proposed change to the API linking doesn't adversely affect the
> performance of the plugins.
>
> It might be worth enabling a --enable-plugins build for mingw gitlab as
> Cirrus
> seems a bit broken at the moment.
>
> Thanks,
>
>
> --
> Alex Benn=C3=A9e
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000fb82c805b9d9b343
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi alex, when does plugins/next getting PR</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 6, 2=
020 at 7:35 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com" target=3D"_blank"=
>luoyonggang@gmail.com</a>&gt; writes:<br>
<br>
&gt; V2-V3<br>
&gt; Split following patches out<br>
&gt;<br>
&gt; V1-V2<br>
&gt; 1. Fixes review comments<br>
&gt; 2. Increase QEMU_PLUGIN_VERSION to 1 for compat=C2=A0 QEMU_PLUGIN_VERS=
ION 0<br>
&gt; 3. Revise the loader to support for version 0 and 1<br>
&gt; 4. By export function qemu_plugin_initialize in plugin, and call it in=
 loader=3D<br>
&gt; , so<br>
&gt;=C2=A0 =C2=A0we have no need call it in every plugin. And also provide =
a standard implem=3D<br>
&gt; entation,<br>
&gt;=C2=A0 =C2=A0anyway, use can also override it.<br>
&gt;<br>
&gt; Add this feature on msys2/mingw by using glib provided cross-platform =
dlsym f=3D<br>
&gt; unctional.<br>
<br>
I&#39;ve grabbed the first two fixes into plugins/next for now. Aside from<=
br>
fixing the review comments I&#39;d like to have an indication that the<br>
proposed change to the API linking doesn&#39;t adversely affect the<br>
performance of the plugins.<br>
<br>
It might be worth enabling a --enable-plugins build for mingw gitlab as Cir=
rus<br>
seems a bit broken at the moment.<br>
<br>
Thanks,<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=
=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=
=A0 sincerely,<br>Yonggang Luo<br></div>

--000000000000fb82c805b9d9b343--

