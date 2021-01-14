Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490072F696A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:22:29 +0100 (CET)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07GO-00008d-BQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l06DF-0002Uq-Eh
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l06DC-0002Li-Es
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610644505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vu5rTUDsjp+tjWzeAK5T4ybkdOAA83Xgg27bzi8Gfps=;
 b=JnFLVl8mLWAyCGy6SQW3BzrsbMmxJuF/Vw6bEtaLvyqHNDToFtNHZ2tv9vejT7mSshrkW8
 168LiI8nrkZ8OyS7P48ld6Xu8laxBwQtbD2DpzNz6nWK30/x5yU7y7xPUzFrDCm9mwKYl+
 zZ6ORl/OcYYmKvXCOc5yf+k1q3lzDcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-4FHom6cCObGj4_dSZAdzdA-1; Thu, 14 Jan 2021 12:15:01 -0500
X-MC-Unique: 4FHom6cCObGj4_dSZAdzdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C9110A7B9C;
 Thu, 14 Jan 2021 17:14:31 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2A4819718;
 Thu, 14 Jan 2021 17:14:29 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:14:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: qmp-shell TUI (was: Re: Call for Google Summer of Code 2021
 project ideas)
Message-ID: <20210114171428.GA308323@stefanha-x1.localdomain>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
 <e8938b53-a933-426c-0719-981ab0df123f@redhat.com>
 <20210114135234.GC292902@stefanha-x1.localdomain>
 <20210114135942.GI1643043@redhat.com>
 <20210114150256.GE6058@merkur.fritz.box>
 <20210114152241.GK1643043@redhat.com>
 <20210114164917.GE306329@stefanha-x1.localdomain>
 <20210114165530.GO1643043@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210114165530.GO1643043@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 04:55:30PM +0000, Daniel P. Berrang=E9 wrote:
> On Thu, Jan 14, 2021 at 04:49:17PM +0000, Stefan Hajnoczi wrote:
> > On Thu, Jan 14, 2021 at 03:22:41PM +0000, Daniel P. Berrang=E9 wrote:
> > > On Thu, Jan 14, 2021 at 04:02:56PM +0100, Kevin Wolf wrote:
> > > > Am 14.01.2021 um 14:59 hat Daniel P. Berrang=E9 geschrieben:
> > > > > On Thu, Jan 14, 2021 at 01:52:34PM +0000, Stefan Hajnoczi wrote:
> > > > > > On Wed, Jan 13, 2021 at 01:59:43PM -0500, John Snow wrote:
> > > > > > > On 1/13/21 3:53 AM, Stefan Hajnoczi wrote:
> > > > > > > > On Tue, Jan 12, 2021 at 9:10 PM John Snow <jsnow@redhat.com=
> wrote:
> > > > > > > > 2. Ability to watch QMP activity on a running QEMU process,=
 e.g. even
> > > > > > > > when libvirt is directly connected to the monitor.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > That *WOULD* be extremely cool, and moves a lot closer to how=
 mitmproxy
> > > > > > > works.
> > > > > > >=20
> > > > > > > (Actually, mitmproxy could theoretically be taught how to rea=
d and
> > > > > > > understand QMP traffic, but that's not something I know how t=
o do or would
> > > > > > > be prepared to mentor.)
> > > > > > >=20
> > > > > > > Is this possible to do in a post-hoc fashion? Let's say you a=
re using
> > > > > > > production environment QEMU, how do we attach the QMP listene=
r to it? Or
> > > > > > > does this idea require that we start QEMU in a specific fashi=
on with a
> > > > > > > second debug socket that qmp-shell can connect to in order to=
 listen?
> > > > > > >=20
> > > > > > > ... Or do we engineer qmp-shell to open its own socket that l=
ibvirt connects
> > > > > > > to ...?
> > > > > >=20
> > > > > > Here is the QEMU command-line that libvirt uses on my F33 syste=
m:
> > > > > >=20
> > > > > >   -chardev socket,id=3Dcharmonitor,fd=3D36,server,nowait
> > > > > >   -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol
> > > > > >=20
> > > > > > Goals for this feature:
> > > > > >=20
> > > > > > 1. No manual steps required for setup.
> > > > > > 2. Ability to start/stop monitoring traffic at runtime without
> > > > > >    restarting QEMU.
> > > > > > 3. Available to unprivileged users.
> > > > > >=20
> > > > > > I think the easiest way to achieve this is through a new QEMU m=
onitor
> > > > > > command. Approaches that come to mind:
> > > > > >=20
> > > > > > 1. Add a -mon debug-chardev property and a QMP command to set i=
t at
> > > > > >    runtime. The debug-chardev receives both monitor input (comm=
ands) and
> > > > > >    output (responses and events). This does not allow MITM, rat=
her it
> > > > > >    mirrors traffic.
> > > > > >=20
> > > > > > 2. Add a chardev-get-fd command that fetches the fd from a char=
dev and
> > > > > >    then use the existing chardev-change command to replace the =
monitor
> > > > > >    chardev with a chardev connected to qmp-shell. This inserts =
qmp-shell
> > > > > >    as a proxy between the QMP client and server. qmp-shell can =
remove
> > > > > >    itself again with another chardev-change command. This appro=
ach
> > > > > >    allows MITM. The downside is it assumes the QMP chardev is a=
 file
> > > > > >    descriptor, so it won't work with all types of chardev.
> > > > > >=20
> > > > > > 3. Add a new chardev-proxy type that aggregates 3 chardevs: 1. =
an origin
> > > > > >    source chardev, 2. a monitoring sink chardev, and 3. a monit=
oring
> > > > > >    source chardev. The data flow is origin <-> monitoring sink =
<->
> > > > > >    monitoring source <-> QMP monitor. qmp-shell creates the mon=
itoring
> > > > > >    sink (for receiving incoming QMP commands) and monitoring so=
urce
> > > > > >    chardev (for forwarding QMP commands or MITM commands), and =
then it
> > > > > >    uses change-chardev to instantiate a chardev-proxy that dire=
cts the
> > > > > >    original libvirt chardev through the monitoring sink and sou=
rce.
> > > > > >=20
> > > > > >    This is the most complex but also completely contained withi=
n the
> > > > > >    QEMU chardev layer.
> > > >=20
> > > > I have an idea for the QMP command name: chardev-snapshot-sync!
> > > >=20
> > > > Finally we get backing file chains for chardevs! :-)
> > > >=20
> > > > > > In all these approaches qmp-shell uses virsh qemu-monitor-comma=
nd or an
> > > > > > equivalent API to start/stop monitoring a running VM without ma=
nual
> > > > > > setup steps.
> > > > >=20
> > > > > Why go to the trouble of adding more chardevs to a running QEMU t=
hat
> > > > > libvirt has.  qmp-shell can just directly use the libvirt Python =
API
> > > > > to invoke  virDomainQemuMonitorCommand to invoke QMP commands, an=
d
> > > > > the othe API for receiving QMP events.
> > > > >=20
> > > > > Essentially it just needs to be split into two layers. The upper
> > > > > layer works in terms of individual QMP command/replies, and QMP
> > > > > events. The lower layer provides a transport that is either a
> > > > > UNIX socket, or is the libvirt QMP passthrough API.
> > > > >=20
> > > > > Or alternatively, provide a virt-qmp-shim  command that listens o=
n
> > > > > a UNIX socket, accepts QMP commands and turns them into calls to
> > > > > virDomainQemuMonitorCommand, and funnells back the response.
> > > >=20
> > > > I think the idea was to show the QMP traffic that libvirt produces =
for
> > > > other management applications, not for the QMP shell. These APIs
> > > > probably don't allow this?
> > >=20
> > > FWIW if you want to monitor what libvirt is sending/receiving we have
> > > a script for that that uses our systemtap probe points:
> > >=20
> > >   https://gitlab.com/libvirt/libvirt/-/blob/master/examples/systemtap=
/qemu-monitor.stp
> >=20
> > Does that require root?
>=20
> Yeah, systemtap generally requires root.
>=20
> The same info is also written to the log files. For example:
>=20
>   virt-admin daemon-log-filters "2:qemu_monitor_json"
>   virt-admin daemon-lop-outputs "2:file:/var/log/libvirt/libvirtd.log"
>=20
> nb, i'm using level '2' there to avoid enabling  debug logs, only
> info level logs which is the level dynamic probes  log at.

On my F33 system /var/log/libvirt is owned by root:root and rwx------,
so I guess it would be necessary to reconfigure log output so that
unprivileged users can access it.

If it can be used in conjunction with virDomainQemuMonitorCommand(),
then that eliminates the need to introduce new chardev functionality in
QEMU.

Parsing libvirt logs was one of the things I suggested, though. I think
it would be a nice feature for troubleshooting QMP conversations.

Stefan

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAe/QACgkQnKSrs4Gr
c8i2XAf+MTzzm5faUnnLROIMhubjn1dDg6N283oA3wk1wvf5g0qcGNQNcBg1NSkB
AfdVTgbNFo5CPIlLwyEWhyohzwkIR3Hvky4LIl8F2BpJEdYUpB7aNZUn5dBdbqj3
OiqbtBOtY2A58yhnAZal/d421JXYi6oySr/fZtiKrXQNleRZGxie5922oM9TUTD/
wTVmUJy2y/vZF19AgrWa3WlRvm0VldyHLN9IaKTwGKirbO1m5vkM5JUEpQr5b8Xr
5z7JBi5qIsdZrwLAt9Wx3WzpXb5/ke4QRNAkdeaQr+84fsHVJ/RrSdvoYeaOJdV3
T5qwME4PAYboEIcpLF8B24Eulwrwgw==
=HY8+
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


