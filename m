Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245C6A336A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 19:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWLh5-00013C-9R; Sun, 26 Feb 2023 13:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLh3-00012o-TM
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 13:24:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLh2-0001li-B4
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 13:24:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so5682231wmb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FWMwjHf49m5E8/9KwysLnylCdgJZJjLpQg/sl7KuPck=;
 b=zgliCXHgFA5SuctiwD4s+0GceC3w8uc1mzL+PwTTKRxPa0paIvRlGK+Ccz5ePAyjNk
 1D5Niy8WMvwFs1+CMJhxeTTIhbuIGEOq3gW1YSMsy302/v135bzurAv2FQ2xQX5FIlGt
 qCtNKBxQECWOeTvQiVj2yav163nncQMaKN62jox9ABhBQUMiNnLrTiXaesn2XqgChNW2
 9vblQtFzgNKmTUA8LUAofI+ZaurKmbl//4XqrNaaZkj59GR+7ay1irGCq+6/OVxxIXSi
 2Rye46aMfmJ0RiGjsN8TR90Uf1Ls7uYb5Fgwfpvo5a2zDbCCPwLMnlVnIintRS7sLRXo
 1+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWMwjHf49m5E8/9KwysLnylCdgJZJjLpQg/sl7KuPck=;
 b=TueWRaAxQ4lkktBhJExyVG158S9anPeBMsl7zt/o0cv285392IIYXXU5c+m1fy4nx8
 NRJ/MMoTtn6NYGPxObpaYM1l7s/cSbXpiSXgE942GBgxuSxUAu9XHNr4TsXAr3vviaC7
 X3Wl1dpNJRTjfU7YelPlSaGuQt83T4ZNMvnD+Kp5SDQkP9PgS9wa5LsZ+DlLg39sW1K9
 XH2fC1lo9vmXz93U6QKONJoDRPfMGu043U94/rULdhg0WNtNHrpAiV0e1FXEkinO1uJK
 4B1Vl90Y4RYC5Igxw7xPdS2fIESbXZmdhDN9Mr0+bsQWzoCzhiwJQuTSpUd4FDyGYR7+
 W8Tw==
X-Gm-Message-State: AO0yUKVpOoI1CggmiCHJARruysqEe4hpNHZ04DIg5dm2gxrcfC9oll/P
 SC6GsyEHNGBjq0SuFpFIQ7kgzg==
X-Google-Smtp-Source: AK7set+2zIyXKA2U5lZEWYRsdh1M29+Y9hxFF3a+58IM5W/KIxphsP/C6NTCMArHa5qhwME78XzxOA==
X-Received: by 2002:a05:600c:3d1a:b0:3eb:3945:d406 with SMTP id
 bh26-20020a05600c3d1a00b003eb3945d406mr3089574wmb.16.1677435854876; 
 Sun, 26 Feb 2023 10:24:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c441a00b003e21638c0edsm6656814wmn.45.2023.02.26.10.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 10:24:14 -0800 (PST)
Message-ID: <0f790eb2-e891-640f-a3cf-d3403eccc934@linaro.org>
Date: Sun, 26 Feb 2023 19:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] target/riscv/vector_helper.c: avoid env_archcpu()
 when reading RISCVCPUConfig
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230226170514.588071-1-dbarboza@ventanamicro.com>
 <20230226170514.588071-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230226170514.588071-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 26/2/23 18:05, Daniel Henrique Barboza wrote:
> This file has several uses of env_archcpu() that are used solely to read
> cfg->vlen. Use the new riscv_cpu_cfg() inline instead.
> 
> Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


