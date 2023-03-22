Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979146C5AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf79b-0007U9-Ih; Wed, 22 Mar 2023 18:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pf79Z-0007TY-Jo
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:41:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pf79X-0008WK-V7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:41:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ek18so79225525edb.6
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679524914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6iq4S5iXYub51RsVGFlQQjKHoOGisrif8dJnBWKYRfE=;
 b=DJl8R3+ANz+riolTL6qtnTC/ulaLf7sLovhkozXXfGoTDK7MJtnWFxS69RYSBiLePs
 43WX/vBjC1aFwd/E3otoLzL/tUI+uMGrDm71nwERJIk4Oj3lhalQzI5NuxUt5P4A+7Gy
 M/33pD/mli/0oVJAiU2lagFz0V0IRosW1BofzspXnaM//9zbx0zHCNNfnbMl+yU/3HDQ
 QFRR/dmxbIzsGMVMmNMxd8E+BbStnWmLaMANykKRsoTJVe3diA0fqf8+kAbnPGkDwByE
 3Ldi8m6RF9axuh0/f20jZ8sQcce8jy5cRR/pOlVNBgGFGfaMxGTA1WSqgevf4o0hBAaa
 WmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6iq4S5iXYub51RsVGFlQQjKHoOGisrif8dJnBWKYRfE=;
 b=BA+Tz0c/bCXXxIocsPkviICDtRei1Fn6hUC0HxIcUMiuJ4Dxr3aiJI8U8GQXpARZ29
 lsNBO3TZGJ+fVpyu8Zm/bMGXtUyOB/B7NXORMcOv7oFiU+5td/VNdFN0FiEjt4vCSbY1
 S2/gVS/se3vducr96XlAjy7lhir8eG3XwQsH+naxt/Y87CrEPeIchRzsS2tpkUAmQXFa
 Dqg9ip9taJIcyB4yZXBF+TPpa3V7NPEeb3ya5vl9svVTyUTYbeuoAWaD8FWNglOrj1sY
 mnVRhVvq3EUefsF8FCwetUPbi8z6y/O3LIoB3m15WC94vMo0gnBwCXyy19y/WrBfBt6a
 qNjw==
X-Gm-Message-State: AO0yUKXYE7b9SvCUgX9EHEBpIzvZpxYDaEOrN19hvGWj6qqzcGptmQN7
 5e/9j8zEJgagLC7hGfOFdkPaW/u79A1UQE0s6dvksg==
X-Google-Smtp-Source: AKy350bVJGEO74kIHQPR4D8KweJQLI0I2K6MdJSv/KSBBpcXrhTU7AMITy/ojY6KAzfQqtcbk7agkw==
X-Received: by 2002:a5d:4bd0:0:b0:2c7:cbea:1140 with SMTP id
 l16-20020a5d4bd0000000b002c7cbea1140mr732471wrt.71.1679521236518; 
 Wed, 22 Mar 2023 14:40:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.141.240])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600001ce00b002da76acfee1sm2341196wrx.28.2023.03.22.14.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 14:40:36 -0700 (PDT)
Message-ID: <434091cb-08d7-15f5-e4ff-5fa867abd3e8@linaro.org>
Date: Wed, 22 Mar 2023 22:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v2] hw/i2c: Enable an id for the pca954x devices
Content-Language: en-US
To: cminyard@mvista.com, Patrick Venture <venture@google.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
References: <20230322172136.48010-1-venture@google.com>
 <ZBtwxzc7xpazByqK@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBtwxzc7xpazByqK@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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

On 22/3/23 22:19, Corey Minyard wrote:
> On Wed, Mar 22, 2023 at 10:21:36AM -0700, Patrick Venture wrote:
>> This allows the devices to be more readily found and specified.
>> Without setting the name field, they can only be found by device type
>> name, which doesn't let you specify the second of the same device type
>> behind a bus.
>>
>> Tested: Verified that by default the device was findable with the name
>> 'pca954x[77]', for an instance attached at that address.
> 
> This looks good to me.
> 
> Acked-by: Corey Minyard <cminyard@mvista.com>
> 
> if you are taking this in through another tree.  Or do you want me to
> take this?

Since I have to send a MIPS PR, I'll take this one;
to alleviate you and the CI minutes.

