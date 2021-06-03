Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76741399E0F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:49:20 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojyZ-00072c-GI
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lojxl-0006En-RE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lojxk-0004uh-7I
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622713707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZEbHLTvhXK3hhfqvSvnMiY4IIytwxpIxQ8lphZcx8N8=;
 b=Ef3z7wbVkTx7gHH0wIYpDf0fyCek4mipJqcbbUgeXEZ5VqrVTV77X3HJUlY4+uyGeKOAys
 BQeMSbaudzR8DAaCxc0ig7j0niQxw9bx7RC8PZbM01fhu8negXXLN+XW+LcsFmWt5XoU4C
 5tbrJ8CYl8l9tE2wQAJLJoyWTDvMID4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-7uuAT5ODOuiKGhd4XCbCdQ-1; Thu, 03 Jun 2021 05:48:25 -0400
X-MC-Unique: 7uuAT5ODOuiKGhd4XCbCdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BBF107ACCA;
 Thu,  3 Jun 2021 09:48:24 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1DE19C97;
 Thu,  3 Jun 2021 09:48:23 +0000 (UTC)
Date: Thu, 3 Jun 2021 10:48:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLilZqgEZyQjnRwX@stefanha-x1.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20210601143749.1669-2-anaidu.gollu@samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PELhhWNpmN1fxR0U"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, its@irrelevant.dk, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PELhhWNpmN1fxR0U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
> @@ -5546,6 +5665,47 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
>                         "invalid write to read only CMBSZ, ignored");
>          return;
> +    case 0x44:  /* BPRSEL */
> +        n->bar.bprsel = data & 0xffffffff;
> +        size_t bp_len = NVME_BPRSEL_BPRSZ(n->bar.bprsel) * 4 * KiB;
> +        int64_t bp_offset = NVME_BPRSEL_BPROF(n->bar.bprsel) * 4 * KiB;
> +        int64_t off = 0;
> +        struct nvme_bp_read_ctx *ctx;
> +
> +        trace_pci_nvme_mmio_bprsel(data, n->bar.bprsel,
> +                                   NVME_BPRSEL_BPID(n->bar.bpinfo),
> +                                   bp_offset, bp_len);
> +
> +        if (bp_len + bp_offset > n->bp_size) {
> +            NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
> +            NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR);
> +            return;
> +        }
> +
> +        off = NVME_BPRSEL_BPID(n->bar.bpinfo) * n->bp_size + bp_offset;
> +
> +        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
> +        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_READING);
> +
> +        ctx = g_new(struct nvme_bp_read_ctx, 1);
> +
> +        ctx->n = n;
> +
> +        pci_dma_sglist_init(&ctx->qsg, &n->parent_obj, 1);
> +
> +        qemu_sglist_add(&ctx->qsg, n->bar.bpmbl, bp_len);
> +
> +        dma_blk_read(n->blk_bp, &ctx->qsg, off , BDRV_SECTOR_SIZE,
> +                     nvme_bp_read_cb, ctx);

The returned BlockAIOCB is not stored. Two questions:

1. Can the guest allocate unbounded amounts of QEMU memory (struct
   nvme_bp_read_ctx) by repeatedly writing to this register?

2. What happens if the NVMe device is hot unplugged or reset while a
   boot partition read request is in flight?

--PELhhWNpmN1fxR0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC4pWYACgkQnKSrs4Gr
c8iHGQgAxhb8S4JpVZjpQgcTXZTN13XXbcAZLV6sMsdEgGqbGOmrM2iDu0eA/R5p
I8pT6eqpbl28Q8uN41lsPw6WV/6Kl5OfHKTopMTqvWEJT6O64AaA/c1vn3f5l8Zs
aSrendCKXcCqqbsz299aa36Tj3s5BThkguOongM1QayKeALsoyIvcDeq0xg6+Qr8
bWegEPk70tZ4EyMb6K6XWy4+zKfvGybDUOBQS6Vxvys8UVNgz4FU9hFbh2gqy5Iu
9KE+dOI08Z8luNoE2tTX0L2gHZuRMraO84hr6wa30nWNJY9RYXO/cGO2nPNecOas
B0zDeuWGnhaof28cXU0/+J1gocDeNw==
=lfnS
-----END PGP SIGNATURE-----

--PELhhWNpmN1fxR0U--


