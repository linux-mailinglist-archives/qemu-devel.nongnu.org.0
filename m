Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C74A5222
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 23:11:45 +0100 (CET)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEetj-0003Ab-4F
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 17:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEepg-00005m-UZ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:07:32 -0500
Received: from [2607:f8b0:4864:20::435] (port=43954
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEepb-0005B4-U0
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:07:30 -0500
Received: by mail-pf1-x435.google.com with SMTP id d187so14065934pfa.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d/Pu5BWTLEJS5SSCRlUKwywev47dQuhxfQqpnjgvm8M=;
 b=xLtVIH6v13d88Lz/toYGqtFUyAEp7dFypfG+MI5jAohFYJ8LJ7K+praIxeR0/dKDTa
 3VC0R8F4023J4pIyT1HK7K2AwzvxqOsR5i/xladF6jqI5mUSTG04bQAMqFBR2iK/K+o3
 g+PH3N8OHg3DC3wH8pQQPu19siuTJ2YqKXC3g4PKsxlc5EwV0Rm5WjLr6Vq8tOLMl8+x
 QZwB/FfYcktSKv/zoG1QdauYi6MgS7nIwqM9YZupYhdaHRb4XdfascI/2ZT4WDZ4SbWV
 ePi/eLfrT47mDQaA+K82uOz56T9pO41szzIuUqun9da3Q5b9q/p/WdVrN+qMVM/3zPWz
 oo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d/Pu5BWTLEJS5SSCRlUKwywev47dQuhxfQqpnjgvm8M=;
 b=W9FycF5foSajYSMlc61Ob6D8mMWlZ+HaIyqlGUkm2Y+LSrErRlLqGauiGlhLmY74+C
 To+YHm5Kpb8tHNBTbblH5a4/JgERqf3WKGYFYfNpq5e5p23TBJC3LA7ymJwVjwpwDC9Z
 CFtGh/pQpeV0To2xcEG3Vbm4X5XdDSRZ48N+MaqDss6ulB/WXjvW0U2Ssz+8MSh+4mFz
 9vUXSytTqdzrjPMd7uAyJIGhmrITbFkANPAXJUGsTrmlBqRY0rb3MLPtZiTHJvIlcbFs
 G4jzTg5DzZWZbuL8AFxkOWn4WXyEpAqcMVP4iwmNIKF6xA9nbMZQ5NfE1sEa8+i/0GSx
 L47A==
X-Gm-Message-State: AOAM530cclEsRqc0IB1jy7vCikvEdGaw5GeJNs+AEuv0EZJo1b2Q633v
 8XciNhysACTpHTr9kU+qkLIhaA==
X-Google-Smtp-Source: ABdhPJxFbZmVa5rwdC5m2ou+fCS0uD7DTds3mqzge9jIPcM7zgn5cF70zK+wI47vEhOCntTq4/K7cg==
X-Received: by 2002:a05:6a00:1914:: with SMTP id
 y20mr22233397pfi.39.1643666779499; 
 Mon, 31 Jan 2022 14:06:19 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id x18sm18777506pfc.123.2022.01.31.14.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 14:06:19 -0800 (PST)
Message-ID: <85d3ed39-76df-2ebb-d1d9-65e426302c06@linaro.org>
Date: Tue, 1 Feb 2022 09:06:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/6] hppa: Add support for an emulated TOC/NMI button.
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220131213529.17404-1-deller@gmx.de>
 <20220131213529.17404-4-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220131213529.17404-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 08:35, Helge Deller wrote:
> Almost all PA-RISC machines have either a button that is labeled with 'TOC' or
> a BMC/GSP function to trigger a TOC.  TOC is a non-maskable interrupt that is
> sent to the processor.  This can be used for diagnostic purposes like obtaining
> a stack trace/register dump or to enter KDB/KGDB in Linux.
> 
> This patch adds support for such an emulated TOC button.
> 
> It wires up the qemu monitor "nmi" command to trigger a TOC.  For that it
> provides the hppa_nmi function which is assigned to the nmi_monitor_handler
> function pointer.  When called it raises the EXCP_TOC hardware interrupt in the
> hppa_cpu_do_interrupt() function.  The interrupt function then calls the
> architecturally defined TOC function in SeaBIOS-hppa firmware (at fixed address
> 0xf0000000).
> 
> According to the PA-RISC PDC specification, the SeaBIOS firmware then writes
> the CPU registers into PIM (processor internal memmory) for later analysis.  In
> order to write all registers it needs to know the contents of the CPU "shadow
> registers" and the IASQ- and IAOQ-back values. The IAOQ/IASQ values are
> provided by qemu in shadow registers when entering the SeaBIOS TOC function.
> This patch adds a new aritificial opcode "getshadowregs" (0xfffdead2) which
> restores the original values of the shadow registers. With this opcode SeaBIOS
> can store those registers as well into PIM before calling an OS-provided TOC
> handler.
> 
> To trigger a TOC, switch to the qemu monitor with Ctrl-A C, and type in the
> command "nmi".  After the TOC started the OS-debugger, exit the qemu monitor
> with Ctrl-A C.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/machine.c        | 35 ++++++++++++++++++++++++++++++++++-
>   target/hppa/cpu.c        |  2 +-
>   target/hppa/cpu.h        |  5 +++++
>   target/hppa/helper.h     |  1 +
>   target/hppa/insns.decode |  1 +
>   target/hppa/int_helper.c | 19 ++++++++++++++++++-
>   target/hppa/op_helper.c  |  7 ++++++-
>   target/hppa/translate.c  | 10 ++++++++++
>   8 files changed, 76 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

