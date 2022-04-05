Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BBB4F3D55
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 21:22:33 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbol6-00026X-6C
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 15:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nboho-0008Ea-HK
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 15:19:12 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:36126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbohl-0005E6-5B
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 15:19:07 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-df22f50e0cso458726fac.3
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LlHFSGsCx3uaNI1Et0co1h/Ncej6B2P7Uj2emuDmtRg=;
 b=ZrxjFwBioE0X5hsbsshJQXThGgjXQ2lFFy+ZDDujNWHNGy3ndPa/hHXh70Fg9665xD
 JCtRa0u43fdISsvJhFGUIqzk1te4wNOgXgPfkZ4U4QfYcuTM6KmP7TWHsQ0KDtA3SOI2
 CgWSlYUJM2gt+0apGtsMhBvz9+UzUTK+MWZu9alJ/eH3Y0ZJsxm+biennzXD1FtZrRuX
 sjF2Ki3heDy2vKHbVthq8BursppdiPzAFq+IDuJcRErYV8K8Mntankkj78rdWOfBDbyL
 E9lumdhs9pJzdLoA4oYqLd7BE8HcUA9U0cBDWI6JARB1j1olVI2wu9TBd7JX40umJ1DQ
 HaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlHFSGsCx3uaNI1Et0co1h/Ncej6B2P7Uj2emuDmtRg=;
 b=V4zWiMM4yGxfw3hS+STNfhNz4rG2d09nQiIBiOmsiDnaWRXOmllWddFEaGt4GKNkWj
 dBxwMF3W9hGrI16rSKxT4yAOZV9EZNavbDcx4Qf0BabgTGN63J6TsXYHPYgf3r0jEHwk
 t7yDDc8Nd3V2WcLOoc/bVJw4BbvED2VRyyirMzIEmXmqLjsYaVBWnqxvfPCTSoO7egsq
 3tPSq4LRTxcwvdbhvVTk4p+6G51isiTcVprvToR0+gCBiVxm4AlrwpGn0KCL5VrymKkq
 9CEFSfsQsuCRA7M3XskfsOiDAQdsL6b3v1sFfms8Mxhwy3NMCdbVmnMjMjdjPE5pPcOR
 8BtA==
X-Gm-Message-State: AOAM531wa98/Oh/GTvMLNiIbj81j0daCLhbYUq7E9mEqSv4D8nyF9QXp
 EmK+MUKKpqJ4GmfwA4Qfocw=
X-Google-Smtp-Source: ABdhPJwWo0nuM4g0B9QzGhHU4bQ0sInenmvKSJcwTsGiA+MVD5HYGVtcvRdrO81IpCSNci90ZfUGIA==
X-Received: by 2002:a05:6870:a901:b0:da:cf13:4023 with SMTP id
 eq1-20020a056870a90100b000dacf134023mr2214998oab.90.1649186342672; 
 Tue, 05 Apr 2022 12:19:02 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a056808090100b002da82caced5sm5614285oih.3.2022.04.05.12.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 12:19:02 -0700 (PDT)
Message-ID: <e39b819c-76f1-07d8-cd5f-69c08a8c95b6@gmail.com>
Date: Tue, 5 Apr 2022 16:18:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/1] kvm-all.c: hint Valgrind that kvm_get_one_reg()
 inits memory
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220405130439.44253-1-danielhb413@gmail.com>
 <20220405130439.44253-2-danielhb413@gmail.com>
 <CAFEAcA-YkrrhFsGg0eWdQgU_VR4cSX5tLnHYCk8tK77cb-9Grg@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA-YkrrhFsGg0eWdQgU_VR4cSX5tLnHYCk8tK77cb-9Grg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/5/22 11:30, Peter Maydell wrote:
> On Tue, 5 Apr 2022 at 14:07, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>> There is a lot of Valgrind warnings about conditional jump depending on
>> unintialized values like this one (taken from a pSeries guest):
>>
>>   Conditional jump or move depends on uninitialised value(s)
>>      at 0xB011DC: kvmppc_enable_cap_large_decr (kvm.c:2544)
>>      by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
>>      by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
>>      by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
>> (...)
>>    Uninitialised value was created by a stack allocation
>>      at 0xB01150: kvmppc_enable_cap_large_decr (kvm.c:2538)
>>
>> In this case, the alleged unintialized value is the 'lpcr' variable that
>> is written by kvm_get_one_reg() and then used in an if clause:
>>
>> int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>> {
>>      CPUState *cs = CPU(cpu);
>>      uint64_t lpcr;
>>
>>      kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>>      /* Do we need to modify the LPCR? */
>>      if (!!(lpcr & LPCR_LD) != !!enable) { <---- Valgrind warns here
>> (...)
>>
>> A quick fix is to init the variable that kvm_get_one_reg() is going to
>> write ('lpcr' in the example above). Another idea is to convince
>> Valgrind that kvm_get_one_reg() inits the 'void *target' memory in case
>> the ioctl() is successful. This will put some boilerplate in the
>> function but it will bring benefit for its other callers.
> 
> Doesn't Valgrind have a way of modelling ioctls where it
> knows what data is read and written ? In general
> ioctl-using programs don't need to have special case
> "I am running under valgrind" handling, so this seems to
> me like valgrind is missing support for this particular ioctl.

I don't know if Valgrind is capable of doing that. Guess it's worth a look.

> 
> More generally, how much use is running QEMU with KVM enabled
> under valgrind anyway? Valgrind has no way of knowing about
> writes to memory that the guest vCPUs do...

At least in the hosts I have access to, I wasn't able to get a pSeries guest
booting up to prompt with Valgrind + TCG. It was painfully slow. Valgrind + KVM
is slow but doable. Granted, vCPUs reads/writes can't be profiled with it when
using KVM, but for everything else is alright.


Thanks,


Daniel


> 
> thanks
> -- PMM

