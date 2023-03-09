Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C856B2585
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:34:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGOy-0003QA-1n; Thu, 09 Mar 2023 08:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGOw-0003Pg-5r
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:33:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGOu-0004io-ME
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:33:45 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r18so1891872wrx.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678368822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00x3kO+yCNABnbgCgDedoIFiYN180YUQgFKU3+H3b3k=;
 b=WUDRf7fw3stacurWhmtyfalS6V+0GxcRVZzRFoTReAIfNgEHaoCW70k82o6qIFIcWR
 SHjvz0p3DRYGH+VYt45bm012BK2dcdZtAF3AWA9k5r9lbGN89tYSfPOe7CrOaxP6I7CH
 w2NI9yzI0SL7lCdQu81Uf37YWwjOvHMVm5bc5d5xAFAkdTJmbX/ePcXmXJOgguHUIRwo
 2WjI+xbv4qlSvtQ9DAwv/vWVH64qjfjQM1E5a8Pgthu7/DWHAmrZGUboVKdwss9QMfAA
 g9r4yuKbn2ZJCSbik6MOR9JJPTfTDgKmZyv/j/4+w8Su3UeVjVceqHC45F7yQRDjtM9/
 sXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678368822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00x3kO+yCNABnbgCgDedoIFiYN180YUQgFKU3+H3b3k=;
 b=f7yrqyHz7/04GCtpYf6z79L7EMu4dWLa92DDRcNCZsHtvAvP/ewNWcnlL5AazYqrpc
 EMzTxEL1oZxzO0xHhajX/8/+HFV0+LeqRTsssJA85JbK9KsBd0dxoA90rhmvMATZtVZH
 9rJZoFvwG7JpC0xnx0WR1sIL3hsOh3H2TUyPcm319BjTq5IhxjvYYJu5ydJh6P56y9w0
 TZLJP+f80X9IqyXcNNZqbmo2k3zFEwQEnJOVycRsNBwz4tmztRsX6ssiWWuFKmV48EwL
 9DbrkIX5Ush1NnpPDlFuUTNBlByHUvXjLDjneM7ESN/Osu+uaWg9bfJGRhWRwQLmmX2l
 Hvzg==
X-Gm-Message-State: AO0yUKUAZC2iMbmUZ/bahOgfp9Qkix8ecFkzcEz2gbPDuwh68EivIoMB
 Kxw5dWW1FtEinAKcccQPVQGD5A==
X-Google-Smtp-Source: AK7set8/y8mb2Ak55UgkYsSDDJW5/9Z2WKva74c6WK738FYVQsNCUm0Ml35lS94b31JqYgqrfOIdiw==
X-Received: by 2002:a05:6000:10cc:b0:2c7:e60:abe8 with SMTP id
 b12-20020a05600010cc00b002c70e60abe8mr18206014wrx.9.1678368822674; 
 Thu, 09 Mar 2023 05:33:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003dc42d48defsm2838923wmq.6.2023.03.09.05.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:33:41 -0800 (PST)
Message-ID: <2c93cf00-1770-4d9b-3a46-9a52322c82c0@linaro.org>
Date: Thu, 9 Mar 2023 14:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] memory: dump HPA and access type of ramblocks
Content-Language: en-US
To: Ted Chen <znscnchen@gmail.com>, pbonzini@redhat.com
Cc: peterx@redhat.com, david@redhat.com, qemu-devel@nongnu.org
References: <20221205120712.269013-1-znscnchen@gmail.com>
 <Y7hh37KTO5BcPs7z@x1n> <Y/8/+D5TYZQ3XVQH@ted-dallas>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y/8/+D5TYZQ3XVQH@ted-dallas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 1/3/23 13:07, Ted Chen wrote:
> Thanks, Peter.
> 
> hi Paolo,
> A gentle ping:)
> May I know what's your opinion to this patch? Any concern or further improvement required?

Merged as commit dbc6ae9c3b (fixing format string on 32-bit hosts).


