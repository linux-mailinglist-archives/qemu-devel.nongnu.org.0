Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD86C4566
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuCg-0007Tr-AN; Wed, 22 Mar 2023 04:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuCe-0007Td-DJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:52:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peuCc-0006mm-Ez
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:52:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o40-20020a05600c512800b003eddedc47aeso5423119wms.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679475133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0zhn/IVgh84SHkuMAUP7uVZwXIbEE8aOqdQQoOFWap4=;
 b=xvlWyDWG3utV1Xmp/g+HlBOdWn2z1pDKM0BIoZMqEPvPOTBQzlBrfqsPBj2Q2UTTws
 +m7p4wHH0mHXoWNQ+On7XqPE8YeJhczSsWuutyVj8O+fLhROB5yWBmLbJwtovlk2mKi4
 1wVs1iG9ENenUNrZSsSMY1NJJY/Ez92HEesZDdPXiulq9/M+0nboTT6To8YpuNR/Ba13
 QAXY226vIYlFtK5N88phHDIEP6dLdI68Ga0rjWY+74yMs8OreH7Y0DgaE97xEePZIsYq
 5eKhZKfnGOl7AJ512+qrKGOlj3yYV8p5LWaoLxSH+kcCJzYe47/sPYjyf6K44r8G5T7d
 3B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679475133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zhn/IVgh84SHkuMAUP7uVZwXIbEE8aOqdQQoOFWap4=;
 b=DQoGJqVNd3wtYNin52UW6KgzTqmWtkcRTHIH39PGsFNWEtbDHWqYzH1Iqai2odH11r
 4N0O2F6Ci46N/MJQxNkx+3jSKTe48VPFmoUE9sFNvWIre5ZTj17be4bxAL+wpAFw+hcX
 pVTVxPsbRd05pOBulSoO5n4TpN9obr6TmA+vrjK1Pub/KS0gSXOnLRBYrASJhco2aRhy
 rRpbg4huwFbKS42My4WKt6uFEJJ4VBQH6cRbY5wpxSU0xf3DqzplRWHv1TGaJX5yu/1W
 gdetQaiMGClLdp2CWs7w7DFYEbtARChYLScA0i+lHbjCYoMkPjCy/RM1KIKogtD628tl
 CzLg==
X-Gm-Message-State: AO0yUKU7EyeHx0Ark7myDFK1YeE8OWVMjpEosSMFbDoXybSBuH0AuM+r
 gOsPQNRkLGahzyfND4SMymCMsg==
X-Google-Smtp-Source: AK7set+EwwkH8IRsKImCi6grv+1EZYqxLFcYmlL5WsCu2feUbmG//cacMIPwoatRvWdVRZyHzn6KMg==
X-Received: by 2002:a7b:c00b:0:b0:3eb:2e32:72c3 with SMTP id
 c11-20020a7bc00b000000b003eb2e3272c3mr4929295wmb.22.1679475132762; 
 Wed, 22 Mar 2023 01:52:12 -0700 (PDT)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c451100b003edddae1068sm10492128wmo.9.2023.03.22.01.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 01:52:12 -0700 (PDT)
Message-ID: <ba9d90c1-9fd0-e80f-a094-d7f47c932a1f@linaro.org>
Date: Wed, 22 Mar 2023 09:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 4/4] hw/pci: Ensure pci_add_capability() is called before
 device is realized
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>
References: <20230314111435.89796-1-philmd@linaro.org>
 <20230314111435.89796-5-philmd@linaro.org>
 <20230321221821-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230321221821-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/3/23 03:18, Michael S. Tsirkin wrote:
> On Tue, Mar 14, 2023 at 12:14:35PM +0100, Philippe Mathieu-Daudé wrote:
>> PCI capabilities can't appear magically at runtime.
>> Guests aren't expecting that. Assert all capabilities
>> are added _before_ a device instance is realized.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/pci/pci.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index ac41fcbf6a..ed60b352e4 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -2397,7 +2397,7 @@ static void pci_del_option_rom(PCIDevice *pdev)
>>    * On success, pci_add_capability() returns a positive value
>>    * that the offset of the pci capability.
>>    * On failure, it sets an error and returns a negative error
>> - * code.
>> + * code. @pdev must be unrealized.
>>    */
>>   int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>>                          uint8_t offset, uint8_t size,
>> @@ -2406,6 +2406,8 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>>       uint8_t *config;
>>       int i, overlapping_cap;
>>   
>> +    assert(!DEVICE(pdev)->realized);
>> +
>>       if (!offset) {
>>           offset = pci_find_space(pdev, size);
>>           /* out of PCI config space is programming error */
> 
> Fails in CI:
> 
> https://gitlab.com/mstredhat/qemu/-/jobs/3976974199
> 
> qemu-system-i386: ../hw/pci/pci.c:2409: pci_add_capability: Assertion `!DEVICE(pdev)->realized' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:193: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> TAP parsing error: Too few tests run (expected 49, got 40)
> (test program exited with status code -6)

Thanks for testing!

Likely the AMD-Vi device, see on the cover this series is
Based-on: <20230313153031.86107-1-philmd@linaro.org>
           "hw/i386/amd_iommu: Orphanize & QDev cleanups"
https://lore.kernel.org/qemu-devel/20230313153031.86107-1-philmd@linaro.org/

