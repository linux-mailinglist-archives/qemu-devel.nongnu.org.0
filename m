Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53034EC95A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:10:32 +0200 (CEST)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZau0-00063Z-0y
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:10:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZaqM-0003L6-SM
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZaqJ-0008PO-Fn
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648656402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFj7NHxQsdPElnAWYn29DRqFH6CYK+mm/tyVhI+6DvQ=;
 b=PYOfuTkxAO8uLymHAxqvFtlihlLR4mD67V06f6Cp7aQTVkSXN0aDXaOdmeFhM0HvEknppa
 bzrvX613r/GkyfXxX+JNaT742H2EuZwhrWCH0qZzmHMCrcbsTNXl7RAYYjARWRNK7PAPqb
 F8Y9S4SMhfdGpBmKGR4dTUiiNGtVCOM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-guogl2pIPLOoUxn7b4tF1w-1; Wed, 30 Mar 2022 12:06:38 -0400
X-MC-Unique: guogl2pIPLOoUxn7b4tF1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 911B93804088;
 Wed, 30 Mar 2022 16:06:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9805CC08096;
 Wed, 30 Mar 2022 16:06:06 +0000 (UTC)
Date: Wed, 30 Mar 2022 17:06:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Message-ID: <YkR/7TArhw6AaRNM@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
 <YkMArX56GKwOTsc0@stefanha-x1.localdomain>
 <45272D4A-0625-446A-804E-3211F2D91B81@oracle.com>
 <YkQrh5pWniHTT1LK@stefanha-x1.localdomain>
 <F0C4F49C-BB5A-4719-BB21-BE9BDA6D2510@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/MBUeJLZlGomiBiM"
Content-Disposition: inline
In-Reply-To: <F0C4F49C-BB5A-4719-BB21-BE9BDA6D2510@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--/MBUeJLZlGomiBiM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 02:46:20PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 30, 2022, at 6:05 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Tue, Mar 29, 2022 at 03:51:17PM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Mar 29, 2022, at 8:50 AM, Stefan Hajnoczi <stefanha@redhat.com> wr=
ote:
> >>>=20
> >>> On Fri, Mar 25, 2022 at 03:19:43PM -0400, Jagannathan Raman wrote:
> >>>> @@ -324,6 +325,170 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx,=
 vfu_dma_info_t *info)
> >>>>    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
> >>>> }
> >>>>=20
> >>>> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
> >>>> +                                hwaddr offset, char * const buf,
> >>>> +                                hwaddr len, const bool is_write)
> >>>> +{
> >>>> +    uint8_t *ptr =3D (uint8_t *)buf;
> >>>> +    uint8_t *ram_ptr =3D NULL;
> >>>> +    bool release_lock =3D false;
> >>>> +    MemoryRegionSection section =3D { 0 };
> >>>> +    MemoryRegion *mr =3D NULL;
> >>>> +    int access_size;
> >>>> +    hwaddr size =3D 0;
> >>>> +    MemTxResult result;
> >>>> +    uint64_t val;
> >>>> +
> >>>> +    section =3D memory_region_find(pci_dev->io_regions[pci_bar].mem=
ory,
> >>>> +                                 offset, len);
> >>>> +
> >>>> +    if (!section.mr) {
> >>>> +        return 0;
> >>>> +    }
> >>>> +
> >>>> +    mr =3D section.mr;
> >>>> +    offset =3D section.offset_within_region;
> >>>> +
> >>>> +    if (is_write && mr->readonly) {
> >>>> +        warn_report("vfu: attempting to write to readonly region in=
 "
> >>>> +                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
> >>>> +                    pci_bar, offset, (offset + len));
> >>>> +        return 0;
> >>>=20
> >>> A mr reference is leaked. The return statement can be replaced with g=
oto
> >>> exit.
> >>=20
> >> OK.
> >>=20
> >>>=20
> >>>> +    }
> >>>> +
> >>>> +    if (memory_access_is_direct(mr, is_write)) {
> >>>> +        /**
> >>>> +         * Some devices expose a PCI expansion ROM, which could be =
buffer
> >>>> +         * based as compared to other regions which are primarily b=
ased on
> >>>> +         * MemoryRegionOps. memory_region_find() would already check
> >>>> +         * for buffer overflow, we don't need to repeat it here.
> >>>> +         */
> >>>> +        ram_ptr =3D memory_region_get_ram_ptr(mr);
> >>>> +
> >>>> +        size =3D len;
> >>>=20
> >>> This looks like it will access beyond the end of ram_ptr when
> >>> section.size < len after memory_region_find() returns.
> >>=20
> >> OK - will will handle shorter sections returned by memory_region_find(=
).
> >>=20
> >>>=20
> >>>> +
> >>>> +        if (is_write) {
> >>>> +            memcpy((ram_ptr + offset), buf, size);
> >>>> +        } else {
> >>>> +            memcpy(buf, (ram_ptr + offset), size);
> >>>> +        }
> >>>> +
> >>>> +        goto exit;
> >>>=20
> >>> What happens when the access spans two adjacent MemoryRegions? I think
> >>> the while (len > 0) loop is needed even in the memory_access_is_direc=
t()
> >>> case so we perform the full access instead of truncating it.
> >>=20
> >> OK - this should be covered by the shorter section handling above.
> >=20
> > No, shorter section handling truncates that access. I think the caller
> > expects all len bytes to be accessed, not just the first few bytes?
>=20
> Yes, I also think that the caller expects to access all len bytes.
>=20
> I should=E2=80=99ve provided more details - but by shorter section handli=
ng I
> meant iterating over all the sections that make up len bytes.

Okay, I think we're on the same page. I wanted to be make sure that if
(memory_access_is_direct()) will be moved inside the loop.

Stefan

--/MBUeJLZlGomiBiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJEf+0ACgkQnKSrs4Gr
c8iEUgf/U2Tc56A2iLuVDhVU+vMuXZUGJCUtsdPjF30SPp26oQQkChj6ZX8yg4iR
6yhCyZhPPFrdWD/HhG0TWaYbr6/3j2pTpr+fgVWqU1wRfYpfqAAhsRF1CDGLjxM6
wfjYDnxHPN8/krnbkK59W1LEJ9E8DozDmUSeoh6xJtAnj/CSiRtjwAhw3Njj7gFd
zTZ1Vl+d6dM2nHcboLsLtJddv4/r7KbMBaGxTlgCqD9eJO+CA9FozDPYyOb6T3HF
jhlEXm1587AYMhprUPUTQsxaccgoUzsdQ365ge7UPEUZFoThzhcWIe8ou1ljMBNY
nyFamBKKFNE3WJgEE6Z/HZ/p/I1jgg==
=2Dng
-----END PGP SIGNATURE-----

--/MBUeJLZlGomiBiM--


