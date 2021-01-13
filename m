Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78F2F54BA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:05:05 +0100 (CET)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoGH-0007LA-0c
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kzoF5-0006uj-GC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:03:51 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:42206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kzoF3-0007yC-HU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:03:51 -0500
Received: by mail-qk1-x735.google.com with SMTP id 22so4346860qkf.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEq30N+jxbyLiyE4WobGEAFuKaW5StBHEOrYLHKBqbk=;
 b=1xfSifttg0GzVW89Bnsq4XgKovG6J21pfjGbq9TcHQ+xvQ5m+uo6NP90On6VOcSJJP
 02ukCNYQ3ipJaRUYPN/Az6ZUaDw1Bj5rWx/ChkqovzHQcZrmtZdFYeEnRwjVP4IGnCcU
 qYCXHenxKgHX55ULPAF1/WBlCOJ/ggLquQNf+JyP61Gh8l/ItwvLs5GW7s2GR7nfPPbn
 Q+VPUrno1i3KctHST24JOaVt9eGHzM552PD1hxIPqPIPjy26UWyIJzmqP5HcQVdIaPI2
 /gg30c4nEBGbv1FENJ1xR/oFGg3tFQecHfgWYJP5eJTrBcgSFYWjd6UQdXHw5gXRmEY3
 oTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEq30N+jxbyLiyE4WobGEAFuKaW5StBHEOrYLHKBqbk=;
 b=jAKV3DfZO9UzDs52ZnCHWV91IxST7inh6QyxRmLBaE7wknddJN9nzrWsKtosxbFCWi
 EJ1mym0BxLbH8rtJW0ecl0SCzvMwkRsDyVCbAe4oHh7c2UdA6/2VyDcBTQum0cvSrnfn
 Aja+Mt7Y0X+Ldz/GuBlvhOTj23vlRqXb4L/jIL8wGY1zdhlkNkwnScmFNyzoUfSfAwhF
 vYPT1TSf2bB3Fsa+rUEfEJmVj6beD5Z/gwf7eR+N/E3hslJ/H3Tql3vQYg1hc/CI0GbD
 YysmqzjQ1EKnV9qxsC1TPNQ00e4JdjqwxL5hgIbaKtwnNEablJkWfFREfKjGwGijVo5F
 jntg==
X-Gm-Message-State: AOAM5306Dmm2TIN6sYcUvZ5vf+l5j0OA7Og2Gg5DycZEbeKXnWp76yjW
 4/3R70XCHBB085TViS5+dmF55vk8kyeJqxD+NVUkkw==
X-Google-Smtp-Source: ABdhPJwR1LphV35ea1+oDmdEw2f5tniICCHnOwtXqFrX75O9uGIVPdoZFQRvEPz6xh/q6DhZ1t0ah2Y5KUQp1wxDZEc=
X-Received: by 2002:a37:a614:: with SMTP id p20mr4129723qke.359.1610575427752; 
 Wed, 13 Jan 2021 14:03:47 -0800 (PST)
MIME-Version: 1.0
References: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
In-Reply-To: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 13 Jan 2021 15:03:36 -0700
Message-ID: <CANCZdfr9Fd+Ne3cGqhHfna+iAD9bwe=ScbzN1C+uads8RqJDsQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/4] bsd-user: Fix some code style problems
To: shiliyang <shiliyang@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000416bee05b8cf500a"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000416bee05b8cf500a
Content-Type: text/plain; charset="UTF-8"

While these changes look good, can you submit this against the bsd-user
repository? White space changes like this in mainline make rebasing harder
than needed.

https://github.com/qemu-bsd-user/qemu-bsd-user branch
bsd-user-rebase-3.1and we'll make sure they get via our coming pull
requests..

Warner

On Wed, Jan 13, 2021 at 2:31 AM shiliyang <shiliyang@huawei.com> wrote:

> This patch series fixes error style problems found by checkpatch.pl.
>
> V2->V3:
> Make the patch into a series.
>
> V1->V2:
> Add cover letter message.
> Fix some style error in patch file before.
>
> Liyang Shi (4):
>   bsd-user: "foo * bar" should be "foo *bar"
>   bsd-user: suspect code indent for conditional statements
>   bsd-user: space required after semicolon
>   bsd-user: do not use C99 // comments
>
>  bsd-user/bsdload.c |  6 +++---
>  bsd-user/elfload.c | 38 +++++++++++++++++++-------------------
>  bsd-user/qemu.h    | 14 +++++++-------
>  bsd-user/syscall.c |  6 +++---
>  4 files changed, 32 insertions(+), 32 deletions(-)
>
> --
> 2.29.1.59.gf9b6481aed
>
>
>

--000000000000416bee05b8cf500a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">While these changes look good, can you submit this against=
 the bsd-user repository? White space changes like this in mainline make re=
basing harder than needed.<div><br></div><div><a href=3D"https://github.com=
/qemu-bsd-user/qemu-bsd-user">https://github.com/qemu-bsd-user/qemu-bsd-use=
r</a> branch bsd-user-rebase-3.1and we&#39;ll make sure they get via our co=
ming pull requests..<br></div><div><br></div><div>Warner<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
an 13, 2021 at 2:31 AM shiliyang &lt;<a href=3D"mailto:shiliyang@huawei.com=
">shiliyang@huawei.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This patch series fixes error style problems found by=
 <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">chec=
kpatch.pl</a>.<br>
<br>
V2-&gt;V3:<br>
Make the patch into a series.<br>
<br>
V1-&gt;V2:<br>
Add cover letter message.<br>
Fix some style error in patch file before.<br>
<br>
Liyang Shi (4):<br>
=C2=A0 bsd-user: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>
=C2=A0 bsd-user: suspect code indent for conditional statements<br>
=C2=A0 bsd-user: space required after semicolon<br>
=C2=A0 bsd-user: do not use C99 // comments<br>
<br>
=C2=A0bsd-user/bsdload.c |=C2=A0 6 +++---<br>
=C2=A0bsd-user/elfload.c | 38 +++++++++++++++++++-------------------<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 | 14 +++++++-------<br>
=C2=A0bsd-user/syscall.c |=C2=A0 6 +++---<br>
=C2=A04 files changed, 32 insertions(+), 32 deletions(-)<br>
<br>
-- <br>
2.29.1.59.gf9b6481aed<br>
<br>
<br>
</blockquote></div>

--000000000000416bee05b8cf500a--

