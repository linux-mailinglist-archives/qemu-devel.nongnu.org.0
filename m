Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587023F9424
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 07:54:52 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJUpF-0005w1-OF
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 01:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUja-0004yg-PK; Fri, 27 Aug 2021 01:48:58 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUjV-0005Sh-A6; Fri, 27 Aug 2021 01:48:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A0A9032009F1;
 Fri, 27 Aug 2021 01:48:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Aug 2021 01:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bAH2y4LL0Abg5OX6LsKYO1m9vJj
 VQqXv31OblU5fDcY=; b=F+lBje1xu7OZOOFZ63e6Qb1h3rLbKXYP3v96P6HGYWo
 kCN/zwYTEKaxNvm20a0mKo6MycNrsNeth7RI+gImXR7njh1+AvqezxBvyOn3h66+
 ghVoWthAp0zeZbMxw/hIqZ9o2GJPG/6R4yVkZh7bUpTTWE+hthm1gp/d3C0nZqD9
 Ky7mgb92QqIOYIb+Gyt7DAscTciPjvD8qJT7K9VZJ2EAZeniNLilbJtHaZBAmz9s
 xrVsnmA5KNUpsffc+S3PuVBos2Jm2DzSHnr+lkFB4+EzROJbGbLKZ/K6o5B1/PFX
 X2f2nnqcKkr73uJO0jsMT2D7YFQY71nO0ymuaUoMgRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bAH2y4
 LL0Abg5OX6LsKYO1m9vJjVQqXv31OblU5fDcY=; b=FdJ+Kw8taVT9//DyaRcyj3
 siDX1zhFyTieqz2KeZjnracq4UD3rzTFe9zMZsU0v81iauXivwOQdvHUAnEoq1zW
 CWkrI/xgDr6J9BgJfAl3WNwo6+52q4ZLU0q+fu+t2q4y9tMINKC5kcrpgbonn/Vn
 Jf9bxjZiIYfFuoDGlxDCFYzxv+UHjbbPX8RBuCgCGsDDz7fXs0Aj/4SREBmJSxpS
 WPx39ycWrQZRFBEZ2T87MQOzbTxDcuU0zAzd35IS5oW4/V6qOsxhaM/OwuUetzNR
 n4gj+kb0qn6oO/ip2kajhYS5QRgzLX+OJX9bnSsQzOWDhz0P1827yqvLPtixO7zA
 ==
X-ME-Sender: <xms:vHwoYYONDcFNVl8vcpp_Gu43NFN6di8e-5B6Mozgu9f4l0aYQYUrFA>
 <xme:vHwoYe8Oo7aDjZ5lrl9jcrsAqUZEiR2piii8_0Y5jc4z4CrtxLZoEuvvyVunoX6Nt
 LwnR1kk4uYCy85_REI>
X-ME-Received: <xmr:vHwoYfRtjEBg2cOL6TuuSAIRqKntkcsrwuI4_Yv2Qa4mQ5Vvkajf2RlA1YfTNkarWzkaEHkV6tbvV831NYfe6Iy1WS3ScArZYiAr2PxAteYZGKH8Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vHwoYQt1Z-ATU6aBpFoU8NsZehmWmWt6Qj2aBIjOS8VPB_H7wpjDrA>
 <xmx:vHwoYQd8nCu7YF4WlUFhAygzSOpybRelGaO4D-rSHUBtGU-nJK9dCw>
 <xmx:vHwoYU21aRKbpBFfc3NRJ8zy4--tZHxUI-d3-r2tZl4d_jducMAQOw>
 <xmx:vnwoYXy7wgYwmHTdWRwABNtNt4Eh8zZDv4XEM0C882LhCyXBWhWrhg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:48:43 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:48:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Message-ID: <YSh8uKL1jMQwwxDT@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-7-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LgwWMCrtZCJc8yAX"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-7-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LgwWMCrtZCJc8yAX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> Currently qemu_vfio_dma_map() displays errors on stderr.
> When using management interface, this information is simply
> lost. Pass qemu_vfio_dma_map() an Error** handle so it can
> propagate the error to callers.
>=20
> Reviewed-by: Fam Zheng <fam@euphon.net>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu/vfio-helpers.h |  2 +-
>  block/nvme.c                | 22 +++++++++++-----------
>  util/vfio-helpers.c         | 10 ++++++----
>  3 files changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
> index 4491c8e1a6e..bde9495b254 100644
> --- a/include/qemu/vfio-helpers.h
> +++ b/include/qemu/vfio-helpers.h
> @@ -18,7 +18,7 @@ typedef struct QEMUVFIOState QEMUVFIOState;
>  QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp);
>  void qemu_vfio_close(QEMUVFIOState *s);
>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
> -                      bool temporary, uint64_t *iova_list);
> +                      bool temporary, uint64_t *iova_list, Error **errp);
>  int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s);
>  void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host);
>  void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index,
> diff --git a/block/nvme.c b/block/nvme.c
> index 0786c501e46..80546b0babd 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -176,12 +176,11 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQ=
ueue *q,
>          return false;
>      }
>      memset(q->queue, 0, bytes);
> -    r =3D qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova);
> +    r =3D qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova, e=
rrp);
>      if (r) {
> -        error_setg(errp, "Cannot map queue");
> -        return false;
> +        error_prepend(errp, "Cannot map queue: ");
>      }
> -    return true;
> +    return r =3D=3D 0;
>  }
> =20
>  static void nvme_free_queue_pair(NVMeQueuePair *q)
> @@ -239,9 +238,9 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMe=
State *s,
>      qemu_co_queue_init(&q->free_req_queue);
>      q->completion_bh =3D aio_bh_new(aio_context, nvme_process_completion=
_bh, q);
>      r =3D qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
> -                          false, &prp_list_iova);
> +                          false, &prp_list_iova, errp);
>      if (r) {
> -        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
> +        error_prepend(errp, "Cannot map buffer for DMA: ");
>          goto fail;
>      }
>      q->free_req_head =3D -1;
> @@ -534,9 +533,9 @@ static bool nvme_identify(BlockDriverState *bs, int n=
amespace, Error **errp)
>          error_setg(errp, "Cannot allocate buffer for identify response");
>          goto out;
>      }
> -    r =3D qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
> +    r =3D qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova, errp);
>      if (r) {
> -        error_setg(errp, "Cannot map buffer for DMA");
> +        error_prepend(errp, "Cannot map buffer for DMA: ");
>          goto out;
>      }
> =20
> @@ -1032,7 +1031,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriv=
erState *bs, NvmeCmd *cmd,
>  try_map:
>          r =3D qemu_vfio_dma_map(s->vfio,
>                                qiov->iov[i].iov_base,
> -                              len, true, &iova);
> +                              len, true, &iova, NULL);
>          if (r =3D=3D -ENOSPC) {
>              /*
>               * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
> @@ -1524,14 +1523,15 @@ static void nvme_aio_unplug(BlockDriverState *bs)
>  static void nvme_register_buf(BlockDriverState *bs, void *host, size_t s=
ize)
>  {
>      int ret;
> +    Error *local_err =3D NULL;
>      BDRVNVMeState *s =3D bs->opaque;
> =20
> -    ret =3D qemu_vfio_dma_map(s->vfio, host, size, false, NULL);
> +    ret =3D qemu_vfio_dma_map(s->vfio, host, size, false, NULL, &local_e=
rr);
>      if (ret) {
>          /* FIXME: we may run out of IOVA addresses after repeated
>           * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_dma_=
unmap
>           * doesn't reclaim addresses for fixed mappings. */
> -        error_report("nvme_register_buf failed: %s", strerror(-ret));
> +        error_reportf_err(local_err, "nvme_register_buf failed: ");
>      }
>  }
> =20
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index e7909222cfd..77cdec845d9 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -463,13 +463,15 @@ static void qemu_vfio_ram_block_added(RAMBlockNotif=
ier *n, void *host,
>                                        size_t size, size_t max_size)
>  {
>      QEMUVFIOState *s =3D container_of(n, QEMUVFIOState, ram_notifier);
> +    Error *local_err =3D NULL;
>      int ret;
> =20
>      trace_qemu_vfio_ram_block_added(s, host, max_size);
> -    ret =3D qemu_vfio_dma_map(s, host, max_size, false, NULL);
> +    ret =3D qemu_vfio_dma_map(s, host, max_size, false, NULL, &local_err=
);
>      if (ret) {
> -        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, max_=
size,
> -                     strerror(-ret));
> +        error_reportf_err(local_err,
> +                          "qemu_vfio_dma_map(%p, %zu) failed: ",
> +                          host, max_size);
>      }
>  }
> =20
> @@ -725,7 +727,7 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t siz=
e, uint64_t *iova)
>   * mapping status within this area is not allowed).
>   */
>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
> -                      bool temporary, uint64_t *iova)
> +                      bool temporary, uint64_t *iova, Error **errp)

Won't this break at this point? You add an Error** to qemu_vfio_dma_map,
but it is never used (so it probably stays NULL). So, above, if
qemu_vfio_dma_map() returns something not zero, you use error_prepend(),
which I think expects errp to be non-NULL?

I realize that later patches fixes this, but this sticks out when
reviewing this on its own.

>  {
>      int ret =3D 0;
>      int index;
> --=20
> 2.31.1
>=20
>=20


--LgwWMCrtZCJc8yAX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofLUACgkQTeGvMW1P
DekXIQgAsnMGNmczQs2o3AbwRRuMpggtc0CXTtO0q0oXwYDVnHtlIrSou470VdqA
0runq2zGhwcnNwPdajKrbridCdJF5awlYr7LLxQQ0Sf3/7jjRwtpIt4PStFBVqIt
hJYqU7fH2V5DVuYJuZYFBqYNSoeqSGAcbABy/UP8Ejc+jLD93XbC77d0PZxyiFdz
0iH/fOF3ZpLy26mxAAxF71U1ZUUZrvMbJ6ynKWyhiSvtGKXaIT1vbp1fz82IlMNk
pwTHd+GqWLD2uW7L4g6L1nB2lONZDaSV4E1o9pT3YHHfj0VtCzu0FMpxsLKG3mFV
+JxncgFpisS2MPyr4LIsDFPEI/5/+Q==
=mesG
-----END PGP SIGNATURE-----

--LgwWMCrtZCJc8yAX--

