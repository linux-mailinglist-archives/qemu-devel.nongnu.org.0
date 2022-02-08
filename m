Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CF34AE4D7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:44:04 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZDP-0004KN-CZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZA3-00028Z-58
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:40:36 -0500
Received: from [2607:f8b0:4864:20::1034] (port=51048
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZ9t-0005G1-Iv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:40:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id m7so541679pjk.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6mbg6e7Zrqm4PimsuDOR0r+BZ2KPg6e4sWPeht0J1fA=;
 b=Fw58h7SofpdC4U23pwCwXUVXYBX0OtDBNyYXIksp82jJkUBraUBbj1uopC//wm46Uh
 WaFjYMVd/xpsZUfgFMY346A4sbwqt610QtEBTHJ+bwlDzY+XMsZRHXUax8gkG7ZTp18x
 xY1my5X9yvl+Qbom3KvPU2cgz38XAOoDnD+3hB/c55u7E7/acamP5u7LesXgkrbdiPaP
 HM9dAfPRRRK21jG7bq8c9g12J3QW+fzSVQIpO4eLIILh95qm8x9zV59GykzIixPePDCN
 vD9ABiD3WSIKKVrQKZBeMl1SCntc6/XwV//JQ4ME5gnr69D9ow5SycvF0ge9LvyWlU7i
 NcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6mbg6e7Zrqm4PimsuDOR0r+BZ2KPg6e4sWPeht0J1fA=;
 b=Gncv03R5L5LyLyHG61jzY3p1zrF+P3hRQ/1b/cnDJAprZP/Dfo4cl+izGRQYNtcqDR
 kUoO/LHrrpn2vEvqUEd2fF/70LeXhg0jbmWDRyY3PC6Vy7JDtp9535sC8joONF2u5M4j
 CX43PL1gUoV+GX+nBlck6sQky9poVzL4Ti0HNwQg7OB41jXzjOqw+9xKttIGUvI7smrF
 GpEwoxGQ/unR+g+2DTb44+rrM5TGFSIaMUzwuJrYR3BXCaoEY860xzm/NpulJ/zEiVeU
 gh/n3VVux9eTelon8C4ABptb73rUzWXuEIRjFQdu93hQChF6+/ZnGD/XMAZ77kMRicOx
 9txQ==
X-Gm-Message-State: AOAM5328XCti8bNBGVi/l3pt8Zv40nm6EBrb3RQgY6MY/AZ/5lNOtzha
 FHnLN/R/DihSXqvNUKJqhzraSA==
X-Google-Smtp-Source: ABdhPJycQD1tMWKjUrn+TD/yYlL5rU0REPWmXEV9ax8W7BR8JgZGCZyS1D+vBVCLhOgWYpJfsrHw1A==
X-Received: by 2002:a17:902:a508:: with SMTP id
 s8mr6647865plq.173.1644360022987; 
 Tue, 08 Feb 2022 14:40:22 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id z13sm17457827pfj.23.2022.02.08.14.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:40:22 -0800 (PST)
Message-ID: <514ac4e3-73f7-4bed-29cd-390dd75d1901@linaro.org>
Date: Wed, 9 Feb 2022 09:40:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/13] target: Use CPUArchState as interface to
 target-specific CPU state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> While CPUState is our interface with generic code, CPUArchState is
> our interface with target-specific code. Use CPUArchState as an
> abstract type, defined by each target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/poison.h   | 2 --
>   include/hw/core/cpu.h   | 2 +-
>   include/qemu/typedefs.h | 1 +
>   target/alpha/cpu.h      | 6 ++----
>   target/arm/cpu.h        | 2 +-
>   target/avr/cpu.h        | 6 ++----
>   target/cris/cpu.h       | 2 +-
>   target/hexagon/cpu.h    | 5 ++---
>   target/hppa/cpu.h       | 6 ++----
>   target/i386/cpu.h       | 2 +-
>   target/m68k/cpu.h       | 2 +-
>   target/microblaze/cpu.h | 4 ++--
>   target/mips/cpu.h       | 5 ++---
>   target/nios2/cpu.h      | 4 ++--
>   target/openrisc/cpu.h   | 2 +-
>   target/ppc/cpu-qom.h    | 2 +-
>   target/ppc/cpu.h        | 3 +--
>   target/riscv/cpu.h      | 4 ++--
>   target/rx/cpu-qom.h     | 2 --
>   target/rx/cpu.h         | 2 +-
>   target/s390x/cpu-qom.h  | 2 +-
>   target/s390x/cpu.h      | 2 +-
>   target/sh4/cpu.h        | 2 +-
>   target/sparc/cpu.h      | 4 ++--
>   target/tricore/cpu.h    | 5 ++---
>   target/xtensa/cpu.h     | 6 +++---
>   26 files changed, 36 insertions(+), 49 deletions(-)

Nice.

It's tempting to purge CPUFooState entirely, which would eliminate e.g. patch 8, and put 
the onus on having cpu.h (and thus the actual definition of CPUArchState) in scope to the 
C file that includes those headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

