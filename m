Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0136B142
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:09:21 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1layB6-00089Z-4q
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lay8V-0006jo-Rp
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lay8P-0003Hq-Jj
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619431590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5vBPUn4+NcTY+nRGQYwne10ffGMSvtixzhkUYS2nN4=;
 b=EdNxmCG5m305KtzhZ20RSGRqRkYKUojZ8dVphJyRWHVK8kAytIJu6s80PLWnIe7sgTZk/p
 yBmzSDV5KPb9biIcM4m4ZZ9jDSfJFzSGaxFeJtC+Zr9Wt3aRbvxzVcimk2k02GbI70+QUU
 hC2sPOrhJEuDRxiLUkqoc8Ajzxk9pwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-rJRHPhhwM5yK3aJY8xBZyA-1; Mon, 26 Apr 2021 06:06:27 -0400
X-MC-Unique: rJRHPhhwM5yK3aJY8xBZyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF5E343A6;
 Mon, 26 Apr 2021 10:06:26 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0783B59454;
 Mon, 26 Apr 2021 10:06:25 +0000 (UTC)
Date: Mon, 26 Apr 2021 11:06:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/2] iotests/qsd-jobs: Use common.qemu for the QSD
Message-ID: <YIaQoODlhn1elwor@stefanha-x1.localdomain>
References: <20210401132815.139575-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401132815.139575-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ySHpDZRzFKQJulIn"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ySHpDZRzFKQJulIn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 03:28:13PM +0200, Max Reitz wrote:
> (Alternative to: =E2=80=9Ciotests/qsd-jobs: Filter events in the first te=
st=E2=80=9D)
>=20
> Hi,
>=20
> The qsd-jobs test has kind of unreliable output, because sometimes the
> job is ready before =E2=80=98quit=E2=80=99, and sometimes it is not.  Thi=
s series
> presents one approach to fix that, which is to extend common.qemu to
> allow running the storage daemon instead of qemu, and then to use that
> in qsd-jobs to wait for the BLOCK_JOB_READY event before issuing the
> =E2=80=98quit=E2=80=99 command.
>=20
> I took patch 1 from my =E2=80=9Cqcow2: Improve refcount structure rebuild=
ing=E2=80=9D
> series.
> (https://lists.nongnu.org/archive/html/qemu-block/2021-03/msg00654.html)
>=20
> As noted above, this series is an alternative to =E2=80=9Ciotests/qsd-job=
s:
> Filter events in the first test=E2=80=9D.  I like this series here better
> because I=E2=80=99d prefer it if tests that do QMP actually check the out=
put so
> they control what=E2=80=99s really happening.
> On the other hand, this may be too complicated for 6.0, and we might
> want to fix qsd-jobs in 6.0.
>=20
>=20
> Max Reitz (2):
>   iotests/common.qemu: Allow using the QSD
>   iotests/qsd-jobs: Use common.qemu for the QSD
>=20
>  tests/qemu-iotests/common.qemu        | 53 +++++++++++++++++++++-----
>  tests/qemu-iotests/tests/qsd-jobs     | 55 ++++++++++++++++++++-------
>  tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++-
>  3 files changed, 92 insertions(+), 26 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--ySHpDZRzFKQJulIn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCGkKAACgkQnKSrs4Gr
c8iaQAgAn7sgjOGWlFH0UfjibsXrLdNvgHr4pPIG+2E8/1PGObttAB7wKkkINcC7
Jy+oX4Q2PVm4/WOKDjmffqTyQF5G7CTeKmE5e4u6raWht/WErMxUdapIuFucF0Zn
gVm088e6SL8v5YdCkwxQnt16SAvOLmj5gqzSk0SUut10zNFcH8KGhwQi/HFYs6tI
oAMdtDSMGsdOnQMOTMYgTxp1gGOARVe5hgqngsIdYBMkirFjRx8T7Y5bUaVaeiJm
gKQ6mQuORHqZ5Z9bgqOTTvxtzV5kkCFstYA27X03Ej2mrxRTHXQlDVuIe+8BxhN3
qoaW2o5G1ExAv7R0WBmgcSPB6BkyyQ==
=clWc
-----END PGP SIGNATURE-----

--ySHpDZRzFKQJulIn--


