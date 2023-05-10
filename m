Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A410A6FE154
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:13:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlUn-0002VW-EO; Wed, 10 May 2023 11:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlUa-0002N1-BK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlUV-0002rA-9m
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:12:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so14258495e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731549; x=1686323549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8lt6JMzLvXOfXthsxvN6VdHQF0WpJBEVHgv1Il/UTXU=;
 b=Y/IrLLNfhTgZShlwIhKHMgkJpEkyvPieLVRpvRNkjh3fbw9HQpV1+XdaeFjmhQq7at
 z7MDOEQ7r7mmjiZaOzLBv6Z69IeukSg3pzy1IdqhDzTjYM+2FAcxuwYbasht730qrq5T
 qRKZ2trFnt0gFXwpGhpJB45bNtAtCdDCA8aTWzSt4E3vjb0xEPjTkoy71d4QgrJprte0
 n63w/bPvTCp+D4lK6vRN19Tzi9OTlvKyPQw4svQ6E9dby8i6GIBuPjf0TFKMDcMblSvv
 Z2zosKLnpWjCtnTzgXUagXlRIX8/2flKYZy2EjXhGfzHxgwLUC+TnO60p3lnzhGCV8zD
 4hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731549; x=1686323549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8lt6JMzLvXOfXthsxvN6VdHQF0WpJBEVHgv1Il/UTXU=;
 b=TuyemDD4X5iq6y1azx285i6M1D1JYwKD1jfcAXu7snfes7r7gFwRA3DKDwck/pEKog
 rfQ/usXqvEPTKDnlT5lfoi1KMDsRA4R1DTYeBbM3io4Kz197EuWXhzWF0oHgrLHjg3Qu
 jfTrojaIKm9o4qkey7ABj17ceUrLK6rZxZ3/j4SZDjkwkU7IcRybMn7Fk3UOIk2uOV+K
 qV6aQO4nQ8yQfqHhed1hO0nE8CmCYt6w3PYVGmtK0kaeNUlEFF4clRTKiAErCoUEYg7D
 Llp0oovXzdQcBD+ZgAQOlQMS/uBmD8TYz58t9XpVjEbSL3xjYciqIAIIRD0BvpX9yGut
 fx6A==
X-Gm-Message-State: AC+VfDxci14d1Op2e9TvJbMGyDE/hW1hqRn/7ce+j2P76AQvsiR88RnB
 bxkar6S0+7pMcniSCP1rLh6YDQ==
X-Google-Smtp-Source: ACHHUZ6lpHLoXjbe+lCDPuQdckBYGDxLSSjMPxp/fQsZCzyCDdzYjlGGDpGUVGHrWxaXCzqmUKb3fQ==
X-Received: by 2002:a1c:f401:0:b0:3f0:3ab2:a7e5 with SMTP id
 z1-20020a1cf401000000b003f03ab2a7e5mr13290206wma.34.1683731549529; 
 Wed, 10 May 2023 08:12:29 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003f17a00c214sm22697737wmf.16.2023.05.10.08.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:12:28 -0700 (PDT)
Message-ID: <2bc20d18-f250-dfb1-ba0f-58e97d962373@linaro.org>
Date: Wed, 10 May 2023 17:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/5] disas: Move disas.c to disas/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, thuth@redhat.com
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230509163326.121090-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/5/23 18:33, Richard Henderson wrote:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230503072331.1747057-80-richard.henderson@linaro.org>
> ---
>   meson.build              | 3 ---
>   disas.c => disas/disas.c | 0
>   disas/meson.build        | 4 +++-
>   3 files changed, 3 insertions(+), 4 deletions(-)
>   rename disas.c => disas/disas.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


