Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEF49C6F6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:59:41 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCf5Y-0006av-GU
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCf2z-0005kY-7n
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCf2v-0005HF-St
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643191016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oldxo/BMh/lPd7G0xtJQt2habe9MoPQ/XpNjyiRsmSQ=;
 b=eNoTD6cjmBr9yt0eyF8Y9mDwo7QmjPbMPVRdf5dvHnlzvbBtRtny61wCikaCOPRyy6zGkN
 rbVCdyZex8sL2ZsOqZyBQ3lqm4M0OrWm0I4353cgYnVSQV9UVCCa/AaNacfb+M0tyRrHb/
 QeRyBW7ym3/1fcIiAprbwDs7zSFQcDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-_BnlR0mCOgus5vU3ZZb2dg-1; Wed, 26 Jan 2022 04:56:52 -0500
X-MC-Unique: _BnlR0mCOgus5vU3ZZb2dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34077835BC3;
 Wed, 26 Jan 2022 09:56:50 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E0FE66E08;
 Wed, 26 Jan 2022 09:56:49 +0000 (UTC)
Date: Wed, 26 Jan 2022 09:56:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 00/18] vfio-user server in QEMU
Message-ID: <YfEa4MYx2QQ0yHd7@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <YfAekQfnC4VfSXtW@stefanha-x1.localdomain>
 <19B94D9D-9D65-42BD-813F-1A8BB55AB07F@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EIoBBEzZh59XwHTE"
Content-Disposition: inline
In-Reply-To: <19B94D9D-9D65-42BD-813F-1A8BB55AB07F@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EIoBBEzZh59XwHTE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 05:04:58AM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 11:00 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >=20
> > Hi Jag,
> > Thanks for this latest revision. The biggest outstanding question I have
> > is about the isolated address spaces design.
>=20
> Thank you for taking the time to review the patches, Stefan!
>=20
> >=20
> > This patch series needs a PCIBus with its own Memory Space, I/O Space,
> > and interrupts. That way a single QEMU process can host vfio-user
> > servers that different VMs connect to. They all need isolated address
> > spaces so that mapping a BAR in Device A does not conflict with mapping
> > a BAR in Device B.
> >=20
> > The current approach adds special code to hw/pci/pci.c so that custom
> > AddressSpace can be set up. The isolated PCIBus is an automatically
> > created PCIe root port that's a child of the machine's main PCI bus. On
> > one hand it's neat because QEMU's assumption that there is only one
> > root SysBus isn't violated. On the other hand it seems like a special
> > case hack for PCI and I'm not sure in what sense these PCIBusses are
> > really children of the machine's main PCI bus since they don't share or
> > interact in any way.
>=20
> We are discussing the automatic creation part you just mentioned in
> the following email:
> [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote machine
>=20
> I agree that automatic creation of a parent bus is not ideal - we could
> specify the parent bus as a separate option in the command-line or
> QMP. This change would avoid modification to hw/pci/pci.c - the new
> PCI bus could be created inplace during device creation/hotplug.
>=20
> The following image gives an idea of the bus/device topology in the remote
> machine, as implemented in the current series. Each secondary bus and
> its children have isolated memory and IO spaces.
> https://gitlab.com/jraman/qemu/-/commit/2e2ebf004894075ad8044739b0b16ce87=
5114c4c

Do isolated PCI busses have any relationship with their parent at all? I
think the parent plays a useful role in DMA/IOMMU, interrupts, or PCI
addressing. That leaves me wondering if a parent/child relationship is
an appropriate way to model this.

That said, this approach solves two problems:
1. There must be some parent for the new PCI bus.
2. qdev_find_recursive() and friends must be able to find the PCIDevice
   on the isolated bus.

> > Another approach that came to mind is to allow multiple root SysBusses.
> > Each vfio-user server would need its own SysBus and put a regular PCI
> > host onto that isolated SysBus without modifying hw/pci/pci.c with a
> > special case. The downside to this is that violating the single SysBus
> > assumption probably breaks monitor commands that rely on
> > qdev_find_recursive() and friends. It seems cleaner than adding isolated
> > address spaces to PCI specifically, but also raises the question if
> > multiple machine instances are needed (which would raise even more
> > questions).
>=20
> Based on further discussion with Stefan, I got some clarity. We could con=
sider one
> more option as well - somewhere in-between multiple root SysBuses and the=
 topology
> discussed above (with secondary PCI buses). We could implement a
> TYPE_SYS_BUS_DEVICE that creates a root PCI bus with isolated memory rang=
es.
> Something along the lines in the following diagram:
> https://gitlab.com/jraman/qemu/-/commit/81f6a998278a2a795be0db7acdeb1caa2=
d6744fb
>=20
> An example set of QMP commands to attach PCI devices would be:
> device_add pci-root-bus,id=3Drb1
> device_add <driver>,id=3Dmydev,bus=3Drb1
> object-add x-vfio-user-server,device=3Dmydev
>=20
> where =E2=80=98pci-root-bus=E2=80=99 is a TYPE_SYS_BUS_DEVICE that create=
s its own root PCI bus.

If it's less code then that's an advantage but it still places unrelated
DMA/interrupt spaces onto the same SysBus and therefore requires
isolation. I think this alternative doesn't fundamentally fix the
design.

If multiple roots are possible then isolation doesn't need to be
implemented explicitly, it comes for free as part of the regular
qdev/qbus hierarchy. The devices would be isolated by the fact that they
live on different roots :).

I have never tried the multi-root approach though, so I'm not sure how
much work it is.

Stefan

--EIoBBEzZh59XwHTE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxGuAACgkQnKSrs4Gr
c8if/wgApV/XVRxVd64UcGG/t6QisVMTciob86iHO6qyYmT3DXhNBPCopgvpYQh7
7JZmnB50kTbtDX+yzZ1avhJ2nMPfdEsAkUVHbxW3ppBsfw6o6xe77J0s2KoZj0ha
SouROBlMlGFV/bRqImaDYJhODqCTehfXQeNd5wPFxX4MG8zNVZ7K5yh5QShMXuNi
M1G7l3NlTxPFI06eG0z15UzbbCc8YbVy/JYB43HSW//0WvYm6cCPNFYxpq4heD98
q2saOccX+1Y7WcoozIU/oexDwaToR8edr48ptQHnedgDq33uEvtBh/REP0e5AfNH
kPukx9FkTwuIYUgwZzhZ7SAwdoIvnQ==
=er0X
-----END PGP SIGNATURE-----

--EIoBBEzZh59XwHTE--


