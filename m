Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3869FAE2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtfa-0005Lw-0L; Wed, 22 Feb 2023 13:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUtfX-0005Lf-9t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:16:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUtfV-0007Nj-Gw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:16:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so4078289wmq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cEbEQAsJpeS1K3BFED1M3rJ0rZv5yY1Z13SXmyHqi+E=;
 b=K9YAb7OU6ketr+1JblAQwmnUEU9u3uUp8GRxJXl45Rr/k1ZhlMyNjCpHmJbDeALR6d
 HpTrZeobAza2QDtDpXpOyAs9OasYLlLhXq35Yxq0+HysvriGMIHWEjpDvcpZvbv8FvUM
 QQrlxtlfCZeS0OQESlsIQQpold16ngt3cl/tW3Gt9KUUA1nF1Mv2YBupkA88oPyANxYh
 8WbnYgpgDPCg5g20vJkWapfyLtyhPG8PrFnhzZjx4JXNiGb3AhehZIE8n92KfqIBTMBK
 KLSTnRTeeAAnOuKrDRgdtLtMNRSL4DCpmRIiv5+8A7RJSlwDbtDlpfZ9xEj0DCWti4h7
 ZS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cEbEQAsJpeS1K3BFED1M3rJ0rZv5yY1Z13SXmyHqi+E=;
 b=wLCxXaPbsnZLaqWlniumSS0sbdU3oo+n7gvL4ZI41uhja+QeXLFzg2C6LujmXdm/5Y
 CouHFqtAULyCbRH7F7VfdIcWrd2/VhRcXOnxvdXvo/vUXiYqCFmu7EQ91vSOK4iD5ZRJ
 Px/01KfgIXn6oI+nXQqni/XO+3N1dADWIBj3FBN8LZMnsw9grXxvNRu/Pf7+SZgNls+M
 NEITLZnZg92rYofsfo5KWIMKCrVM3MSvwCaSD+pS5fIQbkA9TCaEq08s953WRud/uUMb
 DI+tFxhbSrDE0O5v8Dhso/SiMrhbWwKaowejiA+oHea40wJ4xcUOhOHxZ8iph90aY81p
 JhrA==
X-Gm-Message-State: AO0yUKXVoguzwGamGLYF3miQ0S8GFqfZQowg7kMpiEVCMGVWWpOFMsZ6
 xSeRkPWY0hqJJr2xz2BL1W44jA==
X-Google-Smtp-Source: AK7set+F7RTVDbHqBYVShgsyPL/EwtVry1+BZqCxLwsSFPkeWx+8v3sMTg865mh/N/tJMCdYIafadw==
X-Received: by 2002:a05:600c:181b:b0:3e2:2504:50e3 with SMTP id
 n27-20020a05600c181b00b003e2250450e3mr6245331wmp.25.1677089799452; 
 Wed, 22 Feb 2023 10:16:39 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a05600c224500b003dc1a525f22sm5932253wmm.25.2023.02.22.10.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:16:38 -0800 (PST)
Message-ID: <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
Date: Wed, 22 Feb 2023 19:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>,
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
 <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
 <20230222164947.0000554f@Huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222164947.0000554f@Huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

+Thomas (meson) & Marc-André (conditional QAPI)

On 22/2/23 17:49, Jonathan Cameron wrote:
>>>>> +# Type of uncorrectable CXL error to inject. These errors are reported via
>>>>> +# an AER uncorrectable internal error with additional information logged at
>>>>> +# the CXL device.
>>>>> +#
>>>>> +# @cache-data-parity: Data error such as data parity or data ECC error CXL.cache
>>>>> +# @cache-address-parity: Address parity or other errors associated with the
>>>>> +#                        address field on CXL.cache
>>>>> +# @cache-be-parity: Byte enable parity or other byte enable errors on CXL.cache
>>>>> +# @cache-data-ecc: ECC error on CXL.cache
>>>>> +# @mem-data-parity: Data error such as data parity or data ECC error on CXL.mem
>>>>> +# @mem-address-parity: Address parity or other errors associated with the
>>>>> +#                      address field on CXL.mem
>>>>> +# @mem-be-parity: Byte enable parity or other byte enable errors on CXL.mem.
>>>>> +# @mem-data-ecc: Data ECC error on CXL.mem.
>>>>> +# @reinit-threshold: REINIT threshold hit.
>>>>> +# @rsvd-encoding: Received unrecognized encoding.
>>>>> +# @poison-received: Received poison from the peer.
>>>>> +# @receiver-overflow: Buffer overflows (first 3 bits of header log indicate which)
>>>>> +# @internal: Component specific error
>>>>> +# @cxl-ide-tx: Integrity and data encryption tx error.
>>>>> +# @cxl-ide-rx: Integrity and data encryption rx error.
>>>>> +##
>>>>> +
>>>>> +{ 'enum': 'CxlUncorErrorType',
>>>>
>>>> Doesn't these need
>>>>
>>>>         'if': 'CONFIG_CXL_MEM_DEVICE',
>>>>
>>>> ?
>>>
>>> If I make this change I get a bunch of
>>>
>>> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG_CXL_MEM_DEVICE"
>>>      18 | #if defined(CONFIG_CXL_MEM_DEVICE)
>>
>> Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.
>>
>>> It's a target specific define (I think) as built alongside PCI_EXPRESS
>>> Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)
>>>
>>> To be honest though I don't fully understand the QEMU build system so the reason
>>> for the error might be wrong.
>>
>> You need to restrict to system emulation (the 'have_system' check):
> 
> This doesn't help - still have
> attempt to used poisoned "CONFIG_CXL"
> 
> 
>>
>> -- >8 --
>> diff --git a/qapi/meson.build b/qapi/meson.build
>> index fbdb442fdf..643c76d61c 100644
>> --- a/qapi/meson.build
>> +++ b/qapi/meson.build
>> @@ -31,6 +31,7 @@ qapi_all_modules = [
>>      'compat',
>>      'control',
>>      'crypto',
>> -  'cxl',
>>      'dump',
>>      'error',
>>      'introspect',
>> @@ -58,6 +59,7 @@ if have_system
>>        'audio',
>>        'qdev',
>>        'pci',
>> +    'cxl',
>>        'rdma',
>>        'rocker',
>>        'tpm',
>> ---
>>
> 


