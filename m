Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095E562030
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wwl-0008G1-V4
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 12:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6wui-00073o-8F; Thu, 30 Jun 2022 12:21:08 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6wuf-0005Uz-Le; Thu, 30 Jun 2022 12:21:08 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 8D1CC2B01197;
 Thu, 30 Jun 2022 12:21:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 30 Jun 2022 12:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656606062; x=
 1656609662; bh=fBnoIdb7VPWX4t3wc4UmKthlwOXAtNcCrrYogMIwD3A=; b=G
 97yRcUgRuYV8/x/nW1vuilfuUiE4nikFhVX5ZHJH4gOA86fQT9teQcDVZIDjrBVT
 m2kSOvMATN8Q4NM9Py8ZFhl7GFJ2X3lDm7V04TaXAP6F3PSkQyJIDWcbphNFVXkt
 pQHjnMdmL6LY4FJ5TJ9YMatk4j6iaLPB2HZjboq85+fYOmqJZdBfbRWwDIyFD1LP
 ViEmFnGSzcz/hwEJSEXgb4FJW/cSPRECQDo9g4fzyY2K8lfGoRUHv8/ZBjuQ8Ed+
 TneKmcq1o8b2hp8cAhhPgMCZSK6MJOZgalwxqmVfXUlt6sdtFtRZwhskwcMganPy
 JyaEIGU0xLjgSi1prdGGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656606062; x=1656609662; bh=fBnoIdb7VPWX4t3wc4UmKthlwOXAtNcCrrY
 ogMIwD3A=; b=YPtbOTxMTXb+t8hLsE7WU2+bUM1scqnFu7NfyWPiqdV+MECrzTh
 UrE9oAC61qmzKEYU6qN4xrj8tggnnkCUL1wgY7rcIPdhqQHwboczu4FkaBGAJfOm
 gSvnfuD09xRoTFYOiNnP1cTc6Py+6oL+dmcdniEU38rmFRqSuk7OQmapn0peF1vO
 DDuKBulAX0lBLt9GkI9Ps61W/+sw/4R9DRU3tjzRfG1P9B1E8MbWyqVdZbAZHopQ
 uc40jUExwpydST78YYbNfe7GzRRnfEjWEEZCo408Bh99YwK0fVGo8hKf8XIQMjLn
 nWlrVzhk+OTZEETDebu3aJllzFw764srCsQ==
X-ME-Sender: <xms:bc29YsdC7pnRiNpQ-3qlFJtbnEZP1gkaCMfrJ4YjJLkDhzTfMXdXLg>
 <xme:bc29YuNU2wO2x-gnW6CX1aGke4JaTvPnzik2Z_JQdCSQJVE7fwIF8bYC7fBhOKdfh
 zuu2XcAy9J_EVKpfqA>
X-ME-Received: <xmr:bc29YthuS8XfJu26UOp1YaUJashGPnJ3RCYLkxm80IksY5a2ePxLPhUfkiGDZ7xhlnZCL2uQlQrBBVWofZr6yjHA1S3XFW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
 ekredttddtudenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehp
 jhgurdguvghvqeenucggtffrrghtthgvrhhnpeegieelieeltdegudehgfdtieefkefgje
 evfeegvddtgfeijedvffdvgeefgfetgfenucffohhmrghinhepmhgvthgrrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehpjh
 gurdguvghv
X-ME-Proxy: <xmx:bc29Yh-ut4qv8eJzZog9QnuXOCaiiEiBbTavrmnYk_04GZKZ_4r90Q>
 <xmx:bc29YovBfLnOe9YMjVwnjInbE0JSJLyqDEu_009OovyE7YdeNr5nyg>
 <xmx:bc29YoHmC4fI24Odw1s-JQMCYtShmNCORNF-kbLEQ_nr1dYyDr3_-Q>
 <xmx:bc29YmC9kyBZhJAIrQbEqHTveoonKTn7hYMAf0H4FfiLgtVQrfLiBkuonPc>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 12:21:00 -0400 (EDT)
Date: Thu, 30 Jun 2022 09:20:58 -0700
From: Peter Delevoryas <me@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: Re: [PATCH v3 13/14] hw/misc/aspeed: Add intel-me
Message-ID: <Yr3NakTCVlfP0zBh@pdel-mbp>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-14-me@pjd.dev>
 <b748ce35-d8bf-1804-bcf0-1024c527380c@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b748ce35-d8bf-1804-bcf0-1024c527380c@kaod.org>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Thu, Jun 30, 2022 at 01:09:09PM +0200, Cédric Le Goater wrote:
> On 6/30/22 06:51, Peter Delevoryas wrote:
> > From: Peter Delevoryas <pdel@fb.com>
> > 
> > The Intel Management Engine is an IPMI endpoint that responds to various
> > IPMI commands.
> 
> Have you looked at the ipmi-bmc-sim device ? It is relatively easy
> to attach to a bus.

No I haven't! I didn't realize there was already some ipmi simulation code,
that's great. I'll look into turning this into an ipmi-me-sim or something.

> 
> > In this commit, I've added some very basic functionality that
> > will respond back with a respond code of zero (success), while also setting
> > an appropriate response NetFN (request NetFN + 1), a matching command ID and
> > sequence number, and the 2 standard checksums. Other data is not provided,
> > but the model here could be extended to respond to more kinds of requests.
> > 
> > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > ---
> >   MAINTAINERS          |   1 +
> >   hw/misc/intel_me.c   | 162 +++++++++++++++++++++++++++++++++++++++++++
> >   hw/misc/meson.build  |   3 +-
> >   hw/misc/trace-events |   8 +++
> >   4 files changed, 173 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/misc/intel_me.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3ffd473db1..3220644bb5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1068,6 +1068,7 @@ F: include/hw/net/ftgmac100.h
> >   F: docs/system/arm/aspeed.rst
> >   F: tests/qtest/*aspeed*
> >   F: hw/misc/fby35_sb_cpld.c
> > +F: hw/misc/intel_me.c
> >   NRF51
> >   M: Joel Stanley <joel@jms.id.au>
> > diff --git a/hw/misc/intel_me.c b/hw/misc/intel_me.c
> > new file mode 100644
> > index 0000000000..933ae45101
> > --- /dev/null
> > +++ b/hw/misc/intel_me.c
> > @@ -0,0 +1,162 @@
> > +/*
> > + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> > + *
> > + * This code is licensed under the GPL version 2 or later. See the COPYING
> > + * file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "trace.h"
> > +
> > +#define TYPE_INTEL_ME "intel-me"
> > +OBJECT_DECLARE_SIMPLE_TYPE(IntelMEState, INTEL_ME);
> > +
> > +struct IntelMEState {
> > +    I2CSlave parent_obj;
> > +
> > +    I2CBus *bus;
> > +    QEMUBH *bh;
> > +    int rx_len;
> > +    int tx_len;
> > +    int tx_pos;
> > +    uint8_t rx_buf[512];
> > +    uint8_t tx_buf[512];
> > +};
> > +
> > +static void intel_me_bh(void *opaque)
> > +{
> > +    IntelMEState *s = opaque;
> > +    I2CSlave *i2c = I2C_SLAVE(s);
> > +    uint8_t target_addr;
> > +
> > +    assert(s->bus->bh == s->bh);
> > +
> > +    switch (s->tx_pos) {
> > +    case 0:
> > +        target_addr = s->tx_buf[s->tx_pos++];
> > +        trace_intel_me_tx_start(i2c->address, target_addr);
> > +        if (i2c_start_send_async(s->bus, target_addr) != 0) {
> > +            break;
> > +        }
> > +        return;
> > +    default:
> > +        if (s->tx_pos >= s->tx_len) {
> > +            break;
> > +        }
> > +        trace_intel_me_tx_data(i2c->address, s->tx_buf[s->tx_pos]);
> > +        if (i2c_send_async(s->bus, s->tx_buf[s->tx_pos++]) != 0) {
> > +            break;
> > +        }
> > +        return;
> > +    }
> > +
> > +    trace_intel_me_tx_end(i2c->address);
> > +    i2c_end_transfer(s->bus);
> > +    i2c_bus_release(s->bus);
> > +    s->tx_len = 0;
> > +    s->tx_pos = 0;
> > +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> > +}
> > +
> > +static void intel_me_realize(DeviceState *dev, Error **errp)
> > +{
> > +    IntelMEState *s = INTEL_ME(dev);
> > +
> > +    s->bus = I2C_BUS(qdev_get_parent_bus(dev));
> > +    s->bh = qemu_bh_new(intel_me_bh, s);
> > +    s->rx_len = 0;
> > +    s->tx_len = 0;
> > +    s->tx_pos = 0;
> > +    memset(s->rx_buf, 0, sizeof(s->rx_buf));
> > +    memset(s->tx_buf, 0, sizeof(s->tx_buf));
> > +}
> > +
> > +static uint8_t checksum(const uint8_t *ptr, int len)
> > +{
> > +    int sum = 0;
> > +
> > +    for (int i = 0; i < len; i++) {
> > +        sum += ptr[i];
> > +    }
> > +
> > +    return 256 - sum;
> > +}
> > +
> > +static int intel_me_i2c_event(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    IntelMEState *s = INTEL_ME(i2c);
> > +
> > +    switch (event) {
> > +    case I2C_START_RECV:
> > +        break;
> > +    case I2C_START_SEND:
> > +        trace_intel_me_rx_start(i2c->address);
> > +        s->rx_len = 0;
> > +        memset(s->rx_buf, 0, sizeof(s->rx_buf));
> > +        break;
> > +    case I2C_START_SEND_ASYNC:
> > +        break;
> > +    case I2C_FINISH:
> > +        trace_intel_me_rx_end(i2c->address);
> > +        s->tx_len = 10;
> > +        s->tx_pos = 0;
> > +        s->tx_buf[0] = s->rx_buf[2];
> > +        s->tx_buf[1] = ((s->rx_buf[0] >> 2) + 1) << 2;
> > +        s->tx_buf[2] = checksum(s->tx_buf, 2);
> > +        s->tx_buf[3] = i2c->address;
> > +        s->tx_buf[4] = (s->rx_buf[3] >> 2) << 2;
> > +        s->tx_buf[5] = s->rx_buf[4];
> > +        s->tx_buf[6] = 0x00;
> > +        s->tx_buf[7] = 0x55;
> > +        s->tx_buf[8] = 0x00;
> > +        s->tx_buf[9] = checksum(s->tx_buf, s->tx_len - 1);
> > +        s->tx_buf[0] >>= 1;
> > +        i2c_bus_master(s->bus, s->bh);
> > +        break;
> > +    case I2C_NACK:
> > +        break;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static uint8_t intel_me_i2c_recv(I2CSlave *i2c)
> > +{
> > +    return 0xff;
> > +}
> > +
> > +static int intel_me_i2c_send(I2CSlave *i2c, uint8_t data)
> > +{
> > +    IntelMEState *s = INTEL_ME(i2c);
> > +
> > +    trace_intel_me_rx_data(i2c->address, data);
> > +
> > +    assert(s->rx_len < sizeof(s->rx_buf));
> > +    s->rx_buf[s->rx_len++] = data;
> > +
> > +    return 0;
> > +}
> > +
> > +static void intel_me_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(oc);
> > +    I2CSlaveClass *i2c = I2C_SLAVE_CLASS(oc);
> > +
> > +    dc->realize = intel_me_realize;
> > +    i2c->event = intel_me_i2c_event;
> > +    i2c->recv = intel_me_i2c_recv;
> > +    i2c->send = intel_me_i2c_send;
> > +}
> > +
> > +static const TypeInfo types[] = {
> > +    {
> > +        .name = TYPE_INTEL_ME,
> > +        .parent = TYPE_I2C_SLAVE,
> > +        .instance_size = sizeof(IntelMEState),
> > +        .class_init = intel_me_class_init,
> > +    },
> > +};
> > +
> > +DEFINE_TYPES(types);
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 948e25c440..165b9dce6d 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -118,7 +118,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >     'aspeed_sdmc.c',
> >     'aspeed_xdma.c',
> >     'aspeed_peci.c',
> > -  'fby35_sb_cpld.c'))
> > +  'fby35_sb_cpld.c',
> > +  'intel_me.c'))
> >   softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
> >   softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
> > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > index 90a0473b06..7ca23bcf27 100644
> > --- a/hw/misc/trace-events
> > +++ b/hw/misc/trace-events
> > @@ -273,3 +273,11 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
> >   lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
> >   lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
> >   lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
> > +
> > +# intel_me.c
> > +intel_me_rx_start(uint8_t addr) "addr 0x%02x"
> > +intel_me_rx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
> > +intel_me_rx_end(uint8_t addr) "addr 0x%02x"
> > +intel_me_tx_start(uint8_t addr, uint8_t target_addr) "addr 0x%02x target_addr 0x%02x"
> > +intel_me_tx_data(uint8_t addr, uint8_t data) "addr 0x%02x data 0x%02x"
> > +intel_me_tx_end(uint8_t addr) "addr 0x%02x"
> 

