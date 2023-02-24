Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA86A2203
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdLn-0005Wt-DR; Fri, 24 Feb 2023 14:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVdLX-0005BL-Hn
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:03:13 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVdLU-00039N-Tm
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:03:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r18so189283wrx.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TeHdrzTRHjOdKzZKNf8TD6lSjBNiLWyMo4WSmYmb6jw=;
 b=poiQJjVntxqquElUCzR33mg0uIDl+9iq8v8GIFwfLGBKofXD8pSuOucyaV28Li1tC4
 FvJmNciqNmlXUVlauwqDELXkThOi7HdaMvTxw2ebElDhzkKvTWDWkj/DAjHRCTwwJCG1
 tpxJxgSSwYENkXS6L4rhJ1YK8aOUWmEYgmNa9cjEPHoYE09R4QVU8LOsYWPi0PPfYJbl
 QBrxZjCAsPS/SKIVw6A+zKScVjMVhaeiZ1VxQz7RGV9B2zs1uBkdVxrwwWuAhXQ2OtGf
 OLwdvZbdTLjbe9ZeDTVoMJHnlOMGMrk3AIn0m3yi8TcE3+dMhohIxnhPX08DzIEv4Xbc
 ctJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TeHdrzTRHjOdKzZKNf8TD6lSjBNiLWyMo4WSmYmb6jw=;
 b=zfUa3AVvGz/VeN1zmz11sP5Y04IYImOCabBHTPXbV+gIEr/OEwmRRJdthqZV8LwhJo
 UbnyqnlZCoRNs6DkoX3ZFPRvTWWzSSYmsUdWCDidIKrpznDdKPKIL+olLOSWsjv0zRuk
 CY1kKvxtuFx9C2TAtkbY3BNi7pRMK3R2Z9WcysnMkDjyWZxCkyQzQK1DuSD+Rbo3dV0t
 8er2hwhsKNwgjT7aR1+YS4AWxmNeOgLtvjXsBjqrQptcqFwrn8yNGZ7SXDs2KqFgk6rn
 RJYFE9VNhLCSjPe4xpszaG9rDn1lAvyHdi9Froh6f5tkv35Ui+Ra6Otl781BblNcIPsN
 dpxA==
X-Gm-Message-State: AO0yUKUqi/vJh6X+fFMjH2sccw/3NM1/ZvJMuQmyEtjdwy+Jqi91jzSx
 mQR8sROaM9gL0v9DaaLd9tBS1A==
X-Google-Smtp-Source: AK7set+m/LdF7l8wX+ezWdJkwGI3QBj3R35oyvVPpJryKitBf889AHbnk1/5fvylw8MNB4wUPZBORQ==
X-Received: by 2002:adf:cf06:0:b0:2bf:94ea:67ca with SMTP id
 o6-20020adfcf06000000b002bf94ea67camr14105532wrj.25.1677265383130; 
 Fri, 24 Feb 2023 11:03:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d654e000000b002c5801aa9b0sm14336208wrv.40.2023.02.24.11.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 11:03:02 -0800 (PST)
Message-ID: <45b86050-0f0b-d222-c32f-9d6f23246574@linaro.org>
Date: Fri, 24 Feb 2023 20:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
 <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
 <20230222164947.0000554f@Huawei.com>
 <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
 <586d040f-d712-905e-fd68-bcde3713478b@redhat.com>
 <875ybsg7cl.fsf@pond.sub.org> <20230223142748.0000662f@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223142748.0000662f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 23/2/23 15:27, Jonathan Cameron wrote:
> On Thu, 23 Feb 2023 08:37:46 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
> 
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 22/02/2023 19.16, Philippe Mathieu-Daudé wrote:
>>>> +Thomas (meson) & Marc-André (conditional QAPI)
>>>
>>> + Markus
>>>   
>>>> On 22/2/23 17:49, Jonathan Cameron wrote:
>>
>> [...]
>>
>>>>>>>> Doesn't these need
>>>>>>>>
>>>>>>>>          'if': 'CONFIG_CXL_MEM_DEVICE',
>>>>>>>>
>>>>>>>> ?
>>>>>>>
>>>>>>> If I make this change I get a bunch of
>>>>>>>
>>>>>>> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG_CXL_MEM_DEVICE"
>>>>>>>       18 | #if defined(CONFIG_CXL_MEM_DEVICE)
>>>>>>
>>>>>> Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.
>>>>>>   
>>>>>>> It's a target specific define (I think) as built alongside PCI_EXPRESS
>>>>>>> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
>>>>>>>
>>>>>>> To be honest though I don't fully understand the QEMU build system so the reason
>>>>>>> for the error might be wrong.
>>>>>>
>>>>>> You need to restrict to system emulation (the 'have_system' check):
>>>>>
>>>>> This doesn't help - still have
>>>>> attempt to used poisoned "CONFIG_CXL"
>>>
>>> Not sure how the QAPI generator works, but target specific config switches can only be used in target specific json files there, so that's machine-target.json and misc-target.json currently, as far as I know. Not sure how the QAPI generator distinguishes between common and target specific code, though ... just by the "-target" suffix? Maybe Markus or Marc-André can comment on that.
>>
>> Whenever you use a poisoned macro in a conditional, all the code
>> generated for this .json file (we call it a "QAPI schema module")
>> becomes target-dependent.  The QAPI code generator itself is blissfully
>> unaware of this.
>>
>> Since target-dependent code needs to be compiled differently, the build
>> process needs to be know which modules are target-dependent.  We do this
>> in one of the stupidest ways that could possibly work: a module is
>> target-dependent if its name ends with "-target".  There are just two
>> right now: qapi/machine-target.json and qapi/misc-target.json.
>>
>> The logic resides in qapi/meson.build.  Look for
>>
>>      if module.endswith('-target')
> 
> Thanks for all the pointers.
>>
>> Questions?
> 
> Is it sensible to make the cxl stuff all target dependent and do the following?
> I like that we can get rid of the stubs if we do this but I'm sure there are
> disadvantages. Only alternative I can currently see is continue to have
> stubs and not make the qmp commands conditional on them doing anything useful.

I still don't understand what is the target-dependent part of CXL.

IIUC CXL depends on PCIe which isn't target dependent.

