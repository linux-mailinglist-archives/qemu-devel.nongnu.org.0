Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3E53B515
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:26:54 +0200 (CEST)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwgAP-0007Mx-8I
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwg5j-0004EA-24; Thu, 02 Jun 2022 04:22:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:60179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwg5g-0000C8-CV; Thu, 02 Jun 2022 04:22:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2BC04320083A;
 Thu,  2 Jun 2022 04:21:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 02 Jun 2022 04:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654158113; x=1654244513; bh=hZ
 ErQfnGoKLmWjUV63hZgghgsRf/BW5z8nnzt25JSOM=; b=m1s7uI7Mx8vfzGuhBP
 /IyUTIpEPzaXX4W5V64GXiv0B58TO3GlKut1Yasf+HXo8RY1saV93liP9eUYSSE6
 H9ZwpJCsGZK6rTBT71yFfj3cOs4qioTuU0RMQrWsEVhHcUt2AvyzgaLPnR8+BKdk
 OLLNZ+7eiAsfil50uN31Ksfnkz9V7uH14yIEANQ65pbBcXRSgEPucKQc0IKg5eka
 LUdqbW27GgYBMc+cUlIbmC8LUM9kNKMr26FpMKUxzKwTFtyD0aEusSCQ1T0ge6uF
 s1/yVOWS47hCw0oR/NBS2Y8z5V6slm0i0geKOFCSGRxPjFaxaEXwCxNFf/fW5x7I
 t57Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654158113; x=1654244513; bh=hZErQfnGoKLmWjUV63hZgghgsRf/
 BW5z8nnzt25JSOM=; b=r9v0zjVzvVh/o1USHBWQx2GmN5TvorefoBaKQBTQ38rZ
 fThSBptN1sDnamDUhLKPl2Ci3Gvt365OhsAKbE46Exp0TzfFD5rvd9RRsFPROoaN
 dlJCMMoFCysIYBMwSUZJ6n557APqtxA/LMUlQ8NMjFp3qP/IZg08K0FsZlykRRMM
 YiFmosJ7bf21v34h7w17cflCTwzp9l8YLJ4tXyfI3ntQIsDDWVT0yw7GhuMPs4HU
 8yc4JgI1MiJswY7PFGcTwSB6S9WYKJCx+brpzEHU3I1ExXAbJjiYlaVf7RaLu0E5
 KCHsKH0df71/jyOe6Q1oZRxBk5PjNfWk63jAYC/lTw==
X-ME-Sender: <xms:IHOYYo5sCWnTceiYj434OZXjIMDQxzjVSk_FQEu6k53tNbeQxproSw>
 <xme:IHOYYp7oaK8AxaHN7rN1rmQQjkcy4YmENWPy1cbgKBqcG_OyM0AeMfDrikkWS7g_1
 HWZcitTV9f7a-sugK4>
X-ME-Received: <xmr:IHOYYndXsV2t4Z4WngbdqfzfEfaLVFqJl-Ja31Tb8xy9IKwyKr-fyDfY8IrRrqWLchxKPCvB8AKi2agPiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledvgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetvddtteeiffekgfelffdvjeehhffgvdfhgeejfeejteelvefhkeetlefffeek
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhr
 vghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IHOYYtKTrlFnzX-eckxHmLBsKGVZH31R8qnYkOTYzjpsLJlRZX1pcQ>
 <xmx:IHOYYsJg_z0pEPkZGENlzw2pLdEmRS4qPxvR85XyTfA2mTbGNRcN9A>
 <xmx:IHOYYuwaacbULPwp8Sl189St086kxBD1MG7pfGHhVm4WFykz_EC1jg>
 <xmx:IXOYYuAUVgDiT08laKTIjWk_bsNBWiMtQaHWS7nu9glvld_bKKFjDg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 04:21:50 -0400 (EDT)
Date: Thu, 2 Jun 2022 10:21:48 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu-arm@nongnu.org, Peter Delevoryas <pdel@fb.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Message-ID: <YphzHGNYErSMEfPw@apples>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sARqXn+SLAwKtpH8"
Content-Disposition: inline
In-Reply-To: <6e0eb197-25c2-6b1e-2c19-f93597e29cff@kaod.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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


--sARqXn+SLAwKtpH8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 09:52, C=C3=A9dric Le Goater wrote:
> On 6/1/22 23:08, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Hi all,
> >=20
> > This RFC series adds I2C "slave mode" support for the Aspeed I2C
>=20
> I think you can remove the RFC prefix.
>=20
> > controller as well as the necessary infrastructure in the i2c core to
> > support this.
> >=20
> > v2 changes
> > ~~~~~~~~~~
> > I finally got around to working on this again. I'm sorry for not
> > bringing a v2 to the table earlier.
> >=20
> > Mad props to Peter and Jonathan for putting this series to work and
> > pushing it forward! Thanks!
> >=20
> > This series is based off C=C3=A9dric's aspeed-7.1 tree, so it includes =
the
> > register fields. This is all "old register mode", but Peter seems to
> > have added support in new mode.
> >=20
> > There are some loose ends of course, i.e send_async doesn't handle
> > broadcast and asynchronous slaves being sent stuff can't nack. But I
> > wanted to get some feedback on the interface before I tackle that.
> >=20
> > This series
> > ~~~~~~~~~~~
> > Patch 1 and 2 are small Aspeed I2C changes/additions.
> >=20
> > Patch 3 adds support for multiple masters in the i2c core, allowing
> > slaves to master the bus and (safely) issue i2c_send/recv().
> >=20
> > Patch 4 adds an asynchronous send i2c_send_async(I2CBus *, uint8) on the
> > bus that must be paired with an explicit ack using i2c_ack(I2CBus *). We
> > have previously discussed how we wanted to handle the issue that some
> > slaves implement this and some do not. Using a QOM interface was up, but
> > couldn't figure out a good way to do it. I ended up decided against it
> > since I believe this have to be a run-time check anyway. The problem is
> > that a slave can master the bus and try to communicate with *anyone* on
> > the bus - and there is no reason why we should only allow asynchronous
> > slaves on the bus in that case, or whatever we would want to do when
> > devices are plugged. So, instead, the current master can issue an
> > i2c_start_send() and if that fails (because it isnt implemented by the
> > target slave) it can either bail out or use i2c_start_send_async() if it
> > itself supports it. This works the other way around as well of course,
> > but it is probably simpler to handle slaves that respond to
> > i2c_start_send(). This approach relies on adding a new i2c_event, which
> > is why a bunch of other devices needs changes in their event handling.
> >=20
> > Patch 5 adds *partial* slave mode functionality to the emulated Aspeed
> > I2C controller, that is, it only supports asynchronous sends started by
> > another slave that is currently mastering the bus. No asynchronous
> > receive.
>=20
> If there are no objections, I think this is a good way to move forward
> and improve this initial implementation when the need arises.
>=20

There is an outstanding issue with the SLAVE_ADDR_RX_MATCH interrupt bit
(bit 7). Remember from my first series I had a workaround to make sure
it wasnt masked.

I posted this upstream to linux

  https://lore.kernel.org/lkml/20220602054842.122271-1-its@irrelevant.dk/

Not sure if that is the right way to fix it. You mentioned something
about "fixing" a mask on the ast2600?

But with the above patch, all works an intended and no "workaround"
required.

> > Finally, patch 6 adds an example device using this new API. The device
> > is a simple "echo" device that upon being sent a set of bytes uses the
> > first byte as the address of the slave to echo to.
> >=20
> > With this combined I am able to boot up Linux on an emulated Aspeed 2600
> > evaluation board and have the i2c echo device write into a Linux slave
> > EEPROM. Assuming the echo device is on address 0x42:
> >=20
> >    # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
> >    i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
> >    # i2cset -y 15 0x42 0x64 0x00 0xaa i
> >    # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
> >    0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
> >    0000010 ffff ffff ffff ffff ffff ffff ffff ffff
> >    *
> >    0000100
>=20
> I have started working on buildroot images  :
>=20
>   https://github.com/legoater/buildroot/commits/aspeed
>=20
> The resulting files are quite small :
>=20
>     $ ll output/images/
>     total 86040
>     drwxr-xr-x 2 legoater legoater     4096 Jun  1 20:01 ./
>     drwxrwxr-x 6 legoater legoater     4096 Jun  1 19:40 ../
>     -rwxr-xr-x 1 legoater legoater    36837 Jun  1 20:01 aspeed-ast2600-e=
vb.dtb*
>     -rw-r--r-- 1 legoater legoater 67108864 Jun  1 20:01 flash.img
>     -rw-r--r-- 1 legoater legoater  6682796 Jun  1 20:01 image.itb
>     -rw-r--r-- 1 legoater legoater     1846 Jun  1 20:01 image.its
>     -rw-r--r-- 1 legoater legoater  3168768 Jun  1 20:01 rootfs.cpio
>     -rw-r--r-- 1 legoater legoater  1026660 Jun  1 20:01 rootfs.cpio.xz
>     -rw-r--r-- 1 legoater legoater  3788800 Jun  1 20:01 rootfs.tar
>     -rw-r--r-- 1 legoater legoater   653777 Jun  1 20:00 u-boot.bin
>     -rw-r--r-- 1 legoater legoater  5617280 Jun  1 20:01 zImage
>=20
> I will probably host them on GH and we could use them under avocado
> to extend the tests.
>=20
>=20
> They should boot real HW. I will submit the defconfigs to buildroot
> after more tests and cleanups.
>=20

Nice!

--sARqXn+SLAwKtpH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKYcxsACgkQTeGvMW1P
DelkRgf/eX0z6D4zW0//xLTH2/VyVw/qz0cw8UFDkmmBjQc9PkNzMDTCbdJpovMI
h/nhE/LlM933mGt1GJtlBrftPiE1ffrtUA/RrqbWPZHc44pNOFpa5XuNXUxHp8gh
cJW0KXcyTb4QmCTFu3o8jHIy/U91ib0HqUPdOx6t2jivQSNmvw6n6wRkDBzTetQr
F6lmd1q4qXIqiSDCCdyYOKEoskHVg4vKwJnWH0z07YoRCJ7Jh+m7MOzxbTsH42QI
GDlSj0TESa1ShR7GLxJdNdZg0z0bs92REQqJbQJ92hJtiB0CYW5NTIdVoheHDY1j
QCxNavdQuHu5es8EkyOd6LNHDqbbLQ==
=xNxy
-----END PGP SIGNATURE-----

--sARqXn+SLAwKtpH8--

