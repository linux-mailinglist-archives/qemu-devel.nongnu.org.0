Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C86900B5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ13n-0006l7-6r; Thu, 09 Feb 2023 02:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ13k-0006kV-BQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:09:32 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ13i-0006rB-EI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:09:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so3164471wmb.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HhxI/DG5vxRva6yGLFc4SZcMOYY1hk+f3b5QDolobE0=;
 b=RTDctZZYgMyb1ERGPBSb6erS8IvPESifn1bG1egqXg41nG9J+BkXb5aA4TwtGNF5Qs
 VdMZqNIDtI7iBfsJQh4DPQUoNOoBuXetZAbNPi2PmmFb3TrdkUQ/bV38u9eqjxnteDTj
 jAhEeHpi3PWZ/zv8ZPcDR4yA1HJ5JMZvfQsBbjUvK2wOpo7WEMn7mMLI84dIrtn6FDIW
 yhUg5sd4S8Z16hlwMk+s/SC8jRJzYTeTMtHLg6ezeH4ejrRuTsjEd7vR1us5NQ89fZ60
 LPv/NCD+CJFha3Pab077OCMNetGYc00U6w6ELeQWk+D2nMQz8sjliyL2c1QR1nNK/RKP
 388g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HhxI/DG5vxRva6yGLFc4SZcMOYY1hk+f3b5QDolobE0=;
 b=PEIXIDbI4rnwQ7msNnuoYtaqtE53uUIsXKyToLY1sPn9bxfSrLym9kJz8MH407P4CC
 7LCCPoo4jU2TO0f8cWwf+lX7v4ocmR0OrCZfiYYDsxt176hwamgP2veG57KwUIlqILBA
 iv9bcBYH6RIbJ69q4a+Ts1ACQnas+nPJUzcFiRgNuh+7NeXZX/yabdbCIisdoDB2WtYG
 k+c/bCNsSOLU5ceQPtf2cVaXDHG187ziPVTJkRrNcm09qgzpzsdygxINZ5C+CXK6tHGK
 blc1Hh+QBph/t8ldWxvOTVySqsLsd8JNKa3en/1mtcbhoTjySW3Hs0Hyxz6LEyKjDo8+
 LfeQ==
X-Gm-Message-State: AO0yUKUZN4bJ2w9JxpoZjaZza/Ty4V0JhIumPVHnIMWRE58VbUGo6Oa1
 S1m4ddIKBrijVih2ad4nyjno3Q==
X-Google-Smtp-Source: AK7set+QfPv9BNaOa9pI0JBosZB72rKSPrRp0dCzU6FP5U6EewVurNoZmwtVyqFOwbwGPe0LOUfzeQ==
X-Received: by 2002:a05:600c:1d17:b0:3df:efdc:6505 with SMTP id
 l23-20020a05600c1d1700b003dfefdc6505mr4977081wms.0.1675926567534; 
 Wed, 08 Feb 2023 23:09:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003dc34edacf8sm4486706wmq.31.2023.02.08.23.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:09:26 -0800 (PST)
Message-ID: <d6c35d9e-9a6c-4715-6532-4241e3d86a65@linaro.org>
Date: Thu, 9 Feb 2023 08:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PULL 00/11] Misc patches for 2022-02-08
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230208171922.95048-1-pbonzini@redhat.com>
 <95cab180-a34b-858d-e360-5083a7d7ecf8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <95cab180-a34b-858d-e360-5083a7d7ecf8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 9/2/23 06:19, Thomas Huth wrote:
> On 08/02/2023 18.19, Paolo Bonzini wrote:
>> The following changes since commit 
>> ae2b5d8381a73b27f35f19c988d45c78bb4d5768:
>>
>>    Merge tag 'pull-include-2023-02-06-v2' of 
>> https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to e0de04cf9bd7cf03db16f33276679caf1724b75c:
>>
>>    target/i386: fix ADOX followed by ADCX (2023-02-08 18:16:55 +0100)
>>
>> ----------------------------------------------------------------
>> * block/iscsi: fix double-free on BUSY or similar statuses
>> * catch [accel] entry without accelerator
>> * target/i386: various fixes for BMI and ADX instructions
>> * make the contents of meson-buildoptions.sh stable
>>
>> ----------------------------------------------------------------
>> Paolo Bonzini (8):
>>        build: make meson-buildoptions.sh stable
>>        remove unnecessary extern "C" blocks
>>        block/iscsi: fix double-free on BUSY or similar statuses
>>        vl: catch [accel] entry without accelerator
> 
> You missed Philippe's review comment for that patch:
> 
> https://lore.kernel.org/qemu-devel/8ec3abf5-f4aa-db40-cb7e-2f5733d93de3@linaro.org/

I interpreted "no response" as "the result is the same".

