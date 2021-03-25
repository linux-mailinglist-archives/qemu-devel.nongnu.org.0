Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7E34988F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:47:42 +0100 (CET)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPU57-0003AI-D6
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPU0y-0001FK-Kd
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lPU0v-0001NP-Qq
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616694200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3UG97iQAuw+8bK6zyx0S/chR/LTcHZ3CAp1VZ+vDuMo=;
 b=MCYFm+PP+odUopTlV0BElocuZdv58wO3FJonH7yDH9Y8brleh6IUDVEDtYQBpWWCjE0p6+
 T9fpmNgD6eeJGEORkXMstFkF0YPlebKTbz+yMkGaqDNoqZdU3i+7EtD1dI0A4ahIfMtGkd
 npeBSLs9DRiB5fuouqcDyM7wr6v9aes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-c1JbPvpcOkawiIPexLme2w-1; Thu, 25 Mar 2021 13:43:16 -0400
X-MC-Unique: c1JbPvpcOkawiIPexLme2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3790CC62A;
 Thu, 25 Mar 2021 17:43:14 +0000 (UTC)
Received: from localhost (ovpn-114-246.ams2.redhat.com [10.36.114.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17DA060854;
 Thu, 25 Mar 2021 17:43:11 +0000 (UTC)
Date: Thu, 25 Mar 2021 17:43:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <YFzLrn4SGjaIzC6p@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325130429-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210325130429-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Zaky4jWCHqvFg89"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/Zaky4jWCHqvFg89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 01:05:16PM -0400, Michael S. Tsirkin wrote:
> On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > a serious slow down may be observed on setups with a big enough number
> > of vCPUs.
> >=20
> > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threa=
ds):
> >=20
> > 1=09=090m20.922s=090m21.346s
> > 2=09=090m21.230s=090m20.350s
> > 4=09=090m21.761s=090m20.997s
> > 8=09=090m22.770s=090m20.051s
> > 16=09=090m22.038s=090m19.994s
> > 32=09=090m22.928s=090m20.803s
> > 64=09=090m26.583s=090m22.953s
> > 128=09=090m41.273s=090m32.333s
> > 256=09=092m4.727s =091m16.924s
> > 384=09=096m5.563s =093m26.186s
> >=20
> > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > the ioeventfds:
> >=20
> >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_singl=
e
> >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioevent=
fd_before
> > =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_=
ioeventfds
> >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_singl=
e
> >=20
> > address_space_update_ioeventfds() is called when committing an MR
> > transaction, i.e. for each ioeventfd with the current code base,
> > and it internally loops on all ioventfds:
> >=20
> > static void address_space_update_ioeventfds(AddressSpace *as)
> > {
> > [...]
> >     FOR_EACH_FLAT_RANGE(fr, view) {
> >         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
> >=20
> > This means that the setup of ioeventfds for these devices has
> > quadratic time complexity.
> >=20
> > This series introduce generic APIs to allow batch creation and deletion
> > of ioeventfds, and converts virtio-blk and virtio-scsi to use them. Thi=
s
> > greatly improves the numbers:
> >=20
> > 1=09=090m21.271s=090m22.076s
> > 2=09=090m20.912s=090m19.716s
> > 4=09=090m20.508s=090m19.310s
> > 8=09=090m21.374s=090m20.273s
> > 16=09=090m21.559s=090m21.374s
> > 32=09=090m22.532s=090m21.271s
> > 64=09=090m26.550s=090m22.007s
> > 128=09=090m29.115s=090m27.446s
> > 256=09=090m44.752s=090m41.004s
> > 384=09=091m2.884s=090m58.023s
> >=20
> > The series deliberately spans over multiple subsystems for easier
> > review and experimenting. It also does some preliminary fixes on
> > the way. It is thus posted as an RFC for now, but if the general
> > idea is acceptable, I guess a non-RFC could be posted and maybe
> > extend the feature to some other devices that might suffer from
> > similar scaling issues, e.g. vhost-scsi-pci, vhost-user-scsi-pci
> > and vhost-user-blk-pci, even if I haven't checked.
> >=20
> > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108
> > which reported the issue for virtio-scsi-pci.
>=20
>=20
> Series looks ok from a quick look ...
>=20
> this is a regression isn't it?
> So I guess we'll need that in 6.0 or revert the # of vqs
> change for now ...

Commit 9445e1e15e66c19e42bea942ba810db28052cd05 ("virtio-blk-pci:
default num_queues to -smp N") was already released in QEMU 5.2.0. It is
not a QEMU 6.0 regression.

I'll review this series on Monday.

Stefan

--/Zaky4jWCHqvFg89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBcy64ACgkQnKSrs4Gr
c8jUUgf8DzZK1iB55NeFX7GUHEbzPuuZWl2FPxEF73GJFZCcfy7oZxdsSQ6pCfyg
0xVuSnim9aUpiFavWbIn1+faMXpsH1kT05g+Zsj8baFlEEstDdA6/lkP6PcrRWD2
8HHZlOZDyArJ/5+5I/nBvYSYvFICeUFtz9pMKtLpVyybSh8kHHZ1MJlDk2DgRV9V
FsZbIJSima0bEEkMMlgGLjoKe2PuYaZqif4Uph+ThPnLqPGm6hyP0i065IyofCvb
sRsoWREMDMvxKpVU27+btLnh0pfXDqrKpQr1jTSlg9kDsr750JZgxbj+D8m+vdyH
BZic0IFN0sG2v4dKsuEkmDJSG8XE1A==
=iTgQ
-----END PGP SIGNATURE-----

--/Zaky4jWCHqvFg89--


