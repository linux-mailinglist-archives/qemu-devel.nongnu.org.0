Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E2422CD7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:44:17 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmc3-0001YC-3r
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXmSO-0005k0-6I
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:34:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXmSJ-0007jZ-CT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:34:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id v127so16727645wme.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SxZheTVv17BCKQLqE/5L3PlPXSRScFm50fqFxzm203M=;
 b=FGTP4GPAgF7z4rrM1zfPImsGnI58KyEThiYjpYeEYchwGYvsCt1WUd6UvIUFbhbdG1
 rNnOZdVUj7OLs4L0Q7mg+9P4HKwTWkJN9S754EZum+MUtLIEIJ//O4eQMVV//nmx1Rg2
 ZcfFk6dcfVvg3ODsEcyQxa/xLi8gjk9tKY5o4zW7RYUZdN1MDk9aBvwm5SisvVY2KZn/
 BjEVSwaMkRkNtJFmacF9bDN7H+0ZPZOHKikXlhlVtfwe6qy0yVQHdQOvgsflzkijHmWj
 NLbXYGcuMSU9LPn/3ijXQ/2IHArc8+VOYiPpD0Ca4ws24bxB70yacqoerrPdZPzczpt7
 4AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SxZheTVv17BCKQLqE/5L3PlPXSRScFm50fqFxzm203M=;
 b=eWguwvCPGiI6bIE4h7OSeXS9OjB8fHirbABPcTan0+JcQOk66cowqGRY8uVq1uBBXy
 nGwlmrdr2GFJW7PkEGNSi6HBguQ08H9w9yYQjTrHZCLW46Jem+5/2R35oV/jLCaMMGgs
 U7XHN1I6Y63mUn4NAy9uGHmb2ZjBRa13oHQ7uUlWkxgud+3IeLhdCxMuOQhAnk1mhb5O
 0WARsKw+tGHFZ8DFukhzc/rA38++OqP0m7phX2mJflXtp0tPCAHtDnxlZxqF+BKrouyJ
 97rdv+Y1pLV4JYVC4Y/jK+whsLHAuwhUy4vheQVnnjUQf1JgXvlUb9XdEAKU3u5CJo8Q
 VqNQ==
X-Gm-Message-State: AOAM5324wrvg28qaEr8XLCoL9z0dTxAr/Al8whj2q/xP55ynwcMHYZOp
 yPqyMy8Q9F4OhzEegXW2t6Q=
X-Google-Smtp-Source: ABdhPJwntgOuU0ZQVkd9LnlTJUcXnsxZSMlRhd1qWFG+NkXtZa2Zgwm2qiHD8jhOr72A7898ygptMw==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr4141461wmr.118.1633448047182; 
 Tue, 05 Oct 2021 08:34:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h18sm17506834wrs.75.2021.10.05.08.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 08:34:06 -0700 (PDT)
Message-ID: <80c5aac2-4e95-dac2-3144-e652a7a6aa8d@amsat.org>
Date: Tue, 5 Oct 2021 17:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 01/12] macfb: handle errors that occur during realize
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-2-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004211928.15803-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.826,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
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

On 10/4/21 23:19, Mark Cave-Ayland wrote:
> Make sure any errors that occur within the macfb realize chain are detected
> and handled correctly to prevent crashes and to ensure that error messages are
> reported back to the user.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/display/macfb.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

> @@ -391,8 +396,14 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>      MacfbState *ms = &s->macfb;
>  
>      ndc->parent_realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }

Sorry for being picky, but this is one fix (one patch),

> +    if (!macfb_common_realize(dev, ms, errp)) {
> +        return;
> +    }

and this is another fix (another patch, including the bool).

>  
> -    macfb_common_realize(dev, ms, errp);
>      memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>      memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
>  }
> 

I'd rather split this in 2, but I'd be OK if you just reword
the description, either split or reworded:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

