Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A43757D3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:46:38 +0200 (CEST)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legCz-0002qx-SJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leg4g-00067p-4t
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leg4X-0008Ka-BK
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuITwmuYXnyYs9RWJOpC5nRmFEr6HVUlITG5r7+4z2c=;
 b=Pak8yAEVx1RREu44zPkenAIj5Z2HlgxaIbqv3R5ob4GQspnWvYQBXBh5dRWgvn0yGNl+Bz
 R6DD7hyX/3nNFX6SMK27mCHbbniBJv56sMfh+ygqfJaa000Rdm+ts2WOZ99YusaScmgIYg
 avRFrgJTqAZYhXwJ0J+O0DdkhzVjN8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-oDU_M98XMa654shsfMxbpQ-1; Thu, 06 May 2021 11:37:49 -0400
X-MC-Unique: oDU_M98XMa654shsfMxbpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8DD6D26B;
 Thu,  6 May 2021 15:37:48 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3FF160C25;
 Thu,  6 May 2021 15:37:44 +0000 (UTC)
Date: Thu, 6 May 2021 16:37:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 00/26] virtiofs dax patches
Message-ID: <YJQNR2aTvyE5pWqk@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lqhZRkdxYdMqldv1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

--lqhZRkdxYdMqldv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:34PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
>   This series adds support for acceleration of virtiofs via DAX
> mapping, using features added in the 5.11 Linux kernel.
>=20
>   DAX originally existed in the kernel for mapping real storage
> devices directly into memory, so that reads/writes turn into
> reads/writes directly mapped into the storage device.
>=20
>   virtiofs's DAX support is similar; a PCI BAR is exposed on the
> virtiofs device corresponding to a DAX 'cache' of a user defined size.
> The guest daemon then requests files to be mapped into that cache;
> when that happens the virtiofsd sends filedescriptors and commands back
> to the QEMU that mmap's those files directly into the memory slot
> exposed to kvm.  The guest can then directly read/write to the files
> exposed by virtiofs by reading/writing into the BAR.
>=20
>   A typical invocation would be:
>      -device vhost-user-fs-pci,queue-size=3D1024,chardev=3Dchar0,tag=3Dmy=
fs,cache-size=3D4G
>=20
> and then the guest must mount with -o dax
>=20
>   Note that the cache doesn't really take VM up on the host, because
> everything placed there is just an mmap of a file, so you can afford
> to use quite a large cache size.
>=20
>   Unlike a real DAX device, the cache is a finite size that's
> potentially smaller than the underlying filesystem (especially when
> mapping granuality is taken into account).  Mapping, unmapping and
> remapping must take place to juggle files into the cache if it's too
> small.  Some workloads benefit more than others.
>=20
> Gotchas:
>   a) If something else on the host truncates an mmap'd file,
> kvm gets rather upset;  for this reason it's advised that DAX is
> currently only suitable for use on non-shared filesystems.
>=20
> (This series, with a couple of other patches, is at:
> https://gitlab.com/virtio-fs/qemu/-/tree/dgilbert-dax-2021-04-28 )

Overall this looks close but I don't think the FSETID support should be
added to QEMU. Please see my comment on the final patch.

Stefan

--lqhZRkdxYdMqldv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUDUcACgkQnKSrs4Gr
c8j9jwf+JxfBvM1p05OJ2XVmZKvl3iREksfk277QH1LHCLzurox+5YovRH9TAQ+F
ZJNQH23RrTYnJIGX2bxU5eG+xeOVY3LCn42gGg/uQPGTiqdK+fGm6CNwAHKGAogE
42pBqdOO9xxDCQxf3XbH1Uf5RHgGpj/M7kN9pnvna47WuKvTZypORRNCqYQyg0PA
Tzkrs636SFu6bpj0Sp+EWOBv3a94eEnFsHMmYqjxkkeprppK6V7oQ7eYRlXhpqJx
RvTQpfUCKtqmZGYNIxpxUqj6fZ0docDCxERkAEC0CJ9zcZsy2/FFvlDQA3x22Kby
6yiwtkPhSlXkKgq30szKNZjrJBx8KQ==
=aKdo
-----END PGP SIGNATURE-----

--lqhZRkdxYdMqldv1--


