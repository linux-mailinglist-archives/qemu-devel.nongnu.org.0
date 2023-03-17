Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E486BE5F7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 10:53:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd6ku-0003ot-5y; Fri, 17 Mar 2023 05:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pd6kr-0003o6-G0; Fri, 17 Mar 2023 05:52:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pd6kp-0003e4-FN; Fri, 17 Mar 2023 05:52:09 -0400
Received: by mail-ed1-x535.google.com with SMTP id x3so18024107edb.10;
 Fri, 17 Mar 2023 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679046725;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sjgbpFHlkv3OCW/kDiuhRBpCwwQK5Ur+NEG1DXRNQck=;
 b=c5raEpId8ZqshW+z/np6d1JDqfzKq42OqX/HvqpGXyPGRT8oNXhAb5AJzoCMg/9A1q
 fW3a6fDq89DqVU/qj6IoDOXZChLbi+SZ3iRzilon0o3lRmVMZzYPbw8hgeRKd1S/SrNb
 O4eWadlvRMdO8Bz9ugfIDIxDojtQez5v6nRtwnMXjU/ya2glyKQ67vVs2IVXwe+AGMAy
 xNgwguU0VJFtU0a5DU/IL7qkRMq6D1TCBrOz6XWXQ+BVBv5vKQ06m2j4FCq/iCN6uPoc
 iNC/leZ/V9l+wV2wBeXLf9uck5Wq5DVvxm4+w5FIS58EGN5mJ748ffS+qdJspvxRE3CX
 EhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679046725;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sjgbpFHlkv3OCW/kDiuhRBpCwwQK5Ur+NEG1DXRNQck=;
 b=Xy9GBMnLCWNqTcVwkyRktV9JVHVFTr8UK2j2qWMS54jNPmhJVKEzjBf3hwTQ9W/KNY
 LoFRTsx7BXq7nfq28GnsdD24TCMC3xKf2BOm+PvlBhQpZLB4vBmEDE/KFLxAkG6GxMUi
 odu7VlqpbbT4RVcJpITSNdjjvN6fQT8qoock2n9DO3HgtTpe8b5x1IdZ4tsxMLPgUX30
 39guNXlUn4iAWUCQx9lMMb7LcggjR1e6/PrOD2Ll45BvDO3CszVRUe0JeaIYivWLy1Pp
 Z+8+j0imziu0FS+EkPKfU02/sQAXQB+O/HzJGnDOxwI/Ue4Q6e30kvVxgK+UW3ulMzFo
 bOQg==
X-Gm-Message-State: AO0yUKUGEvA4MjoY91eW+aXQaJbPT47XGWk9pjExkQu70bOAtYrUzRZ1
 ke6v3IPQkAhK/KhlWX9CaEw=
X-Google-Smtp-Source: AK7set9SBBwCGSN41WYGY7OIZmXToonykZAViPvB+RWj4O7IUKcqmCG6oPhM7BFchYNkvl6+7bf06A==
X-Received: by 2002:aa7:c44c:0:b0:4bc:7eb9:4b2c with SMTP id
 n12-20020aa7c44c000000b004bc7eb94b2cmr2427814edr.35.1679046725076; 
 Fri, 17 Mar 2023 02:52:05 -0700 (PDT)
Received: from [128.178.122.40] (dhcp-122-dist-b-040.epfl.ch. [128.178.122.40])
 by smtp.gmail.com with ESMTPSA id
 gu12-20020a170906f28c00b008b17de9d1f2sm785318ejb.15.2023.03.17.02.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 02:52:04 -0700 (PDT)
Message-ID: <7e7876e3-67f1-9202-2182-72e93ebc4b9a@gmail.com>
Date: Fri, 17 Mar 2023 10:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230316234926.208874-1-linux@roeck-us.net>
From: Qiang Liu <cyruscyliu@gmail.com>
In-Reply-To: <20230316234926.208874-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/17/23 12:49 AM, Guenter Roeck wrote:
> The i.MX USB Phy driver does not check register ranges, resulting in out of
> bounds accesses if an attempt is made to access non-existing PHY registers.
> Add range check and conditionally report bad accesses to fix the problem.
>
> While at it, also conditionally log attempted writes to non-existing or
> read-only registers.
>
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Link: https://gitlab.com/qemu-project/qemu/-/issues/1408
> Fixes: 0701a5efa015 ("hw/usb: Add basic i.MX USB Phy support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/usb/imx-usb-phy.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
> index 5d7a549e34..1a97b36a11 100644
> --- a/hw/usb/imx-usb-phy.c
> +++ b/hw/usb/imx-usb-phy.c
> @@ -13,6 +13,7 @@
>   #include "qemu/osdep.h"
>   #include "hw/usb/imx-usb-phy.h"
>   #include "migration/vmstate.h"
> +#include "qemu/log.h"
>   #include "qemu/module.h"
>   
>   static const VMStateDescription vmstate_imx_usbphy = {
> @@ -90,7 +91,15 @@ static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
>           value = s->usbphy[index - 3];
>           break;
>       default:
> -        value = s->usbphy[index];
> +        if (index < USBPHY_MAX) {
> +            value = s->usbphy[index];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Read from non-existing USB PHY register 0x%"
> +                          HWADDR_PRIx "\n",
> +                          __func__, offset);
> +            value = 0;
> +        }
>           break;
>       }
>       return (uint64_t)value;
> @@ -168,7 +177,13 @@ static void imx_usbphy_write(void *opaque, hwaddr offset, uint64_t value,
>           s->usbphy[index - 3] ^= value;
>           break;
>       default:
> -        /* Other registers are read-only */
> +        /* Other registers are read-only or do not exist */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Write to %s USB PHY register 0x%"
> +                      HWADDR_PRIx "\n",
> +                      __func__,
> +                      index >= USBPHY_MAX ? "non-existing" : "read-only",
> +                      offset);
>           break;
>       }
>   }

Tested-by: Qiang Liu <cyruscyliu@gmail.com>


