Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FA62D3A3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYkw-0006wc-Ms; Thu, 17 Nov 2022 01:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYkk-0006vy-Nt; Thu, 17 Nov 2022 01:52:02 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYki-0006sk-12; Thu, 17 Nov 2022 01:52:02 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DEBA5C04BF;
 Thu, 17 Nov 2022 01:51:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 17 Nov 2022 01:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668667917; x=1668754317; bh=kB
 sEAOEFyHQb1BU8moJih3vzxz2wvB5tnw+p6EM17zM=; b=VQnlPcu2ZX4K3vtwma
 Y6/eNCa2bS+ILkfSDKyFXrpTmCPHG3PKnlpOox4OImgQFz1Ah13tVpg4Xv8novid
 5QjaSLoyjDMdic1DlSjuIZSiXU8xi8b6MQPR0niqtI4QqyGQ1wHz/xCcxUPwY2Dr
 iHzW79Zen3kiN/kcSv1t7M6WlUSC82aMFVXqK4kvCqcrWC55PjO5HYOHU4mTA3uB
 opUcxVx81ZCORYwOdYjxIvtCiWz+0MxGEtg5AboOzVCCbBKcV/oYcED5MJpTlTjE
 qZPDIlGlLR/jtOxBvwZkTIr/RuY7ormnK0PE3yWURkI2Yq2XSzwa3PDfzdjZh65f
 BKEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668667917; x=1668754317; bh=kBsEAOEFyHQb1BU8moJih3vzxz2w
 vB5tnw+p6EM17zM=; b=WBkixprlj4AJhtjDQTQ/bvFS1VwjDyXByjAUs00vzz3T
 AnzLEBoCi/4ohJiZUiKp36xy3oJLJJ+vx8NvS5uFa1KGpfvJUHRcPApHDVP3bEHy
 rmu4OGJlUcmt5ReryPI3Tq5Z5zNMygq+xT6NAS8POQQ+dXio+2Jll3LX18Jsa4u3
 xe7tCv9nYDUNm8gEcSxb8vpxSlLiFNEqTrK2q55tK10lOIC3q4DtirIZk3491yW5
 5lvc0ARlgevBFJDUS8G5g9RfP5axknvg1fsKP3JQc4vYe1iifL5jsf1PsSY9KSwK
 uKmc9dlJRz4iy8o2Y0z4NNHLNKZJadrz0gqS065y7Q==
X-ME-Sender: <xms:DNp1Y8Y65xiRT-W54qkEeM6TW1DT5r9uIp9YBxGbMO_rR431CV1Cbw>
 <xme:DNp1Y3YGwIOSQO7zUTNoMqR5bc3mBbtRkO0ewW3DrUAak1JPgK1hsz3DyB5PbM8Cf
 O88kiKILvH51fhPcXM>
X-ME-Received: <xmr:DNp1Y28cud69nbw7hlz-8Mc0M7o8G3Iv74hYKv4943vMc-yu5_SbqWxjtqVhhGV2jtuIXcKfas6nCbWJwAFKj1xyCW3wcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepffduvdfhheejudfgieejueeileegveduvdelhfekhffgteetffdtvdekveei
 leefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DNp1Y2pBlOFIotYvKI2_Mnwp0corG3fXyP5lE9ba-5qHifzTaoDTGw>
 <xmx:DNp1Y3ra4LS0aUYkig8tUDrRyMM1LHrNLumGwTlegnLqQKNVDEWl2g>
 <xmx:DNp1Y0Q-Zb2nnGBetserj1boP6iH18xlSTKcG0ar2JYz_gUJ4V668A>
 <xmx:Ddp1Y1g_MoRwt8CFi5RJJh1uJ810VThi146UoW0bmPARoApev5zR1w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 01:51:54 -0500 (EST)
Date: Thu, 17 Nov 2022 07:51:52 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
Message-ID: <Y3XaCMMhYOPiZf+q@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <Y3TzYnSmB+UDD6st@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wH64PgJcF3tmjIVo"
Content-Disposition: inline
In-Reply-To: <Y3TzYnSmB+UDD6st@minyard.net>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--wH64PgJcF3tmjIVo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 08:27, Corey Minyard wrote:
> On Wed, Nov 16, 2022 at 09:43:11AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add an abstract MCTP over I2C endpoint model. This implements MCTP
> > control message handling as well as handling the actual I2C transport
> > (packetization).
> >=20
> > Devices are intended to derive from this and implement the class
> > methods.
> >=20
> > Parts of this implementation is inspired by code[1] previously posted by
> > Jonathan Cameron.
>=20
> I have some comments inline, mostly about buffer handling.  Buffer
> handling is scary to me, so you might see some paranoia here :-).
>=20

Totally understood :) Thanks for the review!

> >=20
> >   [1]: https://lore.kernel.org/qemu-devel/20220520170128.4436-1-Jonatha=
n.Cameron@huawei.com/
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/arm/Kconfig         |   1 +
> >  hw/i2c/Kconfig         |   4 +
> >  hw/i2c/mctp.c          | 365 +++++++++++++++++++++++++++++++++++++++++
> >  hw/i2c/meson.build     |   1 +
> >  hw/i2c/trace-events    |  12 ++
> >  include/hw/i2c/mctp.h  |  83 ++++++++++
> >  include/hw/misc/mctp.h |  43 +++++
> >  7 files changed, 509 insertions(+)
> >  create mode 100644 hw/i2c/mctp.c
> >  create mode 100644 include/hw/i2c/mctp.h
> >  create mode 100644 include/hw/misc/mctp.h
> >=20
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 17fcde8e1ccc..3233bdc193d7 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -444,6 +444,7 @@ config ASPEED_SOC
> >      select DS1338
> >      select FTGMAC100
> >      select I2C
> > +    select MCTP_I2C
> >      select DPS310
> >      select PCA9552
> >      select SERIAL
> > diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> > index 9bb8870517f8..5dd43d550c32 100644
> > --- a/hw/i2c/Kconfig
> > +++ b/hw/i2c/Kconfig
> > @@ -41,3 +41,7 @@ config PCA954X
> >  config PMBUS
> >      bool
> >      select SMBUS
> > +
> > +config MCTP_I2C
> > +    bool
> > +    select I2C
> > diff --git a/hw/i2c/mctp.c b/hw/i2c/mctp.c
> > new file mode 100644
> > index 000000000000..46376de95a98
> > --- /dev/null
> > +++ b/hw/i2c/mctp.c
> > @@ -0,0 +1,365 @@
> > +/*
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + * SPDX-FileCopyrightText: Copyright (c) 2022 Samsung Electronics Co.,=
 Ltd.
> > + * SPDX-FileContributor: Klaus Jensen <k.jensen@samsung.com>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +
> > +#include "hw/qdev-properties.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "hw/i2c/mctp.h"
> > +
> > +#include "trace.h"
> > +
> > +static uint8_t crc8(uint16_t data)
> > +{
> > +#define POLY (0x1070U << 3)
> > +    int i;
> > +
> > +    for (i =3D 0; i < 8; i++) {
> > +        if (data & 0x8000) {
> > +            data =3D data ^ POLY;
> > +        }
> > +
> > +        data =3D data << 1;
> > +    }
> > +
> > +    return (uint8_t)(data >> 8);
> > +#undef POLY
> > +}
> > +
> > +static uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < len; i++) {
> > +        crc =3D crc8((crc ^ buf[i]) << 8);
> > +    }
> > +
> > +    return crc;
> > +}
>=20
> The PEC calculation probably belongs in it's own smbus.c file, since
> it's generic, so someone looking will find it.
>=20

Makes sense. I'll move it.

> > +
> > +void i2c_mctp_schedule_send(MCTPI2CEndpoint *mctp)
> > +{
> > +    I2CBus *i2c =3D I2C_BUS(qdev_get_parent_bus(DEVICE(mctp)));
> > +
> > +    mctp->tx.state =3D I2C_MCTP_STATE_TX_START_SEND;
> > +
> > +    i2c_bus_master(i2c, mctp->tx.bh);
> > +}
> > +
> > +static void i2c_mctp_tx(void *opaque)
> > +{
> > +    DeviceState *dev =3D DEVICE(opaque);
> > +    I2CBus *i2c =3D I2C_BUS(qdev_get_parent_bus(dev));
> > +    I2CSlave *slave =3D I2C_SLAVE(dev);
> > +    MCTPI2CEndpoint *mctp =3D MCTP_I2C_ENDPOINT(dev);
> > +    MCTPI2CEndpointClass *mc =3D MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> > +    MCTPI2CPacket *pkt =3D (MCTPI2CPacket *)mctp->buffer;
> > +    uint8_t flags =3D 0;
> > +
> > +    switch (mctp->tx.state) {
> > +    case I2C_MCTP_STATE_TX_SEND_BYTE:
> > +        if (mctp->pos < mctp->len) {
> > +            uint8_t byte =3D mctp->buffer[mctp->pos];
> > +
> > +            trace_i2c_mctp_tx_send_byte(mctp->pos, byte);
> > +
> > +            /* send next byte */
> > +            i2c_send_async(i2c, byte);
> > +
> > +            mctp->pos++;
> > +
> > +            break;
> > +        }
> > +
> > +        /* packet sent */
> > +        i2c_end_transfer(i2c);
> > +
> > +        /* fall through */
> > +
> > +    case I2C_MCTP_STATE_TX_START_SEND:
> > +        if (mctp->tx.is_control) {
> > +            /* packet payload is already in buffer */
> > +            flags |=3D MCTP_H_FLAGS_SOM | MCTP_H_FLAGS_EOM;
> > +        } else {
> > +            /* get message bytes from derived device */
> > +            mctp->len =3D mc->get_message_bytes(mctp, pkt->mctp.payloa=
d,
> > +                                              I2C_MCTP_MAXMTU, &flags);
> > +        }
> > +
> > +        if (!mctp->len) {
> > +            trace_i2c_mctp_tx_done();
> > +
> > +            /* no more packets needed; release the bus */
> > +            i2c_bus_release(i2c);
> > +
> > +            mctp->state =3D I2C_MCTP_STATE_IDLE;
> > +            mctp->tx.is_control =3D false;
> > +
> > +            break;
> > +        }
> > +
> > +        mctp->state =3D I2C_MCTP_STATE_TX;
> > +
> > +        pkt->i2c =3D (MCTPI2CPacketHeader) {
> > +            .dest =3D mctp->tx.addr & ~0x1,
> > +            .prot =3D 0xf,
> > +            .byte_count =3D 5 + mctp->len,
> > +            .source =3D slave->address << 1 | 0x1,
> > +        };
> > +
> > +        pkt->mctp.hdr =3D (MCTPPacketHeader) {
> > +            .version =3D 0x1,
> > +            .eid.dest =3D mctp->tx.eid,
> > +            .eid.source =3D mctp->my_eid,
> > +            .flags =3D flags | (mctp->tx.pktseq++ & 0x3) << 4 | mctp->=
tx.flags,
> > +        };
> > +
> > +        mctp->len +=3D sizeof(MCTPI2CPacket);
>=20
> Do you need overflow checking here?  There are lots of increments of
> mctp->len in the code that might or might not need overflow checks.
> It does seem like you have pre-calculated everything so it fits; I worry
> more about later changes that might violate those assumptions.
> You could use something like i2c_mctp_send_cb() to send all data.  Not
> sure, but something to think about.
>=20

I agree. It would be better to be a bit defensive here. I'll rework it.

> > +        mctp->buffer[mctp->len] =3D i2c_smbus_pec(0, mctp->buffer, mct=
p->len);
> > +        mctp->len++;
> > +
> > +        trace_i2c_mctp_tx_start_send(mctp->len);
> > +
> > +        i2c_start_send_async(i2c, pkt->i2c.dest >> 1);
> > +
> > +        /* already "sent" the destination slave address */
> > +        mctp->pos =3D 1;
> > +
> > +        mctp->tx.state =3D I2C_MCTP_STATE_TX_SEND_BYTE;
> > +
> > +        break;
> > +    }
> > +}
> > +
> > +#define i2c_mctp_control_data(buf) \
> > +    (i2c_mctp_payload(buf) + offsetof(MCTPControlMessage, data))
> > +
> > +static void i2c_mctp_handle_control_set_eid(MCTPI2CEndpoint *mctp, uin=
t8_t eid)
> > +{
> > +    mctp->my_eid =3D eid;
> > +
> > +    uint8_t buf[] =3D {
> > +        0x0, 0x0, eid, 0x0,
> > +    };
> > +
> > +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> > +    mctp->len +=3D sizeof(buf);
> > +}
> > +
> > +static void i2c_mctp_handle_control_get_eid(MCTPI2CEndpoint *mctp)
> > +{
> > +    uint8_t buf[] =3D {
> > +        0x0, mctp->my_eid, 0x0, 0x0,
> > +    };
> > +
> > +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> > +    mctp->len +=3D sizeof(buf);
> > +}
> > +
> > +static void i2c_mctp_handle_control_get_version(MCTPI2CEndpoint *mctp)
> > +{
> > +    uint8_t buf[] =3D {
> > +        0x0, 0x1, 0x0, 0x1, 0x3, 0x1,
> > +    };
> > +
> > +    memcpy(i2c_mctp_control_data(mctp->buffer), buf, sizeof(buf));
> > +    mctp->len +=3D sizeof(buf);
> > +}
> > +
> > +enum {
> > +    MCTP_CONTROL_SET_EID                    =3D 0x01,
> > +    MCTP_CONTROL_GET_EID                    =3D 0x02,
> > +    MCTP_CONTROL_GET_VERSION                =3D 0x04,
> > +    MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT   =3D 0x05,
> > +};
> > +
> > +static void i2c_mctp_handle_control(MCTPI2CEndpoint *mctp)
> > +{
> > +    MCTPI2CEndpointClass *mc =3D MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> > +    MCTPControlMessage *msg =3D (MCTPControlMessage *)i2c_mctp_payload=
(mctp->buffer);
> > +
> > +    /* clear Rq/D */
> > +    msg->flags &=3D 0x1f;
> > +
> > +    mctp->len =3D offsetof(MCTPControlMessage, data);
> > +
> > +    trace_i2c_mctp_handle_control(msg->command);
> > +
> > +    switch (msg->command) {
> > +    case MCTP_CONTROL_SET_EID:
> > +        i2c_mctp_handle_control_set_eid(mctp, msg->data[1]);
> > +        break;
> > +
> > +    case MCTP_CONTROL_GET_EID:
> > +        i2c_mctp_handle_control_get_eid(mctp);
> > +        break;
> > +
> > +    case MCTP_CONTROL_GET_VERSION:
> > +        i2c_mctp_handle_control_get_version(mctp);
> > +        break;
> > +
> > +    case MCTP_CONTROL_GET_MESSAGE_TYPE_SUPPORT:
> > +        mctp->len +=3D mc->get_message_types(mctp, i2c_mctp_control_da=
ta(mctp->buffer));
>=20
> You don't pass in how much data is available for the subclass to use.
> That's generally good API behavior.
>=20

True, I'll fix it up.

> > +        break;
> > +
> > +    default:
> > +        trace_i2c_mctp_unhandled_control(msg->command);
> > +
> > +        msg->data[0] =3D MCTP_CONTROL_ERROR_UNSUPPORTED_CMD;
> > +        mctp->len++;
> > +
> > +        break;
> > +    }
> > +
> > +    i2c_mctp_schedule_send(mctp);
> > +}
> > +
> > +static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    MCTPI2CEndpoint *mctp =3D MCTP_I2C_ENDPOINT(i2c);
> > +    MCTPI2CEndpointClass *mc =3D MCTP_I2C_ENDPOINT_GET_CLASS(mctp);
> > +    MCTPI2CPacket *pkt =3D (MCTPI2CPacket *)mctp->buffer;
> > +    size_t payload_len;
> > +    uint8_t pec;
> > +
> > +    switch (event) {
> > +    case I2C_START_SEND:
> > +        if (mctp->state !=3D I2C_MCTP_STATE_IDLE) {
> > +            return -1;
> > +        }
> > +
> > +        /* the i2c core eats the slave address, so put it back in */
> > +        pkt->i2c.dest =3D i2c->address << 1;
>=20
> This seems like a bit of a hack since pkt->i2c.dest never seems to be
> used.  I guess it's ok, since it's matching what the specifications say,
> but it seems a bit odd since you don't need it.
>=20

Yeah it is definitely a hack around the i2c core. I need it to calculate
the PEC, so I have to put it into the buffer at some point. I think the
smbus implementation would suffer from this as well. We could maybe fold
that into the i2c_smbus_pec() call instead. I'll see what I can come up
with.

> > +        mctp->len =3D 1;
> > +
> > +        mctp->state =3D I2C_MCTP_STATE_RX_STARTED;
> > +
> > +        return 0;
> > +
> > +    case I2C_FINISH:
> > +        payload_len =3D mctp->len - (1 + offsetof(MCTPI2CPacket, mctp.=
payload));
>=20
> Is there a way this can underflow?
>=20

Hmm. Potentially. I'll audit it.

--wH64PgJcF3tmjIVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN12gcACgkQTeGvMW1P
DenxZwf/aW7VQl3FhwhNNlCOZdfecm+bE0oa4UEHyqximFB/PiqvcJGPqOp5t5yZ
0qAo21GmNHoXTzkbmGouOvaTPn4Em5nyVGkEgZOrDB3uUUIHV3kx9I8E703p/N2s
p6c8VbyAaDC0nAOgMqFti3p6CJNZU1wf5fvSzvBRBLVbRDz89GxBrTkAAbnxok/e
mzImRmPhIxL5KmN39juMeEeiFm68Cs0QAfcUMGueHLFaHVOiSYJUS7NXhqtxb5Lr
vIj31it4P19nschekeLhPxA3OAJSDau1g6r7+p3ZE9HsbJD0YQbn6FVEJpIwn1gE
2aqnu4/ao5LFEpuY1Lb6FW3v5v731A==
=OpLV
-----END PGP SIGNATURE-----

--wH64PgJcF3tmjIVo--

