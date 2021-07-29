Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FBC3DA901
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:28:13 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98tI-0000zD-Dd
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98pj-0003Fb-3M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98ph-0004in-FV
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627575868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QcBjCwZdG17kohjZPn09/GFbJD3T9VSixnJ1EwdFck=;
 b=Xqoel4hSH16m1hdabhHPVJ3puQSfpkOIZQ4w/1sDMNHEXENZhounv2WGS3pYgvftwx6RF9
 mZGVIRY8P67s7wZWygLLHscgURpbcJgI4DC/tZpLOBumnJuWj17wJYgo24qTp/MC6Bkovc
 OPXbatj8KD6OdM6rr9uyNrwXaD3kzcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-CtW5r1vFNaCemSW-fNYnhg-1; Thu, 29 Jul 2021 12:18:01 -0400
X-MC-Unique: CtW5r1vFNaCemSW-fNYnhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153998799E0;
 Thu, 29 Jul 2021 16:18:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE9D5D9CA;
 Thu, 29 Jul 2021 16:17:59 +0000 (UTC)
Date: Thu, 29 Jul 2021 17:17:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Added myself as a reviewer for the NVMe
 Block Driver
Message-ID: <YQLUtpH/heQKE40P@stefanha-x1.localdomain>
References: <20210728183340.2018313-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210728183340.2018313-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YojsBFjNdRinKOzm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YojsBFjNdRinKOzm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 08:33:40PM +0200, Philippe Mathieu-Daud=E9 wrote:
> I'm interested in following the activity around the NVMe bdrv.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--YojsBFjNdRinKOzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEC1LUACgkQnKSrs4Gr
c8jNbQgAtsyoFRXKgeqNlrP1U7lofRqGa1AxkiC6AyF+W+rAQQp3fz3YqhcG+/s5
JzCacqM6xUd1MgHmAB6lZ43P9ckR6rP3Vchq28bLuP+x+JnRx1u7fLjIKGS86kV/
rwOMt4wLdm639t2eb0GrMJ+s1AYx0IKZbn8RqqODk5v2ddlTCu9FeA5oA0cqG5Lu
3lvPX3C2P3egn+qYkKFreK/tHsG2QgWEhjBM3TjoUkrbAW4wlyWyntEzVf/3zfdr
6Z3BKuaiC+tScaAu2nZ5qxUnsYk4foMfZx8ugnMb3gTXs1bkqOHK/RmiDnuty2H1
fPCRgTr1vige79/ZQ8uxRoV3I2YLaw==
=pnpp
-----END PGP SIGNATURE-----

--YojsBFjNdRinKOzm--


