Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328D415B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:44:54 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLHh-00032k-6O
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLFt-0000yE-10
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:43:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLFr-0006pc-Dl
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:43:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so15270447wrc.11
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dcf8JDTPV8hoWrIYKRC83iko11zlwIpNVW/bqcW8sxE=;
 b=lx8z3DHVEPUGPJnvxYIc3f4TvhYKd8vIzliRIU82QV+f1AH6+Zx2o1dGnV8dstcQ3J
 +vAIem5mCvm38adY4uRxucjEemhio61PzKBTQ91ns+Cdzl/rfUOmhRjDR4aC4jww9FLW
 lzYSoimD+KKXBNBCbz39LQZhRY40BVHv4l+dhHC8w2HKwS6YKx16MjDanY7tODPDCsTt
 OGFgiLjMOlwaW5NQnDUbK0WwePI2y6ltA00GkLFmtWxUFKXpz/f4mDNPLQtG3vzfUWuX
 6tTKJiojkJB6488zwmRG1Wx+lajTiSMuICtQbJ7zlhbVjqPh2xynzhCsKeWJt8yYuQBz
 5bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dcf8JDTPV8hoWrIYKRC83iko11zlwIpNVW/bqcW8sxE=;
 b=7ZERpWoIcdMt9zEdw1mQy+FltQVzflRi4QraTyhfH/TRALQn7Cbd9K/vPrPvMVQ05R
 orXZ6Qks5CkN+JziyD8CM3TTsVjEl1gC9SdzONNftKOCLdQZ3bC0tK7chnpvEphzksbQ
 rVE1b9OSCh5VwKN9T4iAZLcLmPrzwsbtSQDCEF6W+3w14kDUsMqUFUUSFkogDBx4+24K
 RZWXnTOFYirwbGGyLzNPsPP1UAObcKsTcrQywhmKUeG4c82dg5Ie6BsAfR1U2rGFddUg
 rCNwWanmFX/v/sEsTy9c82gYYL5fg7vDmqfVomT+PWyV1nORXkiKaYuHpNDkDd4PNSgi
 qTKw==
X-Gm-Message-State: AOAM530e/oIWm4lRYnagYZ1Wfw/s4vgpF/oT3BTbhoK8IW91kTfyZ1YC
 uVa3X/K1pV+byU8y1MHO95M=
X-Google-Smtp-Source: ABdhPJx39B6jjZeJz2wd+JxDRYZrETsycm7rLOB7oEFW6jpiCF43fFrTw3TVodg7v/rhk46JjZ8EPw==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr15010545wmj.84.1632390177146; 
 Thu, 23 Sep 2021 02:42:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v21sm5003684wrv.3.2021.09.23.02.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:42:56 -0700 (PDT)
Message-ID: <a446e9a3-b5a9-f9af-0408-e794aac05352@amsat.org>
Date: Thu, 23 Sep 2021 11:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 04/20] nubus: use bitmap to manage available slots
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923091308.13832-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line
> using a new qdev "slot" parameter for nubus devices.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/nubus/mac-nubus-bridge.c         |  4 ++++
>   hw/nubus/nubus-bus.c                |  5 +++--
>   hw/nubus/nubus-device.c             | 32 +++++++++++++++++++++++------
>   include/hw/nubus/mac-nubus-bridge.h |  4 ++++
>   include/hw/nubus/nubus.h            | 13 ++++++------
>   5 files changed, 43 insertions(+), 15 deletions(-)

> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 4e23df1280..562650a05b 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -160,14 +160,28 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>       NubusDevice *nd = NUBUS_DEVICE(dev);
>       char *name;
>       hwaddr slot_offset;
> -
> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
> -            nubus->current_slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, not enough slots");
> -        return;
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);

Nitpicking:

            int s = ctz32(nubus->slot_available_mask);

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        if (s != 32) {
> +            nd->slot = s;
> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return;
> +        }
> +    } else {
> +        /* Slot specified, make sure the slot is available */
> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return;
> +        }
>       }

