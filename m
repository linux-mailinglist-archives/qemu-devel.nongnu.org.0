Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B7415B52
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:48:09 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLKq-0005UJ-Dd
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLI1-0004SO-3C
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:45:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLHz-0000TR-Ld
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:45:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so15500935wrb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IhbqH7mT/P+lcINdMUzlAreXDt6aOY3/E+9Js41cfcw=;
 b=VgZ25v+Pw3pHq0bLtUpxYMUrOZXXDT+mJBrK9EXP5T+7+8IU7BAI3WZHj7Ry6DLywv
 vQrDYx8M0La7++fSiLja3tHadN9fIa1G5OUGOLjzN6t7LirisnhUBmsh9xJTRrb2nzZO
 OXeUJ9oaf+UZzey8WiYfBiP7Dxl3+DHDJwbgFMPlObVS+j5qQHK3NK213yt6e5s2WhFt
 m0mNpjSqkWVMa9M0DyTUxAPrHMtWckoBuUBuE5uiQ9IHOLDNa+Mc59ost5qmT5CIug9r
 MfHS46Q9EZ5gDu0fA9NmE1cDoXj6U7p74iXB6biL4uXlxO0IzsWTWGRDcJB1Prx8n7aq
 Xcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IhbqH7mT/P+lcINdMUzlAreXDt6aOY3/E+9Js41cfcw=;
 b=lrrS5ow7tIrPquJEuuFqazRuLX76xMVU4yKCoZQWAvocoXLjb5Sxuo6BKpcZaJZ26I
 7D8GqKUGZO4xBnSySq53156gnbA0eJBy7eNloliRBafmquIrLdxZiboRyRvzWTI/wqig
 uhpioi2+Pyg4SZCP/oOs01gX17qi9wV2Dxh5QdiFY3r+ZRNNBY+tj8SLgkrjDpwNe0c5
 mVRXA1Q0ahbpznfiPwaO8N0jbUwRouQyZNpct1F0diukZM1XksIdx3m7xzye+lgDpSWP
 M9vWhSj6zYt5v2kK1DWSYyo3J+ItfvXkk9qxRk1QeYKYe42RGQLtRAiHs4d+WKK+IW5M
 qmZA==
X-Gm-Message-State: AOAM533fCF0ik7XW+lviFcx3PtWEUZfz3BL8Rn761zHvGKzlMPzyZWFV
 dpZCiPWyUiNYj+ZutL4I1yM=
X-Google-Smtp-Source: ABdhPJzhtX70eVOEHa0F/ou43Wd5gbRfY0zVczA+oJ5dneo24kQqP3lXr5VOWxUrwwrLp2shJFcgQg==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr4019452wrz.337.1632390309835; 
 Thu, 23 Sep 2021 02:45:09 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c7sm4998930wmq.13.2021.09.23.02.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:45:09 -0700 (PDT)
Message-ID: <b233b272-f0e3-67c8-01ee-0e383ebff849@amsat.org>
Date: Thu, 23 Sep 2021 11:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923091308.13832-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:12, Mark Cave-Ayland wrote:
> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
> virtual function rather than managing this during NubusDevice realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/nubus-bus.c    | 30 ++++++++++++++++++++++++++++++
>   hw/nubus/nubus-device.c | 22 ----------------------
>   2 files changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 3cd7534864..d4daaa36f2 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -96,11 +96,41 @@ static void nubus_init(Object *obj)
>                                                    NUBUS_SLOT_NB);
>   }
>   
> +static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
> +{
> +    NubusDevice *nd = NUBUS_DEVICE(dev);
> +    NubusBus *nubus = NUBUS_BUS(bus);
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);

Same comment than previous patch:

            int s = ctz32(nubus->slot_available_mask);

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        if (s != 32) {
> +            nd->slot = s;
> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return false;
> +        }
> +    } else {
> +        /* Slot specified, make sure the slot is available */
> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return false;
> +        }
> +    }
> +
> +    nubus->slot_available_mask &= ~BIT(nd->slot);
> +    return true;
> +}

