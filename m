Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A83650920
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7C9e-00037S-Ry; Mon, 19 Dec 2022 04:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7C9c-00035d-IN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:09:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7C9a-0003IK-EW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:09:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id co23so7938644wrb.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OfnHStrHke8Pme44/tBv15k8RmXyAsR4OwB7GJaX9Wc=;
 b=AzngIdrUuJ4Qd0x8W8TFkNZs514/hrfU6We3AFo4zZMc9yBvmmZQgi32SLUEsilHxS
 fj3X1MXN160NokJeECt3rMDq3YO7Ec/ogJRghN68x1mRmrmCEvo9+TxMIiz6m+HyRgPV
 EssGD19x47HsGOzlucVJZESX3PNp7VelFS2NvtUU0YqeQ3EuYisCwZkcNq1v7+XgBziq
 vSYpl7K6MIDnezESyV1zTEDJbKI0fOryzaecMZVmJaudSGKKLgY/q9Al4/LVo87hWRek
 Cu3+KkXMMurn6dE25uwh4GZv8k+Yo1r8g/1bNA0P3ZYN0tDyWSM9hd6MHLJJBKmhFGKZ
 RDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfnHStrHke8Pme44/tBv15k8RmXyAsR4OwB7GJaX9Wc=;
 b=jv6roNf7xnKmLfG4LfSFupuyC15b2b//LpN/YFuayuiEgt5z1qMYe5gqCaY9pg0Va7
 e1McaJhNJeerLynAM7mgFhbpaHDbrHvdcwcbuII2Gf/u3fS2kQtBZThLjkSrh9TNliR1
 i9O1OFc/1z8PP4WRO8FcT8owu74pwC9GuZAjfwaiO6hh8kQ/KO0v9hTgoe2NtDA+yPoM
 m6aMylqJqFpvgEold919VReIAwYbgE3Pshvx8K2KKTwxOMhuJnImaeaC2ndCO3dlQo2f
 2h3YZTVpvZb8zidX8vMvyxzA1A2BJTWmI1ofDsRml7caX0ffxe9REuqIbfdTn2sOvpXy
 S8Hg==
X-Gm-Message-State: ANoB5pkmY2e5aJl2XrBh2HGpGntB0iYvtUSQj6JOgQqa21IhIdEfnAro
 jcboblS/l6BGYCE2X7mZfBDmsw==
X-Google-Smtp-Source: AA0mqf46fMgANiaJAyJzyeoeS/rrp9PpCmuHME6VIW347d76MZzao5AXnMZV1D8hLMpNSwy9vqbJkA==
X-Received: by 2002:a05:6000:170f:b0:253:62af:8025 with SMTP id
 n15-20020a056000170f00b0025362af8025mr17763427wrc.61.1671440984803; 
 Mon, 19 Dec 2022 01:09:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bo28-20020a056000069c00b002415dd45320sm9478734wrb.112.2022.12.19.01.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:09:44 -0800 (PST)
Message-ID: <be555e77-f650-787b-e9a7-6cd92d34234c@linaro.org>
Date: Mon, 19 Dec 2022 10:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
Content-Language: en-US
To: "Wang, Wenchao" <wenchao.wang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <DM6PR11MB40909B4A33D66A3100F6D219870E9@DM6PR11MB4090.namprd11.prod.outlook.com>
 <4e35a2b6-12ca-e43c-6ee7-7090280c9341@linaro.org>
 <DM6PR11MB40906BFDB7E263064C1BBC4587189@DM6PR11MB4090.namprd11.prod.outlook.com>
 <04484bf1-c6fc-d430-9939-474c0dab158f@linaro.org>
 <DM6PR11MB40901A46FA5D76F2FCA47E9B87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DM6PR11MB40901A46FA5D76F2FCA47E9B87E59@DM6PR11MB4090.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 19/12/22 10:01, Wang, Wenchao wrote:
> Hi, Philippe,
> 
> As Paolo did not comment with this patch, as you used to think it looks correct, could you help to merge this one-line patch as no one picked it up so far? Thanks a lot.

I'm pretty sure Paolo is busy with KVM stuff and will take this patch
when he switch to QEMU (it really is within his area). If he doesn't
comment I'll take it with a generic target/ cleanup series next week.

> Best Regards,
> Wenchao
> 
> -----Original Message-----
> From: Wang, Wenchao
> Sent: Monday, December 5, 2022 17:10
> To: Philippe Mathieu-Daudé <philmd@linaro.org>; qemu-devel@nongnu.org
> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
> 
> Thanks for Phillippe's reply.
> 
> Hi, Paolo,
> 
> Could you help to review the patch of HAX? If there is any concern about it, feel free to discuss with me. Thanks a lot.
> 
> 
> Best Regards,
> Wenchao
> 
> -----Original Message-----
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Sent: Monday, December 5, 2022 17:05
> To: Wang, Wenchao <wenchao.wang@intel.com>; qemu-devel@nongnu.org
> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: Re: [PATCH] target/i386/hax: Add XCR0 support
> 
> Hi Wenchao,
> 
> On 5/12/22 09:35, Wang, Wenchao wrote:
>> Hi, Philippe,
>>
>> Do you agree with my opinion and is there any further process that I need to follow to get this patch merged? Thanks a lot.
> 
> I don't understand this part of HAXM enough, but per your explanation, your change looks correct. I'll let Paolo decide :)
> 
> Regards,
> 
> Phil.
> 
>> Best Regards,
>> Wenchao
>>
>> -----Original Message-----
>> From: Wang, Wenchao
>> Sent: Monday, November 28, 2022 16:11
>> To: Philippe Mathieu-Daudé <philmd@linaro.org>; qemu-devel@nongnu.org
>> Cc: haxm-team <haxm-team@intel.com>; Paolo Bonzini
>> <pbonzini@redhat.com>
>> Subject: RE: [PATCH] target/i386/hax: Add XCR0 support
>>
>> Hi, Philippe,
>>
>> It is just the full patch. Currently, the implementation of HAXM is simple, we did not synchronize the vCPU register for xcr0 from QEMU. HAXM will handle the xcr0 state within the kernel space, including initialization, update, etc. This patch adds the xcr0 variable for allocating extra 8-byte buffer occupation, which will be passed between QEMU and HAXM when hax_sync_vcpu_state() is invoked. We have verified the patched QEMU and it can launch all guest OSes. Thanks for your comments.
>>
>>
>> Best Regards,
>> Wenchao


