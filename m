Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931222EEE2E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 08:55:48 +0100 (CET)
Received: from localhost ([::1]:54274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxmcd-00040L-5U
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 02:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kxmb6-0003Ze-Ub
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:54:12 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:32977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kxmb3-0000Jd-2Q
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:54:12 -0500
Received: by mail-pg1-x535.google.com with SMTP id n25so7179554pgb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 23:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9tZHDnyKC3ZFqJ1p3gpP8aDoYHel4aC46YU8pi4h4YA=;
 b=gqiX6XWat9QWV1CFUbqTvicmsg4oNDJ3EkOdQbr6TUby3ZzO62nhUYbbpjIKFs0BdQ
 Qs7jafP7iJvN1Btu5uc+DG+V9KK3R2sNXHFTq4EqxAjfXHP9sjThDCT62b0bo6pKBdRR
 +bqGPCjMHOVguD3TokymNKAYKDfKU7ZzYrieX28+F/CgSpzyWDCjWH37JQVnjKEs+pbP
 OHh3UZnBEh6IsoEMBFh6xZBblCzo4PBFN4RMJKNzbbKdLWKYpblRHnGau+M76Yx0TbM8
 nxGxCHhXOiGs1RDrUTBC2+1v6zvLZPBDKJKKqSpANwk2IRL6JtB69BbU8TmZxTRrCdtS
 tmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9tZHDnyKC3ZFqJ1p3gpP8aDoYHel4aC46YU8pi4h4YA=;
 b=p9KyapRxcAvt0Uab6Rpv3noZdP+X5OuW0oAWrBIW1AR5C2KWW28TYeGzziewx8lN3P
 r6OBV/5qMtl6MoCfBw/YWfliYoTq1CxZaYHWHTfiSv51IjvzmtMdFrkFdNHdGtoI1GIS
 lpVtXbK20VvWVBsY8XBzMatzg6i4PuGivuJR/P8kI0aalCK/siqQqd1Q36BhTQjSanwv
 kPmwEgJI0NbD8C7Qk+kRvvx+f9UBeI07EJYQpVMyhMwDOhiAV2dB9E+E3te8VDdIgQZC
 4JYuImuZ3uaxaZN5p6yaIBvnnWh02LUcS8AevNuV3pKw0iMNipsi4ElIs5HlXpQVGiij
 Jj+A==
X-Gm-Message-State: AOAM533wAbhhCX22ggpLeab5O5ZFRndYkpsv5gpwtocVjE/fMsyToXKV
 zOADu6dDFVxP/xaMFp2OtPo2TmzCUdYXFVVI7b0=
X-Google-Smtp-Source: ABdhPJxUhmlZUm3/S+Q5f3fqa1VDjB3m4dpq2VJBpoUVY/WY2hQIWQo7GTSFLfYclpRyiKuM+e91RnJ5ud/vTqJErPg=
X-Received: by 2002:a63:77c1:: with SMTP id s184mr5740155pgc.376.1610092447371; 
 Thu, 07 Jan 2021 23:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
In-Reply-To: <878s941x85.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Fri, 8 Jan 2021 13:23:56 +0530
Message-ID: <CAAQ-SiMo4SVKuXUN81S6RVfwFtPnccRWO8O2YBAJZ2C2WszCNw@mail.gmail.com>
Subject: Re: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006194a805b85edc50"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006194a805b85edc50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 7 Jan 2021 at 22:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
>
> > On Wed, 6 Jan 2021 at 17:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >
> >>
> >> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
> >>
> >> > Hey everyone!
> >> >
> >> > I want to work on implementing the emulation for the VritioSound
> device.
> >> I
> >> > contacted the mentor for the project, (Greg), who said it's fine and
> >> that I
> >> > should declare it on the mailing list in order to find out if someon=
e
> >> else
> >> > is already working on this project. That is what this mail is for. I
> >> tried
> >> > searching for "Virtio", "Sound", and "VirtioSound" in the qemu-devel
> >> > mailing archives but couldn't find anything. If someone is already
> >> working
> >> > on it, please let me know, and if not then I'll start working on it
> right
> >> > away.
> >>
> >> I'm not working on it but please feel free to CC me on discussion and
> >> patches. I have a general interest on Virtio IO implementations at the
> >> moment.
> >>
> >
> > Sure! (Though I should mention that I do not know a lot about the virti=
o
> > architecture yet. I am still reading up about it. So most of my mails
> might
> > be (silly) queries. Though I hope to learn about it soon and send in
> > some patches and tests :)
> >
> >
> >> Are you planning to make it an in-QEMU device or maybe a external
> >> vhost-user daemon?
> >
> > The project page states that we need to use the QEMU audio subsystem
> > for playing and capturing audio samples.
>
> Is this one of the QEMU internship projects?
>
Yes, it is one of the GSoC projects.

>
> > I am not entirely sure if this implies that the device should be an
> > in-QEMU device or if it could be an external daemon.
>
> I think it implies having the entire emulation in-QEMU.
>
I see, after reading yours and Gerd's response, I think I will study/think
about
the implementation details and then decide which will be the best route for
me.

>
> > What do you suggest?
> >
> > cc Gerd Hoffman
> >
> >
> >
> >
> >>
> >> --
> >> Alex Benn=C3=A9e
> >>
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000006194a805b85edc50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Jan 2021 at 22:49, Alex Ben=
n=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
Shreyansh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" ta=
rget=3D"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Wed, 6 Jan 2021 at 17:12, Alex Benn=C3=A9e &lt;<a href=3D"mailto:al=
ex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrot=
e:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Shreyansh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmai=
l.com" target=3D"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; writes:<br=
>
&gt;&gt;<br>
&gt;&gt; &gt; Hey everyone!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I want to work on implementing the emulation for the VritioSo=
und device.<br>
&gt;&gt; I<br>
&gt;&gt; &gt; contacted the mentor for the project, (Greg), who said it&#39=
;s fine and<br>
&gt;&gt; that I<br>
&gt;&gt; &gt; should declare it on the mailing list in order to find out if=
 someone<br>
&gt;&gt; else<br>
&gt;&gt; &gt; is already working on this project. That is what this mail is=
 for. I<br>
&gt;&gt; tried<br>
&gt;&gt; &gt; searching for &quot;Virtio&quot;, &quot;Sound&quot;, and &quo=
t;VirtioSound&quot; in the qemu-devel<br>
&gt;&gt; &gt; mailing archives but couldn&#39;t find anything. If someone i=
s already<br>
&gt;&gt; working<br>
&gt;&gt; &gt; on it, please let me know, and if not then I&#39;ll start wor=
king on it right<br>
&gt;&gt; &gt; away.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not working on it but please feel free to CC me on discuss=
ion and<br>
&gt;&gt; patches. I have a general interest on Virtio IO implementations at=
 the<br>
&gt;&gt; moment.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sure! (Though I should mention that I do not know a lot about the virt=
io<br>
&gt; architecture yet. I am still reading up about it. So most of my mails =
might<br>
&gt; be (silly) queries. Though I hope to learn about it soon and send in<b=
r>
&gt; some patches and tests :)<br>
&gt;<br>
&gt;<br>
&gt;&gt; Are you planning to make it an in-QEMU device or maybe a external<=
br>
&gt;&gt; vhost-user daemon?<br>
&gt;<br>
&gt; The project page states that we need to use the QEMU audio subsystem<b=
r>
&gt; for playing and capturing audio samples.<br>
<br>
Is this one of the QEMU internship projects?<br></blockquote><div>Yes, it i=
s one of the GSoC projects.<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; I am not entirely sure if this implies that the device should be an<br=
>
&gt; in-QEMU device or if it could be an external daemon.<br>
<br>
I think it implies having the entire emulation in-QEMU.<br></blockquote><di=
v>I see, after reading yours and Gerd&#39;s response, I think I will study/=
think about</div><div>the implementation details and then decide which will=
 be the best route for</div><div>me. <br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; What do you suggest?<br>
&gt;<br>
&gt; cc Gerd Hoffman<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Alex Benn=C3=A9e<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--0000000000006194a805b85edc50--

