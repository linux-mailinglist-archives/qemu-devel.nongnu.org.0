Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13980380878
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:30:53 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhW1r-0005hN-IO
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhW01-00050n-0P
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhVzx-00015X-H7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620991732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQZqx0YDkhA3zX/9kBXj4jh4luXfmlEcEbZqPO4quEo=;
 b=VYDufVl5cFNQq1qv4IU0z8BPXeZbHSguPqtVBppPmT1OcBqPdb7FwNI7Py4CcJOqzS9w6Z
 a+8BsJqcF8ppdrAjMMz/CbH2pG8nJ7hwWCg6F8o4Xbd0gleA+EXkuzAx6S8FOVAn23AEZn
 YKWZEv5oEtJ8IjBdWSsaMriCv+COJMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-um5NWk1CNMK7rrlllP5cTA-1; Fri, 14 May 2021 07:28:50 -0400
X-MC-Unique: um5NWk1CNMK7rrlllP5cTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D06E8015A8;
 Fri, 14 May 2021 11:28:47 +0000 (UTC)
Received: from localhost (ovpn-114-20.ams2.redhat.com [10.36.114.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEE4A6EF48;
 Fri, 14 May 2021 11:28:36 +0000 (UTC)
Date: Fri, 14 May 2021 12:28:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 07/22] cpr
Message-ID: <YJ5e4yFxMPO31viJ@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
 <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
 <008ac3a4-a187-3e9f-d82d-8279e82805b1@oracle.com>
MIME-Version: 1.0
In-Reply-To: <008ac3a4-a187-3e9f-d82d-8279e82805b1@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uAN+J7NCwWvVXUv5"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

--uAN+J7NCwWvVXUv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 04:21:02PM -0400, Steven Sistare wrote:
> On 5/12/2021 12:19 PM, Stefan Hajnoczi wrote:
> > On Fri, May 07, 2021 at 05:25:05AM -0700, Steve Sistare wrote:
> >> To use the restart mode, qemu must be started with the memfd-alloc mac=
hine
> >> option.  The memfd's are saved to the environment and kept open across=
 exec,
> >> after which they are found from the environment and re-mmap'd.  Hence =
guest
> >> ram is preserved in place, albeit with new virtual addresses in the qe=
mu
> >> process.  The caller resumes the guest by calling cprload, which loads
> >> state from the file.  If the VM was running at cprsave time, then VM
> >> execution resumes.  cprsave supports any type of guest image and block
> >> device, but the caller must not modify guest block devices between cpr=
save
> >> and cprload.
> >=20
> > Does QEMU's existing -object memory-backend-file on tmpfs or hugetlbfs
> > achieve the same thing?
>=20
> Not quite.  Various secondary anonymous memory objects are allocated via =
ram_block_add
> and must be preserved, such as these on x86_64. =20
>   vga.vram
>   pc.ram
>   pc.bios
>   pc.rom
>   vga.rom
>   rom@etc/acpi/tables
>   rom@etc/table-loader
>   rom@etc/acpi/rsdp
>=20
> Even the read-only areas must be preserved rather than recreated from fil=
es in the updated
> qemu, as their contents may have changed.

Migration knows how to save/load these RAM blocks. Only pc.ram is
significant in size so I'm not sure it's worth special-casing the
others?

Stefan

--uAN+J7NCwWvVXUv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCeXuMACgkQnKSrs4Gr
c8jHywf8CxBROYscK92rOz9ibELAFk/j/tct/KiKBU1eHvvRqR1Ml6RhvCsdQ11P
v7BdUw5a2J3CCaWkUDEikHEX5iEtRKJteRA4HR1BuJ3jU1s5hMfbQsk04ig+tTKi
jjU4ZWtvFjFCn5HC4YP8F9MimzRLo1mk0glswka2V1wgQb4J/dEivk2WL+FXW7Qf
nztB93Pu/iIsQ4yp7fOc2V0W6Htqr6+WXLjXe6AeCheT7he1W6fkuYry/xyCBc0x
n0qVsefSl50HyerXTB61UAQpBZ/aQKpRar248iVtF8S0WN8wqWtcTH3nZ0/jbHBM
X0Iagx64qufwtnlBKLdE7DVeQIqXOA==
=nKP4
-----END PGP SIGNATURE-----

--uAN+J7NCwWvVXUv5--


