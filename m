Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592A32DAFE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:17:16 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuPK-0000su-Of
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuNa-00089F-WE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:15:27 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuNY-00055O-Ad
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:15:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id x29so11391944pgk.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oNPBa7xiR3W6GR87zDkVzYGTmGcJlX+2fDprzhOkp7I=;
 b=P2XkrhJJtPrrkU3q52o1b7Oru6IdR3djMAlBbwIi3BVF0jGsfD/DPQ4lNHsbuA1MU2
 jr8n9ZZdCY4GLb8VHxo/ZayMcZC1RzXGkGeczH0kPMwPDz3RBfzKZShfF2pvwdceVgge
 qijx4vbzqegIk90/+oJR3HJvafnWFGIDJxweQHH4FTb+Aq+TmL+b4ikS+/JfvTvh7YB1
 vkT0qKihLL7pabxUu9bL35FHTSFEFvMdnZyuOEf/HNJ2QuqohwKtB17OkVyM/rzBNvDE
 VaHv0ZWZyCtqD736gFgGTWUzb8zUlyE2YHPu/VXhDUeGEd0Ek4qp3wryqQl412Zxxl15
 DDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNPBa7xiR3W6GR87zDkVzYGTmGcJlX+2fDprzhOkp7I=;
 b=pftvYizHBTCAatqXF3XnN4JxVVI2GRK/6/7rmvxacBOPRqIZ4+QBTNvMwQ4eJRB4Tv
 QvC8H0kZ5B9ZXG07DlTDEJmiKAtf844bKfpS9g8riaZcrc96YVwj9EWgfJg+C06My3aC
 LEZ7VRZpWGg3VyS0ejGvAuAHCw9B6m9lZRa67q/U8VonDgjNHpSomNYlojFmTz4DXE9B
 k3yMVS8t9kSPZwvV0mRpO8jhofUnjWHNCMbh2K2MYq4CNB6XADG4blsaEj55B+OrXW+R
 27Bw1GB6pyKepdcX76lUqWyW5RvqcUHWC1HwQoCLRJkRz20eEnKW6Q2Bq5vdjrDTXAuK
 fzZA==
X-Gm-Message-State: AOAM531YQs3CYsLf2Zw5JBb8JSCoferihSc5+8n7nq/JDLzwh5dTVNLT
 uBesJ+ioDVkCmvh+5l5KPhrUmHDCwUx01A==
X-Google-Smtp-Source: ABdhPJyjSqvibAWQ2dwnwHnul1Cpj6A92ThBO+M4JsZ5lEP5EwVqpoI1SyvAyoE+kpZ2jpp+e5c1kg==
X-Received: by 2002:a63:4956:: with SMTP id y22mr5153575pgk.309.1614888922843; 
 Thu, 04 Mar 2021 12:15:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w2sm249038pgh.54.2021.03.04.12.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:15:22 -0800 (PST)
Subject: Re: [PATCH 25/44] hw/arm/armsse: Move watchdogs into data-driven
 framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb573d99-5425-e9a2-5929-6ea2a4e943a8@linaro.org>
Date: Thu, 4 Mar 2021 12:15:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Move the CMSDK watchdog device handling into the data-driven device
> placement framework.  This is slightly more complicated because these
> devices might wire their IRQs up to the NMI line, and because one of
> them uses the slow 32KHz clock rather than the main clock.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

