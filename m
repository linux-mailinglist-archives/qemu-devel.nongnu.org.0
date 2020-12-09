Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60FF2D4637
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:00:55 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn1te-0005Kj-Qc
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn1rl-0004lW-9o
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:58:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn1rY-0002kl-MD
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 10:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607529521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBr32EfwjraHmhGUU1qWmpGQu6trXhEY+c3U2JTdT58=;
 b=EHRqZhI1iU2TFMUvyVWZumnkSy20K6+N3dsvlAVkMEvSP1U8lKdZNG1grb9exd5aw0I8NN
 4q16gnwJCYhIwraENdW6FxsPoRF37gr7AQWtVukVp9cSXJm3Ry8WlgBK64lexrlVo/VKS4
 B0aZb/VV+tA+fnGiaHWiQi03w5B07gY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-2pOf97PaMRukBQZCgWs7BA-1; Wed, 09 Dec 2020 10:58:35 -0500
X-MC-Unique: 2pOf97PaMRukBQZCgWs7BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADE23180DE10;
 Wed,  9 Dec 2020 15:57:31 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD6786064B;
 Wed,  9 Dec 2020 15:57:30 +0000 (UTC)
Date: Wed, 9 Dec 2020 15:57:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
Message-ID: <20201209155729.GB396498@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201208093715.GX203660@stefanha-x1.localdomain>
 <1410217602.34486578.1607506010536.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1410217602.34486578.1607506010536.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Lars Ganrot <lars.ganrot@gmail.com>, Rob Miller <rob.miller@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Howard Cai <howard.cai@gmail.com>,
 Parav Pandit <parav@mellanox.com>, vm <vmireyno@marvell.com>,
 Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 04:26:50AM -0500, Jason Wang wrote:
> ----- Original Message -----
> > On Fri, Nov 20, 2020 at 07:50:38PM +0100, Eugenio P=E9rez wrote:
> > > This series enable vDPA software assisted live migration for vhost-ne=
t
> > > devices. This is a new method of vhost devices migration: Instead of
> > > relay on vDPA device's dirty logging capability, SW assisted LM
> > > intercepts dataplane, forwarding the descriptors between VM and devic=
e.
> >=20
> > Pros:
> > + vhost/vDPA devices don't need to implement dirty memory logging
> > + Obsoletes ioctl(VHOST_SET_LOG_BASE) and friends
> >=20
> > Cons:
> > - Not generic, relies on vhost-net-specific ioctls
> > - Doesn't support VIRTIO Shared Memory Regions
> >   https://github.com/oasis-tcs/virtio-spec/blob/master/shared-mem.tex
>=20
> I may miss something but my understanding is that it's the
> responsiblity of device to migrate this part?

Good point. You're right.

> > - Performance (see below)
> >=20
> > I think performance will be significantly lower when the shadow vq is
> > enabled. Imagine a vDPA device with hardware vq doorbell registers
> > mapped into the guest so the guest driver can directly kick the device.
> > When the shadow vq is enabled a vmexit is needed to write to the shadow
> > vq ioeventfd, then the host kernel scheduler switches to a QEMU thread
> > to read the ioeventfd, the descriptors are translated, QEMU writes to
> > the vhost hdev kick fd, the host kernel scheduler switches to the vhost
> > worker thread, vhost/vDPA notifies the virtqueue, and finally the
> > vDPA driver writes to the hardware vq doorbell register. That is a lot
> > of overhead compared to writing to an exitless MMIO register!
>=20
> I think it's a balance. E.g we can poll the virtqueue to have an
> exitless doorbell.
>=20
> >=20
> > If the shadow vq was implemented in drivers/vhost/ and QEMU used the
> > existing ioctl(VHOST_SET_LOG_BASE) approach, then the overhead would be
> > reduced to just one set of ioeventfd/irqfd. In other words, the QEMU
> > dirty memory logging happens asynchronously and isn't in the dataplane.
> >=20
> > In addition, hardware that supports dirty memory logging as well as
> > software vDPA devices could completely eliminate the shadow vq for even
> > better performance.
>=20
> Yes. That's our plan. But the interface might require more thought.
>=20
> E.g is the bitmap a good approach? To me reporting dirty pages via
> virqueue is better since it get less footprint and is self throttled.
>=20
> And we need an address space other than the one used by guest for
> either bitmap for virtqueue.
>=20
> >=20
> > But performance is a question of "is it good enough?". Maybe this
> > approach is okay and users don't expect good performance while dirty
> > memory logging is enabled.
>=20
> Yes, and actually such slow down may help for the converge of the
> migration.
>=20
> Note that the whole idea is try to have a generic solution for all
> types of devices. It's good to consider the performance but for the
> first stage, it should be sufficient to make it work and consider to
> optimize on top.

Moving the shadow vq to the kernel later would be quite a big change
requiring rewriting much of the code. That's why I mentioned this now
before a lot of effort is invested in a QEMU implementation.

> > I just wanted to share the idea of moving the
> > shadow vq into the kernel in case you like that approach better.
>=20
> My understanding is to keep kernel as simple as possible and leave the
> polices to userspace as much as possible. E.g it requires us to
> disable doorbell mapping and irq offloading, all of which were under
> the control of userspace.

If the performance is acceptable with the QEMU approach then I think
that's the best place to implement it. It looks high-overhead though so
maybe one of the first things to do is to run benchmarks to collect data
on how it performs?

Stefan

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Q8+kACgkQnKSrs4Gr
c8gzgwf/R8XyRehTNARVsYQYQS8pC8vzoJcb4LMSB4/opM4DdNb2gIFzVOzHt7am
ibFu8Wyl3C2txGaFCh4YlGIwVkGTdAp++Dwhl9wWZaVA0vvjv/yxR/r82IIid7oR
tLb5LibQ19LXmVdFgAfGaT3dXSIkPG38RECJZwSk3QBrgXfsKclGZHRpnPGsK0B3
3PIQtGy3wjJIuVXoknfAXjThXpzXmwlc/EHQnBSajm9byvMVWzlHb2Kirc5PO0xP
Vrg2wdmUUwnVgSC2n9DgEjb1IRyVWEW9dsF+8QdmBnPtYSOJ74EekvFkn6fKWd2A
/NyM+ry+1zHgomC5WqzC9bKCp+KacQ==
=WM5k
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--


