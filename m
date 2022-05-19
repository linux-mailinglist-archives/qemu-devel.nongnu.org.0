Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C752D7A4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:33:15 +0200 (CEST)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nri9K-0006w8-E2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri6Y-0005Lc-W2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:30:23 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nri6U-0007Lp-NG
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:30:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j21so5183971pga.13
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zMezyUjred3BIx7BwsjZX9/ciN3CVbXNW2S97VmZWAs=;
 b=gnwmW7Ty1p4bPLjIYRzGdKWpg2Qf1Hto6jXWVA9DRt/E7aa+gHWlRiLO/dZRMRnypz
 RpddrFH/O0k1DzVeoPT6j6/u2BdPZ8tn0Krlt+G8S8QIymI6ZyfF2T9y66TP2EYCtOZN
 p3HhSg5Wf/uUZxBQneHMnhcN01xmsaulr/X5MQeK/gDz6TeBw9UZauXwwDo5ol4nUfSL
 aA8N5Ay/SE0YyVFJFi17piPYw8yZKZwCbFLr56Lw9KVPLp4oC7KPUFuYYyw8PAJCNkf+
 XO16pFSc3BuEF/km8oSN1dSN+p3ccQqOVRCp6Oui1bTvlo1G3LArvrNJn4BjbfWT7yed
 r1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zMezyUjred3BIx7BwsjZX9/ciN3CVbXNW2S97VmZWAs=;
 b=AOQeYy0y2/CTSs8QokVT12fat2dfQUaSOtWGwhewAVC+VmkVlrtRMY3uqnpRJax8eA
 /9xwe7Ah29p8VYOfzUlcw8dLYo1w3TEo9Y6GQ+CsnEmmRGMOJmd0z35OUrYnvsy6LTM/
 YHCXiAPycWgotgkkzelphjqb0nX/TMTVTEwflXu0deWzMNNabO3X9zukT0lENiIyKo9z
 zQLgzATPh1+J+CJZyVviry8lzqOBScw9airEYnLMmdZ/4uHP3D7+rBYjT2CaXaLmupZK
 /ogYAsHiRFpP17oCIuJ2GqRCNswqLG2GwAWtTImSto6nwIoa/AF5mOPNqAsFGsOHzKA9
 cGMQ==
X-Gm-Message-State: AOAM533iS4o9otId0W47Pu++wtp13cXEQO1sCYyDk+wX9+IV89/6ZWbX
 UwLDcSL6Qv17W0RPWL7bQFrZxQ==
X-Google-Smtp-Source: ABdhPJyJOkfsxKbLanrvZWJr9xkydQ7ZiqoT9zTb/YybBfUWKdTVQHV3k2j9vmQ7LMwgbHsvAYREuQ==
X-Received: by 2002:a05:6a00:84e:b0:510:5fbc:7738 with SMTP id
 q14-20020a056a00084e00b005105fbc7738mr5539912pfk.86.1652974217174; 
 Thu, 19 May 2022 08:30:17 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a17090aaf9800b001deb3cbd8f1sm3665802pjq.27.2022.05.19.08.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:30:16 -0700 (PDT)
Message-ID: <78f67797-5fbc-1c72-3338-81459209f269@linaro.org>
Date: Thu, 19 May 2022 08:30:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] target/ppc: Fix eieio memory ordering semantics
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220519135908.21282-1-npiggin@gmail.com>
 <20220519135908.21282-2-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519135908.21282-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 5/19/22 06:59, Nicholas Piggin wrote:
> The generated eieio memory ordering semantics do not match the
> instruction definition in the architecture. Add a big comment to
> explain this strange instruction and correct the memory ordering
> behaviour.
> 
> Signed-off: Nicholas Piggin<npiggin@gmail.com>
> ---
>   target/ppc/translate.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

