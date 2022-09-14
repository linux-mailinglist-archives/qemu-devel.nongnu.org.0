Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C85B82A3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 10:11:39 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYNUg-0006xX-F4
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 04:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oYNS0-0005SB-GP
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 04:08:54 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oYNRy-0002qx-IW
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 04:08:52 -0400
Received: by mail-qt1-x830.google.com with SMTP id cb8so10603649qtb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=sjtrz9i50JhOBbD+sGyUrAd8Bo2GZgPC+9xHb/4HWAs=;
 b=kdfzAcZfo3Yz23gXi6VO3yAHYD0YUgoBpQJKHX4rA3299UqssiqpMf8RE6q1k4EjFl
 kzabnjpMBRK8RM1q807SZsKVKzQ/wx1TIOgpCoRoswyLjTBu4l4oQ1iHhVb7f3dKG0iB
 VUBr7OSE++35C7K7BnDf44G9E2jedgZgfGwjkz7W3nese1HJHYqOZmVXO5piM4velCpw
 VvhMyL8bh1f1yFEqiETYx2pUABWabasJNK1nZo5R/XnHaIaE8enTR99zJxjFnFXqq2+v
 sn6ru6vdUDN3mSSKkf1e9/mJCyrOgXgftoUmsCZIHpnNJ0AC0utF9yUE/hWIcJj1dKgs
 DwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sjtrz9i50JhOBbD+sGyUrAd8Bo2GZgPC+9xHb/4HWAs=;
 b=6sk4f+794jVxucbNonRElBvolt/noIPwVZm8FVoohxYDW5W2L8DP3OiP+F8aAoN+1w
 eBlfuQq9bPM4kr6lRSG7U898bIQCE9vKTKqess4H3GgbDuT4tzIqkav+35O/ewFwuGIM
 B260s/wfnnDYLuCtDOjfAMnX7QTnZK7uJ5Cuos31v+yjOzYTAbUkwGDAKXvZtan17O56
 DwMdmaOBh5Q4UpQDcmc31YqJrTHp2vzIZmtegnLWABTPDeD1eWidOBqGBfSt8Na2n56C
 BxH6IRWG0T11Ity0fGkqwhU6AGwJbTwCim5BnvJs+gmrxSAgoPfBYP53MkMRVRNa0wLw
 KuOQ==
X-Gm-Message-State: ACgBeo2YWVgXo4U0pTKJAdh2TFjvjKfJJYP2mnDKec9Z0FynUrj+fat5
 sA4EsrYGVZumzFS1Wg3lsToKJ1FzNz7qecXhAUM=
X-Google-Smtp-Source: AA6agR4t4FyMZIKcgi+0AkKO52vbVZJ/lvLl/nHszDeqxly8M5ZKnrbo46kWaUNnaLAEm9fRNf8ZlFvB1vKTcOqD1C8=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr32837061qtw.391.1663142924740; Wed, 14
 Sep 2022 01:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
 <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
 <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
 <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
 <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
 <CAJ307EjyXxbGLK-PhBjf18p3AApYM-jGqA2L9q3xLS9wX16h_w@mail.gmail.com>
 <CAEUhbmWStgz4oUEgrtAVU_YFdKSPFJrK-4kd+DP4jqLS51+X+A@mail.gmail.com>
In-Reply-To: <CAEUhbmWStgz4oUEgrtAVU_YFdKSPFJrK-4kd+DP4jqLS51+X+A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Sep 2022 16:08:33 +0800
Message-ID: <CAEUhbmVYPo46nx8LLXcS21myzxcwT0HAzKt+cTRprmn06+g0PQ@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Sep 7, 2022 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Tue, Sep 6, 2022 at 8:06 PM Cl=C3=A9ment Chigot <chigot@adacore.com> w=
rote:
> >
> > > > > I checked your patch, what you did seems to be something one woul=
d
> > > > > naturally write, but what is currently in the QEMU sources seems =
to be
> > > > > written intentionally.
> > > > >
> > > > > +Paolo Bonzini , you are the one who implemented the socket watch=
 on
> > > > > Windows. Could you please help analyze this issue?
> > > > >
> > > > > > to avoid WSAEnumNetworkEvents for the master GSource which only=
 has
> > > > > > G_IO_HUP (or for any GSource having only that).
> > > > > > As I said above, the current code doesn't do anything with it a=
nyway.
> > > > > > So, IMO, it's safe to do so.
> > > > > >
> > > > > > I'll send you my patch attached. I was planning to send it in t=
he following
> > > > > > weeks anyway. I was just waiting to be sure everything looks fi=
ne on our
> > > > > > CI. Feel free to test and modify it if needed.
> > > > >
> > > > > I tested your patch. Unfortunately there is still one test case
> > > > > (migration-test.exe) throwing up the "Broken pipe" message.
> > > >
> > > > I must say I didn't fully test it against qemu testsuite yet. Maybe=
 there are
> > > > some refinements to be done. "Broken pipe" might be linked to the m=
issing
> > > > G_IO_HUP support.
> > > >
> > > > > Can you test my patch instead to see if your gdb issue can be fix=
ed?
> > > >
> > > > Yeah sure. I'll try to do it this afternoon.
> >
> > I can't explain how mad at me I am... I'm pretty sure your patch was th=
e first
> > thing I've tried when I encountered this issue. But it wasn't working
> > or IIRC the
> > issue went away but that was because the polling was actually disabled =
(looping
> > indefinitely)...I'm suspecting that I already had changed the CreateEve=
nt for
> > WSACreateEvent which forces you to handle the reset.
> > Finally, I end up struggling reworking the whole check function...
> > But yeah, your patch does work fine on my gdb issues too.
>
> Good to know this patch works for you too.
>
> > And I guess the events are reset when recv() is being called because of=
 the
> > auto-reset feature set up by CreateEvent().
> > IIUC, what Marc-Andr=C3=A9 means by busy loop is the polling being loop=
ing
> > indefinitely as I encountered. I can ensure that this patch doesn't do =
that.
> > It can be easily checked by setting the env variable G_MAIN_POLL_DEBUG.
> > It'll show what g_poll is doing and it's normally always available on
> > Windows.
> >
> > Anyway, we'll wait for Paolo to see if he remembers why he had to call
> > WSAEnumNetworkEvents. Otherwize, let's go for your patch. Mine might
> > be a good start to improve the whole polling on Windows but if it doesn=
't
> > work in your case, it then needs some refinements.
> >
>
> Yeah, this issue bugged me quite a lot. If we want to reset the event
> in qio_channel_socket_source_check(), we will have to do the following
> to make sure qtests are happy.
>
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index 43d38494f7..f1e1650b81 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -124,8 +124,6 @@ qio_channel_socket_source_check(GSource *source)
> return 0;
> }
> - WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
> -
> FD_ZERO(&rfds);
> FD_ZERO(&wfds);
> FD_ZERO(&xfds);
> @@ -153,6 +151,10 @@ qio_channel_socket_source_check(GSource *source)
> ssource->revents |=3D G_IO_PRI;
> }
> + if (ssource->revents) {
> + WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
> + }
> +
> return ssource->revents;
> }
>
> Removing "if (ssource->revents)" won't work.
>
> It seems to me that resetting the event twice (one time with the
> master Gsource, and the other time with the child GSource) causes some
> bizarre behavior. But MSDN [1] says
>
>     "Resetting an event that is already reset has no effect."
>
> [1] https://docs.microsoft.com/en-us/windows/win32/api/synchapi/nf-syncha=
pi-resetevent
>

Paolo, any comments about this issue?

Regards,
Bin

