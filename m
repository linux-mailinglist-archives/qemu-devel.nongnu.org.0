Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D785BBAC4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:56:36 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfnf-0002FN-1z
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZflz-00083t-48; Sat, 17 Sep 2022 17:54:51 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZflx-0001hu-Dg; Sat, 17 Sep 2022 17:54:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o5so14183522wms.1;
 Sat, 17 Sep 2022 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=0yjlc3xc1yqmAQVYadAVXIdBpfh2ggHfzC5ifkrlEcA=;
 b=AgWbNyOiedzLMDAK8X/PWbAs/L/CvQ9wocvLMkAP9S7MbitoEZE5gFXXVfOUlH8KX2
 ACH6N5JeqDFhZ5TbxH5f0s18s3JmcFuWv7rxneRtOEy2+GYpx6CCRLm8hMMQDnLYE4oa
 8pX5BxkxYXSbtWBLwXgN8A0oCqAdx0DY2rgJAgO5xyCFkwMCtUYD06xExkgTiiV52yYb
 5HCbcp2Pqbc+BcpxCegPVMEAcxRa+T39TqXMoZgsAYGq42BdVa1t8qEHZB9fmwn/IxYS
 YJ52gn2Ge09opJBQhfnNMEoRV3ipJm4jcsplKvT3X5Xi7sr8qfZxahqYeEQEiWdzy71J
 V7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=0yjlc3xc1yqmAQVYadAVXIdBpfh2ggHfzC5ifkrlEcA=;
 b=OXttf/iPFv1BFvtjkSdMvzwQ07SrQ2lnaH4ewLbyhlH9yM+WX4L/+x70sGmadExO0Z
 tN7yur7futljzau7aJfFraFzpiJZxVE5OIKhCQCKM7MCa7WutJFSc/KtM7BUMdo1+dPd
 L8U4ySpYwrJKpHLBHTC9eXfgKHWJp03Vb76nJOPZ+esKkjzDxADzkAAROwj4z+AY7tqM
 6ynOONgj6POUbNCH88BIHMBgKgb05Cw/hJOBaI6OQgwgmRYmc+ucjlUN4V39r5KZGr/p
 r+AA2J3af35nEmqP/CUbgtFefTxZPitq9s+WAs5uaBpzaAViQXxbMf7Lu7XlTgmqBlcM
 o1Uw==
X-Gm-Message-State: ACrzQf1zRL6eibUCxY1yHGKX8Jw4FhU525jEA3SC0eulIZmkj9TeYCgV
 w1G+GsFxyhoRR4/L93Mod0A=
X-Google-Smtp-Source: AMsMyM45rabmGsT6n5sXW/vEUuIbskfG+BfZV9+rxgujN0yGrEturkE1oo6JI1B+3UUg2NPb8FJxow==
X-Received: by 2002:a05:600c:3494:b0:3b4:cf62:78f1 with SMTP id
 a20-20020a05600c349400b003b4cf6278f1mr354240wmq.136.1663451687347; 
 Sat, 17 Sep 2022 14:54:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b00228d67db06esm8736199wrt.21.2022.09.17.14.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:54:46 -0700 (PDT)
Message-ID: <2041d203-ceff-11ce-27fa-16b06eb991b4@amsat.org>
Date: Sat, 17 Sep 2022 23:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 06/21] ppc4xx_sdram: Move size check to
 ppc4xx_sdram_init()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <53f8420bf31535257075e2d53368aa6011c5443b.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <53f8420bf31535257075e2d53368aa6011c5443b.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/9/22 13:34, BALATON Zoltan wrote:
> Instead of checking if memory size is valid in board code move this
> check to ppc4xx_sdram_init() as this is a restriction imposed by the
> SDRAM controller.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc405.h         |  2 --
>   hw/ppc/ppc405_boards.c  | 10 ----------
>   hw/ppc/ppc405_uc.c      | 11 ++---------
>   hw/ppc/ppc440_bamboo.c  | 10 +---------
>   hw/ppc/ppc4xx_devs.c    | 14 ++++++--------
>   include/hw/ppc/ppc4xx.h |  2 +-
>   6 files changed, 10 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

