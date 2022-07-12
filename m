Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A82571D6C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:57:14 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBHK5-0005cL-BE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHCZ-0006DR-2d
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:49:30 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oBHCX-0006LA-18
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:49:26 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id y129so3866005vkg.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t39y0t23UrrGQAsNOwVWkCgBKt6eLMWJprdWfigtIVk=;
 b=PJlFNEOOn4Bf8VHWSxJ3cX9uxraM/EhkSOoJLYwivFmRXiLUThcpyS3Oo4YaBk9PUw
 8XpUsAr/QEjzM2cvfPGjk/pw98BytfOQsLOIKzU6SLru6mqHIyDOU9h5DxJm1fQmMCoB
 WY7Wl1gG/YK/jnPQflJNbJd4OkbOLjETVYUYhMw4f8p1a7eVX5whI67L/bsMXqv5+XUN
 H3k4KSM0L1FyCrzOgr2oTUE762hN4PG1M6Kc7A/iLD4qOfw6r67autHECY7yamXwOu1N
 mkkZDUWjUo73l3NLqf4iBkI5XgTIOKON2c/7GMQrzNNZ6UQbrUASBGkuB9vxh+I5kagq
 kXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t39y0t23UrrGQAsNOwVWkCgBKt6eLMWJprdWfigtIVk=;
 b=44/hH3hXcblPGjhLRHZdT3XGkuA7Ius26EHyR2/EY5a9Vcqwhq4laMskrUrmLKKOI6
 ekTsZ2O6wAM/BXoeVZpHwmnubHUGHM14xhBYFG8KU+iFED1WWqCfTzPe9eCB57XU9fID
 ZGjtjwJ43tfzHBf6PzH2pHIkSLBHRBqRMpfa6fmxfIWe8bwz7n1ZiQm5YzIHD8kEOf4j
 iAJgPoULJpj48aDWzEODniJ4e0TJjJT8rpXyRVJd2msc7KdVrv56s0dL0ySK9xDe24ct
 0bzrmO3pe7YDDnRp6V2CVUzHyPvJy+jvgu8hvMyBgpkULWk0ECKoxeDm7Apbnrbx/xvb
 b3tA==
X-Gm-Message-State: AJIora9xWx4JF1M3ETHsJqRQSJ+zW6QMmAoz8sCFuElkaCIsZddpDdbT
 TeCfCevvGquOdIiPjCJZO5KXq3TCb6bdL2TuIFtK0w==
X-Google-Smtp-Source: AGRyM1su8b0JlxX663lgoh6L5XFyXG7IlVxWw6xDYX9QgoS5QajFW2lsU3fHpagorVRLcrleYUJ29zFEtzGhFOOGPDo=
X-Received: by 2002:a1f:9d8d:0:b0:36c:99e3:9c34 with SMTP id
 g135-20020a1f9d8d000000b0036c99e39c34mr8602554vke.10.1657637362646; Tue, 12
 Jul 2022 07:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220712095901.212353-1-richard.henderson@linaro.org>
 <Ys1JMetNPT47lpbV@redhat.com>
 <d9bd8b54-868a-6f0e-09b9-754f23c12cbb@linaro.org>
 <Ys1Ncx+gyEBw/uIM@redhat.com>
In-Reply-To: <Ys1Ncx+gyEBw/uIM@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 12 Jul 2022 08:49:11 -0600
Message-ID: <CANCZdfqBu6RZTYMzPy4J3O+oVn5cw11rKg-eiFGDx7CpthF5aQ@mail.gmail.com>
Subject: Re: [COMMITTED 0/3] build fixes
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002ad44505e39cc6ed"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000002ad44505e39cc6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 4:33 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Jul 12, 2022 at 03:56:54PM +0530, Richard Henderson wrote:
> > On 7/12/22 15:43, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Jul 12, 2022 at 03:28:58PM +0530, Richard Henderson wrote:
> > > > This is a collection of fixes required to get CI back to green.
> > > > Given that 2 of 3 apply to cirrus, I had to push them to staging to
> > > > even try them.  Since it worked, I've now pushed them to master.
> > >
> > > FWIW, it is possible to test Cirrus CI fixes in your own personal
> > > fork too, but it needs a little extra setup first, detailed in
> > >
> > >    .gitlab-ci.d/cirrus/README.rst
> >
> > How many of the 'github' strings therein should really be 'gitlab'?
>
> None actually, this is all part of the (gross) hack. Cirrus CI officially
> only integrates with GitHub, so we need a dummy GitHub repo there. Once
> the job starts though, it actually pulls the real code from gitlab.
>

Yea, fun times that hack... :(

Warner

--0000000000002ad44505e39cc6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 4:33 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Jul 12, 2022 at 03:56:54PM +0530, Richard Henderson wrote:<br=
>
&gt; On 7/12/22 15:43, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; On Tue, Jul 12, 2022 at 03:28:58PM +0530, Richard Henderson wrote=
:<br>
&gt; &gt; &gt; This is a collection of fixes required to get CI back to gre=
en.<br>
&gt; &gt; &gt; Given that 2 of 3 apply to cirrus, I had to push them to sta=
ging to<br>
&gt; &gt; &gt; even try them.=C2=A0 Since it worked, I&#39;ve now pushed th=
em to master.<br>
&gt; &gt; <br>
&gt; &gt; FWIW, it is possible to test Cirrus CI fixes in your own personal=
<br>
&gt; &gt; fork too, but it needs a little extra setup first, detailed in<br=
>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 .gitlab-ci.d/cirrus/README.rst<br>
&gt; <br>
&gt; How many of the &#39;github&#39; strings therein should really be &#39=
;gitlab&#39;?<br>
<br>
None actually, this is all part of the (gross) hack. Cirrus CI officially<b=
r>
only integrates with GitHub, so we need a dummy GitHub repo there. Once<br>
the job starts though, it actually pulls the real code from gitlab.<br></bl=
ockquote><div><br></div><div>Yea, fun times that hack... :(</div><div><br><=
/div><div>Warner=C2=A0</div></div></div>

--0000000000002ad44505e39cc6ed--

