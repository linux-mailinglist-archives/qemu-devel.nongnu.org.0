Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E049F62A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 10:21:44 +0100 (CET)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDNRu-0000fk-U4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 04:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nDNOe-0007bq-DA
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nDNOa-0005tp-TQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643361495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5NNQJHlYQOLZx2k06lPuBcV5LqbUCMhbgYJugrLxcY=;
 b=cUCAQgwC4v4sjs3HHXl3EuvLllCOy4hKme3CgfO1CHj7k6Pi7+fKSdVKlKw3Jk9TLv+ruV
 4Tey4My1HI9ChoLo1mbL0RZYf67rE2pxFKWlcigTjeYN/BFa5cn1oQkqWtGx5FpsPpDgEw
 A760SYUZJyYefPz/sk+A6P9okVDJYmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-SzdCYgQmN22W49dzRRGAng-1; Fri, 28 Jan 2022 04:18:12 -0500
X-MC-Unique: SzdCYgQmN22W49dzRRGAng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0731898290;
 Fri, 28 Jan 2022 09:18:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F0CF67C99;
 Fri, 28 Jan 2022 09:18:09 +0000 (UTC)
Date: Fri, 28 Jan 2022 09:18:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
References: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UiaCvmfFzZjTTQlc"
Content-Disposition: inline
In-Reply-To: <20220127142253.21ab0025.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UiaCvmfFzZjTTQlc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:
> If the goal here is to restrict DMA between devices, ie. peer-to-peer
> (p2p), why are we trying to re-invent what an IOMMU already does?

The issue Dave raised is that vfio-user servers run in separate
processses from QEMU with shared memory access to RAM but no direct
access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is one
example of a non-RAM MemoryRegion that can be the source/target of DMA
requests.

I don't think IOMMUs solve this problem but luckily the vfio-user
protocol already has messages that vfio-user servers can use as a
fallback when DMA cannot be completed through the shared memory RAM
accesses.

> In
> fact, it seems like an IOMMU does this better in providing an IOVA
> address space per BDF.  Is the dynamic mapping overhead too much?  What
> physical hardware properties or specifications could we leverage to
> restrict p2p mappings to a device?  Should it be governed by machine
> type to provide consistency between devices?  Should each "isolated"
> bus be in a separate root complex?  Thanks,

There is a separate issue in this patch series regarding isolating the
address space where BAR accesses are made (i.e. the global
address_space_memory/io). When one process hosts multiple vfio-user
server instances (e.g. a software-defined network switch with multiple
ethernet devices) then each instance needs isolated memory and io address
spaces so that vfio-user clients don't cause collisions when they map
BARs to the same address.

I think the the separate root complex idea is a good solution. This
patch series takes a different approach by adding the concept of
isolated address spaces into hw/pci/.

Stefan

--UiaCvmfFzZjTTQlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHztNAACgkQnKSrs4Gr
c8hGVQf+LwpRf7ijZMX6AG8aPgkQWh7itlpRqGeQfQ54cOOZzaIXR1Ax47rdBz21
ahXg/gA731B5cw/SZnCl2L98KqO9WY8Ycf+9l1ptrMKarRUBVEAqNTXeUAjf9re3
TqCcMhxuTw09fkDMzitXTmlRI4w0A9gaOeCPOnZglFxdUJSKYIXSGQ+FKwW0cEIg
ediH316Surk0FXQOisNN3U0TYMVpMq+rDhL592bxnGsfwj57+YZi+7qZR7sMaddK
1FDmCIsvDsitLJYPB1/bK7VO2vV1MVLkhvrGpi7csikcCCle4hTFnBqRvCv7yL4p
0PHJufd1Fm46phkTtbt1IIkI1exA8Q==
=EiIs
-----END PGP SIGNATURE-----

--UiaCvmfFzZjTTQlc--


