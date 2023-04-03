Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B06D4EAA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:13:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNjF-0003oc-1w; Mon, 03 Apr 2023 13:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNjD-0003oU-So
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNjC-0001KQ-Gr
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680541941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FCroJZMj2+KJnzwa8mp42JmAWCfBtyqEuUdJf+cBiOA=;
 b=PyOzNWF8zZCduqBw0TQJcrw3imsl7aZaCy/1bm2SsKTtyeQX0/B3+9/s1RYrWnDP64pJ/p
 /xsEb10T91NQGPFsNAnRgEQQFjJ+pYn75+gH3c6utRCVAhVlNmKszY+eAWPr901Ni6KxEO
 g4nOtA4Z8tNJ5BjrvGnkjGT8wWZb7GY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-uhlwnBZmO-uLem_5remY7Q-1; Mon, 03 Apr 2023 13:12:18 -0400
X-MC-Unique: uhlwnBZmO-uLem_5remY7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51E03C0C896;
 Mon,  3 Apr 2023 17:12:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD14202701E;
 Mon,  3 Apr 2023 17:12:17 +0000 (UTC)
Date: Mon, 3 Apr 2023 13:12:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, hare@suse.de,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v7 3/4] qemu-iotests: test zone append operation
Message-ID: <20230403171215.GD318024@fedora>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
 <20230323051907.5948-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VuWcG2jYXiIM8Zu1"
Content-Disposition: inline
In-Reply-To: <20230323051907.5948-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--VuWcG2jYXiIM8Zu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:19:06PM +0800, Sam Li wrote:
> The patch tests zone append writes by reporting the zone wp after
> the completion of the call. "zap -p" option can print the sector
> offset value after completion, which should be the start sector
> where the append write begins.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  qemu-io-cmds.c                     | 75 ++++++++++++++++++++++++++++++
>  tests/qemu-iotests/tests/zoned     | 16 +++++++
>  tests/qemu-iotests/tests/zoned.out | 16 +++++++
>  3 files changed, 107 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--VuWcG2jYXiIM8Zu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQrCO8ACgkQnKSrs4Gr
c8h3OggAin0eR374pRt34H1Qkj0BA64nd515TeVler1mLvAYeyVe0+5OauKPQ42t
NwyDmb2Mn82bRrcz9pyWgTAxIpQWkwbFanWu+2KNh3RYW2FqTchC54GrqOMgtnbt
LaNf1nLkrulEhdNvz5lVbpcDKgz6R4qHCj5na+eYlr0xgjQimReJ5CFXw44rTsP2
WT+CbfmMRMZsLzr5uELHCiLvl9KIa8yAaM7z2qc/DFRTpQ61Jr5inVIpyDvn3iMx
a44icZmP5jVvQDy2l/MrshgcxQFJu559/kxBhQEtQX/mEA4GJvkz0p0xNOZJo3yZ
/3gcOq6LzaThkmVJiMwWJEmRZ8+oUQ==
=1krt
-----END PGP SIGNATURE-----

--VuWcG2jYXiIM8Zu1--


