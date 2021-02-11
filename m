Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DC318D86
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:40:12 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAD8d-0007p9-Hk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACzE-00005Q-Mt
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lACzC-00053b-IF
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ACRjcqMmbCkoVsPVoR+DDVWCY2OGC8Iun/yn+xG6/0=;
 b=Ni29ZyeTUS/ljjhla3XJh4r6ELGF1rdYK1BaWiqHIXD+I+uxPd2B0UlxH5G/sW0miCOUx+
 2Z6j9oZLc7qOLO+MsDtjI7nDUR7kKVmtFwZYkZzPc3HBwRk2Oz41DIpWPT2ALG9+x/YIng
 Sms0cxgo+kgGZBX21HtR50Y6/vuQiNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393--ll2Qa-JPbyj9wOgMt9rGw-1; Thu, 11 Feb 2021 09:30:20 -0500
X-MC-Unique: -ll2Qa-JPbyj9wOgMt9rGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D69380132A
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:29:59 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC9D68878;
 Thu, 11 Feb 2021 14:29:49 +0000 (UTC)
Date: Thu, 11 Feb 2021 14:29:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 18/24] DAX/unmap virtiofsd: Parse unmappable elements
Message-ID: <20210211142948.GS247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-19-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-19-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Sa0i77dkqaUxqYg"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1Sa0i77dkqaUxqYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:18PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> For some read/writes the virtio queue elements are unmappable by
> the daemon; these are cases where the data is to be read/written
> from non-RAM.  In viritofs's case this is typically a direct read/write
> into an mmap'd DAX file also on virtiofs (possibly on another instance).
>=20
> When we receive a virtio queue element, check that we have enough
> mappable data to handle the headers.  Make a note of the number of
> unmappable 'in' entries (ie. for read data back to the VMM),
> and flag the fuse_bufvec for 'out' entries with a new flag
> FUSE_BUF_PHYS_ADDR.

Looking back at this I think vhost-user will need generic
READ_MEMORY/WRITE_MEMORY commands. It's okay for virtio-fs to have its
own IO command (although not strictly necessary).

With generic READ_MEMORY/WRITE_MEMORY libvhost-user and other vhost-user
device backend implementations can handle vring descriptors that point
into the DAX window. This can be done transparently so individual device
implementations (net, blk, etc) don't even know when memory is copied vs
zero-copy shared memory access.

So this approach is okay for virtio-fs but it's not a long-term solution
for all of vhost-user. Eventually the long-term solution may be needed
so that other VIRTIO devices that have shared memory resources work.

Another bonus of READ_MEMORY/WRITE_MEMORY is that users that prefer an
enforcing vIOMMU can disable shared memory (maybe just keep the vring
itself mmapped).

I just wanted to share this idea but don't expect it to be addressed in
this patch series.

> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.=
h
> index a090040bb2..ed9280de91 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -611,6 +611,13 @@ enum fuse_buf_flags {
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

With a vIOMMU it's an IOVA. Without a vIOMMU it's a GPA. This constant
may need to be renamed in the future, but it is okay for now.

> +    if (req->bad_in_num || req->bad_out_num) {
> +        bool handled_unmappable =3D false;
> +
> +        if (out_num > 2 && out_num_readable >=3D 2 && !req->bad_in_num &=
&
> +            out_sg[0].iov_len =3D=3D sizeof(struct fuse_in_header) &&
> +            ((struct fuse_in_header *)fbuf.mem)->opcode =3D=3D FUSE_WRIT=
E &&
> +            out_sg[1].iov_len =3D=3D sizeof(struct fuse_write_in)) {

This violates the VIRTIO specification:

  2.6.4.1 Device Requirements: Message Framing

  The device MUST NOT make assumptions about the particular arrangement of =
descriptors.

  https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html=
#x1-280004

The driver is not obligated to submit separate iovecs. out_num =3D=3D 1 is
valid and the device needs to process it byte-wise instead of making
assumptions about iovec layout.

--1Sa0i77dkqaUxqYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlP1wACgkQnKSrs4Gr
c8j1aQgAj9HufYj+T2enSz9lW0BvzHSNOlqoJvgDEts87ezGkaA6eid5y6zf/W1V
HxqUw+kBcd4D09UIIRJtK8FB0kdvKpO+EOzy//wy4dUEGg7lGuTmz5o8WciGnz0d
q+wOSBQScgaReGKRP1hcGHPGomruiRYP+u0jl17u6CO5rualPuKwVfvtisEKJasc
gtqB4gWGFJw55/fKzRSINzfoQAlTmoexbUe0OWO2OOs1sr4AVNIXOHVtQNPIKwAc
lRrOQPpSNmoTWb48eXGlJmtui5plKAwsDgVk9BsWrwoAUzLLZOE9HJZiTWPv6a70
XXZRGEoLu6KjgIIg5OWRPg3+ksqu0g==
=tWZ2
-----END PGP SIGNATURE-----

--1Sa0i77dkqaUxqYg--


