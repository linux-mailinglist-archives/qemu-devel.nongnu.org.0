Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4E69643F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv0e-0002ND-3c; Tue, 14 Feb 2023 08:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pRv0b-0002MK-Fw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:06:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pRv0V-0008Jg-BV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:06:08 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D8AB5C00CB;
 Tue, 14 Feb 2023 08:05:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Feb 2023 08:05:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1676379959; x=1676466359; bh=y7
 2R6fzPPBaeHpu5Lm7qBttc/YoodgyslOQ5jJiz/qA=; b=sqxf/x2WtoXz+yNZsh
 pqec5nBUcAxmKNseMh0qCtzNIeJqIVfvW5mHs9ida9NZJfSCvMlzMfy88QxKoMMe
 PyfftsVc13XVbpf8vnUrdLli4CzuXCGNKG047Uq+6iothLNmE9iOtDRjpTz8PFwz
 nXveeSN1KN6Ak46FuRu8gQ1+oyjJkcVz50s909E54Sk8p+vWsGnsJAqlsT+1mSIN
 mzG8IcNYNRLDBkOpwYy08X2SAD6F327oAEW7KK2GPCszz3iHqAT6Pmhfo6fOLeeZ
 PtXf6SWyU5DArIQnlkz+4Zh9Se/L4lV6xq0WoXAeLItXlerxBmD4hKO42C9f6i+N
 KdDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1676379959; x=1676466359; bh=y72R6fzPPBaeHpu5Lm7qBttc/Yoo
 dgyslOQ5jJiz/qA=; b=QKZspaKw6eoZCETx0eKgRy3n8pG4Qunzmh66orYhQ8HV
 NyArCJAoAGymRWiy+8YVtIJF9H1Qs4FUPsg1Iv26hNo4PdgFbtUgIUIJVqdGFzB7
 ySGxQs+VkXvPddFJV0lHnSA7mTINg4DUF9n0YaHuzdzSncR7WrmqU947TIWWo/es
 L2gQIXmyB9VCNfxjk/sC8zjoBB3t55Q2wMzee3yIvZCORJAEcHh05H3D/2AB+MjZ
 KCS7j/h1J95C15CI7udXgQxXA9ewSM8AqEA7ZAQEXOVsmUoskvFzS3zrfh9v4os5
 W1XtUuUkpWlkRMy0ep/qdgvBZ8ot/Pi8/kXfmyunrA==
X-ME-Sender: <xms:NofrY73DdGPiHoK2iMFymu2xUsOmPuXi-kefmgtcytW4Hjh6mTH9Kg>
 <xme:NofrY6FBxeB756o1y7MfqTnQvQnLnXdeSnY3pxWRNuBaFxvYCoYyE0Rw2dvrxKHrP
 1rwLOafL5l--g7T2TE>
X-ME-Received: <xmr:NofrY77vvwLWx9Gc_51hiwGiigrZPNC1vcWKcoGM5cMzNMq-2jZGKijS9DJ8A1O4UqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeifedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NofrYw00Kan5S34UJffNZm7IOYiSuQY9uf_MpdTI1Ef8CypjR9nb-A>
 <xmx:NofrY-GbjokBT_aZFqYf6sUroEUvCcU8HlMPkIptuY3EQdTknz9ZUQ>
 <xmx:NofrYx8hFwQ0GewvTNhp8JXSSnSuuFT3UEGWOVAxY_0-Ye1vGCwZXQ>
 <xmx:N4frY2_ox5xkPtxKw4J7O4Qezy2nvCv1SBNcw1UVeIXbcnYio3D-wQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Feb 2023 08:05:56 -0500 (EST)
Date: Tue, 14 Feb 2023 14:05:54 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Major Saheb <majosaheb@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, k.jensen@samsung.com, philmd@linaro.org,
 armbru@redhat.com, mst@redhat.com, lukasz.gieryk@linux.intel.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
Message-ID: <Y+uHMm1hvP7N6sKD@cormorant.local>
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
 <Y+q3+eXdYz0qOtDT@x1n>
 <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MnmRGCAZwKX7+qXh"
Content-Disposition: inline
In-Reply-To: <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
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


--MnmRGCAZwKX7+qXh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 14 17:34, Major Saheb wrote:
> Thanks Peter for the reply. I tried to connect gdb to qemu and able to
> break 'vtd_iova_to_slpte()', I dumped the following with both Ubuntu
> 20.04 base image container which is the success case and Ubuntu 22.04
> base image container which is failure case
> One thing I observed is the NvmeSQueue::dma_addr is correctly set to
> '0x800000000', however in failure case this value is 0x1196b1000. A
> closer look indicates more fields in NvmeSQueue might be corrupted,
> for example we are setting admin queue size as 512 but in failure case
> it is showing 32.
>=20

Hi Major,

It's obviously pretty bad if hw/nvme somehow corrupts the SQ structure,
but it's difficult to say from this output.

Are you configuring shadow doorbells (the db_addr and ei_addr's are
set in both cases)?

> > > Following is the partial qemu command line that I am using
> > >
> > > -device intel-iommu,intremap=3Don,caching-mode=3Don,eim=3Don,device-i=
otlb=3Don,aw-bits=3D48
> > >

I'm not sure if caching-mode=3Don and device-iotlb=3Don leads to any issues
here? As far as I understand, this is mostly used with stuff like vhost.
I've tested and developed vfio-based drivers against hw/nvme excessively
and I'm not using anything besides `-device intel-iommu`.

Do I undestand correctly that your setup is "just" a Ubuntu 22.04 guest
with a container and a user-space driver to interact with the nvme
devices available on the guest? No nested virtualization with vfio
passthrough?

--MnmRGCAZwKX7+qXh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPrhzIACgkQTeGvMW1P
DemcjQf/cWYk4SgBWQayxVunoE4Pey9hq4WieIojT+XRqr3SlXJhx0+xSsx7hdae
H7JCJDmcQjNqnPGnCH5VIHn0I3BPyh6DyF0NPWmAw5XuaBjGrzbNI7adRP0g1mau
JOCGgxjKlMMJLlXeVAdydueoWU8eaLeYSL4Sj442S053kpQ2Hl/I7MEQLNKYgRYl
hmrtI5m/QUuwqG+zLSoQ7KNEcE+VKziBmfh/cr6b/Qobu4e+UJbrBN9e+eWLpJNa
ZygBWKxPfL8fJIq3psmjWeURc561s5ehZnngJPwwBF4Cm9dMSr/F9fMRJhB/4Viw
i28jePaLPpcb/Awz05bUYFQyIVjrSg==
=iBxb
-----END PGP SIGNATURE-----

--MnmRGCAZwKX7+qXh--

