Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5062CCE3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 22:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovQ8u-00031g-0H; Wed, 16 Nov 2022 16:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ovQ8q-00031S-Me
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 16:40:20 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ovQ8i-00008p-D5
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 16:40:20 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE3CD5C01F3;
 Wed, 16 Nov 2022 16:40:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Nov 2022 16:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1668634808; x=
 1668721208; bh=79ymK68beQa1zK3znI/v+JsysT5CmM/aDYWh63Kes/Y=; b=k
 4ti1iaeVYjYjuhHhZPofLTGWtawGjZuRyt7PNO4RR9xygMfmad9gvPj5SPMtxbaT
 JcB3GcfEWl5XTPiav65bg+qjCx5r6auFTfdDw5+uXhDOeTsvnTVwGKwU9q8AT1Ea
 XpNsPzD/zbhM3XYsgT046QwVNEdxewkMlEXhrq6s6sQB0NuEcU4ARXJhSILL6ztk
 eo74yOU3NYLPybAiJmq9LqA+xF5i8wQtH9lwYkb6yUYjjq+9v9KqEGIHMSRSLUxw
 zr07a9iYTdSVdfqwC0SyV9rke1ZilcMgtTXrs16+MmzUlEy75g8O0/a5Aw758c6L
 ZcM1nMUXwU+yW2GL68RPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668634808; x=1668721208; bh=79ymK68beQa1zK3znI/v+JsysT5C
 mM/aDYWh63Kes/Y=; b=X6rOSiE+RkQHmcK9nrlMTCoDlA0yXXFgVzw3CsfeMfk1
 CMv+cioEgXjGTiq/gHKJn2H2Q4K/6Doxkb++G8JfdRUTWsMESQY0UpMZ+EeHwrSr
 DilplfZRAOIsXbwVLUN6Q9LfmQdJsMO0i5jUYeqSJiwPu35lZa9EkJ7dygMd8wqA
 o/wpIkTTJwEXR0QLFzuITr7iOxoN7Jy6smMSro5NrdmWMqw3or9F0Vl1BUQhzb70
 cjYpgVuR78Rf0Vs+6jW4Ofg/R9mRoWjyQov4qzQrOXgE/hcYyuJzhoHPqZXCvOZW
 +3iP0IrOUZfIhghLRNms+Odlplpz9IAY0g9Hn1hDfw==
X-ME-Sender: <xms:uFh1Y315j3tqr7CmtC8HqvSFrwu4ap79vF9sTSdywvREkTfQtUiTKQ>
 <xme:uFh1Y2EkbzCliM4wb1_VJAHtADQPU4mcPER-OOdnNf5dlM-r90GKennlsbVuAEbru
 95OchW0MIqj4w>
X-ME-Received: <xmr:uFh1Y377zRhQmLsYXmXQQfLUU-ohAKIRCMsZ2STNZWME410MTkF-sMMGUA3_hHe0fW7zqeNBfk8K9v7y6DTXbmke7C0ldJAfKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
 teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:uFh1Y820sgCTrcNEbuVX10-5YyO5uqPacT1LnYtZF5GBUqBapbGfzQ>
 <xmx:uFh1Y6HtxolulhVOcZ9S13OCyJjpeShqzN9fnbqbiWsypoD1neY8yg>
 <xmx:uFh1Y99vhJLdfRqNw8Czc6ybnaNn8Eu56QaGxEbgTZCTljPEDZhVdA>
 <xmx:uFh1Y2BScbZbWS0cCfBhYS6UyEX9_YNqmr3LP2rt6o2wlF00qpdmQA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 16:40:07 -0500 (EST)
Date: Wed, 16 Nov 2022 22:40:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Message-ID: <Y3VYs/sS4VddrBCK@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pdecqJYtKVupcCRx"
Content-Disposition: inline
In-Reply-To: <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
Received-SPF: none client-ip=66.111.4.25;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_NONE=0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


--pdecqJYtKVupcCRx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Nov 2022 22:40:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Wed, Nov 16, 2022 at 02:15:22PM -0500, Jason Andryuk wrote:
> On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > The /dev/mem is used for two purposes:
> >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> >  - reading Pending Bit Array (PBA)
> >
> > The first one was originally done because when Xen did not send all
> > vector ctrl writes to the device model, so QEMU might have outdated old
> > register value. This has been changed in Xen, so QEMU can now use its
> > cached value of the register instead.
> >
> > The Pending Bit Array (PBA) handling is for the case where it lives on
> > the same page as the MSI-X table itself. Xen has been extended to handle
> > this case too (as well as other registers that may live on those pages),
> > so QEMU handling is not necessary anymore.
> >
> > Removing /dev/mem access is useful to work within stubdomain, and
> > necessary when dom0 kernel runs in lockdown mode.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
> little test.  When pci_permissive=3D0, iwlwifi fails to load its
> firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (I
> previously included your libxl allow_interrupt_control patch - that
> seemed to get regular MSIs working prior to the MSI-X patches.)  I
> also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
> I am testing with Linux 5.4.y, so that could be another factor.

Can you confirm the allow_interrupt_control is set by libxl? Also,
vanilla 5.4 doesn't have the allow_interrupt_control patch at all, and you
may have an earlier version that had "allow_msi_enable" as the sysfs
file name.

> One strange thing is the lspci output.  Dom0 shows MSI-X enabled.
> Meanwhile NDVM (sys-net) does not show the MSI-X capability.  If you
> `hexdump -C /sys/bus/pci/devices/$dev/config` you can see MSI-X
> enabled, but you also see that the MSI capability has 00 as the next
> pointer, so lspci stops parsing.

This 00 value is written by Linux[1] (sic!) and then qemu incorrectly
allowing the write and happily emulating that zero. The other qemu patch
in this series ought to fix that (as in: properly refuse the write), do
you have it included?

[1] https://github.com/torvalds/linux/blob/master/drivers/net/wireless/inte=
l/iwlwifi/pcie/drv.c#L1721

> MSI cap stubdom:
> 00000040  10 00 92 00 c0 0e 00 00  10 0c 10 00 00 00 00 00  |............=
=2E...|
> 0x41 -> next 0x00
> MSI cap dom0:
> 00000040  10 80 92 00 c0 0e 00 10  10 0c 10 00 00 00 00 00  |............=
=2E...|
> 0x41 -> next 0x80
>=20
> MSI-X:
> 00000080  11 00 0f 80 00 20 00 00  00 30 00 00 00 00 00 00
>=20
> AFAIU, the value 0x80 at offset 0x83 is MSI-X Enabled.
>=20
> I had a boot where assignment failed with the hypervisor printing:
> d12: assign (0000:00:14.3) failed (-16)
> Rebooting the laptop seemed to clear that.

Zombie of previous domain? Not set as "assignable" first?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--pdecqJYtKVupcCRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN1WLIACgkQ24/THMrX
1yxXpQf/Tpxw6IVza7ILJAFIjQbfpFFDHNbiSAVS03xF88K3crKqKmPaJ+fKvBSZ
ntFetwY/Paz4/V3dFWv7ly5f6K3E1K4B0kYlBoYBCmZwv5NW8G+CYfOigr2J9mQn
9nYW0Dsn0UXVZklEUey6J/UA7C7byU6lKuVSseXfj8BpkH8+9fZMPKvokLEiszol
NLBpy2k11M7JFdlILZ4JhcTdZPhnN6Etr41jjud1hg2boPxfIdwH3FtAx33fkda5
3Y/BTMd8m4nigEiLBDwFIjJnuPwrF5ST2dGU2qWZEN8hen6QJ+2NGgRCMSk4ZVmW
VT+8gJzGM2n5XXi7T1oVqvGoXysnVw==
=cMsU
-----END PGP SIGNATURE-----

--pdecqJYtKVupcCRx--

