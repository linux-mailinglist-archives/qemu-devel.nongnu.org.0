Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732C31D713
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:43:47 +0100 (CET)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJN4-0004DC-Fg
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCJIb-0001WF-TA; Wed, 17 Feb 2021 04:39:10 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCJIY-000374-Bh; Wed, 17 Feb 2021 04:39:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2A9D2F7F;
 Wed, 17 Feb 2021 04:39:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Feb 2021 04:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LjOsM+dgVMKGaRNaPiTF2KB1236
 2O5/1Czk358VIUQ4=; b=N69WA0KRPFvi2XahhvseAViQTOVBmJcooC1MhUktbrT
 Bg3GngYcABVzpQYYcreKjWlJSsrYoHr5DtmKTv8AVjRNBU8wLYRfSrUcnDjoE7JS
 Ez+/wrTMpNBl2K0W5yT+Oi7nthGihSFTefYldnP5CxsVjOMbSBG9lKXz0NFzWGcr
 gPj5gLRMmT/DXE6GVtUyFjpNo6LkPRnUwLSo7eKPUQOOrvLn21QXSZWyzjIskwuP
 b2QjuAeFjF+WklNWlynfbgsYOmWAx4fwo7vD2V66RUczKHSIp+UUR3mjjwoLWhf9
 v29HFcTV17sNBoTFKa/U18sohNPyEm9NFEmkJK4zgtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LjOsM+
 dgVMKGaRNaPiTF2KB12362O5/1Czk358VIUQ4=; b=EghS4FF4RFy0BpGkm3Gm9Z
 y1OwvtIDFYFa7OF6QmkuXk6Cdv/Pd/HKVD07aKbCmxgkiMyCFbfy8bd+XcolLi4M
 V/NVRMEltPmk6uBrWIe/WV3z53bKv9UQsXip8ELZIeHVWh++pxpQXrv+sWDDJlWP
 ytrrjESl1qv1/3OdKnGD9NFPQUV8ui9ZtJviBGr8nS+tDuEQ8PbLc7S0BsiCWdpT
 8oeWYH+haTpe40Dwq1T0Slko11E5xefgXjpUE9kUHku+k2Dm3mB78QvF050/VRwb
 btAhcNHps/cjzwCTRmdAQ3yij6PjSljuiJQ7M4JshzMbX1Ovt8lEj8Sgl35LJIGQ
 ==
X-ME-Sender: <xms:NeQsYCQ1bEXUVG1ffnLiywp7GRi_jJ1-XiWtdiha--Evsm0NjBicFw>
 <xme:NeQsYHwU90P9E3uazr1ZobRU9yl4AxTR3cdRzd_yonU1RzoVPc6RuOgNUc8LihY_c
 f-Yx1m5VogdH0SC8sU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NeQsYP14S05e0MXan9nnQ2pYSwBK_bzN4mMentoVOXaNVQZjdqglLw>
 <xmx:NeQsYOA99VihvnQTkDGmh7ZhLRGFMt39WZmtefQeeBRbgmY0VLS5Iw>
 <xmx:NeQsYLhcxrwejQf7lCb5xMOB4AxNKP1__1vZ7TU9NBgixBZr8kuCeg>
 <xmx:NuQsYMWabmIfH3Pj3cftAgmYEsPugrPdS-nZj0TCrUL-UmnPd_KH6emRfRk>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 220E81080063;
 Wed, 17 Feb 2021 04:38:58 -0500 (EST)
Date: Wed, 17 Feb 2021 10:38:56 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format
 nvm command
Message-ID: <YCzkMOjgK6u0uSDP@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-13-its@irrelevant.dk>
 <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
 <YCzTPdmLgQywAtf0@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xSmbkU0nADKvTdcc"
Content-Disposition: inline
In-Reply-To: <YCzTPdmLgQywAtf0@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 THIS_AD=0.999 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xSmbkU0nADKvTdcc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 09:26, Klaus Jensen wrote:
> On Feb 16 15:16, Keith Busch wrote:
> > On Mon, Feb 15, 2021 at 12:02:40AM +0100, Klaus Jensen wrote:
> > > From: Minwoo Im <minwoo.im@samsung.com>
> > >=20
> > > Format NVM admin command can make a namespace or namespaces to be
> > > with different LBA size and metadata size with protection information
> > > types.
> > >=20
> > > This patch introduces Format NVM command with LBA format, Metadata, a=
nd
> > > Protection Information for the device. The secure erase operation thi=
ngs
> > > are yet to be added.
> > >=20
> > > The parameter checks inside of this patch has been referred from
> > > Keith's old branch.
> >=20
> > Oh, and here's the format command now, so my previous comment on patch
> > 11 doesn't matter.
> >=20
> > > +struct nvme_aio_format_ctx {
> > > +    NvmeRequest   *req;
> > > +    NvmeNamespace *ns;
> > > +
> > > +    /* number of outstanding write zeroes for this namespace */
> > > +    int *count;
> >=20
> > Shouldn't this count be the NvmeRequest's opaque value?
>=20
> That is already occupied by `num_formats` which tracks formats of
> individual namespaces. `count` is for outstanding write zeroes on one
> particular namespace.

And, btw, I have a seperate "aiocblist" RFC patch that replaces this
manual aio tracking in favor of actually tracking multiple aiocbs,
removing the need for for this ad-hoc accounting and fixing the cancel
bug in the process.

On vacation this week, so I expect to post it early next week ;)

--xSmbkU0nADKvTdcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAs5C8ACgkQTeGvMW1P
DelqnwgAsOhSFCokonc3X0YB2hDdXZzBwZ10+kdXChusWfMt26q5EtAjc3QFrSS1
BkzVAeghkW0sMwk4WPMW54AauD2Xx1dgzEPd14jJ8Tb39rjW3C2CUCnN3zloIUyd
QMNeCX+j9LB3O68l4RZc3tqEy9ZXoqGles8o5tjTdrIeRSBlQnKh8EhaofUD7nsp
hPEchH6LjbC5rUIPCKUsUc2do8B+xnI63nCbqEarrH3G+dlXUee/gQpV+RebP8xt
++hSgMtlI51J7G1d/esmSrKwxWQ+Nz2E0l9PSFbAW28QBeiFp/ie1AIF3buHLRcU
6CcSYWq/gWMER8By/cLEUVKj2joGCg==
=fnL+
-----END PGP SIGNATURE-----

--xSmbkU0nADKvTdcc--

