Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADB2B5A30
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 08:20:36 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kevI3-0002Zn-9k
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 02:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kevEJ-0001wQ-CR; Tue, 17 Nov 2020 02:16:43 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kevEH-0004oe-3k; Tue, 17 Nov 2020 02:16:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 60A21A55;
 Tue, 17 Nov 2020 02:16:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 17 Nov 2020 02:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6hieQbDO+xuLORxTkF+2I9ASuvl
 alx0YcOTtmGWDjbo=; b=vtYyflvwzFcSKO/P7daa8GBAUww4r13p6AuH2GjF+Gq
 tLbCDwNwhlXJJ+HEy6sWRraoL//upe9o/EfVoz5SzFvtxtXnBgKTlkNsG0uEgTOk
 s2fca8qWQwmlFERIldxrh7+Zdzhvo8PediUamRUre6jkp3EPSGkNlxgEYHqosf7W
 wx43WoLl/5MhgdRJw7fnGdyKK/LTeePV9SJonLKSqtOGp8mGjyjFTymN5vR0VNCL
 ZJVeL8TLIoWZq+3Hp1U8Iuxqr28nCKcCpJYQMVy1svHb4LjE8zYr8P0pR2QCLekx
 eSAYC9w4R6+C7m8im0ICffSLoTdmtb4kpM9H9dbS6fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6hieQb
 DO+xuLORxTkF+2I9ASuvlalx0YcOTtmGWDjbo=; b=rwmHxy12f69ShR152mNKXE
 Beum2g5e/NNuzKA0xIqNoR1wBRbbY5e0czyfW/Na/AxG73sKd0jal1WWRH6uPkNg
 oEQuk49DzyAbiU41V2EeMr8cqdKEWYDeViyjgeBF0/VB8ASGi0XOy9AOlVI20oyR
 f/79Wu87knwiEpCpRXme84w+YQcufeJBKWKILhC/VxujyEJoLu/gmunNaQcjHjAL
 tTlJYhk5aou07EsmalOPlDPLEeCz+Q4DNJk/v/5GA+uZdTLLCSh+oEZNi7UaXMQb
 7Ja5dD2fG66TKQax2QkUiDz3pLzp1dbuyv3L++zCjOGZ33O9C13H4wa0cO6gYO6Q
 ==
X-ME-Sender: <xms:1HizX0J0gY4wxX0m9LqvV9lFLR9o4JI9yLOABjgRO6Nnh28zGOMsjw>
 <xme:1HizX0LoX6zjcZ0yQ-uKRT86f5Q1mePj5ErZ86axqVd-hT9IN908x7QJmMzeTnEef
 OMwa2t7SrdHAkzJoRs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefvddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1HizX0uIud8xriqtDf6DK00UbVyW7uIVAvFe8ZG60tl49wfTbFibsw>
 <xmx:1HizXxbWeeZF7Zb0ncQdkSuwk_yexihHS6SipWYpAnXE6rSpy_iIZg>
 <xmx:1HizX7avw0QAzoo8Bgp1U1g9CZH7dme_iX5qF9llAekXHvjHfhCimQ>
 <xmx:1nizX2xLq7nOGnmaiTV-bFqTLvH08_95aVTZOqdiTX5GDGdWXMfs3g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FCC8328005D;
 Tue, 17 Nov 2020 02:16:35 -0500 (EST)
Date: Tue, 17 Nov 2020 08:16:33 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Message-ID: <20201117071633.GB1128648@apples.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-3-its@irrelevant.dk>
 <20201116175713.GA2715864@dhcp-10-100-145-180.wdc.com>
 <20201116181801.GD982821@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <20201116181801.GD982821@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 02:16:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 19:18, Klaus Jensen wrote:
> On Nov 16 09:57, Keith Busch wrote:
> > On Thu, Nov 12, 2020 at 08:59:42PM +0100, Klaus Jensen wrote:
> > > +static void nvme_aio_err(NvmeRequest *req, int ret)
> > > +{
> > > +    uint16_t status =3D NVME_SUCCESS;
> > > +    Error *local_err =3D NULL;
> > > +
> > > +    switch (req->cmd.opcode) {
> > > +    case NVME_CMD_READ:
> > > +        status =3D NVME_UNRECOVERED_READ;
> > > +        break;
> > > +    case NVME_CMD_FLUSH:
> > > +    case NVME_CMD_WRITE:
> > > +    case NVME_CMD_WRITE_ZEROES:
> > > +        status =3D NVME_WRITE_FAULT;
> > > +        break;
> > > +    default:
> > > +        status =3D NVME_INTERNAL_DEV_ERROR;
> > > +        break;
> > > +    }
> >=20
> > Just curious, is there potentially a more appropriate way to set an nvme
> > status based on the value of 'ret'? What is 'ret' representing anyway?
> > Are these errno values?
> >=20
>=20
> Yes, it's errno values from down below.
>=20
> But looking at this more closely, it actually looks like this is where
> we should behave as dictated by the rerror and werror drive options.
>=20
> I'll do a follow up patch to fix that.

So, following up on this after looking more into it.

Currently, the device is basically behaving as if werror and rerror were
both set to "report" - that is, report the error to the guest.

Since we currently do not support werror and rerror, I think it is fine
to behave as if it was report and set a meaningful status code that fits
the command that failed (if we can).

But I'll start working on a patch to support rerror/werror, since it
would be nice to support.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+zeNAACgkQTeGvMW1P
DelrPAgAoQKRVF321f2EFsaBqP1L+qODrJbcDTiFKlEmdoAbQb1li7Dika4luTpb
QErIXSJuyd0Iz+F2xSniLjxS06o1AdBF+/aL9wumeIRx3Nxk9TeigGPExOjTVjxQ
p5N4G98Nb/9RJ40YvWG0RcvED91lehRgYXF8A6cUMTvHzXl86IX+CpmIiZDAD8Ip
47t8Av0YS5BqbnPrFuL3xmAVHjpdCoSiDWxVrCORqdZ+APS3Lv0CJ/wQdzaE70Tk
M0EpeW5XCP62qTUgRsfsCY/NheZhBS7Ja5KvmBXyzBKVVlSoyMCMWl/onCashC9D
60vFRrxiNgMUX/g1ECX6RIGV0aYQXQ==
=qgNY
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--

