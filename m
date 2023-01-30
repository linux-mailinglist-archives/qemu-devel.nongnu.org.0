Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F205681FC1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:37:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdhw-0005FR-UG; Mon, 30 Jan 2023 18:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdhv-0005FE-Fk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:37:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdht-0000yS-W9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:37:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so9424770wmq.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3U5ZTfh7wAytQCSB8lI8oV5FlWpa7E8Z0yZ/qhSUQ2E=;
 b=exrbLVJAynzIALvi5QETymMeRNrErSgrpWScQwiktPpwsypjxSUFuaF/MiYBMCTGr/
 78wWxQC01oCQ9dCQ16NwOdb+TDXdxYya3jBcZNpCvVAi2V08DVQe02tHb/3d/snbsFH7
 8DHly+qreqyhhpjxDdPhwEY5CmKFkAJOrfNYMdDWnPAZ4lxq6NN9umdzTmUHLi/AyuLg
 jfzfkEKs0JGLW8eEotnALbeTM2koI3fAl6sHGWUjIZARj3TN8aAHxR+NfddZOh2w1a8Z
 htIQjEevxrIh4x+9gFCR5pqCBZ22J2qELsBeatfepae89QuW4tMhEPyUXddtRD4epx2G
 bgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3U5ZTfh7wAytQCSB8lI8oV5FlWpa7E8Z0yZ/qhSUQ2E=;
 b=Yc+M2gW+oZ5fNEsuctZ/AafSy90M7qMRRk2suBhIIfAryw7QQBpRlSdgDLnB0vzJxS
 CXlrY3pQevfQ1wXMvlif8VTnf+EfsM02dq3/KaYMOXeK+tMhsnAJ8C8P0cWdQER1py37
 RQZrzpovSluYgBxpRoLNlo0E0Qbi/mCzXWtPNHhSsXL5rr+ujabUJbGmoaC+iO/aRpuZ
 A8zL6UhtgdmLJvz1gwzKzZj2AZM/9Tp/2EDddfzMNlnvAa2IxWNyslLFG5zxHsTtdxy6
 P0NAna0qZZZIQg1bw3CNxrfg1cMyCChTtLoM3Suur1eebj17/Z8cihL8ABtb/uY/TNtC
 3eGA==
X-Gm-Message-State: AO0yUKUElT9ZF/cKBcyIH5rsBvI+hdFNDplYU1lUrANeA6HdqB6m9f6K
 zgluxNaBW6ycG6J8uaMHBq/f/Q==
X-Google-Smtp-Source: AK7set9cj80GjpjCCMUukKBiH6JeOnTjciFN/zCgXioMBJwT/MYZMl71coRR8ysHKmvUjkExVEsRVA==
X-Received: by 2002:a7b:c847:0:b0:3dc:53da:329b with SMTP id
 c7-20020a7bc847000000b003dc53da329bmr6840372wml.17.1675121820435; 
 Mon, 30 Jan 2023 15:37:00 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003dc1300eab0sm19606681wmq.33.2023.01.30.15.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:37:00 -0800 (PST)
Message-ID: <de52dd2e-53a5-a568-d59d-0e46689c7c43@linaro.org>
Date: Tue, 31 Jan 2023 00:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 08/27] tcg: Pass TCGTempKind to tcg_temp_new_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> While the argument can only be TEMP_EBB or TEMP_TB,
> it's more obvious this way.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 18 +++++++++---------
>   tcg/tcg.c         |  8 ++++----
>   2 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


