Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955286A4D27
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl18-0001AP-2Z; Mon, 27 Feb 2023 16:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWl12-0000xu-SL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:26:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWl11-0002j0-2D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:26:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id l1so4633071wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tLKMIcKcMWiQTpA4ef5QaksT8hTcWMX/D4yVBn4AdNE=;
 b=BMoEi2ni0JKi1SsqSiVOnv5c+7qboFtZxsiqhX1HX9br4rrjQt4U7A2LN/gJIlqogk
 YN/jRfHrAsVe5EEZS54qNG+ttCrB1LFoSqqUxq8XvVkmBAfnQw+RKZrRAqSgCo8GJPXr
 f3uwvzTe9uB8lZDjuae7sx9trQ8wYFkhxyFzy8FcTuNtGRljvhyonDxdMhZrmk3DVt+y
 wEJBOvkRHxRGk77BCZfMerhoEiEr4/yCghMaSUdbKIRRARnABmuk+j4EotItpKQJFpKj
 6EqzmoNfdjkW5qVkeIQEPBsNmS6pZiMzeBRNXxw2+e6yTokjd82wXaL+QTAMXMNs5LuK
 +ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLKMIcKcMWiQTpA4ef5QaksT8hTcWMX/D4yVBn4AdNE=;
 b=zyOEMaw79X4MuYDjRHVtD4UF6+EaQpQd7AhtTgomwTf3QQqtGHcNRaTxfVPryjQA5v
 P0SdnA8fWtB2zQ9N3+AW+qNgIIJbIMcarKd0YYhKkUbropxmC+9R2bYixoXLEgyWnaam
 OquljfU+xMa9EQHRsBF0fBh/CJ0Q3mZUFQQS6z5wyONY1jOioNjksUzq/1zl7OP3zS21
 cYwyfYUOeSgfWwmr5A2ID3eloqR7T822NyZtR8jk9vm1Mz2psLdO0enxQ7JRpZrN3P9e
 ohN3HTnTTCxIsVKq14DWhHso5zgR/ZB55rztOwRzID9s/NvWkCEWYVaLeEm2BBmIzUwc
 RvDA==
X-Gm-Message-State: AO0yUKVLNIzhZNRxFY1lZ/XcbLEbF7eAOhKEFc8n69GTuqwVv9ElFDU+
 oDI/GlZsSecX/66s85L8xTvEhw==
X-Google-Smtp-Source: AK7set8LHknKtVJGZ/kCW6XLcwcpzs/n1SWLTUKNbKc8Dje+e41azrc0c+fMpTSSr0jQ9yfCJl6kQw==
X-Received: by 2002:adf:f542:0:b0:2c7:e5f:e0e0 with SMTP id
 j2-20020adff542000000b002c70e5fe0e0mr383212wrp.65.1677533192691; 
 Mon, 27 Feb 2023 13:26:32 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b002c5a07e940csm8077745wri.33.2023.02.27.13.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 13:26:32 -0800 (PST)
Message-ID: <34c91fd9-3826-8663-73f8-90357bf2a2f0@linaro.org>
Date: Mon, 27 Feb 2023 22:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RESEND PULL 000/126] Buildsys / QOM / QDev / UI patches for
 2023-02-27
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230227140213.35084-1-philmd@linaro.org>
 <CAFEAcA_ny6SumTx6CuFan3yCuP24TXjmyOBO95OeZam3Qw057w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_ny6SumTx6CuFan3yCuP24TXjmyOBO95OeZam3Qw057w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 19:22, Peter Maydell wrote:
> On Mon, 27 Feb 2023 at 14:08, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:

>> ----------------------------------------------------------------
>> - buildsys
>>    - Various header cleaned up (removing pointless headers)
>>    - Mark various files/code user/system specific
>>    - Make various objects target-independent
>>    - Remove tswapN() calls from dump.o
>>    - Suggest g_assert_not_reached() instead of assert(0)
>>
>> - qdev / qom
>>    - Replace various container_of() by QOM cast macros
>>    - Declare some QOM macros using OBJECT_DECLARE_TYPE()
>>    - Embed OHCI QOM child in SM501 chipset
>>
>> - hw (ISA & IDE)
>>    - add some documentation, improve function names
>>    - un-inline, open-code few functions
>>    - have ISA API accessing IRQ/DMA prefer ISABus over ISADevice
>>    - Demote IDE subsystem maintenance to "Odd Fixes"
>>
>> - ui: Improve Ctrl+Alt hint on Darwin Cocoa
> 
> Seems to have broken the TCG plugins somehow?
> 
> https://gitlab.com/pm215/qemu/-/jobs/3841174348
> 
> TEST munmap-pthread on aarch64
> **
> ERROR:../plugins/core.c:221:qemu_plugin_vcpu_init_hook: assertion
> failed: (success)
> 
> Similarly in
> https://gitlab.com/pm215/qemu/-/jobs/3841174344
> https://gitlab.com/pm215/qemu/-/jobs/3841174341

Sorry since this wasn't reliable, I first thought this was
pre-existing / unrelated to this patchset. But...

012add0d52621e34632ea24361a0c751bc2f5ad1 is the first bad commit
commit 012add0d52621e34632ea24361a0c751bc2f5ad1
Author: Philippe Mathieu-Daudé <philmd@linaro.org>
Date:   Tue Dec 6 16:06:00 2022 +0100

     cputlb: Restrict SavedIOTLB to system emulation

     Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
     case of reset") added the SavedIOTLB structure -- which is
     system emulation specific -- in the generic CPUState structure.

For some reason this was hard to bisect. The usual "make check-tcg"
rule wasn't coherent along bisection. Eventually I ended using
"ninja clean && ninja qemu-user && make check-tcg" which worked.

Could a .so rule be incomplete, so while qemu-user binary is rebuilt,
the plugin sharedlibs aren't?

Anyhow, short term I'll simply drop this commit from the pullreq.

