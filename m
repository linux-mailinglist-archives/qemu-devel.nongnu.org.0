Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D744CF7BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:48:35 +0100 (CET)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9yk-0003qK-8o
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nR9x4-0002o6-Ka
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nR9wy-0000Im-Bc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646646403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpr75zJ/nCgWrALuou7DKbqJrYwjop66J2yge7f51c0=;
 b=ctzG6mLdi+cSv+kclSjf4pXr1vNk5XoL8RvU4Nq08NG2yi+rECJYACpFbfCmOcaKYCMJUj
 esYGDfX/hWTVb75/VmoewsyVi3Xxa7cSmKLaw0usk5ZQW8Z6e2517qvIhSlsTLVqmuqR8N
 XzC6bAoTbSj2V0k1xnzjrOHgoiQuzhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-he89GUCaNuiq1BppwIF3Jw-1; Mon, 07 Mar 2022 04:46:39 -0500
X-MC-Unique: he89GUCaNuiq1BppwIF3Jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889FB1006AA5;
 Mon,  7 Mar 2022 09:46:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F5C6101E591;
 Mon,  7 Mar 2022 09:45:58 +0000 (UTC)
Date: Mon, 7 Mar 2022 09:45:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Message-ID: <YiXURRO7kjBogt9g@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
 <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
 <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
 <4022DDF7-8D34-4A65-969D-B632A66E386F@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WWm0IZqcTNaE6Auc"
Content-Disposition: inline
In-Reply-To: <4022DDF7-8D34-4A65-969D-B632A66E386F@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--WWm0IZqcTNaE6Auc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 02:49:53PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 2, 2022, at 11:49 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Mon, Feb 28, 2022 at 07:54:38PM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Feb 22, 2022, at 5:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>>=20
> >>> On Thu, Feb 17, 2022 at 02:48:59AM -0500, Jagannathan Raman wrote:
> >>>> +struct RemoteIommuElem {
> >>>> +    AddressSpace  as;
> >>>> +    MemoryRegion  mr;
> >>>> +};
> >>>> +
> >>>> +GHashTable *remote_iommu_elem_by_bdf;
> >>>=20
> >>> A mutable global hash table requires synchronization when device
> >>> emulation runs in multiple threads.
> >>>=20
> >>> I suggest using pci_setup_iommu()'s iommu_opaque argument to avoid the
> >>> global. If there is only 1 device per remote PCI bus, then there are =
no
> >>> further synchronization concerns.
> >>=20
> >> OK, will avoid the global. We would need to access the hash table
> >> concurrently since there could be more than one device in the
> >> same bus - so a mutex would be needed here.
> >=20
> > I thought the PCIe topology can be set up with a separate buf for each
> > x-vfio-user-server? I remember something like that in the previous
> > revision where a root port was instantiated for each x-vfio-user-server.
>=20
> Yes, we could setup the PCIe topology to be that way. But the user could
> add more than one device to the same bus, unless the bus type explicitly
> limits the number of devices to one (BusClass->max_dev).

Due to how the IOMMU is used to restrict the bus to the vfio-user
client's DMA mappings, it seems like it's necesssary to limit the number
of devices to 1 per bus anyway?

Stefan

--WWm0IZqcTNaE6Auc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIl1EUACgkQnKSrs4Gr
c8h0MAgAwkoXlPCoYqLFWysIgxNg0ZHbhfslkyJUwx40eTBHrX2X+drWr/QpOY9R
3yj8MN2PyOY2ZEnVkYfaH1LAeEgZfD+c05R3I4ACnVVXJ8w7IsQkEMfLdbqgCV24
1p13JscfvOk3QAMhrWwmY8YY13CSi0Z1vB0Q9Qv/rmk6BCmQf3FWLzygfEajVEnP
wbciPUKBtDebRPXjuhLmVJsViAlF/l4kDYB8awXc7wWHZ+GNN/PedJpKTUpZMfbq
m7xd5vrcqYepyw8EsDApBILk56/L0y4LZH2QvJIvYXhmqJ36l6oqSnEnYy4SbhZ5
6NTtEn4elNynpr/NRPShJUPpif6xxQ==
=3n4q
-----END PGP SIGNATURE-----

--WWm0IZqcTNaE6Auc--


