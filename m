Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867696A17B3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:07:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT79-00065g-F3; Fri, 24 Feb 2023 03:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT74-00065E-KL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:07:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVT72-0003HN-HX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:07:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j3so8860768wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Q7Q5fylKDvEpx3qFZCn7WLGV3rEqC4zoySFjBIyZO0=;
 b=agVrE34WmtC6+3Ri1sxgD3XWFQl2Kn7Gh7P9tXfuu8TgmoWhjkRi0JqDshSrOZTB62
 vxvaQ9Y0VlU6tUL6bLZgfC9eMyNELosxMqNrSGgfck4QEFqIVB9ZpH2vVjjFdiDjEO0R
 QSQ5TA9WmDvsI8keLfoKTSnPXxx6SeXjp6I+MIdC4EOxCuwbnuAnEijHYcBvNvWArObp
 9Pe1uh5Cs2qNPlAEEZ7gItl8NhRfUujebG4Jgeig/3t2grwfEC0t0mmGlQ4qLPbT63A1
 DOTBI74F4uM1mzZVADFtclYAZF+DlBVzXCeIlnB1KU3sTxgpKlrU/6vb4RQMzIX1Tn7o
 Vo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Q7Q5fylKDvEpx3qFZCn7WLGV3rEqC4zoySFjBIyZO0=;
 b=i31Hf+lxId1kQqO5H+hVhXu7x/qJ7dk3FsSOVOHce1GefIQXPJYxceJfFjG0F1C/LU
 AW/5YsseDtFAztHjvNuOMYr7TNXffn1K7AU88OonNd8AfujPVKXdGy9K1lzDdXbIaLp7
 6hpdF5kmrt2MXgBqWIZnkavCdfx50dd9jDEz7IFrk41iB5OAOzDUn4zjheYTY0+A9My3
 gNGak5yHrqfBg1yQeysPY9KiNDCLaVsOMx9/bF9QALQsVr+TEyWIamlwdgJ6SK4YZ3gN
 6oBs8XUWku4f66ct9d/Zvey3fJoDQRx4a9Co6V/L8+fqMbMavl/ovxNbPH7NIArQSG7Q
 0bng==
X-Gm-Message-State: AO0yUKUYyxtMo36u6okJIfd+FQTy5hwW39BaS2VsoUhhVC6M2gRCv15s
 Qdo3dRe22suIq9QulW4AFaPwwNDNKC3nvRrQ
X-Google-Smtp-Source: AK7set9AAHALfPJlKjZ8ifYPM9LTB5FADdcr+Y9ra3uAm8f/l4beaBj55geoT78Iv5Wk8cEbTYparA==
X-Received: by 2002:a05:600c:a28f:b0:3ea:bc08:8f1f with SMTP id
 hu15-20020a05600ca28f00b003eabc088f1fmr3021071wmb.20.1677226046610; 
 Fri, 24 Feb 2023 00:07:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a18-20020adffad2000000b002c56013c07fsm11738795wrs.109.2023.02.24.00.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:07:26 -0800 (PST)
Message-ID: <9d1ce305-3d92-ba78-41ca-0ebe42b3a599@linaro.org>
Date: Fri, 24 Feb 2023 09:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/28] accel/tcg: Use more accurate max_insns for
 tb_overflow
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230222232715.15034-1-richard.henderson@linaro.org>
 <20230222232715.15034-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222232715.15034-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 00:26, Richard Henderson wrote:
> Write back the number of insns that we attempt to translate,
> so that if we longjmp out we have a more accurate limit for
> the next attempt.  This results in fewer restarts when some
> limit is consumed by few instructions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/translator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



