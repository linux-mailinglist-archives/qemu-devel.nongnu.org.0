Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178EE41FC5D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:49:29 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfOK-0001Cq-3w
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfMt-0007yO-JZ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:47:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfMs-0002jc-3r
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:47:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v25so9624335wra.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Jm39BizCps2kQ/nFaaLlyu5zQzRejwNfCzqGiDEckk=;
 b=mTrJLnQtV8nbCXbLE3zgUMQKoqCnX6oXKQCOS+nSf5LcKzaXPL3AL7Dr3kb3mPl92+
 VFsdEHZ2q4tbtKXQZlJuLuaQQ7oK2ADD8x2oajM5E6hSe896B/AYAFQ4n6EUyF+acho8
 68fUX5N2zarHL4vjE/M3Lr749an1wvRoZaf4/w2tC4noWC49P4kXo2Hsz4uo9XkmH3yI
 sF9lakKqsyJcEyoOyHprawAZkC9w6Zhm4uXGCV+wYpZRqHT5r79Pq0opkz9gcjjdFuvV
 KgbQ6op42boV44atOU2CU+BxWciCIrAOcjSRE2gZcFNAJgqB/QbS1i3XTeW+65vSnJTX
 y2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Jm39BizCps2kQ/nFaaLlyu5zQzRejwNfCzqGiDEckk=;
 b=inqyNGKuLuzLdcl0bA4slv4eHR8mUTy4GE4tIHop/lG1ArAzFaidaeQCSPuh+hfEeO
 pIoFRkm0DCzC09XxCSYrbfYF+vIsBpp2I2crCxsITUEIMSFqmk8KjaDmmnyB8/BJrqO0
 kqRUrCoEgdt5NqJYDzHe7I9OSZu6yVeO0PiIIsnlIqw5h4I8Zy136MRbGjHCwbw8aKyK
 0fDM8VMfvLkjRMBHKv1CAi4kbylOSWBHL4LopkV/sexIKs7I5LZ2NxtdQcOj1s/E7KFX
 radiHwB06egHwgLH0lBdeQ9F7tz01WmhN0EPVzdcwtClQNAulXiaZxvqgVdEqjq3bGBb
 Jb0g==
X-Gm-Message-State: AOAM533IcmNxuaF8jKkRgWxb4hKh05kJFUQKxOW2/Al5IIoOL10L8at4
 BUr6kwurWh6tVKKpCDq0c0U=
X-Google-Smtp-Source: ABdhPJwn+8VReF6a+TksefGyfSpKkXQCT3gynGzw9OA1fmY4/prlp+XyKXVFjSiBbhZqIONaWzQu0g==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr3578649wrb.56.1633182476585; 
 Sat, 02 Oct 2021 06:47:56 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m5sm10371992wms.41.2021.10.02.06.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:47:56 -0700 (PDT)
Message-ID: <68e66972-90da-58c9-8a06-1249f8c69576@amsat.org>
Date: Sat, 2 Oct 2021 15:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 01/12] macfb: handle errors that occur during realize
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/2/21 12:59, Mark Cave-Ayland wrote:
> Make sure any errors that occur within the macfb realize chain are detected
> and handled correctly to prevent crashes and to ensure that error messages are
> reported back to the user.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 76808b69cc..2b747a8de8 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -379,6 +379,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>      MacfbState *ms = &s->macfb;
>  
>      macfb_common_realize(dev, ms, errp);
> +    if (*errp) {
> +        return;
> +    }

See a related discussion:
https://lore.kernel.org/qemu-devel/87bl47ll9l.fsf@dusky.pond.sub.org/

