Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A23CD65B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:15:16 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5U38-0006z6-W0
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5U2H-0006Kr-VG
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5U2E-0007tX-Uo
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626704058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Byjg2YuMIYuiu94sOcTN8FOOfmIWMHsMr13Iy2QTbpU=;
 b=HQg9kk8yVp9MXYuCMznnnVLQVARNQ+116M22D2RpRr8yi8Q8YjM1ii29CpCEyrKa4GOgPe
 n94MEuV5oqVqhaXGNOxGXZiTQh4mkD1l7P31fZmbqaJgJvsjHJwVLqbHR1o86d/DfOOzgB
 d8fxETC1iPyPAWFiJGwbeel1bqQU0NM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-oLeyMsKCNc25MfgWn-xpgA-1; Mon, 19 Jul 2021 10:14:14 -0400
X-MC-Unique: oLeyMsKCNc25MfgWn-xpgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46BD78015C6;
 Mon, 19 Jul 2021 14:14:13 +0000 (UTC)
Received: from localhost (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D02E5D9DC;
 Mon, 19 Jul 2021 14:14:08 +0000 (UTC)
Date: Mon, 19 Jul 2021 15:13:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
Message-ID: <YPWIkRLSd7/wj11k@stefanha-x1.localdomain>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210524053144-mutt-send-email-mst@kernel.org>
 <CAJaqyWcVm55qjaDpQsuLzaY0FCzjW2ARyvOWCdfS9RJNoOM7Aw@mail.gmail.com>
 <20210524072739-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210524072739-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vZ5ERPfs+/Rz0sHU"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vZ5ERPfs+/Rz0sHU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 07:29:06AM -0400, Michael S. Tsirkin wrote:
> On Mon, May 24, 2021 at 12:37:48PM +0200, Eugenio Perez Martin wrote:
> > On Mon, May 24, 2021 at 11:38 AM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > >
> > > On Wed, May 19, 2021 at 06:28:34PM +0200, Eugenio P=E9rez wrote:
> > > > Commit 17 introduces the buffer forwarding. Previous one are for
> > > > preparations again, and laters are for enabling some obvious
> > > > optimizations. However, it needs the vdpa device to be able to map
> > > > every IOVA space, and some vDPA devices are not able to do so. Chec=
king
> > > > of this is added in previous commits.
> > >
> > > That might become a significant limitation. And it worries me that
> > > this is such a big patchset which might yet take a while to get
> > > finalized.
> > >
> >=20
> > Sorry, maybe I've been unclear here: Latter commits in this series
> > address this limitation. Still not perfect: for example, it does not
> > support adding or removing guest's memory at the moment, but this
> > should be easy to implement on top.
> >=20
> > The main issue I'm observing is from the kernel if I'm not wrong: If I
> > unmap every address, I cannot re-map them again. But code in this
> > patchset is mostly final, except for the comments it may arise in the
> > mail list of course.
> >=20
> > > I have an idea: how about as a first step we implement a transparent
> > > switch from vdpa to a software virtio in QEMU or a software vhost in
> > > kernel?
> > >
> > > This will give us live migration quickly with performance comparable
> > > to failover but without dependance on guest cooperation.
> > >
> >=20
> > I think it should be doable. I'm not sure about the effort that needs
> > to be done in qemu to hide these "hypervisor-failover devices" from
> > guest's view but it should be comparable to failover, as you say.
> >=20
> > Networking should be ok by its nature, although it could require care
> > on the host hardware setup. But I'm not sure how other types of
> > vhost/vdpa devices may work that way. How would a disk/scsi device
> > switch modes? Can the kernel take control of the vdpa device through
> > vhost, and just start reporting with a dirty bitmap?
> >=20
> > Thanks!
>=20
> It depends of course, e.g. blk is mostly reads/writes so
> not a lot of state. just don't reorder or drop requests.

QEMU's virtio-blk does not attempt to change states (e.g. quiesce the
device or switch between vhost kernel/QEMU, etc) while there are
in-flight requests. Instead all currently active requests must complete
(in some cases they can be cancelled to stop them early). Note that
failed requests can be kept in a list across the switch and then
resubmitted later.

The underlying storage never has requests in flight while the device is
switched. The reason QEMU does this is because there's no way to hand
over an in-flight preadv(2), Linux AIO, or other host kernel block layer
request to another process.

Stefan

--vZ5ERPfs+/Rz0sHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD1iJEACgkQnKSrs4Gr
c8gzBgf/YoLVCEyoNfmTzz77IqZwXuHgT5R778j5Ofg9MNulsBhsb/Q5umpJHkBU
oi9saB9Czxr30YQQmbRoAueVoehSxHprOAV1PRXuKqrOB2mDR7C9Fe8nWW0dP5zj
+Vclo7KToxH+WSNUCnydN+1dpXYNZ2tApcy3G8KAtEhpSbqH/3Bu0fQ7LMV1FaQ7
7kr/45jx9ylnRohq/fqKGuDpO07GtRJ0JAuXPq1MNc4KAj4krzt2HN07SWGONkZa
ahuFsc4rc42GmHFPKLfuQsHsuPIHRKIc9L6EMd2pW9z8b4JDN3QQ/x3DTPLZ6IIC
aUT7fHUX1rcSjvgQ8Ew58JRp5fQ8Mg==
=e1sj
-----END PGP SIGNATURE-----

--vZ5ERPfs+/Rz0sHU--


