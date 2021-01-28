Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C13079F7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:43:52 +0100 (CET)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59SZ-00024o-Hw
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l59PC-000861-Uh
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:23 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l59P6-0003NX-Tq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:22 -0500
Received: by mail-pf1-x42f.google.com with SMTP id w14so4227043pfi.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vhxSKjoSd1R7iDKXpsrK7l28NFZix7NigyHB90ikHtY=;
 b=qM+G4j8izzw0uGnIRWEc8tFpiimF8HN7PGsh/M/IW8VSxDpGpQlhGjimSV1cVaKiXL
 8lf057xx4d3h3BTCiCw1BWmS91Me5ieZrLKCnNi+q0pplCpIOO6Vdrs8dJXEZf159oFp
 KD9gMTE3mAZujwQT7MsJhgLEF7bOZobxS8s8AmFnmnVX7/7AYkLiPO2nG+2NvUqyeF4L
 THmGA4ZXXOevgbicYanXWwH5MMV3EFaB5yEXUn+9FBkptQdJjZhs7KVrQJoP4+KIzpqt
 Weixhh0T7NHo4VSRbxH0Am/j1/nAkjl7n0tDd1eq+GL5lQAsI9paZGFYN/vEhWHLqfSS
 E+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vhxSKjoSd1R7iDKXpsrK7l28NFZix7NigyHB90ikHtY=;
 b=cIVg/6A/t9UOAOYMP/kJh1EdSse8QjsUPfzjPqvdpka++f8KwMorIP57hRYyj+97JY
 VUZkUy1IadsRd5UtYa+NQBBd/N+ZCe6CfYPaH76rrHU/FgeKWdAekOgFrE1pwSOIW2Vo
 AdNU94xcp0uKAOo9mVsWCTs17yLIVHOaw50ONBW//fnNxbn26uv53AH62KO7e1rrFU8/
 ZXVSA25XTthd9M5evi5Apv56GyyUQQaik7i2/aar4m4x7S9pr3ZI+QSwi5eVxMk3ZqFP
 unnjRC/NpP1HnBcruqrqnwlf9yNN5wl+XtpJwWn7Qkr89+lXOotGOJAkruDrZbircBRU
 +6LQ==
X-Gm-Message-State: AOAM530/p88AR2yT76k2jZytWC9Kth7V05OPhipG441hpPBrz4u6p35Z
 M+byrtME1Ud3WC/SpRNq4B9d3M3k21/H5L5rzWs=
X-Google-Smtp-Source: ABdhPJxn8bJLEyQ4MMdFcZr2zvxeqWPwZHjK+HJQUaIYdpcYLRCIELXfd6fgmyRGaCxMjmn2U30Mf2AGORxc9aUyCfg=
X-Received: by 2002:a05:6a00:2bb:b029:1be:aeea:abf4 with SMTP id
 q27-20020a056a0002bbb02901beaeeaabf4mr125993pfs.63.1611848415354; Thu, 28 Jan
 2021 07:40:15 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <87o8h9wbh5.fsf@linaro.org>
In-Reply-To: <87o8h9wbh5.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 28 Jan 2021 21:10:03 +0530
Message-ID: <CAAQ-SiOCRSFxyWGqw07a-=0yg8tAiNCoLSSNm4sFx3a6+X7b5w@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003aaf1505b9f7b4b1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x42f.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003aaf1505b9f7b4b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Jan 2021 at 16:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
>
> > Thanks a lot Alex!
> >
> >> All QEMU devices have two parts, a frontend (which the guest sees) and=
 a
> >> backend (which is how the data gets to somewhere in the host). Some of
> >> the command line options in QEMU elide the details for convenience (-n=
ic
> >> and -drive are examples). The -netdev device is all about configuring
> >> the backend of the network part for a paired -device front end. There =
is
> >> a similar setup for audio (-audiodev) although I'll defer to Gerd's
> >> expertise on how the two interact.
> >
> > This helped me understand a bit more about how the devices work. In the
> > source
> > code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think
> the
> > pci device is what is visible to the guest.
> > So `virtio-net-pci.c` should be the front end?
>
> No - they are both front-ends. In VirtIO you have two transports. The
> first is virtio-mmio which is a simple set of memory mapped IO
> registers. There is no discovery (well there is some but the guest needs
> to find where in memory the mmio bus is via some method like hardcoded
> address or DTB).
>
> The second is virtio-pci. Here the virtio devices are encapsulated in a
> PCI bus so you get the benefits of discovery and bus enumeration.
>
So I am a bit confused here. First of there are two parts to a virtio
device in general. One is the
front end that the guest sees, and one is where the processing happens,
which could be either in QEMU
or as a separate daemon. In case of an in QEMU virtio device, the QEMU
front end is replaced by the
virtio-front end. Is that true? That's what I think should happen if both
of those files are front ends.

When you said earlier that all QEMU devices have two parts, I somehow
thought that
the in-QEMU backend for the audio device will itself have two parts.

>
> > For the realize function, I saw that the `virtio_net_device_realize`
> > function initializes
> > the `net_conf` for the device. So I am guessing that the
> > `virtio_snd_device_realize` function
> > should initialize the number of jacks and streams a device has, along
> with
> > the configuration
> > for all these jacks and streams?
>
> No those are all front-end configuration knobs.
>
I am assuming these are set from the command-line or the configuration
files.

>
> > The thing is I do not understand `net` devices all that well so I get a
> bit
> > confused with
> > what is specific to a net device and what should I actually be worried
> > about :)
> >
> > The device initalization step mentions that the jack and streams should
> be
> > read and
> > a query should be made for the config of all jacks and streams. What
> should
> > be the
> > default values of these configurations? I think the realize function is
> > responsible
> > for setting these up.
>
> Gerd?
>
>
>
> --
> Alex Benn=C3=A9e
>
--
Shreyansh

--0000000000003aaf1505b9f7b4b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Jan 2021 at 16:54, Alex Be=
nn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
Shreyansh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" ta=
rget=3D"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; writes:<br>
<br>
&gt; Thanks a lot Alex!<br>
&gt;<br>
&gt;&gt; All QEMU devices have two parts, a frontend (which the guest sees)=
 and a<br>
&gt;&gt; backend (which is how the data gets to somewhere in the host). Som=
e of<br>
&gt;&gt; the command line options in QEMU elide the details for convenience=
 (-nic<br>
&gt;&gt; and -drive are examples). The -netdev device is all about configur=
ing<br>
&gt;&gt; the backend of the network part for a paired -device front end. Th=
ere is<br>
&gt;&gt; a similar setup for audio (-audiodev) although I&#39;ll defer to G=
erd&#39;s<br>
&gt;&gt; expertise on how the two interact.<br>
&gt;<br>
&gt; This helped me understand a bit more about how the devices work. In th=
e<br>
&gt; source<br>
&gt; code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think=
 the<br>
&gt; pci device is what is visible to the guest.<br>
&gt; So `virtio-net-pci.c` should be the front end?<br>
<br>
No - they are both front-ends. In VirtIO you have two transports. The<br>
first is virtio-mmio which is a simple set of memory mapped IO<br>
registers. There is no discovery (well there is some but the guest needs<br=
>
to find where in memory the mmio bus is via some method like hardcoded<br>
address or DTB).<br>
<br>
The second is virtio-pci. Here the virtio devices are encapsulated in a<br>
PCI bus so you get the benefits of discovery and bus enumeration.<br></bloc=
kquote><div>So I am a bit confused here. First of there are two parts to a =
virtio device in general. One is the</div><div>front end that the guest see=
s, and one is where the processing happens, which could be either in QEMU</=
div><div>or as a separate daemon. In case of an in QEMU virtio device, the =
QEMU front end is replaced by the</div><div>virtio-front end. Is that true?=
 That&#39;s what I think should happen if both of those files are front end=
s.</div><div><br></div><div>When you said earlier that all QEMU devices hav=
e two parts, I somehow thought that<br></div><div>the in-QEMU backend for t=
he audio device will itself have two parts.<br> </div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; For the realize function, I saw that the `virtio_net_device_realize`<b=
r>
&gt; function initializes<br>
&gt; the `net_conf` for the device. So I am guessing that the<br>
&gt; `virtio_snd_device_realize` function<br>
&gt; should initialize the number of jacks and streams a device has, along =
with<br>
&gt; the configuration<br>
&gt; for all these jacks and streams?<br>
<br>
No those are all front-end configuration knobs. <br></blockquote><div>I am =
assuming these are set from the command-line or the configuration files. <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; The thing is I do not understand `net` devices all that well so I get =
a bit<br>
&gt; confused with<br>
&gt; what is specific to a net device and what should I actually be worried=
<br>
&gt; about :)<br>
&gt;<br>
&gt; The device initalization step mentions that the jack and streams shoul=
d be<br>
&gt; read and<br>
&gt; a query should be made for the config of all jacks and streams. What s=
hould<br>
&gt; be the<br>
&gt; default values of these configurations? I think the realize function i=
s<br>
&gt; responsible<br>
&gt; for setting these up.<br>
<br>
Gerd?<br>
<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br></blockquote><div>--</div><div>Shreyansh<br></div></div=
></div>

--0000000000003aaf1505b9f7b4b1--

