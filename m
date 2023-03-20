Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C87A6C23C9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:35:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peN9q-0000VS-QD; Mon, 20 Mar 2023 17:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peN9p-0000V5-3e
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:35:09 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peN9m-0000Zh-RP
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:35:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id o12so52338829edb.9
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679348105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xyp8qiXr7MaDJI9wlZ+/XWVwFRtw0SZJlb3ctOImlkM=;
 b=d7ObDDfJxTxCyA8NR1KCiGbN3Yn2nd2jS3IjyD828rspBJwRsUiuRfXhUgLkNOGyee
 c9t+yjmNYtC9ZeeP+2krOukOyPC2ECpV/lf4ZxsoT5ieW0UXm47NXAa5Y4YoZOy8tslI
 eNhIJedT7kU3HH6eSmIgxJeuNctmZ1nHD94nzQhMilPy2cYLFbTX3OyW20dpaVXl8HsY
 mssFVxv3IWF4Dq/Oz8IzUspIdO8517XpfjQ/eBKluWk1GF3MQe7NYBR/ldVKz+S1I+0X
 db8NC9cKTTFaKvXpEo8wYNSyXU/X/An3phdsSeeUON55FMzN8LF1QXYpfODK2Mh/Lo0S
 XrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679348105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xyp8qiXr7MaDJI9wlZ+/XWVwFRtw0SZJlb3ctOImlkM=;
 b=gk0jeYvUZXGr9iaC5+C1s6yTxQ3roVRRMpAinbstEpdMP52GxfX2Le/iOjxD6i2KQc
 QzNqh3mYT9Hx5Uh1wSncfqOWpKXtTpsNHydflvtZUWRZoOb02694jTZ464XfNETlwkf1
 OKck1KMnkQctUrtTzzmBma7Y7YcYkIKw4kntsD9vwroprQ4kdAANWCNwhGphMR3P73y7
 mDYX51f0R0sXHAE+szAM+CmIvQ2o3U5q7BL0aUXrG+XHj+rmyLAye0ZzCQ4BaQEwlX1H
 E4H713FzMjjuNv2RuwaZ4wuIA20jDhyzhIypIgggWAyiTNgAyk41X4hQWOhKYt8YXDh9
 x/ew==
X-Gm-Message-State: AO0yUKVhr0gARFyu/rO3BlBElDjj6d9otbx5VSIHUEEEe1y5G8rgaYAd
 tFS53eoTk8McHRetsvzGd5MuHw==
X-Google-Smtp-Source: AK7set9MeXmj0iiJHsw97YQZ00jDz2LBQ7/dkQI+RecMmdq5ywf2Umy5Ofwnzbr6ZFovyf/CAQew1A==
X-Received: by 2002:a17:906:11cd:b0:8b1:264f:3776 with SMTP id
 o13-20020a17090611cd00b008b1264f3776mr579138eja.23.1679348104923; 
 Mon, 20 Mar 2023 14:35:04 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170906344d00b009318ad4a583sm4901941ejb.210.2023.03.20.14.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 14:35:04 -0700 (PDT)
Message-ID: <7ae07f41-17d1-cdbb-3140-fec5d9986558@linaro.org>
Date: Mon, 20 Mar 2023 22:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 8/9] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230317155455.341843-1-richard.henderson@linaro.org>
 <20230317155455.341843-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230317155455.341843-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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

On 17/3/23 16:54, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Properly truncate tb_last to the end of the page; the comment about
> tb_end being past the end of the page being ok is not correct,
> considering overflow.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


