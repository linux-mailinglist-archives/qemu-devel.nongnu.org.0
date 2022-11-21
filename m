Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E76321D8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5rW-0007Ds-Ch; Mon, 21 Nov 2022 07:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox5rU-0007Dj-87
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:25:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox5rR-0008Ns-GX
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:25:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so12632101wmb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k61NEOpjEePwjVhLNqRVwJ/gWUgVaJp/zuAsIktDvNo=;
 b=ufqff6UjjBsuGktFh81hmy0aXhtLU35KOBP0qaEVR42XmQiI9MwoaEnELGj8wqTCXu
 QHNTBiT/9Vso2I4RYeInbupdKb+5LaSpLTPBuCoowafffaLjPnqvf5crk36odSNGFVSG
 VMbb5nXODMNNAq2tyR1Qinv8h//HSW7O25CklxM3y1Qt6a6NBkwACH6E+4i/UK7ennO1
 p5FoHgtrJpzRJn6imPLKqn3T/Tfxuyw4VPFNjL/o/W0SeNoZK8NI9Oj7rzoMJWmnFjCv
 +DPpPQr5BWMdgKjT6cthpWlMrzP0C7vFgVROhfh6bTYEYuYowfTgDNIkv5un4ub0PidM
 jfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k61NEOpjEePwjVhLNqRVwJ/gWUgVaJp/zuAsIktDvNo=;
 b=Cw/rWhPrpqJ5nwsipI+KaMBNLqlyHj/ZS8kniKk+AiAxkyZVz8HM6WlLv64hT3av6G
 pyGu986JIyaSzP2uzZMuHWj7xlqdiR/o7jB4W2C7g3Lsgny0AHlPrs525ymluPRYv0lj
 Q7yDE9tGXUldEqaZYjEsT1z3e8mo64cLraCvDJ3OEDB+fnSFU3OwvoDlXEt4tg+EuNb4
 neN8k8t20S6N41VheH8anyeub3XMzLW3Jjb+ZCCF5Ji3FVYWqS/nELyHtg0EMtZLnT2b
 v+EYqQULDV9IK4xWdAxbUHyhrZrG0g/5P+WAYR7gkvwmBgG+l7lLM00GuBh6NCnh2sRq
 OV0Q==
X-Gm-Message-State: ANoB5pmB/lqfVc8iL8qJHzDyfNaF6L/oSxmgBlXQGW6XxluME/t5RptP
 l4Ee1h/0w8b48Fjm32YQhukRvw==
X-Google-Smtp-Source: AA0mqf58pkmgct8dp5/IADdnk5cdYXRQUB1EtdhCzi93rQErlIePkxhn+0wMChOwg4TFc5QB+VO1Fg==
X-Received: by 2002:a05:600c:4f51:b0:3b4:a6c4:70fb with SMTP id
 m17-20020a05600c4f5100b003b4a6c470fbmr16315786wmq.79.1669033514505; 
 Mon, 21 Nov 2022 04:25:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003cfa81e2eb4sm15002801wms.38.2022.11.21.04.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:25:13 -0800 (PST)
Message-ID: <6b526843-7b26-d735-9572-dc86533971a0@linaro.org>
Date: Mon, 21 Nov 2022 13:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 04/29] accel/tcg: Introduce tlb_read_idx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Instead of playing with offsetof in various places, use
> MMUAccessType to index an array.  This is easily defined
> instead of the previous dummy padding array in the union.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h |   7 ++-
>   include/exec/cpu_ldst.h |  26 ++++++++--
>   accel/tcg/cputlb.c      | 104 +++++++++++++---------------------------
>   3 files changed, 59 insertions(+), 78 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


