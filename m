Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07933374331
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:58:49 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKrI-0002sk-3c
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leKct-0008Pw-27
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leKcp-0003GT-7V
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620233029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7UExGjilXhh5Pb/0SlPLIpqNdx/1IdxpwfuRmFw7/Jw=;
 b=TzAa8dZhfib40WtdoT7xs12uRuPd4VV/ru4VSMyJIB2Np/G2IMc1BmAZXvAwxHbFoQV0FK
 exItcH50ybX2a6qEDFpNoBvIVeDucqw77CI6944+GP7dznmLIg9YhHwTuy1t4TTC8PQaUx
 TBx3mYJ5czl8+75goEFRmTDk8IFS8xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-MDq1QBCvO1ioa-FaBfL2BA-1; Wed, 05 May 2021 12:43:47 -0400
X-MC-Unique: MDq1QBCvO1ioa-FaBfL2BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A456D5F4;
 Wed,  5 May 2021 16:43:03 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A42D460C17;
 Wed,  5 May 2021 16:43:02 +0000 (UTC)
Date: Wed, 5 May 2021 17:43:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 10/26] DAX: virtio-fs: Fill in slave commands for
 mapping
Message-ID: <YJLLFXehKyXayNIq@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-11-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-11-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F3c50sBpJ9aMwZoo"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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

--F3c50sBpJ9aMwZoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:44PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Fill in definitions for map, unmap and sync commands.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> with fix by misono.tomohiro@fujitsu.com
> ---
>  hw/virtio/vhost-user-fs.c | 117 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 113 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--F3c50sBpJ9aMwZoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSyxUACgkQnKSrs4Gr
c8gi+gf+IFLEzO1ZQG4Lj1PEn2BLl6lilZMGbZ7VsxvHKCTTk69kZ/SNhagzdQli
sSXknu5qjGZ0aH4IvpGLRiRQQXR81Fecb6yYHhOZTPpxBd48wlnlIXmKk/jAdjNY
4WFPeS2qXLhMpkgu2LWWWm41cD1TQkCWtE7e7kQLCEYoI9ZLwLxJSZAkmQHx7wek
tGLj0EP83qzDtEe/BXuIMLdcvrLwSg8Ylnp3yoAIseBq2pQBSlhrykjnDcWk7Vkg
Y+AIpalYsbpiEKr9pqUoLvU+UXka1GoSF2s8BYKrvRAvmisWQ8vDLF49+kLRJCO9
Wqv2FLEvjh3dARKqvk+toLFlLy7e0g==
=fbHz
-----END PGP SIGNATURE-----

--F3c50sBpJ9aMwZoo--


