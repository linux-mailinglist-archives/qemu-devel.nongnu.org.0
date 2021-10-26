Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85343B9BD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:39:56 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRMY-0006IP-RZ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mfR3e-0008Ea-Hy; Tue, 26 Oct 2021 14:20:25 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mfR3a-0005oS-NA; Tue, 26 Oct 2021 14:20:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B9D6B5C021D;
 Tue, 26 Oct 2021 14:20:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Oct 2021 14:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=T0k5ft5HLXAwQ9NnVCzLOO2Tvw0
 +vMQUlMx7MPzYJ0g=; b=WnPLyUr/1YzBaYr8tLqb6DVLwOsa/AITSq4OIK8qvYd
 InHQVA0KueOUW17T0L1klR4DAC/Nz5n4Ejm/FQO+duKRXgt2WK8u2Vd+8OO8EgIq
 gmgtO3eAg6FGeEWmCJICPkh2Lt6TRBiICa+tld3KCPXAxVn1hFLjwLYZ9PIsyYiB
 Dyvt2Hhd3xkWB3v5bMDUrmJZjxqayo6eN0Da5vQof6H9XE3p/mSbzqVaseY83GC7
 WxsXFxMYr/4ckoaHj31r41bSVoj+RjHA1uLBnChxiV4VL3weFzGqpw8g0+E/N4H2
 8zWu7OXIDTs4OO1o5r24dTSp/BYUm8E0hXtdyKV8usQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=T0k5ft
 5HLXAwQ9NnVCzLOO2Tvw0+vMQUlMx7MPzYJ0g=; b=GMcwt8tfLJ/39jiX72YqcZ
 jd/Id/xr+VqqPcGdDTFh/ErezislfaKC9KJHFVGbyqw0HlaZkYZI62bEtFExE+IC
 KrlWvpIlASqTe18Dx7UAjMY2Yo17D2FNY935nuFV+mA4utbX8aULKxq27GbfVBTt
 MmNRmizy2J5l4eqzqONSPEgUzs7yuCnPi9jumtHzQrNluGJ2IO9FixYjYqU2iPy/
 VnDsWsNxEaV4BFjsH/vOBaboNiFzZ94yKAZ+CeVsq1VaLHw8iNQZcjX/yylz9p9U
 5NalQXT4MUOGVMr/kfCJe8/96DDBwcmYVw4DEDuFSt7oBDspK1+8YoHgsserTsuw
 ==
X-ME-Sender: <xms:3kZ4Ycw8BjQnbhETD510TW0Udk7Je23pk2oGrRkQdzLq_Da93D76oQ>
 <xme:3kZ4YQRHTf3wz4LrutCEoiZgIAogrtFc4b3iZhFT1B_FJFdJI1GgbPmABuvBN0ayf
 oC1j4n7c94C-A1ysQ8>
X-ME-Received: <xmr:3kZ4YeUsxS7_-sH1OMg15liM8VpQSLL6BfG_tRObUF_gJX4j0qKHXYQUmR-z_x9EXqvwrlLYloUtfR1qqveecQWBxcGLqc4OnWW7m8y7HOg1YeC_6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefkedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejuddvfeffgfdvjefhleevtdevgeejteelveeiueejleeuledtueeiieetjeev
 vdenucffohhmrghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3kZ4YahHSU5CIFvV8JpFVDp7tahxGJzj9yDyeK-TiMAZayU9zFgWgQ>
 <xmx:3kZ4YeA2uCbou0QEgBZG2UjXozQkQeo5J1TG6y5N4Zq0VaL76nf0PQ>
 <xmx:3kZ4YbI5I1VoW516q0M7cgKgpRzVmvI2wLNIpxO_m7BIeNVeq0VEBw>
 <xmx:30Z4YZNjwqRRIeJ2JODyB-x09SAiD_2LSJynjsH4mP39A_82j7JD9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Oct 2021 14:20:13 -0400 (EDT)
Date: Tue, 26 Oct 2021 20:20:12 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YXhG3L+brG0q6o/2@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="keEPMuyC0/cxUS4B"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--keEPMuyC0/cxUS4B
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

Hi Lukasz,

If possible, can you share a brief guide on testing this? I keep hitting
an assert

  qemu-system-x86_64: ../hw/pci/pci.c:1215: pci_register_bar: Assertion `!p=
ci_is_vf(pci_dev)' failed.

when I try to modify sriov_numvfs. This should be fixed anyway, but I
might be doing something wrong in the first place.

--keEPMuyC0/cxUS4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmF4RtgACgkQTeGvMW1P
DenLlAf9Hyzqcq5TLQrjiFpDPIWsch2MwIw/PVExwc+PppCUvTGGv6zWh4i8oG2y
YN2bjOJ9muAdXfOGaYhj3lCZhlklz35YS49ulKKiT3SqNfTOvRMSEzqQ+tLNljo0
zrxXTTj7F9AW6ksSWmrauI9kaM69tAgCvDDd24Yvd9AHYShwtKnv7MXw5ldeVsgS
MWWaoencq6JUNM7OgxbGqEyjInPpqc63tGadpJbm0rzIVV9QlN7/y9UpFtXefNY/
UhlpZFeUbJUGrgBve/6iXaDAz2SOZaHXTx5sbLhJ50yLiXSWfnQ3arnS/iGRCtaM
mrkf8QI1Y2C+BYYA56VE90HejWUS5A==
=/YkO
-----END PGP SIGNATURE-----

--keEPMuyC0/cxUS4B--

