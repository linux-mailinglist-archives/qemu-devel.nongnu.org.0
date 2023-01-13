Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DAE6697B2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 13:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJSD-0004XI-CL; Fri, 13 Jan 2023 07:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGJSA-0004Wb-N1; Fri, 13 Jan 2023 07:46:38 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGJS8-00083S-Rz; Fri, 13 Jan 2023 07:46:38 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 35AA65C0078;
 Fri, 13 Jan 2023 07:46:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 13 Jan 2023 07:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673613992; x=1673700392; bh=T2
 +jeNTi2tAEJP0ezy+QLAeMKjlI4HTH6qEscg7aEgQ=; b=s42IgY6JfW+WhP0xx4
 eAL1G5Wc12hE601mzEYcGmcMZLblfv/OsvLNqJSHA2rnTU07DSIS5r5gjLvlKl6D
 sV5X6bBNa9irHTvGQvKMolIo4zaSYAhM+vl1Ah/YxlgMNUYCAkNv0JJx54+J4gns
 aK6+c/I+kYn+KxyVNaZaFBlBZXlB5v5I4idpQIy8PLuMuYnk/knSNDsZraNlFmto
 G4smkATVwgQaipDRBdCjPQD/8XHA8lCEWkyKeoA7c4/degJxEMWUEV61ud7vWfDF
 0AXgoPPTCsGjISLPsJzS5RsbGZfsolLPpOPRIFCc58NM9V9vQUh+qcJl4hJGAVFe
 /vEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673613992; x=1673700392; bh=T2+jeNTi2tAEJP0ezy+QLAeMKjlI
 4HTH6qEscg7aEgQ=; b=Oqm1WcB7G3XFjDu4k4YsTvJslMH1tcxMjPAGl+ELxoBO
 EBELRDcQQ81oRJ+yX9lMIuVQtJpsz6OcvVnkgMJYUJ2himZPfcmmH0xaduxNeotP
 I8N6J7/5m2K+bV3ZAST1df1i3NTk+zZ6hVrFQ7fuz0+mBdNWNRplXdOKgPPdXOiA
 7rQ9+8d7zIL+Bz4SJPcWOY6wq98pcvkrc/ENJiJR+MBcnFsaWXFHK9p85cUNQaiC
 ZgIPzol2Nmff5uUqDPRqG6fSMVkYAvVS9gHgpZUVIeH20G7M9L6fSxn2BbMxmQYS
 oic/9U/IFSmpdNAeiaEm0jovQsB4iHlEuj5mPXFubw==
X-ME-Sender: <xms:plLBYzDFd9u1p9I1_bjN5ylzDxff1dv9u4w7VCGd0EUHy4Ly8weOzA>
 <xme:plLBY5gxXr1nEqLpoTInZ3e1leUOmKXyGg4QLqLBQ63l0RAYxTVr8hYpWaWMYbmNr
 WxRhGoFCEBulH90WqI>
X-ME-Received: <xmr:plLBY-kFKsH8tUY6cVZU8zGAlofURpivpfEhPooeRNU5bRdJAkcVRIac2ltzsgovcCm53mN1Jmsec2BGVB7r_1TgBGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:plLBY1xG48X6O35ozinZ6QGYEZ9ZhVxjb4a7ItlCR-Qh237hKdlD4w>
 <xmx:plLBY4RhD1RUUe-MMRCybMe06T3K-yeczEx32zhukLb9umBmTp6_ZQ>
 <xmx:plLBY4a5v3rlszjRuw-394xaOi6b1UF0aU4llDkKXUmEpk79g4Vx6g>
 <xmx:qFLBY9Jc4bbH5u6VKiHMjKNRT2g_a9Bl8TZ7VqQIdV4qQfe-D69zeQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 07:46:28 -0500 (EST)
Date: Fri, 13 Jan 2023 13:46:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8FSoppe0d6w9waL@cormorant.local>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8EcOFE52X5KbzO7@cormorant.local>
 <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
 <Y8FQnsxSwcTUYqYm@cormorant.local>
 <CAFEAcA9H4bYfqmt2w_xSXS_uX9z-6NCRqdsn3tDz6h-v39cGKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gTT12bfSOS/S2v76"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9H4bYfqmt2w_xSXS_uX9z-6NCRqdsn3tDz6h-v39cGKw@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--gTT12bfSOS/S2v76
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 13 12:42, Peter Maydell wrote:
> On Fri, 13 Jan 2023 at 12:37, Klaus Jensen <its@irrelevant.dk> wrote:
> > There are a fair amount of uses of pci_irq_pulse() still left in the
> > tree.
>=20
> Are there? I feel like I'm missing something here:
> $ git grep pci_irq_pulse
> include/hw/pci/pci.h:static inline void pci_irq_pulse(PCIDevice *pci_dev)
> $
>=20
> ...looks at first sight like an unused function we could delete.
>=20

Oh! My mistake! I grepped for irq_pulse which matched qemu_irq_pulse(),
doh.

--gTT12bfSOS/S2v76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPBUqIACgkQTeGvMW1P
DemLRAf8CLgdAVSE5g3v6JPkz8a/gQiA+0JeuV28TN9fGWHMWFBZ2NDz34UoydU0
hzEStv4+jP+JHuCR0arwI8KUtKM+aatO14udXLBgae8EWg9J/cnAG5jrzXYnef6x
Fv27SGSqkN8iw0YMQoEFfu+BMzHjJ9pfvQIxjbnAToZXWDjGt6hR4KoyorH3G3hU
PEKZcwBCSb012o3jBPi6hyeS1znZWkvQWkEPloIUppL2du901lo/hAqKfPAi2wt0
VW3b/JAtHoP+zgs1mk2I2b28wGHJMPEsPu95QZ89xMn7jgHYGWCBE1o01BwGxkRL
uSs/pqWli1dNRH4SS1RpwthybVBVwQ==
=B73A
-----END PGP SIGNATURE-----

--gTT12bfSOS/S2v76--

