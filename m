Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CCD3B6753
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:10:33 +0200 (CEST)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxumF-0006g9-Q6
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxui9-0004Mg-Oe; Mon, 28 Jun 2021 13:06:17 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxui8-0004kg-76; Mon, 28 Jun 2021 13:06:17 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D205A5C0172;
 Mon, 28 Jun 2021 13:06:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 13:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0sb7aHgRbU6RchUyTuW/ckNdj3V
 SFu63Emm301muCVQ=; b=WVRVXdX1tAZDl6YvfmffL+Nl77c6dt15P1IjkHWq1UU
 Gmqw35QouLVluZFhQwrzDqE9+vjywU62aeCwe2SESYpDXVq2c2OBfSf6YDU4sF4r
 VM4hXYYhcX5trE4hLJepzKu4d9rsNZ2nc9y6k4KHMqA9otKd16a9PcKpO9IFPuip
 g8uGjq0fPu/FeD1uJieg2Q+mpRUhK/Wl0TtrsI70FltCia9CBc5cYVIHmh99BP8s
 CYisZMjWR+GrVs4sdIpwOgSF6drNdKNWmRB9klj5VY/Qf8I0g5117FQ5EgUX5XZZ
 GL02XtvJUkbGeLQlRWfEIBr5Cf+oAH+nQMuZ8vNbnOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0sb7aH
 gRbU6RchUyTuW/ckNdj3VSFu63Emm301muCVQ=; b=S7rqwxKTTUI58cdavmrqBi
 5ATOkeoSHmikruPEzplIoUNwO7csArF/n7aD7d5g3xdO8SBasO6hlNg5we+itW8d
 a+vIWxo44lclKJvh4oGUY7kPbPzzNa4jVp1J0ugA35JtKxpgGGSHBHEO5U7oW9Zo
 B9okqBatgSJltGpAyB87uDkhm+y0rf6BsMD9GVprLyEheORU+Z3RStsov3lciK6/
 6ZZ/uLBDhMP3eLavWkVh1+yrxlGEvxZ9e89jwlyGoM1OFDUBtOpqrwOxcZgDvukn
 KfNRRim7TXFJiflZ5LZraCeBKUohGHTBXVgx8A+QjJEvImf/lJaikIGrFEm/a09g
 ==
X-ME-Sender: <xms:hgHaYOJjh_tu8TG52npz7Szi27U-Gg-CgtZiBGur-3xFwdKShUGN2w>
 <xme:hgHaYGKvsBQk1BOCi333mMvpSM5APOUFyteROfxcD9I8jN7KxiojGYNEeYNCv1ICj
 QTsNPek7prLbZFS0DY>
X-ME-Received: <xmr:hgHaYOsQhS67KmdO3HRxzgq38kw7EavkP2JRLe8jcFSiqoj07GPLZaC3am7BWasaFxRjxfscpD0MolRlcrnw6EhUfMPYzknYiOilKK6w1F1bwEEVPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hgHaYDbCYgMuyQ6NPoqhcxlj3T7GvApwS6fTNM5vPX-Jjc-Pl26bsg>
 <xmx:hgHaYFb5lEXvCxFXJpwH9OwxkJvOQgCCWhXRh9f0l170-xWX69yVPw>
 <xmx:hgHaYPAJoGgeTt4Ntn9p1XJHEX7N4Rx2PFWln_IBi4-nJyITdOk6DQ>
 <xmx:hgHaYIx9GilMTe_v3jIT1qle2RuLNlhgrt_vRPFnpY59s1dGTCvQCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:06:12 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:06:10 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v3 0/2] hw/nvme: namespace parameter for EUI-64
Message-ID: <YNoBgqxUGtNbTi/z@apples.localdomain>
References: <20210614201901.17871-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KmoPA445QkMJdtyo"
Content-Disposition: inline
In-Reply-To: <20210614201901.17871-1-xypron.glpk@gmx.de>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KmoPA445QkMJdtyo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun 14 22:18, Heinrich Schuchardt wrote:
>The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
>paths. Add a new namespace property "eui64", that provides the user the
>option to specify the EUI-64.
>
>v3:
>	use 52-54-00-00-00-00-00-00 as starting values for generating
>	EUI-64s
>
>Heinrich Schuchardt (2):
>  hw/nvme: namespace parameter for EUI-64
>  hw/nvme: default for namespace EUI-64
>
> docs/system/nvme.rst |  6 +++++
> hw/core/machine.c    |  1 +
> hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
> hw/nvme/ns.c         | 11 +++++++++
> hw/nvme/nvme.h       |  3 +++
> 5 files changed, 56 insertions(+), 23 deletions(-)
>
>--
>2.30.2
>

Applied to nvme-next. Thanks!

--KmoPA445QkMJdtyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAX4ACgkQTeGvMW1P
DemZ3ggAgFq7h+eE7+f6FEeIMqKRVWUQBqtaDEo/9evioFigRqG0q2yrZw4ZO/mc
9F0Z8pSalJKvMOsjxg5B6YebcfRblIVge1irtNRSLJwMG9DfsFzAJx8ALxxR4kDn
YN2GpOSsFbt7HMMrGOXxvy3y1kpSUyrUEEjtez0gvUxhdhlu0AzxVE861ifzHGa8
KOSYXW0isButQ4qKL5hZrAJ6T0qjtIjR3s3DP66mcEslOe7x/oMSUQv2pulp7RQc
0u4Kn1v9drmltxxxfbx18x4wUSFyevBMST+lIkU6/iQgmykqyL53UHDp1l7cR6Dm
MWB5ivegj58mhsrQeveodDcId2U1/Q==
=e6Va
-----END PGP SIGNATURE-----

--KmoPA445QkMJdtyo--

