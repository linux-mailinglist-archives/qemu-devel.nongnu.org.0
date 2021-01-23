Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBCC3012A5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 04:31:38 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l39eC-0007Vw-Oa
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 22:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l39d6-00076Q-Av
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 22:30:28 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:42359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1l39d4-0000eR-Md
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 22:30:28 -0500
Received: by mail-lj1-x229.google.com with SMTP id j3so8827321ljb.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 19:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=GrKCT0X8N1fB00xOEMtRB0QRZLBs2y9K8zfAuUXTTYs=;
 b=a74NEGaWGHVkGi1tEe6SdOgPD9eqeHG38TsWdu6r8of2ukPFpa2zmwGBtNKSpcSKto
 pIpjc4MCIYvBYFJoCqoavBgl5imsLxO9Ox0yOItU4VP6X8gooaH+e1AjW0VNVluh3oJq
 EJU83zNa+ufWhV+fo/DrXKdMzl/8NSAQT2dtVkVZ3ghJhknuIoHj94qyi3jMYTuP7b3p
 +0cDFYodbD4PyTeHPAZ4cmJNhdl9TowcYoAam1S5w86bnCsS7ceC2XfCqCV8JumQbltD
 fh7fKnKYSBPaCzIKz/Rd3qIdj2djLMqE2bGmMukTlkiVMeknrIgwyEIcKvs+iy/GIaA8
 xTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=GrKCT0X8N1fB00xOEMtRB0QRZLBs2y9K8zfAuUXTTYs=;
 b=iD6q9Rxiq82mtIF9T/qoxsHQD0waRbXwK32rCnzNwLB7b4pLclMtQWRxLg5dny/nWg
 Qfuuo2XqZ2WbVBZMoWvgLeCq32YJczq7mhLfs50inuX2j93ADcf2N/6NtzPJTqN4RYvO
 SCzivlkbJEuaG49VvG3c0w35GR8eCiIDG5aAAdzX/97kgkgS3G9BQZXnevxGPsshfOTF
 1Iww0JyS6EmlU0J8KErIb5ci3cSMjBlqwqt5xGcAMv+zWLFdo0kI9EKYiczHmYtpklWZ
 iR3EmvuXSEV4hqpsEAkTTtgr+wygZmz5AOl/Uv0IVwsoouuLJ6sq4lZcBoeQSYRASzGt
 s+pg==
X-Gm-Message-State: AOAM530oV5AVrJ4QKWPzgc+8H/2douAn1ihZ4MOovhYQkjVNKOeamdEf
 P33ryr4Mh9wOHPC1XnNz7ikH6VcmqGNV64kHw9g=
X-Google-Smtp-Source: ABdhPJx/L15lQgy1ex2vQ/2RGZjeD3b7YDCiTwcPKwtZwljvBg5AC1rYiao9l+RLarj8kyaZsefryLa1cSFEi1NvSps=
X-Received: by 2002:a05:651c:328:: with SMTP id
 b8mr1340120ljp.106.1611372624914; 
 Fri, 22 Jan 2021 19:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
 <50a309ed-64a3-6d17-9edb-6274abb4e498@redhat.com>
 <CAE2XoE9gag5J7reaQPaovto6HDvDPaGOJCSGeModiXVr5p7chg@mail.gmail.com>
 <CABgObfa0A_q3_Hev49hT5SHPNvxaE1TrLJ4QPagM5n3g-8P5xw@mail.gmail.com>
In-Reply-To: <CABgObfa0A_q3_Hev49hT5SHPNvxaE1TrLJ4QPagM5n3g-8P5xw@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 23 Jan 2021 11:30:13 +0800
Message-ID: <CAE2XoE_UyVdRnLAYijiwuEO=8-uC4Tv=PRyHMTarvEjTwN8bxw@mail.gmail.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e8b09d05b988ec78"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x229.google.com
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

--000000000000e8b09d05b988ec78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 4:44 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> Il ven 22 gen 2021, 09:00 =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoy=
onggang@gmail.com> ha
scritto:
>>
>> Hi Paolo, as python and meson are required dependencies to building qemu
now,
>> can we detecting python/meson at the very begining of configure,
>> even before the --help parameter.
>
>
> We could and I did it in the first version. However it's ugly that the
user has to use --python on some setups in order to get a full help message=
.

  Yeap, but finally configure should gone, so I think --python are
acceptable by user, just need make sure to be noticed when the default
python
are not python3

>
> Paolo
>
>>
>> On Wed, Jan 13, 2021 at 6:08 AM Paolo Bonzini <pbonzini@redhat.com>
wrote:
>> >
>> > On 13/01/21 11:31, Daniel P. Berrang=C3=A9 wrote:
>> > >>   meson-buildoptions.json                 | 717
++++++++++++++++++++++++
>> > > I'm not a fan of seeing this file introduced as it has significant
>> > > overlap with meson_options.txt.    I feel like the latter has enough
>> > > information present to do an acceptable job for help output. After
>> > > all that's sufficient if we were using meson directly.
>> >
>> > Sorry, I missed this remark.  meson-buildoptions.json is not
>> > hand-written.  It is the result of Meson's own parsing
meson_options.txt
>> > exported as JSON.
>> >
>> > In the commit message "because we parse command-line options before
>> > meson is available, the introspection output is stored in the source
>> > tree.  This is the reason for the unattractive diffstat; the number of
>> > JSON lines added is higher than the number of configure lines removed.
>> > Of course the latter are code that must be maintained manually and the
>> > former is not".
>> >
>> > Paolo
>> >
>> >
>>
>>
>> --
>>          =E6=AD=A4=E8=87=B4
>> =E7=A4=BC
>> =E7=BD=97=E5=8B=87=E5=88=9A
>> Yours
>>     sincerely,
>> Yonggang Luo



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000e8b09d05b988ec78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Jan 23, 2021 at 4:44 AM Paolo Bonzini &lt;=
<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<b=
r>&gt;<br>&gt;<br>&gt;<br>&gt; Il ven 22 gen 2021, 09:00 =E7=BD=97=E5=8B=87=
=E5=88=9A(Yonggang Luo) &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyon=
ggang@gmail.com</a>&gt; ha scritto:<br>&gt;&gt;<br>&gt;&gt; Hi Paolo, as py=
thon and meson are required dependencies to building qemu now,<br>&gt;&gt; =
can we detecting python/meson at the very begining of configure,<br>&gt;&gt=
; even before the --help parameter.<div>&gt;<br>&gt;<br>&gt; We could and I=
 did it in the first version. However it&#39;s ugly that the user has to us=
e --python on some setups in order to get a full help message.</div><div><b=
r></div><div>=C2=A0 Yeap, but finally configure should gone, so I think --p=
ython are acceptable by user, just need make sure to be noticed when the de=
fault python<br></div><div>are not python3</div><div><br>&gt;<br>&gt; Paolo=
<br>&gt;<br>&gt;&gt;<br>&gt;&gt; On Wed, Jan 13, 2021 at 6:08 AM Paolo Bonz=
ini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; =
wrote:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; On 13/01/21 11:31, Daniel P. Berra=
ng=C3=A9 wrote:<br>&gt;&gt; &gt; &gt;&gt; =C2=A0 meson-buildoptions.json =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 717 +++++++++++++=
+++++++++++<br>&gt;&gt; &gt; &gt; I&#39;m not a fan of seeing this file int=
roduced as it has significant<br>&gt;&gt; &gt; &gt; overlap with meson_opti=
ons.txt. =C2=A0 =C2=A0I feel like the latter has enough<br>&gt;&gt; &gt; &g=
t; information present to do an acceptable job for help output. After<br>&g=
t;&gt; &gt; &gt; all that&#39;s sufficient if we were using meson directly.=
<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Sorry, I missed this remark. =C2=A0meson=
-buildoptions.json is not<br>&gt;&gt; &gt; hand-written.=C2=A0 It is the re=
sult of Meson&#39;s own parsing meson_options.txt<br>&gt;&gt; &gt; exported=
 as JSON.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; In the commit message &quot;bec=
ause we parse command-line options before<br>&gt;&gt; &gt; meson is availab=
le, the introspection output is stored in the source<br>&gt;&gt; &gt; tree.=
=C2=A0 This is the reason for the unattractive diffstat; the number of<br>&=
gt;&gt; &gt; JSON lines added is higher than the number of configure lines =
removed.<br>&gt;&gt; &gt; Of course the latter are code that must be mainta=
ined manually and the<br>&gt;&gt; &gt; former is not&quot;.<br>&gt;&gt; &gt=
;<br>&gt;&gt; &gt; Paolo<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;<br>&gt;&gt;<br>&=
gt;&gt;<br>&gt;&gt; --<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=
=A4=E8=87=B4<br>&gt;&gt; =E7=A4=BC<br>&gt;&gt; =E7=BD=97=E5=8B=87=E5=88=9A<=
br>&gt;&gt; Yours<br>&gt;&gt; =C2=A0 =C2=A0 sincerely,<br>&gt;&gt; Yonggang=
 Luo<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=
=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 s=
incerely,<br>Yonggang Luo</div></div>

--000000000000e8b09d05b988ec78--

