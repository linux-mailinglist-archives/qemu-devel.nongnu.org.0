Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC239B1DE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:25:29 +0200 (CEST)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1AVM-0000hH-2I
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i1AR7-0005H4-NS
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i1AR4-0000Wq-WD
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i1AR4-0000WP-O6
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:21:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D79F37EB88;
 Fri, 23 Aug 2019 14:21:01 +0000 (UTC)
Received: from redhat.com (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39D161001B12;
 Fri, 23 Aug 2019 14:20:57 +0000 (UTC)
Date: Fri, 23 Aug 2019 15:20:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190823142054.GK9654@redhat.com>
References: <20190808150325.21939-1-marcandre.lureau@redhat.com>
 <20190823112053.GE9654@redhat.com>
 <CAMxuvayoLetZkJ_HNKxC8Y0Yk33hn5pHLLn32R-XCuD7z31i=Q@mail.gmail.com>
 <20190823114157.GG9654@redhat.com> <20190823130014.GG2784@work-vm>
 <CAJ+F1CKTsQC1fULFG-hbUZ=Ao654K-TE6Fm9c1V+eRdAjk9QRA@mail.gmail.com>
 <20190823140948.GI2784@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190823140948.GI2784@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 23 Aug 2019 14:21:01 +0000 (UTC)
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

On Fri, Aug 23, 2019 at 03:09:48PM +0100, Dr. David Alan Gilbert wrote:
> * Marc-Andr=C3=A9 Lureau (marcandre.lureau@gmail.com) wrote:
> > Hi
> >=20
> > On Fri, Aug 23, 2019 at 5:00 PM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > >
> > > <snip>
> > >
> > > > This means QEMU still has to iterate over every single client
> > > > on the bus to identify them. If you're doing that, there's
> > > > no point in owning a well known service at all. Just iterate
> > > > over the unique bus names and look for the exported object
> > > > path /org/qemu/VMState
> > > >
> > >
> > > Not knowing anything about DBus security, I want to ask how do
> > > we handle security here?
> >=20
> > First of all, we are talking about cooperative processes, and having =
a
> > specific bus for each qemu instance. So some amount of security/trust
> > is already assumed.
>=20
> Some but we need to keep it as limited as possible; for example two
> reasons for having separate processes both come down to security:
>=20
>   a) vtpm - however screwy the qemu is, you can never get to the keys i=
n
> the vtpm

Processes connected to dbus can only call the DBus APIs that vtpm
actually exports.  The vtpm should simply *not* export a DBus
API that allows anything to fetch the keys.

If it did want to export APIs for fetching keys, then we would
have to ensure suitable dbus /selinux policy was created to
prevent unwarranted access.

>   b) virtio-gpu, loads of complex GPU code that can't break the main
> qemu process.

That's no problem - virtio-gpu crashes, it disappears from the dbus
bus, but everything else keeps running.

> > But if necessary, dbus can enforce policies on who is allowed to own =
a
> > name, or to send/receive message from. As far as I know, this is
> > mostly user/group policies.
> >=20
> > But there is also SELinux checks to send_msg and acquire_svc (see
> > dbus-daemon(1))
>=20
> But how does something like SELinux interact with a private dbus=20
> rather than the system dbus?

There's already two dbus-daemon's on each host - the system one and
the session one, and they get different selinux contexts,
system_dbus_t and unconfined_dbus_t.

Since libvirt would be responsible for launching these private dbus
daemons it would be easy to make it run  svirt_dbus_t for example.
Actually it would be  svirt_dbus_t:s0:cNNN,cMMM to get uniqueness
per VM.

Will of course require us to talk to the SELinux maintainers to
get some sensible policy rules created.

> > > I want to know that the external device that's giving me migration =
data
> > > is the device I think I'm speaking to, not one of the other devices=
;
> >=20
> > DBus is not the problem nor the solution here.
>=20
> Well, if the migration data was squirting down the existing vhost-user
> channel then there would be no risk here; so the use of dbus is creatin=
g
> the problem.
>=20
> > But what defines that device-service strong relationship? Can you
> > generalize it? I don't think so.
> >=20
> > What DBus can guarantee is that the unique-id you are talking to is
> > always the same connection (thus the same process).
> >=20
> > > I also dont want different devices chatting to each other over dbus
> > > unless we're very careful.
> >=20
> > That's a bus policy job.
>=20
> OK, as long as you somehow set it up.
>=20
> Dave
>=20
> > >
> > > Dave
> > >
> > > > Regards,
> > > > Daniel
> > > > --
> > > > |: https://berrange.com      -o-    https://www.flickr.com/photos=
/dberrange :|
> > > > |: https://libvirt.org         -o-            https://fstop138.be=
rrange.com :|
> > > > |: https://entangle-photo.org    -o-    https://www.instagram.com=
/dberrange :|
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >
> >=20
> >=20
> > --=20
> > Marc-Andr=C3=A9 Lureau
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

