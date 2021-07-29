Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8873DA971
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:51:46 +0200 (CEST)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m99G4-0005HF-W8
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1m99Eu-0004XI-MT
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:50:32 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1m99Es-0005WI-Q1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:50:32 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id t2so3854797vsa.11
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=3vHRslPZvTxMxTMsrG/qrWh19WUFTjXZwWg9ggs5SZ0=;
 b=lvmhCorjT84BBreaP1RTPkcXaqeZlEVxyNJ5vMj4xDyeuERw8c5KSc8z5fZuKbc7Wv
 0VWp5N5ngxR2kEThyOokCb1YbJTbtjCkdjGmNpJSpf3EIVCyIa4B/8U9RDV+JnkriXNm
 z59vkSaMXsQuSMi4TervKJm8czFltDyWzBOHB2GkjQxlNsMTRK4TuXAxTqWcMT0pj7E7
 KhsxzHJ5y+Tl0gdRyLrys8EIYQmuw2jqzRBzr2thyobwONtylFt2tZ+Q+vkeR5Dc/ynr
 f7aQSVI3lQbeG4Sn4s1uKwS6UOSSq4gWmN88UL0u3pkwg3imZh5FwybSumyayzNxbL81
 1wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=3vHRslPZvTxMxTMsrG/qrWh19WUFTjXZwWg9ggs5SZ0=;
 b=esVMT38YhgkOYnnyd/F3CV5nOKeOq6V/Cg0dRpnOkdp7ZyOgzPhSfyx5H2lRUKdXgY
 Zvhrrd30TwTr2LDzn9zsfWex/xOsAmeUgSi6A0tdvv4utIHppVjkC91U/jBMUlCYXOj1
 Gb4+U47lnsay4qweg9ms/IZTEX1E1SvMmgUJuFso2upYycqocnElyvCTWAiJVvE1sIb9
 Bi0WkCQVyhw3uFDZ8vtjOlfFiqUn4nwaqJrr3BMv2MwymuZ4SE6s2ukVsyWpWMkjgq+v
 D/7rK6bSN2/2ZCilWjfZUdWHM06XwfPMCNhr8CC9qlYjeNWUS0wkkXgr8wFFShztDmY/
 fJnQ==
X-Gm-Message-State: AOAM530hRfP2krxHLMPdE3n/h0B/Yrvjp1B2mZ/o0kKtwBN17sthOJLc
 EXxi0Wz+jxBnO6hmnZZ+CsSgpXCSrRhzbnPPzMk=
X-Google-Smtp-Source: ABdhPJyxVbNh8Kgs43J3CehAZ+a8+72KMoNFvIWPDexPQFdAsR9yu4SZN3vPwm4wjakm3mygYc2C/3JHFRtiHtM2bdg=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr5227630vsl.9.1627577429494;
 Thu, 29 Jul 2021 09:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210729124713.208422-1-pbonzini@redhat.com>
 <20210729124713.208422-7-pbonzini@redhat.com>
 <CAFEAcA8UO1J-N1cXdJiaeXUEX_MkhmTqHzgdSHNmogtTcpkqtQ@mail.gmail.com>
 <bca156a1-d567-b003-4dd9-9b72ad2c4572@redhat.com>
 <CAFEAcA-n5XkS86AJgHQeZtmDTYqm6f5OHoUb+biHgKeK0mArCQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-n5XkS86AJgHQeZtmDTYqm6f5OHoUb+biHgKeK0mArCQ@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 30 Jul 2021 00:50:18 +0800
Message-ID: <CAE2XoE--EOGpcijk4dG-0BDQadQ4vmQmD_sejW3CyXebj-DSvA@mail.gmail.com>
Subject: Re: [PULL 6/7] meson: fix meson 0.58 warning with libvhost-user
 subproject
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000878fea05c845e640"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe2c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000878fea05c845e640
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Relative symlink should work on Windows.
Only symlink that points to non-exist file would file.

On Thu, Jul 29, 2021 at 11:09 PM Peter Maydell <peter.maydell@linaro.org>
wrote:
>
> On Thu, 29 Jul 2021 at 15:05, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 29/07/2021 14.58, Peter Maydell wrote:
> > > On Thu, 29 Jul 2021 at 13:56, Paolo Bonzini <pbonzini@redhat.com>
wrote:
> > >>
> > >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >>
> > >> Meson now checks that subprojects do not access files from parent
> > >> project. While we all agree this is best practice, libvhost-user als=
o
> > >> want to share a few headers with QEMU, and libvhost-user isn't
really a
> > >> standalone project at this point (although this is making the
dependency
> > >> a bit more explicit).
> > >>
> > >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >> Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
> > >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > >> ---
> > >>   subprojects/libvhost-user/include/atomic.h       | 1 +
> > >>   subprojects/libvhost-user/libvhost-user.c        | 2 +-
> > >>   subprojects/libvhost-user/meson.build            | 6 +-----
> > >>   subprojects/libvhost-user/standard-headers/linux | 1 +
> > >
> > >> diff --git a/subprojects/libvhost-user/include/atomic.h
b/subprojects/libvhost-user/include/atomic.h
> > >> new file mode 120000
> > >> index 0000000000..8c2be64f7b
> > >> --- /dev/null
> > >> +++ b/subprojects/libvhost-user/include/atomic.h
> > >> @@ -0,0 +1 @@
> > >> +../../../include/qemu/atomic.h
> > >> \ No newline at end of file
> > >
> > >> diff --git a/subprojects/libvhost-user/standard-headers/linux
b/subprojects/libvhost-user/standard-headers/linux
> > >> new file mode 120000
> > >> index 0000000000..15a2378139
> > >> --- /dev/null
> > >> +++ b/subprojects/libvhost-user/standard-headers/linux
> > >> @@ -0,0 +1 @@
> > >> +../../../include/standard-headers/linux
> > >> \ No newline at end of file
> > >
> > >
> > > Should these really be missing the trailing newline ?
> >
> > It's a symlink, so yes, there does not need to be a newline in here.
>
> Interesting. How does it work on Windows hosts ?
>
> -- PMM
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000878fea05c845e640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Relative symlink should work on Windows.<br>Only symlink t=
hat points to non-exist file would file.<br><br>On Thu, Jul 29, 2021 at 11:=
09 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.m=
aydell@linaro.org</a>&gt; wrote:<br>&gt;<br>&gt; On Thu, 29 Jul 2021 at 15:=
05, Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a=
>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; On 29/07/2021 14.58, Peter Maydell w=
rote:<br>&gt; &gt; &gt; On Thu, 29 Jul 2021 at 13:56, Paolo Bonzini &lt;<a =
href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br>&=
gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a=
 href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a=
>&gt;<br>&gt; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Meson now checks that sub=
projects do not access files from parent<br>&gt; &gt; &gt;&gt; project. Whi=
le we all agree this is best practice, libvhost-user also<br>&gt; &gt; &gt;=
&gt; want to share a few headers with QEMU, and libvhost-user isn&#39;t rea=
lly a<br>&gt; &gt; &gt;&gt; standalone project at this point (although this=
 is making the dependency<br>&gt; &gt; &gt;&gt; a bit more explicit).<br>&g=
t; &gt; &gt;&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Marc-Andr=C3=A9 Lurea=
u &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redha=
t.com</a>&gt;<br>&gt; &gt; &gt;&gt; Message-Id: &lt;<a href=3D"mailto:20210=
505151313.203258-1-marcandre.lureau@redhat.com">20210505151313.203258-1-mar=
candre.lureau@redhat.com</a>&gt;<br>&gt; &gt; &gt;&gt; Signed-off-by: Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt;<br>&gt; &gt; &gt;&gt; ---<br>&gt; &gt; &gt;&gt; =C2=A0 subprojects/lib=
vhost-user/include/atomic.h =C2=A0 =C2=A0 =C2=A0 | 1 +<br>&gt; &gt; &gt;&gt=
; =C2=A0 subprojects/libvhost-user/libvhost-user.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>&gt; &gt; &gt;&gt; =C2=A0 subprojects/libvhost-user/meson.buil=
d =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +-----<br>&gt; &gt; &gt;&gt;=
 =C2=A0 subprojects/libvhost-user/standard-headers/linux | 1 +<br>&gt; &gt;=
 &gt;<br>&gt; &gt; &gt;&gt; diff --git a/subprojects/libvhost-user/include/=
atomic.h b/subprojects/libvhost-user/include/atomic.h<br>&gt; &gt; &gt;&gt;=
 new file mode 120000<br>&gt; &gt; &gt;&gt; index 0000000000..8c2be64f7b<br=
>&gt; &gt; &gt;&gt; --- /dev/null<br>&gt; &gt; &gt;&gt; +++ b/subprojects/l=
ibvhost-user/include/atomic.h<br>&gt; &gt; &gt;&gt; @@ -0,0 +1 @@<br>&gt; &=
gt; &gt;&gt; +../../../include/qemu/atomic.h<br>&gt; &gt; &gt;&gt; \ No new=
line at end of file<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;&gt; diff --git a/su=
bprojects/libvhost-user/standard-headers/linux b/subprojects/libvhost-user/=
standard-headers/linux<br>&gt; &gt; &gt;&gt; new file mode 120000<br>&gt; &=
gt; &gt;&gt; index 0000000000..15a2378139<br>&gt; &gt; &gt;&gt; --- /dev/nu=
ll<br>&gt; &gt; &gt;&gt; +++ b/subprojects/libvhost-user/standard-headers/l=
inux<br>&gt; &gt; &gt;&gt; @@ -0,0 +1 @@<br>&gt; &gt; &gt;&gt; +../../../in=
clude/standard-headers/linux<br>&gt; &gt; &gt;&gt; \ No newline at end of f=
ile<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Should these real=
ly be missing the trailing newline ?<br>&gt; &gt;<br>&gt; &gt; It&#39;s a s=
ymlink, so yes, there does not need to be a newline in here.<br>&gt;<br>&gt=
; Interesting. How does it work on Windows hosts ?<br>&gt;<br>&gt; -- PMM<b=
r>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=
=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 s=
incerely,<br>Yonggang Luo
</div>

--000000000000878fea05c845e640--

