Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A384730EA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:52:13 +0100 (CET)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwncb-0008NT-4G
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSc-0003f3-U8
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnSW-00021a-P7
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639410108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0avldvn3//og0bxWcAdFMhHnnF/IGSmdrALzaCMg2wg=;
 b=Kmx7Ce8WuRpjjY2gGUnq6l71evClBRjHYKQWivMWBWiQGvXxCyG2fimUDYpyaUYoAwFKj4
 BI/DgtAD+g42brmHBHTSkD2ukic9+LDFvsRRgHbPWC4o7Sxc14AYwMu0kZXl2wb8KHc6XQ
 guIIunnx4b7KYH89lM1WrZ30ndWbMkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-olBcFWgzN3muyPwuRNfIng-1; Mon, 13 Dec 2021 10:41:44 -0500
X-MC-Unique: olBcFWgzN3muyPwuRNfIng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD217108087A;
 Mon, 13 Dec 2021 15:41:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 645B013AB3;
 Mon, 13 Dec 2021 15:41:43 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:41:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 4/4] include/sysemu/blockdev.h: remove
 drive_get_max_devs
Message-ID: <YbdptnLTn8XSd5HY@stefanha-x1.localdomain>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PqkWgp2waZxqfnYU"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PqkWgp2waZxqfnYU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:46:33AM -0500, Emanuele Giuseppe Esposito wrote:
> Remove drive_get_max_devs, as it is not used by anyone.
>=20
> Last use was removed in commit 8f2d75e81d5
> ("hw: Drop superfluous special checks for orphaned -drive").
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  blockdev.c                | 17 -----------------
>  include/sysemu/blockdev.h |  1 -
>  2 files changed, 18 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PqkWgp2waZxqfnYU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3abYACgkQnKSrs4Gr
c8jgZwf9GEZ1zk7G7eveqrx37nw8/Sq3LWhFlU+2ttS+Iwa/kxLW4BwQ+HTxncGc
7244wmbHqVBjR+lOxWYPLascvchcmqDJRha2NZwiq3y38dt61Ay+GmVYgvQ6nS59
Ha7/uuXwjfMOqiIZxsvQbdvaLmm+BqP5/BDkwoxYulOvpV0SzBIXynh4ZLpNAlIg
l0C2geUw0SOH2/WaBgnNaOVH3NilRgPUFGtnOxJTqBUULkhY/uMDrM1eNZ43ddu+
D2fLeX10Od9XE6l+m6bWDSMAn6J+mydufOfI9WAhQXUZqfPHadRccOZpJF9ykpZV
yUZbxnT+q4bGBqcKAfsBCCeFiE44Bg==
=XnHy
-----END PGP SIGNATURE-----

--PqkWgp2waZxqfnYU--


