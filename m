Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9841FC67
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfbM-0003SI-6V
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfZL-00022g-Ms
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:00:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfZI-0001GA-LU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:00:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b131-20020a1c8089000000b0030d60716239so311184wmd.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IjPU0kvKgq7pP/Qo2ITt+9yVIb7A5hd7WSAH+OhaVkg=;
 b=UH8UY+BfQQzEnhZjS5i6T/qDmCvw7yTueHI91Yu4CbhhXxx+/6S9uVanOFuj54uPHH
 mEB1yqpEdCLRRaSKLWPryq96INaBfd2XEi3T/zsc6c7Kjcey/3c6pG84X2164pa99P+V
 bOoUn7ZtfhMbeUG9E8UcV55TwjdK/yaPv0J1CB9aUh6IK1fZk4g29tNIGRbWNTBkwx2w
 CP3XmHUflW+cP5hkuOYasThne+5rE75EFaGDPRHG5weU5pdGXXOi5zpe92hbqsgNAIE2
 Xyo015goAdjQBZb5yb3mFAXCAeyflU4TeT+qNBtOiMKWeilWhP6IZ9+9MddnZzuD5ETz
 jnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IjPU0kvKgq7pP/Qo2ITt+9yVIb7A5hd7WSAH+OhaVkg=;
 b=ahyP36LGPQIV3bwM8BiBW7ev6obbsOlAEFN8u1/1Jqk1+AYccSecoQQtK+g64XKgp5
 rkfZvuTL1CqxllmI9gUp9uKjWa+RF8KdNgBV5yVYdTzFpvWD5uxjBW+HbedQb29m+t9w
 8kzGW76/789yjNotN5w3J4tlSeZ2lTvz+ciJnCDVL8vOJxV/gLmfPmedkUMUQzLubxCD
 iXGlpCrXgSwqd0RdocHvLx8/fIm6dTet++W55tVCkes8L8m0PBAAM/8qjmBugrUkTcc4
 foqlj6OluJxe7cYCEmcEFW7mUH4jI6lAWkBk4ZU1xF4GAuG6cw37ncDwxFu5r3FAZvIK
 ZqFA==
X-Gm-Message-State: AOAM530Ma68WkYNILlLtcGMuxBAIXhOU9U1kCzlzkx+Lr5B5LY9G7gdY
 d6hVRhXTWtI0gJzAGDCPd8s=
X-Google-Smtp-Source: ABdhPJwLDenE/mUYdVo/Eu+sZ+tf5v0tJyOISg4Cjx3l5BuvgYkHkvT81/WS9CMnFrySPOOkblJL1g==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr9947839wma.0.1633183247247; 
 Sat, 02 Oct 2021 07:00:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o11sm10337147wmh.11.2021.10.02.07.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:00:46 -0700 (PDT)
Message-ID: <ecc8d8c6-027d-96a9-a3d5-cac226fc9bd3@amsat.org>
Date: Sat, 2 Oct 2021 16:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 05/12] macfb: add trace events for reading and writing the
 control registers
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002110007.30825-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

On 10/2/21 13:00, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c      | 8 +++++++-
>  hw/display/trace-events | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)

> @@ -289,7 +290,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
>                                  hwaddr addr,
>                                  unsigned int size)
>  {

> +# macfb.c
> +macfb_ctrl_read(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> +macfb_ctrl_write(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> 

'size' is unsigned, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


