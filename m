Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6D68CFDC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 07:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPHsM-0000pk-7r; Tue, 07 Feb 2023 01:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHrj-0000HL-AB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:54:08 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHra-0005JB-S7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 01:54:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a2so12267910wrd.6
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 22:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QVBDqjAv6bn47iC7IXsc60XP4PkllUXL68MsCZdEd90=;
 b=ndCFp6p5IH6Wjc1ubwtKDLBE4bD/u4wvMdrKWl+cH7w+S6Xw95FBy/qv7mmcBkQAwn
 QmSX8J0r4CNfsEJg8vkXTKfOslMIKjLPAJ6EXpYFoYHC6f4wzNyIH2XbjOItV6fSPVIm
 Gd9zsu6NeFj5KFtAmqsMWm6N9ypeoaF5D9VlCwRMb+cikdkduIgVt/Yhz5hkVFGuvyW5
 jS3GZSU8bR80I8F6k//Vk3tRAsxZhhlSfwx+6guVy20LmehihSSXZLInwsYyM5OuU5i+
 7vGqipHP690ewW9rbqQRVDlh8rJ6w6rXCI2bdfhxfPLEYFt1LVrsTODpMv9xTe6MPjj+
 ns7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVBDqjAv6bn47iC7IXsc60XP4PkllUXL68MsCZdEd90=;
 b=r/4w9fwM+rwk6O6+27DofIN3p6rpRIBx8ZmAyFc4v5Gm/427zLgUB0mZHn3pZQUIBc
 0HloTI7Kcus0ZDfzZcFsBImsPeYEz3aHVn5L1HE5iqomi3jMgef8D5u/jC4mADm+FDSN
 WEeAyYODFHpXXThVRuvfww5crwILwOrKL+AIi7za/NEiKldNypd+QRhnAhfnNiIUzdPP
 1raLFn3DSajrfT7DSWGM+mP4mv97j4tYJ/Vx2FtN1yWEdRMo1nEMmkHMU60lK+ChN09u
 0N6saIPxIvNE34wYXDuUjM+3fhtON3A/uwpIOd6OvCQ4VG1Q23ew0RiVr/qZKmKiDtp7
 gNVg==
X-Gm-Message-State: AO0yUKVOMQnSaTou7IFBni2huLSlwhokq33ax9cEQqaaDONtlYFyTkU5
 jqiveWnj3ynNrOWd/PDnFChlxA==
X-Google-Smtp-Source: AK7set8mnNc5FryaDovd201of9vCuILxiZ+cCTXTz4ihOMeyLVBJ5hcVRJ4aZhY9I7I/2jJ/JtF1AQ==
X-Received: by 2002:a5d:6a08:0:b0:2bf:c106:719a with SMTP id
 m8-20020a5d6a08000000b002bfc106719amr1416839wru.65.1675752836874; 
 Mon, 06 Feb 2023 22:53:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o21-20020a5d58d5000000b002c3f0a78e39sm1857061wrf.9.2023.02.06.22.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 22:53:56 -0800 (PST)
Message-ID: <a297fbc8-cc52-1204-0173-54dae2f619ad@linaro.org>
Date: Tue, 7 Feb 2023 07:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
Content-Language: en-US
To: Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com,
 titusr@google.com
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-2-wuhaotsh@google.com>
 <CAFQmdRbnFFOJbJSLS8c2Nv8JMAdS=xnMrHYO2K6cs2iSZyMmBQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFQmdRbnFFOJbJSLS8c2Nv8JMAdS=xnMrHYO2K6cs2iSZyMmBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 7/2/23 00:46, Havard Skinnemoen wrote:
> On Mon, Feb 6, 2023 at 3:34 PM Hao Wu <wuhaotsh@google.com> wrote:
>>
>> Havard is no longer working on the Nuvoton systems for a while
>> and won't be able to do any work on it in the future. So I'll
>> take over maintaining the Nuvoton system from him.
>>
>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> 
> Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
> 
> Just to confirm that I'm no longer on the team that does all the
> exciting qemu work, but I love to see all the great work that the team
> is doing.

Big thank you for your contributions and reviews!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fa10ecaeb9..347936e41c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
>>   F: docs/system/arm/musicpal.rst
>>
>>   Nuvoton NPCM7xx
>> -M: Havard Skinnemoen <hskinnemoen@google.com>
>>   M: Tyrone Ting <kfting@nuvoton.com>
>> +M: Hao Wu <wuhaotsh@google.com>
>>   L: qemu-arm@nongnu.org
>>   S: Supported
>>   F: hw/*/npcm7xx*
>> --
>> 2.39.1.519.gcb327c4b5f-goog
>>
> 


