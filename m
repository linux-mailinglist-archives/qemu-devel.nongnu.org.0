Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF22FFDCE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:03:05 +0100 (CET)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2rPM-0006u1-6k
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l2rNB-0006Fz-UL
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:00:50 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:35268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l2rMy-0006Mi-Fu
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:00:47 -0500
Received: by mail-lj1-x22e.google.com with SMTP id p13so5527898ljg.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 00:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=eBnEIsSpdvtaAulcwb60egXtJXLbKdgq5l9EgYQnFNY=;
 b=vf50v8XQIysiJ9g0xpT2hTvm/ED+jdhI0b0b3HL7DWcBakpYCGB2Av+QLaAXvObefS
 1Sqhp41mi1cfQV+JCzAko7z9lTgUeRBMJ+S4YP9zYRHVTb/jhvzUZWBb4IdumW/2WyMf
 mR3J5z3LKetqd8Vw3jk2+RQaNdqdeaekc+iliKP3XmMbwsc5LFXMz0nSE1q/39IZvTBk
 Ep3mE0PAaroTHLCTqlVgrqCWFm81N8Z3CrZe14ORo4LFKNiYijE/nJb1sCHKJhgWbztC
 IxtYlwscAOnh41Z91t4dU+hcuEscxSFW5Gd9qWRnF9TqzvvqoL3kR6404hyCGARmT3QL
 X0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=eBnEIsSpdvtaAulcwb60egXtJXLbKdgq5l9EgYQnFNY=;
 b=VPMvYW1ZVQz/d4E7R2asbZhfr764Qe/wEt1DnvGyOZKUCkuRbhwklsbzcJbiw/mm9x
 VCDLtowUIvQJh7kHzcz5dRuX6AHJMW3uzjcauNz23bQvrns6Fy49kktUcCOTi9SNADJs
 Nfl1YY8l9hR0bAEnNyAHpwdnCmEThUbbTZJzfPXWAphx9DaWThOYk7xa6ELSb22WCsXP
 o3oVqOw4gkDQSoU3Z9wH5bsrar9PrljLheJAfB3WPVXEkmPjydoglEiWukD9MnhTx8Mh
 Xb990ZsG+5wbZi+HL46J6Ts2AwFwYhYb630e07UWFJPF7ByATeQpIkAQog+ef+tLHMRQ
 EVKQ==
X-Gm-Message-State: AOAM530hDcSDSd6m0r7i7OBkk2+DQ8Oek5zIDCg3GE70bCmIG9eSDq7m
 BLZnnUcYWXYBuzELZcDBmY6Ugk/ow0Bs2htT0ic=
X-Google-Smtp-Source: ABdhPJygbrnKPgnFOw0cAPSWsQ/x6F95VmAfaW3b/dBke2U55KPSSgoKL7OBDf+uHrO+6jVNquwNFc2CkcTKUGsZZHU=
X-Received: by 2002:a2e:8717:: with SMTP id m23mr1763536lji.490.1611302431058; 
 Fri, 22 Jan 2021 00:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
 <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
In-Reply-To: <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 22 Jan 2021 00:00:19 -0800
Message-ID: <CAE2XoE9gag5J7reaQPaovto6HDvDPaGOJCSGeModiXVr5p7chg@mail.gmail.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000076f7305b97895b8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x22e.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000076f7305b97895b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo, as python and meson are required dependencies to building qemu
now,
can we detecting python/meson at the very begining of configure,
even before the --help parameter.

On Wed, Jan 13, 2021 at 6:08 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/01/21 11:31, Daniel P. Berrang=C3=A9 wrote:
> >>   meson-buildoptions.json                 | 717
++++++++++++++++++++++++
> > I'm not a fan of seeing this file introduced as it has significant
> > overlap with meson_options.txt.    I feel like the latter has enough
> > information present to do an acceptable job for help output. After
> > all that's sufficient if we were using meson directly.
>
> Sorry, I missed this remark.  meson-buildoptions.json is not
> hand-written.  It is the result of Meson's own parsing meson_options.txt
> exported as JSON.
>
> In the commit message "because we parse command-line options before
> meson is available, the introspection output is stored in the source
> tree.  This is the reason for the unattractive diffstat; the number of
> JSON lines added is higher than the number of configure lines removed.
> Of course the latter are code that must be maintained manually and the
> former is not".
>
> Paolo
>
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000076f7305b97895b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paolo, as python and meson are required dependencies to=
 building qemu now,<div>can we detecting python/meson at the very begining =
of configure,</div><div>even before the --help parameter.<br><br>On Wed, Ja=
n 13, 2021 at 6:08 AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.c=
om">pbonzini@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On 13/01/21 11:31, D=
aniel P. Berrang=C3=A9 wrote:<br>&gt; &gt;&gt; =C2=A0 meson-buildoptions.js=
on =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 717 ++++++++++=
++++++++++++++<br>&gt; &gt; I&#39;m not a fan of seeing this file introduce=
d as it has significant<br>&gt; &gt; overlap with meson_options.txt. =C2=A0=
 =C2=A0I feel like the latter has enough<br>&gt; &gt; information present t=
o do an acceptable job for help output. After<br>&gt; &gt; all that&#39;s s=
ufficient if we were using meson directly.<br>&gt;<br>&gt; Sorry, I missed =
this remark. =C2=A0meson-buildoptions.json is not<br>&gt; hand-written.=C2=
=A0 It is the result of Meson&#39;s own parsing meson_options.txt<br>&gt; e=
xported as JSON.<br>&gt;<br>&gt; In the commit message &quot;because we par=
se command-line options before<br>&gt; meson is available, the introspectio=
n output is stored in the source<br>&gt; tree.=C2=A0 This is the reason for=
 the unattractive diffstat; the number of<br>&gt; JSON lines added is highe=
r than the number of configure lines removed.<br>&gt; Of course the latter =
are code that must be maintained manually and the<br>&gt; former is not&quo=
t;.<br>&gt;<br>&gt; Paolo<br>&gt;<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000076f7305b97895b8--

