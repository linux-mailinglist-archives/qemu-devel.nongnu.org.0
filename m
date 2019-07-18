Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC116CABF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 10:16:12 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho1aE-0003kM-PY
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 04:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1ho1a0-0003Kd-IZ
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:15:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ho1Zz-0007xJ-Ld
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:15:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ho1Zz-0007wt-FT
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 04:15:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so24642221wml.0
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 01:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xWs7V3RxGyT2Vuc7+UbrPqGzllPy9wuHJrwmhfs1UQU=;
 b=jZBGUqy5g5gsaCHTlZre1ubfoXuV/llCvRh34a2u3HW3AzYDhNjv0iusXHVgWDzWzk
 f9bQ9lRpvBMDYaGhjVCAJXDwPdjIpy5gHnbHIBQrmXhlBMvI6Uk1Jw9UGy880FiLCfcZ
 HgUHQVtBGzb2zQ2uh8/aWb3PWsjAR9UHNqEFnl9ZmfDOTrqgEj7c0XCWL3kcnDGytC5h
 8Uvge7uwCTmvWjDbvHB6DOLBroCZ2ZA2cLEp/7biPnVNybHhHcLO7+OXlV0MU0wz9vGS
 vaJzzQbeyOJMLGRf/9X8w21j9ZwvXCCmwKkBnlAboUpw1wWn7VoUpTiR2FHfjV0WrdeJ
 wWTA==
X-Gm-Message-State: APjAAAXtH1OBbL4iAwivSULwiQpmdCvR3Yc7GRBD+GA+4KOt3qQwJimc
 zO3JFwmYbk7S6zY+yaFLUvEwlaza4p6aUQ==
X-Google-Smtp-Source: APXvYqwaXFm9L5JVmMRe6sjfM92KVvw8P4Lnk3UfI7c4/3ZhJwM5j6TvOQnWY303Y4xqRnbtE0PHuw==
X-Received: by 2002:a05:600c:2245:: with SMTP id
 a5mr40757638wmm.121.1563437754219; 
 Thu, 18 Jul 2019 01:15:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e427:3beb:1110:dda2?
 ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id t13sm31846908wrr.0.2019.07.18.01.15.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 01:15:53 -0700 (PDT)
To: Jing Liu <jing2.liu@linux.intel.com>, qemu-devel@nongnu.org
References: <1562823509-13072-1-git-send-email-jing2.liu@linux.intel.com>
 <c572cdd2-d0f4-2e06-99f8-302b798a04dd@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0f9763fe-af69-e057-9fb1-00527e636fe4@redhat.com>
Date: Thu, 18 Jul 2019 10:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c572cdd2-d0f4-2e06-99f8-302b798a04dd@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH v1] x86: Intel AVX512_BF16 feature enabling
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/07/19 06:55, Jing Liu wrote:
>>
>> +            *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7,
>> +                                                count, R_EAX);
> This needs to be firstly checked as follows, otherwise some
> architectures would fail to compile.
> 
> What about hvf and tcg CPUID 07 EAX value?
> 
> +            /* Maximum ECX value for sub-leaves */
> +            if (kvm_enabled()) {
> +                *eax = kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7,
> +                                                    count, R_EAX);
> +            } else if (hvf_enabled()) {
> +                *eax = hvf_get_supported_cpuid(0x7, count, R_EAX);
> +            } else {
> +                *eax = 0;
> +            }
> 

Good question.  You need to add a new property, for example
cpuid_level_func7, whose code would be modeled around cpuid_level (and a
field cpuid_min_level_func7 whose code would be modeled around
cpuid_min_level).

Then CPUID[7,0].EAX is set automatically to 0 or 1 depending on whether
BF16 is enabled or not.

Paolo

