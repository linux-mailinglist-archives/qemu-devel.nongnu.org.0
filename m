Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E057C264
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 04:44:40 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEMB5-0001ec-Il
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 22:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1oEM9e-0000I0-Ns
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 22:43:10 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <like.xu.linux@gmail.com>)
 id 1oEM9d-0005Mv-6m
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 22:43:10 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so401481pgs.3
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 19:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uvNbIaU3v9XRIIq9DA1vYd0If30efTtASaHTfWCDnr4=;
 b=MORNRzMyVpIXf6+FF0Sbiy0LamHiR1alBkr/JHNU3+HmYy1HXIYyKdmPtPEwOYvNiW
 hJMC1PHX+ugraDgdy+UUPaETMoPDDTzNEBqM+bjbZ0SWoREvFyFMWwpEqEEZA4W+UFZw
 zMki5ylPj9N10zQfXVRNHR7GArkQe5YZrQb1gSXFIbDZWI0F3cYdie8qWqSBqa0fUlC1
 M6JHGLsN6H9aCyomIqXAHOXp17MdJ5tmrQePUlwhh+mIHG7eW/jBeb1f5mf2qCuovUg9
 Dty4qr4LzRySlLGorEt9fYXqsRMmZAWACCIuTeDXgeGCmgxlCRG6ZoGc/s54hSYHmg8o
 twxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uvNbIaU3v9XRIIq9DA1vYd0If30efTtASaHTfWCDnr4=;
 b=tbhHlt2ftJjctnbAsNaRvHpKzp0kKauc8WDABHm6XlILJG6AJYBwj1XPQHCjXclBcv
 VKjqejSxFCKHh/HiLZhxzM3ClHGoYIKeIpowIEm/ttkBRETUamsnhe/mVS1zwAcQh/Nv
 YKPpKf5utU91e/4Qdyq3XUSzSvr6bQ7TG5Mx7WyY4uCJyJB51RMiYpLAtio5mJ+N1WRc
 iZjmHiS68EicQR9UiRczQ4aK59i1W40qQxcrpP/QsaV8pR9PHnkbm1vxdiMoajXECdxy
 /NLFm/1xLcCB1qYk4WREYPLRA5OIZJM7+dKD86mIL2ck3YjwnkZyThzT/xHkFGMptybt
 dLAg==
X-Gm-Message-State: AJIora/RNnWv8BbGvyywMWiHSA8sHNRXKvcw9KXDcUqwzSNCnCD56aax
 gYyFcSH6ADv5UVGPT6oHI3E=
X-Google-Smtp-Source: AGRyM1sjZBqVWX4DwALOuXGhxae5axh4LMDhTNB4ON7U9ZPQvG0U6yG/K5fwquvhsHvC8ujCpr8P3g==
X-Received: by 2002:a63:696:0:b0:41a:1c20:bf5f with SMTP id
 144-20020a630696000000b0041a1c20bf5fmr17176172pgg.402.1658371387202; 
 Wed, 20 Jul 2022 19:43:07 -0700 (PDT)
Received: from [192.168.255.10] ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa79416000000b005289fad1bbesm360350pfo.94.2022.07.20.19.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 19:43:06 -0700 (PDT)
Message-ID: <e71d9885-b12e-e360-0efc-99e182bc7fb3@gmail.com>
Date: Thu, 21 Jul 2022 10:42:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mtosatti@redhat.com, xiangfeix.ma@intel.com
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
 <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
 <Ytb9kTFtnltT3fdf@google.com>
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <Ytb9kTFtnltT3fdf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=like.xu.linux@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/7/2022 2:53 am, Sean Christopherson wrote:
> On Tue, Jul 19, 2022, Paolo Bonzini wrote:
>> On 7/18/22 22:12, Sean Christopherson wrote:
>>> On Mon, Jul 18, 2022, Paolo Bonzini wrote:
>>>> This needs to be fixed in the kernel because old QEMU/new KVM is supported.
>>>
>>> I can't object to adding a quirk for this since KVM is breaking userspace, but on
>>> the KVM side we really need to stop "sanitizing" userspace inputs unless it puts
>>> the host at risk, because inevitably it leads to needing a quirk.
>>
>> The problem is not the sanitizing, it's that userspace literally cannot know
>> that this needs to be done because the feature bits are "backwards" (1 =
>> unavailable).
> 
> Yes, the bits being inverted contributed to KVM not providing a way for userspace
> to enumerate PEBS and BTS support, but lack of enumeration is a seperate issue.
> 
> If KVM had simply ignored invalid guest state from the get go, then userspace would
> never have gained a dependency on KVM sanitizing guest state.  The fact that KVM
> didn't enumerate support in any way is an orthogonal problem.  To play nice with
> older userspace, KVM will need to add a quirk to restore the sanizting code, but
> that doesn't solve the enumeration issue.  And vice versa, solving the enuemaration
> problem doesn't magically fix old userspace.
> 
>> The right way to fix it is probably to use feature MSRs and, by default,
>> leave the features marked as unavailable.  I'll think it through and post a
>> patch tomorrow for both KVM and QEMU (to enable PEBS).

Try to help:

KVM already have MSR_IA32_PERF_CAPABILITIES as a feature msr (to enable LBR/PEBS),
and KVM_CAP_PMU_CAPABILITY as vm ioctl extension for model specific crappiness.

> 
> Yeah, lack of CPUID bits is annoying.
> 
> 

