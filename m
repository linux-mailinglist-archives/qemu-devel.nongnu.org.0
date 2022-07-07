Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F5569D2A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:22:21 +0200 (CEST)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9MmD-0007RE-0N
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Mbu-0005QB-CE
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o9Mbr-0007XY-3A
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657181497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gN2Hy3rQlIizDYmCpeQV0ChmdB5kwqlqBObvsvQ70vs=;
 b=Fosu0HYXg6sq2PzyM8NCE6u7xWbk++FeWXnx+YQEEyLNgNS2iqJ6iCRrWXBTAB6tFhF6YK
 FoN446wljtevy2N/s1h7q11woyu5pgYFV+TCZl9EoQk/ATo1de4AwpN9Boy/d2PYtKMrlK
 ndBgG7gklU9HSfl52w8Xn8YEfYlaOHs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-hMPYa8IUOEuV2fe3Ry7plQ-1; Thu, 07 Jul 2022 04:11:33 -0400
X-MC-Unique: hMPYa8IUOEuV2fe3Ry7plQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F293C18812D6;
 Thu,  7 Jul 2022 08:11:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA7A2026D64;
 Thu,  7 Jul 2022 08:11:32 +0000 (UTC)
Date: Thu, 7 Jul 2022 09:11:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: Re: [PATCH] block/io_uring: clarify that short reads can happen
Message-ID: <YsaVM8AVucMg441D@stefanha-x1.localdomain>
References: <20220706080341.1206476-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TfIDMwWSZtwWYsx5"
Content-Disposition: inline
In-Reply-To: <20220706080341.1206476-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--TfIDMwWSZtwWYsx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 09:03:41AM +0100, Stefan Hajnoczi wrote:
> Jens Axboe has confirmed that short reads are rare but can happen:
> https://lore.kernel.org/io-uring/YsU%2FCGkl9ZXUI+Tj@stefanha-x1.localdoma=
in/T/#m729963dc577d709b709c191922e98ec79d7eef54
>=20
> The luring_resubmit_short_read() comment claimed they were only due to a
> specific io_uring bug that was fixed in Linux commit 9d93a3f5a0c
> ("io_uring: punt short reads to async context"), which is wrong.
> Dominique Martinet found that a btrfs bug also causes short reads. There
> may be more kernel code paths that result in short reads.
>=20
> Let's consider short reads fair game.
>=20
> Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>
> Based-on: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/io_uring.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--TfIDMwWSZtwWYsx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLGlTMACgkQnKSrs4Gr
c8hE7AgAjqDKgO6XZ+/ic683IfCbp5Z1HUC87A5geE2aDBlCWldjZK+mAwMojzaY
hilxP3+Y5iFLX3Oyjr7HHBMBCqLCnr31tsGueRgunrCVPLaXFAhCJyDWm9yM2zxw
KHrQUekIOJinuJqobruTkBxPVoWOM+/SwFit66eUil+HdJGDMS7LGt8Fj5d5or1K
cE1OLddehGFpQW+H/rfD3mmiirkPKgF0w5DTqD3CW9grz/GYTS8AO6mEH+NZVQgK
Yg8IZ7iTCqqCplazAXxeqp/tnUVWmO54AOTCPyLtsrD8iE3NG85VNbbkwVht7C9f
x7fcmPwaeX3NnPCikK2ooFDj1q2n9Q==
=ifpO
-----END PGP SIGNATURE-----

--TfIDMwWSZtwWYsx5--


