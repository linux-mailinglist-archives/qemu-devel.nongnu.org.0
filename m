Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C633088EF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:15:01 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sg0-0007L7-R6
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rt6-0003ia-3V
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:24:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5Rt3-0008Km-0N
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611919463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ovnZ0UGVBLW52QpGPXcY+8lNp2yrPvMaCrbxIz2DMw=;
 b=S7IDAMvIMKeB/akqO+uU1kLAvZKTV1GhRRG0dC7nWIlMx/wKZ0vdAwRbWflPjMHAOujMFW
 fDgGikSMandoxpb0KR6gcLJJwSYPztjnr4toWEAH8nwX5tj2uwsf+aCLeYTFcQmnG3grqm
 jXK3G7+LkwQmAzvXoIHzcT+mQt4dq/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-Bhvpn-n_NgWv4RPJ-6PSMg-1; Fri, 29 Jan 2021 06:24:20 -0500
X-MC-Unique: Bhvpn-n_NgWv4RPJ-6PSMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 879CF107ACE3;
 Fri, 29 Jan 2021 11:24:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA9A5D9CD;
 Fri, 29 Jan 2021 11:24:15 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:24:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129112412.GH4001740@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 12:18:19AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jan 28, 2021 at 9:14 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi folks,
> >
> > I'm looking for a good way to implement cut+paste support for vnc.
> >
> > The vnc core protocol has support for text/plain cut+paste, and there
> > is an extension adding support for other formats.  That'll cover one
> > part of the problem, exchanging cut+paste data between vnc client and
> > qemu vnc server.
> >
> > The tricky part is the second: the guest <=> qemu communication.
> > I see basically two possible approaches here:
> >
> >   (1) Have some guest agent (spice does it that way).
> >       Advantage: more flexible, allows more features.
> >       Disadvantage: requires agent in the guest.
> >
> >   (2) Send text as key events.
> >       Advantage: no guest agent needed.
> >       Disadvantage: is translated by guests keyboard map, so qemu
> >       needs to know the map for proper char -> key event translation.
> >       Only works for text/plain and only for chars you can easily
> >       type, anything needing input methods (emoji 😊 for example)
> >       isn't going to fly.
> >
> > I think that (1) is clearly the better way.  Given that the agent
> > would need to run in user wayland/xorg session context the existing
> > qemu-guest-agent will not work.  Also linking against some UI library
> > like gtk3 for clipboard handling is not something we want for the
> > qemu-guest-agent.  So we need another one, I'll name it
> > qemu-clipboard-agent for the rest of this mail.  And we need a
> > communication channel.
> >
> > I'd tend to model the qemu-clipboard-agent simliar to the
> > qemu-guest-agent, i.e. have some stream as communication path and run
> > some stream protocol over it.
> >
> > Stream options I see are (in order of personal preference):
> >
> >   (1) New virtio-serial port.  virtio-serial likely is there anyway
> >       for the qemu-guest-agent ...
> >
> >   (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
> >       channel, i.e. qemu-clipboard-agent will proxy everything through
> >       qemu-guest-agent (spice does it that way).
> >
> > Protocol options I see are (not sure yet which to prefer, need to have
> > a closer look at the candidates):
> >
> >   (1) Add clipboard commands to QMP and use these.
> >
> >   (2) Reuse the clipboard bits of the vnc protocol (forward
> >       VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
> >
> >   (3) Reuse the clipboard bits of the spice-agent protocol.
> >
> >   (4) Reuse the clipboard bits of the wayland protocol.
> >
> > Once we have sorted the qemu <-> guest communication path it should be
> > possible to also hook up other UIs (specifically gtk) without too much
> > effort.  Which probably makes (2) a rather poor choice.
> >
> > Comments?
> > Suggestions?
> > Other ideas?
> >
> 
> 
> I also had recently some thoughts about how to implement clipboard sharing
> in a more general way for QEMU.
> 
> I admit I like Christophe's suggestion ("it's somebody else problem"), but
> it falls short to me as I don't know of a common open-source remoting
> solution for various operating systems, and I don't see how it could
> integrate well with our UI and remote protocols. Or look at reusing some
> VirtualBox code perhaps?
> 
> Some things I keep in mind:
> - the spice protocol had a number of iterations to fix some races. It would
> be great not to repeat the same mistakes, and I don't know if VNC have the
> same flaws or not.
> - the spice agent design isn't great: the system agent proxies messages to
> the active session. It would be nice if the new solution didn't have such a
> middle-man.

I was going to say that's a limtation of the use of virtio-serial, and
to some extent that is true, but it is also not true. There is no reason
it had to limit itselt to 1 virtio-serial device. It would have been
valid to have 1 virtio-serial device for the system level functionality,
and then 1 virtio-serial device per guest seat. Any guest OS configured
for multi-seat is already going to have extra devices added to QEMU
for each seat, so adding a virtio-serial device per seat would have
been easy enough and avoided the crazy proxying.

> - with wayland, clipboard sharing isn't really possible. Or not in a
> seamless way at least. Today it kinda works with some X11 compatibility
> extensions, but this will eventually go away or change behaviour.
> - the GNOME desktop is working on remoting using RDP, and they are
> implementing a DBus interface for it (
> https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-desktop-clipboard
> )
> - it's not just about clipboard. We would also want to have some kind of
> drag and drop (even if limited to files like Spice atm). We may want some
> windowing integration. We may also want to have access to some desktop
> services: apps, documents etc.. And what's not.

Ultimately that all says we need a "remote desktop agent", which is
extensible to other desktop integration features. Essentially that
is what the spice agent was aiming to provide. 

> That leads me to think that virtio-serial is not very well suited, as it
> doesn't allow various services / processes to come and go. I see vsock as a
> much better alternative. (I also wonder if it handles control flow any
> better btw)

virtio-serial does make it a bit easier to have the host backend side
self-contained in QEMU though. I think it is nice that nothing else on
the host ever sees the agent backend, as it is a private internal channel
between SPICE & QEMU's virtio-serial impl via the special chardev type.

vsock gets exposed to the host OS in general, and though you
can have QEMU open the vsock device internally, it feels a bit silly to
have one part of QEMU writing to a vsock device, and then another part
of QEMU reading back from the very same device. Especially because you
have now introduced the extra problem of having to allocate unique
vsock addresses for each instance and deal with possibility of external
apps maliciously trying to interact with your vsock backend.

As above though, I think the way spice used virtio-serial was suboptimal
and it should have had one extra virtio-serial device per seat.

> I think we shoud work on getting the free desktops our best-class support.
> To me, this means we need to speak the lingua franca, which is DBus. The
> great thing is that DBus is also equipped to handle services that come and
> go, handling discovery, introspection etc. Various services are already
> available. As mentioned earlier, that's what the GNOME desktop will offer
> for clipboard sharing. There are good chances other desktops will follow if
> that design works, as it should be easy for them to implement the same
> service. That means good reuse of existing desktop code. Speaking DBus on
> Windows, MacOS or Android isn't an issue. However, vsock support may be a
> bit tricky atm.

Speaking DBus is only useful though if the guest desktop actually implements
the DBus interfaces that we're speaking. The remote desktop clipboard work
shown above is only going to be available on modern Linux guest OS, and
possibly only a subset of them. IOW on the guest side, we're going to have
to have platform specific backends to do the integration in whatever way
is best suited for each OS. I see windows, macos, android, Wayland and
X11 as distinct backends for the guest side.

The same on the host client side, though in that case it is all magically
handled by GTK for us, so we don't need to care about the platform
differences ourselves.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


