Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0435AE087
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:06:55 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVSfd-0000Xe-J8
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oVSZu-0006eh-5i
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:00:58 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:42832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oVSZr-00063X-Ts
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:00:57 -0400
Received: by mail-qv1-xf31.google.com with SMTP id q8so7674665qvr.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=lKfDxOdzaX5nfOlTMIFJULNQR1iwcIOkDpBjbBnlC1U=;
 b=GkWsd/dWkRZzWAD/lUfTuTtW6JX0UxVRVufzBlEKPeF1Hpyb+QJMWVL0JkRFyP+uoj
 SbKfFzsVq0wN9BZOGi3OwFKYBiJhFlQrP6sckBWZDsx42bOlIf/5ohhsj+BxQeod6D2D
 5+lDJ40r+FQNEe4Aa2e9SxnB59r+XHTTL7GWQ+Zcm1h5iBQh6ecjt4dkc5WX6U7Rkqj7
 Vn9em7PYVKJ/W6SSRy2vub5sUx2gaC6sao5PT4EjOhZxGHNqofe27vpZ3teAGUknmUx/
 /thvM1I46PGoQFma7ztFWSamoceG5VKIsGzHVNNorakustUuiPYs4/3d/f02Bvpgp4lR
 IsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lKfDxOdzaX5nfOlTMIFJULNQR1iwcIOkDpBjbBnlC1U=;
 b=1FoFOA8euYjeYgzk1Wc+XH6DwCrUYepFUMJeKe187BFAsDKpzGAxZ4dBw0kSNhRXvS
 31X/rls3P4H/m1E5dYYsb8sjymt+8r7sF7XFVukuFa1G5ADE/gNdYeMLnzUxQsdhIq+W
 j0L3NDu5VKSsMBbO3pNi37337Zm2xymQhdRI84yCzq8KNeItlqmXsaH1/2hvDqCoCKze
 7KZ2w+AWz1SYLdejORXR3yxs47c8DZUumW82Toxv/etBsoDI9SRyKfax1X6SOwJsh3ON
 RP3grfoDkmbFBFv/65QbmeymFcZaI009PbQPPweQ4WDE4xsq8gDwIP7kB60/LEdEEyXs
 Sy9A==
X-Gm-Message-State: ACgBeo01uoLxTs3oppXlEgjPxGeIHFA5E8DlKBWtq50wkVZmC2aNEm2d
 37dVZw0/3JnZVqHvikULCv/5rnf1FvdO/eLivuU=
X-Google-Smtp-Source: AA6agR4HlppTuKT6LuTxbNzFru6VVpiD2aPljqPn7GnO7akGtRAxLb7lE0Pa1Srt8X1s+qr2AGrPq5T8l6wzF6Tpn3Y=
X-Received: by 2002:a0c:e511:0:b0:4aa:73d9:f4c3 with SMTP id
 l17-20020a0ce511000000b004aa73d9f4c3mr3626370qvm.51.1662447654375; Tue, 06
 Sep 2022 00:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
 <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
In-Reply-To: <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Sep 2022 15:00:43 +0800
Message-ID: <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
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

On Mon, Sep 5, 2022 at 4:10 PM Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
>
> Hi all,
>
> I did reach the same issue while trying to connect a gdb to qemu on
> Windows hosts. Some inputs send by gdb aren't getting correctly pulled,
> they will be retrieved only once g_poll times out.
>
> As you explained earlier, the issue, AFAICT, is that WSAEnumNetworkEvents
> will reset the internal events before select can detect them.

No, I don't think WSAEnumNetworkEvents and select cannot be used together.

MSDN says:
https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-sel=
ect

"The select function has no effect on the persistence of socket events
registered with WSAAsyncSelect or WSAEventSelect."

That sounds to me like current usage in QEMU codes does not have a problem.

> Sadly, I didn't find any way to adjust the current code using select to
> avoid that. As select and any cleaner (ever WSAEnumNetworkEvents or
> WSEResetEvent) cannot be called in an atomic way, it seems that events
> can always be received between the reset and the select. At least, all
> my attempts failed.

According to MSDN:
https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-wsa=
eventselect

"Having successfully recorded the occurrence of the network event (by
setting the corresponding bit in the internal network event record)
and signaled the associated event object, no further actions are taken
for that network event until the application makes the function call
that implicitly reenables the setting of that network event and
signaling of the associated event object."

So events will be kept unsignaled after they are signaled, until the
reenable routine is called. For example, recv() for the FD_READ event.

>
> The only solution I've found is to move completely to the Windows API
> and stop calling select. This, however, needs some tricks. In Particular,=
 we
> need to "remove" the support of GSources having only G_IO_HUP.
> This is already kind of done as we currently don't detect them in
> qio_channel_socket_source_check anyway.
> This is mandatory because of the two GSources created on the same socket.
> IIRC, the first one (I'll call it the master GSource) is created during
> the initialization of the channel-socket by update_ioc_handlers and will
> have only G_IO_HUP to catch up.
> The second one is created during the "prepare" phase of the first one,
> in io_watch_poll_prepare. This one will have all the events we want
> to pull (G_IO_IN here).
> As they are referring to the same socket, the Windows API cannot know
> on which GSources we want to catch which events. The solution is then

I think Windows knows which events to catch. As WSAEventSelect() in
channel-watch.c::qio_channel_create_socket_watch() tells Windows which
event it should monitor.

Both the "master" and "child" GSources are watching on the same socket
with G_IO_IN condition (see qio_channel_create_socket_watch), and GLib
is smart enough to merge these two resources into one in the event
handle array which is passed to WaitForMultipleObjectsEx() in
g_poll().

I checked your patch, what you did seems to be something one would
naturally write, but what is currently in the QEMU sources seems to be
written intentionally.

+Paolo Bonzini , you are the one who implemented the socket watch on
Windows. Could you please help analyze this issue?

> to avoid WSAEnumNetworkEvents for the master GSource which only has
> G_IO_HUP (or for any GSource having only that).
> As I said above, the current code doesn't do anything with it anyway.
> So, IMO, it's safe to do so.
>
> I'll send you my patch attached. I was planning to send it in the followi=
ng
> weeks anyway. I was just waiting to be sure everything looks fine on our
> CI. Feel free to test and modify it if needed.

I tested your patch. Unfortunately there is still one test case
(migration-test.exe) throwing up the "Broken pipe" message.

Can you test my patch instead to see if your gdb issue can be fixed?

>
> PS: I don't know if it will correctly extend if I simply attach it to
> my mail. If not, tell me I'll simply copy-paste it, even if it might
> mess up the space/tab stuff.
>
> > >> >>
> > >> >> ---
> > >> >> During the testing, I removed the following codes in update_ioc_h=
andlers():
> > >> >>
> > >> >>     remove_hup_source(s);
> > >> >>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
> > >> >>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup=
,
> > >> >>                           chr, NULL);
> > >> >>     g_source_attach(s->hup_source, chr->gcontext);
> > >> >>
> > >> >> and such change also makes the symptom go away.
> > >> >>
> > >> >> And if I moved the above codes to the beginning, before the call =
to
> > >> >> io_add_watch_poll(), the symptom also goes away.
> > >> >>
> > >> >> It seems two sources watching on the same socket event object is
> > >> >> the key that leads to the instability. The order of adding a sour=
ce
> > >> >> watch seems to also play a role but I can't explain why.
> > >> >> Hopefully a Windows and glib expert could explain this behavior.
> > >> >>
> > >> >
> > >> > Feel free to leave that comment in the commit message.
> > >>
> > >> Sure, will add the above message into the commit in v2.
> > >>
> > >> >
> > >> > This is strange, as both sources should have different events, cle=
aring one shouldn't affect the other.
> > >>
> > >> Both sources have the same event, as one QIO channel only has one
> > >> socket, and one socket can only be bound to one event.
> > >
> > >
> > >  "one socket can only be bound to one event", is that a WSAEventSelec=
t limitation?
> > >
> >
> > Yes, please see the MSDN:
> >
> > It is not possible to specify different event objects for different
> > network events. The following code will not work; the second call will
> > cancel the effects of the first, and only the FD_WRITE network event
> > will be associated with hEventObject2:
> >
> > rc =3D WSAEventSelect(s, hEventObject1, FD_READ);
> > rc =3D WSAEventSelect(s, hEventObject2, FD_WRITE); //bad
>
> Yes, the Windows API is handled at socket levels. That's why having
> two GSources on the same sockets is problematic.
> Note that maybe there is a mix to be done between your patch with
> the update_ioc_handlers part to be removed and my patch which improves
> the polling of channel-watch.

Regards,
Bin

