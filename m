Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7A49B2A2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:55:32 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1AyR-0006MX-FF
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i1AkT-0007yN-5l
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:41:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i1AkR-0008HN-Lt
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:41:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i1AkR-0008EZ-CH
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:41:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6452302C06C;
 Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
Received: from redhat.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19C8E5D6B2;
 Fri, 23 Aug 2019 14:40:55 +0000 (UTC)
Date: Fri, 23 Aug 2019 15:40:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190823144052.GL9654@redhat.com>
References: <20190808150325.21939-1-marcandre.lureau@redhat.com>
 <20190823112053.GE9654@redhat.com>
 <CAMxuvayoLetZkJ_HNKxC8Y0Yk33hn5pHLLn32R-XCuD7z31i=Q@mail.gmail.com>
 <20190823114157.GG9654@redhat.com> <20190823130014.GG2784@work-vm>
 <CAJ+F1CKTsQC1fULFG-hbUZ=Ao654K-TE6Fm9c1V+eRdAjk9QRA@mail.gmail.com>
 <20190823140948.GI2784@work-vm> <20190823142054.GK9654@redhat.com>
 <20190823142602.GJ2784@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190823142602.GJ2784@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/2] Add dbus-vmstate
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 23, 2019 at 03:26:02PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Fri, Aug 23, 2019 at 03:09:48PM +0100, Dr. David Alan Gilbert wrot=
e:
> > > * Marc-Andr=C3=A9 Lureau (marcandre.lureau@gmail.com) wrote:
> > > > Hi
> > > >=20
> > > > On Fri, Aug 23, 2019 at 5:00 PM Dr. David Alan Gilbert
> > > > <dgilbert@redhat.com> wrote:
> > > > >
> > > > > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > > >
> > > > > <snip>
> > > > >
> > > > > > This means QEMU still has to iterate over every single client
> > > > > > on the bus to identify them. If you're doing that, there's
> > > > > > no point in owning a well known service at all. Just iterate
> > > > > > over the unique bus names and look for the exported object
> > > > > > path /org/qemu/VMState
> > > > > >
> > > > >
> > > > > Not knowing anything about DBus security, I want to ask how do
> > > > > we handle security here?
> > > >=20
> > > > First of all, we are talking about cooperative processes, and hav=
ing a
> > > > specific bus for each qemu instance. So some amount of security/t=
rust
> > > > is already assumed.
> > >=20
> > > Some but we need to keep it as limited as possible; for example two
> > > reasons for having separate processes both come down to security:
> > >=20
> > >   a) vtpm - however screwy the qemu is, you can never get to the ke=
ys in
> > > the vtpm
> >=20
> > Processes connected to dbus can only call the DBus APIs that vtpm
> > actually exports.  The vtpm should simply *not* export a DBus
> > API that allows anything to fetch the keys.
> >=20
> > If it did want to export APIs for fetching keys, then we would
> > have to ensure suitable dbus /selinux policy was created to
> > prevent unwarranted access.
>=20
> This was really just one example of where the security/trust isn't
> assumed; however a more concrete case is migration of a vtpm, and even
> though it's probably encrypted blob you still don't want some other
> device to grab the migration data - or to say reinitialise the vtpm.

That can be dealt with by the dbus security policies, provided
you either run the vtpm as a different user ID from the other
untrustworthy helpers, or use a different selinux context for
vtpm. You can then express that only the user that QEMU is
running under can talk to vtpm over dbus.

Where I think you could have problems is if you needed finer
grainer control with selinux. eg if vstpm exports 2 different
services, you can't allow access to one service, but forbid
access to the other service.

> > >   b) virtio-gpu, loads of complex GPU code that can't break the mai=
n
> > > qemu process.
> >=20
> > That's no problem - virtio-gpu crashes, it disappears from the dbus
> > bus, but everything else keeps running.
>=20
> Crashing is the easy case; assume it's malicious and you don't want it
> getting to say a storage device provided by another vhost-user device.

If we assume that the 2 processes can't commnuicate / access each
other outside DBus, then the attack avenues added by use of dbus
are most likely either:

 - invoking some DBus method that should not be allowed due
   to incomplete dbus security policy.=20

 - finding a crash in a dbus client library that you can somehow
   exploit to get remote code execution in the separate process

   I won't claim this is impossible, but I think it helps to be
   using a standard, widely used battle tested RPC impl, rather
   than a home grown RPC protocol.



> > > > But if necessary, dbus can enforce policies on who is allowed to =
own a
> > > > name, or to send/receive message from. As far as I know, this is
> > > > mostly user/group policies.
> > > >=20
> > > > But there is also SELinux checks to send_msg and acquire_svc (see
> > > > dbus-daemon(1))
> > >=20
> > > But how does something like SELinux interact with a private dbus=20
> > > rather than the system dbus?
> >=20
> > There's already two dbus-daemon's on each host - the system one and
> > the session one, and they get different selinux contexts,
> > system_dbus_t and unconfined_dbus_t.
> >=20
> > Since libvirt would be responsible for launching these private dbus
> > daemons it would be easy to make it run  svirt_dbus_t for example.
> > Actually it would be  svirt_dbus_t:s0:cNNN,cMMM to get uniqueness
> > per VM.
> >=20
> > Will of course require us to talk to the SELinux maintainers to
> > get some sensible policy rules created.
>=20
> This all relies on SELinux and running privileged qemu/vhost-user pairs=
;
> needing to do that purely to enforce security seems wrong.

Compare to an alternative bus-less solution where each helper has
a direct UNIX socket connection to QEMU.

If two helpers are running as the same user ID, then can still
directly attack each other via things like ptrace or /proc/$PID/mem,
unless you've used SELinux to isolate them, or run each as a distinct
user ID.  If you do the latter, then we can still easily isolate
them using dbus.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

