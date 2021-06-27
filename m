Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD49A3B5583
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 00:28:26 +0200 (CEST)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxdGL-0008VZ-Cd
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 18:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lxdFG-0007q0-UB
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 18:27:18 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lxdFE-0002QM-Av
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 18:27:18 -0400
Received: by mail-vs1-xe31.google.com with SMTP id j8so8969642vsd.0
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hh+63uhtdpsxkzN55vR8lcegNyUlQd6+wvuUJdgNLP0=;
 b=tps9CEG8l/xJnVqwdlPwgptQtTfYFEqOiX4ouoI6WMb9qdtAZ4kbWjHMGeZVCrT0UC
 wyHU1Rr0XAwFR/gaTjVuBmE/ciYuXRJbrZqVtZkKFH/FhDVzp+zJWL0ipWO+7qIxsezv
 tRwXBw3ecxd/dQ11GKU1W+XVn4XhDtbBx/H4sz6q7R+RQSNq5jfVxLZMg37hj3T1Pxwk
 fdsEPbtobmHOCp/Nf0bRYX1Zh014CdtRurXQmwDKQiM4FYPIH55F5Ty5QRFScba08JNl
 8F0cpr+dUud2Ivmo6qhWkTCbMjevZ8YCcIRPVPZpx+g4e0xsC4xXTZ7vA1FSoeAOscrq
 +Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hh+63uhtdpsxkzN55vR8lcegNyUlQd6+wvuUJdgNLP0=;
 b=MsE5mu3wQ2jPa9i5SwccA0Rvrhv/jNLIdf1EXXb7JfvChB6A7B8w/xRILInk3IUAB5
 K115oQmsbPjMaTbIya2yPG2LEaOA5BAjZydmlqpzxCxLDvJSAPJqWlb2jn2NkJItadUl
 mQA90fjBJzUAjJz4wdJX8bhC4JVBJoPOEynIhfgez1CaGW+V6iqsYnxP20jsYjOdRE7Z
 uji2qmieWxN/HIswiWQFH21dlNLHMBDr1rtAsNLaZezS6ftDpdtytFEa77kIcvGSmHD1
 hL4pInMEox1h6zu8i1DhWwG3/ZFvk1FU0GgS3hgw5bctYBVx+1fVOP7mc6z7izJ+4PZp
 CWtQ==
X-Gm-Message-State: AOAM5300IjTO1CvNPBAaDuv0tD1ZpLRLdTRlgMW1KSeT2onH2lWfXssm
 c2Yz6C2PGEmWZlUFwqgWjYEz7HwoidWR+zrsh+Q=
X-Google-Smtp-Source: ABdhPJzjIh/6VhTH0VhWXTsd9xE7oEprXLOXmM2hz0GWFWBurTYekJB2uArAxoevQNHxBj9JXHBnl8/VfJWCEzXlCj4=
X-Received: by 2002:a67:fd03:: with SMTP id f3mr9182212vsr.59.1624832834629;
 Sun, 27 Jun 2021 15:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
 <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
 <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
 <CANCZdfpvUqTb1BkYfRxA5GMk4NC+=iNAJYdEoc1kSc6ydpc8Tg@mail.gmail.com>
In-Reply-To: <CANCZdfpvUqTb1BkYfRxA5GMk4NC+=iNAJYdEoc1kSc6ydpc8Tg@mail.gmail.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 27 Jun 2021 18:27:03 -0400
Message-ID: <CAOakUfOUdn2QThCzX==KOC83hOAjMc4OEKmto9ySDh-bEk80LQ@mail.gmail.com>
Subject: Re: Qemu on Haiku
To: Warner Losh <imp@bsdimp.com>
Content-Type: multipart/alternative; boundary="000000000000ed74c605c5c6dfe8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vs1-xe31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed74c605c5c6dfe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hopefully last questions:

1) What's the format for the subject line for patches? I'm seeing things
like "[PATCH 2/4]" or "[PATCH v2 00/10]" what do those numbers mean in this
context? I didn't see anything about this mentioned in the SubmitAPatch
wiki.
2) Is it acceptable to have a patch for the configure script, or is that
generated? I found some Haiku-related issues there
3) Is there a way to specify that the patch is for a submodule, or is there
a separate place for that?

Regarding prior email:
Seems like the big tasks are:
1) Haiku VM for continuous integration. Is this hosted in Amazon or other
cloud infrastructure?
2) Resolving issues with Haiku pertaining to testing, bringing it inline
with other OSes (and I see how the disk space error)
3) Supporting aspects of the qemu code relevant to Haiku (found an issue in
slirp & configure script)

Thank you for your help & patience!

=C3=8En vin., 25 iun. 2021 la 23:03, Warner Losh <imp@bsdimp.com> a scris:

>
>
> On Fri, Jun 25, 2021 at 8:45 PM Richard Zak <richard.j.zak@gmail.com>
> wrote:
>
>> Hello and thanks for the detailed response! I wasn't aware that a Linux
>> host could compile for Haiku as a target, that's interesting.
>>
>> Seems like the big tasks are:
>> 1) Haiku VM for continuous integration. Is this hosted in Amazon or othe=
r
>> cloud infrastructure?
>>
>
> Take a look at, for example, the make vm-build-freebsd target (see
> tests/vm/Makefile.include). It downloads
> the latest FreeBSD images, boots it with a serial console, walks through
> the install of the base OS, then
> installs the packages needed for qemu to build and kicks off a build and
> runs some acceptance tests
> afterwards. OpenBSD, NetBSD and several Linux distributions have similar
> setups. I think it would be
> useful for there to be one for Haiku as well, so any developer could run
> these tests either in response to
> a bug report in their code, or to make sure things work on/with Haiku. Al=
l
> of this is done locally.
>
> There's a separate issue for creating a Haiku runner for gitlab, but I
> know little even about the FreeBSD
> runner.
>
>
>> 2) Supporting aspects of the qemu code relevant to Haiku.
>>
>> I'll take a look at that Wiki page to get a feel for things, and I've
>> started with the compilation of the latest code from the repo on Haiku,
>> addressing some issues as they come up.
>>
>> I am a huge fan of both projects, but also am doing this in my own time.
>> I'm a developer professionally, but working on Haiku & qemu during off
>> hours (though timely shouldn't be a problem). How are things communicate=
d
>> for this project (in regard to your request for someone who can help in =
a
>> timely manner)? It seems that the vast majority of the mailing list is
>> patch information. What's the primary way for code to be contributed, a
>> merging code though Gitlab or via emailed
>>
> patches?
>>
>
> Emailed patches. https://wiki.qemu.org/Contribute/SubmitAPatch has all
> the details, though the volume of patches means that you really want to
> make sure that you CC the maintainers of the code listed in the MAINTAINE=
RS
> file when submitting patches to help ensure they do not get list.
>
> Warner
>
>
>>
>> =C3=8En vin., 25 iun. 2021 la 03:09, Thomas Huth <thuth@redhat.com> a sc=
ris:
>>
>>> On 25/06/2021 06.12, Richard Zak wrote:
>>> > Hello there! I noticed the message which appears when building qemu o=
n
>>> > Haiku. I'd hate for Haiku to lose qemu, so I would like to help!
>>> >
>>> > What is needed in terms of a build system for continuous integration?
>>> I'm
>>> > not familiar with CI systems, other than simply knowing what they do.
>>>
>>>   Hi,
>>>
>>> since a couple of month, we already have a Haiku VM in our VM tests, so
>>> the
>>> basics are already there - it's possible to run a Haiku build test on a
>>> Linux host by typing:
>>>
>>>   make vm-build-haiku.x86_64
>>>
>>> However, it's still in a quite bad shape, the disk image that is used i=
n
>>> that VM is not big enough for compiling the whole QEMU sources. So
>>> somebody
>>> needs to add some additional logic there to either increase the disk
>>> image
>>> on the fly or to add a second free disk image to the VM that could be
>>> used
>>> for compilation instead. If you want to have a try, have a look at:
>>> tests/vm/haiku.x86_64
>>>
>>> Also, I'm not sure whether Peter is using this VM already in his gating
>>> CI
>>> tests? I guess not, due to those size limitations...
>>>
>>> Finally, we'd also need somebody who's proficient with the Haiku APIs
>>> and
>>> who could help with problems in a timely manner, i.e. we'd need an entr=
y
>>> in
>>> the "Hosts" section in the maintainers file. It should be someone who's
>>> basically familiar with the QEMU development process, so if you're
>>> interested, I'd suggest that you try to contribute some patches to QEMU
>>> first to get a basic understanding of the process (see e.g.
>>> https://wiki.qemu.org/Contribute/BiteSizedTasks for some easier tasks),
>>> and
>>> once you feel confident, you could add a Haiku entry to the MAINTAINERS
>>> file.
>>>
>>>   Thomas
>>>
>>>
>>
>> --
>> Regards,
>>
>> Richard J. Zak
>> Professional Genius
>> PGP Key: https://keybase.io/rjzak/key.asc
>>
>

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000ed74c605c5c6dfe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hopefully last questions:</div><div><br></div><div>1)=
 What&#39;s the format for the subject line for patches? I&#39;m seeing thi=
ngs like &quot;[PATCH 2/4]&quot; or &quot;[PATCH v2 00/10]&quot; what do th=
ose numbers mean in this context? I didn&#39;t see anything about this ment=
ioned in the SubmitAPatch wiki. <br></div><div>2) Is it acceptable to have =
a patch for the configure script, or is that generated? I found some Haiku-=
related issues there</div><div>3) Is there a way to specify that the patch =
is for a submodule, or is there a separate place for that?</div><div><br></=
div><div>Regarding prior email:</div><div><div>Seems like the big tasks are=
:</div><div>1) Haiku VM for continuous integration. Is this hosted in Amazo=
n or other cloud infrastructure?</div><div>2) Resolving issues with Haiku p=
ertaining to testing, bringing it inline with other OSes (and I see how the=
 disk space error)<br></div><div>3) Supporting aspects of the qemu code rel=
evant to Haiku (found an issue in slirp &amp; configure script)</div><div><=
br></div><div>Thank you for your help &amp; patience!<br></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8E=
n vin., 25 iun. 2021 la 23:03, Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com">imp@bsdimp.com</a>&gt; a scris:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 25,=
 2021 at 8:45 PM Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gmail.com"=
 target=3D"_blank">richard.j.zak@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello and t=
hanks for the detailed response! I wasn&#39;t aware that a Linux host could=
 compile for Haiku as a target, that&#39;s interesting.<br></div><div><br><=
/div><div>Seems like the big tasks are:</div><div>1) Haiku VM for continuou=
s integration. Is this hosted in Amazon or other cloud infrastructure?<br><=
/div></div></blockquote><div><br></div><div>Take a look at, for example, th=
e make vm-build-freebsd target (see tests/vm/Makefile.include). It download=
s</div><div>the latest FreeBSD images, boots it with a serial console, walk=
s through the install of the base OS, then</div><div>installs the packages =
needed for qemu to build and kicks off a build and runs some acceptance tes=
ts</div><div>afterwards. OpenBSD, NetBSD and several Linux distributions ha=
ve similar setups. I think it would be</div><div>useful for there to be one=
 for Haiku as well, so any developer could run these tests either in respon=
se to</div><div>a bug report in their code, or to make sure things work on/=
with Haiku. All of this is done locally.</div><div><br></div><div>There&#39=
;s a separate issue for creating a Haiku runner for gitlab, but I know litt=
le even about the FreeBSD</div><div>runner.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><d=
iv>2) Supporting aspects of the qemu code relevant to Haiku.</div><div><br>=
</div><div>I&#39;ll take a look at that Wiki page to get a feel for things,=
 and I&#39;ve started with the compilation of the latest code from the repo=
 on Haiku, addressing some issues as they come up.</div><div><br></div><div=
>I am a huge fan of both projects, but also am doing this in my own time. I=
&#39;m a developer professionally, but working on Haiku &amp; qemu during o=
ff hours (though timely shouldn&#39;t be a problem). How are things communi=
cated for this project (in regard to your request for someone who can help =
in a timely manner)? It seems that the vast majority of the mailing list is=
 patch information. What&#39;s the primary way for code to be contributed, =
a merging code though Gitlab or via emailed </div></div></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>patches?<=
br></div></div></blockquote><div><br></div><div>Emailed patches. <a href=3D=
"https://wiki.qemu.org/Contribute/SubmitAPatch" target=3D"_blank">https://w=
iki.qemu.org/Contribute/SubmitAPatch</a> has all the details, though the vo=
lume of patches means that you really want to make sure that you CC the mai=
ntainers of the code listed in the MAINTAINERS file when submitting patches=
 to help ensure they do not get list.<br></div><div>=C2=A0</div><div>Warner=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">=C3=8En vin., 25 iun. 2021 la 03:09, Thomas H=
uth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.=
com</a>&gt; a scris:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 25/06/2021 06.12, Richard Zak wrote:<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--000000000000ed74c605c5c6dfe8--

