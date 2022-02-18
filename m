Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABEC4BB4C4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 10:00:57 +0100 (CET)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKz8K-0001FZ-HZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 04:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKyz3-0008IS-VB; Fri, 18 Feb 2022 03:51:23 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKyz0-0005HG-IZ; Fri, 18 Feb 2022 03:51:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D606B3201DDC;
 Fri, 18 Feb 2022 03:51:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Feb 2022 03:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=WPRfQYOvpqsrk2vmWMZg0IEbjDR46y
 FihIpnlqdXM30=; b=oMyujbYvaD3lAzR+tmOCaEEuLCiWIXGs0r/8Kn9c47aDaD
 ve9vBJl3NNa9y9UJ43l75SNSdVWDzIKP1O8A/UyE/m37HWRsJf0vJ17+OEB7U8KX
 LVGy7STGhxVMiXq411WkRjrpihH6CumzTvlxLqTEzqCQ9OeRllr0t766yTz1hGrS
 obB8++caeRU+8Qs5m3l3QD7+afarGiR/zcXr61F7G6px6f5yfuYbhjhkaFd/kFYr
 APC323ipL/ENE16vSk2Y2zHPCdjk9xpkohVKtdCRq6UiDHFUbBTqHgTy0fCOpQFM
 K+KX8Adxtv7vW47k03V3a0dUeBCAbwWfwoBp0anw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WPRfQYOvpqsrk2vmW
 MZg0IEbjDR46yFihIpnlqdXM30=; b=INMNy6HGcNj7xvVas2K6+5Swr5v0UBEJG
 jHAi+FiS8VnUNsbbRQasfVz2/Dw+ImPdk3pKzrZjlf2u2F8yjbCIx36jalPqw+6Z
 PmZpZM5AqgQRC3yuCZZOrvCX/1mO+VlBpBAPv0RmtcPSGJ6YMuTEDj88Mp8jlwv6
 NXMgry82ZyOoCB66z6Oa4ATCseN91Db5KYLUMsEuSk/JuMZfD9tWfdnrXHy9GRXL
 bYzWMv5++sQ12GMqHocWM9EP1jLfQEkod2ixBdXaWXNl9IOwEQS0mUjOhDK5ZZ3Y
 fNc2fjLevS0xFrowuNBlPX9axibWf3w3/vYP/wz/gCTCQRNzS8ssw==
X-ME-Sender: <xms:A14PYvWJZRBrA2PbBobvsssRo4fiuPa1fhEEzATJsHqE5xvOY_bs4Q>
 <xme:A14PYnn3_yDwttQZjNdYYmrDqZZ0aVmUVmQEI-m_qZi9SnC-bhmSys53FVRuC49wk
 UNywofxUzR9A0Xw5vU>
X-ME-Received: <xmr:A14PYrZsPw7jyNyYM8hExVXCHePEwWk5jEKilEmYWOVVnYAmC-0a7jgQmaus3mnWvBu0nq8uX3XOjnvTBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:A14PYqU5WF1BNYMRfNs2M9k0iFLYCemJSfEVIfvjo56_0gDwRjAOWQ>
 <xmx:A14PYpmNung3zdPcWjins081Z-rqCGhPPDet2kC-KhEMDAcW3YD1ig>
 <xmx:A14PYndcmLqvg_hTzMSyHXb7u8FhKAvwfXrwsqAa9D3xvB-JUbrfGw>
 <xmx:A14PYsuJaDrQHplz3WNVAWyjsZ-I2ldUN4E5_YbDPlNg8zm8I7i9Qg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Feb 2022 03:51:13 -0500 (EST)
Date: Fri, 18 Feb 2022 09:51:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <Yg9eANNMYbaqD3cj@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220218032528-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BX7wJ2TiXsSvUWV7"
Content-Disposition: inline
In-Reply-To: <20220218032528-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BX7wJ2TiXsSvUWV7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 18 03:26, Michael S. Tsirkin wrote:
> On Thu, Feb 17, 2022 at 06:44:49PM +0100, Lukasz Maniak wrote:
> > Changes since v4:
> > - Added hello world example for SR-IOV to the docs
> > - Moved AER initialization from nvme_init_ctrl to nvme_init_state
> > - Fixed division by zero issue in calculation of vqfrt and vifrt
> >   capabilities
>=20
>=20
> So do you want to merge it all with nvme bits? which tree is this for?
> Or would you like me to merge the pci bits for now?
> Thanks!
>=20

I was wondering how to approach that as well. I think maybe it could all
go through your tree so the pcie bits doesnt just sit their without
being used by anything? It's up to you, but note that nvme bits are not
fully reviewed yet.

If you are fine with merging the pcie bits then lets do that and we
merge the nvme bits through the nvme tree. The nvme bits is fully acked,
so it will go in, just need to finalize the reviews.

--BX7wJ2TiXsSvUWV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIPXf4ACgkQTeGvMW1P
DelhuQf/QOU3muzUJXLBGCwgDWc+e4TWgOsQUBPW8rAXms8nOqPJPVkMTmZPes2o
sKpXXB7YWiiBW4dJB07D6cJHa1jAYiMU3lZFTK+Bii339nawHQ2YhbkkvQ+VHHTP
NA1xwVYU/dOniXWFP6S+yA27ZI35PPPsUAE8YbTHOnAb/mbIs1RctVXPalca7d4W
tHin8BVHtF2IcRn8Y7Ke+I2mvd5ne1uKt3ctGqfjxrd8z8wdBTTvIdtXve4KozHU
AfAJ4msWYhdXqGSRqtyh4+3UD+KnR+MIjxG/U4bxfJ86xePJgEXju2zl8qZXUZ+R
vtzl5iRkGl4Q3muuBEncUOKCq/fngA==
=JZ4n
-----END PGP SIGNATURE-----

--BX7wJ2TiXsSvUWV7--

