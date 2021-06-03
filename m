Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D1399E7F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:08:57 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokHY-0008Rj-1D
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lokD4-0007Hw-AN; Thu, 03 Jun 2021 06:04:18 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lokD0-0007W6-Sc; Thu, 03 Jun 2021 06:04:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EC31B5C01B9;
 Thu,  3 Jun 2021 06:04:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 03 Jun 2021 06:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hIMowiXzKMAOe9nzCsg5VlTSgfh
 qIB5zToftu6rUMns=; b=QeL0UbqfG/zGjGnGa7+3wa90PXQvdQL0jicGFZIQVli
 X4n1Mf7ExZRBI/1NQsxReowWI3k7hwgIll6SYNGaCcYMpYHPQPDylONJSJ/fDjgK
 zGhw2cn26suZMNEVz76rupQmdVb6BBqySk4G2eeUBMnQNehhc7TF50WClr7rovmV
 ivI5JCEUoexqbDnPMsvXNPEdIL4IAU9z2MlHBPhgeBg6ioTgCn8D4QWrKXBYFLHe
 y922nDcobo09/ODLFE8iBU1MF//bV9iedK7aKtqNkc9MeQlkT8l7Bm0Fx9D2OkVs
 iU4pfwyIwZD0hg+hgGVxJcO2Wdl3Y/QS2tf0SDe9sGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hIMowi
 XzKMAOe9nzCsg5VlTSgfhqIB5zToftu6rUMns=; b=KTIm9ZbN6RtRis6AosXDfZ
 JNe8ajMt9ZPn82Sf4MOGeSHJBpLegox+31uQ9BYYxOdH01dQZ8LHytXL/UKwb+sc
 l3pGxJYNHAar2X1Dy6YchgRACJzvKrfaKMQ1temQ0MzmFWDkZh8qbtFzMZVI39ze
 a+0pWdZ/YBkzLayuCRl2gYO9CbhnP5lp/4en4SK8+umHa//vcP5SSftxisLQ2p7g
 kByDJVb7ysYplzjO1rQN276aSrucLq4U/tNjPnBGy+z+JZqN5xuKZCbP12WxavP/
 +R/BDvKJL++U1Y91Vk1w1axQiUoZNSkbbqXkxNSLQM6jnSIDIY0CI00fjL5hDfSA
 ==
X-ME-Sender: <xms:Gam4YF_iXYiZJ2IRlIPESXG6a_4DeW27EgzrEBRYzqwB3h4n_1EdcA>
 <xme:Gam4YJvY5MJM-b7UjnDdHCjFzljn-ZK_4lu4W1EES9l0kWVsdJi-jsnKU22QobIqP
 mwMuj79Xzu2fSSOZFo>
X-ME-Received: <xmr:Gam4YDDUT6ZVd7yPvH8fb-IfFAoS9xib-Qo7PDW_1bz7JMv5QE6IJFzomlmSUESHPRe5__ijsg6kF6REdoNPrNqkSwt5gGsAEQPl_EUZLBSnU71Vjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelledgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Gam4YJfkwwmxo-ZNAodM6XgIdt-buyuWSfEpxbcWMzduHSN3WaGBYg>
 <xmx:Gam4YKPCPxFijMXFnqDMCZeKlS50JYG35wKR9i99Jo7xfAx1m5sl7g>
 <xmx:Gam4YLntLuo589xxNwNKkTEhaYNingDQ7Ita7WUAYkoum-2LEpYxHQ>
 <xmx:G6m4YJe_cX61G1xZqS28086uSCWlLfVaheKQGqj3NBAKGwpbUDZmqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jun 2021 06:04:08 -0400 (EDT)
Date: Thu, 3 Jun 2021 12:04:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLipFmd3ePdqgyXU@apples.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <YLilZqgEZyQjnRwX@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P6CmUhi2sPShoJ4e"
Content-Disposition: inline
In-Reply-To: <YLilZqgEZyQjnRwX@stefanha-x1.localdomain>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--P6CmUhi2sPShoJ4e
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  3 10:48, Stefan Hajnoczi wrote:
>On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
>> @@ -5546,6 +5665,47 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
>>                         "invalid write to read only CMBSZ, ignored");
>>          return;
>> +    case 0x44:  /* BPRSEL */
>> +        n->bar.bprsel =3D data & 0xffffffff;
>> +        size_t bp_len =3D NVME_BPRSEL_BPRSZ(n->bar.bprsel) * 4 * KiB;
>> +        int64_t bp_offset =3D NVME_BPRSEL_BPROF(n->bar.bprsel) * 4 * Ki=
B;
>> +        int64_t off =3D 0;
>> +        struct nvme_bp_read_ctx *ctx;
>> +
>> +        trace_pci_nvme_mmio_bprsel(data, n->bar.bprsel,
>> +                                   NVME_BPRSEL_BPID(n->bar.bpinfo),
>> +                                   bp_offset, bp_len);
>> +
>> +        if (bp_len + bp_offset > n->bp_size) {
>> +            NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
>> +            NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR);
>> +            return;
>> +        }
>> +
>> +        off =3D NVME_BPRSEL_BPID(n->bar.bpinfo) * n->bp_size + bp_offse=
t;
>> +
>> +        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
>> +        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_READING);
>> +
>> +        ctx =3D g_new(struct nvme_bp_read_ctx, 1);
>> +
>> +        ctx->n =3D n;
>> +
>> +        pci_dma_sglist_init(&ctx->qsg, &n->parent_obj, 1);
>> +
>> +        qemu_sglist_add(&ctx->qsg, n->bar.bpmbl, bp_len);
>> +
>> +        dma_blk_read(n->blk_bp, &ctx->qsg, off , BDRV_SECTOR_SIZE,
>> +                     nvme_bp_read_cb, ctx);
>
>The returned BlockAIOCB is not stored. Two questions:
>

Thanks for these comments Stefan, I've commented below how I think they
can be resolved.

>1. Can the guest allocate unbounded amounts of QEMU memory (struct
>   nvme_bp_read_ctx) by repeatedly writing to this register?
>

Yeah, the QSQ should just be a member of the controller struct and then=20
have that as the cb_arg to dma_blk_read. Then, the QSG can be=20
initialized and the host address added when BPMBL is written instead of=20
here.

We don't want the QSG to change while the read is in progress, so the=20
write to BPMBL should check BPINFO.BRS and not do anything if the QSG is=20
"in use". The spec says that the host *shall* not modify the registers=20
when a read is in progress, so we can safely just ignore the write.

>2. What happens if the NVMe device is hot unplugged or reset while a
>   boot partition read request is in flight?

The spec also says that the host *shall* not reset or shutdown the=20
controller while a read is in progress, but again, we need to protect=20
QEMU so the aiocb must be saved on the controller struct and cancelled=20
appropriately.

--P6CmUhi2sPShoJ4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC4qRAACgkQTeGvMW1P
DelJrwgAxYsfgIMMlNT4KUbl3F7x0mQnJluTvT70tEiiXG4A/9bii+kIl0Ni2qFV
rovoVY18aIDdAXrJ4sQHMBSvIqr53LdvPOSkURQT26/hKpFbqB95TmGCaPPNJKfr
+4JF4wWSDPpABuIXOZ7nBkwdgDogVWuJd/RvUMv5PFM2H9t98XBDHaBfYW5ZjxC8
wQGUFksWJlsh10m0Aj1ykc9Nyo7N1p6NaH8BmgQ483GvdWhMMBV5WGm+vsAMui6s
NliT+eHvzYYYidPLRN7NijnO8wiDD2t/xzfh6lgp7o9hvkRz5IVQVQ4PwrbdFmtL
UCjHcRrftApc2KTCnQQeDLAR+/Krcw==
=ajuX
-----END PGP SIGNATURE-----

--P6CmUhi2sPShoJ4e--

