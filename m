Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B35D6A3D9A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZJJ-0007oz-HU; Mon, 27 Feb 2023 03:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZJF-0007mJ-TZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:56:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZJB-0000V3-9i
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:56:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id az36so3734123wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j2Fc/DeZ+De26dqkQ2sRwuObq0oMb3TqQV81baYUI+A=;
 b=bgD8MT6JFb+VptMnsoHxBaEw76OECuk8LsIuTFhJaEEzESDcQ+5X6wC0FDBDuSWeqf
 VakurL7ODRlUKbFg7lr1AW2R/Yr17mvpelGhXM2bF8PcSQBMyBuN5sq88a8eSJ/MlB67
 0S/9ZL9im6sqB9W9TqG2NUnHNefqlXAeUMkVnDe57/YH4o94rhjMfU9jIVH4qeycjYoj
 qWAJmjn3ms2K7GXVOJiQ6QkbhwjiG72Io9WBfahfEYJCyJ7GK8kw6wHnYjOM3Yqsfvbw
 OZkuiN9nMukXCAcWtbsysxcfhkpP0wzPlAp6kl7khJkncfocATEj0Y9cArNrAPCQvlrr
 hpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j2Fc/DeZ+De26dqkQ2sRwuObq0oMb3TqQV81baYUI+A=;
 b=L3pIX+9xPovXakxbSR90O+MauoMO+raeJdCfsnQJ0mEZEgpaDYixkf6rC40zmkK4M+
 EgcRlQqu2E8FztmUmpviY7XITiByAG6Xkeac2IvEZweflIbDdXCqd234ntLq0D2N3DVX
 ymtf4loLGDZhEAy5wqNjG/0NVtojOCdlresSsFKT3ilU7jSpYrp47YWObK7qU3DEIsZq
 d5+vubGDPCGBy+b2V+30NfgqSTCfZ/FT0oCqb+2QJJMc/lUsHcDQ7JtA1Wibfk9pGyoi
 bZf2l4cZoGqMQ4UpWt8q3bWd34ZUGJ1b+hF14xd1RwM2CPFb+qXxRDydJ93tnhsykyYH
 ldnw==
X-Gm-Message-State: AO0yUKX0Z4biiuDlgZmgfGKdECz4BbG3xJfPk6mT6udx/TyYB8alRomY
 k6ZEoe0VkqZMJQHNYHA8TrPSmQ==
X-Google-Smtp-Source: AK7set/figWUcbIlydnneQPffQkOvaHR/NNYVvVKf6iSp3nzjFq8NWltIBp0Wg6gYjyV7Jq8WZjVuA==
X-Received: by 2002:a05:600c:c8:b0:3d2:392e:905f with SMTP id
 u8-20020a05600c00c800b003d2392e905fmr17818578wmm.24.1677488191474; 
 Mon, 27 Feb 2023 00:56:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c510600b003e20a6fd604sm8846575wms.4.2023.02.27.00.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:56:30 -0800 (PST)
Message-ID: <39ae5611-9fda-e0e4-96ab-dc10fd5572a5@linaro.org>
Date: Mon, 27 Feb 2023 09:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 29/70] target/microblaze: Avoid tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 27/2/23 06:41, Richard Henderson wrote:
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/microblaze/translate.c | 35 +++++++++++++++--------------------
>   1 file changed, 15 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


