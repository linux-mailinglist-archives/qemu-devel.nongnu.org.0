Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95552AC29
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:43:18 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr366-0002ZC-A9
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr34j-0001A6-34
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:41:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr34h-0008Jf-KG
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:41:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so55885pfb.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2tY0GTsces3Kt5fAu5dMMEo/YJccsJWl9Jr0aAS5q9A=;
 b=e0IMC7X/Swf8kqvto0ohyi0Q8rGoNnAicJ7jL7YTM1/shhQebPSOBrKmRvzhHU760E
 o3grzaVIu3N5I1fwiNEX85E5Imoo2D30DzMtyIVq9GN9F+/1wlznSCCoMelZEISRe4OP
 auY5xe/Q+dd1l/e4/lO7btJMqOOxkvtfeIf93MS/52HAQmY9ylSSAyFGo5hSxQqgcUaN
 RIEI8K3kz3zL3VeXUJyZkRgsp2lC6jxjAFl6Thd9v7fXWavdddeS4NIf66/aIxxAZx7X
 Rag4TKv8hJbp4kv/h+rEtdCyKGDh/qveMBZFsaxvD8IKyczhgUSLRxx1ZiWdhHy5m2wd
 vTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2tY0GTsces3Kt5fAu5dMMEo/YJccsJWl9Jr0aAS5q9A=;
 b=xtFSk4Mu0UGKkpLy9QUgEIfWVDjsWy7EoMavpLX4u5nomRgI0zA5dlgHOHMUHxeK7e
 gXRHs77RmP9okj/Pd/ci0B07ekjqCrEurbyPTwMpHQu3ERCEbmfxXRkqPf7fO9zTDO3S
 SfxTbZ1A6K6Zu1DLPfMCxx1vYe8aj9DDYKe22QuCTLzx4uHqoN6/9IIzJW4E/yQXrOaM
 CZ9LTL/hg3tPI2UIctsADZ8GcoqeRntAqHhKc6Z0SnKIF1EZ8pfhNIyCNCBh5OkBbtBd
 s8ReJYgg5iYEA8qOcRGgzLbhvb3TJLsO/oVvZ0tfu/5SB7YV+4jwUT/IzBjMQvs+75Vz
 soLg==
X-Gm-Message-State: AOAM533FCpV69Q4WLyHlVhiYSvzGBDwgJw2dkdBApmkrVdhSHu3PdLBV
 4kwo0Ci1PIOJfZxEJVabwyRxMA==
X-Google-Smtp-Source: ABdhPJziTCxIgxZM1qWS8tljTGCEeA1e41NDxncKEundnkbe5yrZoIdzJ2cJ5p9UQhJ/fGTegh5XUA==
X-Received: by 2002:a62:1788:0:b0:50d:dc1f:70b0 with SMTP id
 130-20020a621788000000b0050ddc1f70b0mr23763841pfx.48.1652816502241; 
 Tue, 17 May 2022 12:41:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a17090a0ac200b001cd498dc153sm2649228pje.3.2022.05.17.12.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:41:41 -0700 (PDT)
Message-ID: <ee65b834-20d1-84c3-d67d-c6bea69f7dc7@linaro.org>
Date: Tue, 17 May 2022 12:41:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 8/8] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
 <20220517183735.110342-9-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517183735.110342-9-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/17/22 11:37, Lucas Mateus Castro(alqotel) wrote:
> From: Joel Stanley<joel@jms.id.au>
> 
> These are new hwcap bits added for power10.
> 
> Signed-off-by: Joel Stanley<joel@jms.id.au>
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   linux-user/elfload.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

