Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A002FBFE0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:20:56 +0100 (CET)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wYh-0002DS-Df
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1vgt-00033G-6C; Tue, 19 Jan 2021 13:25:19 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1vgp-0008Om-0i; Tue, 19 Jan 2021 13:25:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id DF0A5252;
 Tue, 19 Jan 2021 13:25:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 13:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8ODvLl2T7HVQT3YC0WCiN3LjSmf
 2Kg2iHiHZ4czTC+M=; b=fU0GDNltccw/nrydKEKRX03Of55IdWoy7klHYQaOrVB
 cR2W0GN+nNFwW0VyT1iGtpRmczBWyLxBJcf+2LS1+exkptXgYQkzlqABkhRawr/D
 kxSmIQ0aR7rLfaxX0o26iQt2gfxRTxluFNYzecC63YXD9AWWhuWcAd7AnJbzYOCS
 26YguC4Au6YL4oHt9t17Sv4N2iYaRLTvei6lUZJo454Vnxmi4kLS/BKzgfjcdQ3L
 7thN8pdxdC2Atz9ZY0efVPbomhyapexBLP2l1GHTpqUe3c6jjf+ccoRyOLzp8V3/
 cmgBtygswFSxrQuRT4QpKmVFAgukL6qSMtKjxz/FoXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8ODvLl
 2T7HVQT3YC0WCiN3LjSmf2Kg2iHiHZ4czTC+M=; b=DK9mNW2NJv8nEwYs8gufNm
 LKVO99/TWaYBNDnIHJWyd5mU5qgwggXlCZgpm7O2RbnRQdJRZOoW3WJZUw6oN1ND
 O5iUjvnUrWGhnX5K/5Q9KTrZet3nCFqmdGG14O5gZAg7GzRutRwCARbyglkODUje
 x/ufdaGNq7uZSNzTV2feYDT9H7ahrdpkRtfo0c6W5yCesyzukukSU7nHYS10TQbM
 1SBtxxsvn+UrOo5eLRBrktH3ELtgGafPf/67G6101lgOZFNzgY27bh2Mt1e8RUpA
 e0aHuNS+3Snp8e7dcQMvPG6HG/gS/qpHCUKWYfu0yFUdqgIS7DrDfEcVaiQrfcFA
 ==
X-ME-Sender: <xms:BiQHYIDDFXcuG1Z91veoD-S7iEhKxC7zCRhFtOF7NM3ngS5omQtCwA>
 <xme:BiQHYKhZ38OhZj1q1g9X-leJPA7LwW3d4ILE1lYP9X_g13jCpSeUqJnpVWNIgqHLg
 VROu16Q9e0PbvFq1wI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ByQHYLl05l4dTKfq_Wcr0CobqGNieIn8gCU0gUUy52u1uyrC1UjB7w>
 <xmx:ByQHYOxUbcJN5Jmd_wP9fjX1LFJxcDhALpLucbcyl7y3Gr6ROLxoXA>
 <xmx:ByQHYNT0rDD9TcZosqXAXDiztqllmHlYg-5-hdkwJoFlP4TqDYDtkg>
 <xmx:ByQHYLMWbUFjAyyRs4U5_2RIVR9N-orTtieOF60bF2fsWHKxairWoQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04FB024005D;
 Tue, 19 Jan 2021 13:25:09 -0500 (EST)
Date: Tue, 19 Jan 2021 19:25:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V3 7/8] hw/block/nvme: add 'detached' param not to
 attach namespace
Message-ID: <YAckBNC3ReHdyP4w@apples.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-8-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="asjrlrb8zJ6YZkI6"
Content-Disposition: inline
In-Reply-To: <20210119170147.19657-8-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--asjrlrb8zJ6YZkI6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 20 02:01, Minwoo Im wrote:
> Introduced 'detached' parameter to nvme-ns device.  If given, the
> namespace will not be attached to controller(s) in the subsystem.  If
> 'subsys' is not given with this option, it should be provided with 'bus'
> which is for private namespace.
>=20
> This patch also introduced 'ctrls_bitmap' in NvmeNamespace instance to
> represent which controler id(cntlid) is attached to this namespace
> device.  A namespace can be attached to multiple controllers in a
> subsystem so that this bitmap maps those two relationships.
>=20
> The ctrls_bitmap bitmap should not be accessed directly, but through the
> helpers introduced in this patch: nvme_ns_is_attached(),
> nvme_ns_attach(), nvme_ns_detach().
>=20
> Note that this patch made identify namespace list data not hold
> non-attached namespace ID in nvme_identify_nslist.  Currently, this
> command handler is for CNS 0x2(Active) and 0x10(Allocated) both.  The
> next patch will introduce a handler for later on.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-ns.c     |  9 +++++++++
>  hw/block/nvme-ns.h     |  6 ++++++
>  hw/block/nvme-subsys.c |  2 ++
>  hw/block/nvme.c        | 31 ++++++++++++++++++++++++++++++-
>  hw/block/nvme.h        | 15 +++++++++++++++
>  5 files changed, 62 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 073f65e49cac..70d42c24065c 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -17,6 +17,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> +#include "qemu/hbitmap.h"

Isn't the HBitmap slightly overkill? Can qemu/bitmap.h suffice?

>  #include "hw/block/block.h"
>  #include "hw/pci/pci.h"
>  #include "sysemu/sysemu.h"

--asjrlrb8zJ6YZkI6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAHJAIACgkQTeGvMW1P
DenfVAf+JooQZ2QubR2hBCgMtWfwW0eX5dyfIcnO4d321X8YPVXdzc4Kuz3c0rOi
Tkw9r6mx1DOUNYNOPt2ciJeeyw0bvGV2j2JLkKeqbuFLPUePa5t7f1+HEuTqzhJi
btvmy34A7yevHu2ZSEla6ncoz6Czur5tCexjOkY40ROzoOurDmPdC2fydSafrfKH
aFGZyZHMH4eecwJEGO5iCaTbinIWmNBuyncH/VBkmlWR/wK2Rpd8j7maDo6d+oR7
TdNh0FMKYkkLmUdUn56SAahXzJEIVlBhYiewVAC4fFPHWO9/Nt3I3V6LIUcI+O+J
IPQvR2GMnBDjRvCv/4evGR8BSbbxRg==
=fbct
-----END PGP SIGNATURE-----

--asjrlrb8zJ6YZkI6--

