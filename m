Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31DF67277C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 19:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDY3-0003aD-My; Wed, 18 Jan 2023 13:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pIDWQ-0003BH-J2; Wed, 18 Jan 2023 13:50:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pIDWN-0007hu-Ac; Wed, 18 Jan 2023 13:50:53 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BD1845C019C;
 Wed, 18 Jan 2023 13:50:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 18 Jan 2023 13:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674067848; x=
 1674154248; bh=4CSN7tUhurg9sTLq7USXbyKmJpYRtL+mK9RFGc0vQRk=; b=S
 +QiphH0Q5wNGCVOSKXv/5jxvGj5LMJJJZzSakTTw6LHGl33orrpYlTn3Dk3KR8uP
 blzPi3WyuDE0X0AEZ5Nij2Bf8IeMOKw/N4hcOwRYZKxzlmxzQ6+xRYUv6VR4i5yb
 FjwZP1DJkl+ayFExjdlDszgq8IHlyWkxAx3s1zZOlFJHZ4Zkn9qWAFKZ/PlKMIjn
 ZFaAKh9Dx3wFpF7JPW5VONvy1ZIyhwXfyBG0BWx1HWPqU/5M1QCAzz0npIzSFNB1
 BoAjEuE56KG0QsBbdW3Lo8ksvKa8BpQTOhMAXY4AnFGFxGT1jqmM4UmyfSikzDAC
 hCaetLBuula/GxCuBeNyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674067848; x=
 1674154248; bh=4CSN7tUhurg9sTLq7USXbyKmJpYRtL+mK9RFGc0vQRk=; b=F
 XgByDblR80okCfBAQ28NWVBnKSt9cSEbw9bhgAjtUfxt69IrlqNP22vM6k4U/2KW
 y7nXvixjEc9q2FstPLdDrCsu1YcjKMBmtmjpMa7QBdzeBlqwQ1sUKPrhDSQ50aR+
 SJVNjOCT4MQncR37uwA+bk+UQ4evdvD+Hp/anb2oB3rABYyEW+rEb3MNkGkTbtpj
 xRP94KLLvkEmgLI7N5qO0XYNdGWdk48LOChbqVrZzIZ3M3h3AIt2gRLN4311maBG
 sR6zHI3QmIFHNq5hjqScSatxhknNpX4OKXJZLJ7tonrbLHw/JyOaC2e8L3oxqoTJ
 Ck1KQI9Y2mTSVJcomqc7w==
X-ME-Sender: <xms:hz_IY36MLODJGvGCqvV1csEcgHWiPIrEFugUMKphxUtM7cALSchFew>
 <xme:hz_IY84hT4l3eOCIPSCpUw_tYpBGJeX3IYjPNgoLoZ7DnYeHWtWwmarRYPYaku1Jg
 ZhhItLDYdiBy_REx0g>
X-ME-Received: <xmr:hz_IY-fQWFRyLbo33jTZFhDEWhvP3NO-wZ1KRn0K66QggSa3H638Vo8ygOCVNh_JRT6AtpnEwK5xGE3gt1r6cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefgueekffdtueetgfehteffle
 dtueehgfehgeelfedujeefhfffteekvddtfeetteenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:hz_IY4LoV-EsvRssjB5p9sPK2OhMJWVZnul78E0TSUl32excWlTPXg>
 <xmx:hz_IY7KPbj1GQk5Aeb8nz_PXynOWrC-xuQt8w96WozHIhrysQ9y8WQ>
 <xmx:hz_IYxy3K9LXUdwvbvstKn8PL6gr_9AGNwTNXeUury7VDWvdJ8h4KA>
 <xmx:iD_IY4q7HP-IaxyAPFde5biiVw3CvRjo2g__HvRJi_IBZku8UvZ1Eg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 13:50:46 -0500 (EST)
Date: Wed, 18 Jan 2023 10:50:42 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Message-ID: <Y8g/gp5bteQg4xrg@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-5-peter@pjd.dev>
 <ddea0c77-7a00-8796-443c-ba1707ddd8b4@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddea0c77-7a00-8796-443c-ba1707ddd8b4@kaod.org>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jan 18, 2023 at 11:31:57AM +0100, Cédric Le Goater wrote:
> On 1/18/23 03:42, Peter Delevoryas wrote:
> > - Create aspeed_eeprom.c and aspeed_eeprom.h
> > - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
> > - Include aspeed_eeprom.h in aspeed.c
> > - Add fby35_bmc_fruid data
> > - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM with data
> >    from aspeed_eeprom.c
> > 
> > wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> > qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
> > ...
> > user: root
> > pass: 0penBmc
> > ...
> > root@bmc-oob:~# fruid-util bb
> > 
> > FRU Information           : Baseboard
> > ---------------           : ------------------
> > Chassis Type              : Rack Mount Chassis
> > Chassis Part Number       : N/A
> > Chassis Serial Number     : N/A
> > Board Mfg Date            : Fri Jan  7 10:30:00 2022
> > Board Mfg                 : XXXXXX
> > Board Product             : Management Board wBMC
> > Board Serial              : XXXXXXXXXXXXX
> > Board Part Number         : XXXXXXXXXXXXXX
> > Board FRU ID              : 1.0
> > Board Custom Data 1       : XXXXXXXXX
> > Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
> > Product Manufacturer      : XXXXXX
> > Product Name              : Yosemite V3.5 EVT2
> > Product Part Number       : XXXXXXXXXXXXXX
> > Product Version           : EVT2
> > Product Serial            : XXXXXXXXXXXXX
> > Product Asset Tag         : XXXXXXX
> > Product FRU ID            : 1.0
> > Product Custom Data 1     : XXXXXXXXX
> > Product Custom Data 2     : N/A
> > root@bmc-oob:~# fruid-util bmc
> > 
> > FRU Information           : BMC
> > ---------------           : ------------------
> > Board Mfg Date            : Mon Jan 10 21:42:00 2022
> > Board Mfg                 : XXXXXX
> > Board Product             : BMC Storage Module
> > Board Serial              : XXXXXXXXXXXXX
> > Board Part Number         : XXXXXXXXXXXXXX
> > Board FRU ID              : 1.0
> > Board Custom Data 1       : XXXXXXXXX
> > Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
> > Product Manufacturer      : XXXXXX
> > Product Name              : Yosemite V3.5 EVT2
> > Product Part Number       : XXXXXXXXXXXXXX
> > Product Version           : EVT2
> > Product Serial            : XXXXXXXXXXXXX
> > Product Asset Tag         : XXXXXXX
> > Product FRU ID            : 1.0
> > Product Custom Data 1     : XXXXXXXXX
> > Product Custom Data 2     : Config A
> > root@bmc-oob:~# fruid-util nic
> > 
> > FRU Information           : NIC
> > ---------------           : ------------------
> > Board Mfg Date            : Tue Nov  2 08:51:00 2021
> > Board Mfg                 : XXXXXXXX
> > Board Product             : Mellanox ConnectX-6 DX OCP3.0
> > Board Serial              : XXXXXXXXXXXXXXXXXXXXXXXX
> > Board Part Number         : XXXXXXXXXXXXXXXXXXXXX
> > Board FRU ID              : FRU Ver 0.02
> > Product Manufacturer      : XXXXXXXX
> > Product Name              : Mellanox ConnectX-6 DX OCP3.0
> > Product Part Number       : XXXXXXXXXXXXXXXXXXXXX
> > Product Version           : A9
> > Product Serial            : XXXXXXXXXXXXXXXXXXXXXXXX
> > Product Custom Data 3     : ConnectX-6 DX
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Reviewed-by: Cédric Le Goater <clg@kaod.org>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   hw/arm/aspeed.c        | 10 ++++--
> >   hw/arm/aspeed_eeprom.c | 78 ++++++++++++++++++++++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.h | 16 +++++++++
> >   hw/arm/meson.build     |  1 +
> >   4 files changed, 102 insertions(+), 3 deletions(-)
> >   create mode 100644 hw/arm/aspeed_eeprom.c
> >   create mode 100644 hw/arm/aspeed_eeprom.h
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c929c61d582a..382965f82c38 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -14,6 +14,7 @@
> >   #include "hw/arm/boot.h"
> >   #include "hw/arm/aspeed.h"
> >   #include "hw/arm/aspeed_soc.h"
> > +#include "hw/arm/aspeed_eeprom.h"
> >   #include "hw/i2c/i2c_mux_pca954x.h"
> >   #include "hw/i2c/smbus_eeprom.h"
> >   #include "hw/misc/pca9552.h"
> > @@ -940,9 +941,12 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
> >       at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> >       at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> > -    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> > -    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> > -    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
> > +    at24c_eeprom_init_rom(i2c[8], 0x50, 32 * KiB, fby35_nic_fruid,
> > +                          sizeof(fby35_nic_fruid));
> > +    at24c_eeprom_init_rom(i2c[11], 0x51, 128 * KiB, fby35_bb_fruid,
> > +                          sizeof(fby35_bb_fruid));
> > +    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
> > +                          sizeof(fby35_bmc_fruid));
> >       /*
> >        * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
> > diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> > new file mode 100644
> > index 000000000000..9d0700d4b709
> > --- /dev/null
> > +++ b/hw/arm/aspeed_eeprom.c
> > @@ -0,0 +1,78 @@
> > +/*
> > + * Copyright (c) Meta Platforms, Inc. and affiliates.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-only
> > + */
> > +
> > +#include "aspeed_eeprom.h"
> > +
> > +const uint8_t fby35_nic_fruid[] = {
> > +    0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0xd7,
> > +    0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xdd,
> > +    0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f, 0x6e,
> > +    0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20, 0x4f,
> > +    0x43, 0x50, 0x33, 0x2e, 0x30, 0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xcc, 0x46, 0x52, 0x55, 0x20, 0x56, 0x65, 0x72,
> > +    0x20, 0x30, 0x2e, 0x30, 0x32, 0xc0, 0xc0, 0xc0, 0xc1, 0x00, 0x00, 0x2f,
> > +    0x01, 0x11, 0x19, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0xdd, 0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f,
> > +    0x6e, 0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20,
> > +    0x4f, 0x43, 0x50, 0x33, 0x2e, 0x30, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xd3, 0x41, 0x39, 0x20, 0x20, 0x20, 0x20, 0x20,
> > +    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> > +    0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0xc0, 0xc0, 0xc0, 0xc0, 0xcd, 0x43, 0x6f, 0x6e, 0x6e, 0x65, 0x63,
> > +    0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0xc1, 0x00, 0x00, 0x00, 0x00,
> > +    0x00, 0x00, 0x00, 0xdb, 0xc0, 0x82, 0x30, 0x15, 0x79, 0x7f, 0xa6, 0x00,
> > +    0x01, 0x18, 0x0b, 0xff, 0x08, 0x00, 0xff, 0xff, 0x64, 0x00, 0x00, 0x00,
> > +    0x00, 0x03, 0x20, 0x01, 0xff, 0xff, 0x04, 0x46, 0x00, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0x01, 0x81, 0x09, 0x15, 0xb3, 0x10, 0x1d, 0x00,
> > +    0x24, 0x15, 0xb3, 0x00, 0x02, 0xeb, 0x8a, 0x95, 0x5c,
> > +};
> > +
> > +const uint8_t fby35_bb_fruid[] = {
> > +    0x01, 0x00, 0x01, 0x03, 0x10, 0x00, 0x00, 0xeb, 0x01, 0x02, 0x17, 0xc3,
> > +    0x4e, 0x2f, 0x41, 0xc3, 0x4e, 0x2f, 0x41, 0xc1, 0x00, 0x00, 0x00, 0x23,
> > +    0x01, 0x0d, 0x00, 0xb6, 0xd2, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0xd5, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x6d, 0x65, 0x6e, 0x74,
> > +    0x20, 0x42, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x77, 0x42, 0x4d, 0x43, 0xcd,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa8, 0x01, 0x0c, 0x00, 0xc6,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> > +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
> > +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x4e, 0x2f,
> > +    0x41, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43,
> > +};
> > +
> > +const uint8_t fby35_bmc_fruid[] = {
> > +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
> > +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
> > +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
> > +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
> > +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> > +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
> > +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> > +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
> > +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> > +};
> > diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> > new file mode 100644
> > index 000000000000..bc4475a85f24
> > --- /dev/null
> > +++ b/hw/arm/aspeed_eeprom.h
> > @@ -0,0 +1,16 @@
> > +/*
> > + * Copyright (c) Meta Platforms, Inc. and affiliates.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-only
> > + */
> > +
> > +#ifndef ASPEED_EEPROM_H
> > +#define ASPEED_EEPROM_H
> > +
> > +#include "qemu/osdep.h"
> > +
> > +extern const uint8_t fby35_nic_fruid[309];
> > +extern const uint8_t fby35_bb_fruid[224];
> > +extern const uint8_t fby35_bmc_fruid[200];
> 
> 
> I preferred your first version :/

Aw dang it, well, how come you and Phil suggested doing it this way?

Maybe you were just offering suggestions heh

> 
> No need to resend, I will rework the code to add :
> 
>   extern const size_t fby35_nic_len;
>   extern const size_t fby35_bb_len;
>   extern const size_t fby35_bmc_len;

That would be great, thanks!

> 
> Thanks,
> 
> C.
> 
> > +
> > +#endif
> > diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> > index 76d4d650e42e..f70e8cfd4545 100644
> > --- a/hw/arm/meson.build
> > +++ b/hw/arm/meson.build
> > @@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >     'aspeed.c',
> >     'aspeed_ast2600.c',
> >     'aspeed_ast10x0.c',
> > +  'aspeed_eeprom.c',
> >     'fby35.c'))
> >   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
> >   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
> 

