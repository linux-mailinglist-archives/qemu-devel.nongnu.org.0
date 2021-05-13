Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C450737FC27
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:11:00 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhErT-0001KM-P8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEmM-00054i-Q1; Thu, 13 May 2021 13:05:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEmL-0007Uq-AT; Thu, 13 May 2021 13:05:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id r11so7728264edt.13;
 Thu, 13 May 2021 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dUEgMt9UPJhaSSQ7qZ8X1JPD62r0VTjrlULljv0MlCA=;
 b=b9iadGwcpFMYW/NZ46L5eCeW3LJm4X57hvxldHV/mpZNdYc4RtiqU4aIggHEbHNwaW
 bbLN+IPd0nJijuucanjbilM0jiYddXK9UcqR3xs8YZCw1r6X9IyoSBHaG2C/Z/ZeoLES
 Uf7Om+PW/Dr9rzJuK41WFArU0Z00E4mgHC8BXSwypiwPhlxnAU6S+3Lve6moFpy3RSnA
 5J+1aUrOc7WpJlX0TdHoCo71epaezLyHGMEid7kXUGriNZBw3RQ7DlrqAj7+7GH0ue2w
 IKyfXrr91RYSyIQy9DZNZIlr4ttKoBuDZvXxaseEG61i4xQLNi8TfLqQdB4gJ/CNAU2/
 T1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dUEgMt9UPJhaSSQ7qZ8X1JPD62r0VTjrlULljv0MlCA=;
 b=ozA0oOFj0eL7EmXpg9JOkCbFHAt3Ynsff8AJGmscfoZwXsRchOsJmCsZKJWGmYYelC
 MTIyUDob/x+wO6x+jR0HUgrvjwmW+rUlkdoPXqX5yJ8Jvi7/tzF8ETV0k+fU3wezwi45
 lD8x/stZ/VQC5VTAW3ZgWWsrI7/27vhO8ZitiTBHVOrrZ9C03Imh337qEMeqWV6AaJZm
 en1mV0jro+oKc6tp2i33iN+T5ZBgxt9pXU/R4jHljBE/n/Q3XhYaBHlKBj1CrZ4GCCy1
 ScQVR3Xo5iVFaKaUpooCrCJYaapsWv1bIoCjbL6uHucdjBuq8lZmjmpaFIhOAuyVmziN
 jWCQ==
X-Gm-Message-State: AOAM531oka/nIe5jSy4XLHcW1+enjmtnGINudv8d+4U5jm+rttZbzKS3
 vvTITJ26Tjl3eG8CGUxtpxB8KfMMg2bvfQ==
X-Google-Smtp-Source: ABdhPJxb/yRvURXJNyM+cYMhzwF+P5m9ymlAqm7KbTUg8849ZMQ2i++P96EYyJERMZeR3jeLTg+ZPw==
X-Received: by 2002:aa7:c6ca:: with SMTP id b10mr36256335eds.221.1620925539571; 
 Thu, 13 May 2021 10:05:39 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p22sm2711003edr.4.2021.05.13.10.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:05:39 -0700 (PDT)
Subject: Re: [PATCH] target/sh4: Return error if
 CPUClass::get_phys_page_debug() fails
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210505161046.1397608-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d49c89f9-02fc-ba4f-a195-a8f9143c4d46@amsat.org>
Date: Thu, 13 May 2021 19:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505161046.1397608-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 5/5/21 6:10 PM, Philippe Mathieu-Daudé wrote:
> If the get_physical_address() call fails, the SH4 get_phys_page_debug()
> handler returns an uninitialized address. Instead return -1, which
> correspond to "no page found" (see cpu_get_phys_page_debug() doc
> string).
> 
> This fixes a warning emitted when building with CFLAGS=-O3
> (using GCC 10.2.1 20201125):
> 
>   target/sh4/helper.c: In function ‘superh_cpu_get_phys_page_debug’:
>   target/sh4/helper.c:446:12: warning: ‘physical’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>     446 |     return physical;
>         |            ^~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/sh4/helper.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index bd8e034f174..2d622081e85 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -441,9 +441,12 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      target_ulong physical;
>      int prot;
>  
> -    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD);
> +    if (get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD)
> +            == MMU_OK) {
> +        return physical;
> +    }
>  
> -    return physical;
> +    return -1;
>  }
>  
>  void cpu_load_tlb(CPUSH4State * env)
> 

