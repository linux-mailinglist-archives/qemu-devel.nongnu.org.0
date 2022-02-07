Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AA4AC1B5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:49:22 +0100 (CET)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5KS-0006t4-VK
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:49:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH4qv-0006kw-9c
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nH4qt-0004tw-EQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644243526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/C4igrZNM28qpmz8dCr7SQptCCEtKhS0rwWp1diqgSY=;
 b=IWmHJ3/yW+KMne1+UByvCX9DcThDhdkWEjNZorA875NZ2KB1ZgPhyutnSNqOrR8CbjuX/9
 XBibZR0IpvWFVcd7561fX+9uMfj4x11hDzJr7GpIHHXWCuL0IkU+MyHHtCOkiXa69w3eN+
 O9EZWarCJ8L7+LZoxqDSoLf/AQgUy6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-FvelFOa1OVqxfy2E4TCUSg-1; Mon, 07 Feb 2022 09:18:43 -0500
X-MC-Unique: FvelFOa1OVqxfy2E4TCUSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4619584DA42;
 Mon,  7 Feb 2022 14:18:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2DE72AA8A;
 Mon,  7 Feb 2022 14:18:41 +0000 (UTC)
Date: Mon, 7 Feb 2022 14:18:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 4/5] vduse-blk: Add vduse-blk resize support
Message-ID: <YgEqQA9s3/surkoI@stefanha-x1.localdomain>
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-5-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lsNU/X77znCzaiUp"
Content-Disposition: inline
In-Reply-To: <20220125131800.91-5-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lsNU/X77znCzaiUp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 09:17:59PM +0800, Xie Yongji wrote:
> To support block resize, this uses vduse_dev_update_config()
> to update the capacity field in configuration space and inject
> config interrupt on the block resize callback.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/export/vduse-blk.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> index 5a8d289685..83845e9a9a 100644
> --- a/block/export/vduse-blk.c
> +++ b/block/export/vduse-blk.c
> @@ -297,6 +297,23 @@ static void blk_aio_detach(void *opaque)
>      vblk_exp->export.ctx =3D NULL;
>  }
> =20
> +static void vduse_blk_resize(void *opaque)
> +{
> +    BlockExport *exp =3D opaque;
> +    VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, expor=
t);
> +    struct virtio_blk_config config;
> +
> +    config.capacity =3D
> +            cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BIT=
S);
> +    vduse_dev_update_config(vblk_exp->dev, sizeof(config.capacity),
> +                            offsetof(struct virtio_blk_config, capacity),
> +                            (char *)&config.capacity);
> +}
> +
> +static const BlockDevOps vduse_block_ops =3D {
> +    .resize_cb =3D vduse_blk_resize,
> +};
> +
>  static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *op=
ts,
>                                  Error **errp)
>  {
> @@ -387,6 +404,8 @@ static int vduse_blk_exp_create(BlockExport *exp, Blo=
ckExportOptions *opts,
>      blk_add_aio_context_notifier(exp->blk, blk_aio_attached, blk_aio_det=
ach,
>                                   vblk_exp);
> =20
> +    blk_set_dev_ops(exp->blk, &vduse_block_ops, exp);

Detach is missing, so BlockBackend->dev_ops will become stale after the
export is deleted. Please add code to detach when the export is deleted.

--lsNU/X77znCzaiUp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIBKkAACgkQnKSrs4Gr
c8gaRwgAqFmQLkrFjIZihjCXbYCKtZCto2ig5vF+GipQc9h5DagYhFDKqcBDlxTZ
m8QC60uUPQOoyxRdBemz7Tm1Uy/gcSV5iDp3GxnfV4k8vtaCqENgzDX+Fq0MQ63c
BvSUmyEA/rgCppaB2/CWHcZZ5rueIwWTXbAARHK/lWdgDpM2ojk3/RVDJZ0rRZyb
9zvNH5mkls5Uwpi2gvcmq0TOG74XiWNTNuw17MLdTgfttznAUs6vPQyU1M9ArcN4
cO0yMIgMn8dLBOj7e4AQob12cQKXEZrMvuEpp14Od1RK2D9J7YqW4Sflp1TwnlKK
Wb/kvEKpSLB/4Xd+OrLCpMGOZHKEeA==
=oDNx
-----END PGP SIGNATURE-----

--lsNU/X77znCzaiUp--


