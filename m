Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6F373F0D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:56:54 +0200 (CEST)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJtN-0004NL-IJ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leJoM-00081W-5P
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leJoJ-0001tG-Mw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620229895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6lmf4rHNWTKv49q60VTKygwU5MQrNWBceFKpzIzJeM=;
 b=Z03RzYSff487ll+q1nmYizxUNTsB3kQxSptgbHG2lyWcHRgjpWBFhVooQomBk+aW+K7bL0
 eo+MaVOoTwXYcGburqX5VTMrYZ3Lzh0I7vBiPYAzB4nVJJc59C11/dKAF15mkgXqzNZCpn
 VuJ5sKZiGGhQAvKnZ66kBflUhzfmPoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-jDDUnrY0PaWS-TuFFEWCog-1; Wed, 05 May 2021 11:51:32 -0400
X-MC-Unique: jDDUnrY0PaWS-TuFFEWCog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5E3380293C;
 Wed,  5 May 2021 15:51:28 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5B75D9C6;
 Wed,  5 May 2021 15:51:12 +0000 (UTC)
Date: Wed, 5 May 2021 16:51:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJK+8MrRe3ANcu7y@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
 <20210504143141.GA1078723@sent>
MIME-Version: 1.0
In-Reply-To: <20210504143141.GA1078723@sent>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6id/kTTLYVoo3eMW"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6id/kTTLYVoo3eMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 02:31:45PM +0000, John Levon wrote:
> On Tue, May 04, 2021 at 02:51:45PM +0100, Stefan Hajnoczi wrote:
>=20
> > On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > By the way, this DMA mapping design is the eager mapping approach.  Ano=
ther
> > approach is the lazy mapping approach where the server requests transla=
tions
> > as necessary. The advantage is that the client does not have to send ea=
ch
> > mapping to the server. In the case of VFIO_USER_DMA_READ/WRITE no mappi=
ngs
> > need to be sent at all. Only mmaps need mapping messages.
>=20
> Are you arguing that we should implement this? It would non-trivially com=
plicate
> the implementations on the server-side, where the library "owns" the mapp=
ings
> logic, but an API user is responsible for doing actual read/writes.

It's up to you whether the lazy DMA mapping approach is worth
investigating. It might perform better than the eager approach.
The vhost/vDPA lazy DMA mapping message is struct vhost_iotlb_msg in
Linux if you want to take a look.

> > How do potentially large messages work around max_msg_size? It is hard
> > for the client/server to anticipate the maximum message size that will
> > be required ahead of time, so they can't really know if they will hit a
> > situation where max_msg_size is too low.
>=20
> Are there specific messages you're worried about? would it help to add a
> specification stipulation as to minimum size that clients and servers mus=
t
> support?
>=20
> Ultimately the max msg size exists solely to ease implementation: with a
> reasonable fixed size, we can always consume the entire data in one go, r=
ather
> than doing partial reads. Obviously that needs a limit to avoid unbounded
> allocations.

It came to mind when reading about the dirty bitmap messages. Memory
dirty bitmaps can become large. An 8 GB memory region has a 1 MB dirty
bitmap.

> > > +VFIO_USER_DEVICE_GET_INFO
> > > +-------------------------
> > > +
> > > +Message format
> > > +^^^^^^^^^^^^^^
> > > +
> > > ++--------------+----------------------------+
> > > +| Name         | Value                      |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > > +| Message ID   | <ID>                       |
> > > ++--------------+----------------------------+
> > > +| Command      | 4                          |
> > > ++--------------+----------------------------+
> > > +| Message size | 32                         |
> > > ++--------------+----------------------------+
> > > +| Flags        | Reply bit set in reply     |
> > > ++--------------+----------------------------+
> > > +| Error        | 0/errno                    |
> > > ++--------------+----------------------------+
> > > +| Device info  | VFIO device info           |
> > > ++--------------+----------------------------+
> > > +
> > > +This command message is sent by the client to the server to query fo=
r basic
> > > +information about the device. The VFIO device info structure is defi=
ned in
> > > +``<linux/vfio.h>`` (``struct vfio_device_info``).
> >=20
> > Wait, "VFIO device info format" below is missing the cap_offset field,
> > so it's exactly not the same as <linux/vfio.h>?
>=20
> We had to move away from directly consuming struct vfio_device_info when
> cap_offset was added. Generally trying to use vfio.h at all seems like a =
bad
> idea. That's an implementation thing, but this was a dangling reference w=
e need
> to clean up.

Okay. Dropping "<linux/vfio.h>" from the spec would solve this.

Stefan

--6id/kTTLYVoo3eMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSvu8ACgkQnKSrs4Gr
c8imHQgAmI80dOVOLIxeCO3OqHZ5JGF4VLW49ZtjW970WNGGD+PMxu8ubrRpzMHj
7rZ21JuLVdi59HuSo/2Yf/rB8dnHGcvcjNkdrItsnrLuoZ/tRwQ2OxEw3W1eV9MC
bMDgKuRpvGuLxjmrnF0pydzeLSTwwAk5WeBqevvLDnjSDqRhAlE2ykrXOK5PAtT1
+8CJES9nAyFZA8b6izgdWwiyuwz/FSKV6JiNDbjzhP61zIrv88gZRqxrLUcMZWnu
GfRvaPo/uPoOg/j0L6k/GF1QoCr8Cnt92R7OHXxw6xhM9VHF6M6vntjAYoqg5tWJ
duE/doJgqhDNrXxCheL0kGd4fdV3Rw==
=lXHq
-----END PGP SIGNATURE-----

--6id/kTTLYVoo3eMW--


