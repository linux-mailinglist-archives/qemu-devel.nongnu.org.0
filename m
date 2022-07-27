Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC2582114
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:28:28 +0200 (CEST)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbT1-0002EB-52
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGbJR-0002G8-9v
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:18:33 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGbJP-0007vb-Au
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:18:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BCA85C0091;
 Wed, 27 Jul 2022 03:18:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Jul 2022 03:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658906309; x=1658992709; bh=4W
 ai1eB/i3xNCiLS/RELICSxowQ6QleCAfk+lAZ00+Y=; b=TGr2N9cnbblBCK427y
 UN4/DmXkCC/RLP9C9uQKN9cTTL4OwxCh89x/Bf1LWukt2zrGvh9ICu6KFCdIothc
 BlMVqsATX5R/Ve4k6deHZlNkkXaYe4QHaF1QcYREqXdSpIYg1Y8BT2BcWeIlHJls
 iJgU5pMAftk/IgQxpRCW5wR5SnMTgmX9LzR9cIzGEtssrPn8mYgSKEJ53U1dX2z6
 5FSCrHHHKuK39uG7hTZt5MQY8p2vx+V/oXlTBkNUgUsMd5JPFzT7uvFpLw5eqpeU
 wCSWsAKlLTCK2258JJCvlKY3098C2aPQWhxzQ0s83pOzIckQp2882Z2ERXU0rbOe
 EyGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658906309; x=1658992709; bh=4Wai1eB/i3xNCiLS/RELICSxowQ6
 QleCAfk+lAZ00+Y=; b=e7I5lNv7XtHMjNF+hbEceNFV/RE6urZ8uYIZqMoGHFQn
 Vcszz0l9fqCsacVEqzKn+GuHzw1BpvplPRJwtN1d6TGkmjB67NEprbtN5JZxQUSY
 uHTtgspyFX6DtA+GVlhzFGdLVu0xmbqdc0tTZ+e+uUGtMPB2n6+VvpRHquDkv4A7
 lE2xKul+s201z/++4DQaiYh0wTfQU3uaQHLH9hWNXVowSTp5D9GffJxoPDtjVbi5
 JrpBZA9IMG2OrbNwfyBHMjU4crDEL8D3Izepo27JMr25QTgSqnjRFZEQtiSX18UO
 w0oESsKXWXD1kAXw885fnDXa5KNyY8UIcOkuqcXqcA==
X-ME-Sender: <xms:xebgYlxf7Qcqn2GWbMjf-xDBj3IRmWtLQPiG7tS8xNclDxdvdyiyow>
 <xme:xebgYlRehJzhtmy8Uguc0sW_6R2MUydRTlxuBl3eix_kdSEJB0n4l9Mby8uB3ubjZ
 muvMlVfxxg_cduPhZg>
X-ME-Received: <xmr:xebgYvX561V9H9YP46xycR57ZOS9kLrejlEXUsMJ91pXF4-ixSk4rW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xebgYnj3ysAks8UGPBhGPU5EmvAyQrzd8Ys0XOU8jBNfdjzL4xTp2w>
 <xmx:xebgYnDypN-QGHpZJfCzuCVMIH0DkJkS53DE70byf6GEhJZuTmp-EQ>
 <xmx:xebgYgJ2Mov-brhHyTIui5onkH6SBF8Sra5rVJZSxnWtyxRUPeiW2Q>
 <xmx:xebgYuPZvnpK7UGJCqnRKzKD8rNLKumoz0TdaVb19YPwUcW3H7ru2g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 03:18:28 -0400 (EDT)
Date: Wed, 27 Jul 2022 09:18:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <YuDmwhKBpllXNG1i@apples>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vVrZZNfMed08eMGJ"
Content-Disposition: inline
In-Reply-To: <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
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


--vVrZZNfMed08eMGJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 21 09:29, Stefan Hajnoczi wrote:
> On Wed, Jul 20, 2022, 22:36 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>=20
> > Hi Stefan,
> >
> > Thanks for the detailed explanation!
> >
> > at 6:21 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > > Hi Jinhao,
> > > Thanks for working on this!
> > >
> > > irqfd is not necessarily faster than KVM ioctl interrupt injection.
> > >
> > > There are at least two non performance reasons for irqfd:
> > > 1. It avoids QEMU emulation code, which historically was not thread s=
afe
> > and needed the Big QEMU Lock. IOThreads don't hold the BQL and therefore
> > cannot safely call the regular interrupt emulation code in QEMU. I think
> > this is still true today although parts of the code may now be less rel=
iant
> > on the BQL.
> >
> > This probably means we need to move to irqfd when iothread support is a=
dded
> > in qemu-nvme.
> >
>=20
> Yes. You can audit the interrupt code but I'm pretty sure there is shared
> state that needs to be protected by the BQL. So the NVMe emulation code
> probably needs to use irqfd to avoid the interrupt emulation code.
>=20
>=20
> > > 2. The eventfd interface decouples interrupt injection from the KVM
> > ioctl interface. Vhost kernel and vhost-user device emulation code has =
no
> > dependency on KVM thanks to irqfd. They work with any eventfd, including
> > irqfd.
> >
> > This is contrary to our original belief. Klaus once pointed out that ir=
qfd
> > is KVM specific. I agreed with him since I found irqfd implementation i=
s in
> > virt/kvm/eventfd.c. But irqfd indeed avoids the KVM ioctl call. Could y=
ou
> > elaborate on what =E2=80=9Cno dependency on KVM=E2=80=9D means?
> >
>=20
> "They work with any eventfd, including irqfd"
>=20
> If you look at the vhost kernel or vhost-user code, you'll see they just
> signal the eventfd. It doesn't have to be an irqfd.
>=20
> An irqfd is a specific type of eventfd that the KVM kernel module
> implements to inject interrupts when the eventfd is signaled.
>=20
> By the way, this not only decouples vhost from the KVM kernel module, but
> also allows QEMU to emulate MSI-X masking via buffering the interrupt in
> userspace.
>=20
>=20

The virtio dataplane (iothread support) only works with kvm if I am not
mistaken, so I guess this is similar to what we want to do here. If we
dont have KVM, we wont use iothread and we wont use the kvm
irqchip/irqfd.

Am I understanding this correctly?

--vVrZZNfMed08eMGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLg5sEACgkQTeGvMW1P
Den18ggAmjPfPc8d0/h69eBYfA9AbSRlXBS02Mk0zTgHOAJMpjksuaMjQo2oKL1d
+6x8luNePYNyp54rU8mugUFSpej+5LBM5kMfhzyvAdWJBE/opN+h1aVWy6lEixRI
K85LwMMV94O1b0y6o1JFwK8h5ie+KhGq6ECRRj8g114Yx74qvOocB8qLY301InEX
n6IXHubXxezULj9e41J/7pUXUVe1rvMCBYjzggusb4gjA/By9F6gzBCcV9wv2ORe
EzqCiIMJNzGCTOQrtR/eaGoDGEwHGBYd3HG1Zd2Q3VNRyZoXXSfb1RwdLqQfstuQ
a6zsLzccdqDd7OoosFsWybsCCjS7jg==
=M9T5
-----END PGP SIGNATURE-----

--vVrZZNfMed08eMGJ--

