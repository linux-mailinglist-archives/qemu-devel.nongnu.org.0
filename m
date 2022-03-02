Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8CA4CAAD8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:52:02 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSCn-0003xH-L3
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:52:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPSBb-0003Cn-NR
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:50:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPSBY-0004Rs-Or
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646239842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCWeOe6XhBxHhjpzU/aM4Qk/b6PprnoM6BL4ZejeEj4=;
 b=BpXOkqD0SvDpfc/vSJiatAc8Uaz2ent1dX8izOm89K7YC7xPi1UtyGolUO9+bh+CjcBF27
 s/pFEdqY8hwWaKhcfxxVUKhR8O7dx14VYkCDfZrVyEMlvuhpDMYJM44JFQ0h70QAWBvvc9
 6zzENPxrNvfiLQ5fN/6bvEcub4Z/So0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-4Ly1oeZRMUKHjGwnS5jOJw-1; Wed, 02 Mar 2022 11:50:38 -0500
X-MC-Unique: 4Ly1oeZRMUKHjGwnS5jOJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08A01883527;
 Wed,  2 Mar 2022 16:50:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5EB82766;
 Wed,  2 Mar 2022 16:49:57 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:49:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Message-ID: <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
 <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Em2S8xdz/mo8/t9I"
Content-Disposition: inline
In-Reply-To: <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Em2S8xdz/mo8/t9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 07:54:38PM +0000, Jag Raman wrote:
>=20
>=20
> > On Feb 22, 2022, at 5:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Thu, Feb 17, 2022 at 02:48:59AM -0500, Jagannathan Raman wrote:
> >> +struct RemoteIommuElem {
> >> +    AddressSpace  as;
> >> +    MemoryRegion  mr;
> >> +};
> >> +
> >> +GHashTable *remote_iommu_elem_by_bdf;
> >=20
> > A mutable global hash table requires synchronization when device
> > emulation runs in multiple threads.
> >=20
> > I suggest using pci_setup_iommu()'s iommu_opaque argument to avoid the
> > global. If there is only 1 device per remote PCI bus, then there are no
> > further synchronization concerns.
>=20
> OK, will avoid the global. We would need to access the hash table
> concurrently since there could be more than one device in the
> same bus - so a mutex would be needed here.

I thought the PCIe topology can be set up with a separate buf for each
x-vfio-user-server? I remember something like that in the previous
revision where a root port was instantiated for each x-vfio-user-server.

Stefan

--Em2S8xdz/mo8/t9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfoDMACgkQnKSrs4Gr
c8gOMAf/bCLyd5JkvcWgUO+HSGw4XwWgn4+bEIMK8aS7nyJ2L224htu5h9dHSxmU
bXd6br2hN4UtGDXj5CUg8utGal8hZYlXy2tHFaP+8t+7urKyC541Q6Lwwq6CEyrs
PLmQEOLTF9R0ncgSj4rY8h4ageS7WXpvL4jZNo5/fbPgZyCJqGaWsdsSf4Wp0gXS
1GgsDsopSofJoKPlV+ZjwuOz2c9fBysCXFKZGF/wwaEeP862t6pWmbTo7YEkeqb3
lfskkU9gBHHQ1XZv/h2orJF0RLcJHRlS9Of55nXdDYhtc5qbkdpA9Ttl0l/2WJCP
aaZHG29/aQ5QsMFDduk3BOUB8nflog==
=nfkV
-----END PGP SIGNATURE-----

--Em2S8xdz/mo8/t9I--


