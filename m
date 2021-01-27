Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074830667A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:40:58 +0100 (CET)
Received: from localhost ([::1]:43008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sYb-0008U4-7h
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4sQP-0005Im-Bo; Wed, 27 Jan 2021 16:32:29 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4sQN-0001iu-9G; Wed, 27 Jan 2021 16:32:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1297F861;
 Wed, 27 Jan 2021 16:32:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 16:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CdgnW5Xoe4unNxIAytdr4v0+nQT
 jEPXqaBfheUR9Cv4=; b=yB7MQ4hX1ZbplUqFrel7uG8OEamHbfMrg0plRdpII0h
 KcCHTg4SoAF61xkHfxZO0CzUPErah4JnLg92Fg70KlyYiCh7bzIENT0qVCKzqFVv
 FqerU0Go8ExEERbusC46jSSr/2d8mDktdaSK+1RvJNOh88Mq8Z24ppOi5KvmCyJU
 W9RZfgg6VxqM05cYjTmsRkf/Soi9/54tKRQrpo48qFtQwFeyut9o1vzn5D02ysE8
 RVbKTpsF8tvMgKQUVYmXMyHjRlGm83tr55VLp+EN5NxUNbFv0iJMw4sIFuWO//66
 ytPF30Hk7OBafccffJFq/3pJ3dABARK7N/7RaqEnJ+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CdgnW5
 Xoe4unNxIAytdr4v0+nQTjEPXqaBfheUR9Cv4=; b=R/U6o47MxwyXWD2UfMnQyj
 /9G+y3vlB3TYE3reZj+mMeobMN7Lv2c1glOxPxQfeZzEP9LDiQnadMAKZrz+4j36
 N+pPcRilbz86evScbVTD+Ev6j1b35ujawd5btJUuDD5OdKsRIdRlrTKm75/fqCyL
 k5R57iGXHYk8nUM9WOOHST3UxbaW6SMvuWMgALVcp8zYb8Y7q75uVj+LcEATQszZ
 pLMghGlcZc9SZNsoMVPB0DbF0W1EcRtx4K/Nl9g2sUS4p8dKrMgzm7G1UhAy+bWt
 zzEfFIKFLZJLMgd9RXhF+ULC2BQrAj7E2vAO7Gxa+/8Oa5PY7AIRC4X91rShBJWA
 ==
X-ME-Sender: <xms:5tsRYD6oMvNwGg-WIHCIdD-WC_kCtSpiAl02cyrCSBpHL95iIy6_mQ>
 <xme:5tsRYI5y1zR6rUuw4ECbYgWWD0FJ5lOkWSw2ktYrkGk09mVg0O3bG6OxuHRzgr_-T
 y-UjdMnXgedGoRAdDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5tsRYKey78a2rXESJCZ-rT1_ZJC5kWw5Z1LsNUxDh5DHiW1Ee6GfIA>
 <xmx:5tsRYEKHaNcKtp88N2V2YfMmqP9icMDXxY02IXua6bQ57eCepMPjhw>
 <xmx:5tsRYHKnIsqTNc1Fi-FBBxsDXuFB4XeXB3mJoUs2hQUVc7prfUAXig>
 <xmx:6NsRYNj07iiuYA1iRepV-r5X1ECRzTXV04STAxJ_-HwUwsTwwIbVUw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1037108005F;
 Wed, 27 Jan 2021 16:32:21 -0500 (EST)
Date: Wed, 27 Jan 2021 22:32:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] block/nvme: Trace NVMe spec version supported by the
 controller
Message-ID: <YBHb5Insoft3TA91@apples.localdomain>
References: <20210127212137.3482291-1-philmd@redhat.com>
 <20210127212137.3482291-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vJUJk6FFPkM1Cc+9"
Content-Disposition: inline
In-Reply-To: <20210127212137.3482291-3-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vJUJk6FFPkM1Cc+9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 27 22:21, Philippe Mathieu-Daud=C3=A9 wrote:
> NVMe controllers implement different versions of the spec,
> and different features of it. It is useful to gather this
> information when debugging.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  block/nvme.c       | 6 ++++++
>  block/trace-events | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/block/nvme.c b/block/nvme.c
> index 80c4318d8fc..2b5421e7aa6 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -708,6 +708,7 @@ static int nvme_init(BlockDriverState *bs, const char=
 *device, int namespace,
>      AioContext *aio_context =3D bdrv_get_aio_context(bs);
>      int ret;
>      uint64_t cap;
> +    uint32_t ver;
>      uint64_t timeout_ms;
>      uint64_t deadline, now;
>      volatile NvmeBar *regs =3D NULL;
> @@ -764,6 +765,11 @@ static int nvme_init(BlockDriverState *bs, const cha=
r *device, int namespace,
>      bs->bl.request_alignment =3D s->page_size;
>      timeout_ms =3D MIN(500 * NVME_CAP_TO(cap), 30000);
> =20
> +    ver =3D le32_to_cpu(regs->vs);
> +    trace_nvme_controller_spec_version(extract32(ver, 16, 16),
> +                                       extract32(ver, 8, 8),
> +                                       extract32(ver, 0, 8));
> +
>      /* Reset device to get a clean state. */
>      regs->cc =3D cpu_to_le32(le32_to_cpu(regs->cc) & 0xFE);
>      /* Wait for CSTS.RDY =3D 0. */
> diff --git a/block/trace-events b/block/trace-events
> index 8368f4acb0b..ecbc32a80a9 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -136,6 +136,7 @@ qed_aio_write_main(void *s, void *acb, int ret, uint6=
4_t offset, size_t len) "s
>  # nvme.c
>  nvme_controller_capability_raw(uint64_t value) "0x%08"PRIx64
>  nvme_controller_capability(const char *desc, uint64_t value) "%s: %"PRIu=
64
> +nvme_controller_spec_version(uint32_t mjr, uint32_t mnr, uint32_t ter) "=
Specification supported: %u.%u.%u"
>  nvme_kick(void *s, unsigned q_index) "s %p q #%u"
>  nvme_dma_flush_queue_wait(void *s) "s %p"
>  nvme_error(int cmd_specific, int sq_head, int sqid, int cid, int status)=
 "cmd_specific %d sq_head %d sqid %d cid %d status 0x%x"
> --=20
> 2.26.2
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--vJUJk6FFPkM1Cc+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAR2+IACgkQTeGvMW1P
Del1aQgAiOiLdUg7o9qQR/nf5go45cazijfvRw/pgcJdopIZsrErAoKayQfbhuVg
Vx3MOQp6iQJ7NmTr5TrWObUNIvdl4tbw632GP6K7osNBZEufwZkxhOg3ubnl+pvk
r3Nr2vO9WK/SqD9wbwM7l4SCoYI7hKyqDV2nnE7GrSuLlnW32iSw3EWHJg0nZHBE
PbIoGZHfYMcgDvdeqxWy3CWoyOml+nPjbZLcArTDW7aSX1H3CfRcBCw4d1UWDJCp
482g+BNKBKpvixodr7rvwAgxyHBh2tbOiNQ2NuMkQk77c7sy7Xz81JLh1jcRIU08
pu/+9vnQtmhyRMczFDpnNd5dZbrEBw==
=5Oi5
-----END PGP SIGNATURE-----

--vJUJk6FFPkM1Cc+9--

