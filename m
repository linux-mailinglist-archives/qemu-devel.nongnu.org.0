Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE66F32C3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:22:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVLV-0003Kc-Aa; Mon, 01 May 2023 11:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVLU-0003KU-4H
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVLS-0003mI-QS
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682954501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vNmtrjwFugBccB5PceAZuECl4zRsGcAzb5H85lugfwY=;
 b=T8+rL4cpiK9DMQ4lxUgXxW7/l7Cy4W3fM5hhELQf+K0KJUZ4PaF/cJ06SSh8GLE5GSO2fk
 UKk5I2MxCKiVWjAuftrXerpksgQ5OBJA/ujDz/RvKAWQOwwXhBSqVaRIVNTNZQvDsWJF6V
 hcOvkXkHztXdIV6Zpgu/xjgFnT1/Irk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-uPhKPD68PJusoksIejWDBQ-1; Mon, 01 May 2023 11:21:35 -0400
X-MC-Unique: uPhKPD68PJusoksIejWDBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C00941C08975;
 Mon,  1 May 2023 15:21:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 262FB112132E;
 Mon,  1 May 2023 15:21:28 +0000 (UTC)
Date: Mon, 1 May 2023 11:21:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 02/20] block: Consistently call bdrv_activate() outside
 coroutine
Message-ID: <20230501152127.GD14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-3-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JeNwY+Fn/9god7Iv"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-3-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--JeNwY+Fn/9god7Iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:40PM +0200, Kevin Wolf wrote:
> Migration code can call bdrv_activate() in coroutine context, whereas
> other callers call it outside of coroutines. As it calls other code that
> is not supposed to run in coroutines, standardise on running outside of
> coroutines.
>=20
> This adds a no_co_wrapper to switch to the main loop before calling
> bdrv_activate().
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h |  6 +++++-
>  block/block-backend.c              | 10 +++++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JeNwY+Fn/9god7Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP2PcACgkQnKSrs4Gr
c8gBDAgAjwXk/wCNfkBkg6igvuK16iD7YckOFKVvLQt7VF4GChHCbnPQ6EnRjWw+
zuvmxXzs7Vs23EDAX3nedIqBJUPXb+/I+oZyPXmGm1cxZg++uoz68JDsJcsi6sW8
7k4OI4dnPwSUEwox/gns//CCZnbdtfaFYMKroXMwa48m1bRydRMEXvsUJyRp7VJR
qb7aW2/lo/6SeV+wFxTaauSsEPXMyCoBqxarmUIakwflw0c1dIXKc3kwotohWn9V
hl+6rgFk+293g+hnzkYA0GYwIZIIiYDrZXBjibk6ClxlrGlpPtgG7g7s7rWZv+AV
EZzc3AcSY2NsIpV8WZ2eDMLxFXo0yQ==
=yqIn
-----END PGP SIGNATURE-----

--JeNwY+Fn/9god7Iv--


