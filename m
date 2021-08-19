Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F43F1B1D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:02:18 +0200 (CEST)
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGicZ-0008K5-9m
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiaK-0007KS-E6
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:59:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiaH-0004ks-T2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:59:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id v2so9006986edq.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwDEZgaQc82JrulneqmC+0pTbPGGhVY44dmXIVB3um0=;
 b=F+D6cT5taEDm4hJ/28N9uKKOfwSZXlqXn9g8WmTZXQDPdlYaekdVJcWk/HUKAexTyI
 w/SM7rTtlcV26AgtyjHq451ndBFMph6+coHyj65B0aRfZOvoR45CKgMOVVBzeouL0Ty2
 BHgUoNCL6IiJFQ482+KQif8CzRNai1GeJXnWwvIc4w+/40ko835dxLIjGbOMRc0kx0X3
 LEnQdOG9qBqV+5E0OfbhHB41Q2dNek0AFVc9lwcpSmaDLJT44VeH0htdZjRgUZquN7XI
 BK3E6hpN5OVEhWbBIdnP7dLGyRA5yQkqtoQtxkmeAw0mjcpwcxZf+uhtwpTepGU4s/px
 ERBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwDEZgaQc82JrulneqmC+0pTbPGGhVY44dmXIVB3um0=;
 b=SyeHQMWJrtPiYZJ+UziO1GPhfqJXoFBGkg591ysOdo56aNkD/SiR33+vpv5KVOh/tl
 tNPVObf5VkqIDxvq+1ya3iblhtvKCdhwmhLo1DDjxWYhAKBP+V8shyZQxrpj/3m4RWZw
 82fBGCsFOe5bNy05i0n7zSnngQiwIWvH3HuJBECodbRYTdmCR96FCWBPHkzajdoDs2sd
 rbSk/y31xcJxMJy/lXaixdOANEX8mOqrBk/WqvNCF7gmp3/GSSzSe1CHfhtOrmX47qI6
 zl+5RP0DTwVteLNkx6VYmQ0ne7qqylMv6/i6ycDL0y/PgtA0rzrRUVQacoqV+rsYJxCP
 Sulw==
X-Gm-Message-State: AOAM533fl8rkK9AOQqp3jGysuPgacMLQwBjK3saftmaxNvy5F1X/lOt3
 xNYJ8kWjPIRE+fU+Y/nFxFZktNLFN95i8k5kBaQqnQ==
X-Google-Smtp-Source: ABdhPJw1+ZEFUw6Hk1kG0+Is6i/nR1OzXobbndbEi+dkJdQvr1mW4NeoolALNthS8iB4NRigSTX+fQoT7lw64Uudc5U=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr16314984edr.251.1629381592059; 
 Thu, 19 Aug 2021 06:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
 <20210813233353.2099459-6-wuhaotsh@google.com>
In-Reply-To: <20210813233353.2099459-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:59:06 +0100
Message-ID: <CAFEAcA8ZiY59x6=Pg=ZOZxRGq-HyBPt9=rXCWvFSg7032bWP=Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/nvram: Add a new auxiliary function to init at24c
 eeprom
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <minyard@acm.org>, Titus Rwantare <titusr@google.com>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Aug 2021 at 00:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> In NPCM7xx boards, at24c eeproms are backed by drives. However,
> these drives use unit number as unique identifier. So if we
> specify two drives with the same unit number, error will occured:
> `Device with id 'none85' exists`.
>
> Instead of using i2c address as unit number, we now assign unique
> unit numbers for each eeproms in each board. This avoids conflict
> in providing multiple eeprom contents with the same address.
>
> We add an auxiliary function in the at24c eeprom module for this.
> This allows it to easily add at24c eeprom to non-nuvoton boards
> like aspeed as well.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture<venture@google.com>
> ---
>  hw/nvram/eeprom_at24c.c         | 18 ++++++++++++++++++
>  include/hw/nvram/eeprom_at24c.h | 13 +++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 include/hw/nvram/eeprom_at24c.h
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index af6f5dbb99..a9e3702b00 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -12,9 +12,11 @@
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "hw/i2c/i2c.h"
> +#include "hw/nvram/eeprom_at24c.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/blockdev.h"
>  #include "qom/object.h"
>
>  /* #define DEBUG_AT24C */
> @@ -205,3 +207,19 @@ static void at24c_eeprom_register(void)
>  }
>
>  type_init(at24c_eeprom_register)
> +
> +void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
> +                           uint32_t rsize, int unit_number)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    BlockInterfaceType type = IF_NONE;
> +    DriveInfo *dinfo;
> +
> +    dinfo = drive_get(type, bus, unit_number);
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
> +}

This is just creating a device and configuring it, right?
We tend to prefer that this is just done directly in the
board or SoC code these days, rather than providing helper functions
for it.

If you don't like what hw/arm/npcm7xx_boards.c:at24c_eeprom_init()
is currently doing, you should just patch it to do something different.

thanks
-- PMM

