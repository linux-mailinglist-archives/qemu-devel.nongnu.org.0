Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605AF6559EC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 12:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p92c2-0006jG-T8; Sat, 24 Dec 2022 06:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p92c1-0006j1-45
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:22:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p92bz-00020h-CR
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 06:22:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o5so6617707wrm.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2uTKy0J8ewqkC0BwQrn1qfGNwIllmcZAuH2sZ3ieCKQ=;
 b=YTVreyJR2DHvZW6OgtsKq/c36KhPtAIOeQJmIy3ctej7QEz9b3r+WbXk6Wde+VCk5V
 XULMSpqA8GdqraVqK0sWoc1NFJNzvcYtDBqmiA9fOm2DR0hdjyc6BXnJ3zPE1cuZ5Rq6
 1awFDgxzhRVs4tEDzv8IffHxBKDv5bYcJL2AHE/TesWy5A0RE2jtl3GtJpLz1+9kp0g2
 FZuagxf+kmTU5SmajvICQv6FNhK5WimcYhKgZar6dJ2sjYPvqCE6ZP/XYNVpRcAvc0MO
 p1RXGz4LUizWWdQWlamN+i9IAL8DpB0oXMcVEIGYV/BnIkogt6JC4OGxYaHi5+T6Ye63
 zh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2uTKy0J8ewqkC0BwQrn1qfGNwIllmcZAuH2sZ3ieCKQ=;
 b=Qd3LWacCt2CjtqIGmohbLh3LHVqAeysOKOX6L58uSbFu0bK8bxnHqF/TxIuyO7vciJ
 WyiAP4005rhNNf5wqCxsk71RCG1TADJMSyWFJ63MZJH9wFbaoIOrdSCSEJVY/3UO7XR3
 URJ5bYCHudfz9lesKbNtysNDwCA0GpgtCwKbuSAlgH/uAzCrbAO5+JQl/e4wnNK2ywHA
 W0eoDACoCbSRIPAn0qcMBpCWMEFxjA9a2zWN9Xf/tyOWb8kBC8fEOiV5qzuVDfN7d/E7
 7NIQYHwvf/K6ADx7MaDQzJbp2txUj94+rhbGDlmIlcQHVH8T9bsJCU98jgjKNutDHvKR
 DCXg==
X-Gm-Message-State: AFqh2krXC1DmTuns+WylJTx6grRDDA2ACSSXwxvA3cKmeHHyuovkRj3h
 vD9m7JnLeRjOiDZNVyvwLI+aFg==
X-Google-Smtp-Source: AMrXdXul7hZ3HdTBMLOQIlyYW6fScmJxFJU0Vbkji5Lls61uvUBXLKnFYJJxL7kWc3OhIbFkyDLXNQ==
X-Received: by 2002:a5d:4e83:0:b0:25d:9954:32c9 with SMTP id
 e3-20020a5d4e83000000b0025d995432c9mr7374475wru.10.1671880956599; 
 Sat, 24 Dec 2022 03:22:36 -0800 (PST)
Received: from [192.168.0.27] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 h15-20020adfaa8f000000b002421888a011sm5384456wrc.69.2022.12.24.03.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 03:22:36 -0800 (PST)
Message-ID: <ba877dc8-5628-4cb1-dc58-c68972982536@linaro.org>
Date: Sat, 24 Dec 2022 12:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] scripts/coverity-scan/model.c: update
 address_space_*_cached
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, armbru@redhat.com, pbonzini@redhat.com
References: <20221223204330.260647-1-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221223204330.260647-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 23/12/22 21:43, Vladimir Sementsov-Ogievskiy wrote:
> Make prototypes correspond to their origins. Also drop
> address_space_rw_cached() which doesn't exist anywhere in the code.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   scripts/coverity-scan/model.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
> index 686d1a3008..b40d0fcbf3 100644
> --- a/scripts/coverity-scan/model.c
> +++ b/scripts/coverity-scan/model.c
> @@ -69,7 +69,6 @@ static void __bufread(uint8_t *buf, ssize_t len)
>   }
>   
>   MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                      MemTxAttrs attrs,
>                                         void *buf, int len)
>   {
>       MemTxResult result;
> @@ -80,25 +79,13 @@ MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
>   }
>   
>   MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                MemTxAttrs attrs,
> -                                const void *buf, int len)
> +                                       const void *buf, int len)
>   {

Oops, missed in commit daa3dda43a ("exec: Let the address_space API use
void pointer arguments").

> -MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                    MemTxAttrs attrs,
> -                                    void *buf, int len, bool is_write)
> -{
> -    if (is_write) {
> -        return address_space_write_cached(cache, addr, attrs, buf, len);
> -    } else {
> -        return address_space_read_cached(cache, addr, attrs, buf, len);
> -    }
> -}

Apparently never required?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

