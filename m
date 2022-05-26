Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86568534C62
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:17:00 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9c3-0005tx-6F
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9DR-000266-IB
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9DP-0005LW-03
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hcHBelPwMpoLF5u8j+K6Oqk5uwOni5qvtfOo1fQwOmk=;
 b=f8HDArxFgyfuWamXUGTOq0kQmFRzcHONwVqGffp0OjJk1p18zyrTGdkRd4j7Xj4n6khTU5
 ILl65KAsLsYgmld0DAznBDH+tz50aHE+wCjXrSJh5zB8W0R8LSecZkya5vtDGa3wgWvxLs
 S2AeUd1VAzCv7PvJol6oI2fAp9+2yUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-a3nVEQaaMvqMChKLiZC3YQ-1; Thu, 26 May 2022 04:51:12 -0400
X-MC-Unique: a3nVEQaaMvqMChKLiZC3YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34BCB858EFE;
 Thu, 26 May 2022 08:51:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD8331410DD5;
 Thu, 26 May 2022 08:51:11 +0000 (UTC)
Date: Thu, 26 May 2022 09:51:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 05/10] block: Make bdrv_co_pwrite() take a const buffer
Message-ID: <Yo8/fljw/I2p8A2z@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-6-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="76Ugpp8h313uenpB"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-6-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--76Ugpp8h313uenpB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:35PM +0100, Alberto Faria wrote:
> It does not mutate the buffer.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/block_int-io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--76Ugpp8h313uenpB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPP34ACgkQnKSrs4Gr
c8gYLAf/fkVP7hu0h2lrCnAWnlDPY+VYbeEYliUbP9qWAD1asBtVtlyGkgn1uNpY
b1YM85PrVuoTwOmS4g0duFPzc3JsjxN9Sqbka+IdzHnFf9OVptqar5+Ervk7HJdB
i4XeqD6FQZpQZVLeziNQR1XYqySB84O5d6G5VQ/6Xw2d7JjqGKBLP2PX5fVJpFa0
sNn3qap39sXd5m3+bXinDTnZPOANG2ga7X2oQKY+LYdGW9bjyr8dXwdkoF4Wr+/T
xQmCu6qGZVhbeM4sk0zcPfN3wZTbvRMpEalfWdE77enIuEPsfPvl7ISisH9L6fkY
ufec/an/otXKiltufCdaVd93gNCgNA==
=s6AN
-----END PGP SIGNATURE-----

--76Ugpp8h313uenpB--


