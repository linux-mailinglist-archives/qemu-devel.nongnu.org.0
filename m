Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB074BB318
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 08:16:56 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKxVe-0003As-7E
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 02:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKxLj-0001S4-Hm; Fri, 18 Feb 2022 02:06:44 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKxLf-0006iN-1N; Fri, 18 Feb 2022 02:06:36 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 54C573200A6A;
 Fri, 18 Feb 2022 02:06:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 18 Feb 2022 02:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=jbD7mAI+F5H908MX4mFoKqSL04Tbs5
 w8cwZ6rvQS7NM=; b=i0lJHYDwDNVTgt+6AfLzFw8ofEdZhAZ9iCfqy5xcgoHxZt
 P30AGmS3yhUH/bzILDyDV3V750q8bHP1kgMF3Ch3uGLl07xLR6eNHklW6YiGsUEo
 PFd2V4LtKNq1b28Z8QLKdRqP85ZWfWQ/Lt8EN6GSfQ+sH2/WmUX+IkJGz0NqR8x6
 83njJnKb17GBlBCFUgtpqzdWz3S2OnMgivlw3U8e525guovhm/NTbXjZ05TtHzy4
 jexyxlsd0BuTTN2DoH9VBVaLkwtbbgK1OVf95zrqltguiMK2bbefXRieEOVadDC1
 s5qLlvjU8ZyWL/Eb1WSNF5MQ9Ad28EcdNOmSe/4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jbD7mAI+F5H908MX4
 mFoKqSL04Tbs5w8cwZ6rvQS7NM=; b=IW6/jcE5VuluIY1V6PXz/5UePMuY33Vo7
 Z84ccvYY9nxaizdxFYRn3VcxhNMr0V69QUDk3ni+CQAVN1DC+7ISjfBaV33yU1s3
 zZZSgBDRXLuK9m8H1n9GyriJ6/QkbpcgB4ns8bbfOwMnIrPAjtrFseMk7rSUeND3
 XZyyLZwXDdQdQYt9I8thQx9q3eto175+OSFcCF6iWRtrTblzhqpFUcJEz6q5UkXP
 eHilWfSAbEHMxsWc49oxuD3ma/gLacLmtrNOSc3E4ZJBvW5u9QN4rD6yVcuWyqYM
 Hq9t+aEymK8z9bNmX8RP1rApqBMRysPFkhuZ2nhKk8CS2e/yJok+g==
X-ME-Sender: <xms:dkUPYuE7pHHJ07u43abNU9wPg6dmr086iZ5KiMqPx_liExHMbJm2Gg>
 <xme:dkUPYvXAG4r_m7DWB33VRLje4SUmbOH99ELRp5Xxwr1UQQ8r1HFRKbnn5Ti0p3lWo
 -PjwFZorViCaq_Jw-A>
X-ME-Received: <xmr:dkUPYoKeaQyHvN4czgMGFeUyGcjB6h7XzRpDGiVtgKhgzLZCPVGDxzvR2jS10j94mkeV-xmnKtKkHz68zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:d0UPYoG1HE5y0ok_WUsMJ4VLkCYFinGBo9y_qwnNxoAv0g9xfURRtQ>
 <xmx:d0UPYkXyenqngyBSjJBz5u3qIB-WHRvtx140_ZIrtTgHVk_pdwM8FA>
 <xmx:d0UPYrPBhUoBt3JTQfhlm9RAvKiKXslLON1qV6Tt09Map4MLuFdkTw>
 <xmx:d0UPYmJbjFDlB4nbEZQczwCGjVSlYtQD18q0z1HaEu5yZEpxQ6pyGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Feb 2022 02:06:29 -0500 (EST)
Date: Fri, 18 Feb 2022 08:06:27 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <Yg9Fc9EDnXE86g7e@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-6-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FyJycyWynomYwYrh"
Content-Disposition: inline
In-Reply-To: <20220217174504.1051716-6-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FyJycyWynomYwYrh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 18:44, Lukasz Maniak wrote:
> This patch implements initial support for Single Root I/O Virtualization
> on an NVMe device.
>=20
> Essentially, it allows to define the maximum number of virtual functions
> supported by the NVMe controller via sriov_max_vfs parameter.
>=20
> Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
> capability by a physical controller and ARI capability by both the
> physical and virtual function devices.
>=20
> NVMe controllers created via virtual functions mirror functionally
> the physical controller, which may not entirely be the case, thus
> consideration would be needed on the way to limit the capabilities of
> the VF.
>=20
> NVMe subsystem is required for the use of SR-IOV.
>=20
> Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> ---
>  hw/nvme/ctrl.c           | 85 ++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h           |  3 +-
>  include/hw/pci/pci_ids.h |  1 +
>  3 files changed, 85 insertions(+), 4 deletions(-)
>=20

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--FyJycyWynomYwYrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIPRXIACgkQTeGvMW1P
DemW2gf7BhWVjut8AVyNMx91BVNKDUbU65gcDcHGKzZL5Cb6CVrfZ5mLxSLJejJl
QQ/XHr2/E+ie3CAWrOT9E0mTs+4uPhqSnM1Lsg+oWciC2YZA04lRuVEEPazhv4Fk
jeerUAghQjJIRd5D769UkADVY8/ORgg4f0u6hfhi3B5PQD8GPj4RJQLxTkRZMIRd
Chx95u8L7thH2IWBcLyC9z3gYIj3tvL8VVntmqnI7hDonfV1p9OFMOqKAefqKJku
C31nD53BP5g7AlU3+dOrWHRgtEZDVcVfyQclOgLYOzQMJpwjDK4ARqrPdf69a4SN
QzP/VMiJXJC8muq9yHO4QmQnJSf42Q==
=Gq7S
-----END PGP SIGNATURE-----

--FyJycyWynomYwYrh--

