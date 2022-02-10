Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC714B1930
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:13:20 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIco-0004TA-SB
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIYr-0002ww-Ro
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:09:15 -0500
Received: from [2607:f8b0:4864:20::431] (port=37408
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIYp-0000a6-9r
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:09:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id y5so12991338pfe.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hq71XVnHtWMQ/QvHH70EqFNvBInSg/tGwy2BG6qJPY8=;
 b=wRRg8HIANPxOar+dfEKrpfzg5saOAxQ/xwd3RpU7IDFW99vBw7/vTjIp85A0YFsbUK
 ZMAtzbEW6zQomYS2FGfF3O0bzaL7LEXXlntEM5XAPiUqaM6KOwVkCdESX60APOrxlEwA
 WfY6fIpZQM9uLJXvEfUYeNakQxCVtB9KeFq3NrMkgnhCw7dj9eyXbIB8X2jKYk8Lkz5i
 K1PrtYEyO15FahlITSpOzPYlhCXp+P9afyBM2BAqEQUnRthFftYwnQ/M7SBfAPu4+zlB
 vzcMwdkV+1A1QCYWhsm6lKs/MQ8+X7zeQTjsln5UCeU50Lojddg66fvpmeAybnuocc+A
 YomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hq71XVnHtWMQ/QvHH70EqFNvBInSg/tGwy2BG6qJPY8=;
 b=Fww5rzpRGpgbyjVvjkaFUUv5SZonKLN6jnmLsHVLF2zryqY0URvsztn/ShZ/V+kfrr
 JLZQoOP+O8IcLv6lbUMFVt18OjipWtBLUeKWDT/7lrh2H0Kx2hs35BhHXshPx/hCb4bH
 ljG6asGQYNZnyHRrYg29dsuFxewZdSjnSEwXn44MjUWIIpc3tNLF3TDS2xSx2p50SFBP
 XaEl6SPnleJONHQ+xtr1pYoCn72rLodoVKk3KTZRYkkmM+JlhCNkoqrz8N1WjJoGgiwn
 gtlbCB0MTlN3bfXvuD08WR3cRq7ulztgJXgFudZioB8xqdpSE8LklE8LvEIQK9bdyHQi
 FzCw==
X-Gm-Message-State: AOAM533VstDcjxQa1J9MDmWL21Tq9RdIl+DvdzauXPuHatO+KNzgKSS/
 mXENFi0bd++f5tfFOJIAzQ4Uiepc/ftf44Bo
X-Google-Smtp-Source: ABdhPJx/cUXPXkoOF+OXn4F3Z+rnGzHgCv9tAQX/3jV7q/Kejr4BghaulYddjxfke7Cv3cc7/iL8uQ==
X-Received: by 2002:a63:4e:: with SMTP id 75mr8041770pga.461.1644534542621;
 Thu, 10 Feb 2022 15:09:02 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id l12sm25684118pfc.182.2022.02.10.15.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:09:02 -0800 (PST)
Message-ID: <0a680925-4a0e-4847-a147-45caf2225b5c@linaro.org>
Date: Fri, 11 Feb 2022 10:08:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] coverity-scan: Cover common-user/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> common-user/ has been added in commit bbf15aaf7c
> ("common-user: Move safe-syscall.* from linux-user").
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   scripts/coverity-scan/COMPONENTS.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

