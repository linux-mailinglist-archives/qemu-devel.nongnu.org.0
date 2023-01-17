Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C866E579
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqFB-0002hE-Nx; Tue, 17 Jan 2023 12:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqFA-0002gw-9Q; Tue, 17 Jan 2023 12:59:32 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHqF7-0007Dv-F5; Tue, 17 Jan 2023 12:59:32 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4CA44320091F;
 Tue, 17 Jan 2023 12:59:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 12:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673978365; x=
 1674064765; bh=I2gXDLiFRU5m8vD604K/FJLIr8GmXR49cWYJzRUwgw4=; b=Y
 CRJ6MFHu2gIOP6NvrrpYh0gbiHUOiBK4XCD/jGOcMQZPuFue3aur7zzH9r/HsPia
 HSfgW9YYp6BrfnM27d+OGtrbo70bhAcYObRZqsrSkM5d4ESRCoHTL4FbDczJJPoJ
 hZKT/Z8KZEwPXIBtlR53oWkzx4VLHCRk/w341Pwwn6zhdvNEr1SUMbLTeOc/X8qJ
 z8ZyGV7hzLcHeueFc0poaQ0iqoqzIHAt+cHs51TiD2NAiM8mp+9PJce0rqxUZc81
 GIMH4o3EjN+zBqXC0+diMEHBuOhY/Ot5j4OEGlzDXJ62Pq2dab7kBFc+H1J95uLa
 R1c3Bzh3Dozk2xnVDjthw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673978365; x=
 1674064765; bh=I2gXDLiFRU5m8vD604K/FJLIr8GmXR49cWYJzRUwgw4=; b=e
 vni8OCHtRHMxXeI7EcgPTUz8jtaUjYx7bKVoaqJrfiHsZ3YEYRLdkwqpb/0UpOHu
 RMCQYfIEc2qwWvBEJ926nddysy0Q8D6eo87RTt78SXG/wyKIm5a8mvFIzCCP0Z9+
 AKtvzugbEg4mnoW02mxkrKmbWDYTw1EfcAXGtO1YMT0Bm5x/slS+wkDar9t3qJoe
 ae0oW0zKDJWXA1Ov7t6pLSa+W9OOu4f8o0I6vqMncExhEBnPyaNYCfKSIty5Z55q
 RJ/EDsK1tRrKLCSWQMpn8oeDq7yYsKJspjd5gVDyuvumWkc56Tv6Uok9Yjk9qgw+
 do0tzDWF9ztRdv73T83QA==
X-ME-Sender: <xms:_eHGYzVAJJGOrNZk0IWh_N8119U0dQHCQ8DNbMr9UJLZLGWAf2nIXA>
 <xme:_eHGY7kQ8cxOvB7WZcvKya6SYCI5YXjX3IPfXUJMRXegP9BKiOEMH_zIRufX_38q6
 fqcHIBlA31qOP_tilU>
X-ME-Received: <xmr:_eHGY_aslqcDE95aSzEC-zRJ3ETOVIKblxEg80yHVgkYql-by0PZs08cddQX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjse
 htkeertddttddunecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvght
 vghrsehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpefgueekffdtueetgfehteffle
 dtueehgfehgeelfedujeefhfffteekvddtfeetteenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:_eHGY-UUOMYwNYNn6vmMwIXrmGHqpWgYbzMIebEa5DrwHRPgi-qZXw>
 <xmx:_eHGY9lnBt4UqIJBkuvAEZ7b90cynLcP4HQ0zjzJhhJJojYRi1bi9w>
 <xmx:_eHGY7fJ-bQ0UXKSpQxtV-YPD2PvX8DURVFAaOUHLhsr2DRvhS8zig>
 <xmx:_eHGY7YcJsabWOASmQOWbZf3RVaX4o61qo3WO1ujvov0nCkORsHUVw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 12:59:24 -0500 (EST)
Date: Tue, 17 Jan 2023 09:59:20 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Message-ID: <Y8bh+B2mQf+xW1yK@pdel-mbp>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-5-peter@pjd.dev>
 <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d494fe87-d083-cc64-867b-186852a120d7@kaod.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
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

On Tue, Jan 17, 2023 at 08:39:06AM +0100, Cédric Le Goater wrote:
> On 1/17/23 00:56, Peter Delevoryas wrote:
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
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> One little comment below,
> 
> > ---
> >   hw/arm/aspeed.c        |  4 +++-
> >   hw/arm/aspeed_eeprom.c | 51 ++++++++++++++++++++++++++++++++++++++++++
> >   hw/arm/aspeed_eeprom.h | 11 +++++++++
> >   hw/arm/meson.build     |  1 +
> >   4 files changed, 66 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/arm/aspeed_eeprom.c
> >   create mode 100644 hw/arm/aspeed_eeprom.h
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c929c61d582a..11e423db4538 100644
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
> > @@ -942,7 +943,8 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
> >       at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> >       at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> >       at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> > -    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
> > +    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
> > +                          fby35_bmc_fruid_size);
> >       /*
> >        * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
> > diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> > new file mode 100644
> > index 000000000000..a5ffa959927b
> > --- /dev/null
> > +++ b/hw/arm/aspeed_eeprom.c
> > @@ -0,0 +1,51 @@
> > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> > +
> > +#include "aspeed_eeprom.h"
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
> > +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> > +};
> > +
> > +const uint32_t fby35_bmc_fruid_size = sizeof(fby35_bmc_fruid);
> > diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> > new file mode 100644
> > index 000000000000..89860e37d007
> > --- /dev/null
> > +++ b/hw/arm/aspeed_eeprom.h
> > @@ -0,0 +1,11 @@
> > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> > +
> > +#ifndef ASPEED_EEPROM_H
> > +#define ASPEED_EEPROM_H
> > +
> > +#include "qemu/osdep.h"
> > +
> > +extern const uint8_t fby35_bmc_fruid[];
> 
> 
> may be define the array with an explicit size to avoid the size variable ?
> I don't see any good solution.

Yeah whatever seems most natural to you guys. Explicit size sounds fine to me,
it's easy enough to check the size using compiler errors.

> 
> Thanks,
> 
> C.
> 
> 
> 
> > +extern const uint32_t fby35_bmc_fruid_size;
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

