Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5C157C81
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 14:38:32 +0100 (CET)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j19Gh-0001nj-EO
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 08:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j19FU-0000si-GT
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j19FT-00039G-3d
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:37:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22209
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j19FS-00038e-VO
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581341834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jny0vNlQp2dOTvn3FdybpLcoJqV/+knoKpDpCPqJrII=;
 b=E26wwc9DbldjUf0tFCIZZJxu04g4bZ+i3aoPeZv+WOQm1X+28rECYGgMK1CENl4asTta0d
 /pQf69HeTXm+cmuMzc3JGorBNFjR1p/NuGvYLUeMuFbcO31TQUuuAy3XjiUmx1MmBWsOmI
 j6qwkVHC2j5fJCGOOVMeSNDdczq8AA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-SQQtcAKyO_CxsrRBUlUQxg-1; Mon, 10 Feb 2020 08:37:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792C9800D5C;
 Mon, 10 Feb 2020 13:37:10 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 782B610013A7;
 Mon, 10 Feb 2020 13:37:09 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:37:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] iotests: Test external snapshot with VM state
Message-ID: <20200210133708.GC5955@linux.fritz.box>
References: <20191217145939.5537-1-kwolf@redhat.com>
 <20191217145939.5537-4-kwolf@redhat.com>
 <e4212782-78ef-6bc9-f0e4-9a069c47a77b@redhat.com>
 <20191219154758.GN5230@linux.fritz.box>
 <20200102132516.GH2927@work-vm>
 <20200106160606.GB11243@linux.fritz.box>
 <20200210123102.GE3250@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200210123102.GE3250@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: SQQtcAKyO_CxsrRBUlUQxg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.02.2020 um 13:31 hat Dr. David Alan Gilbert geschrieben:
> * Kevin Wolf (kwolf@redhat.com) wrote:
> > Am 02.01.2020 um 14:25 hat Dr. David Alan Gilbert geschrieben:
> > > * Kevin Wolf (kwolf@redhat.com) wrote:
> > > > Am 19.12.2019 um 15:26 hat Max Reitz geschrieben:
> > > > > On 17.12.19 15:59, Kevin Wolf wrote:
> > > > > > This tests creating an external snapshot with VM state (which r=
esults in
> > > > > > an active overlay over an inactive backing file, which is also =
the root
> > > > > > node of an inactive BlockBackend), re-activating the images and
> > > > > > performing some operations to test that the re-activation worke=
d as
> > > > > > intended.
> > > > > >=20
> > > > > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > > diff --git a/tests/qemu-iotests/280.out b/tests/qemu-iotests/28=
0.out
> > > > > > new file mode 100644
> > > > > > index 0000000000..5d382faaa8
> > > > > > --- /dev/null
> > > > > > +++ b/tests/qemu-iotests/280.out
> > > > > > @@ -0,0 +1,50 @@
> > > > > > +Formatting 'TEST_DIR/PID-base', fmt=3Dqcow2 size=3D67108864 cl=
uster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
> > > > > > +
> > > > > > +=3D=3D=3D Launch VM =3D=3D=3D
> > > > > > +Enabling migration QMP events on VM...
> > > > > > +{"return": {}}
> > > > > > +
> > > > > > +=3D=3D=3D Migrate to file =3D=3D=3D
> > > > > > +{"execute": "migrate", "arguments": {"uri": "exec:cat > /dev/n=
ull"}}
> > > > > > +{"return": {}}
> > > > > > +{"data": {"status": "setup"}, "event": "MIGRATION", "timestamp=
": {"microseconds": "USECS", "seconds": "SECS"}}
> > > > > > +{"data": {"status": "active"}, "event": "MIGRATION", "timestam=
p": {"microseconds": "USECS", "seconds": "SECS"}}
> > > > > > +{"data": {"status": "completed"}, "event": "MIGRATION", "times=
tamp": {"microseconds": "USECS", "seconds": "SECS"}}
> > > > > > +
> > > > > > +VM is now stopped:
> > > > > > +completed
> > > > > > +{"execute": "query-status", "arguments": {}}
> > > > > > +{"return": {"running": false, "singlestep": false, "status": "=
postmigrate"}}
> > > > >=20
> > > > > Hmmm, I get a finish-migrate status here (on tmpfs)...
> > > >=20
> > > > Dave, is it intentional that the "completed" migration event is emi=
tted
> > > > while we are still in finish-migration rather than postmigrate?
> > >=20
> > > Yes it looks like it;  it's that the migration state machine hits
> > > COMPLETED that then _causes_ the runstate transitition to POSTMIGRATE=
.
> > >=20
> > > static void migration_iteration_finish(MigrationState *s)
> > > {
> > >     /* If we enabled cpu throttling for auto-converge, turn it off. *=
/
> > >     cpu_throttle_stop();
> > >=20
> > >     qemu_mutex_lock_iothread();
> > >     switch (s->state) {
> > >     case MIGRATION_STATUS_COMPLETED:
> > >         migration_calculate_complete(s);
> > >         runstate_set(RUN_STATE_POSTMIGRATE);
> > >         break;
> > >=20
> > > then there are a bunch of error cases where if it landed in
> > > FAILED/CANCELLED etc then we either restart the VM or also go to
> > > POSTMIGRATE.
> >=20
> > Yes, I read the code. My question was more if there is a reason why we
> > want things to look like this in the external interface.
> >=20
> > I just thought that it was confusing that migration is already called
> > completed when it will still change the runstate. But I guess the
> > opposite could be confusing as well (if we're in postmigrate, why shoul=
d
> > the migration status still change?)
> >=20
> > > > I guess we could change wait_migration() in qemu-iotests to wait fo=
r the
> > > > postmigrate state rather than the "completed" event, but maybe it w=
ould
> > > > be better to change the migration code to avoid similar races in ot=
her
> > > > QMP clients.
> > >=20
> > > Given that the migration state machine is driving the runstate state
> > > machine I think it currently makes sense internally;  (although I don=
't
> > > think it's documented to be in that order or tested to be, which we
> > > might want to fix).
> >=20
> > In any case, I seem to remember that it's inconsistent between source
> > and destination. On one side, the migration status is updated first, on
> > the other side the runstate is updated first.
>=20
> (Digging through old mails)
>=20
> That might be partially due to my ed1f30 from 2015 where I move the
> COMPLETED event later - prior to that it was much too early; before
> the network announce and before the bdrv_invalidate_cache_all, and I
> ended up moving it right to the end - it might have been better to leave
> it before the runstate change.

We are working around this in the qemu-iotests now, so I guess I don't
have a pressing need for a consistent interface any more at the moment.
But if having this kind of inconsistency bothers you, feel free to do
something about it anyway. :-)

Kevin


