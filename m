Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C2152AA03
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:09:17 +0200 (CEST)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1d8-0001R1-NQ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1c1-0000mQ-2C
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:08:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1bz-0001k3-DY
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:08:00 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d22so18038393plr.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XZOGoDpagHM+3GjR1f+OvZAOvmZ3bcNYcNa5vBBMClM=;
 b=pC7mdS4zYSMVmdpSGFp7pWQYjveZE50R+MBoftQTFIphrwycP3ipERaRLJ7RR+uGnf
 iQh6bKeeNPvwr4QwtWgxwH8Mv06m+swEoEqpeOwEfrblDSDeje9nxLIYkmHBTwj7chAV
 h5kUctVG7XXyIoZ2/XIKB5VfbpeZgQwl5QhP/fRPFR/Ft6MsDlYxNBTPaL1EAPx+s3S7
 w81MpuA/P1r04a3awhR0F++r9Beo8oNbzT6bO65lYnq9w1XZZVpY2msNwuGVWoH58f2G
 TBzp+Yk3qoVZI90FF1IdOqqjY/xmO5aaNFsPVPOkIaAiQmehdLEY3RVi80DaXcMxAXLb
 QyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XZOGoDpagHM+3GjR1f+OvZAOvmZ3bcNYcNa5vBBMClM=;
 b=vOEY6VgvCE4e7PT3mhU9oGMiUmCGKcxW7gJcB/YvJmwexlZmninstWnYF6EhE/VYub
 8GwD9etqNEHk8/DHaSN4YfGtmMVDB1SvPhHOz4DRnqFV2+Zb4g1lADfPygkJsUBfV67h
 W8Y/BNFvHycYxX3mZ7OQ7jIyp4EA3GEPKWXPFakZnJhU0D4mbf0+AgOeJ4Vz/Y8sivau
 lkjtFZiPQrCm1HtixueLY5dziTtsQp+3eOTKYSZJ3yooFvE/K4iUPA3nP/x5iLRDXn2M
 l2iOM8nsg24+5SiRfMtBBYYCuOHxGVKUqJHESe7AO/wJHWK8VSv5pGvqVORuC9f0A6XF
 7F9A==
X-Gm-Message-State: AOAM53247BzfXj0T7L9V2a6nQxedX8z3MK7k+OVYJ8F+dRw0OicZgf6H
 kxb3RIdGEPT9c89qriM5e22Llg==
X-Google-Smtp-Source: ABdhPJz5c+RDfbgWGE7QUbqkRhWjS8L7ZtcQZMcqPPU6RnZIRW9DYio8vV6W9LSYjoLlRMd36gmeiA==
X-Received: by 2002:a17:902:e883:b0:161:8382:c9ea with SMTP id
 w3-20020a170902e88300b001618382c9eamr10149508plg.51.1652810877299; 
 Tue, 17 May 2022 11:07:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902bf4a00b0015e8d4eb26csm9331286pls.182.2022.05.17.11.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:07:56 -0700 (PDT)
Message-ID: <e157719a-f3d3-cf51-b3a1-e5a295bac39e@linaro.org>
Date: Tue, 17 May 2022 11:07:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/16] configure: do not define or use the CPP variable
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 5/17/22 02:26, Paolo Bonzini wrote:
> Just hardcode $(CC) -E, it should be enough.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                  | 3 ---
>   pc-bios/optionrom/Makefile | 2 +-
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   %.o: %.S
> -	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
> +	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")

Although I'm surprised we need to do this pipe thing. Surely just rely on the 
assembler-with-cpp rule built into the compiler driver.  Are we using a custom AS in this 
case?


r~

