Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D23F9438
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:14:02 +0200 (CEST)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV7k-0006rO-8h
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUsn-0003iH-6T; Fri, 27 Aug 2021 01:58:29 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUsl-0005GK-Ny; Fri, 27 Aug 2021 01:58:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id EE6C932009C7;
 Fri, 27 Aug 2021 01:58:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 27 Aug 2021 01:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=br5X3pwZQH1yBX+JSARxqIPKaTK
 t0mpel8yYRLagVtM=; b=XUP01RvnA1AVZqa8fSHMiLcfNcewgoOnxn6SsyTF6Gs
 n9btWgAlGUtZ5oocR3yFza8UGZtDpWO8n2rMfRAdNhEf698g6UE9m5suYU5Ddya5
 xiWysMxJpQrOOkpr9kmZgLsxu3sSjgNY23tLZs3UpXVIdHST0U5a4TGTa3H9lmxg
 gnmNmFDCL8gYSxbNGr9ObefrgAQqDx5OvNn+e96E0Sm1KJsF4PbwPGXcT//lD7xt
 fZsY0VYaXIl2ykQTFLWwqjtv9abQHRAlMCAN+bJXMQaB3WXCbFPMdt5fT1WEcFqo
 YArqp8q2ab3rmdozE1wlKc1WRqaJqma7FMbqUYJQcbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=br5X3p
 wZQH1yBX+JSARxqIPKaTKt0mpel8yYRLagVtM=; b=NY3m2pTcpAwqz90XAQ+N6v
 Q5M5zicyaNvknrzv+ED6Z3nViNyPAZD6Qlcfs21+LNpve0YkLB36fbJIIiKj8e2P
 srwl8M9AqFeOipgp4k4cv67PIVXd+nI6GqTnyU0maAIPzD7oLK/oJqV1UzwnfH44
 pZ4WW5FtcmnGIGUyphQaYjXCB6sagZnbuMIT+mAQSWe8tvBLsFoyR1xcxH4WiCsr
 idKRjKW25otRGbFXGD/yOmy51StLHDqLVwBiU7gvnaBupRZuyMEBA1oYsMuTUE88
 GvRfrDnInrlSaJiuD1E28D4ynrxKmr04V+feh5xBz7qssZnxv6Cp/MpIOu8k6a5A
 ==
X-ME-Sender: <xms:AH8oYTsJ2YlTXCrAisFHdN2jCpPZnJlnPtW01lfeGVYjOWsTdLNcrA>
 <xme:AH8oYUcMDqRg2RptcooslMIsJep-mm-QTaHhLDJmRX3RZDLiWX6WmTXKS3OE4yKNd
 Du0_UBXcI1D66FoEUE>
X-ME-Received: <xmr:AH8oYWxc11PxhafjmneOZSYGEppwNIickqr0_qUzx4nvLvgL7h7n6SoTn47BtYa7Q0IeKQheaK2eQ-5VwlzvzGkdhZMJS0CY9O1cFYzsbms-abnlZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AH8oYSPOLlAJN8W54DunYOXhoqj_mkJM7q8ZdM_WHVudkGn7Pl72ig>
 <xmx:AH8oYT_7qM-KnYkM0w03gOIKt_AywQHUMrsoharJUYwYZqhKdT756g>
 <xmx:AH8oYSUwqP2FqBnLY0n_wNs-NARdMbS771dDrr5Ng9h-1_V_nkHGFw>
 <xmx:AH8oYfQ3BpEcq33WbPLwVIWUXFIaLvWC18o4iRBcFDwzdMrCP5HHEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:58:23 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:58:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 09/11] util/vfio-helpers: Simplify qemu_vfio_dma_map()
 returning directly
Message-ID: <YSh+/fOesG1Rx2oE@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1H+7GxZJTRLWuYgK"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-10-philmd@redhat.com>
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


--1H+7GxZJTRLWuYgK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> To simplify qemu_vfio_dma_map():
> - reduce 'ret' (returned value) scope by returning errno directly,
> - remove the goto 'out' label.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--1H+7GxZJTRLWuYgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofvwACgkQTeGvMW1P
DekfiAgAuZNnQqcHYT0FPB/YeHSgKaob4Jat2ixLR8L8aCD4FJvOWiYK9lt69xH0
pHcZ1kRmnHYg01MFkYHqiTh1Hz1l8QBATIgFbCyWQtzprao/yLhUEhL9aq5qeuki
b17Gckdtw9jjn2BiiHbsJFte+gQM4/tzvkc2/LUKFdQswDHkVmotB4fRY8GwTqBc
f06a7Nv3jU+rqF3Mi5uMf2syjoK1n3pcuyXdbQ3NzSobjdPSsA++Mkj6BdsJQSA8
kcviiCNAgk1GpxWFTvGekufyE69/VyGFJ9uO4Tu2j3VMc8FjQcQ7sVnUtnoBtGP9
+xZTUJqWZdGuWi4utj8+hl/TeNqgUQ==
=UwCg
-----END PGP SIGNATURE-----

--1H+7GxZJTRLWuYgK--

