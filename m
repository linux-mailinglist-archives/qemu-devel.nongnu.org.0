Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630650DE0E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:38:54 +0200 (CEST)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niw7I-0008BR-SL
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nivVN-0001vz-1H; Mon, 25 Apr 2022 05:59:41 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nivVK-00007h-NV; Mon, 25 Apr 2022 05:59:40 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4F3ED320100E;
 Mon, 25 Apr 2022 05:59:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Apr 2022 05:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650880773; x=1650967173; bh=LE
 vWLP1Jyz6venNBhTIr7jIiB9zWZMC1zXMpcNnrY1o=; b=gMKOpQ50OBdWhqLcC6
 PFn+1sW7Utb7XJ5hFW0+wUq41nTM+MxBB726acljN8IcSAPemPMETBpbZ9AVwCL4
 pC78suzHYgfsQUdLJINXQQtuegI/9tV+WIHgOuTUichxYIMSWb4bvLQeum5rvldv
 oX+aWYOvIbcz8TZBUh7I6BnpuXtnFDScAYYpivtkC1iWIbfv+qo2f6s/1w9oT5Z+
 9kKZaTw09fD3sHHEbWIPya4w0g+rzP6Vw0dK2jD1AEi3S1+aUe3hsfMAY2WDPKOf
 fcfcGyKYHmaNUxYjfmpT31uRPCXr6itNC1nyaFPLHmoBL6DCz45YonSuQA5yY94L
 cExw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650880773; x=
 1650967173; bh=LEvWLP1Jyz6venNBhTIr7jIiB9zWZMC1zXMpcNnrY1o=; b=z
 VW4tJ2TcYc+AiF4zb79c8gLwaWC2RXOfO378oO78kW2Pf1xUBxYkLDO5yPfJ/nGW
 O0tlLE3JVP2t1mqNwtENLlgEp3e4LBzrwfFhxAAGms5gCAb9BloITZjL3F1l4b3B
 dR07icgJCL/3QALJA25/fxTp0cCt6+tnlZ3Qs5rZQ5FRhBoX32NgKsRX5N1hRFm0
 86Geu2bCQd9FxFn+gd7PpSznpNgVhQuB8gT0ADI3N99lmM2QrYKoknvE0zaGNcDu
 +kGeLxYHifFAdCJp4V0UEJq6cdwmLR5wzlLZINzDaqCwc5YDtf1gqAnHk0O6J2rX
 0DIM/faSajZB9KAIliotA==
X-ME-Sender: <xms:BXFmYuvJuCh4jGMw8zntOQ-ELMRs43xjkHD1kpnL0lw1h9I83X7xhg>
 <xme:BXFmYjc3sZJJk33bkaWFb_ae1cQHffWKFH3CO5Weo2YnhD8kVbGreTp2_9ZOIKoeg
 frSM3RBGGIcQ-181dQ>
X-ME-Received: <xmr:BXFmYpxEJD25lUqsEYO7NCHkmVpDVyc624NqMOIHHtC2iHLclPvFDws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddugddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgefgjeffheelfeejueejfeevvdeifeevhffhffdtjeffteeikeehuddvtdei
 hfenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BXFmYpPKyGpIJ1pvr8PW40o8atmovzjbgnCJhs9oDzQpskOpsRpPIw>
 <xmx:BXFmYu8WRlOFTb4XhY9LqgMvC9Equluh71_R7_gTczLONb2bBooaxw>
 <xmx:BXFmYhUarVSzWqX3gRtp17bVBv4xh80Hl3CL3977uCuxUIkjJvT-BQ>
 <xmx:BXFmYlbNNCPzVRrcAzi0vtczpxw4s6BHu4O4BjlmVQLMghaImbnTkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Apr 2022 05:59:32 -0400 (EDT)
Date: Mon, 25 Apr 2022 11:59:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] nvme: fix bit buckets
Message-ID: <YmZxApttNqy6SNLi@apples>
References: <20220422163721.3392373-1-kbusch@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YaSknU6HUkiOrMd2"
Content-Disposition: inline
In-Reply-To: <20220422163721.3392373-1-kbusch@kernel.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: kbusch@fb.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YaSknU6HUkiOrMd2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+qemu-devel

On Apr 22 09:37, Keith Busch wrote:
> We can't just ignore the bit buckets since the data offsets read from
> disk need to be accounted for. We could either split into multiple reads
> for the actual user data requested and skip the buckets, or we could
> have a place holder for bucket data. Splitting is too much over head, so
> just allocate a memory region to dump unwanted data.
>=20
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> ---
> This came out easier than I thought, so we can ignore my previous
> feature removal patch:
>   https://lists.nongnu.org/archive/html/qemu-block/2022-04/msg00398.html
>=20
>  hw/nvme/ctrl.c | 9 +++++----
>  hw/nvme/nvme.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..711c6fac29 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -845,11 +845,11 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, Nvme=
Sg *sg,
>          trans_len =3D MIN(*len, dlen);
> =20
>          if (type =3D=3D NVME_SGL_DESCR_TYPE_BIT_BUCKET) {
> -            goto next;
> +            addr =3D n->bitBucket.addr;
> +        } else {
> +            addr =3D le64_to_cpu(segment[i].addr);
>          }
> =20
> -        addr =3D le64_to_cpu(segment[i].addr);
> -
>          if (UINT64_MAX - addr < dlen) {
>              return NVME_DATA_SGL_LEN_INVALID | NVME_DNR;
>          }
> @@ -859,7 +859,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg=
 *sg,
>              return status;
>          }
> =20
> -next:
>          *len -=3D trans_len;
>      }
> =20
> @@ -6686,6 +6685,8 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pc=
i_dev, Error **errp)
>          nvme_init_pmr(n, pci_dev);
>      }
> =20
> +    memory_region_init(&n->bitBucket, OBJECT(n), NULL, 0x100000);
> +
>      return 0;
>  }
> =20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 739c8b8f79..d59eadc69d 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -411,6 +411,7 @@ typedef struct NvmeCtrl {
>      PCIDevice    parent_obj;
>      MemoryRegion bar0;
>      MemoryRegion iomem;
> +    MemoryRegion bitBucket;
>      NvmeBar      bar;
>      NvmeParams   params;
>      NvmeBus      bus;
> --=20
> 2.30.2
>=20

The approach is neat and simple, but I don't think it has the intended
effect. The memory region addr is just left at 0x0, so we just end up
with mapping that directly into the qsg and in my test setup, this
basically does DMA to the admin completion queue which happens to be at
0x0.

I would have liked to handle it like we do for CMB addresses, and
reserve some address known to the device (i.e. remapping to a local
allocated buffer), but we can't easily do that because of the iov/qsg
duality thingie. The dma helpers wont work with it.

For now, I think we need to just rip out the bit bucket support.

--YaSknU6HUkiOrMd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJmcP4ACgkQTeGvMW1P
Dek5vAf/Xg9E3cIinqjmaLzG+F5dALLCH+gN9bbOkcejZi0FonSHK+CX4O6C5ioG
Xir70mtCVqHEY+wIGVnoMmR434LGwDwHQQjK4YKUj2jGWYYfTgPZAF5DTjptbx78
MzgJXqpMfrF+YgHutqZShpeV4RIhepP8SABbm1keKT7QJVteOE3oU/Eqa8AZ3NNM
FH/IhJq9/lmHjWBfYEJh1qk3yWegbPRNFhxKSrk9lRGTA+ySJduAjOMXz4SZqJxY
0FueX63Kyt3hKog+S+WTnNm9KTSVq/dk8dH1VeNV3vM2NO9hWpzgXydrt8RpAWw3
0FLJQ735HXFZAVkdFDxq6AlUvqpWAQ==
=zU80
-----END PGP SIGNATURE-----

--YaSknU6HUkiOrMd2--

