Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFC9B1F2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:28:59 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1AYk-0003xB-Mr
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i1AW3-0002X0-CS
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i1AW1-0004Vu-Qt
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:26:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i1AW1-0004VO-Ij
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:26:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC9E430832DC;
 Fri, 23 Aug 2019 14:26:08 +0000 (UTC)
Received: from work-vm (ovpn-117-244.ams2.redhat.com [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E0C6CE61;
 Fri, 23 Aug 2019 14:26:04 +0000 (UTC)
Date: Fri, 23 Aug 2019 15:26:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190823142602.GJ2784@work-vm>
References: <20190808150325.21939-1-marcandre.lureau@redhat.com>
 <20190823112053.GE9654@redhat.com>
 <CAMxuvayoLetZkJ_HNKxC8Y0Yk33hn5pHLLn32R-XCuD7z31i=Q@mail.gmail.com>
 <20190823114157.GG9654@redhat.com> <20190823130014.GG2784@work-vm>
 <CAJ+F1CKTsQC1fULFG-hbUZ=Ao654K-TE6Fm9c1V+eRdAjk9QRA@mail.gmail.com>
 <20190823140948.GI2784@work-vm> <20190823142054.GK9654@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190823142054.GK9654@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 23 Aug 2019 14:26:08 +0000 (UTC)
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Fri, Aug 23, 2019 at 03:09:48PM +0100, Dr. David Alan Gilbert wrote:
> > * Marc-Andr=E9 Lureau (marcandre.lureau@gmail.com) wrote:
> > > Hi
> > >=20
> > > On Fri, Aug 23, 2019 at 5:00 PM Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > > >
> > > > <snip>
> > > >
> > > > > This means QEMU still has to iterate over every single client
> > > > > on the bus to identify them. If you're doing that, there's
> > > > > no point in owning a well known service at all. Just iterate
> > > > > over the unique bus names and look for the exported object
> > > > > path /org/qemu/VMState
> > > > >
> > > >
> > > > Not knowing anything about DBus security, I want to ask how do
> > > > we handle security here?
> > >=20
> > > First of all, we are talking about cooperative processes, and havin=
g a
> > > specific bus for each qemu instance. So some amount of security/tru=
st
> > > is already assumed.
> >=20
> > Some but we need to keep it as limited as possible; for example two
> > reasons for having separate processes both come down to security:
> >=20
> >   a) vtpm - however screwy the qemu is, you can never get to the keys=
 in
> > the vtpm
>=20
> Processes connected to dbus can only call the DBus APIs that vtpm
> actually exports.  The vtpm should simply *not* export a DBus
> API that allows anything to fetch the keys.
>=20
> If it did want to export APIs for fetching keys, then we would
> have to ensure suitable dbus /selinux policy was created to
> prevent unwarranted access.

This was really just one example of where the security/trust isn't
assumed; however a more concrete case is migration of a vtpm, and even
though it's probably encrypted blob you still don't want some other
device to grab the migration data - or to say reinitialise the vtpm.

> >   b) virtio-gpu, loads of complex GPU code that can't break the main
> > qemu process.
>=20
> That's no problem - virtio-gpu crashes, it disappears from the dbus
> bus, but everything else keeps running.

Crashing is the easy case; assume it's malicious and you don't want it
getting to say a storage device provided by another vhost-user device.

> > > But if necessary, dbus can enforce policies on who is allowed to ow=
n a
> > > name, or to send/receive message from. As far as I know, this is
> > > mostly user/group policies.
> > >=20
> > > But there is also SELinux checks to send_msg and acquire_svc (see
> > > dbus-daemon(1))
> >=20
> > But how does something like SELinux interact with a private dbus=20
> > rather than the system dbus?
>=20
> There's already two dbus-daemon's on each host - the system one and
> the session one, and they get different selinux contexts,
> system_dbus_t and unconfined_dbus_t.
>=20
> Since libvirt would be responsible for launching these private dbus
> daemons it would be easy to make it run  svirt_dbus_t for example.
> Actually it would be  svirt_dbus_t:s0:cNNN,cMMM to get uniqueness
> per VM.
>=20
> Will of course require us to talk to the SELinux maintainers to
> get some sensible policy rules created.

This all relies on SELinux and running privileged qemu/vhost-user pairs;
needing to do that purely to enforce security seems wrong.

Dave

> > > > I want to know that the external device that's giving me migratio=
n data
> > > > is the device I think I'm speaking to, not one of the other devic=
es;
> > >=20
> > > DBus is not the problem nor the solution here.
> >=20
> > Well, if the migration data was squirting down the existing vhost-use=
r
> > channel then there would be no risk here; so the use of dbus is creat=
ing
> > the problem.
> >=20
> > > But what defines that device-service strong relationship? Can you
> > > generalize it? I don't think so.
> > >=20
> > > What DBus can guarantee is that the unique-id you are talking to is
> > > always the same connection (thus the same process).
> > >=20
> > > > I also dont want different devices chatting to each other over db=
us
> > > > unless we're very careful.
> > >=20
> > > That's a bus policy job.
> >=20
> > OK, as long as you somehow set it up.
> >=20
> > Dave
> >=20
> > > >
> > > > Dave
> > > >
> > > > > Regards,
> > > > > Daniel
> > > > > --
> > > > > |: https://berrange.com      -o-    https://www.flickr.com/phot=
os/dberrange :|
> > > > > |: https://libvirt.org         -o-            https://fstop138.=
berrange.com :|
> > > > > |: https://entangle-photo.org    -o-    https://www.instagram.c=
om/dberrange :|
> > > > --
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > >
> > >=20
> > >=20
> > > --=20
> > > Marc-Andr=E9 Lureau
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

