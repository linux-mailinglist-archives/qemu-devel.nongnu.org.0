Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0536A05A8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8Xg-0001H5-0C; Thu, 23 Feb 2023 05:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV8Xe-0001Gx-Nf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:09:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV8Xd-0005An-5O
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:09:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l25so9825040wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DpLcyENH8qSvWqThB2jPEF8EVuewODVzdK3PNnmdvHQ=;
 b=PRzhmTs1z0+quR1cPlapFP6IyoRjZEjftRzn8nSQjDYrmP42yYYOPl8i5W1GqSRRh+
 ftEwroX4vO3Jy+CmP9wZoUq7mbHBmKgAudJ6NiQ8bP12+M+CKaXuqysvUoWFHk/4vWrY
 KQYZtBkAsW13CScy+Mv/wkB1i5KUiTkW0YthmeZe+fwYLywN7lQNNbzb8DFwNznrH2Rp
 f+xYIRtot6clUOxNZ0xDTkuw2NWKAK1Tk5c2rIvHCOxXvkwdyutZp9Oz/ThW60OuspaI
 6B+kp6F8/WaNrDqgMQKY/AO2mKBcvIjD0NdNggEbXs8v4BN1WkaySDCImhR9JAVHTYh1
 UvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DpLcyENH8qSvWqThB2jPEF8EVuewODVzdK3PNnmdvHQ=;
 b=GbNP7i5Ol0JLPN7hjUpFiwgicr++I5o7hZw/1TAQpCxNDliDejaJjK1BoMn9cSxK46
 wAJqZwq00ry0CU9ZGzawNXcDSeSyIywBWp5D7D8iyEnimZfqfEwJVeXbkszW7HFGkDFK
 SdVi/6uyW5y+n7UF87uV98FfNbVHiblkMS86sRrY9WYXrCourveN6hvLM5ba6a/8J6Sm
 qP7VvUvpZETeChcbwnAznrdVVyTEJGndxtx72t59R7fEjsczG6FFOqsZ3kV/YquvX41O
 XErrk2Bj2pEXC78+TuiDQhI86g5W3LSbe+ZPDZt/VC1uz7X7/RxYrGPrQ5I4Oo+Jy9xp
 39qQ==
X-Gm-Message-State: AO0yUKXBm2i9zEkYppUYbx591u5sKjx0v/YHMEFbLaWZ3gwN3pQitRLt
 pfbiIf3oPzX5pozaEyG407ZArw==
X-Google-Smtp-Source: AK7set/mKA80Kb/iPaLm/J3W+NVKRUyrjSlR/H7y5tPR9I/m0nqI9wcOnw+4sZm62TqCAXjJmWVDnA==
X-Received: by 2002:a5d:440f:0:b0:2c7:e4a:8189 with SMTP id
 z15-20020a5d440f000000b002c70e4a8189mr2704536wrq.10.1677146971365; 
 Thu, 23 Feb 2023 02:09:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c3b9e00b003e206cc7237sm12192315wms.24.2023.02.23.02.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:09:30 -0800 (PST)
Message-ID: <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
Date: Thu, 23 Feb 2023 11:09:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
 <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Anton Johansson <anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 17/12/22 00:58, Richard Henderson wrote:
> On 12/16/22 13:55, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   dump/dump.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/dump/dump.c b/dump/dump.c
>> index 279b07f09b..c62dc94213 100644
>> --- a/dump/dump.c
>> +++ b/dump/dump.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/main-loop.h"
>>   #include "hw/misc/vmcoreinfo.h"
>>   #include "migration/blocker.h"
>> +#include "cpu.h"
> 
> Does it work to include "exec/cpu-all.h" instead?

We get:

include/exec/cpu-all.h:110:5: warning: 'TARGET_LONG_SIZE' is not 
defined, evaluates to 0 [-Wundef]
#if TARGET_LONG_SIZE == 4
     ^

TARGET_LONG_SIZE is defined in "exec/cpu-defs.h" which is
target specific. If I add "exec/cpu-defs.h" to "exec/cpu-all.h"
I get:

In file included from ../../dump/dump.c:18:
include/exec/cpu-all.h:439:8: error: incomplete definition of type 
'struct ArchCPU'
     cpu->parent_obj.env_ptr = &cpu->env;
     ~~~^

Is it worth extracting the few tswapX() declarations to "exec/tswap.h"?

