Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6B69E9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:14:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUatU-00041C-E1; Tue, 21 Feb 2023 17:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUatR-00040s-S1
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:13:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUatP-0004x9-R4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677017626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zOZ59IreoBgLHAWO+kRQ3aicufkMQTzk+y5/YnANy3Q=;
 b=IUxyX6umXfIaXJ+FiJNFQCY38ea5H7pXtp7uTSDYYG3EWMLUNi4Q3uv2mndp67kfbmgIAz
 AIrN4snt2Q8JZEo9VbyU80/HxiGO1BxUm7HBidogVm8e/nl8CBJxFRbBoZeH9v+OlZbCSj
 KxmWiHCA3ahODPWCcPfXW1t72R+zSCs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-zNb3SP2NNq-A0NakY2GfLQ-1; Tue, 21 Feb 2023 17:13:44 -0500
X-MC-Unique: zNb3SP2NNq-A0NakY2GfLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3774138123B4;
 Tue, 21 Feb 2023 22:13:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 915DE140EBF4;
 Tue, 21 Feb 2023 22:13:43 +0000 (UTC)
Date: Tue, 21 Feb 2023 17:13:41 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 00/23] block: Lock the graph, part 2 (BlockDriver
 callbacks)
Message-ID: <Y/VCFcYsqMmEF0zc@fedora>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TJiDDU05mPXrziSk"
Content-Disposition: inline
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--TJiDDU05mPXrziSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2023 at 04:21:39PM +0100, Kevin Wolf wrote:
> After introducing the graph lock in a previous series, this series
> actually starts making widespread use of it.
>=20
> Most of the BlockDriver callbacks access the children list in some way,
> so you need to hold the graph lock to call them. The patches in this
> series add the corresponding GRAPH_RDLOCK annotations and take the lock
> in places where it doesn't happen yet - all of the bdrv_*() co_wrappers
> are already covered, but in particular BlockBackend coroutine_fns still
> need it.
>=20
> There is no particularly good reason why exactly these patches and not
> others are included in the series. I couldn't find a self-contained part
> that could reasonable be addressed in a single series. So these just
> happen to be patches that are somewhat related (centered around the
> BlockDriver callback theme), are ready and their number looks
> manageable. You will still see some FIXMEs at the end of the series
> that will only be addressed in future patches.

Two things occurred to me:

1. The graph lock is becoming the new AioContext lock in the sense that
code using the block layer APIs needs to carefully acquire and release
the lock around operations. Why is it necessary to explicitly take the
rdlock in mirror_iteration()?

  + WITH_GRAPH_RDLOCK_GUARD() {
        ret =3D bdrv_block_status_above(source, NULL, offset,

I guess because bdrv_*() APIs are unlocked? The equivalent blk_*() API
would have taken the graph lock internally. Do we want to continue using
bdrv APIs even though it spreads graph locking concerns into block jobs?

2. This series touches block drivers like qcow2. Luckily block drivers
just need to annotate their BlockDriver functions to indicate they run
under the rdlock, a lock that the block driver itself doesn't mess with.
It makes me wonder whether there is any point in annotating the
BlockDriver function pointers? It would be simpler if the block drivers
were unaware of the graph lock.

Stefan

--TJiDDU05mPXrziSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP1QhUACgkQnKSrs4Gr
c8h/Xwf/S+TssS/17YIw3dC/R/eynpgqklQ/4aiS8lJMCnYMkxLXfwwc+FJ5JZdY
7/qU4NWWosM1g50FnG5ly05WDK0eF81sDGj4fFGsgMRUP3V+XrDVgCGL97JUj368
0MQ1NBbF+aXD+YB0yFiJPf7CFDsBVC2M1LJBVCQLuA6zpDNymcUPsY3Cp7pGh36n
5n51Zu/CFXSf/AtKeN6nQJOWif4x8kTa1SNwSqPSTXvUKyGWP9XJzv9Cgl5odK1U
8kiciN8G0xIVExps38mDjNmHY1ZJlnRAuYAEUB9DXJoGRKJ/eSf8Jlt0r8qeC31C
JclfJi63pNTE1zxvyJnQAbriwdutVw==
=fmbh
-----END PGP SIGNATURE-----

--TJiDDU05mPXrziSk--


