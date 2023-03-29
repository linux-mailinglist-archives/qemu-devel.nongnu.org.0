Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D396CEEC3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 18:08:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phYKu-0005wU-Gz; Wed, 29 Mar 2023 12:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYKr-0005vx-GY
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:07:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phYKp-0006XA-PA
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 12:07:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so10064432wms.1
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680106057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1UggbtUttWotGXhnOT4eeR/Jmnr9Fp3uE+y/oEWdtno=;
 b=sapCQwIlE0muDY7QJ4WW6hz+7BO2fNoYLEl+wg2gApXwjZxtCjxBOS5qasi6jOK/Ax
 siaH8YfLyRlrCLpSRRpSlQjavIj9Yro3PaANz1YF9kRPuty0NOb88X8lA+uB8SpbhAd+
 GuoXf7LRKBabpt9ndGx2DDJBjlvx/NoVkxE6E0fKcS5xI9xe1RtfmfuptidEbpxUHF/p
 tQKRSlfm8w6YMSZpR6sRuWGLhsXjSnJl2MyiVcbAQsHItG+BUzGLxPE+L+l5/ps/XIlt
 xNzpmcuMcShNrXrQzaDe7+9rU/Wx0i0wOX6b8FiMdxXa+pAk/w+oLz7nisJNaJRZ36yi
 scdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680106057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UggbtUttWotGXhnOT4eeR/Jmnr9Fp3uE+y/oEWdtno=;
 b=lYqc6YMNzozamVctG0INvGajkzPkNV/stX/wvqUIa3ZBTXXg0mdgkoFcrPtBo2K6F1
 +mOh5Abo7ntj4Ws2yO51vaFmToORDvbAv8Q4yt3EkFDsuq/hdqrFImYWEIiZR2eKOeqq
 TtYfrlfKf4qe+Msf+KEWOXKKloC8iJtQ37jZMej/UZIDBH35OI/h46pJBbYQ+YZ6YzMG
 hd5/DpssoHlH4ZXfLA+Rw/nJ+HSd5HoMQ3Ye8F/pX78PW2PeFLMWmXny7QeF7fpzh0li
 BKMW1ExNze8adSO4xZc7mY7AAqPM7qIlHxKLQEWNKjzFJFRsn9dPpv8sqVJGhkm08HW3
 ZhYg==
X-Gm-Message-State: AAQBX9eETc2ZQXZ8Wxboa4sq3WNMZKhWcoaythQ6ReOAmVpn8MykehNW
 m2834QarVEMCmTRs7e8jOCRy1w==
X-Google-Smtp-Source: AKy350bHbOVqMhYahwFmL6hKJjI4cyupNxWa1xQ8bqEQuPItrhhcrQadm8qewM/8oZZT+tR9+lZMfA==
X-Received: by 2002:a05:600c:cc:b0:3f0:3049:b216 with SMTP id
 u12-20020a05600c00cc00b003f03049b216mr1682627wmm.28.1680106057691; 
 Wed, 29 Mar 2023 09:07:37 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee0d191539sm2748957wmb.10.2023.03.29.09.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:07:37 -0700 (PDT)
Message-ID: <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
Date: Wed, 29 Mar 2023 18:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Rob Landley <rob@landley.net>, Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 29/3/23 18:09, Rob Landley wrote:
> On 3/28/23 12:02, Philippe Mathieu-Daudé wrote:
>> On 20/3/23 17:58, Nathan Chancellor wrote:
>>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
>>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
>>>>>
>>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>>> little endian.
>>>>>
>>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
>>>>> endian-swapping.
>>>>>
>>>>> This should fix some recent reports about poweroff hang.
>>>>>
>>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> ---
>>>>>     hw/pci-host/gt64120.c | 18 ++++++------------
>>>>>     1 file changed, 6 insertions(+), 12 deletions(-)
>>>>
>>>> So this works on little-endian hosts, but fails on
>>>> big-endian ones :(
>>>>
>>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>>> looping:
>>>>
>>>> IN: prom_putchar
>>>> 0x8010fab8:  lbu	v0,0(v1)
>>>> 0x8010fabc:  andi	v0,v0,0x20
>>>> 0x8010fac0:  beqz	v0,0x8010fab8
>>>> 0x8010fac4:  andi	v0,a0,0xff
>>>>
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>> ...
>>>>
>>>
>>> Is there going to be a new version of this patch or a different solution
>>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>>> a release version.
>>
>> I couldn't work a fix, however I ran our (new) tests on merge
>> commit 3db29dcac2 which is before the offending commit 145e2198d749,
>> and they fail. So I suppose Malta on big-endian host is badly broken
>> since quite some time. Thus clearly nobody tests/runs Malta there.
> 
> I test/run malta with the mips and mipsel binaries at
> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/ but I'm still
> locally applying the first patch I saw to fix this (attached) until upstream
> sorts itself out.
> 
> Works fine for me. Somebody said it was the wrong fix but I don't remember why...

This is a correct /partial/ fix. With this patch, Malta works on little
endian hosts. No luck with big-endian hosts, but this was broken
previous to 3db29dcac2 rework, so apparently not a big deal ¯\_(ツ)_/¯

