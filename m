Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3E52A69F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:32:27 +0200 (CEST)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzBS-0006jY-7v
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqz8y-0005MB-0V
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqz8v-0001lk-Bh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6XDmP9vcvZwiW1f/e/R1BmaS+dj295mjYd5cm7JkBeI=;
 b=RRZWmbg59hQCYePq0Don7KLnqz78YwO/o83BCl7k9pPZsM5cno1/rhIKbIMzHgg8TM02ZF
 LN0o/tFN5fTsP6JAS3iuUcRwOzfRwFYSCA0OmOus2/NsHfENv02qvORKCM9qu0fApWrsS+
 hnkuqBrtth2KZ37QRQYQBjRxLbIl9PE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-j_n0XS-LPQWN0xGtyupqdw-1; Tue, 17 May 2022 11:29:46 -0400
X-MC-Unique: j_n0XS-LPQWN0xGtyupqdw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 901AA8517E3;
 Tue, 17 May 2022 15:29:19 +0000 (UTC)
Received: from localhost (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ABED492C14;
 Tue, 17 May 2022 15:29:18 +0000 (UTC)
Date: Tue, 17 May 2022 16:29:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "alexis.lescout@nutanix.com" <alexis.lescout@nutanix.com>,
 Felipe Franciosi <felipe@nutanix.com>, "mst@redhat.com" <mst@redhat.com>
Subject: Re: Accelerating non-standard disk types
Message-ID: <YoO/TdP1ArazkpVX@stefanha-x1.localdomain>
References: <20220516173831.GB13284@raphael-debian-dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0EP4Fa3uk7cBNf+I"
Content-Disposition: inline
In-Reply-To: <20220516173831.GB13284@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0EP4Fa3uk7cBNf+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 05:38:31PM +0000, Raphael Norwitz wrote:
> Hey Stefan,
>=20
> We've been thinking about ways to accelerate other disk types such as
> SATA and IDE rather than translating to SCSI and using QEMU's iSCSI
> driver, with existing and more performant backends such as SPDK. We
> think there are some options worth exploring:
>=20
> [1] Keep using the SCSI translation in QEMU but back vDisks with a
> vhost-user-scsi or vhost-user-blk backend device.

If I understand correctly the idea is to have a QEMU Block Driver that
connects to SPDK using vhost-user-scsi/blk?

> [2] Implement SATA and IDE emulation with vfio-user (likely with an SPDK
> client?).

This is definitely the option with the lowest overhead. I'm not sure if
implementing SATA and IDE emulation in SPDK is worth the effort for
saving the last few cycles.

> [3] We've also been looking at your libblkio library. From your
> description in
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg06146.html it
> sounds like it may definitely play a role here, and possibly provide the
> nessesary abstractions to back I/O from these emulated disks to any
> backends we may want?

Kevin Wolf has contributed a vhost-user-blk driver for libblkio. This
lets you achieve #1 using QEMU's libblkio Block Driver. The guest still
sees IDE or SATA but instead of translating to iSCSI the I/O requests
are sent over vhost-user-blk.

I suggest joining the libblkio chat and we can discuss how to set this
up (the QEMU libblkio BlockDriver is not yet in qemu.git):
https://matrix.to/#/#libblkio:matrix.org

> We are planning to start a review of these options internally to survey
> tradeoffs, potential timelines and practicality for these approaches. We
> were also considering putting a submission together for KVM forum
> describing our findings. Would you see any value in that?

I think it's always interesting to see performance results. I wonder if
you have more cutting-edge optimizations or performance results you want
to share at KVM Forum because IDE and SATA are more legacy/niche
nowadays?

Stefan

--0EP4Fa3uk7cBNf+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKDv00ACgkQnKSrs4Gr
c8jMtAgAjxEN+pWz5Nd2o8t0jQzag+B8T0NX8z8fvI7M9dAeH+zQYxWU86mlt+C/
aU5VW27t4DlwEbucUJAnhzG17o6+iNYEGfrIhzK7tTB7vYq9utBnEhlH0P1uZ+Zz
oD474a+i2loh0KKhtXRIiljScNXfXXuNDB0hbPeFfP7dsupPj04JnaJLf8AQxLFI
GqXo82Bnca2OLgIxvv6wD3a86Eg4CSTCyrMegDCwnHDeJ6qKpbfhUwHXkfohJ0yW
aVOyPB6hBAg6/ObbRPLnydIH0bx0zZzusd2ZZ59xW2YqCGhqZexA+/tTjZLESOlS
umBRBfykBzFxFsbDRWVHBAi+OIaBPQ==
=faCb
-----END PGP SIGNATURE-----

--0EP4Fa3uk7cBNf+I--


