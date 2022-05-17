Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40352A044
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:19:06 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvEG-0008Dl-RD
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nqv1F-0000k5-HL; Tue, 17 May 2022 07:05:39 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nqv11-0004Wq-WB; Tue, 17 May 2022 07:05:36 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1F2395C020D;
 Tue, 17 May 2022 07:05:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 17 May 2022 07:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1652785501; x=1652871901; bh=Zc
 hZar+pVdbXaSk3aYOsTtRUhzVffMJQaTOmlGRfPcE=; b=M0xbcJCWWdyakqP2DY
 BseJeOE7ey+9wzxm9Ap6qVp1MvRwM3w5K4lkha093mN3Dt8KHvkrBtB98x0507vC
 7AXF5K/phEnCmgqCaMabBLLXgiYnoN2E5irm3TRMurvnQfSEdMXLAo3f/4ip7GMp
 ZAMO6cwAqzgkbgjKO49InEbfYxPBSZsRDdr8Cry9HJjqy9lKjk6RGgolF/dakgNb
 R0PiIxwCsPk6W6OQJVaQy8uJx9LZHC0M9dEf8QX2/3TF2AcryvZkzTkKTCsJ+Cj1
 iH8YIJjzXvCRRNiYzkPywvGF9HSCu0NKOC9b7FoNGw6G3CXu9mtN9D6aiPaiXo2L
 GBoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1652785501; x=1652871901; bh=ZchZar+pVdbXaSk3aYOsTtRUhzVf
 fMJQaTOmlGRfPcE=; b=HFjjJ6JoNkKstUgeC8X6dYods9SOUhBKKsrRg/uhzpuo
 OAJwv/YNhAHv8VTJYMwuZEIwbcbdoOwWpgMfrL0sv8Vqagu3xhHXLhGRAxwLxnWv
 Y+FBjLd0jRohUcP/ny+O6cmmWSRZPvLoQ+Xm++jbKznMbJwga6b1nHiytRalyQjC
 Bb762itR+zFB2CWhxSk1kDqoI125rtAQG01nUCmGvtLUocn/13p5PLbU3V8SiqzI
 QFpXJUkebKbP06oqt+Tv6ytU8sZCE4/FkIuPyEotS2c28BFB07yUEz4p9Al1nHpK
 KPSdH0uMqubPBs0L3tGPOr+AKgT4/Fqk24QrEHiWGg==
X-ME-Sender: <xms:XIGDYmOn7F4UlrJs_vBbzhkaER5XoYECPecuPGBOX_Ozu1mp03J4MQ>
 <xme:XIGDYk9TYHptERvTgWBLjIwQIWFG6rCrR4gl87OstAK3YV1xQVZMUPtuHS4lSQ2lA
 MN-TRrwyRGQrSxd1nM>
X-ME-Received: <xmr:XIGDYtTKEOwKju8_i5KBZ1O1OfuCKJIOjfTRxAqhO51ev6O0Uq_kIntb_J06RwcWc-spx6Kakb6UODI7iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheejgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XIGDYmtAtLH4lYRngp1eS11vAKo5V1FeXLs-Bf6gBXeHnd-Jxx4gog>
 <xmx:XIGDYudThwQxHPuZhKCfc2xq8WSR1dnRrufyEY3PtAb7kzGMuOQclg>
 <xmx:XIGDYq3f2q6sXJ8S7_TODHliRKziwZ7xXzmx3LcxBPVu-JVk6_ZV3Q>
 <xmx:XYGDYhuqtTkL6jY0BbfjP_Ag0nrzsHPE9Jv0ZsvAZFONNCgAxQbNZQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 May 2022 07:04:57 -0400 (EDT)
Date: Tue, 17 May 2022 13:04:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, ani@anisinha.ca,
 armbru@redhat.com, f4bug@amsat.org, fam@euphon.net,
 hreitz@redhat.com, imammedo@redhat.com, kbusch@kernel.org,
 k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, stefanha@redhat.com, xypron.glpk@gmx.de
Subject: Re: [PATCH v8 00/12] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YoOBWMmnW2Lc5a+/@apples>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
 <YoJs//DV4ZTW9tDv@pbrzezix-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fj3EwQxDlR7dd2NJ"
Content-Disposition: inline
In-Reply-To: <YoJs//DV4ZTW9tDv@pbrzezix-mobl.ger.corp.intel.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fj3EwQxDlR7dd2NJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 16 17:25, Lukasz Maniak wrote:
> On Mon, May 09, 2022 at 04:16:08PM +0200, Lukasz Maniak wrote:
> > Changes since v7:
> > - Fixed description of hw/acpi: Make the PCI hot-plug aware of SR-IOV
> > - Added description to docs: Add documentation for SR-IOV and
> >   Virtualization Enhancements
> > - Added Reviewed-by and Acked-by tags
> > - Rebased on master
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
> >=20
> >  docs/system/devices/nvme.rst |  82 +++++
> >  hw/acpi/pcihp.c              |   6 +-
> >  hw/nvme/ctrl.c               | 673 ++++++++++++++++++++++++++++++++---
> >  hw/nvme/ns.c                 |   2 +-
> >  hw/nvme/nvme.h               |  55 ++-
> >  hw/nvme/subsys.c             |  75 +++-
> >  hw/nvme/trace-events         |   6 +
> >  include/block/nvme.h         |  65 ++++
> >  include/hw/pci/pci_ids.h     |   1 +
> >  9 files changed, 909 insertions(+), 56 deletions(-)
> >=20
> > --=20
> > 2.25.1
> >=20
>=20
> Hi Klaus,
>=20
> Should we consider this series ready to merge?
>=20

Hi Lukasz and Lukasz :)

Yes, I'm queing this up.

I found a problem when used with SPDK introduced by the "hw/nvme: Add
support for the Virtualization Management command" patch. However, it's
not really a problem in your patch, its related to the general handling
of CSTS and CC in nvme_write_bar(). I'll follow up with a patch on top
of this series and when reviewed, I'll apply this series and that patch
to nvme-next together.

Thanks for following through on this major feature! :)


Klaus

--fj3EwQxDlR7dd2NJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKDgUcACgkQTeGvMW1P
DelmBAf+L0nByn3k8oIX2YfftY5BMd1LEO3J/eUj+X8EYqlCnpfhVoSvrOmnWWYV
0NRmX/fhrPiwPZXhqef9S8H5EmhT+7oZlisH1M+2hqZqgR9bvwp7NpIPSDi+yFzg
3nhHVbysPklQHAF+PlGvfq6gwFvGj6gymORorc/7ZO3kBQDQD9pGYXQYxEs43Dhc
1DoXdRZqQ+CcyVgxPcSoi3QiQ39eYJQL7nnlSVxlPjkmmE8hKCUSlfGgfay+cdQA
dub4hoC3atHClseeTVtxeLX7AGZoAbNBf86K3qoxKupZEQ812DOFNLkHxYgX0rVP
XSfWlYm5pTv4rft0QLyiIgn9GnduHg==
=LLYm
-----END PGP SIGNATURE-----

--fj3EwQxDlR7dd2NJ--

