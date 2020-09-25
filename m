Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D968B2782FD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 10:40:26 +0200 (CEST)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLjHF-0001CW-NX
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 04:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLjFd-0000L2-Uj
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLjFc-0003f8-9q
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 04:38:45 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601023123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZdBGerJkKmDNnSc2y2XOKOizTZw5al7P7Lt5Vexst9A=;
 b=iZNLZ/T+NwkTRqGwnVuQtLTJC3STMMuuND77MWVAq7cIJrjd/Hu1D2RrnmZz3zXnUB5g80
 lB6ZhyJ0FAkrOyAM6iNc5WCIBhy0X8ZvLL8uoa0tIMvbYBU6kIrMo+3ehL/k/quoTUdd/X
 manqzdEOYcnC+nUIKot8ibHJ6gIO4tU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-WxVggd4mMn-SX4xNYPOelQ-1; Fri, 25 Sep 2020 04:38:38 -0400
X-MC-Unique: WxVggd4mMn-SX4xNYPOelQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E91041084CA0;
 Fri, 25 Sep 2020 08:38:36 +0000 (UTC)
Received: from localhost (ovpn-113-240.ams2.redhat.com [10.36.113.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 676E77882F;
 Fri, 25 Sep 2020 08:38:33 +0000 (UTC)
Date: Fri, 25 Sep 2020 09:38:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] docs: add 'io_uring' option to 'aio' param in
 qemu-options.hx
Message-ID: <20200925083832.GA33068@stefanha-x1.localdomain>
References: <20200924151511.131471-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924151511.131471-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 05:15:11PM +0200, Stefano Garzarella wrote:
> When we added io_uring AIO engine, we forgot to update qemu-options.hx,
> so qemu(1) man page and qemu help were outdated.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  qemu-options.hx | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9trIMACgkQnKSrs4Gr
c8gy8AgAmu7kaVbnU4518CDvADwVCOT1drRQlVNt+tvka/j/BW/GWpPF92haBB6N
ifQ2kU/Bo602DBv8N8kzCsYm49aS0WK29AoFK1tlYx+Z0ws1Y93JgMKmcT0mov80
BpJNSfiiCJwoKJfGWfAKYXScRF00F8Gg8AzLXUsbMkK1IGzEQrs2v2KnDKVaCpcZ
X36JReDE3mJ5FqxY03TEOLsiyzWbJw95hLbZb7UZgf8s4QDXvdJGmNyhbjpHp9cR
R0gJrqBngic1I49Emezd/sQhHjm957JM4kPz9cjkz1B/a/K6iFpkaJPrqIUOG3tI
eSBFViKOg44YlYYesCMNEg1Ibbs6Qw==
=9PP7
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--


