Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2F2EC1BA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:07:51 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCHl-0002US-As
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kxCCT-0006Ah-CH
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kxCCP-0005Sn-0U
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609952533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ehrLtNBTNRbeo/Y70jedK8fZnXOpc2+Da3hK5em4AC4=;
 b=BEeKwjKIuThmHkgQ1m71q5fpYEiQ2dHdmC3OopfRpml5oYtEcQcb1Sg1/iF3ZK5fFWsVi3
 +byJHqAd6nWC7hS6je+1H/0ja1KgqCvtzQ6we21NEYiamga05icNxgCGs8rXuMlqHaq3rt
 +TM2b4Ha/TNEgnAaTxa+M9buERkd14s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-qqizzyyzNxCGqwJRVGUQww-1; Wed, 06 Jan 2021 12:02:11 -0500
X-MC-Unique: qqizzyyzNxCGqwJRVGUQww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D54190A7A1;
 Wed,  6 Jan 2021 17:02:10 +0000 (UTC)
Received: from localhost (ovpn-113-208.ams2.redhat.com [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694641002393;
 Wed,  6 Jan 2021 17:02:06 +0000 (UTC)
Date: Wed, 6 Jan 2021 17:02:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2] Docs/RCU: Correct sample code of qatomic_rcu_set
Message-ID: <20210106170205.GA133350@stefanha-x1.localdomain>
References: <20210106071710.15836-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210106071710.15836-1-zhukeqian1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 03:17:10PM +0800, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
>=20
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Cc: qemu-trivial@nongnu.org
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>=20
> v2:
>  - Add Cc and R-b.
>=20
> ---
>  docs/devel/rcu.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/17Q0ACgkQnKSrs4Gr
c8gZpgf/YNO4iFwAYjwd3y/gTXwdffsM/jadr2ElZQmD8kpXrxKzBjtCq7+zsDsU
f0GmHKjd6WCJNg/0Fli7gExWwWcF6Yazol1pCK3XcilbEBSDyCgrWKsB0sOdHJMs
3zEBi6BQDE5uC61Vk7a2yezGZYl3w1NJ3D1Qn5JvlWx0yOWPt3pkz3MDNCP9GO0a
A3diaDB355bcRfq0BiSKL5XjmTU/NdA7qHWIOHYdPgad5Vd7jLL2qbLfqysca1E6
StDse/NvG6/eIf0NupZX5qIkbpSFZUZ1yCM/ty7WJNv0V5Fhysyip+7agRGSd+C/
5uWnnSR0kUSKZEcXVDDIBDrX5GNIkg==
=i5Xn
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--


