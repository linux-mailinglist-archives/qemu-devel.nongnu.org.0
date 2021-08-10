Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFB3E8610
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 00:31:00 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDaGx-0001jF-O2
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 18:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaFf-0000xN-BI
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:29:39 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaFd-00061S-Mn
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:29:39 -0400
Received: by mail-qk1-x735.google.com with SMTP id c130so171617qkg.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFeDX1YKy5aFM+7pzkIuQgqUv/XXwycuHf62jvCem5o=;
 b=OK8ICeJkcZtEQ1d2JTFNbmz0EWlaJcw1sCBGCoazXCAWxIblkO1vGM2RnxM+Vd/tOQ
 DKjAYn+RbWYgqZseJrkKEufwwv/X7YtKhbVdieVMoiBTz3GVIXhfhwyPWfWamWZSJBC9
 VoLbBHRvFPs3BJD6b2JDLZ8WXm+1zkXSl+fhSdF7nWslHa+jiAGLhIjTzBDaludelkM8
 Frs/PvLup2Br/CWI5QwMWY/icOBMEyctZxVlNZdzeRk0cXSnL5Nk4J4a2PHK67mdJyCW
 E/FQbQOFP8bxSVr8UFJnMaO2u/x7wHMjBWX76e1kiVTfb2kPtvinaB3pNQPAkakRQ3RR
 ZXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFeDX1YKy5aFM+7pzkIuQgqUv/XXwycuHf62jvCem5o=;
 b=aagp9yoTqimDwP/9ZpbPScdokv6PWNixG8x4YnpNj5iuCyic4vjYQ/8c5rjerD1k47
 HclUMg9Q2NhMPqAheOMRzQ2nBa/oRnIkmQ5QYupzZgLE7AAJV6VowkNI5ZwAd5XGK7Wl
 MD7U1PLmudDemVpJ6FC6TCnT+qg75qEmTwR6Mkbb4tbMdtopaNKqTFbQwJt4ZHzqF7B5
 9olXtzHKQSB48qywTyNksOMfyX9QGPUEYaxg+CsJgJxBvxz6JlBZHk2mdC67Vj0cey9b
 gVu913Q5KqsxdidRVqaG/Fnv/rDNfEMZlibrMCZ1l/ixKtU0NE5cDVNGE+zMFXeDlA4a
 35YA==
X-Gm-Message-State: AOAM530MyAOzMbYOl0c5uimobfJAwRwlXOd20ZvDn7qhFRgi2AW6olku
 RXyIhBPwyAb05OeEd8hMMn5CCIjzxK/PIIS3C0yI5Q==
X-Google-Smtp-Source: ABdhPJyxyBA034ow/u7dpOZQKTnRciwQtxfsVPdc6FnVTYEK61vFRfpO7l8PSvpBer0/U7SuKv6IypJUxNlLIgObE9g=
X-Received: by 2002:a37:8243:: with SMTP id e64mr24403865qkd.89.1628634576427; 
 Tue, 10 Aug 2021 15:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-36-imp@bsdimp.com>
 <0508e338-28e1-63fe-125c-c365761c5cb8@linaro.org>
In-Reply-To: <0508e338-28e1-63fe-125c-c365761c5cb8@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 16:29:25 -0600
Message-ID: <CANCZdfrW6JpyVnRj1NFSoEzeULuL3MQ=pt_JwWR+6_Xuru4iFQ@mail.gmail.com>
Subject: Re: [PATCH for 6.2 35/49] bsd-user: remove error_init
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000065b69805c93c0991"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065b69805c93c0991
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 9:07 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > Error reporting isn't used, so gc it until it's used.
> >
> > Signed-off-by: Warner Losh  <imp@bsdimp.com>
>
> That's not true.  At minimum, tcg/ uses Error during alloc_code_gen_buffer.
>

I'm not sure how I overlooked that, so I'll just drop this patch. Thanks
for the
good eye.

Warner


> r~
>
> > ---
> >   bsd-user/main.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index b5527537b4..7e20430fb7 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -34,7 +34,6 @@
> >   #include "qapi/error.h"
> >   #include "qemu.h"
> >   #include "qemu/config-file.h"
> > -#include "qemu/error-report.h"
> >   #include "qemu/path.h"
> >   #include "qemu/help_option.h"
> >   #include "qemu/module.h"
> > @@ -223,7 +222,6 @@ int main(int argc, char **argv)
> >
> >       save_proc_pathname(argv[0]);
> >
> > -    error_init(argv[0]);
> >       module_call_init(MODULE_INIT_TRACE);
> >       qemu_init_cpu_list();
> >       module_call_init(MODULE_INIT_QOM);
> >
>
>

--00000000000065b69805c93c0991
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 9:07 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Error reporting isn&#39;t used, so gc it until it&#39;s used.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh=C2=A0 &lt;<a href=3D"mailto:imp@bsdimp.com"=
 target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
That&#39;s not true.=C2=A0 At minimum, tcg/ uses Error during alloc_code_ge=
n_buffer.<br></blockquote><div><br></div><div>I&#39;m not sure how I overlo=
oked that, so I&#39;ll just drop this patch. Thanks for the</div><div>good =
eye.</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
r~<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c | 2 --<br>
&gt;=C2=A0 =C2=A01 file changed, 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index b5527537b4..7e20430fb7 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -34,7 +34,6 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/config-file.h&quot;<br>
&gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/path.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/help_option.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/module.h&quot;<br>
&gt; @@ -223,7 +222,6 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0save_proc_pathname(argv[0]);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 error_init(argv[0]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_init_cpu_list();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_QOM);<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000065b69805c93c0991--

