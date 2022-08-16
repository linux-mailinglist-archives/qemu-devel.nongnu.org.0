Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900F596292
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:39:48 +0200 (CEST)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1Tf-00013j-2B
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1Ng-0003CB-J8
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1Nd-00037F-Do
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIDdYmBkMIZ61hTWJ5eOHB7zouc/ld6286LVcywc2N4=;
 b=EuSjlDBwr3XfTgWEiewGJafdX2j6eq4JrE7pD2oT/UBizUlEV1qsX6nxynTQGx4BClNZAY
 01V03eWiJgfRH21WrBhP58sy8go+9i3IAdN6xvo85hTuH+APxJ/kSLuHOgm2s4rK/AZ7M5
 VUuyea2zHgO99xRDe7zJV7lxfMPhTPk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-rcUZmStQOXugLnHAOXuDYg-1; Tue, 16 Aug 2022 14:33:24 -0400
X-MC-Unique: rcUZmStQOXugLnHAOXuDYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E91628032F1;
 Tue, 16 Aug 2022 18:33:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7AB40CF8EA;
 Tue, 16 Aug 2022 18:33:22 +0000 (UTC)
Date: Tue, 16 Aug 2022 14:33:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 07/21] blockjob: introduce block_job  _locked() APIs
Message-ID: <Yvvi8KDG7IFOnUI2@fedora>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HiSjDAxPaltV2umT"
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--HiSjDAxPaltV2umT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 03:38:41AM -0400, Emanuele Giuseppe Esposito wrote:
> Just as done with job.h, create _locked() functions in blockjob.h
>=20
> These functions will be later useful when caller has already taken
> the lock. All blockjob _locked functions call job _locked functions.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c               | 52 ++++++++++++++++++++++++++++++++--------
>  include/block/blockjob.h | 18 ++++++++++++++
>  2 files changed, 60 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--HiSjDAxPaltV2umT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL74vAACgkQnKSrs4Gr
c8hgzwf+OXzuhuAnapp+ezSsUc1m1Zb2zL2SYAVlZVwbKue9HozZV15RfuV4nNH8
nTtcxkMSLm3ehgyBhLOME9Zx32dWTQZ2Fl8LS+ZH4srJx2sUDf8u8qP9GQQ/sOO7
0YEuSGCFgDrfAZWTTTDGAsPcYb2aYFAu3bQdtEASbKz2jqolSyB+gOv3fqF1ZeEA
k2W++3u+rVkWTZ6eNQeIeeMMpd7qAx39LAZ16tKHyBpSBadE+CYiMWQ2UXa8Pvi0
JR4S0YnAaBSyZpLffh6ryBWDRD1O2E//4UhFJPT/ev6yBKuD+tP+Zc1uZgIlBjQP
kz+SgJfCOAFg3C5SlReuiYP//5zfog==
=qBpb
-----END PGP SIGNATURE-----

--HiSjDAxPaltV2umT--


