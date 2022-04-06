Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709E4F5694
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 08:46:46 +0200 (CEST)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbzRD-0004lb-IS
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 02:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nbypv-0000kc-UV; Wed, 06 Apr 2022 02:08:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nbypt-00052E-Fq; Wed, 06 Apr 2022 02:08:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B9FD53200E89;
 Wed,  6 Apr 2022 02:08:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 02:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=iGpnY3BRU/Yj75JHGrz8yskg0Hbvxp
 p9rfOdtMAnEJI=; b=c7z0R7QtuarD56nBp6TePafzl7CWpAe/JrtDT0phhQdUjW
 6EO/xoJaBrkMO+ChaDfcdbayLS/ZuygPEQYCros5WXOU9W4dXI9s6wuWEnVgk0Oi
 KVK8/n6O7j9NrPTr032zOeuD/YVWjRa+uxvFwvzPJsQ3zRfhZN505b2d4sFQOj7n
 lJWoPFfLM01qsPCii7Sg5kYu7uQ/hAIlUi6O6She2mowbig9OB1uwzaBUPMlhgCo
 T1cQi5YGg8f6NzXf0WMRVeOJrVU7zgLzradZYZlzyl5M9UQZWUvH1dQUl4Qmitcr
 qKjB8Lzqi2wSMxgSDDMkUrv6KfL2vkQ7/q/V6oEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iGpnY3BRU/Yj75JHG
 rz8yskg0Hbvxpp9rfOdtMAnEJI=; b=mC4DY4b1xRr8bSco3z+aZPv5OOvvxB6YA
 6eRRDeXD4OLQ1sUoSId9/b5lQWgFcz6L+FC8Hp/2vLI0NvzeE4ZuGA4uxKt7P/S6
 ueSuQlL4Vif5nGLPaag5JyyrLD8nVb56PJjPl0RpEpp9iqqLBBxobA9RG2XS6p/v
 w4r4Kwfi+1JkHZ/11qRkUzxzLpCUEPYmGkC7cUm3SO8w+Pwy1Wh+WcvVAp9hDw8z
 Cyerz9DUa2ENXEXTozas62XimtKPjZbJMsyhAfkEPFRgGioauHRXh5PvKhKBovn9
 BJqchObasbuIPtoIxruBSz2WComLGD+rggEx5uVTMwTxBYQL0irVg==
X-ME-Sender: <xms:Qi5NYiwnk60pe3ZQ8wrS0BTDHfJEllT5uNTqTjuiPzfJdoMgQBMpdw>
 <xme:Qi5NYuRRX6m37bgXrgw3DHZJg6-mxkJbX66ayDoseTpgCDDBEjkCzVRoZDkvbCscx
 rapzHRzPHl5mPsFr80>
X-ME-Received: <xmr:Qi5NYkUOue4TjcCBT4OqDvVwmqUaVJKzEYq6pDxCAaSb_LQO0ZOJVLHyXLAWMhmRgcuDdy5n5KYLcfqWs8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejhedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Qi5NYoh9HCpbW4hRRplMowlWAlDdjPJmXXpKrcnNxN9B7FWlDaHWFg>
 <xmx:Qi5NYkBnjWxAxgRvVSR3ZTJ09EEYf9_FVwl4eHSiEM0eIEbGBZQC3Q>
 <xmx:Qi5NYpIS33KOa4U4lSYWUuNHGyBELqzXx7KI4iunqmr3q4NRk_-RnQ>
 <xmx:RC5NYg5ygDLmiIO8mqPaQ3OCY41ltc8OCu08t12m5wKDbTwEyE_BEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 02:08:00 -0400 (EDT)
Date: Wed, 6 Apr 2022 08:07:59 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Delevoryas <pdel@fb.com>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <Yk0uP2BHaOTBQDf2@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QBSQvCIOV172E1V8"
Content-Disposition: inline
In-Reply-To: <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, Jeremy Kerr <jk@ozlabs.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QBSQvCIOV172E1V8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  5 20:52, Peter Delevoryas wrote:
>=20
>=20
> > On Mar 31, 2022, at 9:57 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Hi all,
> >=20
> > This RFC series adds I2C "slave mode" support for the Aspeed I2C
> > controller as well as the necessary infrastructure in the i2c core to
> > support this.
> >=20
> > Background
> > ~~~~~~~~~~
> > We are working on an emulated NVM Express Management Interface[1] for
> > testing and validation purposes. NVMe-MI is based on the MCTP
> > protocol[2] which may use a variety of underlying transports. The one we
> > are interested in is I2C[3].
> >=20
> > The first general trickery here is that all MCTP transactions are based
> > on the SMBus Block Write bus protocol[4]. This means that the slave must
> > be able to master the bus to communicate. As you know, hw/i2c/core.c
> > currently does not support this use case.
>=20
> This is great, I=E2=80=99m attempting to use your changes right now for t=
he same thing (MCTP).
>=20

Awesome!

> >=20
> > The second issue is how to interact with these mastering devices. Jeremy
> > and Matt (CC'ed) have been working on an MCTP stack for the Linux Kernel
> > (already upstream) and an I2C binding driver[5] is currently under
> > review. This binding driver relies on I2C slave mode support in the I2C
> > controller.
> >=20
> > This series
> > ~~~~~~~~~~~
> > Patch 1 adds support for multiple masters in the i2c core, allowing
> > slaves to master the bus and safely issue i2c_send/recv(). Patch 2 adds
> > an asynchronous send i2c_send_async(I2CBus *, uint8) on the bus that
> > must be paired with an explicit ack using i2c_ack(I2CBus *).
> >=20
> > Patch 3 adds the slave mode functionality to the emulated Aspeed I2C
> > controller. The implementation is probably buggy since I had to rely on
> > the implementation of the kernel driver to reverse engineer the behavior
> > of the controller slave mode (I do not have access to a spec sheet for
> > the Aspeed, but maybe someone can help me out with that?).
> >=20
> > Finally, patch 4 adds an example device using this new API. The device
> > is a simple "echo" device that upon being sent a set of bytes uses the
> > first byte as the address of the slave to echo to.
> >=20
> > With this combined I am able to boot up Linux on an emulated Aspeed 2600
> > evaluation board and have the i2c echo device write into a Linux slave
> > EEPROM. Assuming the echo device is on address 0x42:
> >=20
> >  # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
> >  i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
> >  # i2cset -y 15 0x42 0x64 0x00 0xaa i
> >  # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
> >  0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
> >  0000010 ffff ffff ffff ffff ffff ffff ffff ffff
> >  *
> >  0000100
>=20
> When I try this with my system, it seems like the i2c-echo device takes o=
ver
> the bus but never echoes the data to the EEPROM. Am I missing something to
> make this work? It seems like the =E2=80=9Ci2c_send_async=E2=80=9D calls =
aren=E2=80=99t happening,
> which must be because the bottom half isn=E2=80=99t being scheduled, righ=
t? After
> the i2c_do_start_transfer, how is the bottom half supposed to be scheduled
> again? Is the slave receiving (the EEPROM) supposed to call i2c_ack or so=
mething?
>=20
> root@bmc-oob:~# echo 24c02 0x1064 > /sys/bus/i2c/devices/i2c-8/new_device
> [  135.559719] at24 8-1064: 256 byte 24c02 EEPROM, writable, 1 bytes/write
> [  135.562661] i2c i2c-8: new_device: Instantiated device 24c02 at 0x64
> root@bmc-oob:~# i2cset -y 8 0x42 0x64 0x00 0xaa i
> i2c_echo_event: start send
> i2c_echo_send: data[0] =3D 0x64
> i2c_echo_send: data[1] =3D 0x00
> i2c_echo_send: data[2] =3D 0xaa
> i2c_echo_event: scheduling bottom-half
> i2c_echo_bh: attempting to gain mastery of bus
> i2c_echo_bh: starting a send to address 0x64
> root@bmc-oob:~# hexdump -C /sys/bus/i2c/devices/8-1064/eeprom
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |............=
=2E...|
> *
> 00000100
>=20
> Thanks again for this, it=E2=80=99s exactly what I needed.
>=20

Hmmm. The only obvious difference I see here is that I write
"slave-24c02" and not just "24c02" to new_device. Not sure if that has
any implications? Also, looks like your EEPROM is initialized with
zeroes, mine is all ones. This hints at the device being instantiated is
different. I'm also not seeing the 'at24', which upon looking in the
kernel code is a different device?

--QBSQvCIOV172E1V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJNLj0ACgkQTeGvMW1P
DelL9gf6AuZRrXjif6kk4UeTvX5yBridTTRjzwmsq89r+OeBs9SkXQAJhABbvZSv
Uqphha1XEGKWQh1GbMR7u+jxwlm65yrGQ0X1/lA86xmgfRWJE381Ic3oLP6fqmCc
4ySPgy/2kM7L8iVe3whWCv1C8xRvRZqDzAmpeQUXJBzKDJtseWwEFBjecX6eNSez
B4XCzS1oIsWVF+EcJ+fExmuyUP3HEirZMZ2fCKKFZeCYFVS+++01qyrYcI55hUzb
zMAF/m57w2FCKfUglcfBmU33Qc6Oo0Daf5M38CKp6pGq2NrPlnAnyqjzdEsPjzKk
qPN9iWSLGtUR1t8WAFKQgepXCwKTwg==
=ZS/Y
-----END PGP SIGNATURE-----

--QBSQvCIOV172E1V8--

