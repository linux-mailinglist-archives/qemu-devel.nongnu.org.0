Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE403390E3B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 04:16:47 +0200 (CEST)
Received: from localhost ([::1]:49170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llj6E-0003p0-GQ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 22:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj3Q-0001yQ-G3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:13:58 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj3L-0004wx-T3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:13:51 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f22so23352618pgb.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 19:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hz9GI3Gnp9AHLIcm+8gYP6jRKaif7ga7jKIIqrb7A6s=;
 b=Elaz2zmD5cbuRQ0jAN+oWmdK5WIVhuEZTf/50lcXZ11DjdW4m5EDsJFy2BK7uzZNat
 yq7Jg1fWAxbfff4OOkjOxz70ze0sy4ZxZWrFFHpK0unayGRZGf67KFPdORpwTOQ22q5M
 F1oqW2qFrFKyCb8Kp5CxnD/eQlnGE1cao3vD9xdR16kHbADLTr16VzKZ9v31Ic1pbQzn
 BZYAQFigoHNVN4gs2vj0GHt4VJb4QkSjcwVozdjaLUgcvN3m3BcNKV9p0DlC9PwV0quW
 xRb2wANPi18d51y5UWPm+4P9JO4GocEhRBLwD/SbizOvQvV+gIuWeiIVkfWWwvboVCIN
 PA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hz9GI3Gnp9AHLIcm+8gYP6jRKaif7ga7jKIIqrb7A6s=;
 b=JOY+WqcGOYxqDUXdgo1KfIgePYdaPAAZ0HW1WDN+KMKV2mT13vyYBCf6msiUkROsG1
 253Ge8Kk/MeoIs517Jm59hTr61Aok27M2k9Tfc1qQc7GCCmGq1jOwYkjOfQS7yY0SrVU
 ACbftQxN28AJ9HMVvpaLSo/CZFSSjAMzPOpJiTOgzR9irJK/Cz/140kAM9Z+WLtDParQ
 Ig0B2G+bFM329qceBwbgrYkUdj071jj9BN0tXznvxOrtY/koFyjqdyV0O38NXrWv1vS1
 lAPtMwERoogLxvtRpJJ7lHzs8hFvzijAVlfoIIPm6IVEAL6zTHbUEjzd7sVstXULfJiR
 ubcg==
X-Gm-Message-State: AOAM531vt+lR7lP2fHX07bhyTNanwXahVfxlgXbOluJ7idNZIVnxMVfE
 9pIzvIKifjA785U7eqg+DeqElA==
X-Google-Smtp-Source: ABdhPJwBaYADqXmDMltDge2UNP7W/GhJQiv/Z0tLwhJfoyQ6vK3yLDc3hMjppapBSVqc5CQXm5n+/Q==
X-Received: by 2002:a62:52d5:0:b029:2e9:1faa:20d1 with SMTP id
 g204-20020a6252d50000b02902e91faa20d1mr3457078pfb.39.1621995223347; 
 Tue, 25 May 2021 19:13:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 e23sm14829511pfl.84.2021.05.25.19.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:13:43 -0700 (PDT)
Subject: Re: [PATCH v7 04/23] cpu: Remove duplicated 'sysemu/hw_accel.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b3584bb-f508-b38c-b208-a7d5ea575149@linaro.org>
Date: Tue, 25 May 2021 19:13:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/core/cpu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

