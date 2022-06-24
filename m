Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB45598DB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 13:47:38 +0200 (CEST)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4hmj-0004x6-1W
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o4hkZ-00047a-HX
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:45:23 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o4hkX-00084l-5b
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:45:22 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101b4f9e825so3407848fac.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fwAx7ST9y49n/sWxTlqLUzvNrfcFuufoo6MtygQHwxE=;
 b=EHUBK7pyK0lo4yjjZT+9Clo9722Fo3bemQjWjO5jDh0iazvRT5ghY6P1jcwqohwpEp
 FB0LpSgi/VGCPFgt90GwLna73FUpJc7ZOOXEjLkT1TjIpsywv5w+L7WY/p5vAJ8lYRRN
 9oscnZTYXCngs8jkQUibeXk/NRTWADv4pRK00OWoToXr0w4QPXUZrf8AhwhVUGbCAVwj
 6CJj1TNoXy0pZVMRHNkHFfbUEy9Ph3InsDwgeZqLNOoaxrfnfxODSq8jXVCiMoDDmTdj
 r0b6WyYZL5JXkpzhBN5dR0zpaEFo6xyS5s/DcI62FGn4YEVjRQMof8/sUnY0vQXbrzWi
 Ww6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwAx7ST9y49n/sWxTlqLUzvNrfcFuufoo6MtygQHwxE=;
 b=Vw62dpJ4N1E77M/lywXWutlOKACJftIUQT6o06HWwW+CRk1HagV44qwOdstJ+pMZ00
 redPHypccTj6laX4Z7mg8t8vBF3UBB811ipdsSOB8NkpNYRKWaVOVtUAlAIXB39Br2KL
 iTzLMnDJhzlUgK/fsvdF5LSJ6cqncirdXeKHW8shDY3k/afkSU8+YjYpmhf3oaYEyIvY
 u3XLZBWRoQ5Dj1K8spg/zs/SpDpmaUflBat8c6m7nmlJrQlhLyR8QQSv2mfJta0E7Tn1
 SUo0Na/W3dri9XUS46c3HJW4sf5s7yINCPeurV/ZsKjf3bBuJh0nw3uafkn5BYX8/ExZ
 FfQQ==
X-Gm-Message-State: AJIora+115sYJFvq0uR1mL2KD3Gczf1RNw3uJa+rLlpMcOpPlTrsU4yr
 yabAhufLMlLvDVH1sQCjA4qIenyjL3h4qKLDwM4=
X-Google-Smtp-Source: AGRyM1t11Qwto/op2LRVOMw0fPKK0tiv87J1Ot0qYhhKNbGFvQqWLvVVDQjh/Zt1twuVg2W1fwiZMTFDf2NNlUUp8u0=
X-Received: by 2002:a05:6870:a792:b0:f3:1eca:5ba6 with SMTP id
 x18-20020a056870a79200b000f31eca5ba6mr1851417oao.212.1656071119530; Fri, 24
 Jun 2022 04:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <YqnaYfYxv0yPCmpP@stefanha-x1.localdomain>
 <05c5bb1f-9a7f-1bad-8318-e85d4d2b3d9c@yandex-team.com>
In-Reply-To: <05c5bb1f-9a7f-1bad-8318-e85d4d2b3d9c@yandex-team.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 24 Jun 2022 12:45:10 +0100
Message-ID: <CAJSP0QXc=Hu2FZo5GHSFfJ=zgsfzYS3OroW=9V69hB4B4VCkMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Make local migration with TAP network device possible
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
Content-Type: multipart/alternative; boundary="000000000000cd710f05e2301a90"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cd710f05e2301a90
Content-Type: text/plain; charset="UTF-8"

Thanks! I will be offline for the next week.

Feel free to progress this series without my review.

Stefan

On Fri, Jun 24, 2022, 11:53 Andrey Ryabinin <arbn@yandex-team.com> wrote:

>
>
> On 6/15/22 16:10, Stefan Hajnoczi wrote:
> > On Tue, Jun 14, 2022 at 02:18:41PM +0300, Andrey Ryabinin wrote:
> >> Hi
> >>
> >> These couple patches aims to  make possible local migration (within one
> host)
> >> on the same TAP device used by source and destination QEMU
> >>
> >> The scenario looks like this
> >>  1. Create TAP devices and pass file descriptors to source QEMU
> >>  2. Launch destination QEMU (-incoming defer) and pass same descriptors
> to it.
> >>  3. Start migration
> >>
> >>
> >> Regarding the first patch: It makes possible to receive file descriptor
> in non-blocking
> >> state. But I probably didn't cover all FD users which might need to set
> blocking state after
> >> the patch. So I'm hopping for the hints where else, besides
> fd_start_incoming_migration()
> >> I need to put qemu_socket_set_block() calls.
> >
> > Nice feature. I am worried that these patches are unsafe/incomplete
> > though.
> >
> > Tap local migration isn't explicitly visible in the code. How will other
> > developers know the feature is there and how to avoid breaking it when
> > modifying the code? Maybe a migration test case, comments that explain
> > the rules about accessing the tap fd, and/or assertions?
> >
>
> Yeah, I'm writing avocado test case, will add it in future next iterations.
>
> > How does this interact with hw/net/vhost_net.c, which uses tap_get_fd()
> > to borrow the fd? I guess the idea is that the source VM is paused and
> > no tap activity is expected. Then migration handover happens and the
> > destination VM starts running and is allowed to access the tap fd.
> > However, the source VM still has vhost_net with the tap fd set up. I
> > wonder if there is any issue with interference between the two vhost_net
> > instances?
> >
>
> I'll try to take a closer look at code, let's see if I can find any
> possible issues.
> But I did some brief testing with vhost=on net device, and it find any
> problems.
> The test was
> 1. launch pings from source VM to host
> 2. Migrate
> 3. Check at dest VM that there is no lost packets.
>
>
> > These kinds of questions should be answered, mostly in the code but also
> > in the cover letter. It should be clear why this approach is correct.
> >
> > Thanks,
> > Stefan
> >
> >>
> >>
> >> Andrey Ryabinin (2):
> >>   chardev: don't set O_NONBLOCK on SCM_RIGHTS file descriptors.
> >>   tap: initialize TAPState->enabled according to the actual state of
> >>     queue
> >>
> >>  chardev/char-socket.c |  3 ---
> >>  io/channel-socket.c   |  3 ---
> >>  migration/fd.c        |  2 ++
> >>  net/tap-bsd.c         |  5 +++++
> >>  net/tap-linux.c       | 12 ++++++++++++
> >>  net/tap-solaris.c     |  5 +++++
> >>  net/tap.c             |  2 +-
> >>  net/tap_int.h         |  1 +
> >>  8 files changed, 26 insertions(+), 7 deletions(-)
> >>
> >> --
> >> 2.35.1
> >>
>
>

--000000000000cd710f05e2301a90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks! I will be offline for the next week.<div dir=3D"a=
uto"><br></div><div dir=3D"auto">Feel free to progress this series without =
my review.<br><div dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jun 24, 2022, 11:53 Andrey Ryabinin &lt;<a href=3D"mailto:arbn@y=
andex-team.com">arbn@yandex-team.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
<br>
On 6/15/22 16:10, Stefan Hajnoczi wrote:<br>
&gt; On Tue, Jun 14, 2022 at 02:18:41PM +0300, Andrey Ryabinin wrote:<br>
&gt;&gt; Hi<br>
&gt;&gt;<br>
&gt;&gt; These couple patches aims to=C2=A0 make possible local migration (=
within one host)<br>
&gt;&gt; on the same TAP device used by source and destination QEMU<br>
&gt;&gt;<br>
&gt;&gt; The scenario looks like this<br>
&gt;&gt;=C2=A0 1. Create TAP devices and pass file descriptors to source QE=
MU<br>
&gt;&gt;=C2=A0 2. Launch destination QEMU (-incoming defer) and pass same d=
escriptors to it.<br>
&gt;&gt;=C2=A0 3. Start migration<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regarding the first patch: It makes possible to receive file descr=
iptor in non-blocking<br>
&gt;&gt; state. But I probably didn&#39;t cover all FD users which might ne=
ed to set blocking state after<br>
&gt;&gt; the patch. So I&#39;m hopping for the hints where else, besides fd=
_start_incoming_migration()<br>
&gt;&gt; I need to put qemu_socket_set_block() calls.<br>
&gt; <br>
&gt; Nice feature. I am worried that these patches are unsafe/incomplete<br=
>
&gt; though.<br>
&gt; <br>
&gt; Tap local migration isn&#39;t explicitly visible in the code. How will=
 other<br>
&gt; developers know the feature is there and how to avoid breaking it when=
<br>
&gt; modifying the code? Maybe a migration test case, comments that explain=
<br>
&gt; the rules about accessing the tap fd, and/or assertions?<br>
&gt; <br>
<br>
Yeah, I&#39;m writing avocado test case, will add it in future next iterati=
ons.<br>
<br>
&gt; How does this interact with hw/net/vhost_net.c, which uses tap_get_fd(=
)<br>
&gt; to borrow the fd? I guess the idea is that the source VM is paused and=
<br>
&gt; no tap activity is expected. Then migration handover happens and the<b=
r>
&gt; destination VM starts running and is allowed to access the tap fd.<br>
&gt; However, the source VM still has vhost_net with the tap fd set up. I<b=
r>
&gt; wonder if there is any issue with interference between the two vhost_n=
et<br>
&gt; instances?<br>
&gt; <br>
<br>
I&#39;ll try to take a closer look at code, let&#39;s see if I can find any=
 possible issues.<br>
But I did some brief testing with vhost=3Don net device, and it find any pr=
oblems.<br>
The test was<br>
1. launch pings from source VM to host<br>
2. Migrate<br>
3. Check at dest VM that there is no lost packets.<br>
<br>
<br>
&gt; These kinds of questions should be answered, mostly in the code but al=
so<br>
&gt; in the cover letter. It should be clear why this approach is correct.<=
br>
&gt; <br>
&gt; Thanks,<br>
&gt; Stefan<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Andrey Ryabinin (2):<br>
&gt;&gt;=C2=A0 =C2=A0chardev: don&#39;t set O_NONBLOCK on SCM_RIGHTS file d=
escriptors.<br>
&gt;&gt;=C2=A0 =C2=A0tap: initialize TAPState-&gt;enabled according to the =
actual state of<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0queue<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 chardev/char-socket.c |=C2=A0 3 ---<br>
&gt;&gt;=C2=A0 io/channel-socket.c=C2=A0 =C2=A0|=C2=A0 3 ---<br>
&gt;&gt;=C2=A0 migration/fd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;&gt;=C2=A0 net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++=
++<br>
&gt;&gt;=C2=A0 net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<=
br>
&gt;&gt;=C2=A0 net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;&gt;=C2=A0 net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 net/tap_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
&gt;&gt;=C2=A0 8 files changed, 26 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.35.1<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--000000000000cd710f05e2301a90--

