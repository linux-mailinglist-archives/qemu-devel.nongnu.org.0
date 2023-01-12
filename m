Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D40667187
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwGY-00061c-E5; Thu, 12 Jan 2023 07:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwG8-0005hl-Qk
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:00:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwG5-0002ff-Vt
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:00:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t5so13438262wrq.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BikLkjKqCNIF037lnCWA7R5hbeAcca4hR/URWKyh4WQ=;
 b=yoCQCAk0NqBSXYXvjN1OkYXPwXfwP6za4brG9y73hkyiWhPXGeEnjtT/7N/peOu+i3
 u29ZSqVLpSg7TSbu1BbNLnEIwTNYRhW+KMnEmvF5ShjHCBUgNwf/ugE0mEOFvF56h98p
 BMlq8ZxtxJb/u0EioEfRAEg4viHKVDa3mnRAoXo2qhg31I9e8ZyH0tF5uhQG4zqVurBs
 GW6zzGcshwvKae2sspAlP+kRIed0BXQQ2LVY/Q/k9sYH8nLetCaeeHoX/34BxB0zSeoV
 yTcPf7hbPF+ZPvUNsyC9eklZ9or4Lh9QqrAPLO6kozkMSTBsUW1YewLuOBd/l8ztsXdQ
 Na7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BikLkjKqCNIF037lnCWA7R5hbeAcca4hR/URWKyh4WQ=;
 b=NfaNlE6FUAh/GavUHX9ge/Xekdsdtfb4ti6qz6ib4MrJR7RSm52Dds2VQkp0HP/vxg
 LbcuoY5+kLIhQ5kvTPuRd1aQHBnUkhNTo01nckfZg2n7H1LOzzAXv7i8Z6wb/QO17FUf
 AwdWVvRLfqrWurWMkgT5xsPzz65slAs8mmKLkD4NtZhSt1jC5iKty8xehinbPv4kfV5c
 VEK6AHDDlJvMBTU7ZrVjHbASK68jAPTP/dmZiMRcZ7+Ww5TZYM+U5Qkpd2fD9EYrGtIM
 2mdxqKy6cb4X//5gNK/HwsfVEquO+2XbUzaEx3q16W0yBm6TWUL2w19AoE7tgfrM4xoe
 K9jg==
X-Gm-Message-State: AFqh2kp+6OjExoTk3HSrzvW6HNjGM4jfEghs6tGAz2mqMQFBaxh9odTZ
 d012pGfIT4EhkcC9s6NoALm4xj+wsqb8E4mW
X-Google-Smtp-Source: AMrXdXsR9aL38ufGoEgOT9W2MKYwTuk5y/AJNYDK4OZBGCeQWymqHEPcGDqSkqriKTDm/lF1wYzUzA==
X-Received: by 2002:a05:6000:5c9:b0:2b0:bc05:b463 with SMTP id
 bh9-20020a05600005c900b002b0bc05b463mr20612969wrb.7.1673524834902; 
 Thu, 12 Jan 2023 04:00:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t13-20020adfe10d000000b002b6bcc0b64dsm3664076wrz.4.2023.01.12.04.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:00:34 -0800 (PST)
Message-ID: <07ccf64d-1400-b19d-145e-6c0f25685d46@linaro.org>
Date: Thu, 12 Jan 2023 13:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH-for-8.0] block/nbd: Add missing <qemu/bswap.h> include
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20221125175328.48539-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125175328.48539-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi, can this reviewed patch get merged via a block tree?

On 25/11/22 18:53, Philippe Mathieu-Daudé wrote:
> The inlined nbd_readXX() functions call beXX_to_cpu(), themselves
> declared in <qemu/bswap.h>. This fixes when refactoring:
> 
>    In file included from ../../block/nbd.c:44:
>    include/block/nbd.h: In function 'nbd_read16':
>    include/block/nbd.h:383:12: error: implicit declaration of function 'be16_to_cpu' [-Werror=implicit-function-declaration]
>      383 |     *val = be##bits##_to_cpu(*val);                                     \
>          |            ^~
>    include/block/nbd.h:387:1: note: in expansion of macro 'DEF_NBD_READ_N'
>      387 | DEF_NBD_READ_N(16) /* Defines nbd_read16(). */
>          | ^~~~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/block/nbd.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 4ede3b2bd0..a4c98169c3 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -24,6 +24,7 @@
>   #include "io/channel-socket.h"
>   #include "crypto/tlscreds.h"
>   #include "qapi/error.h"
> +#include "qemu/bswap.h"
>   
>   extern const BlockExportDriver blk_exp_nbd;
>   


