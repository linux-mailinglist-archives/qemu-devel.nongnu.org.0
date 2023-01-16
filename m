Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC266D039
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 21:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHW8c-0005Ce-OZ; Mon, 16 Jan 2023 15:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHW8a-0005C5-Vt
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:31:25 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHW8Z-0003Ce-Av
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:31:24 -0500
Received: by mail-ed1-x52b.google.com with SMTP id b4so22735654edf.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 12:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VHgOQA3BNk24gr3V2X60PUpMgNLC21aEXTYuWMCUDrI=;
 b=ouNYoCZpxxiMdjAnYM+B55dLCuRJ4UJmcC0GRfiTY7Ugwegon9F4Xm6IO66s4CY4LO
 sDJlwneF7n1qmlWVYatbpByC11U53j1rTZWdN1hyry47n4rOEuAipMRktT14xE1taF27
 I08gX7GxW8JZasDwtCpjtcNfgEGNd3xv85W8XzleT10Ea3wmwgMxaJkL6JEVTt6XjjRZ
 rnhXYID69HHWmZpPv1OmwTnGgxxukgaIJvcI+IRd+0CAen4C9XwH5DiIN7iN4LCaDKOG
 SfT0kokw+UVuzw2Qa+b8Op+4/j2B6wWoeK6f89YzTkm2Yk8mqGgaNPP61ckGxcwfxQKI
 zT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHgOQA3BNk24gr3V2X60PUpMgNLC21aEXTYuWMCUDrI=;
 b=4XXH6OzkEnglKdqYKOe2uU6VFG0+ngjrrCOiNDaKc9Ds6/y439z3TRcePhbAnc402X
 7NKSyrFGaAQdCyt3zi7zDv1HlYKa7o/o0qwwsz0VsG4a4x2+EnQvt1jdCVNR1FuWaq5Z
 /Q+DrBtJMXBGHdgAnjRuo0aabGGF6kcBE2gp0wdbbP8MLu3BBz0hAiFc+4SB4+ZMR7XH
 qjOfoLEen5DsufNc+XGydP6ImnsRhZPeRpEaMG8nwQpbjKo3sE+4PIh5FQMRK/4JCiMg
 oGXKRY9gy5O+kHgg6RGv5DaAUcU0BsGCLMuJSwOf5VaiKEp90sRUC0JQ6leLzvsidcYS
 XMOA==
X-Gm-Message-State: AFqh2krvRMY7ovHuvWeS0xPkEWcHBlbncs9SvamteKpFR0M90Prp5OjP
 v0agvIfyEEYXk7qI3geowsv5Qkw3GXAkggcoluqQEQ==
X-Google-Smtp-Source: AMrXdXtfo3RybHMe60CTzfQSzmyqFXFC+olfS/8y5E4sA9buxNrn0/F9uhTBHHmp1vNiKdP2GAEBS8hZei1UVKP/rww=
X-Received: by 2002:aa7:da13:0:b0:485:59b5:d8c9 with SMTP id
 r19-20020aa7da13000000b0048559b5d8c9mr75494eds.285.1673901081273; Mon, 16 Jan
 2023 12:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20230116173233.2948746-1-alex.bennee@linaro.org>
 <ad966746-62c3-0e96-ae43-b6ddd7dd8ce1@linaro.org>
In-Reply-To: <ad966746-62c3-0e96-ae43-b6ddd7dd8ce1@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Mon, 16 Jan 2023 20:31:09 +0000
Message-ID: <CAHDbmO2L1G=q8=p3FPjpjVd2Ss+CkoyfCPoBV5Eg_v+AuNatfg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/tcg: skip the vma-pthread test on CI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000056c40e05f26777f2"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000056c40e05f26777f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did consider it but it would involve messing about with filter to remove
the test from the wildcards. This way we don't forget about it when looking
through the logs.

I've not been able to get this to fail on any other machine though. It's
been rock solid over several thousand runs.

On Mon, 16 Jan 2023, 19:25 Richard Henderson, <richard.henderson@linaro.org=
>
wrote:

> On 1/16/23 07:32, Alex Benn=C3=A9e wrote:
> > diff --git a/tests/tcg/multiarch/Makefile.target
> b/tests/tcg/multiarch/Makefile.target
> > index e7213af492..ae8b3d7268 100644
> > --- a/tests/tcg/multiarch/Makefile.target
> > +++ b/tests/tcg/multiarch/Makefile.target
> > @@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=3D-pthread
> >   vma-pthread: CFLAGS+=3D-pthread
> >   vma-pthread: LDFLAGS+=3D-pthread
> >
> > +# The vma-pthread seems very sensitive on gitlab and we currently
> > +# don't know if its exposing a real bug or the test is flaky.
> > +ifneq ($(GITLAB_CI),)
> > +run-vma-pthread: vma-pthread
> > +     $(call skip-test, $<, "flaky on CI?")
> > +run-plugin-vma-pthread-with-%: vma-pthread
> > +     $(call skip-test, $<, "flaky on CI?")
> > +endif
> > +
>
> Ok I guess.  I'd have thought the ifdef around the entire mention of the
> test would be
> better -- no point in even building it.  But,
>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>

--00000000000056c40e05f26777f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I did consider it but it would involve messing about with=
 filter to remove the test from the wildcards. This way we don&#39;t forget=
 about it when looking through the logs.<div dir=3D"auto"><br></div><div di=
r=3D"auto">I&#39;ve not been able to get this to fail on any other machine =
though. It&#39;s been rock solid over several thousand runs.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1=
6 Jan 2023, 19:25 Richard Henderson, &lt;<a href=3D"mailto:richard.henderso=
n@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 1/16/23 07:32, Alex Benn=C3=A9e wrote:<br>
&gt; diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch=
/Makefile.target<br>
&gt; index e7213af492..ae8b3d7268 100644<br>
&gt; --- a/tests/tcg/multiarch/Makefile.target<br>
&gt; +++ b/tests/tcg/multiarch/Makefile.target<br>
&gt; @@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=3D-pthread<br>
&gt;=C2=A0 =C2=A0vma-pthread: CFLAGS+=3D-pthread<br>
&gt;=C2=A0 =C2=A0vma-pthread: LDFLAGS+=3D-pthread<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# The vma-pthread seems very sensitive on gitlab and we currently<br>
&gt; +# don&#39;t know if its exposing a real bug or the test is flaky.<br>
&gt; +ifneq ($(GITLAB_CI),)<br>
&gt; +run-vma-pthread: vma-pthread<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call skip-test, $&lt;, &quot;flaky on CI?&quot;=
)<br>
&gt; +run-plugin-vma-pthread-with-%: vma-pthread<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call skip-test, $&lt;, &quot;flaky on CI?&quot;=
)<br>
&gt; +endif<br>
&gt; +<br>
<br>
Ok I guess.=C2=A0 I&#39;d have thought the ifdef around the entire mention =
of the test would be <br>
better -- no point in even building it.=C2=A0 But,<br>
<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>&=
gt;<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000056c40e05f26777f2--

