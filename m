Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501E37A46D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:17:55 +0200 (CEST)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPSc-00044R-4o
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgPLH-0004w1-Mx
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgPLF-0000w1-Ee
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iIHDfOT91EzH1G1s/fZdAwoUp21j67lxz0sZoemlHeo=;
 b=hr7gm4I6AL1DEf3GYLrCtQYamLcN1I2TTdS2QeMZg9P8Kqpaj2TWEkM2gvGYBYTG+F0Upl
 /gTdJntTcsMGDpubW3cIxvtkYc2MqfPoimbKkcWeH1gr4JjPJS7gj1IkYG8dV7zWocik0t
 kp/0YMMBIZFiYMIHQpt5dkD6gYDnC3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-x-YB5l8QMdK7vTQR6DDeDA-1; Tue, 11 May 2021 06:10:14 -0400
X-MC-Unique: x-YB5l8QMdK7vTQR6DDeDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2100310066EB;
 Tue, 11 May 2021 10:10:11 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AACBC7012F;
 Tue, 11 May 2021 10:09:54 +0000 (UTC)
Date: Tue, 11 May 2021 11:09:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <levon@movementarian.org>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJpX8XT+WvXYkyMD@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
 <20210510222541.GA1916565@li1368-133.members.linode.com>
MIME-Version: 1.0
In-Reply-To: <20210510222541.GA1916565@li1368-133.members.linode.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Q0Icn9A8ubEDBqM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: benjamin.walker@intel.com, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, jag.raman@oracle.com,
 james.r.harris@intel.com, John Levon <john.levon@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, konrad.wilk@oracle.com,
 yuvalkashtan@gmail.com, dgilbert@redhat.com, eafanasova@gmail.com,
 ismael@linux.com, Paolo Bonzini <pbonzini@redhat.com>, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com,
 tina.zhang@intel.com, xiuchun.lu@intel.com,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--9Q0Icn9A8ubEDBqM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:25:41PM +0000, John Levon wrote:
> On Mon, May 10, 2021 at 05:57:37PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > > +Region IO FD info format
> > > +^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > ++-------------+--------+------+
> > > +| Name        | Offset | Size |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D+
> > > +| argsz       | 16     | 4    |
> > > ++-------------+--------+------+
> > > +| flags       | 20     | 4    |
> > > ++-------------+--------+------+
> > > +| index       | 24     | 4    |
> > > ++-------------+--------+------+
> > > +| count       | 28     | 4    |
> > > ++-------------+--------+------+
> > > +| sub-regions | 32     | ...  |
> > > ++-------------+--------+------+
> > > +
> > > +* *argsz* is the size of the region IO FD info structure plus the
> > > +  total size of the sub-region array. Thus, each array entry "i" is =
at offset
> > > +  i * ((argsz - 32) / count). Note that currently this is 40 bytes f=
or both IO
> > > +  FD types, but this is not to be relied on.
> > > +* *flags* must be zero
> > > +* *index* is the index of memory region being queried
> > > +* *count* is the number of sub-regions in the array
> > > +* *sub-regions* is the array of Sub-Region IO FD info structures
> > > +
> > > +The client must set ``flags`` to zero and specify the region being q=
ueried in
> > > +the ``index``.
> > > +
> > > +The client sets the ``argsz`` field to indicate the maximum size of =
the response
> > > +that the server can send, which must be at least the size of the res=
ponse header
> > > +plus space for the sub-region array. If the full response size excee=
ds ``argsz``,
> > > +then the server must respond only with the response header and the R=
egion IO FD
> > > +info structure, setting in ``argsz`` the buffer size required to sto=
re the full
> > > +response. In this case, no file descriptors are passed back.  The cl=
ient then
> > > +retries the operation with a larger receive buffer.
> > > +
> > > +The reply message will additionally include at least one file descri=
ptor in the
> > > +ancillary data. Note that more than one sub-region may share the sam=
e file
> > > +descriptor.
> >=20
> > How does this interact with the maximum number of file descriptors,
> > max_fds? It is possible that there are more sub-regions than max_fds
> > allows...
>=20
> I think this would just be a matter of the client advertising a reasonabl=
y large
> enough size for max_msg_fds. Do we need to worry about this?

vhost-user historically only supported passing 8 fds and it became a
problem there.

I can imagine devices having 10s to 100s of sub-regions (e.g. 64 queue
doorbells). Probably not 1000s.

If I was implementing a server I would check the negotiated max_fds and
refuse to start the vfio-user connection if the device has been
configured to require more sub-regions. Failing early and printing an
error would allow users to troubleshoot the issue and re-configure the
client/server.

This seems okay but the spec doesn't mention it explicitly so I wanted
to check what you had in mind.

> > > +Interrupt info format
> > > +^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > ++-----------+--------+------+
> > > +| Name      | Offset | Size |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D+
> > > +| Sub-index | 16     | 4    |
> > > ++-----------+--------+------+
> > > +
> > > +* *Sub-index* is relative to the IRQ index, e.g., the vector number =
used in PCI
> > > +  MSI/X type interrupts.
> >=20
> > Hmm...this is weird. The server tells the client to raise an MSI-X
> > interrupt but does not include the MSI message that resides in the MSI-=
X
> > table BAR device region? Or should MSI-X interrupts be delivered to the
> > client via VFIO_USER_DMA_WRITE instead?
> >=20
> > (Basically it's not clear to me how MSI-X interrupts would work with
> > vfio-user. Reading how they work in kernel VFIO might let me infer it,
> > but it's probably worth explaining this clearly in the spec.)
>=20
> It doesn't. We don't have an implementation, and the qemu patches don't g=
et this
> right either - it treats the sub-index as the IRQ index AKA IRQ type.
>=20
> I'd be inclined to just remove this for now, until we have an implementat=
ion.
> Thoughts?

I don't remember the details of kernel VFIO irqs but it has an interface
where VFIO notifies KVM of configured irqs so that KVM can set up Posted
Interrupts. I think vfio-user would use KVM irqfd eventfds for efficient
interrupt injection instead since we're not trying to map a host
interrupt to a guest interrupt.

Fleshing out irqs sounds like a 1.0 milestone to me. It will definitely
be necessary but for now this can be dropped.

> > > +VFIO_USER_DEVICE_RESET
> > > +----------------------
> > > +
> > > +Message format
> > > +^^^^^^^^^^^^^^
> > > +
> > > ++--------------+------------------------+
> > > +| Name         | Value                  |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > +| Message ID   | <ID>                   |
> > > ++--------------+------------------------+
> > > +| Command      | 14                     |
> > > ++--------------+------------------------+
> > > +| Message size | 16                     |
> > > ++--------------+------------------------+
> > > +| Flags        | Reply bit set in reply |
> > > ++--------------+------------------------+
> > > +| Error        | 0/errno                |
> > > ++--------------+------------------------+
> > > +
> > > +This command message is sent from the client to the server to reset =
the device.
> >=20
> > Any requirements for how long VFIO_USER_DEVICE_RESET takes to complete?
> > In some cases a reset involves the server communicating with other
> > systems or components and this can take an unbounded amount of time.
> > Therefore this message could hang. For example, if a vfio-user NVMe
> > device was accessing data on a hung NFS export and there were I/O
> > requests in flight that need to be aborted.
>=20
> I'm not sure this is something we could put in the generic spec. Perhaps =
a
> caveat?

It's up to you whether you want to discuss this in the spec or let
client implementors figure it out themselves. Any vfio-user message can
take an unbounded amount of time and we could assume that readers will
think of this.

VFIO_USER_DEVICE_RESET is just particularly likely to be called by
clients from a synchronous code path. QEMU moved the monitor (RPC
interface) fd into a separate thread in order to stay responsive when
the main event loop is blocked for any reason, so the issue came to
mind.

--9Q0Icn9A8ubEDBqM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaV/EACgkQnKSrs4Gr
c8iikwgAmP/OynI/kGGdAGzasnDNNgauGzVw7m13Citg1xHLeWNtxOLJct553mS/
K4AiuJObXevCZqc1AApePvpQw+QLRzhgAbR5nT4DFjxM2W3o6KcvcVHfSUwHHKar
KalVBeskeyyCYtnOcgbfh/dRLEjLAnUI3pqqqV6l2P0wWnNGoIdXunX57C/ydNFH
SCclY+Cywy1XrAyguZHYMY/35peQM6fX7lrCx0KDJeN4+eYXy4qYgw07owoMycZf
/1QVyk5Y3dlqzvOYEiWIAamlx9Qr8NejAuFmxvbxnyG6yJh5Mp3qdoQtYJJS0cSG
Vvgky6u74da/80NA4EsSCz8ovmP+sA==
=lfxP
-----END PGP SIGNATURE-----

--9Q0Icn9A8ubEDBqM--


