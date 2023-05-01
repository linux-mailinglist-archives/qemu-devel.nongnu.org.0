Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D46F32CF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:25:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVOC-0004yX-Ok; Mon, 01 May 2023 11:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVO7-0004vc-58
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVO5-0004Cz-NS
 for qemu-devel@nongnu.org; Mon, 01 May 2023 11:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682954665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=erVHmAEh5RlylLOLRR1gut7f83CqQjZHDp3DS/UT6ew=;
 b=Rpuh9D2+rjF6hf3xFOPhUpVD8y7NzbYBxZBPstvUMGWXz8dPyyA6kpxCyFLbKoY4dSVb94
 ubbcwbeDi7hkqkT0Znwj31vH4l9cU9Xq+pNS0MPr4wmzUd2akdydU2YqW0reljkQJlV+np
 JUKdfQWXSZTvUlgE2c/UDzT5IFtIJvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-E-zu_lEXNmOdFeXIMAml_Q-1; Mon, 01 May 2023 11:24:02 -0400
X-MC-Unique: E-zu_lEXNmOdFeXIMAml_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54FC3815F99;
 Mon,  1 May 2023 15:23:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42CBF63F42;
 Mon,  1 May 2023 15:23:54 +0000 (UTC)
Date: Mon, 1 May 2023 11:23:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 03/20] block: bdrv/blk_co_unref() for calls in coroutine
 context
Message-ID: <20230501152353.GE14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-4-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="shIsXxqJ8oAt7QZG"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--shIsXxqJ8oAt7QZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:41PM +0200, Kevin Wolf wrote:
> These functions must not be called in coroutine context, because they
> need write access to the graph.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h          |  3 ++-
>  include/sysemu/block-backend-global-state.h |  5 ++++-
>  block.c                                     |  2 +-
>  block/crypto.c                              |  6 +++---
>  block/parallels.c                           |  6 +++---
>  block/qcow.c                                |  6 +++---
>  block/qcow2.c                               | 14 +++++++-------
>  block/qed.c                                 |  6 +++---
>  block/vdi.c                                 |  6 +++---
>  block/vhdx.c                                |  6 +++---
>  block/vmdk.c                                | 18 +++++++++---------
>  block/vpc.c                                 |  6 +++---
>  12 files changed, 44 insertions(+), 40 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--shIsXxqJ8oAt7QZG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP2YkACgkQnKSrs4Gr
c8ikqgf9G5QdWaTZI8VtgGLmn0ZhY8Am53gEGYjrZLLQUBDgLgTqkH2CgXWVrjXw
8QYThy9suHvZBH0S0QLAhO6aRdBacRNJaayE1sroPi2OpIVh6R51HyKT8gpaagKz
8YMZoyrrEsb0gc9xDdSrxlNPK9IyrjLr3HhbePiR06vyThnZKSISmcuK2yqbXWp4
A3ljaZCFEVn3/gGO5XorlEG93DdYaQ7KMRlXC0iLLEjPglxdn5n88EzjDC1cbAyA
Lsmnxu9JVRmknElnfaCCGJHUIfC9bpQhKJrmgPhcz107217MJ8JxW8oNgYKvHXA1
LIwWv1qKGk+TRa/OvCd8LwR0dWwWfQ==
=qPiz
-----END PGP SIGNATURE-----

--shIsXxqJ8oAt7QZG--


