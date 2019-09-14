Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F358BB2BA3
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 16:36:25 +0200 (CEST)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i99A0-0003xJ-Hg
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 10:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i9994-0003SF-Nr
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 10:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i9993-0000An-Eq
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 10:35:26 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:32896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i9993-0000AM-6X
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 10:35:25 -0400
Received: by mail-ed1-x542.google.com with SMTP id c4so666266edl.0
 for <qemu-devel@nongnu.org>; Sat, 14 Sep 2019 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qjovcp0EORLdy1p3lg5xNKNjUYKSKjhPj9FlGQD0+q0=;
 b=mK0w7YN2IKl4iKyC6PXqmsNqtu7WP5QLdo+fBdTCe7H1hCTfjJlq2xGch8/5e1KQ9g
 xoYj761tlOCUlnAY8s1KV832GGx7zCdbfGDul7fzZZ1Si3ueVnY8YJ35YY9Us/tJsCcM
 WckjVhC7hVj9/ifNM/3AX+QeThxbHws+iByzhqMopwurv6YGy9du5cEWhGyS+lT3aL4W
 mhD7uLfkjoZ45e+3aP+ARZlOBo2qazPN/i3+fxJKc9nAm0+mENwncdLxh2PL8vWR61GW
 6CvuhxdOvB9+IiaG+xbQsuYyuQmq1RvKTmAAA0x1abfN8hMr6pDY7ja+oXAFYojRrd68
 pcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qjovcp0EORLdy1p3lg5xNKNjUYKSKjhPj9FlGQD0+q0=;
 b=iF02a+ivE62EbHhno43DD2BdTwaqlXZ+TLEo3pwn8ekxjXgqjA6MMjtafBPK0n62z1
 CmfI3tnkh8qCD5FYuL69e9nb/SHWC0xqIWmkcSAu62I+R9U88LCy4kzueiCfaSih/UKI
 fwo6HuMLCXZ/I4b4vh/neDIrEXX5LPhWkNl9uw+YnkEfBz/ZSCMGyJPcaWpQI1/hdV0C
 2vx7bWwZ7+J6x4TJv3lzS261gq3kNj5RIOY1dnrxo4+GwQaXlYLROsLv1S2oaFqDBGGp
 J2onEG5eBb8ihJtnQIEyKSvrKLKVx6UomSRr6D1yQiGwmkTvvIkIjoOQmy7XDK2FFWAc
 X/yA==
X-Gm-Message-State: APjAAAXep9BcEdt3w+IOY6VB2gkYGpI2orBmKfQUwkccgLwUKewoqv07
 z7+zkDTEm3UscgWbzQuUzaw06w==
X-Google-Smtp-Source: APXvYqx8nljXGbGtcumzVC06OfHJ52s9pMBF6151cesjyDwlsqzXTxJo6oQZlV5oHhf6yXOMIS+a9w==
X-Received: by 2002:a17:906:938c:: with SMTP id
 l12mr41352712ejx.309.1568471723274; 
 Sat, 14 Sep 2019 07:35:23 -0700 (PDT)
Received: from [192.168.44.107] ([185.81.138.18])
 by smtp.gmail.com with ESMTPSA id c1sm5874167edd.21.2019.09.14.07.35.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Sep 2019 07:35:22 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190913095639.25447-1-eric.auger@redhat.com>
 <20190913095639.25447-3-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7525d579-24e9-fe3f-e9d1-b221c88f4f3e@linaro.org>
Date: Sat, 14 Sep 2019 10:35:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913095639.25447-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [RFC v3 2/3] intc/arm_gic: Support IRQ injection
 for more than 256 vpus
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

On 9/13/19 5:56 AM, Eric Auger wrote:
> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
> allow injection of interrupts along with vcpu ids larger than 255.
> Let's encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
> ABI when needed.
> 
> Given that we have two callsites that need to assemble
> the value for kvm_set_irq(), a new helper routine, kvm_arm_set_irq
> is introduced.
> 
> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
> message.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

