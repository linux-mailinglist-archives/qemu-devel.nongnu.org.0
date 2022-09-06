Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EBA5AEA61
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:47:06 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYuw-0002qF-2c
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYJf-0003Rv-OP
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:08:35 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVYJZ-00054q-4i
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:08:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y127so11334877pfy.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=hi0q8aZatT5O5z1kyQDOVcz+dVxcsAacUiTyCoX/gPY=;
 b=eYwamA/xi63Bjw0t+e+Cb/NStdQht8cl20fbTcuoS7H9EoIiTqUvDZOsgiAJJ1vG91
 hqEzodctxwBdBWQ9oj57aOUcI3P1J84++0PYmpv5QtmkE0I7WLMSsFhNm7VHI8anRy53
 KD7MgGzuSdxS6x19TzREixuWY1Xz8Ffa79dwyq6fUmiMCucDs6JAtJSuMOqLtKNAOCoS
 BRPsiY+C7CIkVW9nXmOR91KcGAddTgi4Pqi0SNgGa65N0Dd7ZCj782Vb5p6EulF8KSW+
 EdB6gxH9BoxDPVBD5Y1hs9SZF8iXMm6gBIktgSfehcsmn9Ld/EwSx0bTpDwbQIZXcv4b
 9F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=hi0q8aZatT5O5z1kyQDOVcz+dVxcsAacUiTyCoX/gPY=;
 b=a6cxqLy0dxDzwsI1HUZh0zcxssJTLIzLC+Sr14zj3nFl7jUtmQsmFKr/6KxRjQj+kW
 v7jtSx0AxfjwuuIGu+IIcuJyKsfkyEug/Istqy9MLcwdPb9enAPUkqTSVW0jQ3qvCRxS
 U/JcnrZ4ipyVDJh1CCNRZq+B3HCsR+p7YxAr/aQBKlT+SyLiZXS7XnALet7Q0SYpRqxK
 kLxltQRQG3vl+ene7oW/5UNW1vEiI7HTuwzA1feo2N0y6hbwBrhpZV8Gpyx6xcq5df6+
 EDKaEqrNHyz1AQcyR1tx0cH6gpIbcCPMFKqPNsw3I5TEC3RQDOC/r1zG9/SKI/dk8UcY
 y1fA==
X-Gm-Message-State: ACgBeo3Y3o+ZuFYWsTzOBSOdBcyGtTIk6TBxM14SRUv8RWMYirObdvqL
 PHi3ZkD9XWQDCdc715m8ANY=
X-Google-Smtp-Source: AA6agR5kARxrPBxpV787i3ds150eKUzMez1Mi2wouJcFOlYOfByXRv9YCvZegoN/BjNgJTyWEsrjBw==
X-Received: by 2002:a05:6a00:2308:b0:52f:8ae9:9465 with SMTP id
 h8-20020a056a00230800b0052f8ae99465mr54419057pfh.77.1662469705663; 
 Tue, 06 Sep 2022 06:08:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a170902e80300b0016c57657977sm9771294plg.41.2022.09.06.06.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 06:08:24 -0700 (PDT)
Message-ID: <42ca321e-287d-bca6-c253-59ea7d2d336f@amsat.org>
Date: Tue, 6 Sep 2022 15:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/7] include/hw/core: Create struct CPUJumpCache
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <20220906091126.298041-5-richard.henderson@linaro.org>
In-Reply-To: <20220906091126.298041-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 11:11, Richard Henderson wrote:
> Wrap the bare TranslationBlock pointer into a structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h     | 8 ++++++--
>   accel/tcg/cpu-exec.c      | 9 ++++++---
>   accel/tcg/cputlb.c        | 2 +-
>   accel/tcg/translate-all.c | 4 ++--
>   4 files changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

