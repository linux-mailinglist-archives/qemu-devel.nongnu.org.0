Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126C677660
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsLI-0008Qf-T1; Mon, 23 Jan 2023 03:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsLH-0008QV-Fw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:38:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsLG-0007Ya-0C
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:38:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n7so10028083wrx.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MaKttv1aHjPLItLUzXl8ojBuMZFyZHnFVbfCz1FZACU=;
 b=fJavOl/SLoElzFHdArFXxolTei52BD0asT2KF7s8tKPjleLdgiR/98fmXrNuhRxHNd
 C0dzx2oK7Fshi8FJKuu0H6hInV9qloEd5ac/23+VFBK1C4lyJbcEuta1HV20UaiXX1a8
 NTWf3blL88Jh3IefZt43pzy2JYt0w6MvhH/ayrRCi7fhZfG0oYDtnw6kzh0VRZ0Sp7qx
 RRvvqRmRS5MlCILA+rF2PCmpSjwWiuvQkaEyGEadcrMoK3kjw+1TfuDqJwsVLM+X9y2U
 xmyLuqieMsrsh38m62+ed4UxSwkv8MqNNRIQ+WyQ3r+B6we1+A5CoIWjydKWbEnbqsZA
 4xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MaKttv1aHjPLItLUzXl8ojBuMZFyZHnFVbfCz1FZACU=;
 b=EHOfvcngLrCMnd2uOJ/Its6/NqFP8BAY5joAVJgbZmtrnanAPRO6cN0TmwXuTo2+I/
 5tm7eamjgTKuI2Ra9aOgaiG1mSqlKlhLuMojGeMgoMMFIoiv+4mLY8CepmipQMAcw1sy
 HBlGLkDMm94zLnuiCPRMSNJdW0MWLvgodiNZa5vraAvctPONbtkqhFQKoPj2ovQXdjNf
 9bQqBtfK3c7/kANoQ04eYPCqzFJnz99i8DhabvFOliYM0XwGtVctp2hky5bjQMQZFXJW
 TGA8/Beb8n+tN426gVD9h+kyuc5Gt6L4hFBCupDaW7M7/+VNZTz7dDglatqkpgpZmt6M
 Hk3Q==
X-Gm-Message-State: AFqh2koy5p4qCBiVgiYUxGUTcpVdjA+Rctpc0xRYKifAgUxaqemtL0+2
 lNmlc4Ai8LL4e+OQwrLz6cmGUg==
X-Google-Smtp-Source: AMrXdXvt0/IA6QfmGdomqDEyaJWaoNmxBp5Osizi4ESg7sgmnOM+MDfWIjSZfS13WP2zYcWEJxtzMw==
X-Received: by 2002:adf:cd8f:0:b0:244:48b3:d12b with SMTP id
 q15-20020adfcd8f000000b0024448b3d12bmr20738305wrj.45.1674463092697; 
 Mon, 23 Jan 2023 00:38:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600011ca00b002bf94527b9esm6542189wrx.85.2023.01.23.00.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:38:12 -0800 (PST)
Message-ID: <78368e67-0ed7-1828-100c-d4d9d15fd27d@linaro.org>
Date: Mon, 23 Jan 2023 09:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/3] Misc sm501 clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <cover.1674333199.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1674333199.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 21/1/23 21:35, BALATON Zoltan wrote:
> Some small trivial clean ups I've found while looking at this file.
> 
> BALATON Zoltan (3):
>    hw/display/sm501: Remove parenthesis around consant macro definitions
>    hw/display/sm501: Remove unneeded casts from void pointer
>    hw/display/sm501: Code style fix
> 
>   hw/display/sm501.c | 419 +++++++++++++++++++++++----------------------
>   1 file changed, 210 insertions(+), 209 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


