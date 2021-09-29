Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5041CA38
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:36:23 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcZB-00079d-6H
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcT7-0000XI-Br; Wed, 29 Sep 2021 12:30:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVcT4-0003eC-El; Wed, 29 Sep 2021 12:30:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id x20so5264188wrg.10;
 Wed, 29 Sep 2021 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIL2fzsmyD973C3LK1fCqDkEUFPat/dEOaChN1UH7jk=;
 b=WolWiv42bMY/oHLejn4em0YDf8/c6hwLWre46b16soX2Oc3kXytF8SbAfqowDDgOF5
 ju7ucfWUUBpKx+1ircpHkIt9oAr95pTq5CRMv1ip1Ew+AYQIbNkQXVwr86XR9SKDCcgy
 0hzHcEFGX2R8U2JuXlMJUuJtbjSa582rXP4bnUtLeigHiU8kzl6TRZmECUkE9kosh4Wp
 wQeD4BS9PIKxbhMLxODJbU6FnKRok/AvVrneUDMW7o6KqPUj/7YPaJU7GpXEeos1aRY3
 Ff136iGJ+PtaPYLi218B2mYlM/AfrNA68jnsrDPnvYqu08qYlF5GwNhhHawE5HXFs9Zf
 vAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIL2fzsmyD973C3LK1fCqDkEUFPat/dEOaChN1UH7jk=;
 b=X/DdWCuKR85Q+JDpbjn75JzpySai08znyhMI91BEQrfHuCxsAjGbnXMF+pIlPIpVva
 wTQOcV/yXYGJMZwV1xk8kriYkXJHrazxtUujHPjMQdg4tr+jM5Q7fq0ApFicwqQBfUwW
 ZZgWGegwExOxsLi2ryxTBVJX6gKSJA6+/2v8DTThJnZVctDZ13uYq+tQ6T76YOxi3vH8
 jIkF0kjfY+jr1gtv+uToVM0fu7Js+pv1+GFueZdvhxVDd4Rr43yr7cLGgipoeHD/G+Jv
 cSi+Xb4yq6ZcwRfyZO6UyVdqhQ7yR+WjDtb4KJE0zvDOv2QOQbCPauik4n/XDdO0z+/I
 UdDg==
X-Gm-Message-State: AOAM533dl3ezWhx8rxkOKMbbmubZJSY+QslbLF0QRvWs3zGQiLU2x5Ul
 33DGMvM4M0iUomJgIUsv+iI=
X-Google-Smtp-Source: ABdhPJyr2JDd3KWc00tPxqANAMzR6P2py5oRDv9PVX0RQORnHl9S/wpl3amXphivDc6lWRKFMB8stw==
X-Received: by 2002:a5d:6d02:: with SMTP id e2mr994900wrq.198.1632933000633;
 Wed, 29 Sep 2021 09:30:00 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d2sm360747wrc.32.2021.09.29.09.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 09:30:00 -0700 (PDT)
Message-ID: <63229ef1-6f77-8aa4-89a7-7759140a60db@amsat.org>
Date: Wed, 29 Sep 2021 18:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
References: <20210902152243.386118-1-f4bug@amsat.org>
 <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
 <f3e89488-0d05-657a-34f7-060a7250517d@amsat.org>
 <f9e3c54f-a7cb-a043-f7fd-9d9d0dd61c16@vivier.eu>
 <6fa5f79c-8d3b-9534-26d6-ebe1ba937491@vivier.eu>
 <01ea5ea0-a61c-7bea-e1a6-639e3b9a2988@amsat.org>
 <93245807-dfa9-be11-ccda-4601b09b204e@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <93245807-dfa9-be11-ccda-4601b09b204e@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Kamil Rytarowski <kamil@netbsd.org>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 18:23, Laurent Vivier wrote:
> Le 29/09/2021 à 18:06, Philippe Mathieu-Daudé a écrit :
>> On 9/29/21 17:16, Laurent Vivier wrote:
>>> Le 29/09/2021 à 17:00, Laurent Vivier a écrit :
>>>> Le 29/09/2021 à 16:08, Philippe Mathieu-Daudé a écrit :
>>>>> On 9/16/21 00:05, Paolo Bonzini wrote:
>>>>>> On 02/09/21 17:22, Philippe Mathieu-Daudé wrote:
>>>>>>> Instead of including a sysemu-specific header in "cpu.h"
>>>>>>> (which is shared with user-mode emulations), include it
>>>>>>> locally when required.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>> ---
>>>>>>
>>>>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>>
>>>>> Thank you, Cc'ing qemu-trivial@ :)
>>>>>
>>>>
>>>> Applied to my trivial-patches branch.
>>>>
>>>
>>> We have a problem:
>>>
>>> .../target/i386/tcg/sysemu/seg_helper.c:145:9: error: implicit declaration of function
>>> 'apic_poll_irq' [-Werror=implicit-function-declaration]
>>>   145 |         apic_poll_irq(cpu->apic_state);
>>>       |         ^~~~~~~~~~~~~
>>> .../target/i386/tcg/sysemu/seg_helper.c:145:9: error: nested extern declaration of 'apic_poll_irq'
>>> [-Werror=nested-externs]
>>
>> Hmm I'll check what changed since I sent that. It was working the day
>> Paolo Acked, because have the patch rebased / tested on top of commit
>> c99e34e537f ("Merge remote-tracking branch
>> 'remotes/vivier2/tags/linux-user-for-6.2-pull-request' into staging").
>>
>> I should have rebased/retested today before Cc'ing you, sorry.
>>
> 
> On top of c99e34e537f I have the same error...

The problem is 0792e6c88d4 ("target/i386: Move
x86_cpu_exec_interrupt() under sysemu/ folder").

