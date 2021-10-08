Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9844264C2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 08:38:53 +0200 (CEST)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYjWt-0003i0-Tw
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 02:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mYjPl-00065m-6i; Fri, 08 Oct 2021 02:31:29 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mYjPX-0001K1-V7; Fri, 08 Oct 2021 02:31:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E8E135C018A;
 Fri,  8 Oct 2021 02:31:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 Oct 2021 02:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=VgPXHuSptcyQNVRLVYi3xUIqUHM
 /umPRmakYaRObwek=; b=NZjuh4RzYfDCdYKr1BQCK5vt+0uDMd7bRudBlHGZhZI
 P5+eoZ5b+uYQa6JYzo9KhxjEXBTyEWj+98HKbTp7BqtFP3s3Rvqjrj+4fw+yXyMD
 pKvDbyuKMwVkMAimYWpLTdK1/ojx57WdXiIIw0Hg/cRBzu9e8KxmzUKG9lF2U3Cm
 0BhG0DZjdR4SEjeJqU0n5A7usxag+zOxygZXy+79IRh8BRkEwwUzb+GxE8NgWiu7
 vFe5hRv5awptEL9nVG+aWBSOcCzHSXQC+C8UzDq/XVU9ee7unq3EgTqsLuwfVj2k
 +m/PFGqXsFfcH5v/BgYya5O3HJ2i4SjM+JqM1nTFvFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VgPXHu
 SptcyQNVRLVYi3xUIqUHM/umPRmakYaRObwek=; b=cKLJ7+OM8GQoDqTSdpVh/5
 1U9jpGDK8hE/CKZMo2L1t1OMdMyw+5IlkHk6h51fV+di2BUTEBCmMdGjJd/l8CUz
 Ue/IaA/FdyLSlR/NS5ciXM6zPYXLXkt2FoAvBpPte+VdKd/0/b0NmChOt1SoucZ9
 VGsNKGGNdGr2YIFCcjXE3gvFfqsMXzQtU5erx9OzJmIdMIUxFnyJyLOavoUwfbFJ
 D1cegRuPhgaQA14mi+o+nDyjW1dnu3vItDRB7sKDAC1VMBnE3IxBizkAJvtK+sLg
 Jt7WwC5DUALyylcKGs46TSh1aiCsAWd/AjF01i7R4dQ9qrT4SPArIE3YA5f2J/lw
 ==
X-ME-Sender: <xms:quVfYSWV9Or7-JEkaibwXp1ZegEeZtnLMi_ZgCaT-9rJk3parLooSw>
 <xme:quVfYenaNKSnlBr-UdHxJdEjhb8aJZ6-fnAGu5KiOAD3sT9yVJjCMV2PAzjtk8LdM
 Y3MfAPA-_8vzyyRXic>
X-ME-Received: <xmr:quVfYWbjWjsEEYLBbHnALnBbDBqKzIn-VSPCTBE1arWzCnSnvDN8PD0aPojyf_RWzfgxZqo1D9DGAp8bMff2JmRyJsJvc6gqO_ZrJPL8GXMFeXUx-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelledguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeduvdeffffgvdejhfelvedtveegjeetleevieeujeelueeltdeuieeiteej
 vedvnecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:quVfYZXi60jelrFB2P-QMSXsCkVULJ2_PWS0PQFPOZXDmPRNjjOUSw>
 <xmx:quVfYckboU2p5VywnX5BDm8PyHufUSZvnyespbVEF5spnuHCR1eqdg>
 <xmx:quVfYecGwjjQtZkdL10je_zN6wUlyHgEI_c-qpt1vtHtpeeZYW34ug>
 <xmx:quVfYdDVehtS6G2NRv7-tivwt4Ct46LsDtuN_Tmz2uKlBSsWHAvNhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 02:31:05 -0400 (EDT)
Date: Fri, 8 Oct 2021 08:31:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YV/lp90mWdRiaO+7@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ltpQrN6on8nTVAi6"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
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
Cc: kbusch@kernel.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ltpQrN6on8nTVAi6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:23, Lukasz Maniak wrote:
> Hi,
>=20
> This series of patches is an attempt to add support for the following
> sections of NVMe specification revision 1.4:
>=20
> 8.5 Virtualization Enhancements (Optional)
>     8.5.1 VQ Resource Definition
>     8.5.2 VI Resource Definition
>     8.5.3 Secondary Controller States and Resource Configuration
>     8.5.4 Single Root I/O Virtualization and Sharing (SR-IOV)
>=20
> The NVMe controller's Single Root I/O Virtualization and Sharing
> implementation is based on patches introducing SR-IOV support for PCI
> Express proposed by Knut Omang:
> https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05155.html
>=20
> However, based on what I was able to find historically, Knut's patches
> have not yet been pulled into QEMU due to no example of a working device
> up to this point:
> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg02722.html
>=20
> In terms of design, the Physical Function controller and the Virtual
> Function controllers are almost independent, with few exceptions:
> PF handles flexible resource allocation for all its children (VFs have
> read-only access to this data), and reset (PF explicitly calls it on VFs).
> Since the MMIO access is serialized, no extra precautions are required
> to handle concurrent resets, as well as the secondary controller state
> access doesn't need to be atomic.
>=20
> A controller with full SR-IOV support must be capable of handling the
> Namespace Management command. As there is a pending review with this
> functionality, this patch list is not duplicating efforts.
> Yet, NS management patches are not required to test the SR-IOV support.
>=20
> We tested the patches on Ubuntu 20.04.3 LTS with kernel 5.4.0. We have
> hit various issues with NVMe CLI (list and virt-mgmt commands) between
> releases from version 1.09 to master, thus we chose this golden NVMe CLI
> hash for testing: a50a0c1.
>=20
> The implementation is not 100% finished and certainly not bug free,
> since we are already aware of some issues e.g. interaction with
> namespaces related to AER, or unexpected (?) kernel behavior in more
> complex reset scenarios. However, our SR-IOV implementation is already
> able to support typical SR-IOV use cases, so we believe the patches are
> ready to share with the community.
>=20
> Hope you find some time to review the work we did, and share your
> thoughts.
>=20
> Kind regards,
> Lukasz
>=20

Hi all,

This is super interesting. I was looking at Knut's patches the other day
and considered hw/nvme to be an ideal candidate as the device to
implement it. And then this shows up with perfect timing! :)

I'll need to set aside some time to go through this, but I should have
comments for your by the end of next week :)


Thanks!

--ltpQrN6on8nTVAi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFf5aMACgkQTeGvMW1P
DekI0wgAsKZNyH1k55T2MtbkyqLnOELXjHJ0YoSETj3zaC94TSgiTgHKaJHbiQL/
yBIrD4J0l64l5W2dKOKWfJD4labCe3RJEBYhfuUEiHPLvSQAHzZSQI1omIX07gt0
B3IIOpWVNV5mYpis9anF3C91ZR+g2PhhswFofrHl6nuKtySLzLuq03OElwNbQAqn
3hfC4GTf5uFpJfllTPgOv/cyDkZASOc9CTrQQKoFvulpFKQCdYpvJ4oUmP1SJcNw
g2HJyxVtR4c/3EYeo8Fo4z4QcA4+Eo3ueNriSf978z8l2N5NHA6LtIkZsDualIGu
P1ELY8BsTjOpRGSS61l/DXEuyqk7Mw==
=OpkS
-----END PGP SIGNATURE-----

--ltpQrN6on8nTVAi6--

