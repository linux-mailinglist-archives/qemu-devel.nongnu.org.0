Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419E5351F0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 18:23:23 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuGGf-0005OZ-TV
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 12:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nuGEp-0003nc-T9
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:21:27 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nuGEl-0006HO-MW
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:21:27 -0400
Received: by mail-vs1-xe34.google.com with SMTP id c62so1861438vsc.10
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J100SEPKQyXjVRHZ+aN2Puog2bHT17/VIJf6A0OpCcI=;
 b=YIL6N+lOy5P3rVT1mHmm9RBuvusq/tLrOC2q+4GIwdQ/wtEMLGsjTTjAB8cQnpvtaJ
 tOJXU+nw/XfiZzFyeIQLheOx+0FY8zZxupudkZGtW+Y7HKz1XpIzcSHISYZCRNQmmAdd
 DprRIctG3p1LWLN0ks88cEmjLzjNSjHzGCTFiScs37+ujaNh5hm4kB0VLago9ee5TypD
 WA/bh3Q3qncZRappHcDEYC8aqD13fRT/zflBb6lNdKGusLsHyetkGu+cCYxtXW2T4Q3m
 maTjVf6jW3e3MVrq/IiM7Y84c4ogFlbP/o/w8YWEYAx/Ni2wBw+eYSGpgbuAfN4NXTrQ
 sNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J100SEPKQyXjVRHZ+aN2Puog2bHT17/VIJf6A0OpCcI=;
 b=I8XwJfpU9Mh48M3ZTb7SVL07c9GMP4IM3uTZEmiuuzgy3jaqtj9HriESIQup37+1ky
 mZhDa6tGWmatiJD+/UFNNVJTlH7PfF6Sb1CrtnfFLvAZFJVAReAYfB5Dnkn0r4kTO0MP
 HK4zYEIz3QhIztNt9rCy9IKY5o6St+ds2wL34hu0OtEQJSZiU3TBNgQGTq0bZlE1wswK
 3U6OgagQfg/Lf/yTV2DCLLrCG31GVXwa0vQtEsYfYVcv3lcwFL1Acms7m2wAE0mSOdLc
 U5OJORt+ZTof90gynHNbhXeXfwQru1bsPfbnqVMGWq1OnnLihhefb8ZdJ5AARY4/EkF7
 DzBA==
X-Gm-Message-State: AOAM533ESWFTTQgX4GXVABrnEal5Mjz6+5Wlz0HLWQwjU7ONi3ej1mzO
 h8fjzuKjV39T+RQwB0vzBXdFVUdSG7KZbu4o0L4f+A==
X-Google-Smtp-Source: ABdhPJznXuZswspN+hq98/vjYj/ijE+A9BAZ17KLV6a4MkpYxXf47aAzHjFFJuEbExsJzbLkrnxyHH1CvdooYyb19Dg=
X-Received: by 2002:a05:6102:1622:b0:337:b6b2:f715 with SMTP id
 cu34-20020a056102162200b00337b6b2f715mr8868821vsb.35.1653582081744; Thu, 26
 May 2022 09:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
 <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
In-Reply-To: <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 26 May 2022 09:21:10 -0700
Message-ID: <CAO=notyz+SjAoomWGubV5pBuc4qSmNdJF5cmMBf7J8DevF9T4A@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Chris Rauer <crauer@google.com>, 
 Shengtan Mao <stmao@google.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097609905dfec94bc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=venture@google.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000097609905dfec94bc
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > From: Shengtan Mao <stmao@google.com>
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Chris Rauer <crauer@google.com>
> > Signed-off-by: Shengtan Mao <stmao@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
>
> Hi; John Snow tells me that this test fails in the tests/vm/netbsd
> VM (you can test this with 'make vm-build-netbsd') because the
> assert() on the ftruncate() call fails:
>
> > +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> > +    g_assert_cmpint(ret, ==, 0);
>
> > +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
>
> I haven't investigated the exact cause, but this is a
> gigabyte, right? That's a pretty massive file for a test case to
> create -- can we make the test use a more sensible size of
> sd card image ?
>

It looks like the nuvoton part had an issue with a smaller image size, but
we can resurrect that thread and poke at it a bit and see what shakes out.


>
> thanks
> -- PMM
>

--00000000000097609905dfec94bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at 8:54 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, 25 Feb 2022 at 17:45, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@g=
oogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_=
blank">stmao@google.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" ta=
rget=3D"_blank">stmao@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
<br>
Hi; John Snow tells me that this test fails in the tests/vm/netbsd<br>
VM (you can test this with &#39;make vm-build-netbsd&#39;) because the<br>
assert() on the ftruncate() call fails:<br>
<br>
&gt; +=C2=A0 =C2=A0 ret =3D ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpint(ret, =3D=3D, 0);<br>
<br>
&gt; +#define NPCM7XX_TEST_IMAGE_SIZE (1 &lt;&lt; 30)<br>
<br>
I haven&#39;t investigated the exact cause, but this is a<br>
gigabyte, right? That&#39;s a pretty massive file for a test case to<br>
create -- can we make the test use a more sensible size of<br>
sd card image ?<br></blockquote><div><br></div><div>It looks like the nuvot=
on part had an=C2=A0issue with a smaller image size, but we can resurrect t=
hat thread and poke at it a bit and see what shakes out.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000097609905dfec94bc--

