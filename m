Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF694EEA87
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:37:13 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDiS-0007Eb-8C
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:37:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naDDs-0003a1-3H; Fri, 01 Apr 2022 05:05:37 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naDDo-00052F-8d; Fri, 01 Apr 2022 05:05:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id ED4653201F86;
 Fri,  1 Apr 2022 05:05:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 01 Apr 2022 05:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=fwfULyJm3BDtS/djGAajRqdVxrbhaa
 AzQoP22NPeOTc=; b=W5kBuyVS1v2Lo0ol2kWmR4Gj2Hz21w1kBgJSc5LmbHg9gv
 bxYbsos9yIzFIffOkJRGhsWXzOqEp59BE81LgFeZFmCwxU7nXUzwSHlVUaOWkZrj
 sNMd3r23Ll0sWEOE0GdR0jf0lFMDXLy7Bhwl4+ERcRetcd4ytBpsNpDuzRbEuVzj
 gNacikaTVif3YBl8TKKJBtXsEZMiShMOaW+ucjd5oW04z9DRbcvnIs0MtfW3KMnB
 4w7fkEZuRf+goVTDNpdlryY+G3Zq421a212NFDEz4DxfF7EyGf8NE2P+o8lIivuC
 K6huzBmMMjO8ODid+8KIkfq/tafaU/T7q0CKMMqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fwfULyJm3BDtS/djG
 AajRqdVxrbhaaAzQoP22NPeOTc=; b=aWcFnDVkgwJg8F1M7dQ7K1+p2FbBwc2Q5
 +HH74l2fEWQefg2WAvgKI+Vwdc+pZYLZvj1PqNl8jW7alpLQ7+aVps5Hie3lLXQf
 CUo2Cs8mIFXoQCZOpfZZaD1Ewe3IBERs0BCyVIl4Vkpwia/ouO4m4u1mplfkBh0+
 53c7Oh8fNO3jQo/sGx+rr7JCGNl+N+VP94UiSw2Be6HYzm8FADrj2PIGGFPuWK3x
 EHfj9l6rVSzaGt7kyaUnyOykV2xBWXv1dBG88OSd/Q2h0LrrxsbUqIm8j1K4lI9+
 LhUDl7xp1XvQMjCQictSBN/uv8tM60W5atLulc7dUuw3A8HHVIYnQ==
X-ME-Sender: <xms:V8BGYqnqTmsWbU6VKtjfd-u5Ekdj9eoJs2XzGTKDnsmTOpdxIv0lMQ>
 <xme:V8BGYh3cL8E8yEDaxhMJ057qDCJpJmiqsLkt88P2VQoQkPQhVDyLDdkogQ76l5O-V
 i8Zq2q6pZwNzpudob0>
X-ME-Received: <xmr:V8BGYooeP0myp7W3uKW3fn6ATMZElYt-gsyHnbiNLHQ6falqdU66pZK8amFX9Uo4686Gvs0C3Q35KdWC5EY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:V8BGYuloa_2NIvito2FOGlVjEoeU4Gm_9_juPqOg52MzNC_pgtxOPg>
 <xmx:V8BGYo3FDGj0UiZ3EK_A05Fo5g4Ph4sF-XVa2N8B5ljFjPaoTc5Tlw>
 <xmx:V8BGYltnz6sxhAk-VNG-uLdMb_IR7r7KplQAf5n7A6xPyXKToE6kCA>
 <xmx:WMBGYj0-0mD5op0QgEWqWzo7jllxX8pz9dLiddG2wqxek2a83r748g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 05:05:25 -0400 (EDT)
Date: Fri, 1 Apr 2022 11:05:23 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <YkbAU3Xga3txXDM0@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331203205.GB29333@minyard.net> <Ykabr0wQe9VLISu2@apples>
 <f3c78b1a-bc5c-928c-8986-ad447470b78f@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j9RmC5DLG7gVmW8w"
Content-Disposition: inline
In-Reply-To: <f3c78b1a-bc5c-928c-8986-ad447470b78f@greensocs.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <minyard@acm.org>, Corey Minyard <cminyard@mvista.com>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j9RmC5DLG7gVmW8w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  1 10:58, Damien Hedde wrote:
>=20
> On 4/1/22 08:29, Klaus Jensen wrote:
> > On Mar 31 15:32, Corey Minyard wrote:
> > > On Thu, Mar 31, 2022 at 06:57:33PM +0200, Klaus Jensen wrote:
> > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > >=20
> > > > Hi all,
> > > >=20
> > > > This RFC series adds I2C "slave mode" support for the Aspeed I2C
> > > > controller as well as the necessary infrastructure in the i2c core =
to
> > > > support this.
> > >=20
> > > I've been wondering when this would happen :).  I had put some thought
> > > into how this would work, but hadn't come up with anything good.
> > >=20
> > > The big disadvantage of this is you are adding an interface that is
> > > incompatible with the current masters and slaves.  So you are using t=
he
> > > same I2C bus, but slaves written this way cannot talk to existing
> > > masters, and masters written this way cannot talk to existing slave.
> > > You could adapt the masters to be able to work either way, and I supp=
ose
> > > some slaves that could do it could have both an async send and a norm=
al
> > > send.
> >=20
> > Would it make sense to introduce a QOM Interface to differentiate
> > between the slave/master types?
> >=20
>=20
> Probably.
>=20
> I expect a normal slave-only I2C device will be compatible with any master
> (having or having not this feature) in real life ?
>=20

Yeah, it's just that currently in the i2c core we cannot "suspend" the
sending of the ACK.

> It would be great if the compatibility between "a I2C slave requiring the
> slave-mode from the bus" and the bus could be checked during the device
> plug.
>=20

Makes sense, I'll see what I can come up with for a v2 :)

Thanks!

--j9RmC5DLG7gVmW8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJGwFEACgkQTeGvMW1P
DekjqQgApMtljS3U+Baho6XQdeB51S2mrxkgKuUgBlpTUwBY57kYQ5GIIZRXGHhC
3x8udxr4DS2NALEpw/NNh0kDpOVc+P11biGK6sRDGtIrGfC9/va0LziWmLtcTNtv
TQIoMrz2Xs7+cTU7N1iU9TIDSOGxcYAzlX/buKurJLRFpxrOtX3kdn+r+o6AqZz3
dWy/ts52Ry5iRPt6UYxBFu2iAi7/aITXJeaEkTGwGSnPCrIkW3Ob6EnbBhS1tj0a
WA+rS2fqREsAn3ZEn0SEfPsO0gJX3Q6F1idT6lUJ2NwGXnvRu54ShLpecF4qijK9
3UMLPf+9l8LbvpzSAiQeDlKfn4CyMA==
=JNW2
-----END PGP SIGNATURE-----

--j9RmC5DLG7gVmW8w--

