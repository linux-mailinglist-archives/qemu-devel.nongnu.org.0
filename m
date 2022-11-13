Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E69627256
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:50:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouIzi-0000vn-CX; Sun, 13 Nov 2022 14:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIzf-0000sh-Qt
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:50:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIzd-0002tM-93
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:50:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j15so13917337wrq.3
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VLQEGUEgiAKB4w+uroBdVkc7VehHdvv3j0pS8ngSYgE=;
 b=Hs7lzAZh+wEuMO6ryz4LmkmtS6WOj0ghn3rnr7q1dctVmz3bnARIwqyqm+ytn5Wv/B
 WVAO0By01Q9+5S77B8Ydi1VbK+1pUTSeezBI7fWGgTrOL9zBf6uOqweO6ASch/2xFlvs
 e84tTJIXe8CBf69w4nuCUOxqEzIKkBinlan7G/Kbol8Vk/N72/ksojn5cSUhS8RaXvi7
 mN0XIaeltfcGBhtE++C+Mgi5X0p5EViFk8BLd1wHAW5UAt9/NSw2vEmgSuvPXqZB6mc/
 winwL57ohN3eQz5HUupL98VVBTehcZsZxuofYuoMD4TEcSo634eFKHIWSTboncmvfaqd
 5ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VLQEGUEgiAKB4w+uroBdVkc7VehHdvv3j0pS8ngSYgE=;
 b=xSbJX8KcYU7Cyu9PjduqzqFhtxohrNmuxYDqS185F86mWmAaGkY/KqVvf1PRfpEVsp
 yDK6GNwgX/vOZAz6UqCMWaAV4HeON/ogdWcn/0QPkzj9HR4LR4E1Dy7fv6XYogU6I+CS
 aQhk3Qw08MVCtBDs6YToiGFFPzGjQWQxz6vLu00fLYTznPeqOzaT4svvGJqNqfitY42V
 LrxlMTDjx+dJj093vtwAm4sTV6nKEiHWwhg57MIye8GjeckCx0tET2VeEKj/3ABlZFLh
 az5G71aXTMOX2Pt/KBRbvKXjjqt7ImB6LrhesG9p389lbVH0PUfaeUo2ZExk2ITtXekf
 /gQg==
X-Gm-Message-State: ANoB5pmo+TpasZhdTra4oE9sIeE7cefioONNbesYLePtVpocXKdJarFR
 DU7LworuJUoMCEANUUeQ8g0o4Q==
X-Google-Smtp-Source: AA0mqf5BAVs22iDzwu2qv8lTwyY0qNSMX5QIaf6ZYhedJKB0zBojqUIbtvosxBIkV2mc8UNw2UX1KA==
X-Received: by 2002:adf:f0d2:0:b0:236:8ef4:6eea with SMTP id
 x18-20020adff0d2000000b002368ef46eeamr6065060wro.716.1668369008505; 
 Sun, 13 Nov 2022 11:50:08 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d4527000000b00236545edc91sm7703726wra.76.2022.11.13.11.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:50:08 -0800 (PST)
Message-ID: <3fe1cacc-0cbd-ce4f-772e-3ec350985c85@linaro.org>
Date: Sun, 13 Nov 2022 20:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 14/20] hw/audio: explicitly set .requester_type for
 intel-hda
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-15-alex.bennee@linaro.org>
 <182cca04-5df7-b844-f6d4-049ec3e811fd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <182cca04-5df7-b844-f6d4-049ec3e811fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 12/11/22 06:50, Richard Henderson wrote:
> On 11/12/22 04:25, Alex Bennée wrote:
>> This is simulating a bus master writing data back into system memory.
>> Mark it as such.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   hw/audio/intel-hda.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
>> index f38117057b..95c28b315c 100644
>> --- a/hw/audio/intel-hda.c
>> +++ b/hw/audio/intel-hda.c
>> @@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
>>   static void intel_hda_response(HDACodecDevice *dev, bool solicited, 
>> uint32_t response)
>>   {
>> -    const MemTxAttrs attrs = { .memory = true };
>> +    const MemTxAttrs attrs = { .requester_type = MTRT_PCI, .memory = 
>> true };
> 
> MEMTXATTRS_PCI?

Then removing the 'const' qualifier and setting .memory after.

