Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D63CFA26
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:10:10 +0200 (CEST)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pVh-0007UY-Hr
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5pS8-00019L-Kg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5pS6-0001aj-L4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626786386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QJtQ2wY+KsdZyfzCB05t3CKEud616K3EipKcXwi1QI=;
 b=SGD2YZx3krwCdFysTyDXGZoivN7GwO/a43IlDo3sGE0KqQX8FLzge++qCuXZYR+ecvGviR
 D1atResVnC7YSlPFgDySn8zoWJnVY8i9fk12S2qU9XPROsgmBPVuz3YlUtja5MeBSD9iro
 NkxOLYTxgEyDiR78DLgH5/wLr/Dy2Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-oFjjMc66PlqSqK8FvBtV5A-1; Tue, 20 Jul 2021 09:06:24 -0400
X-MC-Unique: oFjjMc66PlqSqK8FvBtV5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9AA871224
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:06:14 +0000 (UTC)
Received: from localhost (ovpn-114-103.ams2.redhat.com [10.36.114.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83BA07EE60;
 Tue, 20 Jul 2021 13:06:13 +0000 (UTC)
Date: Tue, 20 Jul 2021 14:06:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 0/3] vhost-user: warn when guest RAM is not shared
Message-ID: <YPbKRNATHl7lDOwY@stefanha-x1.localdomain>
References: <20210714092946.569516-1-stefanha@redhat.com>
 <YPa0WyuHUFdpcmJs@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPa0WyuHUFdpcmJs@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bfdh0QInDnlQt9BF"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bfdh0QInDnlQt9BF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 01:32:43PM +0200, Kevin Wolf wrote:
> Am 14.07.2021 um 11:29 hat Stefan Hajnoczi geschrieben:
> > v3:
> >  * Rebased
> > v2:
> >  * Clarify that object-memory-memfd enables share=3Don by default [Marc=
-Andr=E9]
> >  * Rebased
> >=20
> > vhost-user requires -object memory-backend-*,share=3Don option so that =
QEMU uses
> > mmap(MAP_SHARED) on guest RAM that is shared with the vhost-user device=
 backend
> > process. This is needed so the QEMU process sees changes made by the vh=
ost-user
> > device backend process, and vice versa.
> >=20
> > Today QEMU and the vhost-user device process will start up and then fai=
l with a
> > confusing error message if the user forgot to specify share=3Don.
> >=20
> > This patch series adds a warning letting the user know that share=3Don =
is
> > required.
>=20
> Hmm... This seems to work when I use shared=3Doff for the memory backend,
> even though the error message is easy to miss because more error
> messages follow:
>=20
>     $ LANG=3DC build/qemu-system-x86_64 -object memory-backend-memfd,id=
=3Dmem,size=3D1G,share=3Doff -m 1G -M memory-backend=3Dmem -chardev socket,=
path=3D/tmp/vhost.sock,id=3Dvhost1 -device vhost-user-blk-pci,chardev=3Dvho=
st1
>     qemu-system-x86_64: -device vhost-user-blk-pci,chardev=3Dvhost1: warn=
ing: Found vhost-user memory region without MAP_SHARED (did you forget -obj=
ect memory-*,share=3Don?)
>     qemu-system-x86_64: Unexpected end-of-file before all data were read
>     qemu-system-x86_64: Failed to set msg fds.
>     qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temp=
orarily unavailable (11)
>=20
> However, if I don't create the memory backend at all (which is probably
> the most common error users will make), then the new message isn't
> printed:
>=20
>     $ LANG=3DC build/qemu-system-x86_64 -m 1G -chardev socket,path=3D/tmp=
/vhost.sock,id=3Dvhost1 -device vhost-user-blk-pci,chardev=3Dvhost1
>     qemu-system-x86_64: Unexpected end-of-file before all data were read
>     qemu-system-x86_64: Failed to set msg fds.
>     qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temp=
orarily unavailable (11)
>=20
> Wouldn't we want a warning for the second case, too?

Yes. I think so. I'll investigate.

Stefan

--bfdh0QInDnlQt9BF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD2ykQACgkQnKSrs4Gr
c8gM/ggAn+CHcnNJzG7VyPFi1xWsfl8Did1pyp48QmgNHPFZXtuF8GlL44FDEWOK
2+kk/2VsyK2eyaC1phSPfH3zTOBH5lh1KJl54+rp0/ZyoSIz4iIhyNymkUtmSEhJ
P+67Laqx3Hp4qpOKLBb9saorzEiyj1AlHoDeWI9maArOuif+wm2bA4MAUJdAu66p
UD+oHisSr6U82/tfzY6/afw28Q89US+yxS1GGHnvPvehS1rupCam27iiyMWyY/jL
1++v1C4YpCp93hmBjKFPC1q3EhuvnlBespFi48btT2z4V1K9EZ+rqJMF0jVWnAa4
FDb+PkrbiriR5qrfDch9CfqiFRcimQ==
=nB7d
-----END PGP SIGNATURE-----

--bfdh0QInDnlQt9BF--


