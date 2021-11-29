Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0D4616D2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:43:01 +0100 (CET)
Received: from localhost ([::1]:53510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgvs-0002sG-6F
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mrgmJ-0000nf-3U
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mrgmF-00006i-AD
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638192781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sPeaMRnRbINepFf2S891GJl+i3pczMlYmRODLBX6stg=;
 b=aKMur5wnd730vcflISUMhpQWVS2SyyyfIs5BmqiCdvBDRbOaWqbn+qCcM5+h1yZ29BkUOk
 PCfQUY71nHt+UvkO6YD/10OKWFo/kd9Xjzo9jR9xmrxa6X5tYkgN7B4wvOzGPQSJoesurc
 p/zbQThcEzN4k37n3Gd+pgYQZ8ArSAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-ZQee2XxVNJO_fumRPh9x-Q-1; Mon, 29 Nov 2021 08:32:57 -0500
X-MC-Unique: ZQee2XxVNJO_fumRPh9x-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9B41926DC6;
 Mon, 29 Nov 2021 13:32:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0890167843;
 Mon, 29 Nov 2021 13:32:40 +0000 (UTC)
Date: Mon, 29 Nov 2021 13:32:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v5 00/31] block layer: split block APIs in global state
 and I/O
Message-ID: <YaTWd2z4dua9Rtxu@stefanha-x1.localdomain>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XeDhrVAvBAjUwFas"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XeDhrVAvBAjUwFas
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 01:43:47AM -0500, Emanuele Giuseppe Esposito wrote:
> v5 -> v6:
> * In short, apply all Hanna's comments. More in details,
>   the following functions in the following headers have been moved:
>   block-backend:
>     blk_replace_bs (to gs)
>     blk_nb_sectors (to io)
>     blk_name (to io)
>     blk_set_perm (to io)
>     blk_get_perm (to io)
>     blk_drain (to io)
>     blk_abort_aio_request (to io)
>     blk_make_empty (to gs)
>     blk_invalidate_cache (was in io, but had GS assertion)
>     blk_aio_cancel (to gs)
>   block:
>     bdrv_replace_child_bs (to gs)
>     bdrv_get_device_name (to io)
>     bdrv_get_device_or_node_name (to io)
>     bdrv_drained_end_no_poll (to io)
>     bdrv_block_status (was in io, but had GS assertion)
>     bdrv_drain (to io)
>     bdrv_co_drain (to io)
>     bdrv_make_zero (was in GS, but did not have the assertion)
>     bdrv_save_vmstate (to io)
>     bdrv_load_vmstate (to io)
>     bdrv_aio_cancel_async (to io)
>   block_int:
>     bdrv_get_parent_name (to io)
>     bdrv_apply_subtree_drain (to io)
>     bdrv_unapply_subtree_drain (to io)
>     bdrv_co_copy_range_from (was in io, but had GS assertion)
>     bdrv_co_copy_range_to (was in io, but had GS assertion)
>     ->bdrv_save_vmstate (to io)
>     ->bdrv_load_vmstate (to io)
>=20
>   coding style (assertion after definitions):
>     bdrv_save_vmstate
>     bdrv_load_vmstate
>     block_job_next
>     block_job_get
>=20
>   new patches:
>     block.c: modify .attach and .detach callbacks of child_of_bds
>     introduce pre_run as JobDriver callback to handle
>       bdrv_co_amend usage of permission function
>     leave blk_set/get_perm as a TODO in fuse.c
>     make sure bdrv_co_invalidate_cache does not use permissions
>       if BQL is not held
>=20
>   minor changes:
>     put back TODO for include block/block.h in block-backend-common.h
>     rebase on kwolf/block branch
>     modify where are used assert_bdrv_graph_writable, due to rebase

These changes sound fine to me. Hanna or Kevin can merge the series when
they are happy.

Stefan

--XeDhrVAvBAjUwFas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGk1ncACgkQnKSrs4Gr
c8gy3ggAmFvjyHmMquG5dt07aeiRfbFNbZ1IcEzSM5E2fSt6ub/gLMT7RAqJD9dd
7wUldy08r5Bj3d50Jg+3X5FAQUHlOZILiy+cPo8lxr3l1RrDwH+UXhWd6zfQJY+l
pS6WDsf0e4wzY50KJWWP7n2B7jSflkN24RxK+ic3jbtHff/ZNnlKKdcINXYxV/iT
Sl+thW5NaRMEskU7JDRFiqg8ELEAp4U/oSWwYroblpwzsCciEIub8mSIUIEdMJtM
YQqTCtyN2l5uG/dQz7GI71lOnqyW0nIRiWEuUrHIxjSA2nCEcILIcLH2QZxkOlS2
L9RtMjQ2UInOUgqwqOMQIwLy2qXC4g==
=uqO8
-----END PGP SIGNATURE-----

--XeDhrVAvBAjUwFas--


