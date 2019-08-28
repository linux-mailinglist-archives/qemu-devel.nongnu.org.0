Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6709F8C2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 05:30:08 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2oet-0000m7-PR
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 23:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2odX-0008Bv-F2
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:28:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2odW-0004Ki-63
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:28:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2odV-0004KD-Sr
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 23:28:42 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d3so539000plr.1
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 20:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FdCU00f2y7Ewb6ItbbiaIhm+41+QGTSrT/++y+BwtOU=;
 b=CDmNLhOzLJ/wqz/WoWQlfyUGkfFz9FFnWp6S6WtgUzYZ295l6d5uU50ZMItsZIjUoX
 tHekblrpyPalZD/J5St+D/NBWizHp6D4fUWR5CRO2NG5LV7JadhBeh6PFSbFbh9hxfLz
 gyUdOENLetaz1uoMmMzQ1OWQ35QINRhq9660IIhoZskL6ExabgbPknoj0jIFGEUjhMn/
 OMx+33H3vQE4shVzXkaCNXvnOni5r4iVnod7CmOSI/rFN6WVkNaYQCCCFjsaZWSfgNEq
 bEZener9brrOHpCKc/NIcK/P2FB3Nd3ALczrhIe0v6cNvhJ5Kd+HR4SEwhD6BTIO6j7S
 SlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FdCU00f2y7Ewb6ItbbiaIhm+41+QGTSrT/++y+BwtOU=;
 b=Z7xqAzMJ6kyRsWeAnHUZhNIxmmRw4YidhlNccsZyofJWgHSjMVNjLlFvV3/au8za+2
 YPU8FI/8K8GYWw9KbRnb/4xByyxl0OFmUvpBXvqAJ6mC+px3rHJHA+nkH9vzFDHVDTpt
 Lni5TTAM2mVznHkQBsL/86D0IUUj1SiXYbKAo00gKPFTfJLnfH9s6MmxAAXOSO8OuTUJ
 K1jHmdSefT+8R8iP8UycE+WlN0fuPJ0cuGAoAp0lx3ddpvKEA7PfxiqlCRc8lEQjCDHS
 1Kg7NcKHR75XAZSC4YS2fObZupl5vXCX8AvRBmaLhBzTNJLYtu17AqCKp+kiTY5tuTAf
 dt0g==
X-Gm-Message-State: APjAAAUKwrPm2YyQsuJNKuHYZeBz/iSqCIIhJzkh0QOoAtyB07LtAkWF
 iTKcp7V6eiLxx4Ka+mUsRHGeYQ==
X-Google-Smtp-Source: APXvYqwn4J8OZx6IyfaszQT0Ybhtr0VnguBeIXHRTm3zD/VsrutEKYQEeT/60KTR1WkC/aa28lNEKA==
X-Received: by 2002:a17:902:748a:: with SMTP id
 h10mr1563662pll.31.1566962920596; 
 Tue, 27 Aug 2019 20:28:40 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 4sm852252pfe.76.2019.08.27.20.28.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 20:28:39 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-4-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7d012631-1fe3-c040-eaf7-87ba274657c5@linaro.org>
Date: Tue, 27 Aug 2019 20:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827160554.30995-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62e
Subject: Re: [Qemu-devel] [RFC 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/19 9:05 AM, Eric Auger wrote:
> +++ b/target/arm/kvm_arm.h
> @@ -233,6 +233,14 @@ bool kvm_arm_pmu_supported(CPUState *cs);
>   */
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
>  
> +/**
> + * kvm_arm_irq_line_layout_2 - Returns whether more than 256
> + * vcpus are supported by KVM_IRQ_LINE
> + *
> + * @ms: Machine state handle
> + */
> +bool kvm_arm_irq_line_layout_2(MachineState *ms);
> +
>  /**
>   * kvm_arm_sync_mpstate_to_kvm
>   * @cpu: ARMCPU
> @@ -280,6 +288,11 @@ static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>      return -ENOENT;
>  }
>  
> +static inline int kvm_arm_irq_line_layout_2(MachineState *ms)
> +{
> +    return -ENOENT;
> +}
> +

These signatures don't match.


r~

