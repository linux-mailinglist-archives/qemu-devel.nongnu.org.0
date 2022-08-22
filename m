Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7659C29A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:24:23 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9Hq-0001Lq-6R
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oQ95N-0001Ms-3H; Mon, 22 Aug 2022 11:11:30 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oQ95K-00046M-J2; Mon, 22 Aug 2022 11:11:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p9so9542734pfq.13;
 Mon, 22 Aug 2022 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LCl7iY+XuHJND3hMaH/fStJOH/7IAPHpnJ8+UdbkDkE=;
 b=LH9wWHI0CHPoR5+EgkL1hdowT1fbNEXlmBl385z6q1HHVvl7mpbaLsk9k4TDsDWCH7
 XfduIx7oHswhsYLP5fKvfIF0TgKMjCTK9R8t4FPkCFZRMB1Q5V/hFs392P7IacaK7iHV
 gJJAp2AxvwrFGL/DXocrZHH/tTgEy1YBKFgmTQS9GtEeEaBIVSQ/P/nBTGzQridyThLI
 Q6ZXaXZ7ZVY2DqOFyHRbbffnjSimtrkud+Rm6r6L8iHbteUKC5F72R7g/1R6HMzW/TZb
 MGGqW8BLq8nZuEfgsUr3wF4+W+1SkUlWekYUvqGAAxLKGBG189ensAcL02rJ37LiiQOn
 cb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LCl7iY+XuHJND3hMaH/fStJOH/7IAPHpnJ8+UdbkDkE=;
 b=QQ3XvNRL1oxFDOrthuKinip3TXMUAXKcYJKqooIdb66ogrHNikqSxY0STv4NRsauBq
 XCmHOHnzlKTvAjoQauIBM5I5m10kA2osAu0xAD1eqn1xmKGRfaEAYqrtr82H3WuMsS4D
 M3edvVtvmN7jc3/IobUkuSOQYyo2ySj8LIDy40ZkemggF7I1ujSsFH7hcWy+/05z4spC
 CPt851wmiKmA82UKhHY6Jkjrp28LQFYDMXEh8OqG3PgdB4Cos00M1476x1xhgV4bgikj
 3k26sL5r71gS9TmPbnoES3bA2zYgb9h/WQ6DfhoyjDIwiW9XuL2s5dGtXTDfN7B0iFAn
 A9gg==
X-Gm-Message-State: ACgBeo3u2tdbldLw7Zd07WZ2G/Vx05A7pHlysb+Hbw8LeJYs4E6NLSnP
 6cAUKwD2a63edH4LA95rYg5/CvLzooRELYCyyoM78zBo
X-Google-Smtp-Source: AA6agR5mdxp8r82hWn46KfUm1Pad4ZefZ8JBjrkHTf7G63Tiv0mqisCcvHbC6SwT4MuFxKWl+cptOmxhhdGChwE7PnY=
X-Received: by 2002:a67:c819:0:b0:38f:784f:c377 with SMTP id
 u25-20020a67c819000000b0038f784fc377mr7013054vsk.15.1661179196134; Mon, 22
 Aug 2022 07:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220728200422.1502-1-luoyonggang@gmail.com>
 <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
 <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
 <2ac21034-c728-04ad-cb33-07870c1f0cc3@redhat.com>
 <YwNUMLxx2HqWUCXs@redhat.com>
In-Reply-To: <YwNUMLxx2HqWUCXs@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 22 Aug 2022 22:39:44 +0800
Message-ID: <CAE2XoE9ALbmwDt9=25HewGBBNN0Z=4sJV+4BMkcowCFuWfXkGQ@mail.gmail.com>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e4d94205e6d56bd8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x42b.google.com
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

--000000000000e4d94205e6d56bd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After digging, it seems to be a memory issue, cirrus also uses 8gb, that's
rather weird...

On Mon, Aug 22, 2022 at 6:02 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:
>
> On Fri, Aug 19, 2022 at 09:50:20AM +0200, Thomas Huth wrote:
> > On 16/08/2022 20.53, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> > > I have reason to think that's msys2-64 bit failed because out of
memory
> > >
> > > I tried to show the memory size of the windows docker, it's result
> > > are 6224352KB, that's less than 6GB?
> > > https://gitlab.com/lygstate/qemu/-/jobs/2891399652
> > > <https://gitlab.com/lygstate/qemu/-/jobs/2891399652>
> > >
> > > Can we increase the memory size to 16GB
> >
> > I'm not aware of any way to increase the memory size for gitlab jobs ..=
.
> > Daniel, Alex, do you maybe know?
>
> I don't bvelieve there's any option
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
https://www.instagram.com/dberrange :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000e4d94205e6d56bd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After digging, it seems to be a memory issue, cirrus also =
uses 8gb, that&#39;s rather weird...<br><br>On Mon, Aug 22, 2022 at 6:02 PM=
 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrang=
e@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On Fri, Aug 19, 2022 at 09:50:2=
0AM +0200, Thomas Huth wrote:<br>&gt; &gt; On 16/08/2022 20.53, =E7=BD=97=
=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:<br>&gt; &gt; &gt; I have reason to =
think that&#39;s msys2-64 bit failed because out of memory<br>&gt; &gt; &gt=
;<br>&gt; &gt; &gt; I tried to show the memory size of the windows docker, =
it&#39;s result<br>&gt; &gt; &gt; are 6224352KB, that&#39;s less than 6GB?<=
br>&gt; &gt; &gt; <a href=3D"https://gitlab.com/lygstate/qemu/-/jobs/289139=
9652">https://gitlab.com/lygstate/qemu/-/jobs/2891399652</a><br>&gt; &gt; &=
gt; &lt;<a href=3D"https://gitlab.com/lygstate/qemu/-/jobs/2891399652">http=
s://gitlab.com/lygstate/qemu/-/jobs/2891399652</a>&gt;<br>&gt; &gt; &gt;<br=
>&gt; &gt; &gt; Can we increase the memory size to 16GB<br>&gt; &gt;<br>&gt=
; &gt; I&#39;m not aware of any way to increase the memory size for gitlab =
jobs ...<br>&gt; &gt; Daniel, Alex, do you maybe know?<br>&gt;<br>&gt; I do=
n&#39;t bvelieve there&#39;s any option<br>&gt;<br>&gt; With regards,<br>&g=
t; Daniel<br>&gt; --<br>&gt; |: <a href=3D"https://berrange.com">https://be=
rrange.com</a> =C2=A0 =C2=A0 =C2=A0-o- =C2=A0 =C2=A0<a href=3D"https://www.=
flickr.com/photos/dberrange">https://www.flickr.com/photos/dberrange</a> :|=
<br>&gt; |: <a href=3D"https://libvirt.org">https://libvirt.org</a> =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -o- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"https://fstop138.berrange.com">https://fstop138.berrange.com</a> :|<br>=
&gt; |: <a href=3D"https://entangle-photo.org">https://entangle-photo.org</=
a> =C2=A0 =C2=A0-o- =C2=A0 =C2=A0<a href=3D"https://www.instagram.com/dberr=
ange">https://www.instagram.com/dberrange</a> :|<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div>

--000000000000e4d94205e6d56bd8--

