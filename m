Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307142E519
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 02:13:38 +0200 (CEST)
Received: from localhost ([::1]:58582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAqu-000646-U6
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 20:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbApb-0004q2-Tb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:12:16 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbApY-0004IF-CL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 20:12:15 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso8113970pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=emZ91eNMbiHU01BxNe6m833qwiK/ugXPlr6TVeMQsNg=;
 b=rmGIBKYMfflKIIPyZ5VpQYIaRCk5X3t8q98w3gs5VzpZ7m5vlEilPfaA8eOUvNq1qJ
 +PgDYFFwFRw5ahlnKO54gpf9vxxTcsAEJb+p5eBifzvKwhilavPD1qDQ7I3KtdwNxYwe
 DaAFKmxpG0IytaEJeeFvbKpVBD0uOGHl9TJPX/3oIdao8qKJq2fKCfZGgDOjXungJUMf
 b/Epqovrry+x8SrFnh3kYP3Pl79JXO8kT1MfADUBHOTfdWmozvRp50wExt1IWH47ugAY
 DaJRELUzq6hHJ6YmvkMcUVSOjy+cMQFZeMTfo2iquTpTzCBmsEsprq7dcfsoXlw7GWTc
 FxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emZ91eNMbiHU01BxNe6m833qwiK/ugXPlr6TVeMQsNg=;
 b=aEeN6FBERidh7awYTH9p6e26E39IEyiswhLqZYriylQN2CMjpY+bFj/Hl2CuUDAjf3
 X1XaLUe7DDl1LazZY+VtN9aBZ9EwHLoVLBgXpggIIoht5tFOwqCRnjDBHxwaL3cbUJWS
 Auq5S2N623YmL1tOVQ8ei5Dft6o6OCn7mifJEkqWrDRrCdd0KndhqLpDbjP/wJaKfAiU
 a4RjsRN3nEGz3BrXnoXHrPKQS9ytvH83tv+HiDG6Q0nBVXCfBdqB89Tf0AgdhtX2tdiG
 m+ybmKIQNmQG4JMp67A0bqYj+isPLhRpeU7OzX+WxQkutE5BPDg1afoqkH8ReIoJPW3T
 Qclg==
X-Gm-Message-State: AOAM533KORpdkx3w72F+HwtXfZj0s1COgXgKa+kmcIT3ALoH+2S2wp0f
 IOh6G1vbr5ZUlirxRtnPgkfW4A==
X-Google-Smtp-Source: ABdhPJzFTm9XFRdz60CGy20hXhSs+lcwxLzjjWAK1pMsYIasOp6s9vfDPH3fWdu33xjPdT5oPnbQHQ==
X-Received: by 2002:a17:90a:190:: with SMTP id
 16mr9850542pjc.152.1634256730499; 
 Thu, 14 Oct 2021 17:12:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id bp19sm3371647pjb.46.2021.10.14.17.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:12:10 -0700 (PDT)
Subject: Re: [PATCH v2] Partially revert "build: -no-pie is no functional
 linker flag"
To: Michael Roth <michael.roth@amd.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 qemu-devel@nongnu.org
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
 <20210805192545.38279-1-jrtc27@jrtc27.com>
 <163425424356.2158.16851994446465453609@amd.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c3e7913-3a4e-fe78-fd88-ba550e119ddb@linaro.org>
Date: Thu, 14 Oct 2021 17:12:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163425424356.2158.16851994446465453609@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 4:30 PM, Michael Roth wrote:
> Quoting Jessica Clarke (2021-08-05 14:25:45)
>> This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.
>>
>> This commit was misguided and broke using --disable-pie on any distro
>> that enables PIE by default in their compiler driver, including Debian
>> and its derivatives. Whilst -no-pie is not a linker flag, it is a
>> compiler driver flag that ensures -pie is not automatically passed by it
>> to the linker. Without it, all compile_prog checks will fail as any code
>> built with the explicit -fno-pie will fail to link with the implicit
>> default -pie due to trying to use position-dependent relocations. The
>> only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
>> the linker itself in pc-bios/optionrom/Makefile.
>>
>> Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
>> since the only previous use was the one that should not have existed. I
>> have also updated the comment for the -fno-pie and -no-pie checks to
>> reflect what they're actually needed for.
>>
>> Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
>> Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> 
> Ping. --disable-pie builds are broken on Ubuntu 20.04 without this regression
> fix. Looking to include it for v6.0.1/v6.1.1.

Sorry, missed this the first time around.

I think a better fix is to remove the direct invocation of ld in 
pc-bios/optionrom/Makefile, and instead rely on the compiler driver.  All of the local 
ldflags can be passed through via -Wl, but we'd get no-pie via CFLAGS_NOPIE.


r~

