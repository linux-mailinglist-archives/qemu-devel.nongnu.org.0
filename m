Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E87508827
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:31:15 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9UH-0003Qd-TS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh9Cs-0001zd-Sg; Wed, 20 Apr 2022 08:13:14 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh9Co-00073z-Ta; Wed, 20 Apr 2022 08:13:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6AA7032020E4;
 Wed, 20 Apr 2022 08:13:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 20 Apr 2022 08:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650456783; x=1650543183; bh=9/
 t/R/rV+wKzHLU+nBIAhOUHibrklDu6mF2g3ql39fw=; b=oi7C8JlnTWc5sutIME
 nJqupOlRn3rLsA04+/7s02FuPClG7K/7w2hMFKX0Nx+a2k0QNS6Z03gx724cXyho
 FfSWvcK46pSiVbk2HQdjZAQlN6Y6S9+KrNFoyuuM7p1Pc00yPb688Po95EOhVVva
 ZRezzBcbw8mt1MmRS7ny66S6pXCPNp0r0JJuq+fmJ0KxVhlSkQ7+ab22YAfW5OdL
 erGid9jILFPZATFvqZefX+9oSuQEpit4gCdZ/lUfixpU2fHw1FbNxGsKvTrzz5Pr
 sE4QvyeJA1SL+bSeP0dVePXUzpn7Xt59TKOxuaHVaw7HZuQec/ZPwvCb47FcWJ80
 Uccg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650456783; x=
 1650543183; bh=9/t/R/rV+wKzHLU+nBIAhOUHibrklDu6mF2g3ql39fw=; b=E
 /95bL4KVRLVaT7br8tJRnWuJR+0wz1z2pcUrjxHWnaHbs9uINrFqqfXuxh9MCW8x
 1KwrvyUH4F+5PDqkpvPDhRXuah4nBKxBxYgbM1wV4EYCnaK7chGcEKJNVTA7LGSC
 ip1Xn2seUKSnS5bXKBZRP6ca6H6lMDHBfjHG4vlZh4lC+eLNtgcHQlXfeLp4fPuP
 c18kwdJXQslFs3wW5ZXhV2BYvU2mk8ro8OG0ufXvRtbcvbpxTMSXpNx5P6UbIuXZ
 H4/HzRb667YEP01mPMbgc+6bioujox7qzzbbthluE4h3og4+UZfG4DgDfqpmjufJ
 QEdlA69jtfN8T8SQNtnAQ==
X-ME-Sender: <xms:z_hfYt0ywbl_aaVvgPttORzjFb8_c2pm4pI02AmteslNgbRG7fRskA>
 <xme:z_hfYkFSp3y6rdwX9jPf0vxrWynbURkB0iH1NY_sdCjCOmKx5VUMkQTma3bE6RsSL
 0oUeqLjfqrwqgBIXp0>
X-ME-Received: <xmr:z_hfYt7DcJBYyTv77o-j66JcD1j1AAm-qComw8WQDbkGzG0WuUz597zBzrZ5daMN1T-I6vt7TyrMNoqtnXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:z_hfYq1FiCkYGXlqb5d32HtvGEMhDLjI3WFtgs5zomuKs2i7L-voHg>
 <xmx:z_hfYgHdXptHU5d_W5_ZMzbtW2StolejE9R4VPncf4e9Ue1lTeVS7g>
 <xmx:z_hfYr-bxX314W9UlaBJ_6SfDcazEiXQBtO2JUTR55UGjEOW3F8PJw>
 <xmx:z_hfYuWg8HdmA6aKsJ2SFxuG3u63Gr7yvkE_S4Tnoanzu3r0t6vDDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 08:13:00 -0400 (EDT)
Date: Wed, 20 Apr 2022 14:12:58 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v7 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <Yl/4yp61szG1kqeZ@apples>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220420080053-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dcTfLPropF+Nlr/6"
Content-Disposition: inline
In-Reply-To: <20220420080053-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, stefanha@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, k.jensen@samsung.com,
 armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org, hreitz@redhat.com,
 xypron.glpk@gmx.de, lukasz.gieryk@linux.intel.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dcTfLPropF+Nlr/6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 08:02, Michael S. Tsirkin wrote:
> On Fri, Mar 18, 2022 at 08:18:07PM +0100, Lukasz Maniak wrote:
> > Resubmitting v6 as v7 since Patchew got lost with my sophisticated CC of
> > all maintainers just for the cover letter.
> >=20
> > Changes since v5:
> > - Fixed PCI hotplug issue related to deleting VF twice
> > - Corrected error messages for SR-IOV parameters
> > - Rebased on master, patches for PCI got pulled into the tree
> > - Added Reviewed-by labels
> >=20
> > Lukasz Maniak (4):
> >   hw/nvme: Add support for SR-IOV
> >   hw/nvme: Add support for Primary Controller Capabilities
> >   hw/nvme: Add support for Secondary Controller List
> >   docs: Add documentation for SR-IOV and Virtualization Enhancements
> >=20
> > =C5=81ukasz Gieryk (8):
> >   hw/nvme: Implement the Function Level Reset
> >   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
> >   hw/nvme: Remove reg_size variable and update BAR0 size calculation
> >   hw/nvme: Calculate BAR attributes in a function
> >   hw/nvme: Initialize capability structures for primary/secondary
> >     controllers
> >   hw/nvme: Add support for the Virtualization Management command
> >   hw/nvme: Update the initalization place for the AER queue
> >   hw/acpi: Make the PCI hot-plug aware of SR-IOV
>=20
> the right people to review and merge this would be storage/nvme
> maintainers.
> I did take a quick look though.
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20

Was waiting for a review on the acpi stuff. Thanks! :)

--dcTfLPropF+Nlr/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJf+MgACgkQTeGvMW1P
DellhQgAoTi7iiJ0f/cggPHW4xmczhtVU0rlbcSXPiixqoxMA2xrBU3y/JdDEu5A
T7OYeplZQ8VGa/+tTgBvzUc1+6+6KqfOOXtoJ1n38D2V7qeFHrdnpxkXkfh7cJZ+
Lr2YB6nP3lnRX4kJCOm1TGyMQdJjfkGfwSYt4hwXZUuHrEw90Crx6UEFfcuGF1kd
mtpoy494PdM61DxXehDJFiqwV4C27IfPgHxKHAZ7l0jXg6bnKcVv28QFX9EBZ/iM
b69HiwH1raZV0KwhyDfieIm+lHjsqxGVBzSwW84ZsEr/mrWAyzY1z6lnjUaHU2sH
SvALnjQQ7cagGt+WrXvh5Ql6VDi2+g==
=fz38
-----END PGP SIGNATURE-----

--dcTfLPropF+Nlr/6--

