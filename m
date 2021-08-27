Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E93F9463
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:36:17 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVTH-00015o-Jz
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJVMb-0006lg-DD; Fri, 27 Aug 2021 02:29:17 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJVMX-0005xe-JX; Fri, 27 Aug 2021 02:29:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 12D065809E4;
 Fri, 27 Aug 2021 02:29:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 27 Aug 2021 02:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GSn8mdT5UUq4Y79P/TpA+vEG42A
 NbN6HrD03U20sJWY=; b=bMwoAgbS/V40fA0v6fXcdllzDltwSaETAGxvrEnHzJv
 ptiVu+Ob6cKLxCCLOAEmaFWh0090MkhN7Eree4fcsg/d7016dQ5MbeG6XGeQO1ur
 g4zzdp8khOz+lVQ2T3yigjBB0nJxMNITAAKjhlMZis00Q3kvM+lNu9o8I9BZR+Jb
 2E+v9//F4BT3KQCRGWozqiNFINps9FI8PbVjAX5K/3cZIPNhLnAa9t3yRtfXXJ//
 8LffwZ0igAYOHOysRHeLzYFBomuBSAV/AicL39GrFC3oWA37RaaGeEmnRnnMEYPP
 klFKQHTcvxftNDNjOvlzWx5V7AdxPvmPdLRVGyM7tqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GSn8md
 T5UUq4Y79P/TpA+vEG42ANbN6HrD03U20sJWY=; b=G21nMSmt45CWGVSwmvaMHc
 LzSq/aL3VjjI7coKgRlh8/S8sZYSacOLtESYXegHiNK4eDFmwNPDkROqbyMNbjhi
 fJSQZvo2vrulUX9la47ac11Zhir1n10bLjJqUqz8wO3Z73Z0N8CghMjLJAG7vDN9
 QzI0GU8sMrb35oxK9FWP02V20uo9W6tf/6qgKdTs489OGHDpltfFQjQXq8ObrbJu
 7P2V80N38tVYy5AY9FnN+7LUOihCvlZznsIxh+3I+1BpJ6KSyZsvbY68spGdNzae
 zmfWfb9KDKcH2ONfbk1tYnj1QfwkWvslJcXqWjK/2EuISfbPeZfLLwrWW7X++AyQ
 ==
X-ME-Sender: <xms:NoYoYeP4MN9FkoSZ27Js24ai9nOw9KXCbV7EbWQJkrKoqfDysdhtbg>
 <xme:NoYoYc8GsJoCKveEQ7-pIhAHBT8htZtfoDknTPAAEqlsxXdb2vkulxV5sSP41Tar8
 bumMtxUYaUE4AxYqC8>
X-ME-Received: <xmr:NoYoYVQ4RcPIwlCVfifDJOSeFqKXh3onf-0HvUZx5j4ZtW2EsfLKmFHY1ElImQq43bDqCLHKeeGy1z4COtJMsVgf9cz2nbV4mkAnDKlPBkhlcRumvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NoYoYevfZ1-oMyC3atb_aP_e9ZZYRf_cpu_Zo3GDewa9lqyMnQnAag>
 <xmx:NoYoYWc9T2VJw6p30GUtvw3ufiLH6leTh1qvaemLNEzM1IJkzEcrCg>
 <xmx:NoYoYS1LwsGWHywXL_8AY9GvK8hQKlkSe61Vlq_yXq23VrSwVIhO7w>
 <xmx:OIYoYW7RsLwjntvSTdtX7-Pi0cpToM2zS8y3Tp1hEtcouAz2gmCQHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 02:29:08 -0400 (EDT)
Date: Fri, 27 Aug 2021 08:29:07 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 06/11] util/vfio-helpers: Pass Error handle to
 qemu_vfio_dma_map()
Message-ID: <YSiGM0jwjdRrYVqt@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-7-philmd@redhat.com>
 <YSh8uKL1jMQwwxDT@apples.localdomain>
 <1b593ee5-cde1-9ce3-6019-db9264db9037@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ujnegq+muHFAjloC"
Content-Disposition: inline
In-Reply-To: <1b593ee5-cde1-9ce3-6019-db9264db9037@redhat.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ujnegq+muHFAjloC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 27 08:24, Philippe Mathieu-Daud=C3=A9 wrote:
> +Markus
>=20
> On 8/27/21 7:48 AM, Klaus Jensen wrote:
> > On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Currently qemu_vfio_dma_map() displays errors on stderr.
> >> When using management interface, this information is simply
> >> lost. Pass qemu_vfio_dma_map() an Error** handle so it can
> >> propagate the error to callers.
> >>
> >> Reviewed-by: Fam Zheng <fam@euphon.net>
> >> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/qemu/vfio-helpers.h |  2 +-
> >>  block/nvme.c                | 22 +++++++++++-----------
> >>  util/vfio-helpers.c         | 10 ++++++----
> >>  3 files changed, 18 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
> >> index 4491c8e1a6e..bde9495b254 100644
> >> --- a/include/qemu/vfio-helpers.h
> >> +++ b/include/qemu/vfio-helpers.h
> >> @@ -18,7 +18,7 @@ typedef struct QEMUVFIOState QEMUVFIOState;
> >>  QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp);
> >>  void qemu_vfio_close(QEMUVFIOState *s);
> >>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
> >> -                      bool temporary, uint64_t *iova_list);
> >> +                      bool temporary, uint64_t *iova_list, Error **er=
rp);
> >>  int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s);
> >>  void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host);
> >>  void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index,
> >> diff --git a/block/nvme.c b/block/nvme.c
> >> index 0786c501e46..80546b0babd 100644
> >> --- a/block/nvme.c
> >> +++ b/block/nvme.c
> >> @@ -176,12 +176,11 @@ static bool nvme_init_queue(BDRVNVMeState *s, NV=
MeQueue *q,
> >>          return false;
> >>      }
> >>      memset(q->queue, 0, bytes);
> >> -    r =3D qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova=
);
> >> +    r =3D qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova=
, errp);
> >>      if (r) {
> >> -        error_setg(errp, "Cannot map queue");
> >> -        return false;
> >> +        error_prepend(errp, "Cannot map queue: ");
> >>      }
> >> -    return true;
> >> +    return r =3D=3D 0;
> >>  }
> >> =20
> >>  static void nvme_free_queue_pair(NVMeQueuePair *q)
> >> @@ -239,9 +238,9 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVN=
VMeState *s,
> >>      qemu_co_queue_init(&q->free_req_queue);
> >>      q->completion_bh =3D aio_bh_new(aio_context, nvme_process_complet=
ion_bh, q);
> >>      r =3D qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
> >> -                          false, &prp_list_iova);
> >> +                          false, &prp_list_iova, errp);
> >>      if (r) {
> >> -        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
> >> +        error_prepend(errp, "Cannot map buffer for DMA: ");
> >>          goto fail;
> >>      }
> >>      q->free_req_head =3D -1;
> >> @@ -534,9 +533,9 @@ static bool nvme_identify(BlockDriverState *bs, in=
t namespace, Error **errp)
> >>          error_setg(errp, "Cannot allocate buffer for identify respons=
e");
> >>          goto out;
> >>      }
> >> -    r =3D qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova);
> >> +    r =3D qemu_vfio_dma_map(s->vfio, id, id_size, true, &iova, errp);
> >>      if (r) {
> >> -        error_setg(errp, "Cannot map buffer for DMA");
> >> +        error_prepend(errp, "Cannot map buffer for DMA: ");
> >>          goto out;
> >>      }
> >> =20
> >> @@ -1032,7 +1031,7 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockD=
riverState *bs, NvmeCmd *cmd,
> >>  try_map:
> >>          r =3D qemu_vfio_dma_map(s->vfio,
> >>                                qiov->iov[i].iov_base,
> >> -                              len, true, &iova);
> >> +                              len, true, &iova, NULL);
> >>          if (r =3D=3D -ENOSPC) {
> >>              /*
> >>               * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_D=
MA
> >> @@ -1524,14 +1523,15 @@ static void nvme_aio_unplug(BlockDriverState *=
bs)
> >>  static void nvme_register_buf(BlockDriverState *bs, void *host, size_=
t size)
> >>  {
> >>      int ret;
> >> +    Error *local_err =3D NULL;
> >>      BDRVNVMeState *s =3D bs->opaque;
> >> =20
> >> -    ret =3D qemu_vfio_dma_map(s->vfio, host, size, false, NULL);
> >> +    ret =3D qemu_vfio_dma_map(s->vfio, host, size, false, NULL, &loca=
l_err);
> >>      if (ret) {
> >>          /* FIXME: we may run out of IOVA addresses after repeated
> >>           * bdrv_register_buf/bdrv_unregister_buf, because nvme_vfio_d=
ma_unmap
> >>           * doesn't reclaim addresses for fixed mappings. */
> >> -        error_report("nvme_register_buf failed: %s", strerror(-ret));
> >> +        error_reportf_err(local_err, "nvme_register_buf failed: ");
> >>      }
> >>  }
> >> =20
> >> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> >> index e7909222cfd..77cdec845d9 100644
> >> --- a/util/vfio-helpers.c
> >> +++ b/util/vfio-helpers.c
> >> @@ -463,13 +463,15 @@ static void qemu_vfio_ram_block_added(RAMBlockNo=
tifier *n, void *host,
> >>                                        size_t size, size_t max_size)
> >>  {
> >>      QEMUVFIOState *s =3D container_of(n, QEMUVFIOState, ram_notifier);
> >> +    Error *local_err =3D NULL;
> >>      int ret;
> >> =20
> >>      trace_qemu_vfio_ram_block_added(s, host, max_size);
> >> -    ret =3D qemu_vfio_dma_map(s, host, max_size, false, NULL);
> >> +    ret =3D qemu_vfio_dma_map(s, host, max_size, false, NULL, &local_=
err);
> >>      if (ret) {
> >> -        error_report("qemu_vfio_dma_map(%p, %zu) failed: %s", host, m=
ax_size,
> >> -                     strerror(-ret));
> >> +        error_reportf_err(local_err,
> >> +                          "qemu_vfio_dma_map(%p, %zu) failed: ",
> >> +                          host, max_size);
> >>      }
> >>  }
> >> =20
> >> @@ -725,7 +727,7 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t =
size, uint64_t *iova)
> >>   * mapping status within this area is not allowed).
> >>   */
> >>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
> >> -                      bool temporary, uint64_t *iova)
> >> +                      bool temporary, uint64_t *iova, Error **errp)
> >=20
> > Won't this break at this point? You add an Error** to qemu_vfio_dma_map,
> > but it is never used (so it probably stays NULL). So, above, if
> > qemu_vfio_dma_map() returns something not zero, you use error_prepend(),
> > which I think expects errp to be non-NULL?
>=20
> I can't find such restriction documented in "qapi/error.h".
>=20
> In error.c:
>=20
> void error_prepend(Error *const *errp, const char *fmt, ...)
> {
>     va_list ap;
>=20
>     va_start(ap, fmt);
>     error_vprepend(errp, fmt, ap);
>     ...
>=20
> void error_vprepend(Error *const *errp, const char *fmt, va_list ap)
> {
>     GString *newmsg;
>=20
>     if (!errp) {
>         return;
>     }
>     ...
>=20

Sorry, my bad - I should have checked myself. In that case,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--Ujnegq+muHFAjloC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEohjAACgkQTeGvMW1P
Dem0CAgAkP8b2R/yeJoNbtDxVoTUFJUfsRSY7x2bT0w9WHXOuRgbhoKRybvwXIWC
oiNRWW90bI4FnANthfuCybmEAJ8WjB8QsaAWBiXpQZr0TJ5AIf8/q727MDa8LBrp
MbVPBKwdmyy0O8u/CnqZxvl0se+AFdZ0CrFj6y3qgh67qN6RBldeacRFK9u0zUY/
v9Jc0nsz+ZEDCAytX6YUXpPotV+YBn7Ozx4mvuOoOCWgLR9Yj8pxRF/pzKdsKUbd
+ASJ8xfvi1jcrMTthbLBr3LsW2XjeZKLZtQHjtlA+rJVWts4lJni+O2dy2VXPmuz
zLUT7RePVwuUNyW6h4AK/fzge5YNpw==
=Ls4+
-----END PGP SIGNATURE-----

--Ujnegq+muHFAjloC--

