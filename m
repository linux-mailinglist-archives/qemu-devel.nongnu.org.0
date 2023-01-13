Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2166977F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 13:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJJq-0000Tm-MI; Fri, 13 Jan 2023 07:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGJJo-0000T6-LO; Fri, 13 Jan 2023 07:38:00 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGJJm-000636-8g; Fri, 13 Jan 2023 07:38:00 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CA0905C0051;
 Fri, 13 Jan 2023 07:37:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 13 Jan 2023 07:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673613476; x=1673699876; bh=Aw
 x3Ut4SGrw2bnO5rBD9JVRTiduH9lOsI4n2DNZJjiY=; b=pzf6qZ5WJy6E/jZdLV
 hW89Etprgi/KATrVuP9CX9/0v1eAqhh6sjxH7EYrLv22gqWrff0aU3XhyA128FD+
 yH5DKjMTaoCZq0icpfLrdnYZ2SfU38X3KOSeUdpHROPaARt+R+FZIz19tk+kHdgb
 sEV0qTcNlHOH7Z1xWbz42xGZ/QVMkDVRqmOGHSFgTXdQkdyzxCJmXslSkfdl0950
 Hy9fEYfzo8nxABEG2zdWx41FKXLasMU2wr6soGt/2q4+f1v1dS82mfeBsgFm1r4s
 LrglR6N8iKz8KSn22tadES7jVVaLKtXpE8vd9YJUr6cXzw28GP+G8cEeCI6/BrNU
 E3/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673613476; x=1673699876; bh=Awx3Ut4SGrw2bnO5rBD9JVRTiduH
 9lOsI4n2DNZJjiY=; b=SqyNWkn9Hz2NFKfM4TOi9SHK7qlvTVQePBqztIvYJrQP
 9lr+VcXBkbI1VQcHkViRCOkbOpzRd9sC0XM7k9FqLMf42Dl89+yijg2goDDCsTnx
 Cpy+NX0iXIsRVAcncrw9qi6PxXpJKgbQPq28QjtGhQbuX/e/wkMZpYazFEN6Jt22
 unuwlWNWq+Uu8JxKZ3tABaM9cBfecn8umIaGXc34pRdGO7kVoFRfjeAOp9wWrO8l
 JJNnrlMeN4c0ev66/5kXDwngnIBHj/rTMrlT7teFqV+eeexEZo8b23A6avulNYff
 ZUHSgCQzUmckV6czHZIG2MiP0uCOg0SXx8PCajDQ6w==
X-ME-Sender: <xms:pFDBYx426R14IP99QGNVluGi6sVTZ8A_5SWUIrpWkFlt4inwPvUIgQ>
 <xme:pFDBY-4aiXLHpOjqXQi0C11OYCcQIlYoxLqtw5dBHRDm82DPtob4q9rf362DQGS30
 VsNVZnqxDzsE1a_Bu4>
X-ME-Received: <xmr:pFDBY4ejWiEaa_AFp6O_D01XdDcj1HoVHbZWdK30-wppD5JzlL1hTS8SWSVvwYq91V792vxwNov4UphqCsjrIpnj60M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleekgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pFDBY6JW2rlDLQQQ6kVv8xKyZYbGm3N43IyIMWhUT9e4PbCU46MLQA>
 <xmx:pFDBY1IzaOGEgPfVl-6UPMVdC8cus6RsceYCRNBfGp2zAwuuMRCY0Q>
 <xmx:pFDBYzwi-IMbzT3aPlHs3F-hdnLP5itxE4M1J0zo_j3hS4sv_qlo0A>
 <xmx:pFDBYyA-ap3bQl1OyxwVZzA5jpWPsBINJBkh5yAjd-g5EHZMvAHdhg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 07:37:53 -0500 (EST)
Date: Fri, 13 Jan 2023 13:37:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8FQnsxSwcTUYqYm@cormorant.local>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8EcOFE52X5KbzO7@cormorant.local>
 <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GDbzrrQ6Xxiht77F"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9y0E=EZwmetyvymvt64BpQxAnKMHs0E=BBH9_3OfMwFA@mail.gmail.com>
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


--GDbzrrQ6Xxiht77F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 13 12:32, Peter Maydell wrote:
> On Fri, 13 Jan 2023 at 08:55, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > +CC qemu pci maintainers
> >
> > Michael, Marcel,
> >
> > Do you have any comments on this thread? As you can see one solution is
> > to simply deassert prior to asserting, the other is to reintroduce a
> > pci_irq_pulse(). Both seem to solve the issue.
>=20
> Both seem to be missing any analysis of "this is what is
> happening, this is where we differ from hardware, this
> is why this is the correct fix". We shouldn't put in
> random "this seems to happen to cause the guest to boot"
> fixes, please.
>=20

No, I'd like to get to the bottom of this, which is why I'm reaching out
to the pci maintainers to get an idea about if this is a general/known
issue with pin based interrupts on pci.

There are a fair amount of uses of pci_irq_pulse() still left in the
tree.

--GDbzrrQ6Xxiht77F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPBUJ4ACgkQTeGvMW1P
Dek3xwf/arpcGt6Lgj2IiknKb/+M7NYjx9H90bEk28jB0sZ4MCcsOt6Ltl3CxmIf
kImorYKhR3/Pr+jjNlMrI7b92uA1UXxSQVIMFuXioj79dS/Vk/NSnytb4Z7rGnOB
Kxk/ePDY+bVXxS65wRay05g+f6dbxYkxYies4QZqqvQ6GCKzJAI7NLGgK46koFSz
nwj4phUhunGlyTiOEWd4KyJQMtiaMvf8rj01VVQ0/a8o9yxaQN/PUHm/dO/R+Cpy
PsFsmnChtMh5UfByRnm4BF0B7dk7Bjmr7mBNP2/3PBFQgPl9hBO09hsw2QFUy+yp
vy3YwNuajIPJT8a/qorlYehyJXXV+A==
=WpH1
-----END PGP SIGNATURE-----

--GDbzrrQ6Xxiht77F--

