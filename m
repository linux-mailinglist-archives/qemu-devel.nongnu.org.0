Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85500424057
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:45:45 +0200 (CEST)
Received: from localhost ([::1]:53876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8Ay-0005rf-8q
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY894-0004iE-E3
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mY892-0003aV-48
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633531423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qkr1EgCxyu6ME3Oq7E1gUD7r7rcsnaFlZLmQSRUmZfs=;
 b=i0NcnLoStKIbKWu6PDkfF9lgUrIxKUMPNQUY2cOaXM2Oz0Gxnjlls2E9c6p/WD5BSwnbFA
 lALQmSBAeM+ZNfFYNl3uXJmoxldl5PeN1EMLm83v6PBk9tLZpG8kFSvD/YVK4NkiT6tZMv
 beifLl/Gk3hM5YB8ypSYpD6sL7L8ryM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-UfIluCn8PtGGBvciNBqZVQ-1; Wed, 06 Oct 2021 10:43:38 -0400
X-MC-Unique: UfIluCn8PtGGBvciNBqZVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DDCF824FA6;
 Wed,  6 Oct 2021 14:43:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0488260583;
 Wed,  6 Oct 2021 14:42:35 +0000 (UTC)
Date: Wed, 6 Oct 2021 15:42:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/3] virtio: turn VIRTQUEUE_MAX_SIZE into a variable
Message-ID: <YV212nXgIuxtKZmS@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <1950551.Wq8TZpmmRU@silver>
 <YV2DT+EMqDN+gSHf@stefanha-x1.localdomain>
 <6923459.JjrQbDWbmU@silver>
MIME-Version: 1.0
In-Reply-To: <6923459.JjrQbDWbmU@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="av0hJQZISPGNunoE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--av0hJQZISPGNunoE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 02:50:07PM +0200, Christian Schoenebeck wrote:
> On Mittwoch, 6. Oktober 2021 13:06:55 CEST Stefan Hajnoczi wrote:
> > On Tue, Oct 05, 2021 at 06:32:46PM +0200, Christian Schoenebeck wrote:
> > > On Dienstag, 5. Oktober 2021 17:10:40 CEST Stefan Hajnoczi wrote:
> > > > On Tue, Oct 05, 2021 at 03:15:26PM +0200, Christian Schoenebeck wro=
te:
> > > > > On Dienstag, 5. Oktober 2021 14:45:56 CEST Stefan Hajnoczi wrote:
> > > > > > On Mon, Oct 04, 2021 at 09:38:04PM +0200, Christian Schoenebeck=
=20
> wrote:
> > > > > > > Refactor VIRTQUEUE_MAX_SIZE to effectively become a runtime
> > > > > > > variable per virtio user.
> > > > > >=20
> > > > > > virtio user =3D=3D virtio device model?
> > > > >=20
> > > > > Yes
> > > > >=20
> > > > > > > Reasons:
> > > > > > >=20
> > > > > > > (1) VIRTQUEUE_MAX_SIZE should reflect the absolute theoretica=
l
> > > > > > >=20
> > > > > > >     maximum queue size possible. Which is actually the maximu=
m
> > > > > > >     queue size allowed by the virtio protocol. The appropriat=
e
> > > > > > >     value for VIRTQUEUE_MAX_SIZE would therefore be 32768:
> > > > > > >    =20
> > > > > > >     https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virti=
o-v1.
> > > > > > >     1-cs
> > > > > > >     01.h
> > > > > > >     tml#x1-240006
> > > > > > >    =20
> > > > > > >     Apparently VIRTQUEUE_MAX_SIZE was instead defined with a
> > > > > > >     more or less arbitrary value of 1024 in the past, which
> > > > > > >     limits the maximum transfer size with virtio to 4M
> > > > > > >     (more precise: 1024 * PAGE_SIZE, with the latter typicall=
y
> > > > > > >     being 4k).
> > > > > >=20
> > > > > > Being equal to IOV_MAX is a likely reason. Buffers with more io=
vecs
> > > > > > than
> > > > > > that cannot be passed to host system calls (sendmsg(2), pwritev=
(2),
> > > > > > etc).
> > > > >=20
> > > > > Yes, that's use case dependent. Hence the solution to opt-in if i=
t is
> > > > > desired and feasible.
> > > > >=20
> > > > > > > (2) Additionally the current value of 1024 poses a hidden lim=
it,
> > > > > > >=20
> > > > > > >     invisible to guest, which causes a system hang with the
> > > > > > >     following QEMU error if guest tries to exceed it:
> > > > > > >    =20
> > > > > > >     virtio: too many write descriptors in indirect table
> > > > > >=20
> > > > > > I don't understand this point. 2.6.5 The Virtqueue Descriptor T=
able
> > >=20
> > > says:
> > > > > >   The number of descriptors in the table is defined by the queu=
e
> > > > > >   size
> > > > > >   for
> > > > > >=20
> > > > > > this virtqueue: this is the maximum possible descriptor chain
> > > > > > length.
> > > > > >=20
> > > > > > and 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:
> > > > > >   A driver MUST NOT create a descriptor chain longer than the Q=
ueue
> > > > > >   Size
> > > > > >   of
> > > > > >=20
> > > > > > the device.
> > > > > >=20
> > > > > > Do you mean a broken/malicious guest driver that is violating t=
he
> > > > > > spec?
> > > > > > That's not a hidden limit, it's defined by the spec.
> > > > >=20
> > > > > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00781.ht=
ml
> > > > > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00788.ht=
ml
> > > > >=20
> > > > > You can already go beyond that queue size at runtime with the
> > > > > indirection
> > > > > table. The only actual limit is the currently hard coded value of=
 1k
> > > > > pages.
> > > > > Hence the suggestion to turn that into a variable.
> > > >=20
> > > > Exceeding Queue Size is a VIRTIO spec violation. Drivers that opera=
te
> > > > outsided the spec do so at their own risk. They may not be compatib=
le
> > > > with all device implementations.
> > >=20
> > > Yes, I am ware about that. And still, this practice is already done, =
which
> > > apparently is not limited to 9pfs.
> > >=20
> > > > The limit is not hidden, it's Queue Size as defined by the spec :).
> > > >=20
> > > > If you have a driver that is exceeding the limit, then please fix t=
he
> > > > driver.
> > >=20
> > > I absolutely understand your position, but I hope you also understand=
 that
> > > this violation of the specs is a theoretical issue, it is not a real-=
life
> > > problem right now, and due to lack of man power unfortunately I have =
to
> > > prioritize real-life problems over theoretical ones ATM. Keep in mind=
 that
> > > right now I am the only person working on 9pfs actively, I do this
> > > voluntarily whenever I find a free time slice, and I am not paid for =
it
> > > either.
> > >=20
> > > I don't see any reasonable way with reasonable effort to do what you =
are
> > > asking for here in 9pfs, and Greg may correct me here if I am saying
> > > anything wrong. If you are seeing any specific real-life issue here, =
then
> > > please tell me which one, otherwise I have to postpone that "specs
> > > violation" issue.
> > >=20
> > > There is still a long list of real problems that I need to hunt down =
in
> > > 9pfs, afterwards I can continue with theoretical ones if you want, bu=
t
> > > right now I simply can't, sorry.
> >=20
> > I understand. If you don't have time to fix the Linux virtio-9p driver
> > then that's fine.
>=20
> I will look at this again, but it might be tricky. On doubt I'll postpone=
 it.
>=20
> > I still wanted us to agree on the spec position because the commit
> > description says it's a "hidden limit", which is incorrect. It might
> > seem pedantic, but my concern is that misconceptions can spread if we
> > let them. That could cause people to write incorrect code later on.
> > Please update the commit description either by dropping 2) or by
> > replacing it with something else. For example:
> >=20
> >   2) The Linux virtio-9p guest driver does not honor the VIRTIO Queue
> >      Size value and can submit descriptor chains that exceed it. That i=
s
> >      a spec violation but is accepted by QEMU's device implementation.
> >=20
> >      When the guest creates a descriptor chain larger than 1024 the
> >      following QEMU error is printed and the guest hangs:
> >=20
> >      virtio: too many write descriptors in indirect table
>=20
> I am fine with both, probably preferring the text block above instead of=
=20
> silently dropping the reason, just for clarity.
>=20
> But keep in mind that this might not be limited to virtio-9p as your text=
=20
> would suggest, see below.
>=20
> > > > > > > (3) Unfortunately not all virtio users in QEMU would currentl=
y
> > > > > > >=20
> > > > > > >     work correctly with the new value of 32768.
> > > > > > >=20
> > > > > > > So let's turn this hard coded global value into a runtime
> > > > > > > variable as a first step in this commit, configurable for eac=
h
> > > > > > > virtio user by passing a corresponding value with virtio_init=
()
> > > > > > > call.
> > > > > >=20
> > > > > > virtio_add_queue() already has an int queue_size argument, why =
isn't
> > > > > > that enough to deal with the maximum queue size? There's probab=
ly a
> > > > > > good
> > > > > > reason for it, but please include it in the commit description.
> > > > >=20
> > > > > [...]
> > > > >=20
> > > > > > Can you make this value per-vq instead of per-vdev since virtqu=
eues
> > > > > > can
> > > > > > have different queue sizes?
> > > > > >=20
> > > > > > The same applies to the rest of this patch. Anything using
> > > > > > vdev->queue_max_size should probably use vq->vring.num instead.
> > > > >=20
> > > > > I would like to avoid that and keep it per device. The maximum si=
ze
> > > > > stored
> > > > > there is the maximum size supported by virtio user (or vortio dev=
ice
> > > > > model,
> > > > > however you want to call it). So that's really a limit per device=
, not
> > > > > per
> > > > > queue, as no queue of the device would ever exceed that limit.
> > > > >=20
> > > > > Plus a lot more code would need to be refactored, which I think i=
s
> > > > > unnecessary.
> > > >=20
> > > > I'm against a per-device limit because it's a concept that cannot
> > > > accurately describe reality. Some devices have multiple classes of
> > >=20
> > > It describes current reality, because VIRTQUEUE_MAX_SIZE obviously is=
 not
> > > per queue either ATM, and nobody ever cared.
> > >=20
> > > All this series does, is allowing to override that currently project-=
wide
> > > compile-time constant to a per-driver-model compile-time constant. Wh=
ich
> > > makes sense, because that's what it is: some drivers could cope with =
any
> > > transfer size, and some drivers are constrained to a certain maximum
> > > application specific transfer size (e.g. IOV_MAX).
> > >=20
> > > > virtqueues and they are sized differently, so a per-device limit is
> > > > insufficient. virtio-net has separate rx_queue_size and tx_queue_si=
ze
> > > > parameters (plus a control vq hardcoded to 64 descriptors).
> > >=20
> > > I simply find this overkill. This value semantically means "my driver
> > > model
> > > supports at any time and at any coincidence at the very most x * PAGE=
_SIZE
> > > =3D max_transfer_size". Do you see any driver that might want a more =
fine
> > > graded control over this?
> >=20
> > One reason why per-vq limits could make sense is that the maximum
> > possible number of struct elements is allocated upfront in some code
> > paths. Those code paths may need to differentiate between per-vq limits
> > for performance or memory utilization reasons. Today some places
> > allocate 1024 elements on the stack in some code paths, but maybe that'=
s
> > not acceptable when the per-device limit is 32k. This can matter when a
> > device has vqs with very different sizes.
> >=20
> [...]
> > > ... I leave that up to Michael or whoever might be in charge to decid=
e. I
> > > still find this overkill, but I will adapt this to whatever the decis=
ion
> > > eventually will be in v3.
> > >=20
> > > But then please tell me the precise representation that you find
> > > appropriate, i.e. whether you want a new function for that, or rather=
 an
> > > additional argument to virtio_add_queue(). Your call.
> >=20
> > virtio_add_queue() already takes an int queue_size argument. I think th=
e
> > necessary information is already there.
> >=20
> > This patch just needs to be tweaked to use the virtio_queue_get_num()
> > (or a new virtqueue_get_num() API if that's easier because only a
> > VirtQueue *vq pointer is available) instead of introducing a new
> > per-device limit.
>=20
> My understanding is that both the original 9p virtio device authors, as w=
ell=20
> as other virtio device authors in QEMU have been and are still using this=
 as a=20
> default value (i.e. to allocate some upfront, and the rest on demand).
>=20
> So yes, I know your argument about the specs, but AFAICS if I would just =
take=20
> this existing numeric argument for the limit, then it would probably brea=
k=20
> those other QEMU devices as well.

This is a good point that I didn't consider. If guest drivers currently
violate the spec, then restricting descriptor chain length to vring.num
will introduce regressions.

We can't use virtio_queue_get_num() directly. A backwards-compatible
limit is required:

  int virtio_queue_get_desc_chain_max(VirtIODevice *vdev, int n)
  {
      /*
       * QEMU historically allowed 1024 descriptors even if the
       * descriptor table was smaller.
       */
      return MAX(virtio_queue_get_num(vdev, qidx), 1024);
  }

Device models should call virtio_queue_get_desc_chain_max(). It
preserves the 1024 descriptor chain length but also allows larger values
if the virtqueue was configured appropriately.

Does this address the breakage you were thinking about?

Stefan

--av0hJQZISPGNunoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFdtdoACgkQnKSrs4Gr
c8iGeQf/b0/sEsRvNv35Aa5WH4ZFQjaVTga17FXscfzkOVQsLxsGd4LhgIhyRTPJ
2iFgTraTzI+46Yy5g6X6FA01Yjn6oKise3y5YkBZqPrvSNmbZypJk0qhN/LOG7DX
yp7aYYbu+pfn+z6n8oIa4w+rKbmOpgNa/4GtyfLXmO5PPYzpSxbsGxO6voAc6+vr
kerGnlAJYCK76ntGXE8+Ie7/PPzz3s9NDgdZarA/K7YmO0ErTrsXDpjnObCbGTOE
rdxdgiZNig6KE9AGGpcfUSsGFAFMd5KDWQLFuRHNByRl4Uol1k2E/vaduzsWGy5w
k7De/XwFO1PYbE60x1iu71dFZAbSug==
=u1ft
-----END PGP SIGNATURE-----

--av0hJQZISPGNunoE--


