Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E031884A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:36:32 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Ko-0001VT-Ht
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9Gl-0005lD-Lb
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA9Gk-0005Pf-22
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613039537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ea3XXAmEIGyeDOQihtaYgfUfU9vKQK/eJ1lMgMwyFyA=;
 b=Ay8l61lJ/NrPl05HskGRgoQc2M+PKoXf2vanZLxWoCG40wDVvkTcJsA5d15jDEwHFavs88
 MQ7vf4fkDymDir1jY97Cpw92uej1jhtgwh1fV5K+xuStP1vJ0cZ+V3KAA/9JSdAuo0KWuB
 2DN7/PE1K+scjWMS5ZCuyMm7Md0x3Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-IDujiZwsM3W4fCO-QX9B-g-1; Thu, 11 Feb 2021 05:32:14 -0500
X-MC-Unique: IDujiZwsM3W4fCO-QX9B-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80E0107ACC7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:32:13 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 770E360BF1;
 Thu, 11 Feb 2021 10:32:04 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:32:03 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave commands for
 mapping
Message-ID: <20210211103203.GH247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-8-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FUaywKC54iCcLzqT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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

--FUaywKC54iCcLzqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:07PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index d6085f7045..1deedd3407 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1432,6 +1432,26 @@ Slave message types
> =20
>    The state.num field is currently reserved and must be set to 0.
> =20
> +``VHOST_USER_SLAVE_FS_MAP``
> +  :id: 6
> +  :equivalent ioctl: N/A
> +  :slave payload: fd + n * (offset + address + len)

I'm not sure I understand this notation. '+' means field concatenation?
Is 'fd' a field or does it indicate file descriptor passing?

I suggest using a struct name instead of informal notation so that the
payload size and representation is clear.

The same applies for VHOST_USER_SLAVE_FS_UNMAP.

> +  :master payload: N/A
> +
> +  Requests that the QEMU mmap the given fd into the virtio-fs cache;

s/QEMU mmap the given fd/given fd be mmapped/

Please avoid mentioning QEMU specifically. Any VMM should be able to
implement this spec.

The same applies for VHOST_USER_SLAVE_FS_UNMAP.

> +  multiple chunks can be mapped in one command.
> +  A reply is generated indicating whether mapping succeeded.
> +
> +``VHOST_USER_SLAVE_FS_UNMAP``
> +  :id: 7
> +  :equivalent ioctl: N/A
> +  :slave payload: n * (address + len)
> +  :master payload: N/A
> +
> +  Requests that the QEMU un-mmap the given range in the virtio-fs cache;
> +  multiple chunks can be unmapped in one command.
> +  A reply is generated indicating whether unmapping succeeded.

--FUaywKC54iCcLzqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlB6MACgkQnKSrs4Gr
c8jcowf9HLRW3wAQ6DWqqDUQI5gIbsSaQpT2V3uW5lE7BmR/l/AstkBdWbl+QNrF
vuRLB/7cqST/vpzdtcJkaLt9AU6p4uN6U0lfa9qAtkdtD3sSDlCxqMYxdpUPznvs
clWkKB7XPn/a0gRh8cOZp6UQ0mlJtaOCs/RWHV+X/YFFwGxmrFSH5ymjWGIZOFzI
o9PjInIInB2gCCciadHoHEpGxlQtJkCTpDnt3/6cFs4Kp3UTCh8AhKIfqh0x/oh8
uqXEgfbJbfrcXMBDdOIopzX5QMMaiphPXipENKnYmn12hhP25uJTlc48ghnE2EZJ
i95UpNCqyZoEPrDN4pyJctSg7mnW4Q==
=DNUJ
-----END PGP SIGNATURE-----

--FUaywKC54iCcLzqT--


