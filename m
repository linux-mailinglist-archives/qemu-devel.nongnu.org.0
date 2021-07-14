Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504263C8B6A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 21:08:19 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3kEz-0007ad-Nc
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 15:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3kEC-0006uq-GN
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:07:28 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3kEA-0000Nz-9w
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:07:27 -0400
Received: by mail-io1-xd2a.google.com with SMTP id v26so3451835iom.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzQb1OvVyEER/77+4i+BUofw/MvEvB87/WJacllwEAI=;
 b=vCsht1+TRs6KQRMhkYbQzhnn9naG2JTp71FWpdUXS+TM9NhK7HPbiEKaaN+16GLVXF
 ddJ05EGQ3l8I8vs0eJYPylUqUyMqQhccd8pM9j8KeaLE6jm/MX28J5PDMFFuSr7OI3se
 5TNuEvQR9Ix6k1XzkXbOpqGFarb023w4uHVHKWiohKqFkh0FM4o/YRnqMW/v2RPKIEiO
 E/cDmRIbGnVN/B6ChfYtdXuEpcFbMuq5fqoMToDcLxNPLQA94GYmAIRVZBQpmg8FUAXv
 GGmQunDjELHh7SLQol57NrHKOb2Nk92YvXHi7Hw7kCOgbaQr279j6xDrEKYYpKB07v2U
 otoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzQb1OvVyEER/77+4i+BUofw/MvEvB87/WJacllwEAI=;
 b=rnbKNATCYbOX4yYugAFyYQKbSjYlM4cwh3t7vGf6/58WAyxj11gOeQpShTx3VwYv1h
 NfG+KYtoCQGYW6MooisYDwsG5PjQ8hzR4Bfo+hPbiV9lokwFfW870/HafJPW/YPU5elq
 Ykkrrua7T9mGNdCm7HzJejKgiPfiKiFmB0UBuRmUpWBGcbb75f7RGVFxIrqJM9TIXg1q
 hoknKgWujoNQZS+hUi1217weYvURJZV7UIMPwdk77frqkkKzlAx3VwppNI+wLbBCWETa
 m0vLXz8Rky8FNDp4VvhE6obVR2Wh3qx1rcpLRgJuUcUrAopHtkw0Fjn5qf/Jylv1hRz/
 N+PA==
X-Gm-Message-State: AOAM532ehbbuKHc41YmCa28y5aQM+g71n6GZGATVc/urfrMZnVG80q0N
 yUvlH3Krbuu92sy/fSbIDcTjYieinGcw557Ve5lg3UjfMxU=
X-Google-Smtp-Source: ABdhPJx3qxa8A8C78npsAmjacvWVzh3J02+Ad70LiKLQxrnQyjaOuYXgjfMnf/U9sQNs0Y9/6Zk8JkVBk/SkScMba24=
X-Received: by 2002:a6b:1497:: with SMTP id 145mr5212738iou.128.1626289644994; 
 Wed, 14 Jul 2021 12:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Thu, 15 Jul 2021 00:36:59 +0530
Message-ID: <CAN6ztm97cJrVZ3=XPr9R8WoepOw81XAGXUO3fHB5nt7L9fWS4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] python: AQMP-TUI Prototype
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000097847205c71a1012"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000097847205c71a1012
Content-Type: text/plain; charset="UTF-8"

Hello all,

UPDATE:  The pipelines have run and all tests passed #336491916
Usually, the pipelines start running as soon as I push my code. But this
time they took longer to start and there was no sign of starting. This is my
first experience with pipelines so I assumed I messed up something from
my side.

Thanks,
Niteesh.

On Wed, Jul 14, 2021 at 3:37 AM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> GitLab:
> https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/
> Based-on
> <https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Based-on>:
> <20210701041313.1696009-1-jsnow@redhat.com>
>      [PATCH 00/20] python: introduce Asynchronous QMP package
>
> Updates in V2:
> 1) Moved loop related initialization to 'run' function in 'App' class
> 2) Added a module logger with support in TUI log messages.
> 3) Corrected usage of logging.info and logging.debug
> 4) Added an option in setup.cfg to silent pylint regarding duplicate-code
> 4) Modified the arguments list to the TUI
>
> NOTE: I am not able to get the pipelines running after the v2 changes.
> I was only able to test the changes locally using *make check*.
>
> This patch series introduces AQMP-TUI prototype. This prototype has been
> helpfull in letting us try out different ideas and giving some insights
> into things that we had to take care of in the upcoming TUI. It was also
> helpfull in finding out bugs in the AQMP library.
>
> The intent for this patch series is to get comments on the architectural
> design of the prototype. These comments will lay down the foundation for
> the upcoming TUI.
>
> G S Niteesh Babu (6):
>   python: disable pylint errors for aqmp-tui
>   python: Add dependencies for AQMP TUI
>   python/aqmp-tui: Add AQMP TUI draft
>   python: add optional pygments dependency
>   python/aqmp-tui: add syntax highlighting
>   python: add entry point for aqmp-tui
>
>  python/Pipfile.lock          |  20 ++
>  python/qemu/aqmp/aqmp_tui.py | 342 +++++++++++++++++++++++++++++++++++
>  python/setup.cfg             |  36 +++-
>  3 files changed, 397 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>
> --
> 2.17.1
>
>

--00000000000097847205c71a1012
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hello all,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
UPDATE:=C2=A0 The pipelines have run and all tests passed #336491916</div><=
div class=3D"gmail_default" style=3D"font-size:small">Usually, the pipeline=
s start running as soon as I push my code. But this</div><div class=3D"gmai=
l_default" style=3D"font-size:small">time they took longer to start and the=
re was no sign of starting. This is my</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">first experience=C2=A0with pipelines so I assumed I=
 messed up something from</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">my side.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Thank=
s,</div><div class=3D"gmail_default" style=3D"font-size:small">Niteesh.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Jul 14, 2021 at 3:37 AM G S Niteesh Babu &lt;<a href=3D"mailto:ni=
teesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">GitLab: <a href=
=3D"https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/Base=
d-on" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qe=
mu/-/commits/aqmp-tui-prototype-v1/<br>
Based-on</a>: &lt;<a href=3D"mailto:20210701041313.1696009-1-jsnow@redhat.c=
om" target=3D"_blank">20210701041313.1696009-1-jsnow@redhat.com</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0[PATCH 00/20] python: introduce Asynchronous QMP packag=
e<br>
<br>
Updates in V2:<br>
1) Moved loop related initialization to &#39;run&#39; function in &#39;App&=
#39; class<br>
2) Added a module logger with support in TUI log messages.<br>
3) Corrected usage of <a href=3D"http://logging.info" rel=3D"noreferrer" ta=
rget=3D"_blank">logging.info</a> and logging.debug<br>
4) Added an option in setup.cfg to silent pylint regarding duplicate-code<b=
r>
4) Modified the arguments list to the TUI<br>
<br>
NOTE: I am not able to get the pipelines running after the v2 changes.<br>
I was only able to test the changes locally using *make check*.<br>
<br>
This patch series introduces AQMP-TUI prototype. This prototype has been<br=
>
helpfull in letting us try out different ideas and giving some insights<br>
into things that we had to take care of in the upcoming TUI. It was also<br=
>
helpfull in finding out bugs in the AQMP library.<br>
<br>
The intent for this patch series is to get comments on the architectural<br=
>
design of the prototype. These comments will lay down the foundation for<br=
>
the upcoming TUI.<br>
<br>
G S Niteesh Babu (6):<br>
=C2=A0 python: disable pylint errors for aqmp-tui<br>
=C2=A0 python: Add dependencies for AQMP TUI<br>
=C2=A0 python/aqmp-tui: Add AQMP TUI draft<br>
=C2=A0 python: add optional pygments dependency<br>
=C2=A0 python/aqmp-tui: add syntax highlighting<br>
=C2=A0 python: add entry point for aqmp-tui<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++<b=
r>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 342 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 36 +++-<br>
=C2=A03 files changed, 397 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000097847205c71a1012--

