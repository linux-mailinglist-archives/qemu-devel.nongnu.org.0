Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C33B4C11
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 04:46:17 +0200 (CEST)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwyKm-0004Dd-AD
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 22:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lwyJg-0003Wp-9v
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 22:45:08 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lwyJd-0003hf-CP
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 22:45:07 -0400
Received: by mail-ua1-x935.google.com with SMTP id f34so4354914uae.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 19:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nspAXJBFGLPdlIqJVrxWJJkZo7lXswMoqnC85t9DFI=;
 b=lMM9DmvhnTHZmbfkvvSm2etVC1RXvkdnFJmKGovapKqSah/zAq7ecbRS2VHKWwUu8A
 nhGY0ieBS3drazxC2NNM70sG+rX94lAm7Swh6Bdu2MTvU3J7DBoJM4s7HOlyEN8CTfoD
 vNb7LrO/9QQFM1yJ0+TDDXLJP/9AUP6S4iRLyvr7sMRxi1eMd8kdgE6wMz6PeXg7To5V
 Lr4cpc/c6fonNJiFzT1GepCMGlDuT9N6Qhko1rKS+tbnKllQGdfD0CbIrJ/MwXkXG1ko
 rFecgUj+jr6tm7s2cvlSKfa1o0A5QhfZenOtqoTenAM7JMt3jWdwEQN4SAToBbenbRVI
 y4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nspAXJBFGLPdlIqJVrxWJJkZo7lXswMoqnC85t9DFI=;
 b=Q9+qSVNjZHzWcFrCCRDxhs6BE4qm6SgbBJ3/dLjqzxnh28arhYX2DoBhsy9qnypZ7y
 qPM6+wzIvowVZR0IrCZ5EWD4MZrLshJGL/pgQZwBoeNnqKwu2dfQLnihbiZBX7c7EN6e
 YazLMqqGyCUTw3jk4vwyPGbA/pfyOrObrrSVVqwoHKAXRDnT+tYvZgjy3VqKRfmqITHK
 /prmIM1kxun1cWAVv6DIAl2yEU3svAaXcO9TLQs3bAyORpuGF4JyzF+047UDeIF+7zEN
 wsEFa2eOiI5EYL7gNwjuRL9l425GgjCHQxJJdxAWWtPkEnABhx6jgSUyl8eOp1C1vaEi
 ZkBA==
X-Gm-Message-State: AOAM533zfkV8jr23FcpG9AXrtpj4YZF4zPgZK2Raf+saNUAYxpZaKE+R
 UKhECRv+8Ed7KuXGW57/Zlh4MSpOyQ1x5dVPVjw0mdlU
X-Google-Smtp-Source: ABdhPJzqwgiXktg94yByOn0ZSyVp4++7D9tqKj5mv/LRVnOBsgoiOqu+WRgwLRPXqNF1Xdv+AgSWxpgj/tJyEj57neU=
X-Received: by 2002:ab0:2a42:: with SMTP id p2mr14877121uar.39.1624675503937; 
 Fri, 25 Jun 2021 19:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
 <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
In-Reply-To: <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Fri, 25 Jun 2021 22:44:52 -0400
Message-ID: <CAOakUfNdwN-5Tt8z58wm-c+gnAp_2JkmdaVzDJyt5J423nzaEQ@mail.gmail.com>
Subject: Re: Qemu on Haiku
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000499af205c5a23e8f"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000499af205c5a23e8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello and thanks for the detailed response! I wasn't aware that a Linux
host could compile for Haiku as a target, that's interesting.

Seems like the big tasks are:
1) Haiku VM for continuous integration. Is this hosted in Amazon or other
cloud infrastructure?
2) Supporting aspects of the qemu code relevant to Haiku.

I'll take a look at that Wiki page to get a feel for things, and I've
started with the compilation of the latest code from the repo on Haiku,
addressing some issues as they come up.

I am a huge fan of both projects, but also am doing this in my own time.
I'm a developer professionally, but working on Haiku & qemu during off
hours (though timely shouldn't be a problem). How are things communicated
for this project (in regard to your request for someone who can help in a
timely manner)? It seems that the vast majority of the mailing list is
patch information. What's the primary way for code to be contributed, a
merging code though Gitlab or via emailed patches?

=C3=8En vin., 25 iun. 2021 la 03:09, Thomas Huth <thuth@redhat.com> a scris=
:

> On 25/06/2021 06.12, Richard Zak wrote:
> > Hello there! I noticed the message which appears when building qemu on
> > Haiku. I'd hate for Haiku to lose qemu, so I would like to help!
> >
> > What is needed in terms of a build system for continuous integration?
> I'm
> > not familiar with CI systems, other than simply knowing what they do.
>
>   Hi,
>
> since a couple of month, we already have a Haiku VM in our VM tests, so
> the
> basics are already there - it's possible to run a Haiku build test on a
> Linux host by typing:
>
>   make vm-build-haiku.x86_64
>
> However, it's still in a quite bad shape, the disk image that is used in
> that VM is not big enough for compiling the whole QEMU sources. So
> somebody
> needs to add some additional logic there to either increase the disk imag=
e
> on the fly or to add a second free disk image to the VM that could be use=
d
> for compilation instead. If you want to have a try, have a look at:
> tests/vm/haiku.x86_64
>
> Also, I'm not sure whether Peter is using this VM already in his gating C=
I
> tests? I guess not, due to those size limitations...
>
> Finally, we'd also need somebody who's proficient with the Haiku APIs and
> who could help with problems in a timely manner, i.e. we'd need an entry
> in
> the "Hosts" section in the maintainers file. It should be someone who's
> basically familiar with the QEMU development process, so if you're
> interested, I'd suggest that you try to contribute some patches to QEMU
> first to get a basic understanding of the process (see e.g.
> https://wiki.qemu.org/Contribute/BiteSizedTasks for some easier tasks),
> and
> once you feel confident, you could add a Haiku entry to the MAINTAINERS
> file.
>
>   Thomas
>
>

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000499af205c5a23e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello and thanks for the detailed response! I wasn&#3=
9;t aware that a Linux host could compile for Haiku as a target, that&#39;s=
 interesting.<br></div><div><br></div><div>Seems like the big tasks are:</d=
iv><div>1) Haiku VM for continuous integration. Is this hosted in Amazon or=
 other cloud infrastructure?<br></div><div>2) Supporting aspects of the qem=
u code relevant to Haiku.</div><div><br></div><div>I&#39;ll take a look at =
that Wiki page to get a feel for things, and I&#39;ve started with the comp=
ilation of the latest code from the repo on Haiku, addressing some issues a=
s they come up.</div><div><br></div><div>I am a huge fan of both projects, =
but also am doing this in my own time. I&#39;m a developer professionally, =
but working on Haiku &amp; qemu during off hours (though timely shouldn&#39=
;t be a problem). How are things communicated for this project (in regard t=
o your request for someone who can help in a timely manner)? It seems that =
the vast majority of the mailing list is patch information. What&#39;s the =
primary way for code to be contributed, a merging code though Gitlab or via=
 emailed patches?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">=C3=8En vin., 25 iun. 2021 la 03:09, Thomas Huth=
 &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; a scris:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 25/06/2021 06=
.12, Richard Zak wrote:<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--000000000000499af205c5a23e8f--

