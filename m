Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9565F636
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDY8Z-0003jg-Rc; Thu, 05 Jan 2023 16:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY8W-0003jF-Os
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:50:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY8V-0005i1-7C
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:50:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso2344471wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9BtXyxhlUmno1v/ETJQSUOy1qIANq+quUOe29Hw44Uc=;
 b=CE/IDtAgUs49AC0v72UDwFgMlsjneOs+NLtzOi+i0Ne2FRy8G+elXlrjYLbr2ykhUL
 MxZdkLLJ7fmcuyLOXrnBx2aOdcWeQR0xET/ziu5oT2AT3TCJ+2cRKvlbYgmGXEUG0KQv
 wSfVddIlQkymioVl4jeGa9vFLNxXu+FrtGnzw/h7EcNZWtql2zDLVSi/j9OKAFPAEYVR
 C8a/wEz7WJbM7uAl88CNOsYrRd9KzOYwTbot2X+EZSENA9MW39ljZ2AMp7qM6JBHjgTV
 tLRs7J2204b2Q5Mhgal80Q2MHe/Dwqq97D51ucuQgdbi/xgy52Omj8X02uDrgdnNQAwA
 9BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9BtXyxhlUmno1v/ETJQSUOy1qIANq+quUOe29Hw44Uc=;
 b=3N0i01EG7LBkDUYbRGGYoDsVGmVwInDf8sVGTcmbbwH/ioc353lpTID6duI9slHNN9
 /m90qp8xKwfrx+VBnRvFT//NmqkiU6aCfzi3WgoLFpEDtT1Bi89bIaDgqAM4u11/q+kv
 utPBiLRi6pOiBwjmp18AFca5g8bpIrTcjeDCJ/BbRsbJ3IjO3wze2rkB3ywAWrG3fp9+
 rCb3Gu+55g4nQn/9BwYOmbwLCSNdusCuOD3kJO/it/2ecOrhqZccSvHwgtMTnY+ohbVy
 QvirKX3+vWS6P1CdzrZJQOr+iDCWI0TKe0fO0otiZFDYWDUvhtFRSBF4IPOVflhl64Tv
 DgZQ==
X-Gm-Message-State: AFqh2krW/tV6ZvqdQDCKB3QBx88CiYW6I5OaxeMYk0mcEZAGSqABtrMD
 eIL5d0hXrFXYTJ2X8wuz4b/ctw==
X-Google-Smtp-Source: AMrXdXuv24P0jBv5pc6cgmBoJ33NoX+P+BDfkPqQklkw3rZ4Y1qaunM1x0xNF8FQFs2etRm5V1MN2Q==
X-Received: by 2002:a05:600c:22d9:b0:3d3:56e6:4f0d with SMTP id
 25-20020a05600c22d900b003d356e64f0dmr38412485wmg.7.1672955453415; 
 Thu, 05 Jan 2023 13:50:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c4d1200b003c21ba7d7d6sm3485127wmp.44.2023.01.05.13.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:50:52 -0800 (PST)
Message-ID: <d1f04fca-46ec-c15c-40bc-9c99afdc12b3@linaro.org>
Date: Thu, 5 Jan 2023 22:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 06/40] target/arm: Remove AArch64CPUClass
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> The class structure is a plain wrapper around ARMCPUClass.  We really
> only need the QOM class, TYPE_AARCH64_CPU.  The instance init and
> fallback class init functions are identical to the same ones over
> in cpu.c.  Make arm_cpu_post_init static.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h | 19 ++++++-------------
>   target/arm/cpu.h     |  2 --
>   target/arm/cpu.c     |  2 +-
>   target/arm/cpu64.c   | 33 +--------------------------------
>   4 files changed, 8 insertions(+), 48 deletions(-)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


