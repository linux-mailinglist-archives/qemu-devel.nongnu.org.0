Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44740FFA8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 21:07:47 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRJD8-00044A-MU
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 15:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRJ8H-000895-H7
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:02:46 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRJ8B-0007sA-73
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:02:45 -0400
Received: by mail-vk1-xa34.google.com with SMTP id k69so4077895vkk.9
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dE6zsSjyP3mwQiSrgnYgv3N+SMR4l/hqEcd/qveAJis=;
 b=vts3GoedzTM6JDVpprLledIifsFmTNRKFxw1qW5s7EbubI1uW5tGKgXI9XU6CPOg70
 Mf0UA58itTQjJ29J8Mox8bjblaq2JleYRIjRW8LVpzOVuZqw3v0rFiTUYaXlWRs5Q/89
 NRv01FJUTWjrg/q5wjV7wB8kiMlHRitvZJdBQQxf5Cm0tOWwFVlXMEZo/TevpZx96WHD
 AZzJdtDeSgqp4cFx0+VUYAdNakTZ9hsIcDREFlbY/XqmgKCntC/r0cCij1z0EkfGqn3I
 IRBqN487Gr5frxJ4GJnDCvDyZIb/hVI2T6jpy7JS6NhCQPwCp8DzbGBNt9N0NoCaKzQg
 V30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dE6zsSjyP3mwQiSrgnYgv3N+SMR4l/hqEcd/qveAJis=;
 b=mxzv0Ij9+XqrPR71G84CxSxrJ7s1DZ2n7OXdIKsOZfy2BsHH86ybgxP/kGlz59+d5h
 3z6xe83t3f7wmYLMt+Fcdsg0PK/SnZRuacnJsIMj/2Mb7AcASGZCxNciOynAkrBGNSe6
 rOo5PzhmDW2pbV25BKbi4Svu5XePrRTq5OkuZFl/xykpOFLrtPmfo83MGAN+ZYJK4e+q
 Ts/zrBjbTszJc5Zd+myrHBiZskqd7EXalh7pDUkqtVMvkvtj/RgXQUxuwE4Ssg8lFCcL
 8MVO3kEuBD3X319QMyPbMunBsW7lcRMuFkY+lC06xYluWmRSR/LE/5DM+n1HDlYdTvp+
 ccOA==
X-Gm-Message-State: AOAM533f039fICqKQtkI4vBVbLqXF4AkvrjB8KsAMPOVZlkBevUQAp3l
 7D7wTlpwZEwEMJUyQiljPBzxhR62K3cTjad3D3eSZw==
X-Google-Smtp-Source: ABdhPJzkG1/QvHO69Op/5W7KmoYcnVfday5aJNiLO2HJwkToCGryp62a/yjadu4zKuxKiwLXGcNjMhwUlgC7ZpCDTUk=
X-Received: by 2002:a1f:258f:: with SMTP id l137mr9177579vkl.21.1631905357122; 
 Fri, 17 Sep 2021 12:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <YURYvaOpya498Xx2@yekko> <YUR9RXXZ4lSRfcyB@redhat.com>
 <CANCZdfoezvfO+wKgqwMf7oCO3dAgpJ28RGecnZs31_o3+iUdGA@mail.gmail.com>
 <119693ac-5aed-969a-9d8f-252db75a2d98@amsat.org>
In-Reply-To: <119693ac-5aed-969a-9d8f-252db75a2d98@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 13:02:25 -0600
Message-ID: <CANCZdfpwhvo-efNz3XnPPChaZsyq1v2Q=kO0inguOasm0bVxOQ@mail.gmail.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000001e647a05cc3593ae"
Received-SPF: none client-ip=2607:f8b0:4864:20::a34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, slp@redhat.com,
 cohuck@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001e647a05cc3593ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021, 12:39 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> On 9/17/21 6:04 PM, Warner Losh wrote:> wrt FreeBSD:
> >
> > The main focus of the project is on AMD64 (x86_64) and ARM64 (aarc64).
> With
> > ricsv64 being ascendant as well. i386 and armv7 are fading. ppc64 has
> > strong,
> > but episodic, interest as well. The rest are bit players.
> >
> > i386 (i686 really), armv7 and riscv7 are the next tier of interest in
> > FreeBSD
> > land. i386 is confined to 32-bit VMs with only a few legacy hardware
> > deployments
> > still kicking. armv7 is more popular on embedded boards, some of which
> have
> > a need to run qemu.
>
> What part of QEMU is used there, user-emulation (likely IMO) or
> system-emulation (unlikely) or both?
>

System emulation is typical.  User emulation of x86 is the only interesting
thing, but that is less complete than other arch.

> riscv64 has a rust port that's being upstreamed, but not
> > there yet and there's likely interest to run qemu on it for research
> > projects.
> > riscv64 isn't widely deployed but has a lot of developer interest /
> > mindshare.
> > sparc64 was removed from FreeBSD 13 and has been irrelevant for years.
> > ppc 32 bit has some minor interest. mips has been fading fast and stand=
s
> > an excellent chance of being removed before FreeBSD 14 (which is
> currently
> > slated for 2022). PowerPC 64 is hard to talk about... there's interest
> > that comes
> > and goes, but when it's around, it's quite intense. It's quite likely
> > there will
> > be interest to run qemu on ppc64 on FreeBSD, but that's much less
> certain.
> >
> > So it all depends on what having rust means for those platforms that
> > don't have
> > it. Would it be a 'half a loaf' situation where the non-rust bits would
> > be buildable
> > but cool new drivers written in rust won't be? Or will it be so central
> > that rust is
> > table stakes to even start a qemu build? To be honest, I'm not sure thi=
s
> > difference
> > would greatly affect the above answer :).
> >
> > Rust works really well on x86_64 and aarch64 (though there's more often
> > a lag
> > on the latter of a few weeks). I know of a rust riscv64 port, but that'=
s
> > just getting
> > ready to upstream. No first-hand or second-hand clue on the rest.
> >
> > FreeBSD tl;dr: x86_64 and aarch64 are must have. i386, armv7 and riscv6=
4
> are
> > really nice to have. ppc64 might also be in that list, but that's less
> > certain. The rest
> > have little to no relevance.
>
> Thanks for gathering this useful info!
>

You are welcome.

Warner

> P.S I've been poking at people to get our QEMU aarch64 CI story in better
> > shape than it is today... I'll have to continue to prompt those
> > interested...
> >
>

--0000000000001e647a05cc3593ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 17, 2021, 12:39 PM Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On 9/17/21 6:04 PM, Warner Losh w=
rote:&gt; wrt FreeBSD:<br>
&gt; <br>
&gt; The main focus of the project is on AMD64 (x86_64) and ARM64 (aarc64).=
 With<br>
&gt; ricsv64 being ascendant as well. i386 and armv7 are fading. ppc64 has<=
br>
&gt; strong,<br>
&gt; but episodic, interest as well. The rest are bit players.<br>
&gt; <br>
&gt; i386 (i686 really), armv7 and riscv7 are the next tier of interest in<=
br>
&gt; FreeBSD<br>
&gt; land. i386 is confined to 32-bit VMs with only a few legacy hardware<b=
r>
&gt; deployments<br>
&gt; still kicking. armv7 is more popular on embedded boards, some of which=
 have<br>
&gt; a need to run qemu.<br>
<br>
What part of QEMU is used there, user-emulation (likely IMO) or<br>
system-emulation (unlikely) or both?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">System emulation is typical.=C2=A0 Us=
er emulation of x86 is the only interesting thing, but that is less complet=
e than other arch.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; riscv64 has a rust port that&#39;s being upstreamed, but not<br>
&gt; there yet and there&#39;s likely interest to run qemu on it for resear=
ch<br>
&gt; projects.<br>
&gt; riscv64 isn&#39;t widely deployed but has a lot of developer interest =
/<br>
&gt; mindshare.<br>
&gt; sparc64 was removed from FreeBSD 13 and has been irrelevant for years.=
<br>
&gt; ppc 32 bit has some minor interest. mips has been fading fast and stan=
ds<br>
&gt; an excellent chance of being removed before FreeBSD 14 (which is curre=
ntly<br>
&gt; slated for 2022). PowerPC 64 is hard to talk about... there&#39;s inte=
rest<br>
&gt; that comes<br>
&gt; and goes, but when it&#39;s around, it&#39;s quite intense. It&#39;s q=
uite likely<br>
&gt; there will<br>
&gt; be interest to run qemu on ppc64 on FreeBSD, but that&#39;s much less =
certain.<br>
&gt; <br>
&gt; So it all depends on what having rust means for those platforms that<b=
r>
&gt; don&#39;t have<br>
&gt; it. Would it be a &#39;half a loaf&#39; situation where the non-rust b=
its would<br>
&gt; be buildable<br>
&gt; but cool new drivers written in rust won&#39;t be? Or will it be so ce=
ntral<br>
&gt; that rust is<br>
&gt; table stakes to even start a qemu build? To be honest, I&#39;m not sur=
e this<br>
&gt; difference<br>
&gt; would greatly affect the above answer :).<br>
&gt; <br>
&gt; Rust works really well on x86_64 and aarch64 (though there&#39;s more =
often<br>
&gt; a lag<br>
&gt; on the latter of a few weeks). I know of a rust riscv64 port, but that=
&#39;s<br>
&gt; just getting<br>
&gt; ready to upstream. No first-hand or second-hand clue on the rest.<br>
&gt; <br>
&gt; FreeBSD tl;dr: x86_64 and aarch64 are must have. i386, armv7 and riscv=
64 are<br>
&gt; really nice to have. ppc64 might also be in that list, but that&#39;s =
less<br>
&gt; certain. The rest<br>
&gt; have little to no relevance.<br>
<br>
Thanks for gathering this useful info!<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">You are welcome.=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
&gt; P.S I&#39;ve been poking at people to get our QEMU aarch64 CI story in=
 better<br>
&gt; shape than it is today... I&#39;ll have to continue to prompt those<br=
>
&gt; interested...<br>
&gt; <br>
</blockquote></div></div></div>

--0000000000001e647a05cc3593ae--

