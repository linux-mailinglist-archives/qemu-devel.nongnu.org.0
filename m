Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500133088C2
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:01:41 +0100 (CET)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ST6-0002zP-9F
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5SPp-0001M7-8j
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:58:17 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5SPm-0005xA-QT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:58:17 -0500
Received: by mail-ej1-x630.google.com with SMTP id gx5so12585289ejb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w0ZkYYFQCF4lQAgeIuo43d1QaYnzf2yGJrStoyQP/VQ=;
 b=VN8TaXvkXPZ6sJbOS5ugf4viwEUHIJKRLiuTL6L02aRz9e/s25Ad7cDlRV9v3z5I8X
 1sFd72ZrsgvjPf5Y4B/A5G146921VezYADJM9KbvCe+ttTi1oyY6JWix7kyeL33ngTF0
 9Y4ILQfkhL+ghDyMzxrH3TRhQTtG1+D60MYhw3R0VIPiOHPUcxzGInsDeMiHZmlA4nW4
 /2gHRKRr4MmUgb2ZiMzXSum4+VklVfN26pBnSMPR4kWfhEBCJjtR3k/gBuDXlLiDH++V
 OxQ0j46uOnQuFUhVaR5m1EAh5ztLeY9r3BoSW/DWk8eMVDY/hKHcIydG9Umb6lXIMgg9
 kM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w0ZkYYFQCF4lQAgeIuo43d1QaYnzf2yGJrStoyQP/VQ=;
 b=dUp9AtVR5/ohcm9DgaVzaq5hR4eBluRAaj/93FW7olBHxf25BRHOR62D5HnYvEsoIa
 MAaszzgkNOiz4GVsxBASmrmlKrs6UIv94hjktrVHjb7cm3tYXLARNjG7NXDD8m91aZLn
 fjRX1Unk0TeN49OJ8VI1yHilR3SYTi6uVvtN/BcuDgcZZFrxNMepULOnSdZlTRaiLKFM
 dDeErhnIuwPq7WfH5WkOZfpcM9ZVBw/2iGpK+LyOkmSrCLe8/6ZzOXjXB+UkSFyU94a5
 Q4yiCm331TqNAiMw0iNVLVXmXEvV9VGlejgen+x8k8Gm3Ii7kf/DHgLQtyD4XvTI8P2l
 I9UQ==
X-Gm-Message-State: AOAM531/JnbNRC7ebsGJRacd5Vxwyn8MclCWHmZ7JZx7kXilJD1KCbXt
 Mq1doS6iSGASmPKsa6Dv1oC+IwPqNZxjTZIlePA=
X-Google-Smtp-Source: ABdhPJwZZ+79J/Yo90aSBS+QI7bqIqdeQCWhg7ThdJWIhnG7RjP+dY+62P7jUL4yHc/jyY7a1OLwqK9AUM+Lfdb/GT8=
X-Received: by 2002:a17:906:2785:: with SMTP id
 j5mr4040911ejc.527.1611921492902; 
 Fri, 29 Jan 2021 03:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129112412.GH4001740@redhat.com>
In-Reply-To: <20210129112412.GH4001740@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 29 Jan 2021 15:58:00 +0400
Message-ID: <CAJ+F1CLerj6GSN-XQftZf8m=_cCdcJb1Yn-yFGDNP_D18uN5FA@mail.gmail.com>
Subject: Re: vnc clipboard support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 29, 2021 at 3:24 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Jan 29, 2021 at 12:18:19AM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jan 28, 2021 at 9:14 PM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
> >
> > >   Hi folks,
> > >
> > > I'm looking for a good way to implement cut+paste support for vnc.
> > >
> > > The vnc core protocol has support for text/plain cut+paste, and there
> > > is an extension adding support for other formats.  That'll cover one
> > > part of the problem, exchanging cut+paste data between vnc client and
> > > qemu vnc server.
> > >
> > > The tricky part is the second: the guest <=3D> qemu communication.
> > > I see basically two possible approaches here:
> > >
> > >   (1) Have some guest agent (spice does it that way).
> > >       Advantage: more flexible, allows more features.
> > >       Disadvantage: requires agent in the guest.
> > >
> > >   (2) Send text as key events.
> > >       Advantage: no guest agent needed.
> > >       Disadvantage: is translated by guests keyboard map, so qemu
> > >       needs to know the map for proper char -> key event translation.
> > >       Only works for text/plain and only for chars you can easily
> > >       type, anything needing input methods (emoji for example)
> > >       isn't going to fly.
> > >
> > > I think that (1) is clearly the better way.  Given that the agent
> > > would need to run in user wayland/xorg session context the existing
> > > qemu-guest-agent will not work.  Also linking against some UI library
> > > like gtk3 for clipboard handling is not something we want for the
> > > qemu-guest-agent.  So we need another one, I'll name it
> > > qemu-clipboard-agent for the rest of this mail.  And we need a
> > > communication channel.
> > >
> > > I'd tend to model the qemu-clipboard-agent simliar to the
> > > qemu-guest-agent, i.e. have some stream as communication path and run
> > > some stream protocol over it.
> > >
> > > Stream options I see are (in order of personal preference):
> > >
> > >   (1) New virtio-serial port.  virtio-serial likely is there anyway
> > >       for the qemu-guest-agent ...
> > >
> > >   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
> > >       channel, i.e. qemu-clipboard-agent will proxy everything throug=
h
> > >       qemu-guest-agent (spice does it that way).
> > >
> > > Protocol options I see are (not sure yet which to prefer, need to hav=
e
> > > a closer look at the candidates):
> > >
> > >   (1) Add clipboard commands to QMP and use these.
> > >
> > >   (2) Reuse the clipboard bits of the vnc protocol (forward
> > >       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
> > >
> > >   (3) Reuse the clipboard bits of the spice-agent protocol.
> > >
> > >   (4) Reuse the clipboard bits of the wayland protocol.
> > >
> > > Once we have sorted the qemu <-> guest communication path it should b=
e
> > > possible to also hook up other UIs (specifically gtk) without too muc=
h
> > > effort.  Which probably makes (2) a rather poor choice.
> > >
> > > Comments?
> > > Suggestions?
> > > Other ideas?
> > >
> >
> >
> > I also had recently some thoughts about how to implement clipboard shar=
ing
> > in a more general way for QEMU.
> >
> > I admit I like Christophe's suggestion ("it's somebody else problem"), =
but
> > it falls short to me as I don't know of a common open-source remoting
> > solution for various operating systems, and I don't see how it could
> > integrate well with our UI and remote protocols. Or look at reusing som=
e
> > VirtualBox code perhaps?
> >
> > Some things I keep in mind:
> > - the spice protocol had a number of iterations to fix some races. It w=
ould
> > be great not to repeat the same mistakes, and I don't know if VNC have =
the
> > same flaws or not.
> > - the spice agent design isn't great: the system agent proxies messages=
 to
> > the active session. It would be nice if the new solution didn't have su=
ch a
> > middle-man.
>
> I was going to say that's a limtation of the use of virtio-serial, and
> to some extent that is true, but it is also not true. There is no reason
> it had to limit itselt to 1 virtio-serial device. It would have been
> valid to have 1 virtio-serial device for the system level functionality,
> and then 1 virtio-serial device per guest seat. Any guest OS configured
> for multi-seat is already going to have extra devices added to QEMU
> for each seat, so adding a virtio-serial device per seat would have
> been easy enough and avoided the crazy proxying.
>
> > - with wayland, clipboard sharing isn't really possible. Or not in a
> > seamless way at least. Today it kinda works with some X11 compatibility
> > extensions, but this will eventually go away or change behaviour.
> > - the GNOME desktop is working on remoting using RDP, and they are
> > implementing a DBus interface for it (
> > https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-desktop-cli=
pboard
> > )
> > - it's not just about clipboard. We would also want to have some kind o=
f
> > drag and drop (even if limited to files like Spice atm). We may want so=
me
> > windowing integration. We may also want to have access to some desktop
> > services: apps, documents etc.. And what's not.
>
> Ultimately that all says we need a "remote desktop agent", which is
> extensible to other desktop integration features. Essentially that
> is what the spice agent was aiming to provide.
>
> > That leads me to think that virtio-serial is not very well suited, as i=
t
> > doesn't allow various services / processes to come and go. I see vsock =
as a
> > much better alternative. (I also wonder if it handles control flow any
> > better btw)
>
> virtio-serial does make it a bit easier to have the host backend side
> self-contained in QEMU though. I think it is nice that nothing else on
> the host ever sees the agent backend, as it is a private internal channel
> between SPICE & QEMU's virtio-serial impl via the special chardev type.
>
> vsock gets exposed to the host OS in general, and though you

Not necessarily with vhost-user-vsock though.

> can have QEMU open the vsock device internally, it feels a bit silly to
> have one part of QEMU writing to a vsock device, and then another part
> of QEMU reading back from the very same device. Especially because you
> have now introduced the extra problem of having to allocate unique
> vsock addresses for each instance and deal with possibility of external
> apps maliciously trying to interact with your vsock backend.
>
> As above though, I think the way spice used virtio-serial was suboptimal
> and it should have had one extra virtio-serial device per seat.

And per service? and libvirt to hotplug stuff? Sounds insane to me.
And what about services that need to handle several connections in the
guest. For example, the way spice-webdavd works is really a pain, it
has to multiplex guest connections over virtio-serial... All of this
would be so much simpler with a single vsock connection and some kind
of bus.

>
> > I think we shoud work on getting the free desktops our best-class suppo=
rt.
> > To me, this means we need to speak the lingua franca, which is DBus. Th=
e
> > great thing is that DBus is also equipped to handle services that come =
and
> > go, handling discovery, introspection etc. Various services are already
> > available. As mentioned earlier, that's what the GNOME desktop will off=
er
> > for clipboard sharing. There are good chances other desktops will follo=
w if
> > that design works, as it should be easy for them to implement the same
> > service. That means good reuse of existing desktop code. Speaking DBus =
on
> > Windows, MacOS or Android isn't an issue. However, vsock support may be=
 a
> > bit tricky atm.
>
> Speaking DBus is only useful though if the guest desktop actually impleme=
nts
> the DBus interfaces that we're speaking. The remote desktop clipboard wor=
k
> shown above is only going to be available on modern Linux guest OS, and
> possibly only a subset of them. IOW on the guest side, we're going to hav=
e
> to have platform specific backends to do the integration in whatever way
> is best suited for each OS. I see windows, macos, android, Wayland and
> X11 as distinct backends for the guest side.

Sure, this adaptation to various OS is needed regardless of DBus as a
protocol or not.

But we are in a much better position if we actually shape the future
and put our requirements there rather than playing a catch up game the
way desktop agents usually do. Iow, I think we need deeper integration
in the desktop. The good news is that we have pretty much the same
requirements has remote desktop solutions.


--=20
Marc-Andr=C3=A9 Lureau

