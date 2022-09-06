Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE95AE198
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:52:46 +0200 (CEST)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTO1-0004ac-AW
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oVTDk-0005js-8r
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:42:08 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oVTDh-0004bj-IB
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:42:07 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3452214cec6so45926507b3.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=n46MoWEHJaPQ5YK6bixL5WDXb5tdh13ahkfoxzPqA7I=;
 b=ZbY6dyjNiizPrV7Ew1TLCWB360+AihOJrgWnT7sBvQQvBVn+ze78qQXvedqic13DGV
 RDgsEblLSQcjVbVlZEj2KINHux3dMYpaerzBmQkExftu26PNPtxE8q6IhceDJfUKakfB
 YQFfQHkqaX4PC+rDQgAZ8UVoFeDmhhTGi7A/BoZnNJu89Y6QUgThhJuCn66OrMnT7LKr
 rX6Dh6YR0yrvV/UVXg6UJLyRpU559L5TNPQzLGtzgziHY7AU4YB0DbcD0an5sRRcEFU8
 WRigOaa9g7tDkvQHnlGnCIHOR+TA0zybXc1mnpgRhh/JAzJLPX62MpPnEBQyAG62Z7T7
 9jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=n46MoWEHJaPQ5YK6bixL5WDXb5tdh13ahkfoxzPqA7I=;
 b=fSJoZEgDrtLaYI993RRpQn1b1vWROQPIuh/msj+rX/Ljwpmuz71JQ0Nc072XPdONs3
 dHqkulZrHlAmk1LZtNnx37ZJJj2xiUjakEcEPniFGiOk7sqCJh6ibObYU9uxFg5dvnFo
 K6Hfgz5bv163CBUA+xZeZHJJnZXPP3+YorWuOoVGpYe8S8TpYF46rXcTJ3tJ8+gUujGr
 cduCFbzdtxiLSHpKcw1O2N1YskK/WbKxphQxQR6LJrsjXaXjW32TCcTkll/zfvQtk5aH
 PkgTFIMPaDitSpFh7d8D6VsZDSO9C9trXPng1Ig+AYejLkLrrIx++Rv58lqwukuCyFBu
 2eKA==
X-Gm-Message-State: ACgBeo0KeKTqO8SNWMI5d80sXve1c6GvC9atMLE8j6Lub386XQRO9097
 +AeaN38lSvxNSxLPNBDPg1osy2ToboWr2iSUV+dbVQ==
X-Google-Smtp-Source: AA6agR50dmlhBcAUN3kOZPetrK8xnXgH+hDkN0rG+LZn7j8mdc73n1DG0JtXSgkrQrsBduahUFhMnariDygwGaCkYWo=
X-Received: by 2002:a0d:c585:0:b0:345:44cf:632e with SMTP id
 h127-20020a0dc585000000b0034544cf632emr6485904ywd.143.1662450112611; Tue, 06
 Sep 2022 00:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
 <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
 <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
In-Reply-To: <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 6 Sep 2022 09:41:41 +0200
Message-ID: <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=chigot@adacore.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Bin,

> On Mon, Sep 5, 2022 at 4:10 PM Cl=C3=A9ment Chigot <chigot@adacore.com> w=
rote:
> >
> > Hi all,
> >
> > I did reach the same issue while trying to connect a gdb to qemu on
> > Windows hosts. Some inputs send by gdb aren't getting correctly pulled,
> > they will be retrieved only once g_poll times out.
> >
> > As you explained earlier, the issue, AFAICT, is that WSAEnumNetworkEven=
ts
> > will reset the internal events before select can detect them.
>
> No, I don't think WSAEnumNetworkEvents and select cannot be used together=
.
>
> MSDN says:
> https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-s=
elect
>
> "The select function has no effect on the persistence of socket events
> registered with WSAAsyncSelect or WSAEventSelect."
>
> That sounds to me like current usage in QEMU codes does not have a proble=
m.

Yes, but WSAEnumNetworkEvents has effects. Thus, it might reset the
events before
select detects them no ?
Moreover, I'm not sure what they mean by "persistence of WSAEventSelect".
Does that mean that select doesn't change the events wanted to be
notified as set
by WSAEventSelect or that select isn't resetting the events once
retrieved, as you
imply ?
Moreover, the current code is creating the event object with
CreateEvent(NULL, FALSE, FALSE, NULL). The first FALSE implies that we want
an auto-reset. The MSDN doc says:

"Boolean that specifies whether a manual-reset or auto-reset event
object is created.
If TRUE, then you must use the ResetEvent function to manually reset
the state to
nonsignaled. If FALSE, the system automatically resets the state to nonsign=
aled
after a single waiting thread has been released."

However, I'm not sure if I understand correctly what "after a single
waiting thread
has been released." signified. Is the reset occuring after recv() or
after select or
WSAEnumNetworkEvents calls ? AFAIR, I've tried to move to manual-reset with
the current qemu but it doesn't change anything.

> > Sadly, I didn't find any way to adjust the current code using select to
> > avoid that. As select and any cleaner (ever WSAEnumNetworkEvents or
> > WSEResetEvent) cannot be called in an atomic way, it seems that events
> > can always be received between the reset and the select. At least, all
> > my attempts failed.
>
> According to MSDN:
> https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-w=
saeventselect
>
> "Having successfully recorded the occurrence of the network event (by
> setting the corresponding bit in the internal network event record)
> and signaled the associated event object, no further actions are taken
> for that network event until the application makes the function call
> that implicitly reenables the setting of that network event and
> signaling of the associated event object."
>
> So events will be kept unsignaled after they are signaled, until the
> reenable routine is called. For example, recv() for the FD_READ event.

In my understanding, WSAEnumNetworkEvents states the opposite:
https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-wsa=
enumnetworkevents

"The Windows Sockets provider guarantees that the operations of copying
the network event record, clearing it and resetting any associated event
object are atomic, such that the next occurrence of a nominated network
event will cause the event object to become set."

> > The only solution I've found is to move completely to the Windows API
> > and stop calling select. This, however, needs some tricks. In Particula=
r, we
> > need to "remove" the support of GSources having only G_IO_HUP.
> > This is already kind of done as we currently don't detect them in
> > qio_channel_socket_source_check anyway.
> > This is mandatory because of the two GSources created on the same socke=
t.
> > IIRC, the first one (I'll call it the master GSource) is created during
> > the initialization of the channel-socket by update_ioc_handlers and wil=
l
> > have only G_IO_HUP to catch up.
> > The second one is created during the "prepare" phase of the first one,
> > in io_watch_poll_prepare. This one will have all the events we want
> > to pull (G_IO_IN here).
> > As they are referring to the same socket, the Windows API cannot know
> > on which GSources we want to catch which events. The solution is then
>
> I think Windows knows which events to catch. As WSAEventSelect() in
> channel-watch.c::qio_channel_create_socket_watch() tells Windows which
> event it should monitor.
>
> Both the "master" and "child" GSources are watching on the same socket
> with G_IO_IN condition (see qio_channel_create_socket_watch), and GLib
> is smart enough to merge these two resources into one in the event
> handle array which is passed to WaitForMultipleObjectsEx() in
> g_poll().

I've forgotten to mention it. But the current code only fails with newer gl=
ib
versions. I wasn't able to test all of them but it's working with 2.54 and
starts failing with versions after 2.60.
The qemu master isn't supporting 2.54 anymore. Thus I've tested that with
our internal qemu-6 which runs with 2.54. When upgrading glib, it starts
behaving like our issue.
Sadly, I wasn't able to test with glib-2.56/2.58 nor to find anything relev=
ant
in glib code which would explain our issue. (But I wasn't aware of the
two GSources at that time so maybe it's worth investigating again).

> I checked your patch, what you did seems to be something one would
> naturally write, but what is currently in the QEMU sources seems to be
> written intentionally.
>
> +Paolo Bonzini , you are the one who implemented the socket watch on
> Windows. Could you please help analyze this issue?
>
> > to avoid WSAEnumNetworkEvents for the master GSource which only has
> > G_IO_HUP (or for any GSource having only that).
> > As I said above, the current code doesn't do anything with it anyway.
> > So, IMO, it's safe to do so.
> >
> > I'll send you my patch attached. I was planning to send it in the follo=
wing
> > weeks anyway. I was just waiting to be sure everything looks fine on ou=
r
> > CI. Feel free to test and modify it if needed.
>
> I tested your patch. Unfortunately there is still one test case
> (migration-test.exe) throwing up the "Broken pipe" message.

I must say I didn't fully test it against qemu testsuite yet. Maybe there a=
re
some refinements to be done. "Broken pipe" might be linked to the missing
G_IO_HUP support.

> Can you test my patch instead to see if your gdb issue can be fixed?

Yeah sure. I'll try to do it this afternoon.

