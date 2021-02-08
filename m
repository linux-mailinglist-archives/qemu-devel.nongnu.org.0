Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32143141C0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:28:57 +0100 (CET)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9E5Z-0001gh-09
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9AY3-0006pj-E5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l9AXv-00077w-6J
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612806117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6SEB6cOszbvjJQ2PVKqpTI7wAUMacD/wPpFnmf278k=;
 b=V6Mg3kKAmOTDGIckykwA3JE3ejJo6n0rKdHLLQnth8pXQM+NNJeX6E0SN9Uq52Wk7OGkat
 cW7s9a8T5rmDu5X66H5R8WPrKpdHLpIWbfZUQUtLNngb3h4Jkk1FCayfHlgEWN4uWA3Q2c
 /OvmuvBKiXOVq/3gsJqkp4+9CoEntlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Nj6FVGFmORO7U_CPBbPJVQ-1; Mon, 08 Feb 2021 12:41:55 -0500
X-MC-Unique: Nj6FVGFmORO7U_CPBbPJVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78648192CC41
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 17:41:54 +0000 (UTC)
Received: from localhost (ovpn-115-153.ams2.redhat.com [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE71250DD5;
 Mon,  8 Feb 2021 17:41:44 +0000 (UTC)
Date: Mon, 8 Feb 2021 17:41:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 4/6] qemu, vhost-user: Extend protocol to
 start/stop/flush slave channel
Message-ID: <20210208174143.GA9994@stefanha-x1.localdomain>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-5-vgoyal@redhat.com>
 <20210128165234.GC20377@stefanha-x1.localdomain>
 <20210129141600.GA3146@redhat.com>
 <20210129151155.GD3146@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210129151155.GD3146@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 10:11:55AM -0500, Vivek Goyal wrote:
> On Fri, Jan 29, 2021 at 09:16:00AM -0500, Vivek Goyal wrote:
> > On Thu, Jan 28, 2021 at 04:52:34PM +0000, Stefan Hajnoczi wrote:
> > > On Mon, Jan 25, 2021 at 01:01:13PM -0500, Vivek Goyal wrote:
> > > > Currently we don't have a mechanism to flush slave channel while sh=
utting
> > > > down vhost-user device and that can result a deadlock. Consider fol=
lowing
> > > > scenario.
> > > >=20
> > > > 1. Slave gets a request from guest on virtqueue (say index 1, vq1),=
 to map
> > > >    a portion of file in qemu address space.
> > > >=20
> > > > 2. Thread serving vq1 receives this request and sends a message to =
qemu on
> > > >    slave channel/fd and gets blocked in waiting for a response from=
 qemu.
> > > >=20
> > > > 3. In the mean time, user does "echo b > /proc/sysrq-trigger" in gu=
est. This
> > > >    leads to qemu reset and ultimately in main thread we end up in
> > > >    vhost_dev_stop() which is trying to shutdown virtqueues for the =
device.
> > > >=20
> > > > 4. Slave gets VHOST_USER_GET_VRING_BASE message to shutdown a virtq=
ueue on
> > > >    unix socket being used for communication.
> > > >=20
> > > > 5. Slave tries to shutdown the thread serving vq1 and waits for it =
to
> > > >    terminate. But vq1 thread can't terminate because it is waiting =
for
> > > >    a response from qemu on slave_fd. And qemu is not processing sla=
ve_fd
> > > >    anymore as qemu is ressing (and not running main event loop anym=
ore)
> > > >    and is waiting for a response to VHOST_USER_GET_VRING_BASE.
> > > >=20
> > > > So we have a deadlock. Qemu is waiting on slave to response to
> > > > VHOST_USER_GET_VRING_BASE message and slave is waiting on qemu to
> > > > respond to request it sent on slave_fd.
> > > >=20
> > > > I can reliably reproduce this race with virtio-fs.
> > > >=20
> > > > Hence here is the proposal to solve this problem. Enhance vhost-use=
r
> > > > protocol to properly shutdown slave_fd channel. And if there are pe=
nding
> > > > requests, flush the channel completely before sending the request t=
o
> > > > shutdown virtqueues.
> > > >=20
> > > > New workflow to shutdown slave channel is.
> > > >=20
> > > > - Qemu sends VHOST_USER_STOP_SLAVE_CHANNEL request to slave. It wai=
ts
> > > >   for an reply from guest.
> > > >=20
> > > > - Then qemu sits in a tight loop waiting for
> > > >   VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message from slave on slav=
e_fd.
> > > >   And while waiting for this message, qemu continues to process req=
uests
> > > >   on slave_fd to flush any pending requests. This will unblock thre=
ads
> > > >   in slave and allow slave to shutdown slave channel.
> > > >=20
> > > > - Once qemu gets VHOST_USER_SLAVE_STOP_CHANNEL_COMPLETE message, it=
 knows
> > > >   no more requests will come on slave_fd and it can continue to shu=
tdown
> > > >   virtqueues now.
> > > >=20
> > > > - Once device starts again, qemu will send VHOST_USER_START_SLAVE_C=
HANNEL
> > > >   message to slave to open the slave channel and receive requests.
> > > >=20
> > > > IOW, this allows for proper shutdown of slave channel, making sure
> > > > no threads in slave are blocked on sending/receiving message. And
> > > > this in-turn allows for shutting down of virtqueues, hence resolvin=
g
> > > > the deadlock.
> > >=20
> > > Is the new message necessary?
> >=20
> > Hi Stefan,
> >=20
> > It probably is not necessary but it feels like a cleaner and simpler
> > solution.
> >=20
> > There slave is a separate channel from virtqueues. And if device is
> > stopping, we want to make sure there are no pending requests in
> > slave channel. It is possible that virtqueue shutodwn is successful
> > but other entity could still be sending messages on slave channel. In
> > that case, shall we say device shutdown complete and stop polling
> > slave channel?
> >=20
> > IOW, the way we have explicit protocol messages to shutdown each
> > vring, it makes sense to have explicit protocol message to shutdown
> > slave channel as well. Right now there is no mechanism to do that.
> >=20
>=20
> Thinking more from "slave" point of view. It might have a separate thread
> to send messages on slave channel. It has no idea when to stop sending
> messages on slave channel, as there is no mechanism to shutdown slave.
> Only method seems to be that master will close slave fd and that
> will close connection.
>=20
> That means if a device is being stopped (and not removed), then it
> is possible virtqueues got stopped but a thread in slave is blocked
> on slave channel (recvmsg()) and expecting a response back.
>=20
> That's why I think enhancing protocol to explicitly shutdown slave
> channel makes sense. Instead of assuming that stopping a virtuqueue
> should automatically mean slave channel is stopped.

This deadlock can occur during any vhost-user protocol message, not just
shutdown:

When QEMU's vhost-user master implementation sends a vhost-user protocol
message, vhost_user_read() does a "blocking" read during which slave_fd
is not monitored by QEMU.

So the problem is more general and is not fully solved by an explicit
shutdown message. If the slave needs slave channel reply in order to
process a vhost-user protocol message then a deadlock can occur.

This can be solved by monitoring both the vhost-user fd and slave_fd in
vhost_user_read(). I don't think there is a need to shutdown the slave
channel BTW.

Stefan

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAhd9cACgkQnKSrs4Gr
c8gO/gf7Bkrh8s3tHjBLyII0PlRjyoMtnf0VdCTYrFDQry/3xigRpfc/ZFu+tbzd
lhu+lFWGbVy5HovRAb+Q2ILvImFj4WUHNj4erwEN5CRsg0SIioBu2l1enL0+NwKu
Fsav08+c2LiZ7NIdtFVLBYCai65+0kRFJkbrnLpdKpIw89/o1KdjBXQTqzUluaw7
SdM7qtlpTJkwnpO3AKMqRbvkfVDVGXqmCuPac3ed6ZdiP8X2YFQjrDZX/CpImKHP
HMsdlFuIT0ZKRWgCS0+8nWGnGtFJ/IocQbpayuafvDF93IBIWwE2MFYNDyDKi0Ve
RYPBLPjH1gJZZKcnauFzqi6O2Q75bQ==
=bgxd
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


