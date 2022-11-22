Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FCF633763
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOuX-0007Qo-79; Tue, 22 Nov 2022 03:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOuS-0007Os-Gb; Tue, 22 Nov 2022 03:45:40 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oxOuP-0001Dc-OF; Tue, 22 Nov 2022 03:45:40 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DCD673200684;
 Tue, 22 Nov 2022 03:45:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Nov 2022 03:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1669106733; x=1669193133; bh=1+
 uCT2S1uK9L/q9TTOx7m/rrYIJ+/lAMJuLOmYHm3Vg=; b=X0yBqIq5U7sL4snweZ
 INdNsvXz3hAePCVzt+BNN5L25jZCQDiaqj8kuhbm2xWrxgmr+fNEkYbsOCEXLtAx
 J5uW3itjJ/BZ+kZMyP6rXkMN1DhN9+454xEEoY1AL9xf0wYHi+ehubTt/wg05j4E
 +H/PLfGMgvzUqkMzdFjcQ6DyzRVDF1mGG68OQLXXKFXTaZKvTROKcP/b1Zxswwp0
 Yb0Jj1SHHLC19d1p0a2VI4VlaozVhhKvNeFyZNbjRzoh2Ym3l0e1V4WrJjd+Z5lr
 hPHnlGAMEZ1hxoZnu+9UPdAoKsCLYGOpKGgra45MC1L2kyCiL/klB8tXqteW/Wtw
 h8GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1669106733; x=1669193133; bh=1+uCT2S1uK9L/q9TTOx7m/rrYIJ+
 /lAMJuLOmYHm3Vg=; b=MlY1rMdVCfJrT9A75dPWhCtaiR4S527xbmfq6PYKGhG5
 XtQ5Yw3pjxWZlE5c1OBp3JI+/tJr8vSzLSpsQFhTKpKqBmfjhbh6ZDx8AzKAlcxf
 +WRzxPX5y2cWI1P9lFkVAPlP7YwnQsfDUQPBlXqgB6awbKTOt+cMdaCRl/n4Y7rP
 8tXJjFVGd9YwCPxEfVeAgemVrmFHoWXfqNJIzBt10Z87p/vq3ycNiLWbZMIfmSnz
 BPq3iIbjwwBYa9WfNiRG53dBYoKM94akWwwdZFqYtfcY3b6qvkLoRa3536EGRa45
 Szhl9kP6eF5MZWa9XnPZ2Zx8NQf4FTVSi0WG7n2W7Q==
X-ME-Sender: <xms:LIx8Y_VDzpdEyLOWVv7hQtxC5N06GN1qOY3WugZw6yTKGAjAPxsUvQ>
 <xme:LIx8Y3kps1dfGqQ-ievfBZt0Nd-UCD02Hxi8Xkoeyzd-Lw3uF9ioZUOFtT7I7Tfgv
 ok-yRGdzsnow77jflo>
X-ME-Received: <xmr:LIx8Y7a2d29EAHUHeM16lZ2GPm_r8DvtcQWwnlEVStNqHRObWyvUtLFi_xN1aqT_yv7htSsCSst5VTVe0BnN8wY-7P6pnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheejgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LIx8Y6W7y4wRgy01xfVmnGM5nAcC6T3HzacysF8GOa9Gy0Kp9Wr1ow>
 <xmx:LIx8Y5nntEsEkRFHHAEmMkTDv4F6-H0u8qrHenB_YWS2MEkwJW36ww>
 <xmx:LIx8Y3euDHQR0FGFQGVhn1XjhmV-GOdepUywMildKjCjaAPoSh8COg>
 <xmx:LYx8Y_dMF31WNdKek0eTKSWCUGvHutPgKVPfpHqRE3IDLLZ3TxI4iw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Nov 2022 03:45:30 -0500 (EST)
Date: Tue, 22 Nov 2022 09:45:28 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Message-ID: <Y3yMKAhOkYGtnkOp@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
 <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
 <Y3Xktt8b85RvJ89A@cormorant.local>
 <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
 <Y3YiAhXX1FKuYMoc@cormorant.local>
 <15100caa-4c03-a166-7ce3-fe1d30471a30@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ibs2BxjMsZz8zP+m"
Content-Disposition: inline
In-Reply-To: <15100caa-4c03-a166-7ce3-fe1d30471a30@kaod.org>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--Ibs2BxjMsZz8zP+m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 14:40, C=C3=A9dric Le Goater wrote:
> On 11/17/22 12:58, Klaus Jensen wrote:
> > On Nov 17 09:01, C=C3=A9dric Le Goater wrote:
> > > On 11/17/22 08:37, Klaus Jensen wrote:
> > > > On Nov 17 07:56, C=C3=A9dric Le Goater wrote:
> > > > > On 11/17/22 07:40, Klaus Jensen wrote:
> > > > > > On Nov 16 16:58, C=C3=A9dric Le Goater wrote:
> > > > > > > On 11/16/22 09:43, Klaus Jensen wrote:
> > > > > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > > > > >=20
> > > > > > > > It is not given that the current master will release the bu=
s after a
> > > > > > > > transfer ends. Only schedule a pending master if the bus is=
 idle.
> > > > > > > >=20
> > > > > > > > Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> > > > > > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > > > > > ---
> > > > > > > >      hw/i2c/aspeed_i2c.c  |  2 ++
> > > > > > > >      hw/i2c/core.c        | 37 ++++++++++++++++++++++------=
---------
> > > > > > > >      include/hw/i2c/i2c.h |  2 ++
> > > > > > > >      3 files changed, 26 insertions(+), 15 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > > > > > index c166fd20fa11..1f071a3811f7 100644
> > > > > > > > --- a/hw/i2c/aspeed_i2c.c
> > > > > > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > > > > > @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(A=
speedI2CBus *bus, uint64_t value)
> > > > > > > >              }
> > > > > > > >              SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_=
STOP_CMD, 0);
> > > > > > > >              aspeed_i2c_set_state(bus, I2CD_IDLE);
> > > > > > > > +
> > > > > > > > +        i2c_schedule_pending_master(bus->bus);
> > > > > > >=20
> > > > > > > Shouldn't it be i2c_bus_release() ?
> > > > > > >=20
> > > > > >=20
> > > > > > The reason for having both i2c_bus_release() and
> > > > > > i2c_schedule_pending_master() is that i2c_bus_release() sort of=
 pairs
> > > > > > with i2c_bus_master(). They either set or clear the bus->bh mem=
ber.
> > > > > >=20
> > > > > > In the current design, the controller (in this case the Aspeed =
I2C) is
> > > > > > an "implicit" master (it does not have a bottom half driving it=
), so
> > > > > > there is no bus->bh to clear.
> > > > > >=20
> > > > > > I should (and will) write some documentation on the asynchronou=
s API.
> > > > >=20
> > > > > I found the routine names confusing. Thanks for the clarification.
> > > > >=20
> > > > > Maybe we could do this rename  :
> > > > >=20
> > > > >     i2c_bus_release()             -> i2c_bus_release_and_clear()
> > > > >     i2c_schedule_pending_master() -> i2c_bus_release()
> > > > >=20
> > > > > and keep i2c_schedule_pending_master() internal the I2C core subs=
ystem.
> > > > >=20
> > > >=20
> > > > How about renaming i2c_bus_master to i2c_bus_acquire() such that it
> > > > pairs with i2c_bus_release().
> > >=20
> > > Looks good to me.
> > >=20
> > > > And then add an i2c_bus_yield() to be used by the controller? I thi=
nk we
> > > > should be able to assert in i2c_bus_yield() that bus->bh is NULL. B=
ut
> > > > I'll take a closer look at that.
> > >=20
> > > I am using your i2c-echo slave device to track regressions in the Asp=
eed
> > > machines. May be we could merge it for tests ?
> > >=20
> >=20
> > Oh, cool.
> >=20
> > Sure, I'd be happy to help "maintain" it ;)
>=20
> And so, I am seeing errors with the little POC you sent.
>=20
> without:
>   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
>   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_dev=
ice
>   console: [    4.252431] i2c i2c-3: new_device: Instantiated device slav=
e-24c02 at 0x64
>   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
>   /console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
>   console: 0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>   console: poweroff
>   console: 0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>   console: *
>   console: 0000100
>=20
> with:
>   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
>   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_dev=
ice
>   console: [    4.413210] i2c i2c-3: new_device: Instantiated device slav=
e-24c02 at 0x64
>   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
>   console: 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
>   console: *
>   console: 0000100
> C.

Right.

This is because the i2c-echo device is scheduling the bottom half
initially on its own. What happens is that the bottom half gets queued
up in the pending masters list instead of being scheduling directly. And
since the i2c controller is idle, the bottom half is never scheduled.

Fixing i2c_bus_acquire() to schedulue it directly if the bus is free
seems the proper way to do it. I'll include that in v2.

While it is not directly invalid, the echo device should be fixed to
better align with the api, like so:

--- hw/misc/i2c-echo.c.orig	2022-11-22 09:35:00.478173652 +0100
+++ hw/misc/i2c-echo.c	2022-11-22 09:34:31.428174379 +0100
@@ -9,7 +9,6 @@

 enum i2c_echo_state {
     I2C_ECHO_STATE_IDLE,
-    I2C_ECHO_STATE_REQUEST_MASTER,
     I2C_ECHO_STATE_START_SEND,
     I2C_ECHO_STATE_ACK,
 };
@@ -34,11 +33,6 @@
     case I2C_ECHO_STATE_IDLE:
         return;

-    case I2C_ECHO_STATE_REQUEST_MASTER:
-        i2c_bus_acquire(state->bus, state->bh);
-        state->state =3D I2C_ECHO_STATE_START_SEND;
-        return;
-
     case I2C_ECHO_STATE_START_SEND:
         if (i2c_start_send_async(state->bus, state->data[0])) {
             goto release_bus;
@@ -85,8 +79,8 @@

     case I2C_FINISH:
         state->pos =3D 0;
-        state->state =3D I2C_ECHO_STATE_REQUEST_MASTER;
-        qemu_bh_schedule(state->bh);
+        state->state =3D I2C_ECHO_STATE_START_SEND;
+        i2c_bus_acquire(state->bus, state->bh);

         break;

--Ibs2BxjMsZz8zP+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN8jCcACgkQTeGvMW1P
DekPiQf/Xi9TcTYD7GBFDFckEdl3zSu0vHvHSVC5Ryl2yw8BOsR4xBvnRFUz5EeG
eFHJSl+WutFyBS0PwN90T8hVHPG+a1kDnw7wID9JvYUUtMgPhPDi4DbDA1TbvpXS
BF7RYvEctNvH6sasoBnwHRjCjgZBKmvVkdCxgeJxV0V244CrZXv/+4tn36MJWpSY
rhPFyIqZN/V8w56sieu8ds3Vggfgpw5fO+Ovt6p1xe4AP4nSw7X1XrogCenyGtDX
2hrLcIGzfj3+KjJpLHYWhPB2hRrVG8FDG1e+Nfs6Wq9QNjUgL3bovu80OJX+0aEx
7NQ1q89X83cmP7ebZxieEm5sWyxOQQ==
=VObn
-----END PGP SIGNATURE-----

--Ibs2BxjMsZz8zP+m--

