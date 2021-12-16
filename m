Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABF4771CC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:28:02 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxprd-0004TX-Dj
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:28:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxppq-0003kg-0n
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:26:10 -0500
Received: from [2607:f8b0:4864:20::42d] (port=35802
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxppo-0002rb-9I
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:26:09 -0500
Received: by mail-pf1-x42d.google.com with SMTP id p13so23518414pfw.2
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9PKAHevcfUo4Rc8opgwlX0Gx3o2fcEz7IyZ5VTPeB60=;
 b=cBboC1zxHIqTsCljAWvGR56gbmZQmrQ+wsTKFN3MOTGLZecZXYBXrtY0M0zFxAfU3j
 4hHAMNyG5A+r25xxfDVEpdBkVchQxiLhniSVKRf4rnivmYsVQrL5CcRX5OsLNjh+8ZbB
 vTWuLj9yBB8+3DPOl+r626b80hVlZs8Ko7pccxKtC1ISK848pyoUAmi4Y6LivbMGg6ci
 tGEjfcGZEwzVDFypx/dtVpoeCN+eE+ivC4SKXsddrsYW+m2UjWiKNLtVgAjEO8XwXoki
 WKFBNpCtsapBOQkZTvA4Dx0ZFRldUpSBv0FN6A338NgbQsEcd0G3vi+awy8cW0j2RuAj
 gU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9PKAHevcfUo4Rc8opgwlX0Gx3o2fcEz7IyZ5VTPeB60=;
 b=0FYXy9Y6Y/5W+tnyHBcnD9TLqdDWeMLdWwbWuJuRxGwGnO/SnjU3TY8KUVTVKSA/A9
 ylQxHDsQTXQJ/7vHWzA51pxhuKujbvWqFu9tkD6JdDrgi9Cq3wgX4wsvnCvPFsM6q10Y
 PMOgEbpoZvzHQhqnXE7v7hG9xobg/V3kq8PqNmO5hm21kpxN0QYNkmXY8mkB0U2LWSe2
 pOuDay148oKm/IgR+XF7DTNCkDJmZSvtyoPSjqRleEf3baFn5KuBaO4i/ritr/M1hxur
 z8QLwOQh87g+ylgzDinXtBwAklYqhxtSO3J4ri1g5Nfp2H18G9LO3rFOCafQvgnfqxbj
 0MGA==
X-Gm-Message-State: AOAM530toAOUwXAMnafViDCPq950im4TDWiFEaUmhcjP47nuGaIhxvKA
 i1MjPJxOc3nZ0BdfIwgmCnSm4gZSM7RQHQ==
X-Google-Smtp-Source: ABdhPJyxaNZsVFggYvCxT2TWuBDX04x7xlRlAQMFAw4tkLOSmVnVEIHAGN6EPLQYtJnjOaCq2LKjwA==
X-Received: by 2002:a63:af19:: with SMTP id w25mr12067156pge.438.1639657566792; 
 Thu, 16 Dec 2021 04:26:06 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k1sm6369909pfu.31.2021.12.16.04.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 04:26:06 -0800 (PST)
Subject: Re: [PULL 31/33] tests/acpi: add test case for VIOT
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
 <20211215104049.2030475-32-peter.maydell@linaro.org>
 <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org> <YbsNoEUfJRsqtKmF@myrica>
 <CAFEAcA_T-_bouEcfxydBmXUts4-rhUW4cb3KU=x-7WRgJM4smA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1eccc293-af14-6528-eebe-612d76f46594@linaro.org>
Date: Thu, 16 Dec 2021 04:26:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_T-_bouEcfxydBmXUts4-rhUW4cb3KU=x-7WRgJM4smA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 3:28 AM, Peter Maydell wrote:
> On Thu, 16 Dec 2021 at 09:58, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>>
>> On Wed, Dec 15, 2021 at 04:59:10PM -0800, Richard Henderson wrote:
>>> On 12/15/21 2:40 AM, Peter Maydell wrote:
>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>
>>>> Add two test cases for VIOT, one on the q35 machine and the other on
>>>> virt. To test complex topologies the q35 test has two PCIe buses that
>>>> bypass the IOMMU (and are therefore not described by VIOT), and two
>>>> buses that are translated by virtio-iommu.
>>>>
>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>> Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>>    tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 38 insertions(+)
>>>
>>> I should have been more careful while applying.  The aarch64 host failure
>>> for this is not transient as I first assumed:
>>>
>>> PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
>>> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
>>> Broken pipe
>>> ERROR qtest-aarch64/bios-tables-test - too few tests run (expected 6, got 5)
>>> make: *** [Makefile.mtest:312: run-test-37] Error 1
>>
>> I'm guessing adding "tcg_only = true", like all other virt machine tests
>> in this file, should work around this, but I don't really understand the
>> problem because I can't reproduce it on my aarch64 host (I'm running
>> "configure --target-list=aarch64-softmmu" followed by "make -j10
>> check-qtest V=1" in a loop)
> 
> What host are you testing on? The test case explicitly asks
> for "-cpu cortex-a57", so it is only going to work with KVM
> on hosts with a Cortex-A57.
> 
> Richard: given I'm off work for Christmas now, if Jean-Philippe's
> suggested fix fixes this are you OK with just applying it directly
> to un-break the CI ?

Yes, it looks like it should fix the problem.  I'll run it through and apply directly.

After the new year we can look to see if -cpu max would not work just as well for most of 
these tests, so that kvm can run them as well.


r~

