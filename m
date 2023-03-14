Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104D6B8AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 06:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbxaM-0006Py-Ss; Tue, 14 Mar 2023 01:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxaC-0006NU-V1
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:52:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxaB-0003Rq-6i
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:52:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l12so4945406wrm.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678773139;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rwbzg+9N9PvBnLbuqOp95OhBNo3Iegiydy39mFEgEqw=;
 b=SwA6WBo/9DPhscs7HIlQkK2h1N3sV9FYsyf/8LRLecvm30UxlSlpsgmv16irFhl+gR
 ZNOreZnWP9dTD9EwHBGkFwarn5JEFQf3+IUCvQ6GZhO8wpwNljGXAYDLdFCEYEYLtb4g
 ot9AU7D03jtV8qbF6yFp0B6knk7N4rvtVsj4ocIF6J59XhPNpwcfnvIsKxgjGePkE8PI
 VBNuCkhBEDoPShqqUm34OjKLuMltLFhHiPtlG0brNGohPSPMGK+JkP5acb2ITvbjlY2v
 5T0jdfK760MghI6o6MoH8vMTeuwvJOYn0quw0PkjM0svrgz1N+hs7G4bm0S81NXIlU4r
 rymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678773139;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rwbzg+9N9PvBnLbuqOp95OhBNo3Iegiydy39mFEgEqw=;
 b=UHdsdGtH/ZbyBYMl01c9/k+NZgVAeUtLwb8GfCXTMa/OWYHjU227pJOUPY0bQZpJ3J
 V7kraxfH3nMISU62tBCZCk5RfiSYEtHIMOQWt+amOzwyt6MSqDqaivWq7qYg0sTuOwPG
 3xpVY3F/xs/z9wiiArF965Q3ZFFBwHp16ZOHxwyIaloKn/exmkQ1KfTIThvRcc7dfx9J
 hT5dvdYO7kJcZmOgpJk1KAd7AA+d5PdMZuVp/tBUVXgwMC2rDLGc9qjYxCx07MvK2ooE
 +VrMwShVR7icmpuW5tXONQHikiTKCEDyQIoZPQU40PZ6YCjN8ipa1qxTR9/UFpgeusU4
 ivoQ==
X-Gm-Message-State: AO0yUKVOQj3Cp2C+jc7NG88PZeFV9S1729VJOBAhU64KvdiCHItnc263
 ltdCDYUF5a1D3KynFq238+c/Bg==
X-Google-Smtp-Source: AK7set96AdxfbSxLQvo78ZIXPZl4cDWKYRyGGfz1GpETL1voO4k1LZlofym057xHpTRHTGNiN809sw==
X-Received: by 2002:adf:f686:0:b0:2ce:adfb:ce with SMTP id
 v6-20020adff686000000b002ceadfb00cemr5122771wrp.44.1678773139462; 
 Mon, 13 Mar 2023 22:52:19 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b002c5a1bd527dsm1111098wrt.96.2023.03.13.22.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 22:52:19 -0700 (PDT)
Message-ID: <0a87c418-43b1-c69d-ebd5-8998730409f9@linaro.org>
Date: Tue, 14 Mar 2023 06:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] target/riscv: Simplify getting RISCVCPU pointer from
 env
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-3-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309071329.45932-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/3/23 08:13, Weiwei Li wrote:
> Use env_archcpu() to get RISCVCPU pointer from env directly.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/pmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


