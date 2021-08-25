Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC93F7C69
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 20:47:24 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIxvn-0002xW-Bj
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 14:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxtk-0001hN-JO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:45:18 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxth-0003M0-67
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:45:15 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so197117otk.9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=el/Ou0xHD4alZEL4fPu4ICzs/YUY/DdHeshtQwEYWLs=;
 b=xxLMa/6hxeiwREfCMCtNdhDcCidpOsMZuTPyrhICWvTYriYWDyOok6S28KczwWE3wp
 ZEVpBlmLOER4IPoweaPLkmsXwfukYWbaK5nj5l3HEsxay2F2eTRKD7ac/7kq2V5pdtLy
 KDv4vrIZgTO5n8TBFmCbiIH6Ey81qGBBj6LaZjj1/Z77W1ay9/JXnuDLI4k0s7fdNBfB
 xGYx2rl1/W713K/Mj1mPsLpddYKN+3b0FEwZOTE7VyYaXsdLudJCzhOD7vGFsl3o9qIg
 b8sWhPQfv5JMnFr4+yN2lPiFLhtxtEZ6HzVgecViYn9WA2vR4bFpT+i8dWppPZHVCUnv
 Qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=el/Ou0xHD4alZEL4fPu4ICzs/YUY/DdHeshtQwEYWLs=;
 b=ioF1Za9ltH9ddC38kom6cFimw1bT/E3xE1cEp/O8bTE2EflRaGsmMQ66R3Nm+d0vqV
 WQ9f0bTe7KruFzWY4/76fm+J16PQXdvzK//3UujN5G+fbF4kLoQf6MVpyOgS/3oLESXX
 4WTl1rfP95mIaogxCKFnY3BF/pgJVx/T0ZCw24sj405Nlkx+u/QI4vMVwkyi96o+xOi6
 6WnESYffI1oDxQU3iyxQ1VgEhvcqY4+/EVGvKrFCmQsp1bqaQKoWNmEGOke/WQGGDcZn
 tno6AnM8TJ8SKBhf0LfZ525AloZZPrI/SJ1dohfxDCXJDWwROkraCkVeRevY3JxEMf4T
 lPLA==
X-Gm-Message-State: AOAM5309CY7GFe2NkjUfLCexoQQTrjfhCmkJGtkUHpCrMTzohg9HeXfF
 Z7BYPEepTrIqSStDdssAjLjH4R71YtZCZUZC+SZD+Q==
X-Google-Smtp-Source: ABdhPJz5goQtLgbwGcqjDGe64rd+awbidBXV0iu83OsC9eUcb3ecmJcKfRaw8Clh9c5jgSnOl9mfF00j/NuowE2vx0Y=
X-Received: by 2002:a9d:6215:: with SMTP id g21mr24012505otj.116.1629917111904; 
 Wed, 25 Aug 2021 11:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-6-andrew@daynix.com>
 <87y29dct4m.fsf@dusky.pond.sub.org>
 <CABcq3pE3vAh=Cs=VjjkioooEbbPjgNEtCEZGwtoxaCn0OCRQkg@mail.gmail.com>
 <877dgbpco1.fsf@dusky.pond.sub.org>
In-Reply-To: <877dgbpco1.fsf@dusky.pond.sub.org>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 25 Aug 2021 21:45:01 +0300
Message-ID: <CABcq3pEiPCdYYmA2qCJaFYyDPS+mPe5Wa2oWMfGyqdxjhyaWdg@mail.gmail.com>
Subject: Re: [PATCH 5/5] qmp: Added qemu-ebpf-rss-path command.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000077fdcb05ca66a680"
Received-SPF: none client-ip=2607:f8b0:4864:20::333;
 envelope-from=andrew@daynix.com; helo=mail-ot1-x333.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000077fdcb05ca66a680
Content-Type: text/plain; charset="UTF-8"

Hi,
Yes, the stamp check was added.
So the qemu emulator should return a suitable RSS BPF helper or nothing.
Each qemu emulator may have a different helper that suits it.
So, the idea is to ask for the helper from qemu.

On Tue, Aug 24, 2021 at 9:41 AM Markus Armbruster <armbru@redhat.com> wrote:

> Andrew Melnichenko <andrew@daynix.com> writes:
>
> > Hi,
> >
> >> The helper may or may not be installed at the path compiled into QEMU.
> >>
> > Yes, so the helper will not be called - QEMU will try to initiate eBPF
> RSS
> > or use "in-qemu" RSS.
>
> My point is: the proposed command's mission is to help the management
> application run the right helper.  However, its advice is *unreliable*.
> It may point to the wrong helper, or to nothing at all.  The right
> helper may still exist elsewhere.
>
> I suspect you're trying to address the problem at the wrong level.
>
> Similar versioning issues exist with other helpers.  We've been doing
> fine without QEMU providing unreliable advice on where they might sit in
> the file system.  What makes this one different?
>
> >> What happens when you use the wrong helper?
> >>
> > UB - in most cases, eBPF program will work with wrong configurations.
> > That's why the stamp was added.
> >
> > query-helper-paths checks the stamp only for RSS helper.
>
> I have no idea what you're talking about :)
>
> My best guess is that you're trying to tell me that attempting to work
> with the wrong helper will fail cleanly due to some stamp check.  That
> would be nice.
>
>

--00000000000077fdcb05ca66a680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>Yes, the stamp check was added.</div><d=
iv>So the qemu emulator should return a suitable RSS BPF helper or nothing.=
</div><div>Each qemu emulator may have a different helper that suits it.</d=
iv><div>So, the idea is to ask for the helper from qemu.<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, A=
ug 24, 2021 at 9:41 AM Markus Armbruster &lt;<a href=3D"mailto:armbru@redha=
t.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Andrew Melnichenko &lt;<a href=3D"mailto:andrew@day=
nix.com" target=3D"_blank">andrew@daynix.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt;&gt; The helper may or may not be installed at the path compiled into Q=
EMU.<br>
&gt;&gt;<br>
&gt; Yes, so the helper will not be called - QEMU will try to initiate eBPF=
 RSS<br>
&gt; or use &quot;in-qemu&quot; RSS.<br>
<br>
My point is: the proposed command&#39;s mission is to help the management<b=
r>
application run the right helper.=C2=A0 However, its advice is *unreliable*=
.<br>
It may point to the wrong helper, or to nothing at all.=C2=A0 The right<br>
helper may still exist elsewhere.<br>
<br>
I suspect you&#39;re trying to address the problem at the wrong level.<br>
<br>
Similar versioning issues exist with other helpers.=C2=A0 We&#39;ve been do=
ing<br>
fine without QEMU providing unreliable advice on where they might sit in<br=
>
the file system.=C2=A0 What makes this one different?<br>
<br>
&gt;&gt; What happens when you use the wrong helper?<br>
&gt;&gt;<br>
&gt; UB - in most cases, eBPF program will work with wrong configurations.<=
br>
&gt; That&#39;s why the stamp was added.<br>
&gt;<br>
&gt; query-helper-paths checks the stamp only for RSS helper.<br>
<br>
I have no idea what you&#39;re talking about :)<br>
<br>
My best guess is that you&#39;re trying to tell me that attempting to work<=
br>
with the wrong helper will fail cleanly due to some stamp check.=C2=A0 That=
<br>
would be nice.<br>
<br>
</blockquote></div>

--00000000000077fdcb05ca66a680--

