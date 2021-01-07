Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952B2ED31C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:59:45 +0100 (CET)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWlL-0003F7-QI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kxWk8-0002pN-30
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:58:28 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kxWk4-0000hy-U4
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:58:27 -0500
Received: by mail-pj1-x102f.google.com with SMTP id f14so1613007pju.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QELnSEbFTEk1fMkhCmbvdj3m8QHaktVVp4JCyMlaLkI=;
 b=C0WK1wzCRIz4We/yyVnSPRat8hJpZ9GKvz70GjHJqA5ynj+e0mE4tai7I+QLsu+H4z
 FNYaptW+HT4FjVt9341EVA+zMUDjZYbpe6VjMx86JH/nW+QHEqsJBXMnCUK4Edmu9Wo5
 IAbF3Q8fJpauhEGA0d1pCxiTs4Pfk38ux8ZW2AQKNQZS0qMEOWxRW99oLOkMRMBYuXjr
 cvR3dGtZjEPdfSwltMImdh5cm++GhQhhRQQWZnxqowN00OjfpYO3IHd10kp3RRp1jY+7
 XAmLMQxxzYa/2Y6RJ37EHRSYnDN+unmMudwC/ik6XuhqgRKhLDvHM5e0y4lJHRBzOiDZ
 gy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QELnSEbFTEk1fMkhCmbvdj3m8QHaktVVp4JCyMlaLkI=;
 b=h3pyS+8FKRt6E4TqLrIj2WKSFjV1mTesnaZ9yFkzjyaSFdy6cgNk68zn0EnbWIx4oi
 lHBNMfwEfX4b7UD41C3ZG0agbxjHmq9v5GHEMdZCxgwrZt/lsgEb4mOBrA3UjerWE7vv
 8vzFPbOGIjswjtVNS+1u6ScR6mqNjNeGnXWDUol0D+hWJ6q6bnMZ3n5E4YEZ3PJVv5sh
 r2Dh7NZ2nnVVlbqmYDw1XFxcjgDyo7ULdo731n6a68YX3re3BspPNFFlgruvJvS7oYRS
 9Q1G3l7hYzK/qYhtXq6Rl4XX0BMaTxAZVPKZB+EGm/BpHO3nj3UZbsExIheEjNzEypUs
 zmzA==
X-Gm-Message-State: AOAM530GWTYoNkAi3LUQz8PxKRA5Tg3emA6eys8fu1Qlu/ck78yiYoIA
 O+v+rSLyZv9CrFcUuQR5ixBLWc350fQ+MIB4ZSY=
X-Google-Smtp-Source: ABdhPJwvYg0QqOCmh4r/jToqv5D2ObqoyV2fOypnlwln54rM4zhmVCvP4sSX0GZ+PVBgqRX8RC4IHpITlLwHc/XrcTY=
X-Received: by 2002:a17:90a:c905:: with SMTP id
 v5mr9637887pjt.183.1610031502929; 
 Thu, 07 Jan 2021 06:58:22 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
In-Reply-To: <87a6tm2sxb.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 7 Jan 2021 20:28:11 +0530
Message-ID: <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
Subject: Re: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cf340c05b850abea"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cf340c05b850abea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Jan 2021 at 17:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:
>
> > Hey everyone!
> >
> > I want to work on implementing the emulation for the VritioSound device=
.
> I
> > contacted the mentor for the project, (Greg), who said it's fine and
> that I
> > should declare it on the mailing list in order to find out if someone
> else
> > is already working on this project. That is what this mail is for. I
> tried
> > searching for "Virtio", "Sound", and "VirtioSound" in the qemu-devel
> > mailing archives but couldn't find anything. If someone is already
> working
> > on it, please let me know, and if not then I'll start working on it rig=
ht
> > away.
>
> I'm not working on it but please feel free to CC me on discussion and
> patches. I have a general interest on Virtio IO implementations at the
> moment.
>

Sure! (Though I should mention that I do not know a lot about the virtio
architecture yet. I am still reading up about it. So most of my mails might
be (silly) queries. Though I hope to learn about it soon and send in
some patches and tests :)


> Are you planning to make it an in-QEMU device or maybe a external
> vhost-user daemon?
>

The project page states that we need to use the QEMU audio subsystem
for playing and capturing audio samples. I am not entirely sure if this
implies
that the device should be an in-QEMU device or if it could be an external
daemon.
What do you suggest?

cc Gerd Hoffman




>
> --
> Alex Benn=C3=A9e
>

--000000000000cf340c05b850abea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, 6 Jan 2021 at 17:12, Alex Benn=C3=A9e &lt;<a href=3D"mai=
lto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Shreyansh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" ta=
rget=3D"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hey everyone!<br>
&gt;<br>
&gt; I want to work on implementing the emulation for the VritioSound devic=
e. I<br>
&gt; contacted the mentor for the project, (Greg), who said it&#39;s fine a=
nd that I<br>
&gt; should declare it on the mailing list in order to find out if someone =
else<br>
&gt; is already working on this project. That is what this mail is for. I t=
ried<br>
&gt; searching for &quot;Virtio&quot;, &quot;Sound&quot;, and &quot;VirtioS=
ound&quot; in the qemu-devel<br>
&gt; mailing archives but couldn&#39;t find anything. If someone is already=
 working<br>
&gt; on it, please let me know, and if not then I&#39;ll start working on i=
t right<br>
&gt; away.<br>
<br>
I&#39;m not working on it but please feel free to CC me on discussion and<b=
r>
patches. I have a general interest on Virtio IO implementations at the<br>
moment.<br></blockquote><div><br></div><div>Sure! (Though I should mention =
that I do not know a lot about the virtio</div><div>architecture yet. I am =
still reading up about it. So most of my mails might</div><div>be (silly) q=
ueries. Though I hope to learn about it soon and send in</div><div>some pat=
ches and tests :) <br></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Are you planning to make it an in-QEMU device or maybe a external<br>
vhost-user daemon?<br></blockquote><div><br></div>The project page states t=
hat we need to use the QEMU audio subsystem</div><div class=3D"gmail_quote"=
>for playing and capturing audio samples. I am not entirely sure if this im=
plies</div><div class=3D"gmail_quote">that the device should be an in-QEMU =
device or if it could be an external daemon.</div><div class=3D"gmail_quote=
"><div>What do you suggest?<br></div><div><br></div><div>cc Gerd Hoffman</d=
iv><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000cf340c05b850abea--

