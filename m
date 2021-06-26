Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068F3B4C1B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 05:04:39 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwycX-0007yX-LY
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 23:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwybb-0007IO-8Q
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 23:03:39 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwybY-0001yc-E8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 23:03:39 -0400
Received: by mail-qk1-x736.google.com with SMTP id l16so1997292qkp.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 20:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=juL7UTolXlgvw+szZWpPKQp5obySUF/vIQGuFqkgO48=;
 b=UKK1ICOK4d7C5t6AGR6h0ZaMekGm7YIHOO4EooClVfJWDdxzfIPnGg8UZtj9BPNpOI
 pZAveyzypfekZaQezqLivjFxQd1GdVQFd4co3p4wEY9mD2LfTQ87xQVvvpSi6pFoMLVO
 QECn+9I9i+PBvO0lYzRgHX21a6BB0GtAJpOTcp/zG40ESlTvhEWxavKxfwHDSFe6Ap6u
 y7HzmFDDbZgvEbkjkzjE2bjq4afWGeyd3A6WtJ3MB6LVHMixouvg+jHXr4zeWNiaDWDA
 bA+95Z1Hi6lZeSfQ6Ga8NZDiNSzbaieEvltIpruVw4BLCRgMDZE3Ic0ErWWZyr3HErHP
 vCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=juL7UTolXlgvw+szZWpPKQp5obySUF/vIQGuFqkgO48=;
 b=Rran6KZddN+hOZevFx0mrQX4AN7PpeHkysIjpmxu37mdX/wrkuuEZJoiWs9XFDGPJv
 O7rikL15m2MiTkLbepQsOQSNwCUSH8c2JyewZ9ZQD15B7OyD/njkseo4GEzMyZhgToZS
 x5cPJziLd/+ZUP02DjeExhxg3FWL6TYE07WxDbwxCkUtCCNj6W3E7yX0WZcI3mX8eKMO
 qYcmcDQiLFSbgJbM/5vY81JLx6gLrZE3axEV5juFBwQ09xco20izq03n3CDNj5bHkgQC
 sk0d6po6zc5WeiDoPRMc//hTTGMrUef6NxcyH3yA82CmHfMSSBTgs3x1w0qmb54hhp3e
 XO2A==
X-Gm-Message-State: AOAM5327HShxP+CNrHcAWo9HovYKwN1HLMwD8Bj2GY9mgnzk0v5lDrij
 6Bf5HIKCg19nvCCnVBuNOpXMX3m2DooYnAmpLcld5w==
X-Google-Smtp-Source: ABdhPJznFXLvH+yXTJiux8ZGsM8demwZaRwtrUZz2IW6X7dad4TUR8Dv8hVbgVAWi9EQ/IwccLwa9iUqzxMj2foko9o=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr14413234qke.44.1624676614230; 
 Fri, 25 Jun 2021 20:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
 <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
 <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
In-Reply-To: <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 25 Jun 2021 21:03:23 -0600
Message-ID: <CANCZdfpvUqTb1BkYfRxA5GMk4NC+=iNAJYdEoc1kSc6ydpc8Tg@mail.gmail.com>
Subject: Re: Qemu on Haiku
To: Richard Zak <richard.j.zak@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000077666805c5a28002"
Received-SPF: none client-ip=2607:f8b0:4864:20::736;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x736.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000077666805c5a28002
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 8:45 PM Richard Zak <richard.j.zak@gmail.com> wrote=
:

> Hello and thanks for the detailed response! I wasn't aware that a Linux
> host could compile for Haiku as a target, that's interesting.
>
> Seems like the big tasks are:
> 1) Haiku VM for continuous integration. Is this hosted in Amazon or other
> cloud infrastructure?
>

Take a look at, for example, the make vm-build-freebsd target (see
tests/vm/Makefile.include). It downloads
the latest FreeBSD images, boots it with a serial console, walks through
the install of the base OS, then
installs the packages needed for qemu to build and kicks off a build and
runs some acceptance tests
afterwards. OpenBSD, NetBSD and several Linux distributions have similar
setups. I think it would be
useful for there to be one for Haiku as well, so any developer could run
these tests either in response to
a bug report in their code, or to make sure things work on/with Haiku. All
of this is done locally.

There's a separate issue for creating a Haiku runner for gitlab, but I know
little even about the FreeBSD
runner.


> 2) Supporting aspects of the qemu code relevant to Haiku.
>
> I'll take a look at that Wiki page to get a feel for things, and I've
> started with the compilation of the latest code from the repo on Haiku,
> addressing some issues as they come up.
>
> I am a huge fan of both projects, but also am doing this in my own time.
> I'm a developer professionally, but working on Haiku & qemu during off
> hours (though timely shouldn't be a problem). How are things communicated
> for this project (in regard to your request for someone who can help in a
> timely manner)? It seems that the vast majority of the mailing list is
> patch information. What's the primary way for code to be contributed, a
> merging code though Gitlab or via emailed
>
patches?
>

Emailed patches. https://wiki.qemu.org/Contribute/SubmitAPatch has all the
details, though the volume of patches means that you really want to make
sure that you CC the maintainers of the code listed in the MAINTAINERS file
when submitting patches to help ensure they do not get list.

Warner


>
> =C3=8En vin., 25 iun. 2021 la 03:09, Thomas Huth <thuth@redhat.com> a scr=
is:
>
>> On 25/06/2021 06.12, Richard Zak wrote:
>> > Hello there! I noticed the message which appears when building qemu on
>> > Haiku. I'd hate for Haiku to lose qemu, so I would like to help!
>> >
>> > What is needed in terms of a build system for continuous integration?
>> I'm
>> > not familiar with CI systems, other than simply knowing what they do.
>>
>>   Hi,
>>
>> since a couple of month, we already have a Haiku VM in our VM tests, so
>> the
>> basics are already there - it's possible to run a Haiku build test on a
>> Linux host by typing:
>>
>>   make vm-build-haiku.x86_64
>>
>> However, it's still in a quite bad shape, the disk image that is used in
>> that VM is not big enough for compiling the whole QEMU sources. So
>> somebody
>> needs to add some additional logic there to either increase the disk
>> image
>> on the fly or to add a second free disk image to the VM that could be
>> used
>> for compilation instead. If you want to have a try, have a look at:
>> tests/vm/haiku.x86_64
>>
>> Also, I'm not sure whether Peter is using this VM already in his gating
>> CI
>> tests? I guess not, due to those size limitations...
>>
>> Finally, we'd also need somebody who's proficient with the Haiku APIs an=
d
>> who could help with problems in a timely manner, i.e. we'd need an entry
>> in
>> the "Hosts" section in the maintainers file. It should be someone who's
>> basically familiar with the QEMU development process, so if you're
>> interested, I'd suggest that you try to contribute some patches to QEMU
>> first to get a basic understanding of the process (see e.g.
>> https://wiki.qemu.org/Contribute/BiteSizedTasks for some easier tasks),
>> and
>> once you feel confident, you could add a Haiku entry to the MAINTAINERS
>> file.
>>
>>   Thomas
>>
>>
>
> --
> Regards,
>
> Richard J. Zak
> Professional Genius
> PGP Key: https://keybase.io/rjzak/key.asc
>

--00000000000077666805c5a28002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 25, 2021 at 8:45 PM Richa=
rd Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com">richard.j.zak@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>Hello and thanks for the detailed response! I wasn&=
#39;t aware that a Linux host could compile for Haiku as a target, that&#39=
;s interesting.<br></div><div><br></div><div>Seems like the big tasks are:<=
/div><div>1) Haiku VM for continuous integration. Is this hosted in Amazon =
or other cloud infrastructure?<br></div></div></blockquote><div><br></div><=
div>Take a look at, for example, the make vm-build-freebsd target (see test=
s/vm/Makefile.include). It downloads</div><div>the latest FreeBSD images, b=
oots it with a serial console, walks through the install of the base OS, th=
en</div><div>installs the packages needed for qemu to build and kicks off a=
 build and runs some acceptance tests</div><div>afterwards. OpenBSD, NetBSD=
 and several Linux distributions have similar setups. I think it would be</=
div><div>useful for there to be one for Haiku as well, so any developer cou=
ld run these tests either in response to</div><div>a bug report in their co=
de, or to make sure things work on/with Haiku. All of this is done locally.=
</div><div><br></div><div>There&#39;s a separate issue for creating a Haiku=
 runner for gitlab, but I know little even about the FreeBSD</div><div>runn=
er.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div></div><div>2) Supporting aspects of the qemu cod=
e relevant to Haiku.</div><div><br></div><div>I&#39;ll take a look at that =
Wiki page to get a feel for things, and I&#39;ve started with the compilati=
on of the latest code from the repo on Haiku, addressing some issues as the=
y come up.</div><div><br></div><div>I am a huge fan of both projects, but a=
lso am doing this in my own time. I&#39;m a developer professionally, but w=
orking on Haiku &amp; qemu during off hours (though timely shouldn&#39;t be=
 a problem). How are things communicated for this project (in regard to you=
r request for someone who can help in a timely manner)? It seems that the v=
ast majority of the mailing list is patch information. What&#39;s the prima=
ry way for code to be contributed, a merging code though Gitlab or via emai=
led </div></div></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>patches?<br></div></div></blockquote><div><br></d=
iv><div>Emailed patches. <a href=3D"https://wiki.qemu.org/Contribute/Submit=
APatch">https://wiki.qemu.org/Contribute/SubmitAPatch</a> has all the detai=
ls, though the volume of patches means that you really want to make sure th=
at you CC the maintainers of the code listed in the MAINTAINERS file when s=
ubmitting patches to help ensure they do not get list.<br></div><div>=C2=A0=
</div><div>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En vin., 25 iun. 2021 l=
a 03:09, Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_bla=
nk">thuth@redhat.com</a>&gt; a scris:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 25/06/2021 06.12, Richard Zak wrote:<br>
&gt; Hello there! I noticed the message which appears when building qemu on=
 <br>
&gt; Haiku. I&#39;d hate for Haiku to lose qemu, so I would like to help!<b=
r>
&gt; <br>
&gt; What is needed in terms of a build system for continuous integration? =
I&#39;m <br>
&gt; not familiar with CI systems, other than simply knowing what they do.<=
br>
<br>
=C2=A0 Hi,<br>
<br>
since a couple of month, we already have a Haiku VM in our VM tests, so the=
 <br>
basics are already there - it&#39;s possible to run a Haiku build test on a=
 <br>
Linux host by typing:<br>
<br>
=C2=A0 make vm-build-haiku.x86_64<br>
<br>
However, it&#39;s still in a quite bad shape, the disk image that is used i=
n <br>
that VM is not big enough for compiling the whole QEMU sources. So somebody=
 <br>
needs to add some additional logic there to either increase the disk image =
<br>
on the fly or to add a second free disk image to the VM that could be used =
<br>
for compilation instead. If you want to have a try, have a look at: <br>
tests/vm/haiku.x86_64<br>
<br>
Also, I&#39;m not sure whether Peter is using this VM already in his gating=
 CI <br>
tests? I guess not, due to those size limitations...<br>
<br>
Finally, we&#39;d also need somebody who&#39;s proficient with the Haiku AP=
Is and <br>
who could help with problems in a timely manner, i.e. we&#39;d need an entr=
y in <br>
the &quot;Hosts&quot; section in the maintainers file. It should be someone=
 who&#39;s <br>
basically familiar with the QEMU development process, so if you&#39;re <br>
interested, I&#39;d suggest that you try to contribute some patches to QEMU=
 <br>
first to get a basic understanding of the process (see e.g. <br>
<a href=3D"https://wiki.qemu.org/Contribute/BiteSizedTasks" rel=3D"noreferr=
er" target=3D"_blank">https://wiki.qemu.org/Contribute/BiteSizedTasks</a> f=
or some easier tasks), and <br>
once you feel confident, you could add a Haiku entry to the MAINTAINERS fil=
e.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>R=
ichard J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"htt=
ps://keybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/k=
ey.asc</a></div></div></div></div></div></div></div>
</blockquote></div></div>

--00000000000077666805c5a28002--

