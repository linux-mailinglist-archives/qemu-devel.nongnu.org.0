Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952355AE24B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:19:03 +0200 (CEST)
Received: from localhost ([::1]:43560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTnR-000852-RR
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oVTjc-0005yF-VM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:15:06 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oVTja-0001Vc-NQ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:15:04 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id ml1so1549721qvb.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=8Gt95rW2+YRZNVh25oYe3lccPp04wznuttCqY165158=;
 b=Dyp23o4/0kOXMBM3L6UMSx0+OE526ZOIDQ8NAfk/yxkRceqN08KnMSTXRpkaDhv94Z
 /sB27GK0/Jl0+agKHCAEB86PR8QjHNxAaGkgMVV/AwTUcSKEluzbJAlvNAEbB4+dd/sb
 qytS4wZn5swbVxYlBNk36X0GDMuqlKbJDaMw+kA5L1iWCxlYFh9f4NYpHe2UdZM3YTh2
 EK9qNatQcTKOZK8Jxchv+df9V1cAErjhlzIBF7JHC3Rd/oq1nzp+RnGOUy1oVSidC78t
 sqoz0D9vN/etwhGYmFy4XA8ReQ9yR06iJXGsK++EIs4aFaYSsi82sDWaZczRDyWGB25q
 gagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8Gt95rW2+YRZNVh25oYe3lccPp04wznuttCqY165158=;
 b=4wZof5rFcPNzPgoC+UY5mickKtrzvqeB092N8kYlTdY7Zvtn7kKHRxiOAjwNJV+GxK
 odjRsTjDh8XJNMKqtOt1SuAt/Y9fd7hhfmeL2ztT2xeC+BMahMzNneOpockhNzI+kNo3
 jSNEO9R3B2/304w6SvJE4OsbM8xYaZjPmmO5u4NT9EMWve62AG+fw75XODictDkF15Wi
 RjQBXluhQpxhtHq2l7u7u2KpVYk5VDMK80FcUZSNkGre5XmNGObkrQcbdlMN9Xcj9w2d
 hHn/UCmMmp8IybObLQDgcJ02Xw0OVcXjhDRMs2svWeVDa9n5NupyZs1gc/SZoMGrw3X0
 ybbQ==
X-Gm-Message-State: ACgBeo0rQg3crTsNk2oVbr0u3IWCps7VHnorXc11wH3y95jOtTZj4OMD
 AQrIFlRTGYyct1ySBI99OKCtJgrEhGTruLspecI=
X-Google-Smtp-Source: AA6agR6OhIF31fLNsagyJJLDtLijcOJKSS52rJOjkfglrYqDMFBWEav0rcCegLpeiuwCMe80cdU01fyV1PqZb1Ep7aU=
X-Received: by 2002:a05:6214:4115:b0:499:3520:1ee7 with SMTP id
 kc21-20020a056214411500b0049935201ee7mr19856609qvb.122.1662452101706; Tue, 06
 Sep 2022 01:15:01 -0700 (PDT)
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
In-Reply-To: <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Sep 2022 16:14:50 +0800
Message-ID: <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2d.google.com
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

Hi Cl=C3=A9ment,

On Tue, Sep 6, 2022 at 3:41 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
>
> Hi Bin,
>
> > On Mon, Sep 5, 2022 at 4:10 PM Cl=C3=A9ment Chigot <chigot@adacore.com>=
 wrote:
> > >
> > > Hi all,
> > >
> > > I did reach the same issue while trying to connect a gdb to qemu on
> > > Windows hosts. Some inputs send by gdb aren't getting correctly pulle=
d,
> > > they will be retrieved only once g_poll times out.
> > >
> > > As you explained earlier, the issue, AFAICT, is that WSAEnumNetworkEv=
ents
> > > will reset the internal events before select can detect them.
> >
> > No, I don't think WSAEnumNetworkEvents and select cannot be used togeth=
er.
> >
> > MSDN says:
> > https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2=
-select
> >
> > "The select function has no effect on the persistence of socket events
> > registered with WSAAsyncSelect or WSAEventSelect."
> >
> > That sounds to me like current usage in QEMU codes does not have a prob=
lem.
>
> Yes, but WSAEnumNetworkEvents has effects. Thus, it might reset the
> events before
> select detects them no ?

Even if the event *handle* is reset, select can still detect the
network event has happened. I think the above MSDN statement is trying
to explain this.

> Moreover, I'm not sure what they mean by "persistence of WSAEventSelect".
> Does that mean that select doesn't change the events wanted to be
> notified as set
> by WSAEventSelect or that select isn't resetting the events once
> retrieved, as you
> imply ?

My understanding is that select just determines the socket status
neither from the event handle associated with the socket, nor does it
change anything on the event handle.

> Moreover, the current code is creating the event object with
> CreateEvent(NULL, FALSE, FALSE, NULL). The first FALSE implies that we wa=
nt
> an auto-reset. The MSDN doc says:
>
> "Boolean that specifies whether a manual-reset or auto-reset event
> object is created.
> If TRUE, then you must use the ResetEvent function to manually reset
> the state to
> nonsignaled. If FALSE, the system automatically resets the state to nonsi=
gnaled
> after a single waiting thread has been released."

Yes, I think this is a bug however when I changed to CreateEvent(NULL,
TRUE, FALSE, NULL) or WSACreateEvent() there are still "Broken pipe"
errors ...

> However, I'm not sure if I understand correctly what "after a single
> waiting thread
> has been released." signified. Is the reset occuring after recv() or
> after select or
> WSAEnumNetworkEvents calls ? AFAIR, I've tried to move to manual-reset wi=
th
> the current qemu but it doesn't change anything.

The same here :(

>
> > > Sadly, I didn't find any way to adjust the current code using select =
to
> > > avoid that. As select and any cleaner (ever WSAEnumNetworkEvents or
> > > WSEResetEvent) cannot be called in an atomic way, it seems that event=
s
> > > can always be received between the reset and the select. At least, al=
l
> > > my attempts failed.
> >
> > According to MSDN:
> > https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2=
-wsaeventselect
> >
> > "Having successfully recorded the occurrence of the network event (by
> > setting the corresponding bit in the internal network event record)
> > and signaled the associated event object, no further actions are taken
> > for that network event until the application makes the function call
> > that implicitly reenables the setting of that network event and
> > signaling of the associated event object."
> >
> > So events will be kept unsignaled after they are signaled, until the
> > reenable routine is called. For example, recv() for the FD_READ event.
>
> In my understanding, WSAEnumNetworkEvents states the opposite:
> https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-w=
saenumnetworkevents
>
> "The Windows Sockets provider guarantees that the operations of copying
> the network event record, clearing it and resetting any associated event
> object are atomic, such that the next occurrence of a nominated network
> event will cause the event object to become set."

My interpretation of this does not conflict with the WSAEventSelect().
I think they are just two things.

>
> > > The only solution I've found is to move completely to the Windows API
> > > and stop calling select. This, however, needs some tricks. In Particu=
lar, we
> > > need to "remove" the support of GSources having only G_IO_HUP.
> > > This is already kind of done as we currently don't detect them in
> > > qio_channel_socket_source_check anyway.
> > > This is mandatory because of the two GSources created on the same soc=
ket.
> > > IIRC, the first one (I'll call it the master GSource) is created duri=
ng
> > > the initialization of the channel-socket by update_ioc_handlers and w=
ill
> > > have only G_IO_HUP to catch up.
> > > The second one is created during the "prepare" phase of the first one=
,
> > > in io_watch_poll_prepare. This one will have all the events we want
> > > to pull (G_IO_IN here).
> > > As they are referring to the same socket, the Windows API cannot know
> > > on which GSources we want to catch which events. The solution is then
> >
> > I think Windows knows which events to catch. As WSAEventSelect() in
> > channel-watch.c::qio_channel_create_socket_watch() tells Windows which
> > event it should monitor.
> >
> > Both the "master" and "child" GSources are watching on the same socket
> > with G_IO_IN condition (see qio_channel_create_socket_watch), and GLib
> > is smart enough to merge these two resources into one in the event
> > handle array which is passed to WaitForMultipleObjectsEx() in
> > g_poll().
>
> I've forgotten to mention it. But the current code only fails with newer =
glib
> versions. I wasn't able to test all of them but it's working with 2.54 an=
d
> starts failing with versions after 2.60.
> The qemu master isn't supporting 2.54 anymore. Thus I've tested that with
> our internal qemu-6 which runs with 2.54. When upgrading glib, it starts
> behaving like our issue.
> Sadly, I wasn't able to test with glib-2.56/2.58 nor to find anything rel=
evant
> in glib code which would explain our issue. (But I wasn't aware of the
> two GSources at that time so maybe it's worth investigating again).
>

Ah, good to know glib version matters.

> > I checked your patch, what you did seems to be something one would
> > naturally write, but what is currently in the QEMU sources seems to be
> > written intentionally.
> >
> > +Paolo Bonzini , you are the one who implemented the socket watch on
> > Windows. Could you please help analyze this issue?
> >
> > > to avoid WSAEnumNetworkEvents for the master GSource which only has
> > > G_IO_HUP (or for any GSource having only that).
> > > As I said above, the current code doesn't do anything with it anyway.
> > > So, IMO, it's safe to do so.
> > >
> > > I'll send you my patch attached. I was planning to send it in the fol=
lowing
> > > weeks anyway. I was just waiting to be sure everything looks fine on =
our
> > > CI. Feel free to test and modify it if needed.
> >
> > I tested your patch. Unfortunately there is still one test case
> > (migration-test.exe) throwing up the "Broken pipe" message.
>
> I must say I didn't fully test it against qemu testsuite yet. Maybe there=
 are
> some refinements to be done. "Broken pipe" might be linked to the missing
> G_IO_HUP support.
>
> > Can you test my patch instead to see if your gdb issue can be fixed?
>
> Yeah sure. I'll try to do it this afternoon.

Thanks!

Regards,
Bin

