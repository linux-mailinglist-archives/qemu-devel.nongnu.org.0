Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80193671121
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 03:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy8q-0007o7-8y; Tue, 17 Jan 2023 21:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy8o-0007nr-0q; Tue, 17 Jan 2023 21:25:30 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy8l-0004XL-Ir; Tue, 17 Jan 2023 21:25:29 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v6so47683338edd.6;
 Tue, 17 Jan 2023 18:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jqJDG1E9nrws9TdpwBasUlPzBlic1EJRk8ki2FcN9g=;
 b=j2gQLELXX+K0AwmX+2i7m+Gui/yjGEmFMe1e9E/mPYtJOcehn7tTEk7yhrEeTdcX+u
 3Nit1/POC6AGQwcDnnLIMIesIMkh2MIHNLvyuQOEJxv8QoUwcpb5Dh1xE6q6I4vpetJS
 LRPTIUxTEnIOLHAI9aIxUBlat3qdItVoeM1Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jqJDG1E9nrws9TdpwBasUlPzBlic1EJRk8ki2FcN9g=;
 b=Fk7OC9FPzCc3UC77mbuZ60M1PHTPCODm4KllJuYcSTFru/ukxQI9qVEDv3h676As/z
 7VQNBR/oZQEy8qnUVYwwsxt9GPFmtVLBHBIDLqbcCR5Bhj+qGQMfje/J42CREq3trKU9
 BnhTsv4DUsno8EGidd2pHhLds0UgErGeOuP+N+2n/YPxOIQ4oOuCQxzKvp/W7/pLWpIQ
 cpdIOaQy+z5FbygNOcQoRbmcCDHKUK7uuqFmdAnT24dE3SrMUG8gRfLq2SIKBzwJueMn
 9R/1Q5yAHnMlQXV4/Y6WsyQZIwDbeJUUBQXafTJVhhzzsEhKYVhH9zFYLQQqpfDzRlgL
 6qYg==
X-Gm-Message-State: AFqh2krUgSZBzdmZ4HWVCu3RtgrGUgQo79xykctgkn24r7D0GAYNf37h
 FyDyfq14kGXHG3T5aGXMtytA1l4fQnTVfN78vNA=
X-Google-Smtp-Source: AMrXdXv6zMxRZUrNzyfS1DQ30vugjuP9mfoyKwaVaUgM2X9YiLQAHSqSauKcIDSKvKa/n75lXS8ASi/kz6OV8Txanmc=
X-Received: by 2002:aa7:de83:0:b0:495:1602:fe69 with SMTP id
 j3-20020aa7de83000000b004951602fe69mr581928edv.224.1674008725507; Tue, 17 Jan
 2023 18:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-5-peter@pjd.dev>
In-Reply-To: <20230117232427.74496-5-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 02:25:13 +0000
Message-ID: <CACPK8XcVoA9yd2KArG7qCcN1auy97uAdR1=ydBcG17aQ81fmFg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, 
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, 17 Jan 2023 at 23:24, Peter Delevoryas <peter@pjd.dev> wrote:
>
> - Create aspeed_eeprom.c and aspeed_eeprom.h
> - Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
> - Include aspeed_eeprom.h in aspeed.c
> - Add fby35_bmc_fruid data
> - Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM wit=
h data
>   from aspeed_eeprom.c
>
> wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294f=
f5d31d/fby35.mtd
> qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
> ...
> user: root
> pass: 0penBmc
> ...
> root@bmc-oob:~# fruid-util bb
>
> FRU Information           : Baseboard
> ---------------           : ------------------
> Chassis Type              : Rack Mount Chassis
> Chassis Part Number       : N/A
> Chassis Serial Number     : N/A
> Board Mfg Date            : Fri Jan  7 10:30:00 2022
> Board Mfg                 : XXXXXX
> Board Product             : Management Board wBMC
> Board Serial              : XXXXXXXXXXXXX
> Board Part Number         : XXXXXXXXXXXXXX
> Board FRU ID              : 1.0
> Board Custom Data 1       : XXXXXXXXX
> Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
> Product Manufacturer      : XXXXXX
> Product Name              : Yosemite V3.5 EVT2
> Product Part Number       : XXXXXXXXXXXXXX
> Product Version           : EVT2
> Product Serial            : XXXXXXXXXXXXX
> Product Asset Tag         : XXXXXXX
> Product FRU ID            : 1.0
> Product Custom Data 1     : XXXXXXXXX
> Product Custom Data 2     : N/A
> root@bmc-oob:~# fruid-util bmc
>
> FRU Information           : BMC
> ---------------           : ------------------
> Board Mfg Date            : Mon Jan 10 21:42:00 2022
> Board Mfg                 : XXXXXX
> Board Product             : BMC Storage Module
> Board Serial              : XXXXXXXXXXXXX
> Board Part Number         : XXXXXXXXXXXXXX
> Board FRU ID              : 1.0
> Board Custom Data 1       : XXXXXXXXX
> Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
> Product Manufacturer      : XXXXXX
> Product Name              : Yosemite V3.5 EVT2
> Product Part Number       : XXXXXXXXXXXXXX
> Product Version           : EVT2
> Product Serial            : XXXXXXXXXXXXX
> Product Asset Tag         : XXXXXXX
> Product FRU ID            : 1.0
> Product Custom Data 1     : XXXXXXXXX
> Product Custom Data 2     : Config A
> root@bmc-oob:~# fruid-util nic
>
> FRU Information           : NIC
> ---------------           : ------------------
> Board Mfg Date            : Tue Nov  2 08:51:00 2021
> Board Mfg                 : XXXXXXXX
> Board Product             : Mellanox ConnectX-6 DX OCP3.0
> Board Serial              : XXXXXXXXXXXXXXXXXXXXXXXX
> Board Part Number         : XXXXXXXXXXXXXXXXXXXXX
> Board FRU ID              : FRU Ver 0.02
> Product Manufacturer      : XXXXXXXX
> Product Name              : Mellanox ConnectX-6 DX OCP3.0
> Product Part Number       : XXXXXXXXXXXXXXXXXXXXX
> Product Version           : A9
> Product Serial            : XXXXXXXXXXXXXXXXXXXXXXXX
> Product Custom Data 3     : ConnectX-6 DX
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c                 | 10 +++--
>  hw/arm/aspeed_eeprom.c          | 78 +++++++++++++++++++++++++++++++++
>  hw/arm/aspeed_eeprom.h          | 16 +++++++
>  hw/arm/meson.build              |  1 +
>  include/hw/nvram/eeprom_at24c.h | 14 ++++++
>  5 files changed, 116 insertions(+), 3 deletions(-)
>  create mode 100644 hw/arm/aspeed_eeprom.c
>  create mode 100644 hw/arm/aspeed_eeprom.h
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c929c61d582a..382965f82c38 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> +#include "hw/arm/aspeed_eeprom.h"
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> @@ -940,9 +941,12 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>
>      at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
>      at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> -    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> -    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> -    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +    at24c_eeprom_init_rom(i2c[8], 0x50, 32 * KiB, fby35_nic_fruid,
> +                          sizeof(fby35_nic_fruid));
> +    at24c_eeprom_init_rom(i2c[11], 0x51, 128 * KiB, fby35_bb_fruid,
> +                          sizeof(fby35_bb_fruid));
> +    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
> +                          sizeof(fby35_bmc_fruid));
>
>      /*
>       * TODO: There is a multi-master i2c connection to an AST1030 MiniBM=
C on
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> new file mode 100644
> index 000000000000..9d0700d4b709
> --- /dev/null
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -0,0 +1,78 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates.
> + *
> + * SPDX-License-Identifier: GPL-2.0-only
> + */
> +
> +#include "aspeed_eeprom.h"
> +
> +const uint8_t fby35_nic_fruid[] =3D {

As a convention can we add a comment to each fru blob describing what
it is/where it came from/how it was generated. Some clues to guide
future changes to the file.

> +    0x01, 0x00, 0x00, 0x01, 0x0f, 0x20, 0x00, 0xcf, 0x01, 0x0e, 0x19, 0x=
d7,
> +    0x5e, 0xcf, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
dd,
> +    0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x6f, 0x=
6e,
> +    0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x20, 0x=
4f,
> +    0x43, 0x50, 0x33, 0x2e, 0x30, 0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0xcc, 0x46, 0x52, 0x55, 0x20, 0x56, 0x65, 0x=
72,
> +    0x20, 0x30, 0x2e, 0x30, 0x32, 0xc0, 0xc0, 0xc0, 0xc1, 0x00, 0x00, 0x=
2f,
> +    0x01, 0x11, 0x19, 0xc8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0xdd, 0x4d, 0x65, 0x6c, 0x6c, 0x61, 0x6e, 0x6f, 0x78, 0x20, 0x43, 0x=
6f,
> +    0x6e, 0x6e, 0x65, 0x63, 0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0x=
20,
> +    0x4f, 0x43, 0x50, 0x33, 0x2e, 0x30, 0xd5, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0xd3, 0x41, 0x39, 0x20, 0x20, 0x20, 0x20, 0x=
20,
> +    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x=
20,
> +    0xd8, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0xc0, 0xc0, 0xc0, 0xc0, 0xcd, 0x43, 0x6f, 0x6e, 0x6e, 0x65, 0x=
63,
> +    0x74, 0x58, 0x2d, 0x36, 0x20, 0x44, 0x58, 0xc1, 0x00, 0x00, 0x00, 0x=
00,
> +    0x00, 0x00, 0x00, 0xdb, 0xc0, 0x82, 0x30, 0x15, 0x79, 0x7f, 0xa6, 0x=
00,
> +    0x01, 0x18, 0x0b, 0xff, 0x08, 0x00, 0xff, 0xff, 0x64, 0x00, 0x00, 0x=
00,
> +    0x00, 0x03, 0x20, 0x01, 0xff, 0xff, 0x04, 0x46, 0x00, 0xff, 0xff, 0x=
ff,
> +    0xff, 0xff, 0xff, 0xff, 0x01, 0x81, 0x09, 0x15, 0xb3, 0x10, 0x1d, 0x=
00,
> +    0x24, 0x15, 0xb3, 0x00, 0x02, 0xeb, 0x8a, 0x95, 0x5c,
> +};
> +
> +const uint8_t fby35_bb_fruid[] =3D {
> +    0x01, 0x00, 0x01, 0x03, 0x10, 0x00, 0x00, 0xeb, 0x01, 0x02, 0x17, 0x=
c3,
> +    0x4e, 0x2f, 0x41, 0xc3, 0x4e, 0x2f, 0x41, 0xc1, 0x00, 0x00, 0x00, 0x=
23,
> +    0x01, 0x0d, 0x00, 0xb6, 0xd2, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0xd5, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x6d, 0x65, 0x6e, 0x=
74,
> +    0x20, 0x42, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x77, 0x42, 0x4d, 0x43, 0x=
cd,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa8, 0x01, 0x0c, 0x00, 0x=
c6,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x=
6d,
> +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x=
54,
> +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
c7,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0x=
c9,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x4e, 0x=
2f,
> +    0x41, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x43,
> +};
> +
> +const uint8_t fby35_bmc_fruid[] =3D {
> +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x=
36,
> +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x=
4d,
> +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x=
6f,
> +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x=
2e,
> +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
d2,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0x=
c6,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x=
6d,
> +    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x=
54,
> +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x=
58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x=
c7,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0x=
c9,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x=
6f,
> +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> +};
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> new file mode 100644
> index 000000000000..bc4475a85f24
> --- /dev/null
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates.
> + *
> + * SPDX-License-Identifier: GPL-2.0-only
> + */
> +
> +#ifndef ASPEED_EEPROM_H
> +#define ASPEED_EEPROM_H
> +
> +#include "qemu/osdep.h"
> +
> +extern const uint8_t fby35_nic_fruid[309];
> +extern const uint8_t fby35_bb_fruid[224];
> +extern const uint8_t fby35_bmc_fruid[200];
> +
> +#endif
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 76d4d650e42e..f70e8cfd4545 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed.c',
>    'aspeed_ast2600.c',
>    'aspeed_ast10x0.c',
> +  'aspeed_eeprom.c',
>    'fby35.c'))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at=
24c.h
> index 5c9149331144..521005334fc1 100644
> --- a/include/hw/nvram/eeprom_at24c.h
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -19,6 +19,20 @@
>   * @bus, and drop the reference to it (the device is realized).
>   */
>  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_s=
ize);
> +
> +/*
> + * Create and realize an AT24C EEPROM device on the heap with initializa=
tion
> + * data.
> + * @bus: I2C bus to put it on
> + * @address: I2C address of the EEPROM slave when put on a bus
> + * @rom_size: size of the EEPROM
> + * @init_rom: Array of initialization data to initialize EEPROM memory
> + * @init_rom_size: Size of @init_rom, must be less than or equal to @rom=
_size
> + *
> + * Create the device state structure, initialize it, put it on the speci=
fied
> + * @bus, and drop the reference to it (the device is realized). Copies t=
he data
> + * from @init_rom to the beginning of the EEPROM memory buffer.
> + */
>  I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t r=
om_size,
>                                  const uint8_t *init_rom, uint32_t init_r=
om_size);
>
> --
> 2.39.0
>

