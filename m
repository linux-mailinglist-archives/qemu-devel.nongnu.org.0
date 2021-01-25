Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F73029CF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:17:15 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46QL-0003cm-Vq
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l46DG-0002rZ-HJ; Mon, 25 Jan 2021 13:03:42 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:36013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l46DE-0006zP-2J; Mon, 25 Jan 2021 13:03:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1E330228;
 Mon, 25 Jan 2021 13:03:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 13:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9B8VZHvoaCcwnUlVqf3tdc4GQHY
 PMCI2770mrwcIO5U=; b=J/7XHRQBs/GYD6RGdCOaMhncG3NHJ6X6/rlhDZtPrJS
 5CzIbmX8OBJ7FGV5ZSlrWtR7qIRP1e8hZQMZB5TdCCRIiQXWge1FEc9AprERsGhY
 U8HafdjWVkhdeZ6mrs+RvNSZ0CWPNjzd/IYPTTgEyKiMW+FB/Ow/6ML367wuWk0S
 nRoTNiJ3NOKirvebibq1nIkPckTa7+ivdBEvbQdCe0wK5uY/ZrgLzPRFu29IN/nq
 e0sm5PDLA5uZEi95HedZXf8VsppuWY3pSOUu0rRQ9h7Q0VGYLJ9RW3zsf90s63RQ
 WBZyIOImUK2/hZ7gToD6QzWLiQP3j2L2gruN/oUhj1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9B8VZH
 voaCcwnUlVqf3tdc4GQHYPMCI2770mrwcIO5U=; b=Y4YgmI3R8/SXW/cag7hmBu
 JlRn2Q97bgAOpElJc3tLRvGuOpIZitzMrwKGqK24zqvbZhPEcIzuwN5IxInCDVtS
 8YmWzsNHsHBFDXN/0k6pJ/kQuq5E88DUVJ7on+VCmGIsh99/uS3iiLCUafEpRQG0
 uLHmfMVCCbukgjzAZJtiue1sRTA/0a7yRb+OEO+32eCRAsWmNk+9LTRelMz6YNXT
 qraOuYva0Znw7Riq2jHAl2jF9Trr1UkIcKHCPqHcRUraBaEK4OJoVYBA2MiE8H49
 JLXaQseM1I5UxwmC9xR4iqDCkRAs/qJ5CZW14PDtKGO0qPG68TCgNPo/zLvnustw
 ==
X-ME-Sender: <xms:9wcPYHndzp-48fsZ8AYin4nierL8x3nGKSuBncCeJf3wUUJOyztz9g>
 <xme:9wcPYK0ekUf88Llk3n1wK-n9u2BObJRwD_wTGW3fT8klh98_fHRGwCy_dDcl3Mzkv
 bn21BXkPx1_lJfvd8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9wcPYNrVNR8x7-jI_es5l43Vj4vTYgfjv4CXo-37ul0tCQMHNT5liQ>
 <xmx:9wcPYPlV6R3QDx7fbxSeuW-r3hbmO-vNaOpAylCdIOWdjfkyG5Z8sQ>
 <xmx:9wcPYF0VZ8uAUmVWbqhMqQAYBODZLmLdrMCuePNr8xIv6E0e-HJg-g>
 <xmx:-AcPYAR-wQYIOAg_BvPH1x1huU1DvAl1gcOmj8dAeaJtSSVfNTVaVA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C186A1080064;
 Mon, 25 Jan 2021 13:03:34 -0500 (EST)
Date: Mon, 25 Jan 2021 19:03:32 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <YA8H9GTfBNPZFdqo@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-5-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lllxDv8s+SR3SE+p"
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-5-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--lllxDv8s+SR3SE+p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 24 11:54, Minwoo Im wrote:
> We have nvme-subsys and nvme devices mapped together.  To support
> multi-controller scheme to this setup, controller identifier(id) has to
> be managed.  Earlier, cntlid(controller id) used to be always 0 because
> we didn't have any subsystem scheme that controller id matters.
>=20
> This patch introduced 'cntlid' attribute to the nvme controller
> instance(NvmeCtrl) and make it allocated by the nvme-subsys device
> mapped to the controller.  If nvme-subsys is not given to the
> controller, then it will always be 0 as it was.
>=20
> Added 'ctrls' array in the nvme-subsys instance to manage attached
> controllers to the subsystem with a limit(32).  This patch didn't take
> list for the controllers to make it seamless with nvme-ns device.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-subsys.c | 21 +++++++++++++++++++++
>  hw/block/nvme-subsys.h |  4 ++++
>  hw/block/nvme.c        | 29 +++++++++++++++++++++++++++++
>  hw/block/nvme.h        |  1 +
>  4 files changed, 55 insertions(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index b525fca14103..7138389be4bd 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4481,6 +4484,10 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice =
*pci_dev)
>      id->psd[0].enlat =3D cpu_to_le32(0x10);
>      id->psd[0].exlat =3D cpu_to_le32(0x4);
> =20
> +    if (n->subsys) {
> +        id->cmic |=3D NVME_CMIC_MULTI_CTRL;
> +    }

Since multiple controllers show up with a PCIe port of their own, do we
need to set bit 0 (NVME_CMIC_MULTI_PORT?) as well? Or am I
misunderstanding that bit?

--lllxDv8s+SR3SE+p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPB/IACgkQTeGvMW1P
DelXQAgAlaw426CAnSKDnheNEUOidsgpKklrOZMu83ihiptOJ0+/PrY2zoHveC0S
SMRsqbfHrE0iKPC+VWiyQyauyQymWZwR+LMc4vIg4ZCxavyeXi5OCfdsQ+ety3QE
ve4mFPb5JsXYxPUCDFNyDpERMP8/TGGCnoZa2kfBGktVJuwUu7820NRO6Pwa8ivC
64dI0YXtEjCaZ6kzgiK3l49wFNbWxAlfnzzMkeMfRFXiD0Nty0qIlOKfUtBhzRgW
EDEZlLhPf+SXk1l8eL4LI0GV2Z9rNHhUCXyZbO8IuT8dVTURhZZ7ITDqic4zgMAI
CowusrCsjv3uNZg7tfpAtFtTaJgYFw==
=euIS
-----END PGP SIGNATURE-----

--lllxDv8s+SR3SE+p--

