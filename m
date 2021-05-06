Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DB3756C7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:26:29 +0200 (CEST)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leftT-0004vj-UG
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefrB-0003XI-5Y
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefr4-0001lA-L5
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620314637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVp0Q84DjgWxiGfNBt+vRk37Eb6b9OXt1qXJF0ZrBr8=;
 b=Y/iqHhWg2X3FSKdXAKIQX3H5hrIU/2cx9nuXfz7Ox8BHsHn2BsQCkBkv/vqUJwCIcS9naW
 kfYzSl8NTyyNKRPAX2/VGysxZZ5eGq54Y/WKLvAbFBcj+p8FhSwAE9PdW6qRnUc3F8WhKO
 4k+Ac+uInFNMh+ZGoe25OdwFZdW037k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-ovjT1i3fNoKEqizaasPQ-w-1; Thu, 06 May 2021 11:23:55 -0400
X-MC-Unique: ovjT1i3fNoKEqizaasPQ-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68C74801817;
 Thu,  6 May 2021 15:23:54 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C205259445;
 Thu,  6 May 2021 15:23:50 +0000 (UTC)
Date: Thu, 6 May 2021 16:23:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 20/26] DAX/unmap virtiofsd: Parse unmappable elements
Message-ID: <YJQKBfZ+++VUiSOO@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-21-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-21-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SfUsIEziOxlywjTS"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SfUsIEziOxlywjTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:54PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> For some read/writes the virtio queue elements are unmappable by
> the daemon; these are cases where the data is to be read/written
> from non-RAM.  In viritofs's case this is typically a direct read/write

s/viritofs/virtiofs/

> into an mmap'd DAX file also on virtiofs (possibly on another instance).
>=20
> When we receive a virtio queue element, check that we have enough
> mappable data to handle the headers.  Make a note of the number of
> unmappable 'in' entries (ie. for read data back to the VMM),
> and flag the fuse_bufvec for 'out' entries with a new flag
> FUSE_BUF_PHYS_ADDR.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> with fix by:
> Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
> ---
>  tools/virtiofsd/buffer.c      |   4 +-
>  tools/virtiofsd/fuse_common.h |   7 ++
>  tools/virtiofsd/fuse_virtio.c | 230 ++++++++++++++++++++++++----------
>  3 files changed, 173 insertions(+), 68 deletions(-)
>=20
> diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
> index 874f01c488..1a050aa441 100644
> --- a/tools/virtiofsd/buffer.c
> +++ b/tools/virtiofsd/buffer.c
> @@ -77,6 +77,7 @@ static ssize_t fuse_buf_write(const struct fuse_buf *ds=
t, size_t dst_off,
>      ssize_t res =3D 0;
>      size_t copied =3D 0;
> =20
> +    assert(!(src->flags & FUSE_BUF_PHYS_ADDR));
>      while (len) {
>          if (dst->flags & FUSE_BUF_FD_SEEK) {
>              res =3D pwrite(dst->fd, (char *)src->mem + src_off, len,
> @@ -272,7 +273,8 @@ ssize_t fuse_buf_copy(struct fuse_bufvec *dstv, struc=
t fuse_bufvec *srcv)
>       * process
>       */
>      for (i =3D 0; i < srcv->count; i++) {
> -        if (srcv->buf[i].flags & FUSE_BUF_IS_FD) {
> +        if ((srcv->buf[i].flags & FUSE_BUF_PHYS_ADDR) ||
> +            (srcv->buf[i].flags & FUSE_BUF_IS_FD)) {
>              break;
>          }
>      }
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.=
h
> index fa9671872e..af43cf19f9 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -626,6 +626,13 @@ enum fuse_buf_flags {
>       * detected.
>       */
>      FUSE_BUF_FD_RETRY =3D (1 << 3),
> +
> +    /**
> +     * The addresses in the iovec represent guest physical addresses
> +     * that can't be mapped by the daemon process.
> +     * IO must be bounced back to the VMM to do it.
> +     */
> +    FUSE_BUF_PHYS_ADDR =3D (1 << 4),

Based on the previous patch this is not a gpa, it's an IOVA. Depending
on the virtiofs device's DMA address space in QEMU this might be the
same as guest physical addresses but there could also be vIOMMU
translation (see the address_space_translate() call in the patch that
implemented the IO slave command).

Maybe virtiofs + vIOMMU has never been tested though... I'm not sure it
works today.

If you want to leave it as is, feel free:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SfUsIEziOxlywjTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUCgUACgkQnKSrs4Gr
c8gopQf9FePNm/dJ1GO0qQXtMdCwu+SZJiZADUPQwFwtZLk/0vApmzMKFAWcotRd
LZXdnZdRIQrZV1nkxm7y9p7nBbWVzc7dpKQpXPUOx8sk0AgXNH0za3/OPcI83dg7
4KprndifdQMm0FO/h9eCKjvfBy7NPcKMKsxzpbKDkxz2TMqwOZdRs2Vg/TfIq80T
TaL4mr0NM8tgPLm8i06xW76/4472VHNF/WXJMF8/ucvvo5nNhrCJZxkBOR+wKD+Q
JUQI98ZRnpxPw89bqKHxYawyFZgzUODR+yNMkUd+ugDhCwDCx0XGSh0itYRKmQZg
6HRP7WFwLyIq2apUar9PvJCpf9/Ejg==
=arOf
-----END PGP SIGNATURE-----

--SfUsIEziOxlywjTS--


