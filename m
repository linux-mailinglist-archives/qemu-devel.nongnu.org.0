Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B120953A5A2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:07:06 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwO41-0007wJ-7z
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nwO0x-0005c6-UX
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nwO0t-0004LT-MA
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654088629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y/U1TqwWjUZZpMkYGl174s6E8YK7kTd1QwGlpS8EPvk=;
 b=JRqIoNdsAyXGcZz7Od0dORvVkPE+agcWtd5Gu0qKIDpYLE4G9GAzYiuxfhaDldTw9WZz+G
 ndXGJPRgq6RHxfnNYN0f3yYMOKVwPsrUDRTaTR2P1JiY6J+4Kc81Y0CFY2HYBtQz/XPwqZ
 SwRcWtTvU9ktp/n54pMnv/pBdkrGFvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-_apAzWA6P06YpUcKSOFcPw-1; Wed, 01 Jun 2022 09:03:46 -0400
X-MC-Unique: _apAzWA6P06YpUcKSOFcPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD827185A7BA;
 Wed,  1 Jun 2022 13:03:45 +0000 (UTC)
Received: from localhost (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3F2492C3B;
 Wed,  1 Jun 2022 13:03:45 +0000 (UTC)
Date: Wed, 1 Jun 2022 14:03:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] vduse-blk: Add name option
Message-ID: <Ypdjr4UO+XrBbM09@stefanha-x1.localdomain>
References: <20220531095221.114-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4+45848vnO8JD9A9"
Content-Disposition: inline
In-Reply-To: <20220531095221.114-1-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--4+45848vnO8JD9A9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 05:52:21PM +0800, Xie Yongji wrote:
> Currently we use 'id' option as the name of VDUSE device.
> It's a bit confusing since we use one value for two different
> purposes: the ID to identfy the export within QEMU (must be
> distinct from any other exports in the same QEMU process, but
> can overlap with names used by other processes), and the VDUSE
> name to uniquely identify it on the host (must be distinct from
> other VDUSE devices on the same host, but can overlap with other
> export types like NBD in the same process). To make it clear,
> this patch adds a separate 'name ' option to specify the VDUSE
> name for the vduse-blk export instead.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/export/vduse-blk.c             | 9 ++++++---
>  docs/tools/qemu-storage-daemon.rst   | 5 +++--
>  qapi/block-export.json               | 7 ++++---
>  storage-daemon/qemu-storage-daemon.c | 8 ++++----
>  4 files changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> index 3b10349173..d96993bdf5 100644
> --- a/block/export/vduse-blk.c
> +++ b/block/export/vduse-blk.c
> @@ -245,7 +245,7 @@ static int vduse_blk_exp_create(BlockExport *exp, Blo=
ckExportOptions *opts,
>      }
>      vblk_exp->num_queues =3D num_queues;
>      vblk_exp->handler.blk =3D exp->blk;
> -    vblk_exp->handler.serial =3D exp->id;
> +    vblk_exp->handler.serial =3D g_strdup(vblk_opts->name);

Do we want to expose the VDUSE device name to the guest? Maybe the
serial string should be a separate parameter.

>      vblk_exp->handler.logical_block_size =3D logical_block_size;
>      vblk_exp->handler.writable =3D opts->writable;
> =20
> @@ -279,22 +279,24 @@ static int vduse_blk_exp_create(BlockExport *exp, B=
lockExportOptions *opts,
>          features |=3D 1ULL << VIRTIO_BLK_F_RO;
>      }
> =20
> -    vblk_exp->dev =3D vduse_dev_create(exp->id, VIRTIO_ID_BLOCK, 0,
> +    vblk_exp->dev =3D vduse_dev_create(vblk_opts->name, VIRTIO_ID_BLOCK,=
 0,
>                                       features, num_queues,
>                                       sizeof(struct virtio_blk_config),
>                                       (char *)&config, &vduse_blk_ops,
>                                       vblk_exp);
>      if (!vblk_exp->dev) {
>          error_setg(errp, "failed to create vduse device");
> +        g_free((void *)vblk_exp->handler.serial);

serial isn't const char * anymore, it's char *. Please update the struct
field and then these casts won't be necessary anymore.

--4+45848vnO8JD9A9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKXY68ACgkQnKSrs4Gr
c8hx/wf+MLdyhOb1C+wfuj1jeawjDd0JY5EaDoxhnXOxe5/vQrhfjJ7ZcAgQwTTX
lXqspz26ZdcRk1cqMlz9/G29187ZZPXII3dkNsC3wmzc9BsMobJb6ORdB5y16UAs
5YKq6RzVCpOYX2VW9tYR3RwLtdnknlWy8TRl3bNyAVj6vH54VGcpbgjWwgcc4Pbu
IbFqiAMtRcojCprd/JcglxnZHqNg9hKg9InMMXdKw5nee2rIOJdMOj4wUYH0KtKO
0PHEf3i1J9uaIlVVhJfNPx8fF02C0Wd2PucTZuLoSyh8PT6Qnj/Qdaxxo0vfkA2/
rCFnNNAS8qjLBPr7nbfyKzxLJqddsw==
=/+7N
-----END PGP SIGNATURE-----

--4+45848vnO8JD9A9--


