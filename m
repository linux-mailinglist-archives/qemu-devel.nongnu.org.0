Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFE3185AE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:32:38 +0100 (CET)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA6Sr-00015w-8f
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA6N0-0008Sl-J1; Thu, 11 Feb 2021 02:26:34 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA6My-00020e-8M; Thu, 11 Feb 2021 02:26:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DF385C0070;
 Thu, 11 Feb 2021 02:26:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 02:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=MimRTjD8xm39FjjtBtiCwAOOaKs
 iRIPFw7S0o9vo2Uw=; b=1NySqOsCWfLN04eCQkJbvWwPo6DLHYLD3ks/YlIbMTG
 PQAj4mcvjIHOQyMPvSw+LJz/4bSR0JBIsDVBsV0OLmyjyFPUp1Fk50hP/vrz4LGX
 r6ucPM7/Lph/dp2sjhKlj9ywEjJIlUzDbtV8K6TavskBbnygzAPKqEaDGYPSFE0F
 lNVIcY4f9plxZkxddsuukpnn9HTQCxPsG+bnZpn/oONtnMfL8q0xgMo6ZJAfdQTb
 lDo2RxjOPXTPrypYmnw/K/ZO++7v6aOktrr2y0zjqxJ+22IMOfjHCwVM3Dh/Li+E
 D4JJeNMxGT4/UzUyP7hpjadpRA5APWBPKI4oh9xj07g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MimRTj
 D8xm39FjjtBtiCwAOOaKsiRIPFw7S0o9vo2Uw=; b=VekdpYwqhAhfhLS+FYhRZW
 tulbctNOhGKkRl0EECED16Pt9UU5MhctGIcJ6B5hsvxT+elEaOFcRCOILqz9NB6t
 UcEkj6RclqymOrXpRx5g7xjP+op6kemkjevYtLvfE0/qmZGpj5V96pDsaUv+9x7j
 GLvIOA3UsJ098CM1DMLXpbFFXiyGsm2LyjD3aq600NAcmJo647qCxjegmzKVH62Y
 ElDLefZgLEJEAlhxalRFOJVBcorBvncwyrr+ILOcOsJsSUugsW2qZJ8ES1aW+3se
 UVjUxrYfgeMvhiqKR5XMuXGKQrLrEMtQtPZJ6IpszYKTVoelBrfX+p/9BnbhewNg
 ==
X-ME-Sender: <xms:JdwkYGo6ndbQsolvtmS7o2jjd7AF_vWjDaC-nG4VicJ8V9WDo64Xtw>
 <xme:JdwkYEo3G7GI8g8Zh01rRF13GLsVEjoi5UdedoEHLtw2hDzdL_ey6p5PTtiQwoSle
 ZKvNJCygc6CIs8MaXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheekgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JdwkYLNe2_efdirS9uB1ce72xU33bLO-N7p_CFtqyKPH_ZZyJa3gQQ>
 <xmx:JdwkYF6QY2slyQX1AQNBg5y7L6EM1nqg0I2eXfCU8F06Gk0C1bgfQA>
 <xmx:JdwkYF6wBAQ_WUpWjxH-8oZGUQOIH-LfXuPjVqsXP3ea7_lVVZPXJQ>
 <xmx:JtwkYDRzgpGLXCObqZyW-2161zH8PK7w7jN83-GRBSUlsqArUlD_Kg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5058D24005B;
 Thu, 11 Feb 2021 02:26:28 -0500 (EST)
Date: Thu, 11 Feb 2021 08:26:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <YCTcIUHTo7eYtIFK@apples.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
 <20210211033848.GE24885@localhost.localdomain>
 <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XVJZteawnmwEOFUW"
Content-Disposition: inline
In-Reply-To: <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XVJZteawnmwEOFUW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 13:24, Keith Busch wrote:
> On Thu, Feb 11, 2021 at 12:38:48PM +0900, Minwoo Im wrote:
> > On 21-02-11 12:00:11, Keith Busch wrote:
> > > But I would prefer to see advanced retry tied to real errors that can=
 be
> > > retried, like if we got an EBUSY or EAGAIN errno or something like th=
at.
> >=20
> > I have seen a thread [1] about ACRE.  Forgive me If I misunderstood this
> > thread or missed something after this thread.  It looks like CRD field =
in
> > the CQE can be set for any NVMe error state which means it *may* depend=
 on
> > the device status.
>=20
> Right! Setting CRD values is at the controller's discretion for any
> error status as long as the host enables ACRE.
>=20
> > And this patch just introduced a internal temporarily error state of
> > the controller by returning Command Intrrupted status.
>=20
> It's just purely synthetic, though. I was hoping something more natural
> could trigger the status. That might not provide the deterministic
> scenario you're looking for, though.
>=20
> I'm not completely against using QEMU as a development/test vehicle for
> corner cases like this, but we are introducing a whole lot of knobs
> recently, and you practically need to be a QEMU developer to even find
> them. We probably should step up the documentation in the wiki along
> with these types of features.
> =20

Understood, I'll make docs/specs/nvme.txt and wiki documentation a
priority for 6.0.

> > I think, in this stage, we can go with some errors in the middle of the
> > AIO (nvme_aio_err()) for advanced retry.  Shouldn't AIO errors are
> > retry-able and supposed to be retried ?
>=20
> Sure, we can assume that receiving an error in the AIO callback means
> the lower layers exhausted available recovery mechanisms.

--XVJZteawnmwEOFUW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAk3CAACgkQTeGvMW1P
Dem9MQgAm5iDCIslAiIIuobZ27Km2TvqKVIqf34PpgkQHM7RZ+N5NrZs+uMoxmqV
/dvoQVagkFuzOD9+tVhvSrmWNhfmWb7ZAIt1etqpE24EI7s250izgIhtksJpD1Kq
algxqiacwmA6E+SUk2iIQ8Cg1EBytT6XKPb8aOKvAwY5v56pZyBPwTNNRy55WVUc
IJsG+TaSypLEScwwJIGyq4Pm6MAfA8LATY2dXCcA6KUNGdv6/AJsWytZFHQWKwgn
KBSf4nWiploSM1nBsAT64KMi0C8YU9NaE9A13HY9ITXW1CPJa2VaKWGsizQXP9LZ
8+y7+UDILEZcWXebMNseCgU+B3I1hA==
=pMaB
-----END PGP SIGNATURE-----

--XVJZteawnmwEOFUW--

