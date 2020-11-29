Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C22C7AAF
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 19:36:56 +0100 (CET)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjRZ9-0003Tv-9w
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 13:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kjRXt-0002wJ-Mg; Sun, 29 Nov 2020 13:35:37 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kjRXs-0001aj-1Z; Sun, 29 Nov 2020 13:35:37 -0500
Received: by mail-oi1-x242.google.com with SMTP id k26so11890272oiw.0;
 Sun, 29 Nov 2020 10:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=poOQTGWmyr5zCPc2jhOBvrjhSl97XVwSrd0vjJmhZKc=;
 b=StfJUnclLhbFlmWv0QKE9r6Q7bitVHUxJawpSvZrH4N8GQVn6GrAMAHr6i60LvdNcU
 Si0W/VFq4VpBA8PL3Z4EbX/O2l6MWuc4j5Nd+wUpD+YQgwJeT8SMCm2YowQpUrIAIHaK
 NO0BHiF1J1QxSC/roMS7IiMUiBcrpHRfEOGcK9kQczVovP1qAdMUd/j8d2iSWlHe3KbE
 hgc8CHigaSEYW3Lo/1TUgFtrBl1CKbSTbSkQ9pjv6o3VkzFqhGhnJ42a04WaMkTfIc1o
 SAWo6007i7MbP3L6Lmv5zxuq76r3QUlID8HPLDKTs+vJazicFvGkq31w4abtYc+nJz/W
 TZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=poOQTGWmyr5zCPc2jhOBvrjhSl97XVwSrd0vjJmhZKc=;
 b=IZGyKNExQuOMDHl5U6ZaaY+E525ckVrVWfeqUTTgdlERsiaOSEWDpBd+2Z8r34/q4A
 T1qjz0d3kvDJpIA3xAJM4HfYJJhp1ptTlCakh0CqcgtpQkUcuBqD9RoI18+eX9XPBqJR
 XP0Zf03q09V1Iiv7P5ZZ6Xw1VYqHqt8Ij4yUxQMUrBPEOS9gX6MqcNFeS0qK9rmFeMWS
 xwbRWLJRCjdW2UhotyZ2oIHZzn9Ao3kZ4GqC4uNIMHQDNm6d5obq3YvKmTfJ0Z5XMZxN
 G6K/GW42WVJ6UhUJP4TGBFwUmER2AkpTVGoD8oqqsQXqLHetFt9ZP6q2v1mdULf9O7vP
 zcFA==
X-Gm-Message-State: AOAM533Hhmdp+O54RQN7TGLAyyKvAbJJoQwQdfAdKVlok+HT/b9rSrfk
 pnRSLzFIUAdRnmPJeeEeGdX/9xAWdK8LHbQ6ICg=
X-Google-Smtp-Source: ABdhPJzwpkwY7TrYP6S4aGd+bCpAY2IgyhNtuZAZCxtO2VzaPE4q48BHYnVw2+zdm29nPvWOPkSTDY6ujtDDdq6PSJg=
X-Received: by 2002:a05:6808:9b7:: with SMTP id
 e23mr11695837oig.167.1606674933816; 
 Sun, 29 Nov 2020 10:35:33 -0800 (PST)
MIME-Version: 1.0
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
 <5FBCF8F0.9060103@huawei.com>
 <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
 <5FBDB096.3040600@huawei.com>
In-Reply-To: <5FBDB096.3040600@huawei.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 29 Nov 2020 20:35:23 +0200
Message-ID: <CAC_L=vXkncoeBO48-Zkie=pm20_CT-Ee1y5HyQqGtc2EK9fnFg@mail.gmail.com>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000b31f7a05b54328ca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x242.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 zhengchuan@huawei.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b31f7a05b54328ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, Nov 25, 2020 at 3:17 AM Alex Chen <alex.chen@huawei.com> wrote:

> On 2020/11/24 23:29, Peter Maydell wrote:
> > On Tue, 24 Nov 2020 at 12:15, Alex Chen <alex.chen@huawei.com> wrote:
> >>
> >> Hi everyone=EF=BC=8C
> >>
> >> Who can help me merge this patch into the master branch? This patch ma=
y
> be need for qemu-5.2
> >
> > This code has been like this since 2018, so this is not
> > a regression in 5.2. At this point in the release cycle
> > (rc3 imminent) I think it's best to just leave it until 6.0.
> >
>
> OK, I see.
>
>
I will send  a pull request as soon as the 6.0 cycle starts.

Thanks,
Marcel


> Thanks
> Alex
>
>
>
>
>
>

--000000000000b31f7a05b54328ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alex,</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 3:17 AM A=
lex Chen &lt;<a href=3D"mailto:alex.chen@huawei.com">alex.chen@huawei.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 2020/11/24 23:29, Peter Maydell wrote:<br>
&gt; On Tue, 24 Nov 2020 at 12:15, Alex Chen &lt;<a href=3D"mailto:alex.che=
n@huawei.com" target=3D"_blank">alex.chen@huawei.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi everyone=EF=BC=8C<br>
&gt;&gt;<br>
&gt;&gt; Who can help me merge this patch into the master branch? This patc=
h may be need for qemu-5.2<br>
&gt; <br>
&gt; This code has been like this since 2018, so this is not<br>
&gt; a regression in 5.2. At this point in the release cycle<br>
&gt; (rc3 imminent) I think it&#39;s best to just leave it until 6.0.<br>
&gt; <br>
<br>
OK, I see.<br>
<br></blockquote><div><br></div><div>I will send=C2=A0 a pull request as so=
on as the 6.0 cycle starts.</div><div><br></div><div>Thanks,</div><div>Marc=
el</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
Alex<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b31f7a05b54328ca--

