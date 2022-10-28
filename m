Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC9610EC4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:40:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMmK-0002Xe-3Y; Fri, 28 Oct 2022 06:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMmH-0002VB-Hs
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMmC-00022w-Q5
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g12so6031722wrs.10
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5NeGyQ5Vmdo1IIBPysxYvMTmLaOUKtpwgZzG7edAdI=;
 b=MzvbOKJDo7i5wORLXKLC1ioO1beRDYuLGV07MUKX7LkYNIA5VWBoAlD8WWBXRez+yg
 eLWcHWiAhra7KRx9N8e9uA/2zsoidXd8fCiXZwSA7PimR7LXamYIeSJ2mpJPcBR+OWq3
 /yEY7A43zHJtLydmIzZadDATaO/ZCcozajyfHqZpm54x0gBh33J0LHZfAQHIz+gKf8IH
 HtfTKzWIunfjgoos43M5kP1JgwKDzzN0K7pvYG02ib0n1pi5fmXXrNoJoKhxMjAnWvV/
 a8bTZNQ5hl9joJSPxf48M9gryNMKOV24Ka5vZD29TF3DzRq+4VkFy1km9dcP83m+vpWC
 RfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5NeGyQ5Vmdo1IIBPysxYvMTmLaOUKtpwgZzG7edAdI=;
 b=ugee9FgNbYMOXWkRw0BxWYATI+VVnxO2wBZoT5Mj0+XjwVgvbyiMSolpXDeRq1VHK0
 o4Oz5t39p6jvvmxGB8mK/IvgQrwOxjoPXw/44S+kUaP3YnaPI6kGZsHfh5a7psPoewEH
 5oP0kzhYZSG1UQHO6kkLWuC57/7DKJApdz62FQO3ks4kX0sSo94JSjuERVst1dxwQ/aH
 FXc3A4ORdWPd0rMI2tWooNsLnL4yaDltm0leoS/YIKIJYC85807Zi7pyUQdZFQODcBsd
 og8XZr7LPJFNkNzfNLbu15j6A+O9HQd+rhmSX+jZNtuP7p9Z0SkwSkf0+6Si8aHarp8L
 maBA==
X-Gm-Message-State: ACrzQf0zly3iWlKnYGRClwjbxwRBqddTeBxGP+uVSfDZ8W3/tA5qzkT6
 HNYdK/MUZdCTvH+JObzIEdBXlA==
X-Google-Smtp-Source: AMsMyM4nEhUJ/5LcRMCvaVNjeOw2u06yAUCcgeuGxSiG+4Hb3cIXwswmVsrUW0HAMscISDOgNtDifQ==
X-Received: by 2002:adf:ffc2:0:b0:236:61e8:de52 with SMTP id
 x2-20020adfffc2000000b0023661e8de52mr20917986wrs.59.1666953587213; 
 Fri, 28 Oct 2022 03:39:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a5d690e000000b00225307f43fbsm3222527wru.44.2022.10.28.03.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 03:39:46 -0700 (PDT)
Message-ID: <20bfa0f1-08cb-e4b6-507f-3a2d367b2f55@linaro.org>
Date: Fri, 28 Oct 2022 12:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221017062445.563431-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/10/22 08:24, Richard Henderson wrote:
> Since 9b9c37c36439, we have only supported sparc64 cpus.
> Debian and Gentoo now only support 64-bit sparc64 userland,
> so it is time to drop the 32-bit sparc64 userland: sparc32plus.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc/tcg-target.h     |  11 ---
>   tcg/tcg.c                  |  75 +----------------
>   tcg/sparc/tcg-target.c.inc | 166 +++++++------------------------------
>   3 files changed, 33 insertions(+), 219 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


