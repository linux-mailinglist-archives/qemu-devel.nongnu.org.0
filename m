Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F83D8F67
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:46:41 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jtQ-0004Cw-0e
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8jsV-0003RZ-69
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m8jsP-0004Kc-QP
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627479935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jw8nopuQCeb9r9DMdpUSGBP6FbZCY8/YUTAMFXeyGbI=;
 b=KABXf47JEpOr0/4DcNuPBhcGFd3mBed6Kr7sibZe1qZIN/dvWsBYhnz5Albge9ui7xVGvW
 qK9oFHqecox3InVsMJL/1FnjIariEMo2xBSD9Cpeur/oBuEvTlIjAUlY2GXk3G47ndfsNW
 E2va34Wc/6gmsQCuTFy2kdwaJUCCWI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Hj3_wcTxM7ybvkqjBRQsFg-1; Wed, 28 Jul 2021 09:45:34 -0400
X-MC-Unique: Hj3_wcTxM7ybvkqjBRQsFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA2587D556;
 Wed, 28 Jul 2021 13:45:32 +0000 (UTC)
Received: from localhost (ovpn-113-160.ams2.redhat.com [10.36.113.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757C75D6A1;
 Wed, 28 Jul 2021 13:45:26 +0000 (UTC)
Date: Wed, 28 Jul 2021 14:45:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add Stefano Garzarella as io_uring reviewer
Message-ID: <YQFfdRNhVd80re8i@stefanha-x1.localdomain>
References: <20210728131515.131045-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210728131515.131045-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mxxB7ZiX9enfsEJQ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mxxB7ZiX9enfsEJQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 03:15:15PM +0200, Stefano Garzarella wrote:
> I've been working with io_uring for a while so I'd like to help
> with reviews.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--mxxB7ZiX9enfsEJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEBX3UACgkQnKSrs4Gr
c8jvtQgAut6CuWttiVzTI5aZWglFbUOGMWczvLZ/w/DEP6XqhyrkwQQWIH5Ov5S9
lIvmS03ehr4r+846320xSdT2ST/XxlhSV7C6enYaWXyPP/85E+8uGM2hno8P6Ilv
rhnYkh9ZTpBA+rKBILBziyQomvJ1dVqow6iu0+s0j5+pxAXDFLxJZp8CQ1RuziXp
LLiEWITr58ku4mBZcjMILrKxfREuZjSNQ3lBbQkPtK9Eawdyyod63KU3kUyf3OU/
I8rWmW0LAWgDtc0c8TsMhSipmuAePwzoPe2nmH/nmnxscM9Z9ZoKT44veXyXNinr
ByvDHG5Rg3zgkbs203zqBFzasq871A==
=HySo
-----END PGP SIGNATURE-----

--mxxB7ZiX9enfsEJQ--


