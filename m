Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2B582209
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:27:09 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcNo-0006Dm-Gb
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGcIf-0002EE-Nw
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:21:49 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGcIb-0000oi-1c
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:21:47 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CFAB45C013C;
 Wed, 27 Jul 2022 04:21:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 27 Jul 2022 04:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658910102; x=1658996502; bh=HH
 A0eoAT8y9ZAjBecm7375ZMIAYPBolejP1sx4nOSt8=; b=IBt845dQKrdG+QAhy6
 13V7PCG9qJFBIk+tFQRqhjaeG/h2a2mxI7PmIwZNLnHg7U9EtBgmOi9HjP4r3nY0
 fkBk1ogPSkT2x5k+mnp+H8C4QQ0BPGrvHUmgemXCjy4QScq/R2vpgCK9/+s2LODR
 /iy1vqfWbQ1sut9/3JzqhFed1ot2Lmf25fqKbTE4LVGVcbQeJXrqBBgOc95TJ2O8
 PjudwOuH7Q/KA9UoD3g8A0FT3+vHBeV4clGZ9Z/oEnorKLjXBuVhtpRKRkfdXGZU
 0docXyXDxYqOiUJxy6b3CIHxeQDQhsEXMwoQj7Tbu++sK2PkCndKoU5V8X/Aw6iP
 y6IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658910102; x=1658996502; bh=HHA0eoAT8y9ZAjBecm7375ZMIAYP
 BolejP1sx4nOSt8=; b=K3g/1Kx0a02ZK9V54K8c6WG6ZN0ZKhHoKNoG66hF+g5x
 2gD0VOTwzfzNjaXQLMKXJJtW7FWHLdhVSxxifaRLGZFd8W6OPp/q27UlygRRpp2O
 QOXuRq0X6wafFLI07ni5KKlo1En3dAWAFJmWzJ8arMtj9FO35kw1B14NF2I69/Hf
 U0XJtzNJyq3F5zu4xBz/VvAnGedbW57jx2xkBaC94aJ12WcxPXK18QLIZ1k+boXR
 FjnCNoTyYGPBCTk1bQdKWnq+eKC3fsXVJiv88vPwEdekESl9P3NYtRITcEg2pNmE
 G7zOGEEpoNW4x1mbL73WEQDFiaBHVjH2qYSmedwjRg==
X-ME-Sender: <xms:lvXgYgpQaLNufayPMOhrpo6lvIy4WpcYaw-WC8pZ0S3iTeLYxhZ_dw>
 <xme:lvXgYmosgdh6vgHU-qLwAJPEAAsXi6ktWs8jbDWzIZ0kBoOR0psr6OYc9uyK0E9-h
 go55EGCcKpxtMXOrYE>
X-ME-Received: <xmr:lvXgYlN9_xEClyaBOtGhgpLRHQjzrXL-aL6nAQZr5Xp0SHWugk1mfUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepkeeiffejgfeukeehvdegfeeuheehvdfgheelkedugffgjeevveeiheehleeh
 jedunecuffhomhgrihhnpegtthhrlhdrtgifnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lvXgYn5ayPuXo2Gngrwiecn5M0bGDJtwxQFbuKDY2YsvtPcpkLqsIQ>
 <xmx:lvXgYv5_ByIGNkIbiusFoW8bwI2U8xb-lsdl9tJ_B2j4JZkkBmgppg>
 <xmx:lvXgYnhPPv2ybs44a9xqJcIMavcjZ6weAFuKcKh99upgDb2AoPpCJw>
 <xmx:lvXgYsvLEQ7kx6YjCceFFEwSPo1UCdbedVp_GRy5RSUw8RFOLtgf6A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 04:21:41 -0400 (EDT)
Date: Wed, 27 Jul 2022 10:21:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, kbusch@kernel.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YuD1k54rwj1whnE6@apples>
References: <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples>
 <Yt/O8+n1pf3SRR7e@apples> <Yt/Qs5PelXjX8E1v@apples>
 <Yt/ZKVHjSTTt08MV@apples> <YuDkBkrqXaosJbRM@apples>
 <42878984-948E-4D65-8CA0-293564640F35@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r53WbsEoVbQ9eV6M"
Content-Disposition: inline
In-Reply-To: <42878984-948E-4D65-8CA0-293564640F35@ict.ac.cn>
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


--r53WbsEoVbQ9eV6M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 27 16:16, Jinhao Fan wrote:
> at 3:06 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > On Jul 26 14:08, Klaus Jensen wrote:
> >> Alright. Forget about the iommu, that was just a coincidence.
> >>=20
> >> This patch seems to fix it. I guess it is the
> >> event_notifier_set_handler(..., NULL) that does the trick, but I'd like
> >> to understand why ;)
> >>=20
> >>=20
> >> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> >> index 533ad14e7a61..3bc3c6bfbe78 100644
> >> --- i/hw/nvme/ctrl.c
> >> +++ w/hw/nvme/ctrl.c
> >> @@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
> >>     NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
> >>     NvmeCtrl *n =3D cq->ctrl;
> >>=20
> >> -    event_notifier_test_and_clear(&cq->notifier);
> >> +    if (!event_notifier_test_and_clear(e)) {
> >> +        return;
> >> +    }
> >>=20
> >>     nvme_update_cq_head(cq);
> >>=20
> >> @@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
> >> {
> >>     NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
> >>=20
> >> -    event_notifier_test_and_clear(&sq->notifier);
> >> +    if (!event_notifier_test_and_clear(e)) {
> >> +        return;
> >> +    }
> >>=20
>=20
> Yes, virtio also checks the return value of event_notifier_test_and_clear=
().
>=20
> >>     nvme_process_sq(sq);
> >> }
> >> @@ -4307,6 +4311,8 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtr=
l *n)
> >>     if (sq->ioeventfd_enabled) {
> >>         memory_region_del_eventfd(&n->iomem,
> >>                                   0x1000 + offset, 4, false, 0, &sq->n=
otifier);
> >> +        event_notifier_set_handler(&sq->notifier, NULL);
> >> +        nvme_sq_notifier(&sq->notifier);
> >>         event_notifier_cleanup(&sq->notifier);
> >>     }
> >>     g_free(sq->io_req);
> >> @@ -4697,6 +4703,8 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtr=
l *n)
> >>     if (cq->ioeventfd_enabled) {
> >>         memory_region_del_eventfd(&n->iomem,
> >>                                   0x1000 + offset, 4, false, 0, &cq->n=
otifier);
> >> +        event_notifier_set_handler(&cq->notifier, NULL);
> >> +        nvme_cq_notifier(&cq->notifier);
> >>         event_notifier_cleanup(&cq->notifier);
> >>     }
> >>     if (msix_enabled(&n->parent_obj)) {
> >=20
>=20
> I=E2=80=99m a bit messed up here. I will further check how virtio handles=
 queue deletion today.

Yeah, the API documentation is not exactly exhaustive on the specifics
here, so I kinda inferred this from the virtio code.

If this is the way to do it, then I think I will follow up with a patch
for the event notifier api with a not on how teardown should be done.

Paolo - get_maintainer.pl spits you out for main-loop.h. Any chance you
could shed some light on this?

--r53WbsEoVbQ9eV6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLg9ZAACgkQTeGvMW1P
DeneHAgAjKsw8pBDcdBkrffPHDvGBYw2YSRa1GNBBT7EVPHXlb5qodreEsDhfjwW
87e4z7X/bLdiHjAaoz8vAzfePrGl2KVJ9ic41gsaH50eIkmvnjVGmRqs3Js8Fg58
QgEWMsAM04sOAunZ6Dh2dzFnYDkE/mwk9uEaZZCijnJHSgm74EI1NioMq9DxxEVR
qSKmAKJxmuTW9XojrAuL/p3OGvEeg8ckEO/xPxuz9M+bHghtOGrKCj/G/WprebYr
t9gO+fDlIkek9VzsVURQ3b/CESspNEnRgNvKzbgZOcd46wt0p5O0D8hLPkRonckg
GAEOPqTQZ2gr5p1kSjNBP3SuC8tSoA==
=UmfT
-----END PGP SIGNATURE-----

--r53WbsEoVbQ9eV6M--

