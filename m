Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977A426638
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:50:08 +0200 (CEST)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYlZu-00037b-To
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYlXX-0001Lg-Fu
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:47:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYlXV-0004Xm-UG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 04:47:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so27556766wri.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iokKqXZ81pe06POM/h6myGwvwgbpU+RsKso6ITukyik=;
 b=i9jGMGUomdQu/82+cVCg6qHwr6euhmdG6Ze2sPAqjopO0cgjVxCu9G6qlCJH1SZR6+
 Bm2eKSGiejc7VqU0Ezdnp2HbjO7Ars7lFhqPiTEYOUIhM114U7f70KZhp8it26QBLp6z
 0m9ozH4k6B2rWQVaaIVA3MnjCcrumNLBFDPmXpbojLOhuR55Wt8UHHAVhy6ScJua2jBl
 yCDrtjRyj6aUFT82Z/f7w2F5mVAgDFD+OCNGXarVH6DlnX9vyavePaCfh+WcM8G6bxPc
 WZMjRMworLD/FvdtB1ibDv5bAuiJB4Ymp4EZYTt/0v4gJ7XwMII69SZ+EYnmSy4owRJB
 Qr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iokKqXZ81pe06POM/h6myGwvwgbpU+RsKso6ITukyik=;
 b=fDXi65j8lveZ9TdXT3gxImXg//O0F+GuFxhjLOQsmeIWttq4LyilzLQFsu3FCeVuLk
 8FWrm0865SKc0oftdSUoBGz9iz2GMJlJUZEkCUqNF/672lQXQwWiaPcNUuHYgZcYlZAV
 T8C1R0WRlVSW1odVSzC1bR4br9TALLeecTQwLvCMKK6VUGsLCeKqG8yBE/2Pfg+KEdat
 tNfArctNf5EyLM14BcbncmGmzp/jZjCgg8bjYkZknWYyVHzfF4DYx0zzeELWjv+Vzsjs
 4YJKbd5criwrUjuLSwFXow1X5B9RjP5ucxtv3UQ3WFM/DmTpOHQ7ez/IXZTUza8l773y
 imKQ==
X-Gm-Message-State: AOAM530wdXfoHRpFNLxWAAPej2/H3JaGWbHQ1iwIhAcOnSie9c5qfu8o
 xPL526Z0XTOy0vkIP49Xj9awdi8WdqEizNsa0ArOg0+X+Aw=
X-Google-Smtp-Source: ABdhPJx83mJVL0xxDSjNZI9ynLzTwIGvISwjMZ0GC0i9Gfy5UkYuNaT//4GJ2FBegweNRI40REmhH/AAjTbWwqWaxzY=
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr2481882wrb.374.1633682856301;
 Fri, 08 Oct 2021 01:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-10-pbonzini@redhat.com>
 <dc8d3342-96fa-a0fb-f337-c87066eba911@linaro.org>
 <52debbd6-574b-1f33-c880-28d229679eb0@redhat.com>
In-Reply-To: <52debbd6-574b-1f33-c880-28d229679eb0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 12:47:24 +0400
Message-ID: <CAJ+F1CKeTxojeVVWfS1WS9b7b+B7rXS5ASRtXP3cAsLd6A77pA@mail.gmail.com>
Subject: Re: [PATCH 15/24] configure, meson: move libaio check to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005357cf05cdd36ea2"
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005357cf05cdd36ea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Oct 8, 2021 at 12:32 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/10/21 21:24, Richard Henderson wrote:
> > On 10/7/21 6:08 AM, Paolo Bonzini wrote:
> >> +++ b/stubs/meson.build
> >> @@ -20,7 +20,9 @@ endif
> >>   stub_ss.add(files('iothread-lock.c'))
> >>   stub_ss.add(files('isa-bus.c'))
> >>   stub_ss.add(files('is-daemonized.c'))
> >> -stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
> >> +if libaio.found()
> >> +  stub_ss.add(if_true: files('linux-aio.c'))
> >> +endif
> >
> > This bit doesn't look quite right, with the if_true.
>
> It looks silly but it works ("when: []" is always-true, just like in
> python all([]) is true).  I'll remove the if_true in v2.
>
>
and why not  keep the one-liner version?:
stub_ss.add(when: libaio, if_true: files('linux-aio.c'))


--=20
Marc-Andr=C3=A9 Lureau

--0000000000005357cf05cdd36ea2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 8, 2021 at 12:32 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 07/10/21 21:24, Richard Henderson wrote:<br>
&gt; On 10/7/21 6:08 AM, Paolo Bonzini wrote:<br>
&gt;&gt; +++ b/stubs/meson.build<br>
&gt;&gt; @@ -20,7 +20,9 @@ endif<br>
&gt;&gt; =C2=A0 stub_ss.add(files(&#39;iothread-lock.c&#39;))<br>
&gt;&gt; =C2=A0 stub_ss.add(files(&#39;isa-bus.c&#39;))<br>
&gt;&gt; =C2=A0 stub_ss.add(files(&#39;is-daemonized.c&#39;))<br>
&gt;&gt; -stub_ss.add(when: &#39;CONFIG_LINUX_AIO&#39;, if_true: files(&#39=
;linux-aio.c&#39;))<br>
&gt;&gt; +if libaio.found()<br>
&gt;&gt; +=C2=A0 stub_ss.add(if_true: files(&#39;linux-aio.c&#39;))<br>
&gt;&gt; +endif<br>
&gt; <br>
&gt; This bit doesn&#39;t look quite right, with the if_true.<br>
<br>
It looks silly but it works (&quot;when: []&quot; is always-true, just like=
 in <br>
python all([]) is true).=C2=A0 I&#39;ll remove the if_true in v2.<br>
<br></blockquote><div><br></div><div>and why not=C2=A0 keep the one-liner v=
ersion?:</div><div>stub_ss.add(when: libaio, if_true: files(&#39;linux-aio.=
c&#39;))<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005357cf05cdd36ea2--

