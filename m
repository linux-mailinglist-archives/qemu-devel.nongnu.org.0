Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B73440846
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 11:43:39 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgktm-0005S6-OP
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 05:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgksT-00044w-Jc
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:42:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgksR-0000M0-Ov
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:42:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so20565919wrg.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0uxCQ6wpZtxZcgIMiaZe45g/mT7NSiPRtIFXJLiwa/Y=;
 b=HZ6TExfICcXXNEOEutM6LOLCsL1F48pg2Te1DuleW8p5qIob69Tb44AhRd9Ia+v9GO
 ypHiaCZu4aqcWb0ZUH9Ws4mHnnuMXmgDHTtXy/BYaamaMp6Z65NqH9uCzjB0oLZ+K9mW
 dE0Nlw3/FQLtgsZfOQciRVhybhVP/K565M34DZ4J8UXMdmHgbWrx7qM6r1nyMlrZ3Pro
 +wPohwjdNi7jL7i4JFz/AuRl1aquTJCHUCsMkd6qlehlzDdarftUihlN4nzKJyXqO7mc
 aV7AnETac5YrGq8uYIjdehx8PamSjFLb3nRXh3wuhxcClxxnAVBq4bXIa1gsokr4uXpg
 lAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0uxCQ6wpZtxZcgIMiaZe45g/mT7NSiPRtIFXJLiwa/Y=;
 b=g1NBrbSjXIAgo4qCFoPUOaGWHYaznkflLxyOHGuA28Bx5Wc6Mu3u0IDiEmwQ5XJjgG
 EvyUPv8nuK//hzDRtKwu67V5YhhRgeYFSxtQO9lqB6zANCNmf9X/ePiTHzN0WRkGrR7W
 X8XZU7CoajzTSbxTh4CSdqMQ4r08dQoMUasDiSzsP1bBZWqjy0Uyp1jQhSiz5NDtzqbg
 CwqiMzs3xHEm+P7cId8JetnUt4YzPw4ShREh/8j6sY/2sND/xnmtGp4UMbW/Rs24lWQx
 4VnvfJGcnaWCd7aV3JlSaURAsF7Jn7f8kMyU2YQL3RJR6PbsfPR3HELQdf7z+V3vdSB2
 eS7g==
X-Gm-Message-State: AOAM533gJmE6tqA9jw+oNMNq6cEIWROGLxMgcaHSo9mfkwiZgsbuI5dl
 38mnfdRhIXgIEijk6J9eSdU=
X-Google-Smtp-Source: ABdhPJwjHAvvyWJ3GUo20/Tmujmdfv9pFOrFtEHUyfE0uxuzKvYeIkTsOmVNz/5dE+TSFMbPQydDQg==
X-Received: by 2002:a5d:5915:: with SMTP id v21mr20847578wrd.270.1635586933641; 
 Sat, 30 Oct 2021 02:42:13 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z8sm916076wrh.54.2021.10.30.02.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 02:42:13 -0700 (PDT)
Message-ID: <47b6dcb1-02ba-bd6f-f7f7-c9291edd820e@amsat.org>
Date: Sat, 30 Oct 2021 11:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 29/30] hw/timer/sh_timer: Fix timer memory region size
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <82ca7d39f47685f35f735e40ab1dfa8fa1b86b9b.1635541329.git.balaton@eik.bme.hu>
 <b1cd196cf1395a602c7a08a4f858e69e50c446a1.1635550060.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b1cd196cf1395a602c7a08a4f858e69e50c446a1.1635550060.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 01:27, BALATON Zoltan wrote:
> The timer unit only has registers that fit in a region 0x30 bytes
> long. No need to have the timer region larger than that.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/timer/sh_timer.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index 250ad41b48..587fa9414a 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -350,15 +350,14 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base, int feat, uint32_t freq,
>                                      ch2_irq0); /* ch2_irq1 not supported */
>      }
>  
> -    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
> -                          "timer", 0x100000000ULL);
> +    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s, "timer", 0x30);
>  
>      memory_region_init_alias(&s->iomem_p4, NULL, "timer-p4",
> -                             &s->iomem, 0, 0x1000);
> +                             &s->iomem, 0, memory_region_size(&s->iomem));
>      memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
>  
>      memory_region_init_alias(&s->iomem_a7, NULL, "timer-a7",
> -                             &s->iomem, 0, 0x1000);
> +                             &s->iomem, 0, memory_region_size(&s->iomem));
>      memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
>      /* ??? Save/restore.  */
>  }
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


