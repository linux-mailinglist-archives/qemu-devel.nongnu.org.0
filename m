Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C143AE70
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:59:06 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIIS-00032I-Lq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfIGL-0001N2-D0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:56:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfIGI-0000cd-I1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:56:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so723903wms.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QlLlVsmcc4c4SdFKE5AxrSsAiN5EnYeE4Z0Mb4ccpb4=;
 b=T+Ljy58xr/IDK5susLF+Pvl5xF7hu3jSqkAI4zhxzq5vyPIJ7oozEg8xfKIJKGcKgi
 priuLhyINEOCzh/0ZKmhy7v8wa59NnVsV/mjLwmgG8rWGYFonJjW7JukbSKbPiqhc+SW
 anrNh7IxLNU7uVATO+fBir1/SLciffWdRNs7Yjv8/9PxLuY+qWkwsMmV7QxWdwxVlkrG
 iZsLXzRYLxsKLqScxju3s7hMcAbg189+2iUr121cCBp7ytqbyh3gxWEtDKy6wgGUkbVu
 NW9cudfwAE7jKVnJWf2sqWF1svhssRxhVgyWidxJYTevVGUnxMSQ4cNvjgTiQfKM+gB8
 rLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QlLlVsmcc4c4SdFKE5AxrSsAiN5EnYeE4Z0Mb4ccpb4=;
 b=Ymorvsiiue0WtJ+hLu9wDKPWmJduiz2NsXTiqLgsN7E8DJN7QWIcLAMTeN0SRPAEgr
 9gJfanZjrUaOXY68Cr3huWeHUo686yk9EJH+JfnitQ4pgrDYQ3/u6h1vauijHNtXp+gN
 7/F/55bHeccq3cGQHeB4RFrFMu6UPBPn69AB42OEFrhmMtwXNedgitdPtuKW+XTbX1wa
 4dVzZNVZYGlTZqLMEfPhe/nThfUKxdcca31SToKmaRxKvUjuAypeMplsmvuTnl55VAIC
 kxluCTdulk59qrIXCZlWq+atzk0KprHEpUdI6/EjpkeUhRFWF2aktiEPXx9t6ZSVM9a9
 agSg==
X-Gm-Message-State: AOAM530kKrQ30TyZmtPGj2xWucJkk5GF3bneQ7crvwtpTZ59knV9UERW
 /kuZBWsVGqegVD3Qjr8Z23s=
X-Google-Smtp-Source: ABdhPJwX74pWCI5fcdrvkmnfoIs7Guix6Zf+ebis2iU2+PjdPIkUUv7w4qeks3E9z3XssDrMbXhjjg==
X-Received: by 2002:a1c:ed0c:: with SMTP id l12mr15336319wmh.68.1635238608859; 
 Tue, 26 Oct 2021 01:56:48 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c7sm15326220wrp.51.2021.10.26.01.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:56:48 -0700 (PDT)
Message-ID: <d70b34c0-c228-c1f0-be52-01dd90d57f54@amsat.org>
Date: Tue, 26 Oct 2021 10:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hvf: arm: Ignore cache operations on MMIO
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
References: <20211025191349.52992-1-agraf@csgraf.de>
 <f17a2693-0c1a-d41e-5218-1117d2636425@linaro.org>
 <1d84fe5e-1933-8798-ff42-e752ea4e5943@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1d84fe5e-1933-8798-ff42-e752ea4e5943@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kettenis@openbsd.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 09:09, Alexander Graf wrote:
> On 26.10.21 02:14, Richard Henderson wrote:
>> On 10/25/21 12:13 PM, Alexander Graf wrote:

>>> @@ -1156,6 +1183,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>>> hvf_exit->exception.physical_address, isv,
>>>                                iswrite, s1ptw, len, srt);
>>>   +        if (!isv) {
>>> +            g_assert(hvf_emulate_insn(cpu));
>>> +            advance_pc = true;
>>> +            break;
>>> +        }
>>>           assert(isv);
>>
>> Ouch.  HVF really passes along an invalid syndrome?  I was expecting
>> that you'd be able to avoid all of the instruction parsing and check
>> syndrome.cm (bit 8) for a cache management instruction.
> 
> 
> That's a very subtle way of telling me I'm stupid :). Thanks for the
> catch! Using the CM bit is obviously way better. Let me build v2.

Having given my R-b I take half of the blame.

