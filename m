Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37B387A5C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:46:59 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj03l-0002vC-RI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lizzv-0002zB-KY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lizzt-0007Y9-RX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621345377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLCGVmznc73vd2iBjDCZzCBBWjivLtNC7ucxHDv+vis=;
 b=ICdGJxOZjGqZAD0qBcaC6qaTSy3wRkPx105J6AEomrKefR2v16s/LjAZ+V9zHckFkr0krI
 AkQtPtaV1jl1Q9v4UDAtsorUlQ7Uctjz3F+GnHgluJ5bSpW5yEmqRAcmDKxzR/zRJctAnS
 KQFjjr5QW5JH53lFC+ThQxhF6x9Nbd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-xYWc7rwxNpG2scnzMBH9Ew-1; Tue, 18 May 2021 09:42:53 -0400
X-MC-Unique: xYWc7rwxNpG2scnzMBH9Ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1889F102CB72;
 Tue, 18 May 2021 13:42:52 +0000 (UTC)
Received: from localhost (ovpn-115-196.ams2.redhat.com [10.36.115.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F15C3CC7;
 Tue, 18 May 2021 13:42:51 +0000 (UTC)
Date: Tue, 18 May 2021 14:42:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 07/22] cpr
Message-ID: <YKPEWicpOeh3yo5/@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
 <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
 <008ac3a4-a187-3e9f-d82d-8279e82805b1@oracle.com>
 <YJ5e4yFxMPO31viJ@stefanha-x1.localdomain>
 <881e5c07-8582-478c-9c13-47b1967cd3da@oracle.com>
MIME-Version: 1.0
In-Reply-To: <881e5c07-8582-478c-9c13-47b1967cd3da@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m5lURORNQvMKrLli"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--m5lURORNQvMKrLli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 11:14:44AM -0400, Steven Sistare wrote:
> On 5/14/2021 7:28 AM, Stefan Hajnoczi wrote:
> > On Thu, May 13, 2021 at 04:21:02PM -0400, Steven Sistare wrote:
> >> On 5/12/2021 12:19 PM, Stefan Hajnoczi wrote:
> >>> On Fri, May 07, 2021 at 05:25:05AM -0700, Steve Sistare wrote:
> >>>> To use the restart mode, qemu must be started with the memfd-alloc m=
achine
> >>>> option.  The memfd's are saved to the environment and kept open acro=
ss exec,
> >>>> after which they are found from the environment and re-mmap'd.  Henc=
e guest
> >>>> ram is preserved in place, albeit with new virtual addresses in the =
qemu
> >>>> process.  The caller resumes the guest by calling cprload, which loa=
ds
> >>>> state from the file.  If the VM was running at cprsave time, then VM
> >>>> execution resumes.  cprsave supports any type of guest image and blo=
ck
> >>>> device, but the caller must not modify guest block devices between c=
prsave
> >>>> and cprload.
> >>>
> >>> Does QEMU's existing -object memory-backend-file on tmpfs or hugetlbf=
s
> >>> achieve the same thing?
> >>
> >> Not quite.  Various secondary anonymous memory objects are allocated v=
ia ram_block_add
> >> and must be preserved, such as these on x86_64. =20
> >>   vga.vram
> >>   pc.ram
> >>   pc.bios
> >>   pc.rom
> >>   vga.rom
> >>   rom@etc/acpi/tables
> >>   rom@etc/table-loader
> >>   rom@etc/acpi/rsdp
> >>
> >> Even the read-only areas must be preserved rather than recreated from =
files in the updated
> >> qemu, as their contents may have changed.
> >=20
> > Migration knows how to save/load these RAM blocks. Only pc.ram is
> > significant in size so I'm not sure it's worth special-casing the
> > others?
>=20
> Some of these are mapped for vfio dma as a consequence of the normal memo=
ry region callback to
> consumers code.  We get conflict errors vs those existing vfio mappings i=
f they are recreated=20
> and remapped in the new process.  The memfd option is a simple and robust=
 solution to that issue.

Okay, if the VFIO device DMAs to them then they need to stay alive. Live
migration cannot copy their contents since they could be DMAed to at any
time and we'd copy stale data.

Stefan

--m5lURORNQvMKrLli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCjxFoACgkQnKSrs4Gr
c8gd4wf/bRRJ3sLNJuGc2bdT97LqtBwN2n27h+TizQJJWrCzYZeemxhEaZQ1qsUc
5uWlXuYfz6zg3cQYHOXQBpxsf9UZYNKcDN3E8JF2MXqsyKZ909hYw4BbBkKU9aKp
0vfio6AIJSvXfp5UT51M+8MHq71aH6ASIXWh7KZQ4nmzC0yS29Aix/ykBO3VNY0q
nx8Xi4Vayeif/T931BGaqDi08nyd5FQybIcscLZMqQTKqU9Y61lMWr0oU3YrATJ5
sX04+KhUEg1Tz47XWKJWc54claMjCcSRZNWZOZpEAAl6i/VPe5N0dlCqssonD0A3
OZY23aHFbAa0w2KCiVMDHNNhe4P5Fg==
=UhEZ
-----END PGP SIGNATURE-----

--m5lURORNQvMKrLli--


