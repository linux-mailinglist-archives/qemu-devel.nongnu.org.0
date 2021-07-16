Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DF3CBB6D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 19:52:08 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4S0N-0008AV-Ua
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 13:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4RzD-0006qj-7q
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:50:55 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:42877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4RzA-0000yT-Bi
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:50:55 -0400
Received: by mail-oi1-x234.google.com with SMTP id e11so8764181oii.9
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 10:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f27MJdcnu+t3bRRdPJGfG6Vh94AeRsM2Qhhl1wsm43M=;
 b=uYIbZ7C5eEI8gBsiIAjP5BRh9oyEEfBxL9sxqWQv3ti+uO3y5e2/ijnoHUObsZ7Jox
 a5OOWv4iYuyb2pf70qtRQ3XhW8ELMQMWzZ7t9x0qXjK3dVc/qiUuT0OyZ2OCjvbuxYIE
 01hP6okjSmjnqa23kTBy5x0LlnHA0AEhXxAegNmoX8LrV4aC8uy0J/cSgnlORcS+xJNe
 NE5yOQLONj+Fu91SOYzH6yi7jatOchQdgLIyoo5lzhDbSC8Ns5+VD6GXTBGIxU3uzj1m
 wUtZVZQHAbPowt8EX74p9SOkeCMHYNlnXHsagLcAuf+41iLwpOO2c9gKK17TCZhVwkzH
 xrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f27MJdcnu+t3bRRdPJGfG6Vh94AeRsM2Qhhl1wsm43M=;
 b=srvKRMzv72Aeo9St8kkCsoxNNjOhJnradsobOw7m+/BxxF65jRAqWFUtswjUf7hOA0
 HdnPQjKq+uBEPTOHBL3oqIecYFnBCyXraKiMaYEo9SJfk9k6Xkdm6muLbdkZr8x0DZoV
 9dpYSuLm3Rh0uuFayssX+TZL+CUUiHgCv4ELe2v/EMAS//5l3C2FrU9B8ZOCjPH/5TJH
 KkJ7iYDslwUnC4NkQNy3WWp5Qtf3b226cFiB20K/g2GVBe+j5zLFlAEINjMgkvLYm0ua
 eZnCFzs5H2iNBmUgUVfz9sVsrEx+PUSaLWBrWfTkJS5/c+6xYbqyEL5rt/NWj8p+k6BB
 BtHg==
X-Gm-Message-State: AOAM5304KYFeFXp4ncfZQlseKN33TaZqNU8oI2h2sag9Do00PUnvPS5M
 gOagiwLGp/NndOfaZIYlEB1qyYgry0v7eTB//ew=
X-Google-Smtp-Source: ABdhPJx1LG/26lXAuwvNTcN4WjeWIpsxj+qysb9tDJWO8k5KYOL7WWKTvhTcZHaq5LVDp4eEb0zACTHY8Y3fuFqYDQU=
X-Received: by 2002:aca:43c6:: with SMTP id q189mr12695277oia.81.1626457850180; 
 Fri, 16 Jul 2021 10:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
 <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
 <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
In-Reply-To: <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 16 Jul 2021 12:50:38 -0500
Message-ID: <CAK7rcp-dc7d=4M6STfuWV9=pFTmO_0ST1Cd=7mLBmnxLsp-+NQ@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000066f74505c7413a2e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x234.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000066f74505c7413a2e
Content-Type: text/plain; charset="UTF-8"

There's a lot of files and I don't want to muddy up the discussion with too
many details.

And for sure, this is not a problem with the upstream qemu. I'm working on
adding a target, and this is just what I'm experiencing. As for my target,
it has includes that correspond to finds within sub-directories of qemu
components, and I just mean that the include directives are only the file
name (no path prefix), but such file can be found only in folders other
than the include directory. One example is qemu.h; it is in linux-user. You
can get the compilation to find exactly just that file, but it includes
other files, and it isn't reasonable to edit anything outside of my own
architecture implementation. I'm wondering if perhaps anything that makes
an include to linux-user would need to be moved into the user target source
set, because currently it is in the shared.

On Fri, Jul 16, 2021 at 10:38 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 16 Jul 2021 at 16:16, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> >
> > When I go to build the qemu softmmu target the shared files - the
> i386_ss of my arch - gives problems where the build system isn't specifying
> the include headers for the compiler to find the surrounding headers that
> belong to different parts of the qemu library. I was able to edit my own
> source only so much before recursive header dependencies had included their
> own respective qemu library components subdirectories, at which point the
> build fails with cannot find header. I want to know, are these shared
> source set files not supposed to include those qemu subcomponents? Or
> resolve a different way for each target using #ifdef guards? I would think
> that this would be modularized from within the qemu subcomponent library.
> And I think that configure and meson are working together to generate the
> correct build commands to these shared components. So I'm unsure what to do.
>
> Upstream QEMU builds fine for me, so you'll need to be more
> specific about what you're trying to do and how it fails.
> The top level meson.build always includes the current source
> directory and the top level include/ directory on the compiler
> include path, which should be all you need.
>
> thanks
> -- PMM
>

--00000000000066f74505c7413a2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There&#39;s a lot of files and I don&#39;t want to muddy u=
p the discussion with too many details.<br><br>And for sure, this is not a =
problem with the upstream qemu. I&#39;m working on adding a target, and thi=
s is just what I&#39;m experiencing. As for my target, it has includes that=
 correspond to finds within sub-directories of qemu components, and I just =
mean that the include directives are only the file name (no path prefix), b=
ut such file can be found only in folders other than the include directory.=
 One example is qemu.h; it is in linux-user. You can get the compilation to=
 find exactly just that file, but it includes other files, and it isn&#39;t=
 reasonable to edit anything outside of my own architecture implementation.=
 I&#39;m wondering if perhaps anything that makes an include to linux-user =
would need to be moved into the user target source set, because currently i=
t is in the shared.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Jul 16, 2021 at 10:38 AM Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, =
16 Jul 2021 at 16:16, Kenneth Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When I go to build the qemu softmmu target the shared files - the i386=
_ss of my arch - gives problems where the build system isn&#39;t specifying=
 the include headers for the compiler to find the surrounding headers that =
belong to different parts of the qemu library. I was able to edit my own so=
urce only so much before recursive header dependencies had included their o=
wn respective qemu library components subdirectories, at which point the bu=
ild fails with cannot find header. I want to know, are these shared source =
set files not supposed to include those qemu subcomponents? Or resolve a di=
fferent way for each target using #ifdef guards? I would think that this wo=
uld be modularized from within the qemu subcomponent library. And I think t=
hat configure and meson are working together to generate the correct build =
commands to these shared components. So I&#39;m unsure what to do.<br>
<br>
Upstream QEMU builds fine for me, so you&#39;ll need to be more<br>
specific about what you&#39;re trying to do and how it fails.<br>
The top level meson.build always includes the current source<br>
directory and the top level include/ directory on the compiler<br>
include path, which should be all you need.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000066f74505c7413a2e--

