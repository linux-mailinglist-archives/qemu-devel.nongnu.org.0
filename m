Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD255B4432
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 07:12:55 +0200 (CEST)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWsnV-0004la-Rg
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 01:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oWskk-000201-Js
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 01:10:04 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oWski-0002SG-V9
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 01:10:02 -0400
Received: by mail-ua1-x931.google.com with SMTP id a18so1320058uak.12
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 22:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UHaia8dj64JKL3YKf1HjXplk0avGsF74GpK2v+vt6fE=;
 b=Y1WfD224Dqwe2CVBUTKK6Jsb51xHDYbwQ0AtK2wNUiOpLz3ePZtdkzJzZGcDzY16kv
 b8pZpU3aNnFTc0G6lAoAAlAHXmPxqV6EPO+B6xIfAL9zLOmFut/YlGCbDm1oLJ9ouSmf
 uBX13anfEr9R2ToLusJ/tZkho0Kza5UfEYCoyG3dQiAOXzEZw89YPPo9mIvbqnssIIpE
 sYvCOtshgBDAZgajNdQcCGzdxFY2h+AFBIx4Vypa2JffR/jxqpxa2PUOH/uIfpTWy+LW
 6fkGvCSU+S2UZgC7YgnfmIUTH+MR1ZTkblQE0Z9PiTI6UVga3fEdm6nv0SUXvfvwNLGe
 9qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UHaia8dj64JKL3YKf1HjXplk0avGsF74GpK2v+vt6fE=;
 b=cbOdmKwPnN8CHwvmMQoO5iXBmzx+tRtzU9X9do59ko818MxIKyjKTlvIxR8JkXWy/w
 hnvm3IFf968KkQyogIDQXTZuGoq6c0pbu+0hD71C3vu+rmEk2I5Q8D2gI5KiJBrx3TrT
 eRCnZTVbl+rjBCi/Rwpujf3FBkig87HaOgtjOtp2CQRKunHCf5WDIDQV22rg/kgGir9S
 gsaSiU322LnJYpsMHHhvo/Tdp+bRYEKAwKInIl0Jx3117hrGHJIX6JGInKJnWev2lWUR
 yq9tvZg1RpvdKCVWf14CRa/NBWI70oRyEmlC4eHxQuVFmVnqbksD7jYvmQx5qA6cSsN0
 7NyA==
X-Gm-Message-State: ACgBeo0HBaPeg77kgNaywukJihIZFxdDTSb4laepxkJBXqFnk/fdGelR
 CIuAzIfkSgEzJtV6qBaY6DXPlBCxmOwNXWY5BGU=
X-Google-Smtp-Source: AA6agR61kjrt03clpk+8fMgyLKg932Cu8OBFoDfh3zJVBGBTQyxBVqHvBP7nvREI8kRPKnF05YB6XYniBT0rxwjq+JQ=
X-Received: by 2002:ab0:54d6:0:b0:39f:8376:cdb2 with SMTP id
 q22-20020ab054d6000000b0039f8376cdb2mr6129642uaa.75.1662786599420; Fri, 09
 Sep 2022 22:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-7-bmeng.cn@gmail.com>
 <85f915c4-938c-8a23-a4c2-01fba0f87b63@redhat.com>
 <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
In-Reply-To: <CAEUhbmVNNuSRgjHiewKhqOifTF2_Rzn+8uUNphay6aXRYHg=kw@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 10 Sep 2022 13:09:49 +0800
Message-ID: <CAE2XoE8ewwQ+5CgS8rDYemnu9+3BqZcZYMG5Y46rK5r6zOTAog@mail.gmail.com>
Subject: Re: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009887a305e84bac02"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009887a305e84bac02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How about using github actions, I tried before and it's running fast, there
is no resource restriction.
Just don't know how to trigger it through gitlab, if that's possible, then
it's would be good

On Sat, Sep 10, 2022 at 8:33 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Sep 10, 2022 at 12:32 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 08/09/2022 15.28, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present the prerequisite packages for 64-bit and 32-bit builds
> > > are slightly different. Let's use the same packages for both.
> >
> > Not sure whether that's a good idea ... I did that on purpose to save
some
> > few time during compilation (since the Windows jobs are running very
long
> > already) ... did you check whether it makes a difference in the run
time now?
> >
>
> Not much difference on the build time. Actually I found after we
> switched to single thread build the time did not increase too.
>
> One side note regarding the gitlab shared runner:
>
> It seems the shared runner Windows VM is quite slow. Is it possible to
> get a faster VM externally?
>
> Regards,
> Bin
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000009887a305e84bac02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How about using github actions, I tried before and it&#39;=
s running fast, there is no resource restriction.<br>Just don&#39;t know ho=
w to trigger it through gitlab, if that&#39;s possible, then it&#39;s would=
 be good<br><br>On Sat, Sep 10, 2022 at 8:33 AM Bin Meng &lt;<a href=3D"mai=
lto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; O=
n Sat, Sep 10, 2022 at 12:32 AM Thomas Huth &lt;<a href=3D"mailto:thuth@red=
hat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; On 08/09=
/2022 15.28, Bin Meng wrote:<br>&gt; &gt; &gt; From: Bin Meng &lt;<a href=
=3D"mailto:bin.meng@windriver.com">bin.meng@windriver.com</a>&gt;<br>&gt; &=
gt; &gt;<br>&gt; &gt; &gt; At present the prerequisite packages for 64-bit =
and 32-bit builds<br>&gt; &gt; &gt; are slightly different. Let&#39;s use t=
he same packages for both.<br>&gt; &gt;<br>&gt; &gt; Not sure whether that&=
#39;s a good idea ... I did that on purpose to save some<br>&gt; &gt; few t=
ime during compilation (since the Windows jobs are running very long<br>&gt=
; &gt; already) ... did you check whether it makes a difference in the run =
time now?<br>&gt; &gt;<br>&gt;<br>&gt; Not much difference on the build tim=
e. Actually I found after we<br>&gt; switched to single thread build the ti=
me did not increase too.<br>&gt;<br>&gt; One side note regarding the gitlab=
 shared runner:<br>&gt;<br>&gt; It seems the shared runner Windows VM is qu=
ite slow. Is it possible to<br>&gt; get a faster VM externally?<br>&gt;<br>=
&gt; Regards,<br>&gt; Bin<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br=
>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div>

--0000000000009887a305e84bac02--

