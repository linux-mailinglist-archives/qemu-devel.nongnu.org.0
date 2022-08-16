Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060AD596291
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:37:52 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1Rm-0006NU-6G
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1My-00037j-Ie
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oO1Mw-00033t-Qx
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 14:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660674769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=utzA42ByG8H02lr7pkApW6EDmHCPxYaygreeh5hV9ec=;
 b=EAp+Q5V8/hMvOQjQWAv1mKnzLG4rCQ8W0Y3YhT0JIK2VJi5oGPyKeKmwrdgS+44zTptmxQ
 F+bKDu+xC/k5oEvHEQtV0ShQ/FldF7s52H4/v6Sbf+whC3Xdm3QJkmoMEGuYDA/XfOY2i9
 v0pCfPNBE32dCa2LhkBFyZ/pdXBybS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-TdBM9wpUM8uSYBugU9Cf6w-1; Tue, 16 Aug 2022 14:32:46 -0400
X-MC-Unique: TdBM9wpUM8uSYBugU9Cf6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D48618A6522;
 Tue, 16 Aug 2022 18:32:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6471540D282E;
 Tue, 16 Aug 2022 18:32:45 +0000 (UTC)
Date: Tue, 16 Aug 2022 14:32:43 -0400
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
Subject: Re: [PATCH v10 06/21] job: move and update comments from blockjob.c
Message-ID: <Yvviy8aXStNx3aU3@fedora>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pw+7fKhQz1bOlOb3"
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--pw+7fKhQz1bOlOb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 03:38:40AM -0400, Emanuele Giuseppe Esposito wrote:
> This comment applies more on job, it was left in blockjob as in the past
> the whole job logic was implemented there.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> No functional change intended.
>=20
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 20 --------------------
>  job.c      | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 20 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--pw+7fKhQz1bOlOb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL74ssACgkQnKSrs4Gr
c8hzPAgAiXos5Utee6rmiWmQWQP1F7A78TREhfUt+nqN3rHbZ3Kq1fSmqD70IUqX
bLySAUq7F2+J3hgx8gXfvkv3OmyscNtInbruHUkP32weToU49JpU/fYF6m1AUezB
ojwPwwgKxeIe9QuOubiKyMBbSXzVboPlVyre6W3j4zlHN7KP95cmZl/7QJv9bnLj
+inbI4zWK3XcearTwlDhrX+IK0Sf1HdpCD1/FK7HKaOPZEzGfo3KcG80os8lC1Jz
Y1OMr4AVdeIuRJ7P+rIkV7p6JvMmS8K2aY3j2paMhLmPM7hBtV+Jxr1oAFnZ133e
41hv1Hq7e+zTu35DViJy0/kSuV0YVQ==
=RctN
-----END PGP SIGNATURE-----

--pw+7fKhQz1bOlOb3--


