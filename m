Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33F2E673E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 17:23:25 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktvIq-0007L3-Ik
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 11:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvH7-0006iM-7B
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 11:21:38 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:41063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvH5-00072u-68
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 11:21:37 -0500
Received: by mail-qk1-x731.google.com with SMTP id 19so9172672qkm.8
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kx2liJFWVJ70dQN59D3kj7Iv+SGPfkUhAFVKuO6MaEY=;
 b=11X4nHHJ2C+YOdMKMwn9wYPlcS/a+DRceahoKBD2O1MVEIRpG4PaeGsTdkGLzQpYff
 xgJMiFS0J0fwqx1Tr34FiCXW22Fy2Zo/tjgwbH2JTD0yTzjeC0/TBzvlqeNPG8Z62xYF
 HjnJuV2+X3P23aDWxcghgNycSipVsWSaStIJJ+4C5EfaUqZUZR5qO0MTen+6KGHsuPFh
 CrL3XvF45Ngy8NNNCbHtlS0m0P7uJvTq9j7B8VRjvorYPSctALzoo9F25PZm0NVRFLhN
 vjaXXrfC8lFQBhGq2plGiIuxJMwy+FHn/OTMjgGtUbpqc/FKE3wloYg6iw/r8xpeJiBX
 +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kx2liJFWVJ70dQN59D3kj7Iv+SGPfkUhAFVKuO6MaEY=;
 b=QRZIEBWxrQHoL1zc+peLzjbgWhNRE/GjDHuykuq+1NxHguUg0/lzbsmkYB0vxABnOE
 GuNlK/rdjvDcKuZjbVH2SHtnczujJvKXuq3ncQbsRIuDpOVDt8nJ/bmtwoihE+k+2jUR
 9ucIeKvMlUTDe6bTwZrcI5e4UaPmRYmS0dksLMp4hmfZIZkLRVrOqfGAOX3lxYqEzzM7
 rrCSZsSA9W2yPMI+ApvZhEfAgg/Hr4N4cu+h5mUKBvPQke0njzGBkpqiKow/Hy4bUDzv
 4ARsh2qTq92oM0SMlzsINCuMO3EbnkOthdRb9km/27K2FrQLIULGxafduDUg7I5AuyTq
 BHgQ==
X-Gm-Message-State: AOAM533xkA6kvh1EOZeH8+egaRfwuU1inWeuLI7Uhi7B7vRgugqbp9GU
 rPC3J5ythi6zXw7R4OjK2nQ3wYhqf+jLnYhyAk99Bw==
X-Google-Smtp-Source: ABdhPJznmtlka9JAoQv78DroYRfnWAUAmg2KGBRN4/uobCbPVBzGfiUfL+QW3sGxbgZ9/sSOCkdAp2nb8Iu+kNzjEGI=
X-Received: by 2002:a37:a614:: with SMTP id p20mr44149088qke.359.1609172493622; 
 Mon, 28 Dec 2020 08:21:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
In-Reply-To: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 28 Dec 2020 09:21:22 -0700
Message-ID: <CANCZdfpt0vEvJR7BYpPSxKdHs6r0BoUtXsHL1gi+x6ZopzZ1OA@mail.gmail.com>
Subject: Re: [PATCH 0/2] bsd-user, FreeBSD update
To: David CARLIER <devnexen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd732105b788aa44"
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x731.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dd732105b788aa44
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 28, 2020 at 1:15 AM David CARLIER <devnexen@gmail.com> wrote:

> From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 28 Dec 2020 08:10:43 +0000
> Subject: [PATCH 0/2] *** SUBJECT HERE ***
>
> bsd-user, FreeBSD update.
>
> David Carlier (2):
>   bsd-user, updating the FreeBSD's syscall list, based on the 11.x
>   bsd-user, Adding more strace support for a handful of syscalls.
>
>  bsd-user/freebsd/strace.list  | 12 ++++++++++++
>  bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
>  2 files changed, 34 insertions(+), 3 deletions(-)
>

Have you seen my patches in this area? Are you familiar with the bsd-user
efforts we've been doing at https://github.com/qemu-bsd-user/qemu-bsd-user
We have about 300 patches in the queue and the more that others change
things, the harder it is to get them in. They are a twisty maze of
conflicts early in the series and some not-updated API calls dealing with
the evolution of the qemu cpu model as well.

I posted this series two weeks ago:
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05528.html

This part
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.html updates
the system call numbers to the latest FreeBSD 13 numbers.

Perhaps you could help in these efforts? They have been going on since
around Qemu 1.0 and we were bad about getting them upstreamed early, and so
are paying the price now. We use the code in the above repo to build about
40k packages for a couple of different architectures.

Warner


> --
> 2.30.0.rc2
>
>

--000000000000dd732105b788aa44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 28, 2020 at 1:15 AM David=
 CARLIER &lt;<a href=3D"mailto:devnexen@gmail.com">devnexen@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From 1=
0b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001<br>
From: David Carlier &lt;<a href=3D"mailto:devnexen@gmail.com" target=3D"_bl=
ank">devnexen@gmail.com</a>&gt;<br>
Date: Mon, 28 Dec 2020 08:10:43 +0000<br>
Subject: [PATCH 0/2] *** SUBJECT HERE ***<br>
<br>
bsd-user, FreeBSD update.<br>
<br>
David Carlier (2):<br>
=C2=A0 bsd-user, updating the FreeBSD&#39;s syscall list, based on the 11.x=
<br>
=C2=A0 bsd-user, Adding more strace support for a handful of syscalls.<br>
<br>
=C2=A0bsd-user/freebsd/strace.list=C2=A0 | 12 ++++++++++++<br>
=C2=A0bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---<br>
=C2=A02 files changed, 34 insertions(+), 3 deletions(-)<br></blockquote><di=
v><br></div><div>Have you seen my patches in this area? Are you familiar wi=
th the bsd-user efforts we&#39;ve been doing at=C2=A0<a href=3D"https://git=
hub.com/qemu-bsd-user/qemu-bsd-user">https://github.com/qemu-bsd-user/qemu-=
bsd-user</a> We have about 300 patches in the queue and the more that other=
s change things, the harder it is to get them in. They are a twisty maze of=
 conflicts early in the series and some not-updated API calls dealing with =
the evolution of the qemu cpu model as well.</div><div><br></div><div>I pos=
ted this series two=C2=A0weeks ago: <a href=3D"https://lists.gnu.org/archiv=
e/html/qemu-devel/2020-12/msg05528.html">https://lists.gnu.org/archive/html=
/qemu-devel/2020-12/msg05528.html</a></div><div><br></div><div>This part <a=
 href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.htm=
l">https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.html</a> =
updates the system call numbers to the latest FreeBSD 13 numbers.</div><div=
><br></div><div>Perhaps you could help in these efforts? They have been goi=
ng on since around Qemu 1.0 and we were bad about getting them upstreamed e=
arly, and so are paying the price now. We use the code in the above repo to=
 build about 40k packages for a couple of different architectures.</div><di=
v><br></div><div>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
-- <br>
2.30.0.rc2<br>
<br>
</blockquote></div></div>

--000000000000dd732105b788aa44--

