Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0D311226
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:19:54 +0100 (CET)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87a5-0001Ft-Vw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87Yv-0000QQ-J6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:18:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87Yt-0005Qv-EX
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:18:41 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l18so4451922pji.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 12:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JjQYE10fEWawE5x5wsUTI7MTkCUSspOqR1vG4k6K1po=;
 b=rI9nX/rRMrVElYNpfDgxcTML4gV6XeXFYTJogH6NOTD1fhFln6+yi1s5+hkepB4g/W
 n+mm04KQKfm6wMuhKWzHjMir+8+mOW0M/TzcIc7PmA921+bu+VRhrPqlmb1bnLL73Rlk
 2DNUwyd2yqJeFzvZuwjDZd6bYT2++Al2kE9K4Gp9NfV3S76KL+H8Sc3fzinezLyEt54U
 uZX5ymxpSaM93pWJ4Etuu6EUTXF3fexxsqi/CncNwnYsHOSv8HcCkMu/VrwhJ3p0k9Qc
 U003Rt02QsKpNLRMNRtgQYldc9EOnmYAVaOyDP8qqRBi9/DSu9WpOI0xrQxymirIj+7P
 8aDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjQYE10fEWawE5x5wsUTI7MTkCUSspOqR1vG4k6K1po=;
 b=GFeSU3ghof4Ocfv4WJG0sYwYaXasRkvSdONCHxWYJWfRRs/gUrAFNOnIcTzrWwMvuO
 AbgBlkNnpsbiflkaE5JF8WZD/ul/GgcHHLMYCLe4xDDl+k7AkNMIiNSo0X9ISVgOI+5F
 8G/6b/dog32d+q2EnzQX0BzhXGtcvLKKKHsc068mZCQWL55HcBGyaejpHgZmqH8OKzKc
 XBl1olDy6fgV7uzoqqSNqCw9tHIqEYQF/wgFtZ1yVvAnU4U/T/dN1Uu6brqHj4rVzkbi
 Rama+kPkzHqVhGa8XlH3VvnURy1vgpsq+ynvbaK3g5eyGvx9N0A1Y/Wum8ZUU18qQd4y
 8NfA==
X-Gm-Message-State: AOAM530gjE87hPib2lfbUf9Yr///U44uY0qCUe8VgsyK0dSs+gigzpZb
 R9EKu+JSuiy85gORtgjj524l724N5Vn2eKUs
X-Google-Smtp-Source: ABdhPJxA/WgUasOyM3+Bf8Em4AlCnKkS7d+1aVMPq24ARfv3/70DZ/vXqkkXL1Rg8zND3mV4FjyiBw==
X-Received: by 2002:a17:90a:4607:: with SMTP id
 w7mr5512070pjg.148.1612556318078; 
 Fri, 05 Feb 2021 12:18:38 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id dw23sm9607639pjb.3.2021.02.05.12.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 12:18:37 -0800 (PST)
Subject: Re: [PATCH v16 00/23] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f3f1f43-326a-4e74-775d-c4be1796fb75@linaro.org>
Date: Fri, 5 Feb 2021 10:18:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:39 AM, Claudio Fontana wrote:
> Claudio Fontana (18):
>   target/riscv: remove CONFIG_TCG, as it is always TCG
>   accel/tcg: split TCG-only code from cpu_exec_realizefn
>   target/arm: do not use cc->do_interrupt for KVM directly
>   cpu: move cc->do_interrupt to tcg_ops
>   cpu: move cc->transaction_failed to tcg_ops
>   cpu: move do_unaligned_access to tcg_ops
>   physmem: make watchpoint checking code TCG-only
>   cpu: move adjust_watchpoint_address to tcg_ops
>   cpu: move debug_check_watchpoint to tcg_ops
>   cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
>   accel: extend AccelState and AccelClass to user-mode
>   accel: replace struct CpusAccel with AccelOpsClass
>   accel: introduce AccelCPUClass extending CPUClass
>   i386: split cpu accelerators from cpu.c, using AccelCPUClass
>   cpu: call AccelCPUClass::cpu_realizefn in cpu_exec_realizefn
>   accel: introduce new accessor functions
>   target/i386: fix host_cpu_adjust_phys_bits error handling
>   accel-cpu: make cpu_realizefn return a bool
> 
> Eduardo Habkost (5):
>   cpu: Introduce TCGCpuOperations struct
>   cpu: Move synchronize_from_tb() to tcg_ops
>   cpu: Move cpu_exec_* to tcg_ops
>   cpu: Move tlb_fill to tcg_ops
>   cpu: Move debug_excp_handler to tcg_ops

Queuing patches 1-18 to tcg-next.


r~

