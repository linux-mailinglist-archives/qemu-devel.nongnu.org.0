Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4D371916
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:20:02 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbIf-0005q9-DG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbHZ-0005Lm-0S
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:18:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbHX-0004NE-Bh
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:18:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id y30so3982017pgl.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FSZBIxednhUEpNvSHSiEk1tXSdyjygg+C8QIO4eVAsg=;
 b=S2pQB5Cr6GlRJJ6U/P+vKynidJSTjfQ1DZ9//GjhvKJVYigGtnZZPhZ9P8sNqNzQ40
 FbXS1DR7PkAGPdSO0cVU+y0v332IN1iNdYu4ofH2jFAtMCpm8rFqn3dT3dW+07PO1z+3
 RQkUMSWthf+W0MRlTn6ekfVWfOdF2Hz6R8FNmGKP5Xyty/hhPbv0Cj4LjCGXIfG90wBU
 AGXAHpV7Ft0F8z/YP2VZ42PEK2GdIDqV4HC9X9sQKTl4jkkOvQyP8rNBbifq64INOogR
 j1Nuz78nWItyyfgaVJFjKJij0dk8NOCTTP43SE7UsfwK45oKfHwb/RtEcRhYXUosk+ma
 lBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FSZBIxednhUEpNvSHSiEk1tXSdyjygg+C8QIO4eVAsg=;
 b=FlgvZmzfNJwu9yC4IiYyfghjR6CowXl9b24UfdrVHgnhC+ycFc3s/EbO5dJhwDt2/D
 ngUwYMS4WFtsAJJ2rSRBCXsRupm6aNXmgW+mInHLi9dSlsO0XBFB/PX4UL+Edsd/KPOB
 gB8TpYxphmDu5n/OwxfYRUTBMppG67E11yCwNCRCTbLX3odsRt4zLrJpYEektFxe7/Lk
 3ULBeP5f4G6Fb5jq7HakyVUhE5ezO9JET/5KTpXSi8fwsGwjGbm49nSGEOkAPQE5nnn9
 cI/PAK65ubwYewn0ymJ+28BrxL9e4EnpT5u79/AbcujKDz3SAyf6TvwdDGZvuCgfdIzK
 //mw==
X-Gm-Message-State: AOAM530HKkI5s3jMfX5bzwkmOUzylMRTUcaUnkTm8LkPzXNFV3AALNne
 lcITuXNY1a1ED69dP/F7LMJxAA==
X-Google-Smtp-Source: ABdhPJy/S1qxRcwWLMUTxLqRSXA7BX5IwRdoWyAhRUekGb5wn4IBDVId3ofaSJ2Tg3AgPIZM4ma77g==
X-Received: by 2002:aa7:8a84:0:b029:231:ff56:2c7e with SMTP id
 a4-20020aa78a840000b0290231ff562c7emr19796694pfc.50.1620058729789; 
 Mon, 03 May 2021 09:18:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g18sm9527102pfb.178.2021.05.03.09.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:18:49 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] hw/sparc/sun4m: Have sun4m machines inherit new
 TYPE_SUN4M_MACHINE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06187430-6077-c772-ba9f-02333b48c7c1@linaro.org>
Date: Mon, 3 May 2021 09:18:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Introduce the TYPE_SUN4M_MACHINE and have all sun4m
> machines inherit it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 30 +++++++++++++++++++++---------
>   1 file changed, 21 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

