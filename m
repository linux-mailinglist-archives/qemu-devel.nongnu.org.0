Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122A6A8CB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 00:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXryp-00055S-5L; Thu, 02 Mar 2023 18:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suda.kyoto@gmail.com>)
 id 1pXryj-00054b-Nq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:04:51 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suda.kyoto@gmail.com>)
 id 1pXryh-00014M-Qy
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:04:49 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id v13so498403ybu.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 15:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677798286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jiVQQTut4EMQ4zfFcxAGvC9dloQ2Amaa4NZb7myZiBo=;
 b=UZE6/JXQqUxqZJSWH0jy6sYZ44eO0z6xaUbqfO5ZVF3oe6g7cQrlOyTSADOTEEeGi+
 QaAFiAgBOGmVcZqXJB8ZoH4xpGr3I+5lfwefG59CTe4cE8wZUA0ESJEvUZm7NinhJo2f
 NST2h/5JUG0Fi4zY7WpuSvLYp5SkEokFuHMqF6KJF8AS3KpuJyGyxWOmnxG4IqyVimfY
 LHXPciz2oU/pYyG2VX4jDT2JnwNz7oFNB86k7PpxRzQWys0302ZpEcafkolM8Oap7de9
 Y6cSage0c+hsDK3j3d93DdXtyn+WDMpZ/CXJG9gS2yc7hTsdzfVCHxzy3dhI4qQ8lJyE
 8uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677798286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiVQQTut4EMQ4zfFcxAGvC9dloQ2Amaa4NZb7myZiBo=;
 b=VQVGh6CtzcHy95JVZZe1klZkvIj15R6hpU4f2x4+T2zYsKnD6q1FCSEHLwCmcQn9H1
 pw4fUySP3psRP87jDMGvcsd73eS2qjuM8rs9SMAnHoYj+0wWGI9/ZOnXWECbkhn+rLFC
 pbzEZVuVkExVEUbHDxbuuJjEYN6P5nLO99WRCq8dQ/PMhHFONSNxL8bBL1gMAI9bWhIq
 Xxh0HGHmjiUZYnYY3trT42hMh80mb9Y9iec5/IkKi9Zp0ItODC5QbgW7bRUZ2TMLE0SZ
 T16ORxojKqPPMetaqEj9ZmQpGeYrX78Qv2sAuwFNnZNG+i33PB5cMSE0YzhYu1m4SY4h
 VJkw==
X-Gm-Message-State: AO0yUKUcFM8iVEnGSXxAQ0iwiJ7z8fAtbzxPdvIxi2ILYhcoMUPPnBbz
 FP0t24/Mgn7FlXISEJvDtZZ2cj+QFwQgO0lshIY=
X-Google-Smtp-Source: AK7set/iMIrczhb0Hlh4STsohUUfkW75aQ6ExRNE1tFUKlQCmHidDhg6sv4rEDdNQuKtvvVWjbCPxw7V89no8A1Zh+8=
X-Received: by 2002:a5b:685:0:b0:8de:ddd5:7f8e with SMTP id
 j5-20020a5b0685000000b008deddd57f8emr5379264ybq.4.1677798285700; Thu, 02 Mar
 2023 15:04:45 -0800 (PST)
MIME-Version: 1.0
References: <CAG8fp8S4AErtJ5YjpmW5d7+sRSyqQp+Th6NrJRm248gohNwCiw@mail.gmail.com>
 <87zg8v9j8n.fsf@linaro.org>
In-Reply-To: <87zg8v9j8n.fsf@linaro.org>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Fri, 3 Mar 2023 08:04:34 +0900
Message-ID: <CAG8fp8RZ29JSKkWAKFhu0nedaosaYTU7NBFEY-zJaNU=ic9iJA@mail.gmail.com>
Subject: Re: [PULL v2 20/24] tests/docker: use direct RUNC call to build
 containers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d2f17905f5f2dadd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=suda.kyoto@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000d2f17905f5f2dadd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> No RUNC is defined in config-host.mak now because it can be docker or
podman.

I feel $(RUNC) isn't the right variable name as it can't be set to "runc".

If $(DOCKER) is not preferable either, $(CONTAINER_ENGINE) might be a
better name.
https://github.com/search?l=3DMakefile&q=3D%24%28CONTAINER_ENGINE%29&type=
=3DCode


2023=E5=B9=B43=E6=9C=883=E6=97=A5(=E9=87=91) 2:05 Alex Benn=C3=A9e <alex.be=
nnee@linaro.org>:

>
> Akihiro Suda <suda.kyoto@gmail.com> writes:
>
> >> +               $(RUNC) build                           \
> >
> > There is no `runc build` command.
> > Perhaps you meant `$(DOCKER) build`?
>
> No RUNC is defined in config-host.mak now because it can be docker or
> podman.
>
> >
> > Regards,
> > Akihiro Suda
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000d2f17905f5f2dadd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; No RUNC is defined in config-host.mak now becaus=
e it can be docker or</div>podman.<div><br><div>I feel $(RUNC) isn&#39;t th=
e right variable name as it can&#39;t be set to &quot;runc&quot;.</div><div=
><br></div><div>If $(DOCKER) is not preferable either, $(CONTAINER_ENGINE) =
might be a better name.</div><div><a href=3D"https://github.com/search?l=3D=
Makefile&amp;q=3D%24%28CONTAINER_ENGINE%29&amp;type=3DCode">https://github.=
com/search?l=3DMakefile&amp;q=3D%24%28CONTAINER_ENGINE%29&amp;type=3DCode</=
a><br></div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2023=E5=B9=B43=E6=9C=883=E6=97=A5(=E9=87=91) 2:05 Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
Akihiro Suda &lt;<a href=3D"mailto:suda.kyoto@gmail.com" target=3D"_blank">=
suda.kyoto@gmail.com</a>&gt; writes:<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(RUNC) bu=
ild=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;<br>
&gt; There is no `runc build` command.<br>
&gt; Perhaps you meant `$(DOCKER) build`?<br>
<br>
No RUNC is defined in config-host.mak now because it can be docker or<br>
podman.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Akihiro Suda<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div></div></div>

--000000000000d2f17905f5f2dadd--

