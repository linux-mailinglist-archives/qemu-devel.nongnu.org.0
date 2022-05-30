Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13995537AF9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:06:41 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvf6V-0005Cb-2o
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvf15-0002zA-Ou
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvf0w-0006BU-5m
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653915653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L20ULNgvdWKSFPU9Yy8+iOOVivpXBkkhQVNRZDNPlN4=;
 b=iicU/XylSF134zHKum/v0FvsLtJI5T4End1HM2MDDoZ/CzZYqIbG9fzAzDmBHR3aiLcDF2
 mzGOWunP4dBUwiBvx7aE9qSWEjqx+MBYYvkyG3FovJ4mJCsVkUQr7ErF1qYvxdwsfAjIbw
 6daCTQYEnwZRGVlcFsoo3Bf9q9wKQZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-XeEqwiy4O7u-1pKkWXpNCw-1; Mon, 30 May 2022 09:00:49 -0400
X-MC-Unique: XeEqwiy4O7u-1pKkWXpNCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FFAB3C02B64;
 Mon, 30 May 2022 13:00:49 +0000 (UTC)
Received: from localhost (unknown [10.39.195.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14D5282886;
 Mon, 30 May 2022 13:00:48 +0000 (UTC)
Date: Mon, 30 May 2022 14:00:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eblake@redhat.com,
 den@openvz.org, kwolf@redhat.com, jsnow@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, den-plotnikov@yandex-team.ru
Subject: Re: [PATCH] MAINTAINERS: update Vladimir's address and repositories
Message-ID: <YpS//1dW83cOtCHZ@stefanha-x1.localdomain>
References: <20220526115432.138384-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FpLzTcNMchqnIfO+"
Content-Disposition: inline
In-Reply-To: <20220526115432.138384-1-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


--FpLzTcNMchqnIfO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 02:54:32PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>=20
> Hi all!
>=20
> Finally, I'm at Yandex, so that's my new address. I don't think .mailmap
> or contrib/gitdm/aliases really need to be updated.
>=20
> I send this patch now, but let me send one-two series from new address
> before merging this, to be sure that everything work properly with new
> email.
>=20
>  MAINTAINERS | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--FpLzTcNMchqnIfO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKUv/8ACgkQnKSrs4Gr
c8hZXgf/ZKriNQr/QMV0crjCWS4qnJIMV8k49mxpRawz2aoqHnfmTuwBgXw79YcQ
gN2JwQcxbQ4NJze1f33nbsy8Kk1GOtl9AFMtiDGBG9yI/gvWSfilhjkiSN1qvqs0
p8XoA1eBgdzJIUr9jKxauwTlTnYvg+kfoQTN42zCxlxG84upENjXBuowg4b1zb5N
5vcTrnVTuahZr5zgkiT8Kb16XKAP5XTPgloKx1m/4vPzBW49wFCn5yzr9ptYNyBW
0YSOpIwAZl1VTLlO5ttCRnBKKJIXVq1zZQ4K00XclmR7Ogg6RuswKd0OrULPOFBW
cxRS+tLRV4GZBYbVmq35FeFH7p1kdg==
=a074
-----END PGP SIGNATURE-----

--FpLzTcNMchqnIfO+--


