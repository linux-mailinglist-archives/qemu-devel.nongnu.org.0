Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD02F4F697B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 21:00:21 +0200 (CEST)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncAtA-000378-FZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 15:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ncAbJ-0002ws-Es; Wed, 06 Apr 2022 14:41:53 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:49637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ncAbH-0000d0-6s; Wed, 06 Apr 2022 14:41:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DB3C5C0183;
 Wed,  6 Apr 2022 14:41:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Apr 2022 14:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=6+XqGsvn/ukGBhUEQbWvzHSWpuMTQe
 dakN4clA1ThM4=; b=fPq3sgfSfPsZ0zwg1Q9z/HFGdM02NJpORR2rBplMOXORrG
 FCRsxcL3qO1qbMJwLejWoOTuPXoJq+eeYES2n3CfL1DZ9J7399QXDXIBafGc6KNl
 3cisGC8EZ25YNZlPaxBE8b1Zk+FcntNbz9wyS3MbwYIQWJpltf1Coq+Eq8thWUwo
 kN+1iQDJ8ZIaN3ZJoRYieRBwNjwL4eTKWjzT0MUSHdGr74Z/pG5uhfGoALVoNXza
 H4WKjsFxnQWsOPCHiCnCEM1ygsz48fS/gK479MUrTSut4IFTVvrENqQ2NOp6npHn
 1XpNbA4pwtTqMvQe0S/sruHNM6NoVkrw8U2aPb9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6+XqGsvn/ukGBhUEQ
 bWvzHSWpuMTQedakN4clA1ThM4=; b=f3Gx3IUQ+4u6tLYmvoNsqqOJxdft79E7O
 uWXHDXFERVRpznWMqZKOcnN+nhbuf/jaird0fv/kIkDqtyQRCZUoGtpqsgU9NiTN
 GpVb8K9hDc06C2r9cW0d3yHZMWvDMxjfwOxj5pwzRVBr/UhIZ0rGQxYMuQeQckP2
 yBiapGUAP8v3FW5QnB4BjIYLMVPmZjLfApioKwOiB+YTSfXFWIrdQ9vauBmQ0NEr
 8Aot2A18E+O0Gbi2OAO6onXmCstAt3yhMmcwxoDHHm3LIAjxiO6DZBrUrTkidd1J
 6/KeEphp4UScvZrQJtUKNkdPBc0tLX4f9JzjCI0DfiFX0F7Sg3Frg==
X-ME-Sender: <xms:695NYhk4M6nq5KOQhxfyXE7Zav-03k1K8emgBiFV6O7Qp9xNCMNowA>
 <xme:695NYs10N7ymwNypFa10imX6mn1EtU_cU_V1prydOK7BseHam5M6wz2Kq279AKHMr
 cl7d_em6V1yuNH5HtI>
X-ME-Received: <xmr:695NYnpB6WDAlOpe9DJzSNgZvW7YQZqyj1CEhJsGFN1IeZ-2w0BF7bogB455-Q9ISSWjqbBA6JG8YthevVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:695NYhnpf0HN9DIxePuZj4ecJ87EjcqUgVJ-e9rDKgKaOPqOHcpLEw>
 <xmx:695NYv15MpwSl7dvPvywne3tFyCGHZtfcYPcsefoCCPbcUEfu0hUrA>
 <xmx:695NYgvbOTccGCYjq151dnnQnwrSm33viCgG9T0MWC-PBRAuRG76pg>
 <xmx:7d5NYtPuO59PSrCDBiJkVLBglNnnsnD8FkU4LJo7nGBmRNO99-FvjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 14:41:45 -0400 (EDT)
Date: Wed, 6 Apr 2022 20:41:43 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Delevoryas <pdel@fb.com>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <Yk3e50/gr+7RwNuY@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <CA9A7D12-EA42-450B-B378-92D53D3D22EF@fb.com>
 <Yk0uP2BHaOTBQDf2@apples>
 <3BBAF589-4650-4F12-8343-828210B78FB4@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="waiERP1w1YigxTqS"
Content-Disposition: inline
In-Reply-To: <3BBAF589-4650-4F12-8343-828210B78FB4@fb.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--waiERP1w1YigxTqS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 17:03, Peter Delevoryas wrote:
>=20
>=20
> > On Apr 5, 2022, at 11:07 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > On Apr 5 20:52, Peter Delevoryas wrote:
> >>=20
> >>=20
> >>> On Mar 31, 2022, at 9:57 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> >>>=20
> >>> From: Klaus Jensen <k.jensen@samsung.com>
> >>>=20
> >>> Hi all,
> >>>=20
> >>> This RFC series adds I2C "slave mode" support for the Aspeed I2C
> >>> controller as well as the necessary infrastructure in the i2c core to
> >>> support this.
> >>>=20
> >>> Background
> >>> ~~~~~~~~~~
> >>> We are working on an emulated NVM Express Management Interface[1] for
> >>> testing and validation purposes. NVMe-MI is based on the MCTP
> >>> protocol[2] which may use a variety of underlying transports. The one=
 we
> >>> are interested in is I2C[3].
> >>>=20
> >>> The first general trickery here is that all MCTP transactions are bas=
ed
> >>> on the SMBus Block Write bus protocol[4]. This means that the slave m=
ust
> >>> be able to master the bus to communicate. As you know, hw/i2c/core.c
> >>> currently does not support this use case.
> >>=20
> >> This is great, I=E2=80=99m attempting to use your changes right now fo=
r the same thing (MCTP).
> >>=20
> >=20
> > Awesome!
> >=20
> >>>=20
> >>> The second issue is how to interact with these mastering devices. Jer=
emy
> >>> and Matt (CC'ed) have been working on an MCTP stack for the Linux Ker=
nel
> >>> (already upstream) and an I2C binding driver[5] is currently under
> >>> review. This binding driver relies on I2C slave mode support in the I=
2C
> >>> controller.
> >>>=20
> >>> This series
> >>> ~~~~~~~~~~~
> >>> Patch 1 adds support for multiple masters in the i2c core, allowing
> >>> slaves to master the bus and safely issue i2c_send/recv(). Patch 2 ad=
ds
> >>> an asynchronous send i2c_send_async(I2CBus *, uint8) on the bus that
> >>> must be paired with an explicit ack using i2c_ack(I2CBus *).
> >>>=20
> >>> Patch 3 adds the slave mode functionality to the emulated Aspeed I2C
> >>> controller. The implementation is probably buggy since I had to rely =
on
> >>> the implementation of the kernel driver to reverse engineer the behav=
ior
> >>> of the controller slave mode (I do not have access to a spec sheet for
> >>> the Aspeed, but maybe someone can help me out with that?).
> >>>=20
> >>> Finally, patch 4 adds an example device using this new API. The device
> >>> is a simple "echo" device that upon being sent a set of bytes uses the
> >>> first byte as the address of the slave to echo to.
> >>>=20
> >>> With this combined I am able to boot up Linux on an emulated Aspeed 2=
600
> >>> evaluation board and have the i2c echo device write into a Linux slave
> >>> EEPROM. Assuming the echo device is on address 0x42:
> >>>=20
> >>> # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
> >>> i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
> >>> # i2cset -y 15 0x42 0x64 0x00 0xaa i
> >>> # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
> >>> 0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
> >>> 0000010 ffff ffff ffff ffff ffff ffff ffff ffff
> >>> *
> >>> 0000100
> >>=20
> >> When I try this with my system, it seems like the i2c-echo device take=
s over
> >> the bus but never echoes the data to the EEPROM. Am I missing somethin=
g to
> >> make this work? It seems like the =E2=80=9Ci2c_send_async=E2=80=9D cal=
ls aren=E2=80=99t happening,
> >> which must be because the bottom half isn=E2=80=99t being scheduled, r=
ight? After
> >> the i2c_do_start_transfer, how is the bottom half supposed to be sched=
uled
> >> again? Is the slave receiving (the EEPROM) supposed to call i2c_ack or=
 something?
> >>=20
> >> root@bmc-oob:~# echo 24c02 0x1064 > /sys/bus/i2c/devices/i2c-8/new_dev=
ice
> >> [ 135.559719] at24 8-1064: 256 byte 24c02 EEPROM, writable, 1 bytes/wr=
ite
> >> [ 135.562661] i2c i2c-8: new_device: Instantiated device 24c02 at 0x64
> >> root@bmc-oob:~# i2cset -y 8 0x42 0x64 0x00 0xaa i
> >> i2c_echo_event: start send
> >> i2c_echo_send: data[0] =3D 0x64
> >> i2c_echo_send: data[1] =3D 0x00
> >> i2c_echo_send: data[2] =3D 0xaa
> >> i2c_echo_event: scheduling bottom-half
> >> i2c_echo_bh: attempting to gain mastery of bus
> >> i2c_echo_bh: starting a send to address 0x64
> >> root@bmc-oob:~# hexdump -C /sys/bus/i2c/devices/8-1064/eeprom
> >> 00000000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 |............=
=2E...|
> >> *
> >> 00000100
> >>=20
> >> Thanks again for this, it=E2=80=99s exactly what I needed.
> >>=20
> >=20
> > Hmmm. The only obvious difference I see here is that I write
> > "slave-24c02" and not just "24c02" to new_device. Not sure if that has
> > any implications? Also, looks like your EEPROM is initialized with
> > zeroes, mine is all ones. This hints at the device being instantiated is
> > different. I'm also not seeing the 'at24', which upon looking in the
> > kernel code is a different device?
>=20
> Are you letting the kernel control the EEPROM?
>=20
> If I actually let the kernel control it, then I can=E2=80=99t use i2cset,=
 because
> the kernel seems to be keeping the bus busy/etc. I tried i2c bus 9 this t=
ime.
>=20
> root@bmc-oob:~# i2cset -y 9 0x64 0x00 0xaa i
> Error: Could not set address to 0x64: Device or resource busy
>=20
> However, if I don=E2=80=99t instantiate a kernel device, and I just use i=
2cset/i2cget,
> I can control the EEPROM:
>=20
> root@bmc-oob:~# i2cset -y 9 0x64 0x00 0xcc i
> root@bmc-oob:~# i2cget -y 9 0x64 0x00 i
> 0xcc 0xb9 0x4d 0xe1 0x42 0x56 0x00 0x00 0xc5 0x5b 0x28 0xe1 0x42 0x56 0x0=
0 0x00 0x00 0x61 0x13 0xe2 0x42 0x56 0x00 0x00 0xb7 0x64 0x28 0xe1 0x42
>  0x56 0x00 0x00
>=20
> Unfortunately, i2c-echo still doesn=E2=80=99t seem to send its data:
>=20
> root@bmc-oob:~# i2cset -y 9 0x42 0x64 0x00 0xaa i
> i2c_echo_event: start send
> i2c_echo_send: data[0] =3D 0x64
> i2c_echo_send: data[1] =3D 0x00
> i2c_echo_send: data[2] =3D 0xaa
> i2c_echo_event: scheduling bottom-half
> i2c_echo_bh: attempting to gain mastery of bus
> i2c_echo_bh: starting a send to address 0x64
>=20
> What is the exact sequence of events once i2c-echo
> starts a new transfer? Does the slave device ACK
> the start, or does it just wait for data to be sent?
>=20
> And then if I try to read the EEPROM:
>=20
> root@bmc-oob:~# i2cget -y 9 0x64 0x00 i
> smbus: error: Unexpected send start condition in state 1
> smbus: error: Unexpected write in state -1
> smbus: error: Unexpected recv start condition in state -1
> smbus: error: Unexpected read in state -1
> smbus: error: Unexpected read in state -1
> smbus: error: Unexpected read in state -1
>=20
> I=E2=80=99ll try debugging/refactoring further to see why it=E2=80=99s no=
t working.
>=20
> By the way, this is my i2c_init code in QEMU to ensure
> a QEMU EEPROM model is present:
>=20
> static void fby35_i2c_init(AspeedMachineState *bmc)
> {
>     I2CBus *i2c[16];
>=20
>     for (int i =3D 0; i < 16; i++) {
>         i2c[i] =3D aspeed_i2c_get_bus(&bmc->soc.i2c, i);
>         assert(i2c[i] !=3D NULL);
>     }
>=20
>     i2c_slave_create_simple(i2c[9], "i2c-echo", 0x42);
>     uint8_t buf[256] =3D {0xff};
>     smbus_eeprom_init_one(i2c[9], 0x64, buf);
> }
>=20
> This is an AST2600-based board too.
>=20

Oh. You are trying to echo to an actual EEPROM device on the board? In
that case yes. The new async API currently only works with the slave
device on the i2c controller. The i2c echo device cannot talk to any
other slave devices since they do not implement the asynchronous send.

--waiERP1w1YigxTqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJN3uAACgkQTeGvMW1P
Dem3AggAlOWgAi3nwXXD3LxBZJ61U15BVsyT9mqzmaYXNCb+PbkzVbh8h3J8RG8l
wGVFYP/JpZCR5Gx7qvRPZfQh2HOZTeepO4FR/JUcaGsPJy7VMXM15vLwt6p/9vM1
V1uD2uCBR7vs8JfgIM2n5Oupr3Y74QfFjH3m/of3YDkb7oXfvJN14niY4ayfNceo
BtwfUrNR053un6m8bwSPQ0KN++tbeg9GKZwiXzCAyczYGPl0W6z3HeT5qx9LvGLd
CO5tgjlAJwzCr7kfnDhgjCs2qo/07wYaZqhs6Y2IuPSPTI5ZEXoS9NnHdGzJY0aH
fMZXjU9AJpXF9dEL9h0GD7ZXirDVxQ==
=C38N
-----END PGP SIGNATURE-----

--waiERP1w1YigxTqS--

