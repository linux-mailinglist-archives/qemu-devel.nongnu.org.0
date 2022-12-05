Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB8642566
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:05:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27Pe-0005VO-Eq; Mon, 05 Dec 2022 04:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p27PX-0005Tw-VQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:05:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p27PV-0003vX-Ek
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:05:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so11247359wmb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 01:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uGA4s8c4s1rc1kJsKY6f3n42HtylpMpObCK7KgCsXNs=;
 b=ZmXpoBuLns4BEk5LF/Gc5DFwGfJ5f3/+1ZRgcf9Jq8B7yDLvAGB7LXmluD12oB51fp
 a69U/CGn9MNgFVCDAXwKuOIXr7Bd/QrC/kwqCpg1Q/WO5x3iKby5iXJIX+QAycthsy9f
 u3bdi52rtuCeC8/2X5TwD6Ze9/1Rfax6SwPadVFe6TYYhV322+PJ4CtvFUhMJ9Th0qDD
 3Q5+xmkCvkjL32lpGgdar8h2huv8m+gBEE/f610uH8kPtEDBSK0e0JhngJDy8jjPMoi0
 ra8ltZwzkNgmfRunbfMeQiM/0+CaW4fBLMjiGgFR1WxN7/iGAhxlkUzI+pzVrPz++Zl/
 U5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGA4s8c4s1rc1kJsKY6f3n42HtylpMpObCK7KgCsXNs=;
 b=pHyF3uUWss0Nf+WgaX1CPp4XIjIT/R/kk5pix2+a4cJVpJOaiuly2fvDC7tAn69opw
 WVxczTBbC++ZdDdCXQTgKNsCO0ZP8G0Lr03oqTChn/04XyfQk35xx6HGPQwviiQkFmer
 74QKbRkbF17Fw0TLydaGcfMHs34gTfUiwezjh7bVl1slX/vN6ZdazUO/N+TEZqNmeMDE
 fri2/nFDbxuzApVJn/nUbPLQ9/TzniZwSPganw1gE0VKtqV2cLNi4T4POsihW0frwZy/
 5Dbv6/ImTI4YXJ2sDQfWOYcZzXSnrGudZzKOQWBz849Xb4YX9vPbOfklXLDSi0GUTS4n
 ggSw==
X-Gm-Message-State: ANoB5pkUkqQKmCshXKuDMPcs409Zc1xBXZU2dbwEVd1VpL/A4ys1jCO7
 j8wUr1tqdqgcJZuNbQwMkwATPg==
X-Google-Smtp-Source: AA0mqf5/dhiV2QkyeuPCQvJxjb5SYvjvxM2OyctxBKMZAzZX8hJC8vEtDvBmplU6RwazwkwWRSoCAg==
X-Received: by 2002:a05:600c:3110:b0:3cf:b07a:cd56 with SMTP id
 g16-20020a05600c311000b003cfb07acd56mr60401423wmo.143.1670231111124; 
 Mon, 05 Dec 2022 01:05:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003cf6c2f9513sm17376305wmr.2.2022.12.05.01.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 01:05:10 -0800 (PST)
Message-ID: <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
Date: Mon, 5 Dec 2022 10:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: haxm-team <haxm-team@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

Hi Wenchao,

On 5/12/22 09:35, Wang, Wenchao wrote:
> Hi, Philippe,
> 
> Do you agree with my opinion and is there any further process that I need to follow to get this patch merged? Thanks a lot.

I don't understand this part of HAXM enough, but per your explanation, 
your change looks correct. I'll let Paolo decide :)

Regards,

Phil.

> Best Regards,
> Wenchao
> 
> -----Original Message-----
> From: Wang, Wenchao
> Sent: Monday, November 28, 2022 16:11
> To: Philippe Mathieu-Daudé <philmd@linaro.org>; qemu-devel@nongnu.org
> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
> 
> Hi, Philippe,
> 
> It is just the full patch. Currently, the implementation of HAXM is simple, we did not synchronize the vCPU register for xcr0 from QEMU. HAXM will handle the xcr0 state within the kernel space, including initialization, update, etc. This patch adds the xcr0 variable for allocating extra 8-byte buffer occupation, which will be passed between QEMU and HAXM when hax_sync_vcpu_state() is invoked. We have verified the patched QEMU and it can launch all guest OSes. Thanks for your comments.
> 
> 
> Best Regards,
> Wenchao
> 
> -----Original Message-----
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Sent: Friday, November 25, 2022 21:37
> To: Wang, Wenchao <wenchao.wang@intel.com>; qemu-devel@nongnu.org
> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
> 
> Hi,
> 
> On 25/11/22 13:18, Wang, Wenchao wrote:
>> Hi, maintainers,
>>
>> As HAXM v7.8.0 is released and it added XCR0 support, could you help
>> to merge this patch to add corresponding support into HAX user space
>> of QEMU? The patch has been included in the attachment. Thanks.
> 
> See
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches
> on how to send patches to a mailing list.
> 
>>
>> Best Regards,
>>
>> Wenchao
>>
>>   From b1789f2523d06798b8883664bfa9a9df797bfccf Mon Sep 17 00:00:00
>> 2001
>>
>> From: Wenchao Wang <wenchao.wang@intel.com>
>>
>> Date: Fri, 25 Nov 2022 18:37:34 +0800
>>
>> Subject: [PATCH] target/i386/hax: Add XCR0 support
>>
>> Introduce extended control register XCR0 to support XSAVE feature set.
>>
>> Note: This change requires at least HAXM v7.8.0 to support.
>>
>> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
>>
>> Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
>>
>> ---
>>
>> target/i386/hax/hax-interface.h | 2 ++
>>
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/target/i386/hax/hax-interface.h
>> b/target/i386/hax/hax-interface.h
>>
>> index 537ae084e9..1d13bb2380 100644
>>
>> --- a/target/i386/hax/hax-interface.h
>>
>> +++ b/target/i386/hax/hax-interface.h
>>
>> @@ -201,6 +201,8 @@ struct vcpu_state_t {
>>
>>        uint64_t _cr3;
>>
>>        uint64_t _cr4;
>>
>> +    uint64_t _xcr0;
>>
>> +
>>
>>        uint64_t _dr0;
>>
>>        uint64_t _dr1;
>>
>>        uint64_t _dr2;
>>
>> --
>>
>> 2.17.1
>>
> 
> Is that the full patch? It is missing the register use in hax_sync_vcpu_register()...
> 
> Regards,
> 
> Phil.


