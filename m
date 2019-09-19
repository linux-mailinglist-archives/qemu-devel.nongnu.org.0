Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBBEB7730
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 12:12:35 +0200 (CEST)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAtQQ-0001s9-FM
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 06:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iAtKP-0003yv-Ds
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iAtKO-0007tK-DG
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:06:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iAtKO-0007t8-7b
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:06:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 75EF4308FB9D;
 Thu, 19 Sep 2019 10:06:19 +0000 (UTC)
Received: from localhost (unknown [10.36.118.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA7495C1D4;
 Thu, 19 Sep 2019 10:06:16 +0000 (UTC)
Date: Thu, 19 Sep 2019 11:06:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Message-ID: <20190919100615.GG3606@stefanha-x1.localdomain>
References: <20190918231846.22538-1-alxndr@bu.edu>
 <20190918231846.22538-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tvOENZuN7d6HfOWU"
Content-Disposition: inline
In-Reply-To: <20190918231846.22538-4-alxndr@bu.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 19 Sep 2019 10:06:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 03/22] fuzz: Add FUZZ_TARGET module type
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tvOENZuN7d6HfOWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 11:19:30PM +0000, Oleinik, Alexander wrote:
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  include/qemu/module.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tvOENZuN7d6HfOWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2DUxcACgkQnKSrs4Gr
c8g9uggAuQxlUIrr6v81TcHohFtK2Zf8fJ5HLuw8ez9YxO0pRF+ajNwC7IHcIuPo
rdrogX5kad5tL6SCUTSq6nPFFg5R2O8nfLDSNy93Th/7xcW981qO+fai+gNbsAaX
X4u09eBQTSh3zETd52Q6VU5YytfvNGO8qg6wmLTDsGJIkxRsWMFJtmVdY+qiLZyd
ekSMTaRV2Y03wTeKubB6ptGh7E/AjLGBEPjSZe5flOy7aOKZKOgl4q9wRd4rxeZM
HcgIeNn67B9O3+mcqYJxphXTFIUPmeoqNJFPs71Tl2UrfZ1F33URjBU/Pm7hCs3P
gI+0APzRc3jSoeG8LqgCSNTBixLygQ==
=Qhy8
-----END PGP SIGNATURE-----

--tvOENZuN7d6HfOWU--

