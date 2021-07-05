Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6053BC312
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:23:15 +0200 (CEST)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0UBX-00045X-13
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0U9v-0003Gz-6t
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:21:35 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:38547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0U9s-0004v6-SM
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:21:34 -0400
Received: by mail-ua1-x935.google.com with SMTP id p13so7355219uao.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DijmehmYlIc2K5vekFSuiDAisFlt1w8DJEtHhxX2h8=;
 b=jRSnLbmqwtg2vtnjfMrC+qJF73xwCjzlOnqV2wHelXVovsQl3BQc1IxOp23ryt+fxQ
 NFAnyoQDRz+iKgZgVWh29B8UynjwZoe9kiIntsRlmo/Jf2c1NWI8kXW7W9juY8YMSBn+
 1GHqeTtSM4GeLUZ5r8nG0No2OmGNgTBdiBcn3x0sy021eYZtHGoJNBZtci1/6JnMDE+0
 EWqmRQpJrbXUlbzS+OgqlOQCBOwRmNamfmB6Ok4wF2hzjm2/gAcMR2dST7Af3fQlO5s9
 GXd9Ri9Ojj+NndiL9IpTqDVLYMLWrl0CAEMTkHNP5143RXODA40fJ52roOHhJeS5lH8V
 UnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DijmehmYlIc2K5vekFSuiDAisFlt1w8DJEtHhxX2h8=;
 b=sh1Y12m60vJ2T0sTUJSq1oZM23wF6XjcSbQpLev26Q8OBRgS1PCZ680v0B0FjMc5k5
 9sEz33B66Rw00NXWAYPuZsEGOLBJpaxwxGN4mVAFDQx7AJTElf7fK9tLodb/5nSwj/gn
 pCxFqha6Q4k10oxphYI/TnbtE/SCAEjLavR6isd0i3laantl91oqgaJNEHJo409cLAqC
 62Pi/jqggkBCy9geIxO6DxlHmzwsglA20HEbDPNBa5T7IpXNH3IoMvmzHFG7ImjxhaSU
 HNu3fklVWiZNO59IAv0c4QlK/EwqzLm1vwupjWB0PYZ4kVARbZOX6R7ZsfYa8x3zkUFJ
 EWIg==
X-Gm-Message-State: AOAM533hnyQWWjYdni4ep/sW4RY4JJN9oQfmoc2DqjtJNHwqyBB+DhQZ
 EjvUvZEU4ULvkImc2pjpi3OejnDOaslqcZV+VSE=
X-Google-Smtp-Source: ABdhPJwMKMuRa+q5suJxycRAaKdnY7J5hiykNAPyjpV6lx7rF9kBgBYk1GxC8MxdGl4xf0BH37+vKZfvFlOaf9dC2rw=
X-Received: by 2002:ab0:48d1:: with SMTP id y17mr12031020uac.96.1625512891363; 
 Mon, 05 Jul 2021 12:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
 <CAFEAcA9rAAuzCh3MVSnfrBWZSvHVrmMqgqJ8OX0=nQKDXoVPpg@mail.gmail.com>
 <CAOakUfMYsaPCWdTWodJX2c1oSV-z3+A7cQ_TAJ1a0OLSXt5nAg@mail.gmail.com>
In-Reply-To: <CAOakUfMYsaPCWdTWodJX2c1oSV-z3+A7cQ_TAJ1a0OLSXt5nAg@mail.gmail.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Mon, 5 Jul 2021 15:21:20 -0400
Message-ID: <CAOakUfP01E38VfL-ZHtxn+iAurRnBda+_v8r=X6aQt_4uGEq=A@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] Configure script for Haiku
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000077b38d05c6653698"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=richard.j.zak@gmail.com; helo=mail-ua1-x935.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000077b38d05c6653698
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The configure script doesn't test for presence of TPM device or support. It
activates TPM support if not explicitly disabled, and disables TPM support
if explicitly enabled on Windows. With TPM support compiled in, it causes
an assertion failure on launch of qemu at util/async.c:669
qemu_set_current_aio_context() !my_aiocontext. I haven't yet figured out
why though, but disabling TPM might be best, and there's precedent for it
as it's disabled if compiling for Windows.

=C3=8En dum., 4 iul. 2021 la 14:29, Richard Zak <richard.j.zak@gmail.com> a
scris:

>
> =C3=8En dum., 4 iul. 2021 la 13:11, Peter Maydell <peter.maydell@linaro.o=
rg> a
> scris:
>
>> On Sun, 4 Jul 2021 at 17:44, Richard Zak <richard.j.zak@gmail.com> wrote=
:
>> >
>> > Use system capstone, for which a port is maintained by Haiku. Disable
>> TPM which isn't supported.
>> >
>> > Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
>> > ---
>> >  configure | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/configure b/configure
>> > index e799d908a3..c928071f69 100755
>> > --- a/configure
>> > +++ b/configure
>> > @@ -358,6 +358,7 @@ oss_lib=3D""
>> >  bsd=3D"no"
>> >  linux=3D"no"
>> >  solaris=3D"no"
>> > +haiku=3D"no"
>> >  profiler=3D"no"
>> >  cocoa=3D"auto"
>> >  softmmu=3D"yes"
>> > @@ -769,6 +770,8 @@ SunOS)
>> >  ;;
>> >  Haiku)
>> >    haiku=3D"yes"
>> > +  tpm=3D"no"
>>
>> If the autodetect for tpm doesn't get this right, we should fix
>> the autodetect.
>>
>> As a general principle we prefer to avoid "do this specific thing
>> for this specific host OS" whenever we can, in favour of "test
>> whether we have whatever feature/function/library is required".
>>
>> thanks
>> -- PMM
>>
>
> Totally makes sense, and I'll be mindful of that. In this case, the
> configure script is enabling TPM support on Haiku, but I don't think it
> breaks anything, but I haven't tested it yet.
>
> --
> Regards,
>
> Richard J. Zak
> Professional Genius
> PGP Key: https://keybase.io/rjzak/key.asc
>


--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--00000000000077b38d05c6653698
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The configure script doesn&#39;t test for presence of TPM =
device or support. It activates TPM support if not explicitly disabled, and=
 disables TPM support if explicitly enabled on Windows. With TPM support co=
mpiled in, it causes an assertion failure on launch of qemu at util/async.c=
:669 qemu_set_current_aio_context() !my_aiocontext. I haven&#39;t yet figur=
ed out why though, but disabling TPM might be best, and there&#39;s precede=
nt for it as it&#39;s disabled if compiling for Windows.<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4=
 iul. 2021 la 14:29, Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.=
com">richard.j.zak@gmail.com</a>&gt; a scris:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum=
., 4 iul. 2021 la 13:11, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; a scris:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 4 Jul 2021 =
at 17:44, Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com" target=
=3D"_blank">richard.j.zak@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Use system capstone, for which a port is maintained by Haiku. Disable =
TPM which isn&#39;t supported.<br>
&gt;<br>
&gt; Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.c=
om" target=3D"_blank">richard.j.zak@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 configure | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/configure b/configure<br>
&gt; index e799d908a3..c928071f69 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -358,6 +358,7 @@ oss_lib=3D&quot;&quot;<br>
&gt;=C2=A0 bsd=3D&quot;no&quot;<br>
&gt;=C2=A0 linux=3D&quot;no&quot;<br>
&gt;=C2=A0 solaris=3D&quot;no&quot;<br>
&gt; +haiku=3D&quot;no&quot;<br>
&gt;=C2=A0 profiler=3D&quot;no&quot;<br>
&gt;=C2=A0 cocoa=3D&quot;auto&quot;<br>
&gt;=C2=A0 softmmu=3D&quot;yes&quot;<br>
&gt; @@ -769,6 +770,8 @@ SunOS)<br>
&gt;=C2=A0 ;;<br>
&gt;=C2=A0 Haiku)<br>
&gt;=C2=A0 =C2=A0 haiku=3D&quot;yes&quot;<br>
&gt; +=C2=A0 tpm=3D&quot;no&quot;<br>
<br>
If the autodetect for tpm doesn&#39;t get this right, we should fix<br>
the autodetect.<br>
<br>
As a general principle we prefer to avoid &quot;do this specific thing<br>
for this specific host OS&quot; whenever we can, in favour of &quot;test<br=
>
whether we have whatever feature/function/library is required&quot;.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><div>Totally makes sense, and I&#39;ll=
 be mindful of that. In this case, the configure script is enabling TPM sup=
port on Haiku, but I don&#39;t think it breaks anything, but I haven&#39;t =
tested it yet.<br></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>Richa=
rd J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"https:/=
/keybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/key.a=
sc</a></div></div></div></div></div></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--00000000000077b38d05c6653698--

