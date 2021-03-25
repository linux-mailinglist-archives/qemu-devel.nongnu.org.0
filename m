Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC31349261
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:49:27 +0100 (CET)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPQU-0000gz-Dk
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPP8-0008Sp-Ka
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:48:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPPP7-0000a2-AI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:48:02 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so1771172otq.8
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YgHYnN8PtSG1CboCnXnVT5CZuysL0cFzcTrbQZ2Uwrw=;
 b=ccq0DKOMwWujr82UXfJhUAdW28U1gdS6JbAnUm8LjzAshGmu/7E9Mu7E2R8jNoqeyc
 8cKE+twIDVfloTRg3U9p03VFa/yBrKb2R1pqiMAtYIdv7Miwg3F24BwB74XiDmv5qFIi
 X02DjI8Dp9mWX69RJV8+tBdzjELS3duhefmfw1wCCHwoOtJnlGlnrzo6JJiSKcIvY0bN
 2pUZ7ukEJOdhQ64m8WVZStSmdASlz5wXn9dQqVKorefx8kaYT/R8RYXVEsXEItPeovSP
 3ga5rCXaML3AjbmJSV6CrowfdkcFhyqXWE6Bqg2XQCRmaZHYIO6BtM4NnGgCHw0YfRmm
 IatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YgHYnN8PtSG1CboCnXnVT5CZuysL0cFzcTrbQZ2Uwrw=;
 b=o4920kfD31ScTB15TfBPg3PwwOqvtrZEYFs1Zovfa8r2pnDblQzTZckmXqGETJuk/8
 gnn5Ce3KEUAvrcpQE4xvMOHgXi42EobX2+yPo5luA+NjddzoY6vqeWgVWB5/DhDQn5Or
 tsRmhrcoctcQRhVzV0RpwpH2V9/d+lVG3K77Kf7+wcCE4gfzMSNWJHoo7ep4NtDRmGuA
 TJGmOwbZ/7h/BhROEqNm/5oYk9E/qnOMlnu3e6vtuXg3dtNEHc42G2lbEwPbKr53MjaO
 QCnIScmIooTwRtlyAXJbi71ZhKmtacjGlsOgRCTcvitIZrF2zRBS9nyxK+PaefpE4GLD
 VKWw==
X-Gm-Message-State: AOAM531f4h9910orVVxOxdUX0bwAAIZnjoDxK0gdW+uuYLiSS0ot1ViQ
 6YhplA0EWLlq0iK0s2kcmORnLG9Vckh/M6NN
X-Google-Smtp-Source: ABdhPJyjCq1qN3YAk47C9VsjsabHt8lKWx/d9UGu+yqProh8FBDuOzRWN6WUnMAmgTlmpeDOu50Z/Q==
X-Received: by 2002:a9d:6215:: with SMTP id g21mr7314707otj.80.1616676480029; 
 Thu, 25 Mar 2021 05:48:00 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g21sm1368650oti.19.2021.03.25.05.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:47:59 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 1/2] hw/block/pflash_cfi02: Set romd mode in
 pflash_cfi02_realize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210325120921.858993-1-f4bug@amsat.org>
 <20210325120921.858993-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <509de75f-fb2f-d9d4-fc7e-ae08747b28b1@linaro.org>
Date: Thu, 25 Mar 2021 06:47:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325120921.858993-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 6:09 AM, Philippe Mathieu-Daudé wrote:
> The ROMD mode isn't related to mapping setup.
> Ideally we'd set this mode when the state machine resets,
> but for now simply move it to pflash_cfi02_realize() to
> not introduce logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/block/pflash_cfi02.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


