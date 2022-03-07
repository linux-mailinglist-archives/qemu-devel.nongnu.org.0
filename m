Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827604CFCAD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:24:21 +0100 (CET)
Received: from localhost ([::1]:37656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBTQ-0001vl-Ih
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAvO-0001jC-Nz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRAvL-0001cz-Kw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646650146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vc14EEvcqjzKo69qfPFIQ5INhau1lXS4c5sVCCddFFY=;
 b=cRWXbKcT7BrzXZ02xkgcqog/t8QnIsYZ1tU+q4JOMZ+8FOfAvPmvqhPv44HvFEmgGvmNN5
 omJV6LBqcJvH7jNLsQoXpTOoEKAP6WoFJiVgrBH+bOwQxaVyzEN8jlqn/j6eUMViY85CBC
 l5/rnBJ0PKunHykOK1GqasLVzxyWUzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-V1YtnQzHOzGPjN_gUDG0mQ-1; Mon, 07 Mar 2022 05:49:03 -0500
X-MC-Unique: V1YtnQzHOzGPjN_gUDG0mQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78611091DA0;
 Mon,  7 Mar 2022 10:49:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C6C73DAB;
 Mon,  7 Mar 2022 10:48:18 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:48:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 16/19] softmmu/vl: defer backend init
Message-ID: <YiXi8e+b5nn1FX0P@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <55fa22ea0e82b204ca3c5ee2fc4b9b3d2c1669f6.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aDmaYj4wq68uFeLz"
Content-Disposition: inline
In-Reply-To: <55fa22ea0e82b204ca3c5ee2fc4b9b3d2c1669f6.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aDmaYj4wq68uFeLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:49:03AM -0500, Jagannathan Raman wrote:
> Allow deferred initialization of backends. TYPE_REMOTE_MACHINE is
> agnostic to QEMU's RUN_STATE. It's state is driven by the QEMU client

s/It's/Its/

> via the vfio-user protocol. Whereas, the backends presently defer
> initialization if QEMU is in RUN_STATE_INMIGRATE. Since the remote
> machine can't use RUN_STATE*, this commit allows it to ask for deferred
> initialization of backend device. It is primarily targeted towards block
> devices in this commit, but it needed not be limited to that.

What is the purpose of this commit? I don't understand the description.

>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/sysemu/sysemu.h    |  4 ++++
>  block/block-backend.c      |  3 ++-
>  blockdev.c                 |  2 +-
>  softmmu/vl.c               | 17 +++++++++++++++++
>  stubs/defer-backend-init.c |  7 +++++++
>  MAINTAINERS                |  1 +
>  stubs/meson.build          |  1 +
>  7 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 stubs/defer-backend-init.c
>=20
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index b9421e03ff..3179eb1857 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -119,4 +119,8 @@ extern QemuOptsList qemu_net_opts;
>  extern QemuOptsList qemu_global_opts;
>  extern QemuOptsList qemu_semihosting_config_opts;
> =20
> +bool deferred_backend_init(void);
> +void set_deferred_backend_init(void);
> +void clear_deferred_backend_init(void);
> +
>  #endif
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 4ff6b4d785..e04f9b6469 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -20,6 +20,7 @@
>  #include "sysemu/blockdev.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/replay.h"
> +#include "sysemu/sysemu.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-block.h"
>  #include "qemu/id.h"
> @@ -935,7 +936,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState *de=
v)
>      /* While migration is still incoming, we don't need to apply the
>       * permissions of guest device BlockBackends. We might still have a =
block
>       * job or NBD server writing to the image for storage migration. */
> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> +    if (runstate_check(RUN_STATE_INMIGRATE) || deferred_backend_init()) {
>          blk->disable_perm =3D true;
>      }

Why is this necessary for vfio-user? Disk images shouldn't be in use by
another process so we don't need to bypass permissions temporarily.

> =20
> diff --git a/blockdev.c b/blockdev.c
> index 42e098b458..d495070679 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -569,7 +569,7 @@ static BlockBackend *blockdev_init(const char *file, =
QDict *bs_opts,
>          qdict_set_default_str(bs_opts, BDRV_OPT_AUTO_READ_ONLY, "on");
>          assert((bdrv_flags & BDRV_O_CACHE_MASK) =3D=3D 0);
> =20
> -        if (runstate_check(RUN_STATE_INMIGRATE)) {
> +        if (runstate_check(RUN_STATE_INMIGRATE) || deferred_backend_init=
()) {
>              bdrv_flags |=3D BDRV_O_INACTIVE;

Same here.

--aDmaYj4wq68uFeLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIl4vEACgkQnKSrs4Gr
c8ieVwf/cA2UH5fgYTomqS7QNaLNTyCre7ppF/zR0+cwooRwg5OeL1ptiv29Nw8p
PtEdPXHjx/+ZKyhU3yf/7KAUuvAltfcF+ALxyAhG7OZYuWANtzxwOMvrhQoHbbLV
Wtnqf4+K/3PQ6vPZ8uV8kBcK+Sd6GOQYwYCpMHGJ4ozQx2YJN2pAjLZOZLfi8TIp
GsA0fLGDKFYIGvNCULihA9p6SqX8LHPn+QfCN8eiaNEdko1gPXxpgeZtomHrF7n3
71JB9sBfUKIi+HAlYhnMoYqkWIecs+Q66kgXC22h/oZxQr1C3tzY82tZiQ0xd92Y
92qaTjsy2YF/5W9XP04czNWuKwK+AA==
=BcQY
-----END PGP SIGNATURE-----

--aDmaYj4wq68uFeLz--


