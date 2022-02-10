Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395994B0C41
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:22:30 +0100 (CET)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7Wv-0004Ey-Bg
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7RX-0000Cg-Hm; Thu, 10 Feb 2022 06:16:59 -0500
Received: from [2607:f8b0:4864:20::102a] (port=46876
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7Qf-0008KW-GG; Thu, 10 Feb 2022 06:16:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso5192023pjh.5; 
 Thu, 10 Feb 2022 03:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NvUc0S6akdGfxyIIGSFzYSboUi/VCfp3xHcNIFxeMVM=;
 b=DVobk944zxhGjGKir92Xe+mKnAVvu6pVqoZ33g9YPFQs2IN8p926YiG1+3Y7w6/2Cl
 rqVV741b/KhyuUymInbp9E7/weYvRrqFmvRrBvDYrQb9ckvhWcnG4M42Uf5fS2KnM2hA
 NwEALAlgtgTgrcgVB4TLFbiPF9pYwrkpw+Pi8CFMyoTV5plbK5US/rNmrx6KVQIdQPql
 Or0fn4e/n9D8VMi+tt/h69YpGCLW4d4bLlUgetAnzMxb2xjOZ8CF4dKj+ujoYoDS1d4Y
 EKEIoj5SpkP/Lw5QKvQna8IlD0vF+9lweB/YEMVUO9cNLO6qSqDQvEPcXaaruR1p2c6i
 RvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NvUc0S6akdGfxyIIGSFzYSboUi/VCfp3xHcNIFxeMVM=;
 b=wyD2G5wePpyxWNYIN/V8xMqyc95ZAtH1HyHZJQ7DOy3zjLcy8qTrYLzEc6mca6Fw0d
 3/oDKs0jnwMcFkR6eN7ouByHmdgN21zdMlSbYtVVGT9SylgtiZFeADCykj7fYhqRlHiH
 DhzyyW89YeIltRm6KNNpbMcJjl0ySg9L7sd8x1yUZcz+/JzXjv+3q54zPVOXlPwzrc8G
 MaxzTnaTLHbTzOSWfDFPH1+QKnOOLFNExEQBPtLMJ5afGVLEafWUAcx3tKMWc9ZdK0RM
 JcfJPRMKLOxWPBAOVyZdHm764GfX26gDx7kq2M5Mm1NYf8BJQYc9MvpwT/WmZqinZT+h
 WEpQ==
X-Gm-Message-State: AOAM533rRu21Odf6BVHPERGv1r8kV+M3VrvstX+PGzQZFQ4VlJUS971d
 npA99kdnubz6kP3cn2pbPjg=
X-Google-Smtp-Source: ABdhPJy1/N6/APFhCkOPNkcComRrYLOS3mCa4ZEogWgzlhZrGgQQTunavXp0Wf+1t4wyhFcst91CRw==
X-Received: by 2002:a17:902:6b4b:: with SMTP id
 g11mr6880183plt.109.1644491758573; 
 Thu, 10 Feb 2022 03:15:58 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p4sm5005894pgh.53.2022.02.10.03.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:15:58 -0800 (PST)
Message-ID: <f82f8772-d15a-a893-18fd-fc075d9f6b58@amsat.org>
Date: Thu, 10 Feb 2022 12:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 06/15] target/arm: Use MAKE_64BIT_MASK to compute
 indexmask
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-7-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 10/2/22 05:04, Richard Henderson wrote:
> The macro is a bit more readable than the inlined computation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


