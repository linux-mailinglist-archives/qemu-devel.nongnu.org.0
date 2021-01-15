Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7132F73F4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 09:02:52 +0100 (CET)
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0K4J-0006SM-Fe
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 03:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l0K2T-0005U1-LX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 03:00:59 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l0K2I-0000HM-2n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 03:00:56 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l23so4744206pjg.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 00:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=loGw6TQfSjoAhqgozQVykrX/LZbwn1Mbt1VoKz3Basc=;
 b=ClixyqjlZPZgW/YMG3LeDraYtDevSa5vYI/RV7l8YXSixI/8jO/xAHFHv7g2JWCJhG
 APXAJaa14sH//cEslck5LiiDfLa7Gjsh7i/BZRi4W3nUsjHQB+/sFlT55u0Tj51jHUn3
 JtsqxKlCyKXNAt4Xd/JLPFjfv9CoEwMRVDQkA0sTJKZLkxKG/bI/I8iisitzdEWdQkXW
 viJB+09Lq6WdNGN6ZYZFMs66MIlOAVaHiRke79D/wuc6xmzmLk3jfVg6seb4CCqarsw3
 3kaJUwtGwOkmlGTZSCfV2YF0s78A9Yxex3DX9lmDbDDaYJ7mWqfD1wP7fNEjcmCKNI+6
 fGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=loGw6TQfSjoAhqgozQVykrX/LZbwn1Mbt1VoKz3Basc=;
 b=Hy19/I15wsfrS+g63P5DRlrVTNslSi/WQHyr872I8xledA0W6hx2jq3KqZmAM7aktF
 vZ9QRF/d9rQGb+kvwsuEPi4PUMkMeRo2VQjqpHd6Rn/KnrGeJsr5g7k2gRIHyvP/AOXT
 LJEHYUGS3ERHquz/Qssc65ZXk2Fnw2uTq7F4nYVhruVNF4twNtGyNf8lE7g9c5hQfR96
 C/iBGJme9pN76MaxmqBLO82ZyVUwj/eBrFYWJ31Hvub92DB8/iFYX6GLSoAYWkEMJfyZ
 U8C1W1jma0ncGxwc9vwqI0DNoiMDkgliFcjNdsB5Iu2luLrRxy1QyESHWourT3IJRrrv
 R3lg==
X-Gm-Message-State: AOAM531wN9yH6OskyOQ1d7eK29Z9gvLJsol/+0fPeBv6yP2iS8IIysoA
 plNyp8lFRS68EYACiF6BjcDwYrEHuSQWGxh/8aM=
X-Google-Smtp-Source: ABdhPJwhdwMTSi4zv7KsunfBzGmmYD0GSizo9e+ESk3RxZF0C/kidAGGUK7XhoiETN8ArWpfHjmWWk/P/9737766M+Q=
X-Received: by 2002:a17:90a:c905:: with SMTP id
 v5mr9333259pjt.183.1610697644249; 
 Fri, 15 Jan 2021 00:00:44 -0800 (PST)
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
In-Reply-To: <87ft33l8an.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Fri, 15 Jan 2021 13:30:33 +0530
Message-ID: <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ed15cb05b8ebc4c9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000ed15cb05b8ebc4c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Jan 2021 at 23:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:

>
> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
>
> > Just an update:
> >
> > I've studied the virtio specification along with the source code and I
> now
> > understand what the device implementation is
> > going to look like. Also I understand the source code a lot better. I a=
m
> > now reading about the qemu vhost-user protocol.
> >
> > Although I haven't read about the vhost-user daemon in detail, from wha=
t
> > little I have read, I would say that the daemon
> > would get the virtqueues from the virtio device and forward it to the
> sound
> > device of the host. (This is the hard part
> > I think, since an in QEMU device would use code already written for
> > processing these queues.)
>
> I can't comment on the difficulty there but this does point more towards
> using the in-QEMU approach given we have a bunch of utility functions
> already.
>
> > I think only the tx and rx
> > queues would be shared, and although I do not know exactly how the
> sharing
> > will be implemented, I think the memory
> > will be shared to the vhost-user daemon too? So now the virtqueue memor=
y
> is
> > shared between the virtio driver in guest
> > OS, the virtio device in QEMU, and the vhost-user daemon running in the
> > host userspace.
>
> QEMU uses a memfd file descriptor to share the guests entire memory map
> with the daemon.
>
Oh I see.

>
> > As for the configuration part, the driver will negotiate features with
> the
> > virtio device in QEMU, which in turn will communicate
> > with the vhost-user daemon (via sockets) to get the features supported =
I
> > think.
> >
> > This is what I think it will roughly look like. (Of course modulo the
> > implementation details.) I do not yet understand how
> > much more difficult will implementing the vhost-user daemon be, and
> since I
> > was already
> > warned about the difficulty, I will not risk making any hasty decisions
> > that later hinder the project. I will read up
> > about the vhost-user daemon and how it's implemented to get a better
> idea,
> > and then make the final call.
>
> If you want to see an example of a branch new vhost-user daemon being
> built up from scratch see my recent virtio-rpmb series. The first few
> patches of in-QEMU code will be the same boilerplate either way I think:
>
>   https://patchew.org/QEMU/20200925125147.26943-1-alex.bennee@linaro.org/

This looks super helpful! Thanks a lot for this.

>
>
> > Anyways I am super excited about the project. I got to learn about some
> > really cool things in the past couple of days,
> > and I can not wait to implement it. :)
>
>
> --
> Alex Benn=C3=A9e
>


- Shreyansh Chouhan

--000000000000ed15cb05b8ebc4c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 Jan 2021 at 23:17, Alex Be=
nn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
Shreyansh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" ta=
rget=3D"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; writes:<br>
<br>
&gt; Just an update:<br>
&gt;<br>
&gt; I&#39;ve studied the virtio specification along with the source code a=
nd I now<br>
&gt; understand what the device implementation is<br>
&gt; going to look like. Also I understand the source code a lot better. I =
am<br>
&gt; now reading about the qemu vhost-user protocol.<br>
&gt;<br>
&gt; Although I haven&#39;t read about the vhost-user daemon in detail, fro=
m what<br>
&gt; little I have read, I would say that the daemon<br>
&gt; would get the virtqueues from the virtio device and forward it to the =
sound<br>
&gt; device of the host. (This is the hard part<br>
&gt; I think, since an in QEMU device would use code already written for<br=
>
&gt; processing these queues.)<br>
<br>
I can&#39;t comment on the difficulty there but this does point more toward=
s<br>
using the in-QEMU approach given we have a bunch of utility functions alrea=
dy.<br>
<br>
&gt; I think only the tx and rx<br>
&gt; queues would be shared, and although I do not know exactly how the sha=
ring<br>
&gt; will be implemented, I think the memory<br>
&gt; will be shared to the vhost-user daemon too? So now the virtqueue memo=
ry is<br>
&gt; shared between the virtio driver in guest<br>
&gt; OS, the virtio device in QEMU, and the vhost-user daemon running in th=
e<br>
&gt; host userspace.<br>
<br>
QEMU uses a memfd file descriptor to share the guests entire memory map<br>
with the daemon.<br></blockquote><div>Oh I see. <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; As for the configuration part, the driver will negotiate features with=
 the<br>
&gt; virtio device in QEMU, which in turn will communicate<br>
&gt; with the vhost-user daemon (via sockets) to get the features supported=
 I<br>
&gt; think.<br>
&gt;<br>
&gt; This is what I think it will roughly look like. (Of course modulo the<=
br>
&gt; implementation details.) I do not yet understand how<br>
&gt; much more difficult will implementing the vhost-user daemon be, and si=
nce I<br>
&gt; was already<br>
&gt; warned about the difficulty, I will not risk making any hasty decision=
s<br>
&gt; that later hinder the project. I will read up<br>
&gt; about the vhost-user daemon and how it&#39;s implemented to get a bett=
er idea,<br>
&gt; and then make the final call.<br>
<br>
If you want to see an example of a branch new vhost-user daemon being<br>
built up from scratch see my recent virtio-rpmb series. The first few<br>
patches of in-QEMU code will be the same boilerplate either way I think:<br=
>
<br>
=C2=A0 <a href=3D"https://patchew.org/QEMU/20200925125147.26943-1-alex.benn=
ee@linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20200925125147.26943-1-alex.bennee@linaro.org/</a></blockquote><div>This=
 looks super helpful! Thanks a lot for this. <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
<br>
&gt; Anyways I am super excited about the project. I got to learn about som=
e<br>
&gt; really cool things in the past couple of days,<br>
&gt; and I can not wait to implement it. :)<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br></blockquote><div><br></div><div><br></div><div>- Shrey=
ansh Chouhan<br></div></div></div>

--000000000000ed15cb05b8ebc4c9--

