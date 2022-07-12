Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7A57133D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:40:46 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAVg-0006bm-8O
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBAG7-0003Du-GR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:24:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBAG3-0007X8-PL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:24:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w185so6773646pfb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4ZNggh9LrT3IkeGyEyhPZN0McA+MeQPAXOo+qip7Nkk=;
 b=hmxMeWovtBcO79Q2oimRb6VWJREAIXD7AYlf6qMbHuuN5PDH3rUUUmwrFlz6WLBZrH
 rxer/ysuzlQtXnEdbbb4MPvAWjBPTnzwNxv+1YSrPFUwvFdE9NJWPkbnW15ua1HB5FDN
 XwuqiCil/Dn9NR3agOwdMyjoIrNnvPArJu490ZJfKaBMnSvnxlwlpJXLJcmb08g3kMkV
 wG8aUa9YC/IgEhGWTDje1zVU9ta1chagn5IynuIzs0UwBzXqxToz0IT8NWufK14Ppxas
 WqvpETqe4TXMD/ITxRGxF7fX10/Rky/V1/tRVgOZhibGyvHyQf3TVq97/hpHBU4MjmQW
 pfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4ZNggh9LrT3IkeGyEyhPZN0McA+MeQPAXOo+qip7Nkk=;
 b=JoxwgxWxQh6whfClh8UMp7Syiys80fMTjmyJhLGtckPO9dkRz0++nOEOa/1PsNsRD1
 8sebvEUpBuUMdlcZmthymzkK6p08txftHxgf2TC9ygEsDiJxTjD2BJkHdxA0+xDMFdu5
 iNimkmcaNKamwfTCAkN1Z+LZD1avxcqt90h2BzFrmfgNI/HXL24mL6sKEsZZ2cBURZMj
 y2qfoFctFfQtdpooT2LU/XXtmIp756Fw/mWP40bFquQOrDWDboz1rBdh4vg3iPpzmDtG
 8aekTXWXSRhUID9cuYeDnQzVZsjVxHo46KHafwUKY1T0mA4cp45UGNCPlBXQ3ZfQUV+E
 aYLQ==
X-Gm-Message-State: AJIora+tLSzkDbbC0O5FHPXeAQjVFqHHvbyz6BQbRQEgt6wqrCnqLkto
 aVO8VPvfmsyyzTLLhBlcsJt8hA==
X-Google-Smtp-Source: AGRyM1vmGPJq4d3W+SGnZYoFAWm3GPIHOcFfNy0gfGxD7H/dcj1kVqYaq1xqK8hRxjl+leoca5RqtA==
X-Received: by 2002:a63:e556:0:b0:412:3286:faaa with SMTP id
 z22-20020a63e556000000b004123286faaamr19232366pgj.192.1657610672805; 
 Tue, 12 Jul 2022 00:24:32 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0016bdee4f24asm6069551plg.48.2022.07.12.00.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:24:32 -0700 (PDT)
Message-ID: <a6cb1e72-9ff4-8760-d05e-3d25df1f6a81@linaro.org>
Date: Tue, 12 Jul 2022 12:54:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] iotests/copy-before-write: specify required_fmts
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 thuth@redhat.com
References: <20220706170834.242277-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220706170834.242277-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/22 22:38, Vladimir Sementsov-Ogievskiy wrote:
> Declare that we need copy-before-write filter to avoid failure when
> filter is not whitelisted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   tests/qemu-iotests/tests/copy-before-write | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
> index 56937b9dff..2ffe092b31 100755
> --- a/tests/qemu-iotests/tests/copy-before-write
> +++ b/tests/qemu-iotests/tests/copy-before-write
> @@ -218,4 +218,5 @@ read failed: Permission denied
>   
>   if __name__ == '__main__':
>       iotests.main(supported_fmts=['qcow2'],
> -                 supported_protocols=['file'])
> +                 supported_protocols=['file'],
> +                 required_fmts=['copy-before-write'])


I am going to apply this as a hot fix, trying to re-green the CI.


r~

