Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EE4D8BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:54:24 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTppo-0001HE-1v
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:54:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTpoM-0000a0-E6
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:52:54 -0400
Received: from [2607:f8b0:4864:20::631] (port=37710
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTpoK-0003OG-Gn
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:52:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id n2so14344050plf.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S8/U/FeHu+CRmtYgxVsXy+Hqflc1kCWVQvdhh2RC9MQ=;
 b=V5+DWoaT+ltEkEMLxkQ6qxtNoXzr8du7QDY9mRVWCvcbhqHax026kntVywaPimF5tJ
 rjcw8V1hjbF1ZiMo1JCIoZyKtxEzGixTV/H+XoUI2RFe9ihqaG8uXp3eWTr9NbZljGfV
 PedxBqTPax7YIgsOjUsoTl9pV8KO8iNOFaLfekNFRlj9jgVtAsfWShFTG9wwzG0UU6xE
 kWPwSdm1Arg3arwD5wcSPYKh23f6r0wHIxnQXOhVtDzAgoM6zLnynjNcadzgxDUSEI+v
 Z8a7D2TjiUZWzUOBBm0Fg7rEz3JyZTnvk1wRaaLpC9SoQFft0omljmSZOBJtTSDmS4N4
 nifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S8/U/FeHu+CRmtYgxVsXy+Hqflc1kCWVQvdhh2RC9MQ=;
 b=Y40VgOGIkVfyeP4EX0RD5Kc5DP713vdFkPmjfvHIN6jVApBSWTL4ZNacoctY+ZaFbw
 SOtlSx1J1HTgvyFXVHGXikQ6ou5WmLY+CpeQHWa0qwUU6nNmebwTGVZNiUOIr+xZXn93
 AhwG2NtGCTBckgwHd/LyGUd35Q05kBz7LO/SDXZhSV2o2XxcpKZbHdGhqFpnGn5zG+dF
 By+E8aV6oTB5KoqTbQIMSqLurz6UPQf/gjkjUuVMGCZdbP8b5vmAVR83021IXuda3MVz
 CrwtjTehQKQ4JeTpQlCAMpIDVT5k72S+NBWZLDr9jI/AVk4G381qV/zq+aiebm8JYknF
 aXLQ==
X-Gm-Message-State: AOAM5311O3Fc2kx5LUosBCZ6vUg8DEzjeDP7p/sjMFAGZclfXwdkeHw9
 eg74kNYzJbKx6nT1RfBYEHukgA==
X-Google-Smtp-Source: ABdhPJzNFmWd/TlFp27bMs9CDPZAc9FytqmOA5c21Az8+cREVjqO4qkfA0g7+NwYBz7zthjX54QVVA==
X-Received: by 2002:a17:90a:c984:b0:1bf:aee2:3503 with SMTP id
 w4-20020a17090ac98400b001bfaee23503mr651198pjt.28.1647283970940; 
 Mon, 14 Mar 2022 11:52:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a637a47000000b003803fbcc005sm17579044pgn.59.2022.03.14.11.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 11:52:50 -0700 (PDT)
Message-ID: <304dcefe-de5a-5955-aef2-5ac6f14679f1@linaro.org>
Date: Mon, 14 Mar 2022 11:52:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc: Include asm/ptrace.h for pt_regs struct definition
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Khem Raj <raj.khem@gmail.com>
References: <20220314170223.554679-1-raj.khem@gmail.com>
 <CAFEAcA_SCwN3LpdADuYs7gTqgravOqDan-D6BrcAW_tb0omP8g@mail.gmail.com>
 <CAMKF1sqRQOnHVUcM3MUnTtLQ0W3Xyr3DUKfbsXb82bjYv6v+Aw@mail.gmail.com>
 <CAFEAcA87zZ8JoSk-1b6R8DYs255BzjNeP=HVbFEAs8yXByhQ6w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA87zZ8JoSk-1b6R8DYs255BzjNeP=HVbFEAs8yXByhQ6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 11:06, Peter Maydell wrote:
>> I have a custom distro building with Yocto which is using musl C
>> library instead of glibc.
> 
> Ah, musl. I found this gcc mailing list post from one of the musl
> upstream developers:
> https://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg281012.html
> 
> where he suggests a different approach involving uc_regs->gregs[32]
> for ppc32 and uc_mcontext.gp_regs[32] for ppc64.
> 
> Richard: any opinion on that idea ?
Reasonable.  I would also remove the indirection between 
linux-user/include/host/ppc64/host-signal.h to linux-user/include/host/ppc/host-signal.h.

We don't support ppc32 anymore -- there are afaik no current distros supporting ppc32 with 
which we could even test.


r~

