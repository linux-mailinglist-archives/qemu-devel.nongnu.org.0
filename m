Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385C4AE331
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:14:09 +0100 (CET)
Received: from localhost ([::1]:45502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYkR-0002QY-SY
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYhk-0001Is-1U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:11:22 -0500
Received: from [2607:f8b0:4864:20::102a] (port=43616
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYhe-0000v4-Eb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:11:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so371249pjm.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3hzhd0Y9IUy7NhW9oYjdYMrS9Gs7ihWP7YLquKjhmg0=;
 b=BZVT5ZI+tSBp6eQjYJVB/UwJuU1kYGwWUugpIiafJnQ16A62GBXIRDoPOEvY6HTDHY
 FtGDtxLraLxyL2HLiHotBzSgEdFtGJvh4qbDuM9lHkDr0RH21avVZl9snMcpSg28c7jy
 Rzvz9WoJcZLI85dlXxWmq8Psa4nNaDo3awf79MYhSrQ4bGRddgXFl8Az5LrRvff+s7oo
 t9NKifN/gDhn/+3ui8MDxG6Q2qQoy+31Kf2/5xf2HUHAkpt88lcMkTeUhBmKOovOoc2r
 r+ky9rR5Hmf7jJib7AP+q3bC+7PJYXso4F9LSPx+4TsuD6igMedf1EXL117mMdyrDnn5
 ut+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3hzhd0Y9IUy7NhW9oYjdYMrS9Gs7ihWP7YLquKjhmg0=;
 b=V00x195SgHiE85HsGcKKf8kab7IqPELlJ5SCR3BIfopMgy9REB3XZ1OLGjOeCQduOc
 zIFT0PsC4aav5fP9jHxXz5lTEqWXfgOQpXrL5403xRe8dW97MtkjHS3tIIi+eav4QF0l
 agTAHkydqxx1JdJz5DBqDD3jvhwOS3t1NBnQG2t16hV0gJfMhmnwy1Zm4vkO99z6p/Ow
 9k5bZz23J+bZi7rwTXAEU6KBuviHX6tubfZb7hRH40j+DD5eabU8FwT+mYk//9JfmYzK
 56XCE6kmMa+eJZhJYHDNKl4aDkak/i69IlAx6lj3vkMv9QTJdxD9pkje3o0Te3ZUhEwG
 8HHg==
X-Gm-Message-State: AOAM532plsXELNuYkXn9EymDlPvBnvf/m9tJXUfVCOcYFu47IVpRfe1w
 YPwKe4xkfuRV0ENQsVJKdHa5kg==
X-Google-Smtp-Source: ABdhPJwhxSOJRnkcydb9IoCv17IFzYHUk9g5EbRdvvm2X4OyLXc2+ZpDuuzc/Bi1XtJHU+Vhs0Njmg==
X-Received: by 2002:a17:902:694c:: with SMTP id
 k12mr6813430plt.98.1644358263395; 
 Tue, 08 Feb 2022 14:11:03 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id lk8sm3902296pjb.40.2022.02.08.14.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:11:02 -0800 (PST)
Message-ID: <4062907f-cc6a-e726-b74a-1dd52f0507b5@linaro.org>
Date: Wed, 9 Feb 2022 09:10:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/13] exec/cpu_ldst: Include 'cpu.h' to get target_ulong
 definition
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/cpu_ldst.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index a878fd0105..5c999966de 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -64,6 +64,7 @@
>   
>   #include "exec/memopidx.h"
>   #include "qemu/int128.h"
> +#include "cpu.h"

I guess this is about as good as we can do for now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


