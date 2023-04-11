Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D16DDABC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:27:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmD59-0004df-BK; Tue, 11 Apr 2023 08:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmD57-0004dW-RW
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:26:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmD56-0007k2-69
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:26:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q29so7215768wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215998;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=srssZHCCwF7hpCB8S2kiVB002gY5stJGx5ToCWcoppM=;
 b=zwxokwfFeHuJRdwiGfoRuJ6Ljw6QNQYqEYCYjO5iCmimdnMAyINXogz/taHpuEWNYf
 JQ+eADi33ZbzHoM94ntx08GRolFwCwqEuS0MmCzDs5gj1Tju8NXP/yYBKKgTwc+Qg44C
 UyTsLk/XdhArmkgH2g2uttc1BflopcuySBJUC4+PhaW0lr77vHMYjwEhIeHRh1baFjZ7
 3DQVjmKmgx7F/dCcHJkDWDmk2BX+P74B24l1oTN8Na+/WJkX6kFumnmOSEvbepsV41LA
 MBHS8jYdGGU0bA3Yhhxs1CEbAEiol9bobYsob10p3QS4rTS68SFtnzsWSN9sCHqlPIkT
 0k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215998;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=srssZHCCwF7hpCB8S2kiVB002gY5stJGx5ToCWcoppM=;
 b=fNqrB1xD1sHxYdX6AJK8AzBOsnW4UWNRwc3iMHdulXdUJGv5eNd3b5kJa+XVutmKbG
 o2Kbo2aq9KxnQ57Y3hXEYmbF60K45t1AuazYQnEuJI3k8rxEDJn4KXhJO0Ku5cRV2DJ9
 Q6qFEFDwi1vrE3NX90QPNQ1qAeUwe7SSUrfxVoYD511jMBZBC8RhnjL+iOH5yAkhP8lD
 0m1iDeXLEUqtsDeNXfqpP7/rBADOX478Ha6Rcp0w0s1gmN+OPw0fcSS4gQ07XUh95Vcl
 Q3jvl09V0BIGpEWDXzVnsdMly647iM8zHhLlERoD2628VDLblcm/PT/O7MheBLcHD1Ez
 odjw==
X-Gm-Message-State: AAQBX9c4nkC8bpBH6IaxUBsrOK4tbbvLEP8FeRvDkH7wIGXFdWChEbxJ
 sicUw5XmmTHbnKaB4CNiVW/kSA==
X-Google-Smtp-Source: AKy350aaEtFqeTYieLrEd73x06X0cTTZLb7wRIGGWkMGQSjjsybz8h1iWwdSK3m4P8kIXr5Ey8mfgg==
X-Received: by 2002:a5d:6ad1:0:b0:2d0:33aa:26da with SMTP id
 u17-20020a5d6ad1000000b002d033aa26damr1888044wrw.7.1681215998412; 
 Tue, 11 Apr 2023 05:26:38 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a5d66cd000000b002f28de9f73bsm2975164wrw.55.2023.04.11.05.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:26:38 -0700 (PDT)
Message-ID: <7bd7940f-cc9d-6308-bd21-69daeb651409@linaro.org>
Date: Tue, 11 Apr 2023 14:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 12/12] tcg/mips: Replace MIPS_BE with HOST_BIG_ENDIAN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
 <20230408030359.3368868-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408030359.3368868-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 8/4/23 05:03, Richard Henderson wrote:
> Since e03b56863d2b, which replaced HOST_WORDS_BIGENDIAN
> with HOST_BIG_ENDIAN, there is no need to define a second
> symbol which is [0,1].
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 88 ++++++++++++++++++---------------------
>   1 file changed, 41 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


