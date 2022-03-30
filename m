Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521774EC313
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:25:10 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXNt-0008Jd-09
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:25:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZXLm-0007Bj-Hx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZXLi-0007ZR-TW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648642973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8GbdruU6aNL1lMuk0yTNsJpvbwd7EXoR3xgIIgDgyXg=;
 b=AF0oMp17Zd2sOppL0k1tEzJhGj/+ehvF7KBaqwqo29oTMRJnwM/VxBoe567u0r5AJ1FQNN
 akbydHz7D93lBSWe0J3qFvxwb5F9Qo5AOA9NKTQjyB3Q85YgAu9VlJZKZ1M121D0b0Km1p
 eYysTYuNBpzVvO7/4ldVwtwUOn8Ovmk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626--FMTJi6QPDa6DTuyA56WDA-1; Wed, 30 Mar 2022 08:22:51 -0400
X-MC-Unique: -FMTJi6QPDa6DTuyA56WDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 481441C00B91;
 Wed, 30 Mar 2022 12:22:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72DB1121314;
 Wed, 30 Mar 2022 12:22:48 +0000 (UTC)
Date: Wed, 30 Mar 2022 13:22:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v3 0/3] util/thread-pool: Expose minimun and maximum size
Message-ID: <YkRLl35Mq9cOoPbb@stefanha-x1.localdomain>
References: <20220316135321.142850-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jfE3WUoRNyBUrnrV"
Content-Disposition: inline
In-Reply-To: <20220316135321.142850-1-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jfE3WUoRNyBUrnrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 02:53:20PM +0100, Nicolas Saenz Julienne wrote:
> As discussed on the previous RFC[1] the thread-pool's dynamic thread
> management doesn't play well with real-time and latency sensitive
> systems. This series introduces a set of controls that'll permit
> achieving more deterministic behaviours, for example by fixing the
> pool's size.
>=20
> We first introduce a new common interface to event loop configuration by
> moving iothread's already available properties into an abstract class
> called 'EventLooopBackend' and have both 'IOThread' and the newly
> created 'MainLoop' inherit the properties from that class.
>=20
> With this new configuration interface in place it's relatively simple to
> introduce new options to fix the even loop's thread pool sizes. The
> resulting QAPI looks like this:
>=20
>     -object main-loop,id=3Dmain-loop,thread-pool-min=3D1,thread-pool-max=
=3D1
>=20
> Note that all patches are bisect friendly and pass all the tests.
>=20
> [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.=
656711-1-nsaenzju@redhat.com/
>=20
> ---
> Changes since v2:
>  - Get rid of wrong locking/waiting
>  - Fix qapi versioning
>  - Better commit messages
>=20
> Changes since v1:
>  - Address all Stefan's comments
>  - Introduce new fix
>=20
> Nicolas Saenz Julienne (3):
>   Introduce event-loop-base abstract class
>   util/main-loop: Introduce the main loop into QOM
>   util/event-loop-base: Introduce options to set the thread pool size
>=20
>  event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
>  include/block/aio.h              |  10 +++
>  include/block/thread-pool.h      |   3 +
>  include/qemu/main-loop.h         |  10 +++
>  include/sysemu/event-loop-base.h |  41 +++++++++
>  include/sysemu/iothread.h        |   6 +-
>  iothread.c                       |  68 +++++----------
>  meson.build                      |  26 +++---
>  qapi/qom.json                    |  34 +++++++-
>  util/aio-posix.c                 |   1 +
>  util/async.c                     |  20 +++++
>  util/main-loop.c                 |  65 ++++++++++++++
>  util/thread-pool.c               |  55 +++++++++++-
>  13 files changed, 414 insertions(+), 65 deletions(-)
>  create mode 100644 event-loop-base.c
>  create mode 100644 include/sysemu/event-loop-base.h
>=20
> --=20
> 2.35.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jfE3WUoRNyBUrnrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJES5cACgkQnKSrs4Gr
c8gU9gf8Dju4+bRh8B72j34TvDWJxOyU+TxkmNgsv/lJVi3NW8LQyJSr3BfVdE9C
X+cQFTwHzgkNy1bUhXVunaI1QlxP0pE5GL9OjJGjLPZ5cId7Y6GMv37DybO6gWx1
tMRKgdqiGA56eBSthiwYk1gqXgS467BEmYT2OjzI+x9H7R7innzntpjqqbVdQsC3
r70BoOhWCAkzcOinFrW1U7nzlZu0mpdfMvB4J5nKGEaQ5+B7cE8I0w8UQCr8VRWi
7uecr9hPLsrun1MR/YmNftluINKz0Mr3FGEQNBY4+spQJqtti90OJGYwxgjyX7kp
G2Q6h8Ffmb8p8yIss8AyZ+pRkE5DEA==
=7ez7
-----END PGP SIGNATURE-----

--jfE3WUoRNyBUrnrV--


