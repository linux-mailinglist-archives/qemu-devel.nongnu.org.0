Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B507636DAD9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:07:59 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblnC-0000ft-KG
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbll5-0007U8-HG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:05:47 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbll3-0007Se-9s
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:05:47 -0400
Received: by mail-il1-x136.google.com with SMTP id c15so4841675ilj.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFzgd9EMa/vEQoPrrWaMU71LH8AcHVp2/MjUwzJ/wSU=;
 b=lOH/0RQU5NvyXOMbvCbCs6HqMEI0d55gWzMiR32QeSc8asX2vRRFHLYi4102u4NvDM
 d7ZnY1S9sbRTF3b7DZN34IeHZ62re2svLAv/qPpdyLaPlwZ1yUa16zAg4cku59FPayQq
 lEqcfmwgJGSoFceaY6iRNHHbuF60aBjcguSUNQiOBsuyAVkc+iXi3TOloWbSP31Quu0H
 8Ud7Lx766ReSi20g8/aarez8wbOHEkBcJwThbLoRTPRnRT3S2uncXwuX466bBQQzv8Fj
 sUeMgtuFJ54lYlNRvzWy+7W9AqQ7zPp1M7oIqY9fCw0R1hZEzn1bjW0EW0OZNilifGJ2
 d1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFzgd9EMa/vEQoPrrWaMU71LH8AcHVp2/MjUwzJ/wSU=;
 b=cTBrkMexlFIAasYMo/EyJS1xFvTqLMBK2l0Wh/vizLD88lPupRgOpr47Ce/ZYrmIeW
 rC1vD8yo9vCxRw8/YLhFRsanytmnJ+xKYnhYlsXbUB0V1VFOrscMx1LQmcemgDtq58Iu
 FPa+dJMK0yHHnzwZKQlSefrid3MWGIqc3ZS7tmZPCo9qYOMf4kjPfe2DN/Q8rZTgiYJe
 6KDxE8i3CfQQcKVcXLHm06Uz9iVscrZ1/qMtpH/FvRkeuKPsBmq/4ff/jZBVhh57NRR0
 QYN6gyuf6juyBQJ4PtVOtoRgm0CLe/1bDwZ81VF796gA3sGaFJ95gH1wlS9WhWv6sRKA
 wzIQ==
X-Gm-Message-State: AOAM532Ud2xdicj/p0pyJq9BU66TzHju/IvvTuzTlEfqpEBWT0P68Ohc
 CZ7h8Tx0JA3ooco9X/HYyvuZl+MkEKXniDubV3Q=
X-Google-Smtp-Source: ABdhPJzcGZwqyfOrKehAwTbxhf7j390S7M0k15j2tnUCfboeniIjx5wdgyxg1XVvXngPjzikTYoQto8/47YZ8YeEwJs=
X-Received: by 2002:a92:c7a9:: with SMTP id f9mr16706545ilk.255.1619622344208; 
 Wed, 28 Apr 2021 08:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210428133507.52066-1-ma.mandourr@gmail.com>
 <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
 <CAD-LL6iLpZSAUHquK=gJyXGS3rqOCJZqt0smV29ifeE5ZgZNQA@mail.gmail.com>
 <d5fc9d07-22fa-de61-ab7a-038419351190@redhat.com>
In-Reply-To: <d5fc9d07-22fa-de61-ab7a-038419351190@redhat.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 28 Apr 2021 17:05:32 +0200
Message-ID: <CAD-LL6jkkDx81064YxG3eK-V2CyQtugr7Ov3=qo=Q2kQ-7YJUw@mail.gmail.com>
Subject: Re: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
To: Connor Kuehl <ckuehl@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007f34b605c109b65b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x136.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f34b605c109b65b
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 4:29 PM Connor Kuehl <ckuehl@redhat.com> wrote:

> On 4/28/21 9:13 AM, Mahmoud Mandour wrote:
> >> I am not entirely sure if this is true. The error message before this
> >> patch is applied is:
> >>
> >>         ../tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd
> >>         requires libcap-ng-devel and seccomp-devel
> >>
> >> From what I know about virtiofsd, I know it definitely depends on those
> >> two things.
> >>
> >> Is it possible that the error here is that the top-level meson.build is
> >> not properly collecting the seccomp and libcap-ng dependencies if the
> >> configure invocation doesn't require a system emulation target?
> > I also thought that this is the case since I also specifically get this
> > error message
> > if I enable virtiofsd and specify a target list with only Linux-user
> > targets while nothing
> > in tools/meson.build specifies so. But I think that even if it correctly
> > managed the
> > dependencies it would include and build virtiofsd unnecessarily and
> that's
> > not what we want(?)
>
> I think that's exactly what we want for the default case because
> virtiofsd is enabled by default (../configure --help).

Even if the virtiofsd dependencies are satisfied, if one doesn't want to
> build virtiofsd, they can pass --disable-virtiofsd to the configure
> invocation.
>
> Connor
>
>
That makes sense, I now understand. Thank you.

Mahmoud

--0000000000007f34b605c109b65b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 28, 2021 at =
4:29 PM Connor Kuehl &lt;<a href=3D"mailto:ckuehl@redhat.com" target=3D"_bl=
ank">ckuehl@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 4/28/21 9:13 AM, Mahmoud Mandour wrote:<br>
&gt;&gt; I am not entirely sure if this is true. The error message before t=
his<br>
&gt;&gt; patch is applied is:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0../tools/meson.build:12:6: ERROR:=
 Problem encountered: virtiofsd<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requires libcap-ng-devel and secc=
omp-devel<br>
&gt;&gt;<br>
&gt;&gt; From what I know about virtiofsd, I know it definitely depends on =
those<br>
&gt;&gt; two things.<br>
&gt;&gt;<br>
&gt;&gt; Is it possible that the error here is that the top-level meson.bui=
ld is<br>
&gt;&gt; not properly collecting the seccomp and libcap-ng dependencies if =
the<br>
&gt;&gt; configure invocation doesn&#39;t require a system emulation target=
?<br>
&gt; I also thought that this is the case since I also specifically get thi=
s<br>
&gt; error message<br>
&gt; if I enable virtiofsd and specify a target list with only Linux-user<b=
r>
&gt; targets while nothing<br>
&gt; in tools/meson.build specifies so. But I think that even if it correct=
ly<br>
&gt; managed the<br>
&gt; dependencies it would include and build virtiofsd unnecessarily and th=
at&#39;s<br>
&gt; not what we want(?)<br>
<br>
I think that&#39;s exactly what we want for the default case because<br>
virtiofsd is enabled by default (../configure --help).</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Even if the virtiofsd dependencies are satisfied, if one doesn&#39;t want t=
o<br>
build virtiofsd, they can pass --disable-virtiofsd to the configure<br>
invocation.<br>
<br>
Connor<br>
<br></blockquote><div><br></div><div>That makes sense, I now understand. Th=
ank you.</div><div><br></div><div>Mahmoud</div></div></div></div>

--0000000000007f34b605c109b65b--

